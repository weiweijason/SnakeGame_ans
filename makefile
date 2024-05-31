# Makefile

# 編譯器和選項
CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -g -I/opt/homebrew/Cellar/sfml/2.6.1/include
LDFLAGS = -L/opt/homebrew/Cellar/sfml/2.6.1/lib

LIBS = -lsfml-graphics -lsfml-window -lsfml-system

# 項目源文件
SRCS = src/main.cpp src/Game.cpp src/Snake.cpp src/Fruit.cpp src/ScoreBoard.cpp
HDRS = include/Game.h include/Snake.h include/Fruit.h include/ScoreBoard.h

# 可執行文件
TARGET = build/SnakeGame

# 預設目標
all: $(TARGET)

# 創建目標目錄
$(TARGET_DIR):
	mkdir -p build

# 複製資源文件到構建目錄
copy-resources: $(TARGET_DIR)
	cp -r assets build/

# 創建可執行文件的規則
$(TARGET): $(SRCS) $(HDRS) | copy-resources
	$(CXX) $(CXXFLAGS) $(SRCS) -o $(TARGET) $(LDFLAGS) $(LIBS)

# 運行程序
run: $(TARGET)
	cd build && ./SnakeGame

# 清理生成的文件
clean:
	rm -rf build

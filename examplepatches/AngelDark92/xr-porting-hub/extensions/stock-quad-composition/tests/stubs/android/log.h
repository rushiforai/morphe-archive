#pragma once
constexpr int ANDROID_LOG_INFO = 4;
int __android_log_write(int priority, const char* tag, const char* text);

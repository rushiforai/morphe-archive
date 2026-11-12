#pragma once
#include <jni.h>
#include <android/native_window.h>
ANativeWindow* ANativeWindow_fromSurface(JNIEnv*, jobject);

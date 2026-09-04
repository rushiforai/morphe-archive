#pragma once

// Host-only Android JNI ABI substitute. Never included by the shipping target.
using jint = int;
using jobject = void*;
constexpr jint JNI_OK = 0;
constexpr jint JNI_EDETACHED = -2;
constexpr jint JNI_VERSION_1_6 = 0x00010006;
struct JNIEnv {
    void DeleteLocalRef(jobject) {}
};
struct JavaVM {
    JNIEnv environment;
    jint GetEnv(void** output, jint) { *output = &environment; return JNI_OK; }
    jint AttachCurrentThread(JNIEnv** output, void*) { *output = &environment; return JNI_OK; }
    jint DetachCurrentThread() { return JNI_OK; }
};

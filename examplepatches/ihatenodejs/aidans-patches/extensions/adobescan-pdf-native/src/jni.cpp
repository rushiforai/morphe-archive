#include "pdf_engine.hpp"

#include <android/bitmap.h>
#include <cstring>
#include <jni.h>
#include <memory>
#include <string>
#include <sys/mman.h>
#include <sys/stat.h>
#include <tesseract/baseapi.h>
#include <vector>
extern "C" {

JNIEXPORT void JNICALL Java_app_aidan_extension_adobescan_NativePdfEngine_transform(
    JNIEnv *env, jclass /*clazz*/, jint inputFd, jint outputFd, jint operation,
    jint compressionLevel, jbyteArray passwordUtf8, jobject callbacks) {
    std::string password;
    if (passwordUtf8 != nullptr) {
        jsize len = env->GetArrayLength(passwordUtf8);
        if (len > 0) {
            jbyte *bytes = env->GetByteArrayElements(passwordUtf8, nullptr);
            if (bytes == nullptr || env->ExceptionCheck()) {
                return;
            }
            try {
                password.assign(reinterpret_cast<const char *>(bytes), static_cast<size_t>(len));
            } catch (const std::exception &) {
                std::memset(bytes, 0, static_cast<size_t>(len));
                env->ReleaseByteArrayElements(passwordUtf8, bytes, JNI_ABORT);
                return;
            }
            std::memset(bytes, 0, static_cast<size_t>(len));
            env->ReleaseByteArrayElements(passwordUtf8, bytes, JNI_ABORT);
        }
    }

    struct PasswordWiper {
        std::string &pw;
        ~PasswordWiper() {
            if (!pw.empty()) {
                volatile char *p = const_cast<volatile char *>(pw.data());
                for (size_t i = 0; i < pw.size(); ++i) {
                    p[i] = 0;
                }
                pw.clear();
            }
        }
    } wiper{password};

    jclass cbClass = nullptr;
    jmethodID onProgressMid = nullptr;
    jmethodID onCompleteMid = nullptr;

    if (callbacks != nullptr) {
        cbClass = env->GetObjectClass(callbacks);
        if (cbClass != nullptr) {
            onProgressMid = env->GetMethodID(cbClass, "onProgress", "(I)V");
            onCompleteMid = env->GetMethodID(cbClass, "onComplete", "(IIJZ)V");
        }
    }

    auto progressFn = [&](int percent) {
        if (callbacks != nullptr && onProgressMid != nullptr) {
            env->CallVoidMethod(callbacks, onProgressMid, static_cast<jint>(percent));
            if (env->ExceptionCheck()) {
                env->ExceptionClear();
            }
        }
    };

    aidanscanpdf::TransformResult result;
    try {
        aidanscanpdf::transform(inputFd, outputFd, operation, compressionLevel, password,
                                progressFn, result);
    } catch (...) {
        result.status = aidanscanpdf::ENGINE_FAILURE;
        result.pageCount = 0;
        result.outputBytes = 0;
        result.encrypted = false;
    }

    if (callbacks != nullptr && onCompleteMid != nullptr) {
        env->CallVoidMethod(callbacks, onCompleteMid, static_cast<jint>(result.status),
                            static_cast<jint>(result.pageCount),
                            static_cast<jlong>(result.outputBytes),
                            static_cast<jboolean>(result.encrypted));
        if (env->ExceptionCheck()) {
            env->ExceptionClear();
        }
    }
}

JNIEXPORT void JNICALL Java_app_aidan_extension_adobescan_NativePdfEngine_combine(
    JNIEnv *env, jclass /*clazz*/, jintArray inputFdsArray, jobjectArray passwordsArray,
    jint outputFd, jobject callbacks) {

    if (inputFdsArray == nullptr)
        return;
    jsize count = env->GetArrayLength(inputFdsArray);
    if (count < 2)
        return;

    jint *fds = env->GetIntArrayElements(inputFdsArray, nullptr);
    if (fds == nullptr)
        return;

    std::vector<std::string> passwords;
    if (passwordsArray != nullptr) {
        jsize pwCount = env->GetArrayLength(passwordsArray);
        passwords.reserve(static_cast<size_t>(pwCount));
        for (jsize i = 0; i < pwCount; ++i) {
            auto jb = static_cast<jbyteArray>(env->GetObjectArrayElement(passwordsArray, i));
            if (jb != nullptr) {
                jsize n = env->GetArrayLength(jb);
                if (n > 0) {
                    jbyte *bytes = env->GetByteArrayElements(jb, nullptr);
                    if (bytes != nullptr && !env->ExceptionCheck()) {
                        passwords.emplace_back(reinterpret_cast<const char *>(bytes),
                                               static_cast<size_t>(n));
                        std::memset(bytes, 0, static_cast<size_t>(n));
                        env->ReleaseByteArrayElements(jb, bytes, JNI_ABORT);
                    } else {
                        passwords.emplace_back("");
                    }
                } else {
                    passwords.emplace_back("");
                }
                env->DeleteLocalRef(jb);
            } else {
                passwords.emplace_back("");
            }
        }
    }

    struct PasswordsWiper {
        std::vector<std::string> &pws;
        ~PasswordsWiper() {
            for (auto &pw : pws) {
                if (!pw.empty()) {
                    volatile char *p = const_cast<volatile char *>(pw.data());
                    for (size_t i = 0; i < pw.size(); ++i) {
                        p[i] = 0;
                    }
                    pw.clear();
                }
            }
        }
    } pwsWiper{passwords};

    jclass cbClass = nullptr;
    jmethodID onProgressMid = nullptr;
    jmethodID onCompleteMid = nullptr;

    if (callbacks != nullptr) {
        cbClass = env->GetObjectClass(callbacks);
        if (cbClass != nullptr) {
            onProgressMid = env->GetMethodID(cbClass, "onProgress", "(I)V");
            onCompleteMid = env->GetMethodID(cbClass, "onComplete", "(IIJZ)V");
        }
    }

    auto progressFn = [&](int percent) {
        if (callbacks != nullptr && onProgressMid != nullptr) {
            env->CallVoidMethod(callbacks, onProgressMid, static_cast<jint>(percent));
            if (env->ExceptionCheck()) {
                env->ExceptionClear();
            }
        }
    };

    aidanscanpdf::TransformResult result;
    try {
        aidanscanpdf::combine(reinterpret_cast<const int *>(fds), static_cast<size_t>(count),
                              passwords, outputFd, progressFn, result);
    } catch (...) {
        result.status = aidanscanpdf::ENGINE_FAILURE;
        result.pageCount = 0;
        result.outputBytes = 0;
        result.encrypted = false;
    }

    for (auto &pw : passwords) {
        if (!pw.empty()) {
            std::fill(pw.begin(), pw.end(), '\0');
        }
    }

    env->ReleaseIntArrayElements(inputFdsArray, fds, JNI_ABORT);

    if (callbacks != nullptr && onCompleteMid != nullptr) {
        env->CallVoidMethod(callbacks, onCompleteMid, static_cast<jint>(result.status),
                            static_cast<jint>(result.pageCount),
                            static_cast<jlong>(result.outputBytes),
                            static_cast<jboolean>(result.encrypted));
        if (env->ExceptionCheck()) {
            env->ExceptionClear();
        }
    }
}

JNIEXPORT jobjectArray JNICALL Java_app_aidan_extension_adobescan_NativePdfEngine_recognize(
    JNIEnv *env, jclass /*clazz*/, jobject bitmapObj, jint modelFd) {

    if (bitmapObj == nullptr || modelFd < 0)
        return nullptr;

    AndroidBitmapInfo info;
    if (AndroidBitmap_getInfo(env, bitmapObj, &info) < 0)
        return nullptr;
    if (info.format != ANDROID_BITMAP_FORMAT_RGBA_8888 || info.width <= 0 || info.height <= 0)
        return nullptr;

    void *pixels = nullptr;
    if (AndroidBitmap_lockPixels(env, bitmapObj, &pixels) < 0 || pixels == nullptr)
        return nullptr;

    struct ScopedUnlock {
        JNIEnv *e;
        jobject b;
        ~ScopedUnlock() { AndroidBitmap_unlockPixels(e, b); }
    } unlocker{env, bitmapObj};

    static thread_local std::unique_ptr<tesseract::TessBaseAPI> sApi;
    static thread_local void *sModelMap = nullptr;
    static thread_local size_t sModelSize = 0;
    static thread_local ino_t sModelIno = 0;
    static thread_local dev_t sModelDev = 0;

    struct stat st;
    if (fstat(modelFd, &st) != 0 || st.st_size <= 0)
        return nullptr;

    if (sApi == nullptr || sModelDev != st.st_dev || sModelIno != st.st_ino ||
        sModelSize != static_cast<size_t>(st.st_size)) {
        sApi.reset();
        if (sModelMap != nullptr && sModelSize > 0) {
            munmap(sModelMap, sModelSize);
            sModelMap = nullptr;
        }
        sModelSize = static_cast<size_t>(st.st_size);
        sModelMap = mmap(nullptr, sModelSize, PROT_READ, MAP_PRIVATE, modelFd, 0);
        if (sModelMap == MAP_FAILED || sModelMap == nullptr) {
            sModelMap = nullptr;
            sModelSize = 0;
            return nullptr;
        }
        sModelDev = st.st_dev;
        sModelIno = st.st_ino;

        sApi = std::make_unique<tesseract::TessBaseAPI>();
        if (sApi->Init(static_cast<const char *>(sModelMap), static_cast<int>(sModelSize), "eng",
                       tesseract::OEM_LSTM_ONLY, nullptr, 0, nullptr, nullptr, false,
                       nullptr) != 0) {
            sApi.reset();
            if (sModelMap != nullptr && sModelSize > 0) {
                munmap(sModelMap, sModelSize);
                sModelMap = nullptr;
                sModelSize = 0;
            }
            return nullptr;
        }
        sApi->SetPageSegMode(tesseract::PSM_AUTO);
    }

    sApi->SetImage(static_cast<const unsigned char *>(pixels), info.width, info.height, 4,
                   info.stride);
    if (sApi->Recognize(nullptr) != 0) {
        sApi->Clear();
        return nullptr;
    }

    tesseract::ResultIterator *ri = sApi->GetIterator();
    if (ri == nullptr) {
        sApi->Clear();
        return nullptr;
    }

    struct WordBox {
        std::string text;
        float left, top, right, bottom;
    };
    std::vector<WordBox> words;
    const tesseract::PageIteratorLevel level = tesseract::RIL_WORD;
    do {
        char *wordText = ri->GetUTF8Text(level);
        if (wordText != nullptr) {
            int left = 0, top = 0, right = 0, bottom = 0;
            ri->BoundingBox(level, &left, &top, &right, &bottom);
            float invW = 1.0f / static_cast<float>(info.width);
            float invH = 1.0f / static_cast<float>(info.height);
            words.push_back({std::string(wordText), static_cast<float>(left) * invW,
                             static_cast<float>(top) * invH, static_cast<float>(right) * invW,
                             static_cast<float>(bottom) * invH});
            delete[] wordText;
        }
    } while (ri->Next(level));
    delete ri;
    sApi->Clear();

    jclass wordClass = env->FindClass("app/aidan/extension/adobescan/PdfPageLayout$Word");
    if (wordClass == nullptr)
        return nullptr;
    jmethodID wordCtor = env->GetMethodID(wordClass, "<init>", "(Ljava/lang/String;FFFF)V");
    if (wordCtor == nullptr)
        return nullptr;

    jobjectArray arr = env->NewObjectArray(static_cast<jsize>(words.size()), wordClass, nullptr);
    if (arr == nullptr)
        return nullptr;

    for (size_t i = 0; i < words.size(); ++i) {
        jstring textStr = env->NewStringUTF(words[i].text.c_str());
        if (textStr == nullptr || env->ExceptionCheck())
            return nullptr;
        jobject wordObj = env->NewObject(wordClass, wordCtor, textStr, words[i].left, words[i].top,
                                         words[i].right, words[i].bottom);
        if (wordObj == nullptr || env->ExceptionCheck()) {
            env->DeleteLocalRef(textStr);
            return nullptr;
        }
        env->SetObjectArrayElement(arr, static_cast<jsize>(i), wordObj);
        env->DeleteLocalRef(textStr);
        env->DeleteLocalRef(wordObj);
    }
    return arr;
}

} // extern "C"

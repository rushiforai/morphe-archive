#include <jni.h>
#include <whisper.h>
#include <ggml-backend.h>
#include <algorithm>
#include <atomic>
#include <cstdint>
#include <cstring>
#include <memory>
#include <new>
#include <stdexcept>
#include <string>
#include <utility>

#if EBPATCHER_VULKAN
#define JNI_METHOD(name) Java_io_github_emotionbug_summaryengine_WhisperAsr_00024Vulkan_##name
#else
#define JNI_METHOD(name) Java_io_github_emotionbug_summaryengine_WhisperAsr_00024Cpu_##name
#endif

namespace {
struct Asr {
    explicit Asr(std::string file) : model(std::move(file)) {}
    ~Asr() { if (context) whisper_free(context); }
    std::string model;
    whisper_context * context = nullptr;
    std::atomic<bool> stopped{false};
    bool gpu_initialized = false;
};

bool aborted(void * data) { return static_cast<Asr *>(data)->stopped.load(std::memory_order_relaxed); }
bool encoder_begin(whisper_context *, whisper_state *, void * data) { return !aborted(data); }
thread_local Asr * initializing = nullptr;
void private_log(ggml_log_level, const char * message, void *) {
    // These exact pinned-upstream events distinguish an initialized GPU from its silent CPU fallback.
    // No upstream text (which may contain tokens or paths) is ever forwarded to Android logs.
    if (initializing && message) {
        if (std::strncmp(message, "whisper_backend_init_gpu: using ",
                sizeof("whisper_backend_init_gpu: using ") - 1) == 0)
            initializing->gpu_initialized = true;
        if (std::strncmp(message, "whisper_backend_init_gpu: failed to initialize ",
                sizeof("whisper_backend_init_gpu: failed to initialize ") - 1) == 0)
            initializing->gpu_initialized = false;
    }
}
void fail(JNIEnv * env, const char * type, const char * message) {
    jclass klass = env->FindClass(type);
    if (klass) { env->ThrowNew(klass, message); env->DeleteLocalRef(klass); }
}
Asr * asr(jlong handle) { return reinterpret_cast<Asr *>(static_cast<intptr_t>(handle)); }
void append_u32(std::string & output, uint32_t value) {
    for (int shift = 24; shift >= 0; shift -= 8) output.push_back(static_cast<char>(value >> shift));
}
void append_u64(std::string & output, uint64_t value) {
    for (int shift = 56; shift >= 0; shift -= 8) output.push_back(static_cast<char>(value >> shift));
}
}

extern "C" JNIEXPORT jlong JNICALL
JNI_METHOD(create)(JNIEnv * env, jclass, jstring path) {
    const char * utf = env->GetStringUTFChars(path, nullptr);
    if (!utf) return 0;
    std::unique_ptr<Asr> result;
    try { result.reset(new Asr(utf)); }
    catch (const std::bad_alloc &) { fail(env, "java/lang/OutOfMemoryError", "Could not allocate Whisper context"); }
    env->ReleaseStringUTFChars(path, utf);
    return static_cast<jlong>(reinterpret_cast<intptr_t>(result.release()));
}

extern "C" JNIEXPORT jboolean JNICALL
JNI_METHOD(initialize)(JNIEnv * env, jclass, jlong handle) {
    Asr * state = asr(handle);
    if (!state) {
        fail(env, "java/io/IOException", "Missing Whisper context");
        return false;
    }
    if (aborted(state)) {
        fail(env, "java/util/concurrent/CancellationException", "Whisper transcription was cancelled");
        return false;
    }
    if (state->context) return true;
    initializing = state;
    try {
        whisper_log_set(private_log, nullptr);
        ggml_log_set(private_log, nullptr);
#if EBPATCHER_VULKAN
        bool available = false;
        const size_t devices = ggml_backend_dev_count();
        for (size_t i = 0; i < devices; ++i) {
            const auto type = ggml_backend_dev_type(ggml_backend_dev_get(i));
            if (type == GGML_BACKEND_DEVICE_TYPE_GPU || type == GGML_BACKEND_DEVICE_TYPE_IGPU) {
                available = true;
                break;
            }
        }
        if (!available) {
            initializing = nullptr;
            return false;
        }
#endif
        whisper_context_params config = whisper_context_default_params();
        config.use_gpu = EBPATCHER_VULKAN;
        config.flash_attn = true;
        state->context = whisper_init_from_file_with_params(state->model.c_str(), config);
        initializing = nullptr;
        if (aborted(state)) {
            fail(env, "java/util/concurrent/CancellationException", "Whisper transcription was cancelled");
            return false;
        }
        if (!state->context || !whisper_is_multilingual(state->context)) return false;
        return !EBPATCHER_VULKAN || state->gpu_initialized;
    } catch (const std::bad_alloc &) {
        fail(env, "java/lang/OutOfMemoryError", "Whisper initialization ran out of memory");
    } catch (const std::exception &) {
        // Upstream state construction is not exception-safe. Do not retry an escaped exception
        // with another model allocation; only its explicit null/no-GPU paths permit fallback.
        fail(env, "java/io/IOException", "Whisper initialization failed; no inference was attempted");
    } catch (...) {
        fail(env, "java/io/IOException", "Unexpected Whisper initialization failure");
    }
    initializing = nullptr;
    return false;
}

extern "C" JNIEXPORT jbyteArray JNICALL
JNI_METHOD(transcribe)(
        JNIEnv * env, jclass, jlong handle, jobject buffer, jint count) {
    Asr * state = asr(handle);
    try {
        auto * samples = static_cast<const float *>(env->GetDirectBufferAddress(buffer));
        if (!state || !samples || count <= 0 || count > 16000 * 30
                || env->GetDirectBufferCapacity(buffer) < static_cast<jlong>(count) * sizeof(float))
            throw std::runtime_error("invalid PCM");
        if (aborted(state)) {
            fail(env, "java/util/concurrent/CancellationException", "Whisper transcription was cancelled");
            return nullptr;
        }
        if (!state->context) throw std::runtime_error("model not initialized");
        whisper_full_params params = whisper_full_default_params(WHISPER_SAMPLING_BEAM_SEARCH);
        params.n_threads = 4;
        params.beam_search.beam_size = 5;
        params.greedy.best_of = 5;
        // The feature transcribes Korean calls; per-window auto detection misclassified quiet speech.
        params.language = "ko";
        params.translate = false;
        params.no_context = true;
        params.n_max_text_ctx = 0;
        params.temperature = 0.0f;
        params.temperature_inc = 0.2f;
        params.entropy_thold = 2.4f;
        params.logprob_thold = -1.0f;
        params.no_speech_thold = 0.6f;
        params.print_special = false;
        params.print_progress = false;
        params.print_realtime = false;
        params.print_timestamps = false;
        params.abort_callback = aborted;
        params.abort_callback_user_data = state;
        params.encoder_begin_callback = encoder_begin;
        params.encoder_begin_callback_user_data = state;
        int status = whisper_full(state->context, params, samples, count);
        if (aborted(state)) {
            fail(env, "java/util/concurrent/CancellationException", "Whisper transcription was cancelled");
            return nullptr;
        }
        if (status != 0) throw std::runtime_error("inference failed");
        const int segments = whisper_full_n_segments(state->context);
        if (segments < 0 || segments > 1024) throw std::runtime_error("segment bound");
        const int64_t duration_ms = static_cast<int64_t>(count) * 1000 / 16000;
        std::string output;
        output.reserve(4 + static_cast<size_t>(segments) * 64);
        append_u32(output, static_cast<uint32_t>(segments));
        size_t text_bytes = 0;
        int64_t previous_start = 0;
        for (int i = 0; i < segments; ++i) {
            const char * text = whisper_full_get_segment_text(state->context, i);
            const int64_t t0 = whisper_full_get_segment_t0(state->context, i);
            const int64_t t1 = whisper_full_get_segment_t1(state->context, i);
            if (!text || t0 < 0 || t1 < t0) throw std::runtime_error("invalid segment");
            const int64_t start = std::min(t0, duration_ms / 10) * 10;
            const int64_t end = std::min(t1 * 10, duration_ms);
            if (start < previous_start) throw std::runtime_error("unordered segment");
            previous_start = start;
            const size_t length = std::strlen(text);
            if (length > 12000 - text_bytes) throw std::runtime_error("output bound");
            text_bytes += length;
            append_u64(output, static_cast<uint64_t>(start));
            append_u64(output, static_cast<uint64_t>(end));
            append_u32(output, static_cast<uint32_t>(length));
            output.append(text, length);
        }
        // Empty output is an empty segment list, never replaced with invented speech.
        jbyteArray result = env->NewByteArray(static_cast<jsize>(output.size()));
        if (result) env->SetByteArrayRegion(result, 0, static_cast<jsize>(output.size()),
                reinterpret_cast<const jbyte *>(output.data()));
        return result;
    } catch (const std::bad_alloc &) {
        fail(env, "java/lang/OutOfMemoryError", "Whisper ASR ran out of memory");
    } catch (...) {
        fail(env, "java/io/IOException", "Whisper transcription failed; no partial result was accepted");
    }
    return nullptr;
}

extern "C" JNIEXPORT void JNICALL
JNI_METHOD(cancel)(JNIEnv *, jclass, jlong handle) {
    if (Asr * state = asr(handle)) state->stopped.store(true, std::memory_order_relaxed);
}

extern "C" JNIEXPORT void JNICALL
JNI_METHOD(close)(JNIEnv *, jclass, jlong handle) {
    // Java holds the operation lifetime barrier and state lock; no active inference can refer to this object.
    delete asr(handle);
}

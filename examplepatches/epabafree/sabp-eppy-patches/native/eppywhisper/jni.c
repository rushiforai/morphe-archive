// JNI layer between eppy (app.morphe.extension.sabp.read.Whisper) and whisper.cpp.
// Transcribes one window of 16 kHz mono float PCM and returns JSON:
// {"segments":[{"t0":ms,"t1":ms,"text":"...","tokens":[[t0,t1,"text",p],...]}],"ms":elapsed}
#include <jni.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <time.h>
#include "whisper.h"

#define EXPORT __attribute__((visibility("default")))

static volatile int g_abort = 0;

static bool abort_cb(void * user) {
    (void) user;
    return g_abort != 0;
}

typedef struct {
    char * s;
    size_t n, cap;
} buf_t;

static void put(buf_t * b, const char * s, size_t len) {
    if (b->n + len + 1 > b->cap) {
        size_t cap = b->cap ? b->cap : 4096;
        while (b->n + len + 1 > cap) cap *= 2;
        char * ns = realloc(b->s, cap);
        if (!ns) return;
        b->s = ns;
        b->cap = cap;
    }
    memcpy(b->s + b->n, s, len);
    b->n += len;
    b->s[b->n] = 0;
}

static void puts_(buf_t * b, const char * s) { put(b, s, strlen(s)); }

static void put_json_string(buf_t * b, const char * s) {
    puts_(b, "\"");
    for (const unsigned char * p = (const unsigned char *) s; *p; p++) {
        char tmp[8];
        switch (*p) {
            case '"': puts_(b, "\\\""); break;
            case '\\': puts_(b, "\\\\"); break;
            case '\n': puts_(b, "\\n"); break;
            case '\r': puts_(b, "\\r"); break;
            case '\t': puts_(b, "\\t"); break;
            default:
                if (*p < 0x20) {
                    snprintf(tmp, sizeof tmp, "\\u%04x", *p);
                    puts_(b, tmp);
                } else {
                    put(b, (const char *) p, 1);
                }
        }
    }
    puts_(b, "\"");
}

static jstring utf8_or_null(JNIEnv * env, const char * s) {
    // NewStringUTF wants modified UTF-8; whisper tokens can split a multi-byte character, so pass
    // bytes through java.lang.String(byte[], "UTF-8"), which replaces invalid sequences.
    jsize len = (jsize) strlen(s);
    jbyteArray arr = (*env)->NewByteArray(env, len);
    if (!arr) return NULL;
    (*env)->SetByteArrayRegion(env, arr, 0, len, (const jbyte *) s);
    jclass str = (*env)->FindClass(env, "java/lang/String");
    jmethodID ctor = (*env)->GetMethodID(env, str, "<init>", "([BLjava/lang/String;)V");
    jstring enc = (*env)->NewStringUTF(env, "UTF-8");
    jstring out = (jstring) (*env)->NewObject(env, str, ctor, arr, enc);
    (*env)->DeleteLocalRef(env, arr);
    (*env)->DeleteLocalRef(env, enc);
    return out;
}

EXPORT JNIEXPORT jlong JNICALL
Java_app_morphe_extension_sabp_read_Whisper_nativeInit(JNIEnv * env, jclass cls, jstring model) {
    (void) cls;
    const char * path = (*env)->GetStringUTFChars(env, model, NULL);
    struct whisper_context_params cp = whisper_context_default_params();
    cp.use_gpu = false;
    struct whisper_context * ctx = whisper_init_from_file_with_params(path, cp);
    (*env)->ReleaseStringUTFChars(env, model, path);
    return (jlong) (intptr_t) ctx;
}

EXPORT JNIEXPORT void JNICALL
Java_app_morphe_extension_sabp_read_Whisper_nativeFree(JNIEnv * env, jclass cls, jlong ptr) {
    (void) env; (void) cls;
    if (ptr) whisper_free((struct whisper_context *) (intptr_t) ptr);
}

EXPORT JNIEXPORT void JNICALL
Java_app_morphe_extension_sabp_read_Whisper_nativeAbort(JNIEnv * env, jclass cls, jboolean on) {
    (void) env; (void) cls;
    g_abort = on ? 1 : 0;
}

EXPORT JNIEXPORT jstring JNICALL
Java_app_morphe_extension_sabp_read_Whisper_nativeSystemInfo(JNIEnv * env, jclass cls) {
    (void) cls;
    return (*env)->NewStringUTF(env, whisper_print_system_info());
}

EXPORT JNIEXPORT jstring JNICALL
Java_app_morphe_extension_sabp_read_Whisper_nativeTranscribe(JNIEnv * env, jclass cls, jlong ptr, jfloatArray pcm,
                                                             jint threads, jstring prompt, jstring language) {
    (void) cls;
    struct whisper_context * ctx = (struct whisper_context *) (intptr_t) ptr;
    if (!ctx) return NULL;
    jsize n = (*env)->GetArrayLength(env, pcm);
    jfloat * samples = (*env)->GetFloatArrayElements(env, pcm, NULL);
    const char * prompt_c = prompt ? (*env)->GetStringUTFChars(env, prompt, NULL) : NULL;
    const char * lang_c = language ? (*env)->GetStringUTFChars(env, language, NULL) : NULL;

    struct whisper_full_params p = whisper_full_default_params(WHISPER_SAMPLING_GREEDY);
    p.n_threads = threads > 0 ? threads : 2;
    p.translate = false;
    p.language = lang_c && lang_c[0] ? lang_c : "en";
    p.print_progress = false;
    p.print_realtime = false;
    p.print_timestamps = false;
    p.print_special = false;
    p.no_context = true;
    p.single_segment = false;
    p.token_timestamps = true;
    p.suppress_blank = true;
    p.initial_prompt = prompt_c && prompt_c[0] ? prompt_c : NULL;
    p.abort_callback = abort_cb;
    p.abort_callback_user_data = NULL;

    struct timespec a, z;
    clock_gettime(CLOCK_MONOTONIC, &a);
    g_abort = 0;
    int rc = whisper_full(ctx, p, samples, n);
    clock_gettime(CLOCK_MONOTONIC, &z);
    (*env)->ReleaseFloatArrayElements(env, pcm, samples, JNI_ABORT);
    if (prompt_c) (*env)->ReleaseStringUTFChars(env, prompt, prompt_c);
    if (lang_c) (*env)->ReleaseStringUTFChars(env, language, lang_c);
    if (rc != 0) return NULL;

    buf_t b = {0};
    char tmp[96];
    puts_(&b, "{\"segments\":[");
    const int nseg = whisper_full_n_segments(ctx);
    const whisper_token eot = whisper_token_eot(ctx);
    for (int i = 0; i < nseg; i++) {
        if (i) puts_(&b, ",");
        snprintf(tmp, sizeof tmp, "{\"t0\":%lld,\"t1\":%lld,\"nsp\":%.3f,\"text\":",
                 (long long) whisper_full_get_segment_t0(ctx, i) * 10, (long long) whisper_full_get_segment_t1(ctx, i) * 10,
                 whisper_full_get_segment_no_speech_prob(ctx, i));
        puts_(&b, tmp);
        put_json_string(&b, whisper_full_get_segment_text(ctx, i));
        puts_(&b, ",\"tokens\":[");
        const int nt = whisper_full_n_tokens(ctx, i);
        int first = 1;
        for (int k = 0; k < nt; k++) {
            whisper_token_data d = whisper_full_get_token_data(ctx, i, k);
            if (d.id >= eot) continue; // timestamps and special tokens
            if (!first) puts_(&b, ",");
            first = 0;
            snprintf(tmp, sizeof tmp, "[%lld,%lld,", (long long) d.t0 * 10, (long long) d.t1 * 10);
            puts_(&b, tmp);
            put_json_string(&b, whisper_full_get_token_text(ctx, i, k));
            snprintf(tmp, sizeof tmp, ",%.3f]", d.p);
            puts_(&b, tmp);
        }
        puts_(&b, "]}");
    }
    long ms = (long) ((z.tv_sec - a.tv_sec) * 1000 + (z.tv_nsec - a.tv_nsec) / 1000000);
    snprintf(tmp, sizeof tmp, "],\"ms\":%ld}", ms);
    puts_(&b, tmp);
    jstring out = utf8_or_null(env, b.s ? b.s : "{}");
    free(b.s);
    return out;
}

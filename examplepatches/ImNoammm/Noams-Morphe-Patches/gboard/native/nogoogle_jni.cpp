// JNI bridge for the No-Google Gboard extension:
//  - whisper.cpp speech recognition (offline voice typing)
//  - slimt (Bergamot / Firefox Translations models) offline translation
#include <jni.h>
#include <android/log.h>

#include <algorithm>
#include <atomic>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <fstream>
#include <memory>
#include <mutex>
#include <string>
#include <vector>

#include "ggml.h"
#include "whisper.h"
#include "slimt/slimt.hh"

#define TAG "NoGoogleNative"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, TAG, __VA_ARGS__)

namespace {

// Java string -> standard UTF-8. (GetStringUTFChars yields "modified" UTF-8, which encodes
// emoji and other non-BMP characters as surrogate pairs that tokenizers treat as garbage.)
std::string str(JNIEnv *env, jstring s) {
  if (s == nullptr) return {};
  const jsize n = env->GetStringLength(s);
  const jchar *u = env->GetStringChars(s, nullptr);
  std::string out;
  out.reserve(n * 3);
  for (jsize i = 0; i < n; i++) {
    uint32_t cp = u[i];
    if (cp >= 0xD800 && cp <= 0xDBFF && i + 1 < n && u[i + 1] >= 0xDC00 && u[i + 1] <= 0xDFFF) {
      cp = 0x10000 + ((cp - 0xD800) << 10) + (u[++i] - 0xDC00);
    } else if (cp >= 0xD800 && cp <= 0xDFFF) {
      cp = 0xFFFD;  // lone surrogate
    }
    if (cp < 0x80) {
      out += char(cp);
    } else if (cp < 0x800) {
      out += char(0xC0 | (cp >> 6));
      out += char(0x80 | (cp & 0x3F));
    } else if (cp < 0x10000) {
      out += char(0xE0 | (cp >> 12));
      out += char(0x80 | ((cp >> 6) & 0x3F));
      out += char(0x80 | (cp & 0x3F));
    } else {
      out += char(0xF0 | (cp >> 18));
      out += char(0x80 | ((cp >> 12) & 0x3F));
      out += char(0x80 | ((cp >> 6) & 0x3F));
      out += char(0x80 | (cp & 0x3F));
    }
  }
  env->ReleaseStringChars(s, u);
  return out;
}

// Java's NewStringUTF expects modified UTF-8 and chokes on 4-byte sequences (emoji);
// build the string from UTF-16 instead.
jstring jstr(JNIEnv *env, const std::string &s) {
  std::u16string u;
  u.reserve(s.size());
  for (size_t i = 0; i < s.size();) {
    unsigned char c = s[i];
    uint32_t cp;
    int n;
    if (c < 0x80) { cp = c; n = 1; }
    else if ((c >> 5) == 0x6) { cp = c & 0x1F; n = 2; }
    else if ((c >> 4) == 0xE) { cp = c & 0x0F; n = 3; }
    else if ((c >> 3) == 0x1E) { cp = c & 0x07; n = 4; }
    else { i++; continue; }  // invalid lead byte (whisper can split multibyte chars)
    if (i + n > s.size()) break;
    bool ok = true;
    for (int k = 1; k < n; k++) {
      unsigned char cc = s[i + k];
      if ((cc >> 6) != 0x2) { ok = false; break; }
      cp = (cp << 6) | (cc & 0x3F);
    }
    if (!ok) { i++; continue; }
    i += n;
    if (cp >= 0x10000) {
      cp -= 0x10000;
      u.push_back(char16_t(0xD800 + (cp >> 10)));
      u.push_back(char16_t(0xDC00 + (cp & 0x3FF)));
    } else {
      u.push_back(char16_t(cp));
    }
  }
  return env->NewString(reinterpret_cast<const jchar *>(u.data()), (jsize)u.size());
}

struct WhisperHandle {
  whisper_context *ctx = nullptr;
  std::mutex lock;
  std::atomic<bool> abort{false};
};

bool abort_cb(void *user) { return static_cast<WhisperHandle *>(user)->abort; }

// Reads "dec-depth: N" from the YAML config Marian embeds in the model file.
size_t decoder_depth(const std::string &model_path) {
  std::ifstream in(model_path, std::ios::binary);
  std::vector<char> head(1 << 20);
  in.read(head.data(), head.size());
  std::string text(head.data(), in.gcount());
  auto pos = text.find("dec-depth: ");
  if (pos == std::string::npos) return 2;
  return std::strtoul(text.c_str() + pos + 11, nullptr, 10);
}

struct TranslatorHandle {
  std::shared_ptr<slimt::Model> model;
  std::unique_ptr<slimt::Blocking> service;
  std::mutex lock;
};

}  // namespace

extern "C" {

JNIEXPORT jlong JNICALL
Java_app_nogoogle_gboard_voice_NativeEngine_whisperInit(JNIEnv *env, jclass, jstring path,
                                                        jboolean gpu) {
  auto p = str(env, path);
  whisper_context_params cparams = whisper_context_default_params();
  cparams.use_gpu = gpu;
  cparams.flash_attn = true;
  whisper_context *ctx = whisper_init_from_file_with_params(p.c_str(), cparams);
  if (!ctx) {
    LOGE("whisper init failed: %s", p.c_str());
    return 0;
  }
  auto *h = new WhisperHandle();
  h->ctx = ctx;
  LOGI("whisper loaded %s (gpu=%d)", p.c_str(), (int)gpu);
  return reinterpret_cast<jlong>(h);
}

JNIEXPORT jstring JNICALL
Java_app_nogoogle_gboard_voice_NativeEngine_whisperTranscribe(
    JNIEnv *env, jclass, jlong handle, jfloatArray pcm, jstring lang, jint threads, jint beam,
    jboolean fast, jstring prompt, jint ctx_pad) {
  auto *h = reinterpret_cast<WhisperHandle *>(handle);
  if (!h) return jstr(env, "");
  std::lock_guard<std::mutex> g(h->lock);
  if (h->abort) return jstr(env, "");  // cleared only by whisperResetAbort()

  jsize n = env->GetArrayLength(pcm);
  std::vector<float> samples(n);
  env->GetFloatArrayRegion(pcm, 0, n, samples.data());
  std::string language = str(env, lang);
  std::string initial = str(env, prompt);

  whisper_full_params params = whisper_full_default_params(
      beam > 1 ? WHISPER_SAMPLING_BEAM_SEARCH : WHISPER_SAMPLING_GREEDY);
  params.n_threads = threads;
  params.language = language.empty() ? "auto" : language.c_str();
  params.detect_language = false;
  params.translate = false;
  params.no_timestamps = true;
  params.print_progress = false;
  params.print_realtime = false;
  params.print_special = false;
  params.print_timestamps = false;
  params.suppress_blank = true;
  // Let Whisper mark music/noise as [Music] etc. (filtered out by the caller) instead of forcing
  // words out of it.
  params.suppress_nst = false;
  params.single_segment = fast;
  params.no_context = true;
  if (beam > 1) params.beam_search.beam_size = beam;
  if (!initial.empty()) params.initial_prompt = initial.c_str();
  // ctx_pad >= 0: encode only the audio (+ ctx_pad frames; 50 frames = 1 s) instead of the whole
  // 30 s window. Only models fine-tuned for it (ACFT) stay accurate; others loop and repeat, so
  // the caller passes -1 (full window) for them.
  if (ctx_pad >= 0) {
    int frames = (int)((double)n / WHISPER_SAMPLE_RATE * 50.0) + ctx_pad;
    if (frames < 1500) params.audio_ctx = frames;
  }
  params.abort_callback = abort_cb;
  params.abort_callback_user_data = h;

  if (whisper_full(h->ctx, params, samples.data(), n) != 0) return jstr(env, "");
  std::string out;
  const whisper_token eot = whisper_token_eot(h->ctx);
  int segs = whisper_full_n_segments(h->ctx);
  for (int i = 0; i < segs; i++) {
    // OpenAI's silence rule: no_speech_prob > 0.6 and average token log-prob < -1 = no speech.
    double logp = 0;
    int n_text = 0;
    for (int t = 0; t < whisper_full_n_tokens(h->ctx, i); t++) {
      if (whisper_full_get_token_id(h->ctx, i, t) >= eot) continue;
      logp += std::log(std::max(whisper_full_get_token_p(h->ctx, i, t), 1e-10f));
      n_text++;
    }
    if (n_text > 0 && whisper_full_get_segment_no_speech_prob(h->ctx, i) > 0.6f && logp / n_text < -1.0) {
      continue;
    }
    out += whisper_full_get_segment_text(h->ctx, i);
  }
  return jstr(env, out);
}

JNIEXPORT jlong JNICALL
Java_app_nogoogle_gboard_voice_NativeEngine_vadInit(JNIEnv *env, jclass, jstring path) {
  auto p = str(env, path);
  whisper_vad_context_params params = whisper_vad_default_context_params();
  params.n_threads = 1;
  params.use_gpu = false;
  whisper_vad_context *ctx = whisper_vad_init_from_file_with_params(p.c_str(), params);
  if (!ctx) LOGE("vad init failed: %s", p.c_str());
  // The streaming API does not initialize the LSTM buffer. Start each session from zero.
  if (ctx) whisper_vad_reset_state(ctx);
  return reinterpret_cast<jlong>(ctx);
}

// Speech probability for each 512-sample (32 ms) window of pcm; the LSTM state carries over
// between calls, so pass whole windows.
JNIEXPORT jfloatArray JNICALL
Java_app_nogoogle_gboard_voice_NativeEngine_vadProbs(JNIEnv *env, jclass, jlong handle,
                                                     jfloatArray pcm) {
  auto *ctx = reinterpret_cast<whisper_vad_context *>(handle);
  if (!ctx) return nullptr;
  jsize n = env->GetArrayLength(pcm);
  std::vector<float> samples(n);
  env->GetFloatArrayRegion(pcm, 0, n, samples.data());
  if (!whisper_vad_detect_speech_no_reset(ctx, samples.data(), n)) return nullptr;
  int np = whisper_vad_n_probs(ctx);
  jfloatArray out = env->NewFloatArray(np);
  if (out) env->SetFloatArrayRegion(out, 0, np, whisper_vad_probs(ctx));
  return out;
}

JNIEXPORT void JNICALL
Java_app_nogoogle_gboard_voice_NativeEngine_vadFree(JNIEnv *, jclass, jlong handle) {
  auto *ctx = reinterpret_cast<whisper_vad_context *>(handle);
  if (ctx) whisper_vad_free(ctx);
}

JNIEXPORT void JNICALL
Java_app_nogoogle_gboard_voice_NativeEngine_whisperAbort(JNIEnv *, jclass, jlong handle) {
  auto *h = reinterpret_cast<WhisperHandle *>(handle);
  if (h) h->abort = true;
}

JNIEXPORT void JNICALL
Java_app_nogoogle_gboard_voice_NativeEngine_whisperResetAbort(JNIEnv *, jclass, jlong handle) {
  auto *h = reinterpret_cast<WhisperHandle *>(handle);
  if (h) h->abort = false;
}

JNIEXPORT void JNICALL
Java_app_nogoogle_gboard_voice_NativeEngine_whisperFree(JNIEnv *, jclass, jlong handle) {
  auto *h = reinterpret_cast<WhisperHandle *>(handle);
  if (!h) return;
  h->abort = true;
  {
    std::lock_guard<std::mutex> g(h->lock);
    whisper_free(h->ctx);
  }
  delete h;
}

JNIEXPORT jlong JNICALL
Java_app_nogoogle_gboard_voice_NativeEngine_translatorInit(JNIEnv *env, jclass, jstring model,
                                                           jstring vocab, jstring shortlist) {
  try {
    slimt::Package<std::string> package{
        .model = str(env, model),
        .vocabulary = str(env, vocab),
        .shortlist = str(env, shortlist),
        .ssplit = "",
    };
    slimt::Model::Config config;
    config.decoder_layers = decoder_depth(package.model);
    auto *h = new TranslatorHandle();
    h->model = std::make_shared<slimt::Model>(config, package);
    slimt::Config service_config;
    h->service = std::make_unique<slimt::Blocking>(service_config);
    LOGI("translator loaded %s (dec-depth %zu)", package.model.c_str(), config.decoder_layers);
    return reinterpret_cast<jlong>(h);
  } catch (const std::exception &e) {
    LOGE("translator init failed: %s", e.what());
    return 0;
  }
}

JNIEXPORT jstring JNICALL
Java_app_nogoogle_gboard_voice_NativeEngine_translate(JNIEnv *env, jclass, jlong handle,
                                                      jstring text) {
  auto *h = reinterpret_cast<TranslatorHandle *>(handle);
  if (!h) return nullptr;
  try {
    std::lock_guard<std::mutex> g(h->lock);
    slimt::Options opts{.alignment = false, .html = false};
    auto responses = h->service->translate(h->model, {str(env, text)}, opts);
    return jstr(env, responses.empty() ? "" : responses[0].target.text);
  } catch (const std::exception &e) {
    LOGE("translate failed: %s", e.what());
    return nullptr;
  }
}

JNIEXPORT void JNICALL
Java_app_nogoogle_gboard_voice_NativeEngine_translatorFree(JNIEnv *, jclass, jlong handle) {
  delete reinterpret_cast<TranslatorHandle *>(handle);
}

// A published q8_0 whisper.cpp model -> q4_0 (the only type with fast ARM kernels), producing the
// same bytes as an f16 conversion followed by `whisper-quantize ... q4_0`, but streamed in row
// chunks so it needs a few MB instead of the whole model in memory.
JNIEXPORT jboolean JNICALL
Java_app_nogoogle_gboard_voice_NativeEngine_whisperToQ4(JNIEnv *env, jclass, jstring in_path,
                                                        jstring out_path) {
  std::unique_ptr<FILE, int (*)(FILE *)> in(fopen(str(env, in_path).c_str(), "rb"), fclose);
  std::unique_ptr<FILE, int (*)(FILE *)> out(fopen(str(env, out_path).c_str(), "wb"), fclose);
  if (!in || !out) return JNI_FALSE;
  auto rd = [&](void *p, size_t n) { return fread(p, 1, n, in.get()) == n; };
  auto wr = [&](const void *p, size_t n) { return fwrite(p, 1, n, out.get()) == n; };
  std::vector<uint8_t> buf;
  auto copy = [&](size_t n) {
    buf.resize(1 << 16);
    while (n > 0) {
      size_t k = std::min(n, buf.size());
      if (!rd(buf.data(), k) || !wr(buf.data(), k)) return false;
      n -= k;
    }
    return true;
  };

  uint32_t magic;
  int32_t hp[11];  // n_vocab .. n_mels, ftype
  if (!rd(&magic, 4) || magic != 0x67676d6c || !rd(hp, sizeof hp)) return JNI_FALSE;
  hp[10] = GGML_QNT_VERSION * GGML_QNT_VERSION_FACTOR + GGML_FTYPE_MOSTLY_Q4_0;
  if (!wr(&magic, 4) || !wr(hp, sizeof hp)) return JNI_FALSE;
  int32_t mel[2];  // n_mel, n_fft, then the filter floats
  if (!rd(mel, sizeof mel) || !wr(mel, sizeof mel) || !copy((size_t)mel[0] * mel[1] * sizeof(float))) {
    return JNI_FALSE;
  }
  int32_t n_vocab;
  if (!rd(&n_vocab, 4) || !wr(&n_vocab, 4)) return JNI_FALSE;
  for (int32_t i = 0; i < n_vocab; i++) {
    uint32_t len;
    if (!rd(&len, 4) || !wr(&len, 4) || !copy(len)) return JNI_FALSE;
  }

  static const char *kSkip[] = {"encoder.conv1.bias", "encoder.conv2.bias",
                                "encoder.positional_embedding", "decoder.positional_embedding"};
  std::vector<uint8_t> raw, packed;
  std::vector<ggml_fp16_t> half;
  std::vector<float> full;
  int tensors = 0;
  for (;;) {
    int32_t head[3];  // n_dims, name length, type
    if (fread(head, 1, sizeof head, in.get()) != sizeof head) break;
    int32_t ne[4] = {1, 1, 1, 1};
    char name[512];
    if (head[0] < 1 || head[0] > 4 || head[1] <= 0 || head[1] >= (int32_t)sizeof name) return JNI_FALSE;
    if (!rd(ne, sizeof(int32_t) * head[0]) || !rd(name, head[1])) return JNI_FALSE;
    const std::string tname(name, head[1]);
    const int32_t type = head[2];
    if (type != GGML_TYPE_Q8_0 && type != GGML_TYPE_F16 && type != GGML_TYPE_F32) return JNI_FALSE;
    bool quantize = head[0] == 2;
    for (const char *skip : kSkip) quantize &= tname != skip;
    // Stage 1: q8_0 -> f16. Stage 2 (as whisper-quantize does): 2D tensors -> q4_0.
    const int32_t stage1 = type == GGML_TYPE_Q8_0 ? GGML_TYPE_F16 : type;
    head[2] = quantize ? GGML_TYPE_Q4_0 : stage1;
    if (!wr(head, sizeof head) || !wr(ne, sizeof(int32_t) * head[0]) || !wr(name, head[1])) return JNI_FALSE;

    const int64_t row = ne[0];
    const int64_t rows = (int64_t)ne[1] * ne[2] * ne[3];
    if ((type == GGML_TYPE_Q8_0 || quantize) && row % 32) return JNI_FALSE;
    const int64_t chunk = std::max<int64_t>(1, (1 << 20) / row);  // ~1M elements at a time
    for (int64_t r0 = 0; r0 < rows; r0 += chunk) {
      const int64_t nr = std::min(chunk, rows - r0);
      const size_t n = (size_t)(nr * row);
      if (type == GGML_TYPE_Q8_0) {
        raw.resize(n / 32 * 34);  // per block: f16 scale + 32 int8
        if (!rd(raw.data(), raw.size())) return JNI_FALSE;
        half.resize(n);
        for (size_t b = 0; b < n / 32; b++) {
          const uint8_t *blk = raw.data() + b * 34;
          ggml_fp16_t d16;
          memcpy(&d16, blk, 2);
          const float d = ggml_fp16_to_fp32(d16);
          for (int j = 0; j < 32; j++) half[b * 32 + j] = ggml_fp32_to_fp16(d * (int8_t)blk[2 + j]);
        }
      } else if (type == GGML_TYPE_F16) {
        half.resize(n);
        if (!rd(half.data(), n * sizeof(ggml_fp16_t))) return JNI_FALSE;
      } else {
        full.resize(n);
        if (!rd(full.data(), n * sizeof(float))) return JNI_FALSE;
      }
      if (!quantize) {
        bool ok = stage1 == GGML_TYPE_F16 ? wr(half.data(), n * sizeof(ggml_fp16_t))
                                          : wr(full.data(), n * sizeof(float));
        if (!ok) return JNI_FALSE;
        continue;
      }
      if (stage1 == GGML_TYPE_F16) {
        full.resize(n);
        for (size_t i = 0; i < n; i++) full[i] = ggml_fp16_to_fp32(half[i]);
      }
      packed.resize(ggml_row_size(GGML_TYPE_Q4_0, row) * nr);
      const size_t size = ggml_quantize_chunk(GGML_TYPE_Q4_0, full.data(), packed.data(), 0, nr, row, nullptr);
      if (!wr(packed.data(), size)) return JNI_FALSE;
    }
    tensors++;
  }
  if (fflush(out.get()) != 0) return JNI_FALSE;
  LOGI("whisperToQ4: %d tensors written", tensors);
  return tensors > 0 ? JNI_TRUE : JNI_FALSE;
}

}  // extern "C"

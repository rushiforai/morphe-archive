// JNI bridge for on-device LLM translation (llama.cpp), used by the No-Google Gboard extension
// (app.nogoogle.gboard.translate.LlmEngine). One model + context per handle, greedy decoding.
// Successive prompts that share a prefix (the instruction + the text typed so far) reuse the KV
// cache, so re-translating while the user types only evaluates the new tokens.
#include <jni.h>
#include <android/log.h>

#include <algorithm>
#include <atomic>
#include <mutex>
#include <string>
#include <vector>

#include "llama.h"

#define TAG "NoGoogleLlm"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, TAG, __VA_ARGS__)

namespace {

struct Llm {
  llama_model *model = nullptr;
  llama_context *ctx = nullptr;
  const llama_vocab *vocab = nullptr;
  llama_sampler *sampler = nullptr;
  std::vector<llama_token> cached;  // tokens currently held in the KV cache (sequence 0)
  std::mutex lock;
  std::atomic<bool> abort{false};
};

bool abort_cb(void *data) { return static_cast<Llm *>(data)->abort.load(); }

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

// Builds a Java string from UTF-8 via UTF-16 (NewStringUTF rejects 4-byte sequences) and drops
// a trailing incomplete sequence.
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
    else { i++; continue; }
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

std::vector<llama_token> tokenize(const llama_vocab *vocab, const std::string &text) {
  std::vector<llama_token> tokens(text.size() + 8);
  int n = llama_tokenize(vocab, text.data(), (int32_t)text.size(), tokens.data(),
                         (int32_t)tokens.size(), /*add_special=*/false, /*parse_special=*/true);
  if (n < 0) {
    tokens.resize(-n);
    n = llama_tokenize(vocab, text.data(), (int32_t)text.size(), tokens.data(),
                       (int32_t)tokens.size(), false, true);
  }
  tokens.resize(n < 0 ? 0 : n);
  return tokens;
}

// Evaluates tokens[from..] on top of the KV cache in n_batch-sized chunks.
bool feed(Llm *h, std::vector<llama_token> &tokens, size_t from) {
  const size_t batch = llama_n_batch(h->ctx);
  for (size_t i = from; i < tokens.size(); i += batch) {
    int32_t n = (int32_t)std::min(batch, tokens.size() - i);
    if (llama_decode(h->ctx, llama_batch_get_one(tokens.data() + i, n)) != 0) return false;
    h->cached.insert(h->cached.end(), tokens.begin() + i, tokens.begin() + i + n);
  }
  return true;
}

}  // namespace

extern "C" {

JNIEXPORT jlong JNICALL
Java_app_nogoogle_gboard_translate_LlmEngine_init(JNIEnv *env, jclass, jstring path, jint threads,
                                                  jint n_ctx) {
  static std::once_flag backend;
  std::call_once(backend, [] { llama_backend_init(); });
  auto p = str(env, path);
  llama_model_params mparams = llama_model_default_params();
  mparams.n_gpu_layers = 0;
  mparams.load_mode = LLAMA_LOAD_MODE_MMAP;  // weights load lazily from the file
  // No repacked weights (ARM dotprod layouts): on the Dimensity 7300 they took 3.8 s to load and 1.1 GB
  // of RAM and translated no faster; the mapped file loads in 0.4 s and its pages can be dropped.
  mparams.use_extra_bufts = false;
  llama_model *model = llama_model_load_from_file(p.c_str(), mparams);
  if (!model) {
    LOGE("model load failed: %s", p.c_str());
    return 0;
  }
  auto *h = new Llm();
  llama_context_params cparams = llama_context_default_params();
  cparams.n_ctx = n_ctx;
  cparams.n_batch = 256;
  cparams.n_ubatch = 256;
  cparams.n_threads = threads;
  cparams.n_threads_batch = threads;
  cparams.no_perf = true;
  cparams.abort_callback = abort_cb;
  cparams.abort_callback_data = h;
  llama_context *ctx = llama_init_from_model(model, cparams);
  if (!ctx) {
    LOGE("context init failed");
    llama_model_free(model);
    delete h;
    return 0;
  }
  h->model = model;
  h->ctx = ctx;
  h->vocab = llama_model_get_vocab(model);
  h->sampler = llama_sampler_chain_init(llama_sampler_chain_default_params());
  llama_sampler_chain_add(h->sampler, llama_sampler_init_greedy());
  LOGI("loaded %s (ctx %d, %d threads)", p.c_str(), n_ctx, threads);
  return reinterpret_cast<jlong>(h);
}

// Greedy completion of `prompt` (special tokens in the text are parsed). Returns null when
// aborted or on error.
JNIEXPORT jstring JNICALL
Java_app_nogoogle_gboard_translate_LlmEngine_generate(JNIEnv *env, jclass, jlong handle,
                                                      jstring prompt, jint max_tokens) {
  auto *h = reinterpret_cast<Llm *>(handle);
  if (!h) return nullptr;
  std::lock_guard<std::mutex> g(h->lock);
  // The abort flag is cleared only by resetAbort(), so an abort that arrives between the
  // caller's last check and this call still stops it.
  if (h->abort) return nullptr;

  std::vector<llama_token> tokens = tokenize(h->vocab, str(env, prompt));
  if (tokens.empty()) return jstr(env, "");
  const int n_ctx = (int)llama_n_ctx(h->ctx);
  if ((int)tokens.size() + 16 > n_ctx) {
    LOGE("prompt too long (%zu tokens)", tokens.size());
    return nullptr;
  }
  max_tokens = std::min<int>(max_tokens, n_ctx - (int)tokens.size());
  // Reuse the cached prefix; always re-evaluate at least the last prompt token for fresh logits.
  size_t keep = 0;
  while (keep < h->cached.size() && keep + 1 < tokens.size() && h->cached[keep] == tokens[keep]) keep++;
  llama_memory_t mem = llama_get_memory(h->ctx);
  if (!llama_memory_seq_rm(mem, 0, (llama_pos)keep, -1)) {
    llama_memory_clear(mem, true);
    keep = 0;
  }
  h->cached.resize(keep);
  if (!feed(h, tokens, keep)) {
    llama_memory_clear(mem, true);
    h->cached.clear();
    return nullptr;
  }

  std::string out;
  llama_sampler_reset(h->sampler);
  for (int i = 0; i < max_tokens; i++) {
    if (h->abort) return nullptr;
    llama_token tok = llama_sampler_sample(h->sampler, h->ctx, -1);
    if (llama_vocab_is_eog(h->vocab, tok)) break;
    char piece[256];
    int n = llama_token_to_piece(h->vocab, tok, piece, sizeof piece, 0, false);
    if (n > 0) out.append(piece, n);
    std::vector<llama_token> one{tok};
    if (!feed(h, one, 0)) {
      llama_memory_clear(mem, true);
      h->cached.clear();
      return nullptr;
    }
  }
  return jstr(env, out);
}

JNIEXPORT void JNICALL
Java_app_nogoogle_gboard_translate_LlmEngine_abort(JNIEnv *, jclass, jlong handle) {
  auto *h = reinterpret_cast<Llm *>(handle);
  if (h) h->abort = true;
}

JNIEXPORT void JNICALL
Java_app_nogoogle_gboard_translate_LlmEngine_resetAbort(JNIEnv *, jclass, jlong handle) {
  auto *h = reinterpret_cast<Llm *>(handle);
  if (h) h->abort = false;
}

JNIEXPORT void JNICALL
Java_app_nogoogle_gboard_translate_LlmEngine_free(JNIEnv *, jclass, jlong handle) {
  auto *h = reinterpret_cast<Llm *>(handle);
  if (!h) return;
  h->abort = true;
  {
    std::lock_guard<std::mutex> g(h->lock);
    llama_sampler_free(h->sampler);
    llama_free(h->ctx);
    llama_model_free(h->model);
  }
  delete h;
}

}  // extern "C"

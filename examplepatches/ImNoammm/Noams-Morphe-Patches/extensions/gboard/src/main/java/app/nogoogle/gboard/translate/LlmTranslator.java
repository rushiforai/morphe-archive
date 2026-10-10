package app.nogoogle.gboard.translate;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import app.nogoogle.gboard.voice.Models;

import java.io.File;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.function.BooleanSupplier;

/**
 * On-device translation with Tencent's Hy-MT models (models/llm/*.gguf, llama.cpp), using the
 * prompt formats from the model cards. Codes are LocalTranslate's model codes (he, zh-Hans, ...).
 */
final class LlmTranslator {
    private static final String TAG = "NoGoogleTranslate";
    private static final int THREADS = 3;            // of the four big cores: one stays free for the UI
    private static final int CONTEXT = 2048;
    private static final int MAX_INPUT_CHARS = 1500;
    private static final long UNLOAD_AFTER_MS = 3 * 60_000;

    /** Hy-MT2 / HY-MT1.5 languages: code -> {English name, Chinese name}. */
    private static final Map<String, String[]> LANGUAGES = new LinkedHashMap<>();

    static {
        String[][] table = {
                {"zh-Hans", "Chinese", "中文"}, {"en", "English", "英语"}, {"fr", "French", "法语"},
                {"pt", "Portuguese", "葡萄牙语"}, {"es", "Spanish", "西班牙语"}, {"ja", "Japanese", "日语"},
                {"tr", "Turkish", "土耳其语"}, {"ru", "Russian", "俄语"}, {"ar", "Arabic", "阿拉伯语"},
                {"ko", "Korean", "韩语"}, {"th", "Thai", "泰语"}, {"it", "Italian", "意大利语"},
                {"de", "German", "德语"}, {"vi", "Vietnamese", "越南语"}, {"ms", "Malay", "马来语"},
                {"id", "Indonesian", "印尼语"}, {"tl", "Filipino", "菲律宾语"}, {"hi", "Hindi", "印地语"},
                {"zh-Hant", "Traditional Chinese", "繁体中文"}, {"pl", "Polish", "波兰语"},
                {"cs", "Czech", "捷克语"}, {"nl", "Dutch", "荷兰语"}, {"km", "Khmer", "高棉语"},
                {"my", "Burmese", "缅甸语"}, {"fa", "Persian", "波斯语"}, {"gu", "Gujarati", "古吉拉特语"},
                {"ur", "Urdu", "乌尔都语"}, {"te", "Telugu", "泰卢固语"}, {"mr", "Marathi", "马拉地语"},
                {"he", "Hebrew", "希伯来语"}, {"bn", "Bengali", "孟加拉语"}, {"ta", "Tamil", "泰米尔语"},
                {"uk", "Ukrainian", "乌克兰语"}, {"bo", "Tibetan", "藏语"}, {"kk", "Kazakh", "哈萨克语"},
                {"mn", "Mongolian", "蒙古语"}, {"ug", "Uyghur", "维吾尔语"}, {"yue", "Cantonese", "粤语"},
        };
        for (String[] row : table) LANGUAGES.put(row[0], new String[]{row[1], row[2]});
    }

    // Hy chat template: <｜hy_begin▁of▁sentence｜><｜hy_User｜>{prompt}<｜hy_Assistant｜>
    private static final String BEGIN = "<｜hy_begin▁of▁sentence｜>";
    private static final String USER = "<｜hy_User｜>";
    private static final String ASSISTANT = "<｜hy_Assistant｜>";

    private static final Object LOCK = new Object();
    private static final Handler IDLE = new Handler(Looper.getMainLooper());
    // Unloading waits for a running translation, so never do it on the main thread.
    private static final Runnable UNLOAD = () -> new Thread(() -> release(false), "nogoogle-llm-unload").start();
    private static final Object HANDLE_LOCK = new Object(); // abort() vs free
    private static long handle;                               // guarded by HANDLE_LOCK for writes
    private static String loadedPath;
    private static volatile long lastUsed;

    private LlmTranslator() {
    }

    // Result of the last models/llm scan. This runs on the UI thread for every keystroke in the
    // translate panel, so the folder (shared storage) is looked at again only every few seconds.
    private static final long RESCAN_MS = 10_000;
    private static volatile File scanned;
    private static volatile long scannedStamp = Long.MIN_VALUE;
    private static volatile long checkedAt; // 0 = never

    /** Newest Hy-MT model in models/llm (Hy-MT2 over HY-MT1.5), or null. */
    static File model() {
        long now = android.os.SystemClock.elapsedRealtime();
        if (checkedAt != 0 && now - checkedAt < RESCAN_MS) return scanned;
        File dir = Models.llmDir();
        long stamp = dir.lastModified();
        if (stamp != scannedStamp) {
            scanned = newest(dir);
            scannedStamp = stamp;
        }
        checkedAt = now;
        return scanned;
    }

    private static File newest(File dir) {
        File[] files = dir.listFiles((d, n) -> {
            String s = n.toLowerCase(Locale.ROOT);
            return s.endsWith(".gguf") && (s.contains("hy-mt") || s.contains("hymt"));
        });
        if (files == null || files.length == 0) return null;
        File best = null;
        for (File f : files) {
            if (best == null || generation(f) > generation(best)
                    || generation(f) == generation(best) && f.length() < best.length()) {
                best = f;
            }
        }
        return best;
    }

    private static int generation(File f) {
        String n = f.getName().toLowerCase(Locale.ROOT).replace("-", "").replace("_", "");
        return n.contains("hymt2") ? 2 : 1;
    }

    static boolean available() {
        return model() != null;
    }

    static boolean supports(String code) {
        return code != null && LANGUAGES.containsKey(code);
    }

    static Set<String> languages() {
        return Collections.unmodifiableSet(LANGUAGES.keySet());
    }

    /**
     * Translates {@code text} into {@code to} ({@code from} may be null/auto: the model detects
     * it). Returns null when aborted or on failure.
     */
    static String translate(String text, String from, String to, BooleanSupplier stillWanted) {
        if (text == null || text.trim().isEmpty()) return "";
        String[] target = LANGUAGES.get(to);
        File model = model();
        if (target == null || model == null || text.length() > MAX_INPUT_CHARS) return null;
        boolean chinese = isChinese(from) || isChinese(to);
        boolean v2 = generation(model) == 2;
        String body;
        if (chinese) {
            body = "将以下文本翻译为" + target[1] + "，注意只需要输出翻译后的结果，不要额外解释：\n\n" + text;
        } else if (v2) {
            body = "Translate the following text into " + target[0] + ". Note that you should only "
                    + "output the translated result without any additional explanation:\n\n" + text;
        } else {
            body = "Translate the following segment into " + target[0]
                    + ", without additional explanation.\n\n" + text;
        }
        String prompt = BEGIN + USER + body + ASSISTANT;
        IDLE.removeCallbacks(UNLOAD);
        lastUsed = System.currentTimeMillis();
        try {
            synchronized (LOCK) {
                long h = ensureLoaded(model);
                if (h == 0) return null;
                // Clear any old abort, then re-check: a request superseded from here on is
                // aborted through the flag, one superseded earlier stops now.
                LlmEngine.resetAbort(h);
                if (!stillWanted.getAsBoolean()) return null;
                String out = LlmEngine.generate(h, prompt, Math.min(1024, text.length() * 2 + 64));
                return out == null ? null : out.trim();
            }
        } finally {
            lastUsed = System.currentTimeMillis();
            IDLE.postDelayed(UNLOAD, UNLOAD_AFTER_MS);
        }
    }

    private static boolean isChinese(String code) {
        return "zh-Hans".equals(code) || "zh-Hant".equals(code) || "yue".equals(code);
    }

    /** Stops a running translation (a newer request superseded it). */
    static void abort() {
        synchronized (HANDLE_LOCK) {
            if (handle != 0) LlmEngine.abort(handle);
        }
    }

    /** Caller holds LOCK. */
    private static long ensureLoaded(File model) {
        String path = model.getAbsolutePath();
        if (handle != 0 && path.equals(loadedPath)) return handle;
        if (!LlmEngine.load()) return 0;
        freeHandle();
        long h = LlmEngine.init(path, THREADS, CONTEXT);
        synchronized (HANDLE_LOCK) {
            handle = h;
        }
        loadedPath = h != 0 ? path : null;
        if (h == 0) Log.e(TAG, "could not load " + path);
        return h;
    }

    /** Caller holds LOCK (so no translation is running). */
    private static void freeHandle() {
        long h;
        synchronized (HANDLE_LOCK) {
            h = handle;
            handle = 0;
        }
        if (h != 0) LlmEngine.free(h);
        loadedPath = null;
    }

    /**
     * Frees the model. {@code force} (mod menu) stops a running translation; the idle timer
     * instead waits for it and keeps the model if it was used again meanwhile.
     */
    static void release(boolean force) {
        if (force) abort();
        synchronized (LOCK) {
            if (!force && System.currentTimeMillis() - lastUsed < UNLOAD_AFTER_MS) return;
            freeHandle();
        }
    }

    /** Frees the model without blocking the caller (mod menu). */
    static void releaseAsync() {
        IDLE.removeCallbacks(UNLOAD);
        new Thread(() -> release(true), "nogoogle-llm-unload").start();
    }
}

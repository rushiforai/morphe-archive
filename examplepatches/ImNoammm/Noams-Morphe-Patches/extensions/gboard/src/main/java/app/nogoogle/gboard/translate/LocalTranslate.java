package app.nogoogle.gboard.translate;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import app.nogoogle.gboard.ModMenuActivity;
import app.nogoogle.gboard.NoGoogleSettings;
import app.nogoogle.gboard.voice.Models;
import app.nogoogle.gboard.voice.NativeEngine;

import java.io.File;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Offline translation for Gboard's translate panel: a dynamic proxy for its obfuscated provider
 * interface, dispatching on method shape so renamed methods keep working. Firefox Translations
 * (slimt) answers at once; with Hy-MT (llama.cpp) on, its better result replaces it a few seconds
 * later. Firefox models: <models>/translate/<src>-<tgt>/; X->Y also works through English.
 */
@SuppressWarnings("unused")
public final class LocalTranslate implements InvocationHandler {
    private static final String TAG = "NoGoogleTranslate";
    private static final int ERROR_FAILED = 2;
    private static final int ERROR_UNAVAILABLE = 5;

    private static final long LLM_DEBOUNCE_MS = 350;
    private static final long UNLOAD_AFTER_MS = 3 * 60_000;

    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "nogoogle-translate");
        t.setPriority(Thread.NORM_PRIORITY - 1);
        return t;
    });
    private static final ExecutorService LLM_EXECUTOR = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "nogoogle-translate-llm");
        t.setPriority(Thread.NORM_PRIORITY - 1);
        return t;
    });
    private static final AtomicLong LATEST = new AtomicLong();
    private static final Handler IDLE = new Handler(Looper.getMainLooper());
    // Firefox models are only used on EXECUTOR, so free them there.
    private static final Runnable UNLOAD = () -> EXECUTOR.execute(LocalTranslate::freeFirefoxModels);
    private static final Map<String, Long> LOADED = new LinkedHashMap<>(4, 0.75f, true);
    private static final int MAX_LOADED = 3;

    // Installed Firefox model pairs ("src-tgt"), from one scan of translate/. Checking each of the
    // ~3000 possible pairs on shared storage instead froze the translate panel for seconds.
    private static final Object SCAN_LOCK = new Object();
    private static volatile Set<String> installed;
    private static volatile long installedStamp;
    private static volatile long installedCheckedAt; // 0 = never
    private static final long RESCAN_MS = 10_000;  // pair checks run on the UI thread

    private final Handler main = new Handler(Looper.getMainLooper());
    private static volatile long modelsPromptAt; // 0 = never

    private LocalTranslate() {
    }

    /**
     * Patched into Gboard's cloud-provider factory: returns a provider implementing
     * {@code iface}, or null to keep Gboard's own provider.
     */
    public static Object create(Class<?> iface) {
        if ("stock".equals(engine())) return null;
        return Proxy.newProxyInstance(iface.getClassLoader(), new Class<?>[]{iface}, new LocalTranslate());
    }

    /** Fills the model caches off the main thread (called when the keyboard starts). */
    public static void prewarm() {
        EXECUTOR.execute(() -> {
            installed();
            LlmTranslator.available();
        });
    }

    /** "llm" (Hy-MT, Firefox as instant preview), "firefox" or "stock". */
    public static String engine() {
        return NoGoogleSettings.str(NoGoogleSettings.TRANSLATE_ENGINE);
    }

    static boolean useLlm() {
        return "llm".equals(engine()) && LlmTranslator.available();
    }

    private static boolean llmPair(String from, String to) {
        return useLlm() && LlmTranslator.supports(to) && (isAuto(from) || LlmTranslator.supports(from));
    }

    private static boolean isAuto(String code) {
        return code == null || code.isEmpty() || "auto".equals(code);
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) {
        try {
            if (method.getDeclaringClass() == Object.class) {
                switch (method.getName()) {
                    case "equals": return proxy == args[0];
                    case "hashCode": return System.identityHashCode(proxy);
                    default: return "LocalTranslate";
                }
            }
            Class<?>[] p = method.getParameterTypes();
            if (p.length == 2 && p[0] == Locale.class) {
                Locale ui = (Locale) args[0];
                Class<?> iface = p[1];
                Object callback = args[1];
                EXECUTOR.execute(() -> languages(ui, iface, callback));
                return null;
            }
            if (p.length == 2 && p[0] == String.class && p[1] == String.class
                    && method.getReturnType() == boolean.class) {
                String a = toModelCode((String) args[0]), b = toModelCode((String) args[1]);
                return supported(a, b) || llmPair(a, b) && !b.equals(a);
            }
            if (p.length == 2 && !p[0].isPrimitive() && !p[1].isPrimitive() && p[0] != String.class
                    && args[0] != null && args[1] != null && stringFields(args[0]).size() >= 3) {
                translate(args[0], p[1], args[1]);
                return null;
            }
        } catch (Throwable t) {
            Log.e(TAG, "translate provider call failed: " + method, t);
        }
        return defaultValue(method.getReturnType());
    }

    private static Object defaultValue(Class<?> type) {
        if (type == boolean.class) return false;
        if (type == int.class || type == long.class || type == short.class || type == byte.class) return 0;
        if (type == float.class || type == double.class) return 0f;
        return null;
    }

    private void languages(Locale ui, Class<?> iface, Object callback) {
        Set<String> sources = new LinkedHashSet<>();
        Set<String> targets = new LinkedHashSet<>();
        Set<String> models = installed();
        Set<String> all = new LinkedHashSet<>();
        for (Map.Entry<String, Set<String>> e : pairs(models).entrySet()) {
            all.add(e.getKey());
            all.addAll(e.getValue());
        }
        for (String a : all) {
            for (String b : all) {
                if (!a.equals(b) && supported(models, a, b)) {
                    sources.add(a);
                    targets.add(b);
                }
            }
        }
        if (useLlm()) {
            sources.addAll(LlmTranslator.languages());
            targets.addAll(LlmTranslator.languages());
        }
        if (sources.isEmpty()) promptForModels();
        Map<String, String> src = displayMap(sources, ui);
        Map<String, String> tgt = displayMap(targets, ui);
        main.post(() -> callSingle(iface, callback, src, tgt));
    }

    /** Nothing installed to translate with: says so and opens the models page (at most every 30 s). */
    private void promptForModels() {
        long now = android.os.SystemClock.elapsedRealtime();
        if (modelsPromptAt != 0 && now - modelsPromptAt < 30_000) return;
        modelsPromptAt = now;
        Context c = NoGoogleSettings.context();
        if (c != null) main.post(() -> ModMenuActivity.openModels(c, "Translation needs a model. Download one here."));
    }

    private static Map<String, String> displayMap(Set<String> codes, Locale ui) {
        TreeMap<String, String> byName = new TreeMap<>();
        for (String c : codes) {
            String name = Locale.forLanguageTag(c).getDisplayName(ui == null ? Locale.getDefault() : ui);
            if (!name.isEmpty()) name = name.substring(0, 1).toUpperCase(ui) + name.substring(1);
            byName.put(name + "\u0000" + c, toGboardCode(c));
        }
        Map<String, String> out = new LinkedHashMap<>();
        for (Map.Entry<String, String> e : byName.entrySet()) {
            out.put(e.getValue(), e.getKey().substring(0, e.getKey().indexOf('\u0000')));
        }
        return out;
    }

    /** "src-tgt" names of the installed Firefox models, rescanned when translate/ changes. */
    static Set<String> installed() {
        long now = android.os.SystemClock.elapsedRealtime();
        Set<String> found = installed;
        if (found != null && installedCheckedAt != 0 && now - installedCheckedAt < RESCAN_MS) return found;
        File dir = Models.translateDir();
        long stamp = dir.lastModified();
        if (found != null && stamp == installedStamp) {
            installedCheckedAt = now;
            return found;
        }
        synchronized (SCAN_LOCK) {
            if (installed != null && stamp == installedStamp) return installed;
            Set<String> names = new HashSet<>();
            File[] dirs = dir.listFiles(File::isDirectory);
            if (dirs != null) {
                for (File d : dirs) if (modelFiles(d) != null) names.add(d.getName());
            }
            installed = Collections.unmodifiableSet(names);
            installedStamp = stamp;
            installedCheckedAt = now;
            return installed;
        }
    }

    /** Installed Firefox model pairs (mod menu). */
    public static int installedPairs() {
        return installed().size();
    }

    /** src -> set of tgt for which a model is installed. */
    static Map<String, Set<String>> pairs(Set<String> models) {
        Map<String, Set<String>> out = new TreeMap<>();
        for (String n : models) {
            int dash = n.indexOf('-');
            if (dash <= 0) continue;
            // codes may contain dashes themselves (zh-Hans-en): split at the "en" side.
            String src, tgt;
            if (n.startsWith("en-")) {
                src = "en";
                tgt = n.substring(3);
            } else if (n.endsWith("-en")) {
                src = n.substring(0, n.length() - 3);
                tgt = "en";
            } else {
                src = n.substring(0, dash);
                tgt = n.substring(dash + 1);
            }
            out.computeIfAbsent(src, k -> new LinkedHashSet<>()).add(tgt);
        }
        return out;
    }

    static boolean supported(String a, String b) {
        return supported(installed(), a, b);
    }

    private static boolean supported(Set<String> models, String a, String b) {
        if (a == null || b == null || a.equals(b)) return false;
        if (models.contains(a + "-" + b)) return true;
        return !a.equals("en") && !b.equals("en") && models.contains(a + "-en") && models.contains("en-" + b);
    }

    /** {model, vocab, shortlist} or null. */
    private static String[] modelFiles(File dir) {
        File[] files = dir.listFiles();
        if (files == null) return null;
        String model = null, vocab = null, lex = null;
        for (File f : files) {
            String n = f.getName();
            if (n.startsWith("srcvocab.") || n.startsWith("trgvocab.")) return null; // split vocab: unsupported by slimt
            if (n.startsWith("model.") && n.endsWith(".bin")) model = f.getAbsolutePath();
            else if (n.startsWith("vocab.") && n.endsWith(".spm")) vocab = f.getAbsolutePath();
            else if (n.startsWith("lex.") && n.endsWith(".bin")) lex = f.getAbsolutePath();
        }
        if (model == null || vocab == null) return null;
        return new String[]{model, vocab, lex == null ? "" : lex};
    }

    private void translate(Object request, Class<?> iface, Object callback) {
        List<String> s = stringFields(request); // text, source, target
        String text = s.get(0);
        String from = toModelCode(s.get(1));
        String to = toModelCode(s.get(2));
        long id = LATEST.incrementAndGet();
        LlmTranslator.abort(); // newer text: stop refining the old one
        boolean llm = llmPair(from, to);
        EXECUTOR.execute(() -> {
            Object quick = null;
            try {
                String src = isAuto(from) ? guessLanguage(text) : from;
                // The script-based guess calls all Latin text English; with the LLM, which detects
                // the language itself, don't echo such text back as its own "translation".
                boolean guessedSame = llm && isAuto(from) && src.equals(to);
                if (!guessedSame && (!llm || supported(src, to) || src.equals(to))) quick = run(text, src, to);
            } catch (Throwable t) {
                Log.e(TAG, "translation failed", t);
            }
            IDLE.removeCallbacks(UNLOAD);
            IDLE.postDelayed(UNLOAD, UNLOAD_AFTER_MS);
            boolean shown = quick instanceof String;
            if (shown || !llm) {
                Object result = quick;
                main.post(() -> deliver(iface, callback, result));
            }
            if (!llm || shown && !isAuto(from) && text.equals(quick)) return;
            LLM_EXECUTOR.execute(() -> {
                try {
                    if (id != LATEST.get()) return; // superseded while queued
                    Thread.sleep(LLM_DEBOUNCE_MS);
                    if (id != LATEST.get()) return; // superseded while waiting
                    String better = LlmTranslator.translate(text, isAuto(from) ? null : from, to,
                            () -> id == LATEST.get());
                    if (id != LATEST.get()) return;
                    if (better != null && !better.isEmpty()) {
                        main.post(() -> deliver(iface, callback, better));
                    } else if (!shown) {
                        main.post(() -> deliver(iface, callback, ERROR_FAILED));
                    }
                } catch (Throwable t) {
                    Log.e(TAG, "llm translation failed", t);
                    if (!shown) main.post(() -> deliver(iface, callback, ERROR_FAILED));
                }
            });
        });
    }

    /** Frees loaded translation models (mod menu). */
    public static void releaseModels() {
        LlmTranslator.releaseAsync();
        IDLE.removeCallbacks(UNLOAD);
        EXECUTOR.execute(LocalTranslate::freeFirefoxModels);
    }

    /** Runs on EXECUTOR, the only thread using the Firefox models. */
    private static void freeFirefoxModels() {
        synchronized (LocalTranslate.class) {
            for (Long h : LOADED.values()) NativeEngine.translatorFree(h);
            LOADED.clear();
        }
    }

    /** Returns the translated String, an Integer error code, or null on failure. */
    private static Object run(String text, String from, String to) {
        if (text == null || text.trim().isEmpty()) return "";
        if (from.equals(to)) return text;
        if (!NativeEngine.load()) return ERROR_UNAVAILABLE;
        Set<String> models = installed();
        if (models.contains(from + "-" + to)) return translateWith(from, to, text);
        if (!from.equals("en") && !to.equals("en") && models.contains(from + "-en") && models.contains("en-" + to)) {
            String mid = translateWith(from, "en", text);
            return mid == null ? null : translateWith("en", to, mid);
        }
        return ERROR_UNAVAILABLE;
    }

    private static String translateWith(String from, String to, String text) {
        long h = handle(from + "-" + to);
        if (h == 0) return null;
        // slimt translates paragraph by paragraph; keep line breaks.
        StringBuilder out = new StringBuilder();
        String[] lines = text.split("\n", -1);
        for (int i = 0; i < lines.length; i++) {
            if (i > 0) out.append('\n');
            if (lines[i].trim().isEmpty()) {
                out.append(lines[i]);
                continue;
            }
            String t = NativeEngine.translate(h, lines[i]);
            if (t == null) return null;
            out.append(t.trim());
        }
        return out.toString();
    }

    private static synchronized long handle(String pair) {
        Long h = LOADED.get(pair);
        if (h != null) return h;
        String[] files = modelFiles(new File(Models.translateDir(), pair));
        if (files == null) return 0;
        long created = NativeEngine.translatorInit(files[0], files[1], files[2]);
        if (created == 0) return 0;
        LOADED.put(pair, created);
        if (LOADED.size() > MAX_LOADED) {
            String eldest = LOADED.keySet().iterator().next();
            NativeEngine.translatorFree(LOADED.remove(eldest));
        }
        return created;
    }

    /** Script-based guess for "detect language" (no Google language-ID service available). */
    static String guessLanguage(String text) {
        int[] counts = new int[8];
        for (int i = 0; i < text.length(); ) {
            int cp = text.codePointAt(i);
            i += Character.charCount(cp);
            Character.UnicodeScript sc;
            try {
                sc = Character.UnicodeScript.of(cp);
            } catch (Throwable t) {
                continue;
            }
            switch (sc) {
                case HEBREW: counts[0]++; break;
                case ARABIC: counts[1]++; break;
                case CYRILLIC: counts[2]++; break;
                case HAN: counts[3]++; break;
                case HIRAGANA:
                case KATAKANA: counts[4]++; break;
                case HANGUL: counts[5]++; break;
                case GREEK: counts[6]++; break;
                case THAI: counts[7]++; break;
                default: break;
            }
        }
        String[] langs = {"he", "ar", "ru", "zh-Hans", "ja", "ko", "el", "th"};
        int best = -1;
        for (int i = 0; i < counts.length; i++) if (counts[i] > 0 && (best < 0 || counts[i] > counts[best])) best = i;
        if (best == 4 || (best == 3 && counts[4] > 0)) return "ja";
        return best < 0 ? "en" : langs[best];
    }

    private static List<String> stringFields(Object o) {
        List<String> out = new ArrayList<>();
        for (Field f : o.getClass().getDeclaredFields()) {
            if (f.getType() != String.class || Modifier.isStatic(f.getModifiers())) continue;
            try {
                f.setAccessible(true);
                out.add((String) f.get(o));
            } catch (Throwable ignored) {
            }
        }
        return out;
    }

    private static Method singleMethod(Class<?> iface) {
        Method found = null;
        for (Method m : iface.getMethods()) {
            if (!Modifier.isAbstract(m.getModifiers())) continue;
            if (found != null) return null;
            found = m;
        }
        return found;
    }

    private static void callSingle(Class<?> iface, Object callback, Object... args) {
        try {
            Method m = singleMethod(iface);
            if (m != null) {
                m.setAccessible(true);
                m.invoke(callback, args);
            }
        } catch (Throwable t) {
            Log.e(TAG, "callback failed", t);
        }
    }

    /** Builds Gboard's result object: (String) = success, (int) = error code. */
    private static void deliver(Class<?> iface, Object callback, Object result) {
        try {
            Method m = singleMethod(iface);
            if (m == null || m.getParameterTypes().length != 1) return;
            Class<?> resultClass = m.getParameterTypes()[0];
            Object value;
            if (result instanceof String) {
                Constructor<?> c = resultClass.getDeclaredConstructor(String.class);
                c.setAccessible(true);
                value = c.newInstance(result);
            } else {
                int code = result instanceof Integer ? (Integer) result : ERROR_FAILED;
                Constructor<?> c = resultClass.getDeclaredConstructor(int.class);
                c.setAccessible(true);
                value = c.newInstance(code);
            }
            m.setAccessible(true);
            m.invoke(callback, value);
        } catch (Throwable t) {
            Log.e(TAG, "deliver failed", t);
        }
    }

    /** Gboard / Google Translate code -> Firefox Translations code. */
    static String toModelCode(String code) {
        if (code == null) return null;
        switch (code) {
            case "iw": return "he";
            case "in": return "id";
            case "no": return "nb";
            case "zh":
            case "zh-CN": return "zh-Hans";
            case "zh-TW": return "zh-Hant";
            case "fil": return "tl";
            default: return code;
        }
    }

    /** Firefox Translations code -> code Gboard's translate UI uses. */
    static String toGboardCode(String code) {
        switch (code) {
            case "he": return "iw";
            case "nb": return "no";
            case "zh-Hans": return "zh-CN";
            case "zh-Hant": return "zh-TW";
            default: return code;
        }
    }
}

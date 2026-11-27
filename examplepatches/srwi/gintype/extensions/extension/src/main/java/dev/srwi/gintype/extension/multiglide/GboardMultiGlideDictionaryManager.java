package dev.srwi.gintype.extension.multiglide;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.UserDictionary;
import android.util.Log;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;

/**
 * Manages MultiGlide prefix Tries and BigramTables extracted at runtime directly from
 * Gboard's installed/downloaded Delight5 {@code .lm} language models, layered with
 * Android's UserDictionary and per-session committed words.
 */
public final class GboardMultiGlideDictionaryManager {

    private static final String TAG = "GboardMultiGlideDict";
    private static final long MISS_RETRY_COOLDOWN_MS = 1500L;
    private static final long REFRESH_PROBE_INTERVAL_MS = 10_000L;
    private static final int MAX_DIR_SCAN_DEPTH = 5;
    static final int MAX_ACTIVE_LANGUAGES = 4;

    public static final class LanguagePack {
        public final String lang;
        public final MultiGlideTrie trie;
        public final MultiGlideBigramTable bigrams;
        public final boolean hasDedicatedUmlauts;
        public final String sourcePath;
        public final long sourceLastModified;
        public final long sourceLength;
        public final java.util.concurrent.locks.ReentrantReadWriteLock rwLock =
                new java.util.concurrent.locks.ReentrantReadWriteLock();

        public LanguagePack(String lang, MultiGlideTrie trie, MultiGlideBigramTable bigrams) {
            this(lang, trie, bigrams, false, "", 0L, 0L);
        }

        public LanguagePack(
                String lang,
                MultiGlideTrie trie,
                MultiGlideBigramTable bigrams,
                boolean hasDedicatedUmlauts,
                String sourcePath,
                long sourceLastModified,
                long sourceLength
        ) {
            this.lang = lang;
            this.trie = trie;
            this.bigrams = bigrams;
            this.hasDedicatedUmlauts = hasDedicatedUmlauts;
            this.sourcePath = sourcePath != null ? sourcePath : "";
            this.sourceLastModified = sourceLastModified;
            this.sourceLength = sourceLength;
        }

        boolean matches(File file, boolean umlauts) {
            if (this.hasDedicatedUmlauts != umlauts || file == null) {
                return false;
            }
            return this.sourcePath.equals(file.getAbsolutePath())
                    && this.sourceLastModified == file.lastModified()
                    && this.sourceLength == file.length();
        }
    }

    private static final String DELIGHT5_FACILITATOR_CLASS =
            "com.google.android.apps.inputmethod.libs.delight5.Delight5Facilitator";

    private static final Map<String, LanguagePack> PACKS = new ConcurrentHashMap<>();
    private static final Map<String, FutureTask<LanguagePack>> IN_FLIGHT = new ConcurrentHashMap<>();
    private static final Map<String, Long> LAST_MISS_MS = new ConcurrentHashMap<>();
    private static final Map<String, Long> LAST_REFRESH_PROBE_MS = new ConcurrentHashMap<>();
    private static final Map<String, Integer> COMMIT_COUNTS = new ConcurrentHashMap<>();
    private static final Object REFLECTION_LOCK = new Object();
    private static final ExecutorService LOADER_EXECUTOR = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "GboardMultiGlideDictLoader");
        t.setDaemon(true);
        return t;
    });

    private static volatile Method getFacilitatorNoArgMethod;
    private static volatile Method getFacilitatorContextMethod;
    private static volatile Method getLocaleMethod;
    private static volatile Field facilitatorLocaleListField;
    private static volatile List<Method> facilitatorLmListMethods;
    private static volatile Field lmDescFileField;
    private static volatile Field lmDescLangField;
    private static volatile Field lmDescTypeField;
    private static volatile boolean reflectionProbed = false;

    private GboardMultiGlideDictionaryManager() {}

    public static String detectActiveLanguage(Context context) {
        List<String> langs = detectActiveLanguages(context);
        return langs.isEmpty() ? "de" : langs.get(0);
    }

    /**
     * Detects all active Gboard languages in priority order (primary language first, followed by
     * secondary multilingual languages from {@code Delight5Facilitator}'s active locale list and
     * loaded {@code MAIN} LM descriptors), deduplicated and capped at {@link #MAX_ACTIVE_LANGUAGES}.
     */
    public static List<String> detectActiveLanguages(Context context) {
        List<String> out = new ArrayList<>(MAX_ACTIVE_LANGUAGES);
        try {
            Object facilitator = getDelight5Facilitator(context);
            if (facilitator != null) {
                if (getLocaleMethod != null) {
                    Object localeObj = getLocaleMethod.invoke(facilitator);
                    if (localeObj instanceof Locale) {
                        addNormalizedLanguage(out, ((Locale) localeObj).getLanguage());
                    }
                }
                collectActiveLocalesFromFacilitatorField(facilitator, out);
                collectMainLmLanguagesFromFacilitator(facilitator, out);
            }
        } catch (Throwable ignored) {
        }
        if (out.isEmpty()) {
            try {
                Locale def = Locale.getDefault();
                if (def != null) {
                    addNormalizedLanguage(out, def.getLanguage());
                }
            } catch (Throwable ignored) {
            }
        }
        if (out.isEmpty()) {
            out.add("de");
        }
        return out;
    }

    private static void addNormalizedLanguage(List<String> out, String rawLang) {
        if (rawLang == null || rawLang.trim().isEmpty() || out.size() >= MAX_ACTIVE_LANGUAGES) {
            return;
        }
        String norm = normalizeLanguageKey(rawLang);
        if (!out.contains(norm)) {
            out.add(norm);
        }
    }

    private static void collectActiveLocalesFromFacilitatorField(Object facilitator, List<String> out) {
        try {
            Field f = facilitatorLocaleListField;
            if (f == null) {
                f = findLocaleListField(facilitator);
                if (f != null) {
                    facilitatorLocaleListField = f;
                }
            }
            if (f == null) return;
            Object val = f.get(facilitator);
            if (val instanceof List<?>) {
                List<?> list = (List<?>) val;
                for (int i = 0; i < list.size() && out.size() < MAX_ACTIVE_LANGUAGES; i++) {
                    Object item = list.get(i);
                    if (item instanceof Locale) {
                        addNormalizedLanguage(out, ((Locale) item).getLanguage());
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static Field findLocaleListField(Object facilitator) {
        if (facilitator == null) return null;
        try {
            Field sField = facilitator.getClass().getDeclaredField("s");
            if (!Modifier.isStatic(sField.getModifiers()) && List.class.isAssignableFrom(sField.getType())) {
                sField.setAccessible(true);
                Object val = sField.get(facilitator);
                if (isLocaleList(val)) {
                    return sField;
                }
            }
        } catch (Throwable ignored) {
        }
        for (Field f : facilitator.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(f.getModifiers()) || !List.class.isAssignableFrom(f.getType())) {
                continue;
            }
            try {
                f.setAccessible(true);
                Object val = f.get(facilitator);
                if (isLocaleList(val)) {
                    return f;
                }
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static boolean isLocaleList(Object val) {
        if (!(val instanceof List<?>)) return false;
        List<?> list = (List<?>) val;
        return !list.isEmpty() && list.get(0) instanceof Locale;
    }

    private static void collectMainLmLanguagesFromFacilitator(Object facilitator, List<String> out) {
        List<Method> methods = facilitatorLmListMethods;
        if (methods == null || out.size() >= MAX_ACTIVE_LANGUAGES) return;
        for (Method listMethod : methods) {
            Object listObj;
            try {
                listObj = listMethod.invoke(facilitator);
            } catch (Throwable ignored) {
                continue;
            }
            if (!(listObj instanceof List<?>)) continue;
            List<?> descriptors = (List<?>) listObj;
            for (int i = 0; i < descriptors.size() && out.size() < MAX_ACTIVE_LANGUAGES; i++) {
                Object desc = descriptors.get(i);
                if (desc == null) continue;
                Integer type = extractDescriptorType(desc);
                if (type != null && type != 1) continue;
                String descLang = extractDescriptorLanguage(desc);
                if (descLang != null && !descLang.isEmpty()) {
                    File file = extractDescriptorFile(desc);
                    if (file != null && GboardLmReader.isLmFile(file)) {
                        addNormalizedLanguage(out, descLang);
                    }
                }
            }
        }
    }

    public static List<LanguagePack> getOrScheduleLoads(
            Context context,
            List<String> langs,
            boolean hasDedicatedUmlauts
    ) {
        if (langs == null || langs.isEmpty()) {
            return java.util.Collections.emptyList();
        }
        List<LanguagePack> ready = new ArrayList<>(langs.size());
        for (int i = 0; i < langs.size(); i++) {
            LanguagePack pack = getOrScheduleLoad(context, langs.get(i), hasDedicatedUmlauts);
            if (pack != null) {
                ready.add(pack);
            }
        }
        return ready;
    }

    public static List<LanguagePack> getLoadedIfReady(List<String> langs, boolean hasDedicatedUmlauts) {
        if (langs == null || langs.isEmpty()) {
            return java.util.Collections.emptyList();
        }
        List<LanguagePack> ready = new ArrayList<>(langs.size());
        for (int i = 0; i < langs.size(); i++) {
            LanguagePack pack = getLoadedIfReady(langs.get(i), hasDedicatedUmlauts);
            if (pack != null) {
                ready.add(pack);
            }
        }
        return ready;
    }

    public static List<LanguagePack> loadBlockingIfNeeded(
            Context context,
            List<String> langs,
            boolean hasDedicatedUmlauts
    ) {
        if (langs == null || langs.isEmpty()) {
            return java.util.Collections.emptyList();
        }
        List<LanguagePack> ready = new ArrayList<>(langs.size());
        for (int i = 0; i < langs.size(); i++) {
            String lang = langs.get(i);
            // Block (within UI timeout) only for the primary language; schedule secondary packs
            // asynchronously so multilingual decoding never stalls the UI thread.
            LanguagePack pack = (i == 0)
                    ? loadBlockingIfNeeded(context, lang, hasDedicatedUmlauts)
                    : getOrScheduleLoad(context, lang, hasDedicatedUmlauts);
            if (pack != null) {
                ready.add(pack);
            }
        }
        return ready;
    }

    public static LanguagePack getOrScheduleLoad(Context context, String lang, boolean hasDedicatedUmlauts) {
        String key = normalizeLanguageKey(lang);
        LanguagePack existing = PACKS.get(key);
        long now = System.currentTimeMillis();

        if (existing != null && existing.hasDedicatedUmlauts == hasDedicatedUmlauts) {
            if (context != null) {
                Long lastProbe = LAST_REFRESH_PROBE_MS.get(key);
                if (lastProbe == null || now - lastProbe >= REFRESH_PROBE_INTERVAL_MS) {
                    LAST_REFRESH_PROBE_MS.put(key, now);
                    Context appContext = context.getApplicationContext() != null
                            ? context.getApplicationContext()
                            : context;
                    scheduleLoadTask(appContext, key, hasDedicatedUmlauts, true);
                }
            }
            return existing;
        }

        if (existing == null) {
            Long lastMiss = LAST_MISS_MS.get(key);
            if (lastMiss != null && now - lastMiss < MISS_RETRY_COOLDOWN_MS) {
                return null;
            }
        }

        if (context == null) return existing;

        Context appContext = context.getApplicationContext() != null
                ? context.getApplicationContext()
                : context;
        scheduleLoadTask(appContext, key, hasDedicatedUmlauts, false);
        return existing;
    }

    public static LanguagePack getLoadedIfReady(String lang, boolean hasDedicatedUmlauts) {
        String key = normalizeLanguageKey(lang);
        LanguagePack existing = PACKS.get(key);
        if (existing != null && existing.hasDedicatedUmlauts == hasDedicatedUmlauts) {
            return existing;
        }
        return null;
    }

    public static LanguagePack loadBlockingIfNeeded(Context context, String lang, boolean hasDedicatedUmlauts) {
        String key = normalizeLanguageKey(lang);
        LanguagePack existing = PACKS.get(key);
        if (existing != null && existing.hasDedicatedUmlauts == hasDedicatedUmlauts) {
            return existing;
        }
        if (context == null) return existing;

        Long lastMiss = LAST_MISS_MS.get(key);
        if (existing == null && lastMiss != null && System.currentTimeMillis() - lastMiss < MISS_RETRY_COOLDOWN_MS) {
            return null;
        }

        Context appContext = context.getApplicationContext() != null
                ? context.getApplicationContext()
                : context;
        FutureTask<LanguagePack> task = scheduleLoadTask(appContext, key, hasDedicatedUmlauts, false);
        try {
            LanguagePack loaded = isMainThread()
                    ? task.get(UI_THREAD_LOAD_TIMEOUT_MS, java.util.concurrent.TimeUnit.MILLISECONDS)
                    : task.get();
            if (loaded != null) {
                return loaded;
            }
        } catch (java.util.concurrent.TimeoutException e) {
            Log.w(TAG, "Timed out waiting " + UI_THREAD_LOAD_TIMEOUT_MS
                    + "ms on UI thread for Gboard LM load (" + key + "); continuing asynchronously");
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        } catch (ExecutionException e) {
            Log.w(TAG, "Blocking Gboard LM load failed for " + key, e.getCause());
        }
        LanguagePack current = PACKS.get(key);
        if (current != null && current.hasDedicatedUmlauts == hasDedicatedUmlauts) {
            return current;
        }
        return existing;
    }

    private static final long UI_THREAD_LOAD_TIMEOUT_MS = 150L;

    private static boolean isMainThread() {
        try {
            android.os.Looper main = android.os.Looper.getMainLooper();
            return main != null && android.os.Looper.myLooper() == main;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static FutureTask<LanguagePack> scheduleLoadTask(
            Context appContext,
            String key,
            boolean hasDedicatedUmlauts,
            boolean onlyIfFileChanged
    ) {
        String requestKey = key + "|" + (hasDedicatedUmlauts ? '1' : '0');
        FutureTask<LanguagePack> existingTask = IN_FLIGHT.get(requestKey);
        if (existingTask != null) {
            return existingTask;
        }

        final FutureTask<LanguagePack>[] holder = new FutureTask[1];
        FutureTask<LanguagePack> task = new FutureTask<>(() -> {
            try {
                LanguagePack current = PACKS.get(key);
                if (onlyIfFileChanged && current != null && current.hasDedicatedUmlauts == hasDedicatedUmlauts) {
                    File liveLm = resolveLmFile(appContext, key);
                    if (liveLm == null || current.matches(liveLm, hasDedicatedUmlauts)) {
                        return current;
                    }
                } else if (!onlyIfFileChanged && current != null && current.hasDedicatedUmlauts == hasDedicatedUmlauts) {
                    return current;
                }

                LanguagePack loaded = buildLanguagePack(appContext, key, hasDedicatedUmlauts);
                if (loaded != null) {
                    PACKS.put(key, loaded);
                    LAST_MISS_MS.remove(key);
                    LAST_REFRESH_PROBE_MS.put(key, System.currentTimeMillis());
                    return loaded;
                }
                LAST_MISS_MS.put(key, System.currentTimeMillis());
                return PACKS.get(key);
            } catch (Throwable t) {
                LAST_MISS_MS.put(key, System.currentTimeMillis());
                Log.w(TAG, "Gboard LM load failed for " + key, t);
                return PACKS.get(key);
            } finally {
                IN_FLIGHT.remove(requestKey, holder[0]);
            }
        });
        holder[0] = task;

        FutureTask<LanguagePack> raced = IN_FLIGHT.putIfAbsent(requestKey, task);
        if (raced != null) {
            return raced;
        }
        LOADER_EXECUTOR.execute(task);
        return task;
    }

    private static LanguagePack buildLanguagePack(
            Context context,
            String key,
            boolean hasDedicatedUmlauts
    ) throws IOException {
        File lmFile = resolveLmFile(context, key);
        if (lmFile == null) {
            return null;
        }
        long startNs = System.nanoTime();
        GboardLmReader.LmDictionaries dicts = GboardLmReader.read(lmFile, key, hasDedicatedUmlauts);
        loadUserDictionaryIntoTrie(context, dicts.trie, key, hasDedicatedUmlauts);
        applyRecordedCommits(dicts.trie, key, hasDedicatedUmlauts);
        long elapsedMs = (System.nanoTime() - startNs) / 1_000_000L;
        Log.i(TAG, "Loaded Gboard LM for '" + key + "' from " + lmFile.getName()
                + " in " + elapsedMs + " ms (words=" + dicts.cleanWordCount
                + ", compounds=" + dicts.compoundWordCount
                + ", bigrams=" + dicts.bigramCount + ")");
        return new LanguagePack(
                key,
                dicts.trie,
                dicts.bigrams,
                hasDedicatedUmlauts,
                lmFile.getAbsolutePath(),
                lmFile.lastModified(),
                lmFile.length());
    }

    private static File resolveLmFile(Context context, String langKey) {
        if (context == null) return null;

        // 1. Primary: query Delight5Facilitator's live loaded main LM descriptors.
        File fromFacilitator = findLmFromFacilitator(context, langKey);
        if (fromFacilitator != null) {
            return fromFacilitator;
        }

        // 2. Fallback: scan Gboard app storage (superpacks / delight) for an unpacked main .lm.
        return scanDiskForMainLm(context, langKey);
    }

    private static File findLmFromFacilitator(Context context, String langKey) {
        try {
            Object facilitator = getDelight5Facilitator(context);
            if (facilitator == null || facilitatorLmListMethods == null) {
                return null;
            }
            for (Method listMethod : facilitatorLmListMethods) {
                Object listObj;
                try {
                    listObj = listMethod.invoke(facilitator);
                } catch (Throwable ignored) {
                    continue;
                }
                if (!(listObj instanceof List<?>)) continue;
                List<?> descriptors = (List<?>) listObj;
                File match = pickMatchingDescriptorFile(descriptors, langKey);
                if (match != null) {
                    return match;
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static File pickMatchingDescriptorFile(List<?> descriptors, String langKey) {
        if (descriptors == null || descriptors.isEmpty()) return null;
        File fallbackAnyMainLm = null;
        for (Object desc : descriptors) {
            if (desc == null) continue;
            File file = extractDescriptorFile(desc);
            if (file == null || !GboardLmReader.isLmFile(file)) {
                continue;
            }
            Integer type = extractDescriptorType(desc);
            // Type 1 == Lyxi.MAIN; ignore user history / contacts / shortcuts if present.
            if (type != null && type != 1) {
                continue;
            }
            String descLang = extractDescriptorLanguage(desc);
            if (languageMatches(descLang, langKey) || filenameMatchesLanguage(file.getName(), langKey)) {
                return file;
            }
            if (fallbackAnyMainLm == null && descLang == null) {
                fallbackAnyMainLm = file;
            }
        }
        return fallbackAnyMainLm;
    }

    private static File extractDescriptorFile(Object desc) {
        try {
            Field cached = lmDescFileField;
            if (cached != null && cached.getDeclaringClass().isInstance(desc)) {
                Object v = cached.get(desc);
                if (v instanceof String) {
                    File f = new File((String) v);
                    if (f.isFile()) return f;
                }
            }
            for (Field f : desc.getClass().getDeclaredFields()) {
                if (f.getType() != String.class || Modifier.isStatic(f.getModifiers())) continue;
                f.setAccessible(true);
                Object val = f.get(desc);
                if (!(val instanceof String)) continue;
                String s = (String) val;
                if (s.startsWith("/")) {
                    File file = new File(s);
                    if (file.isFile()) {
                        lmDescFileField = f;
                        return file;
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static String extractDescriptorLanguage(Object desc) {
        try {
            Field cached = lmDescLangField;
            if (cached != null && cached.getDeclaringClass().isInstance(desc)) {
                Object v = cached.get(desc);
                if (v instanceof String && !((String) v).isEmpty()) {
                    return (String) v;
                }
            }
            // In Lyxj proto: fields are (f=path, i=language, j=country). Pick shortest lowercase tag [2..3] chars or BCP47 tag.
            String candidate = null;
            Field candidateField = null;
            for (Field f : desc.getClass().getDeclaredFields()) {
                if (f.getType() != String.class || Modifier.isStatic(f.getModifiers())) continue;
                f.setAccessible(true);
                Object val = f.get(desc);
                if (!(val instanceof String)) continue;
                String s = (String) val;
                if (s.isEmpty() || s.startsWith("/")) continue;
                boolean allLower = true;
                for (int i = 0; i < s.length(); i++) {
                    char c = s.charAt(i);
                    if (!(c >= 'a' && c <= 'z') && c != '-') {
                        allLower = false;
                        break;
                    }
                }
                if (allLower && s.length() >= 2 && s.length() <= 8) {
                    candidate = s;
                    candidateField = f;
                    break;
                }
            }
            if (candidateField != null) {
                lmDescLangField = candidateField;
            }
            return candidate;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Integer extractDescriptorType(Object desc) {
        try {
            Field cached = lmDescTypeField;
            if (cached != null && cached.getDeclaringClass().isInstance(desc)) {
                return cached.getInt(desc);
            }
            // Prefer int field equal to 1 when path exists, or inspect named 'e' as hint.
            Field fallbackField = null;
            for (Field f : desc.getClass().getDeclaredFields()) {
                if (f.getType() != int.class || Modifier.isStatic(f.getModifiers())) continue;
                f.setAccessible(true);
                if ("e".equals(f.getName())) {
                    lmDescTypeField = f;
                    return f.getInt(desc);
                }
                int v = f.getInt(desc);
                if (v >= 1 && v <= 20 && !"b".equals(f.getName()) && !"c".equals(f.getName())) {
                    fallbackField = f;
                }
            }
            if (fallbackField != null) {
                lmDescTypeField = fallbackField;
                return fallbackField.getInt(desc);
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static File scanDiskForMainLm(Context context, String langKey) {
        List<File> roots = new ArrayList<>(6);
        File filesDir = context.getFilesDir();
        if (filesDir != null) {
            roots.add(new File(filesDir, "superpacks"));
            roots.add(new File(filesDir, "delight"));
            roots.add(new File(filesDir, "delight5"));
            roots.add(filesDir);
        }
        try {
            File noBackup = context.getNoBackupFilesDir();
            if (noBackup != null) {
                roots.add(noBackup);
            }
        } catch (Throwable ignored) {
        }

        File bestExact = null;
        for (File root : roots) {
            if (root == null || !root.isDirectory()) continue;
            Deque<File> stack = new ArrayDeque<>();
            Deque<Integer> depths = new ArrayDeque<>();
            stack.push(root);
            depths.push(0);
            while (!stack.isEmpty()) {
                File dir = stack.pop();
                int depth = depths.pop();
                File[] children = dir.listFiles();
                if (children == null) continue;
                for (File child : children) {
                    if (child.isDirectory()) {
                        if (depth < MAX_DIR_SCAN_DEPTH) {
                            String dn = child.getName().toLowerCase(Locale.ROOT);
                            if (dn.contains("delight") || dn.contains("superpacks") || depth < 2
                                    || dn.contains("lm") || dn.contains("fst") || dn.contains("lang")) {
                                stack.push(child);
                                depths.push(depth + 1);
                            }
                        }
                    } else if (child.isFile()) {
                        String name = child.getName().toLowerCase(Locale.ROOT);
                        if (!name.endsWith(".lm") && !name.contains("main")) continue;
                        if (name.contains("userhistory") || name.contains("contacts")
                                || name.contains("shortcut") || name.contains("blocklist")) {
                            continue;
                        }
                        if (child.length() < 100_000L || !GboardLmReader.isLmFile(child)) {
                            continue;
                        }
                        if (filenameMatchesLanguage(name, langKey)) {
                            if (bestExact == null || child.lastModified() > bestExact.lastModified()) {
                                bestExact = child;
                            }
                        }
                    }
                }
            }
            if (bestExact != null) {
                return bestExact;
            }
        }
        return null;
    }

    private static boolean languageMatches(String candidate, String targetKey) {
        if (candidate == null || candidate.isEmpty()) return false;
        String norm = normalizeLanguageKey(candidate);
        return targetKey.equals(norm);
    }

    private static boolean filenameMatchesLanguage(String filename, String targetKey) {
        String lower = filename.toLowerCase(Locale.ROOT);
        return lower.startsWith(targetKey + "-")
                || lower.startsWith(targetKey + "_")
                || lower.contains("/" + targetKey + "-")
                || lower.contains("/" + targetKey + "_")
                || lower.contains("-" + targetKey + "-")
                || lower.contains("_" + targetKey + "_");
    }

    private static void applyRecordedCommits(MultiGlideTrie trie, String key, boolean hasDedicatedUmlauts) {
        String prefix = key + "|";
        for (Map.Entry<String, Integer> entry : COMMIT_COUNTS.entrySet()) {
            if (!entry.getKey().startsWith(prefix)) continue;
            if (entry.getValue() < KineticaConstants.PERSONAL_MERGE_MIN_COUNT) continue;
            String word = entry.getKey().substring(prefix.length());
            int existingFreq = trie.lookupFrequency(word);
            int freqByte = Math.min(255, Math.max(128, existingFreq + 8));
            MultiGlideDictionaryLoader.insertWordIntoTrie(
                    trie, word, freqByte, false, key, hasDedicatedUmlauts);
        }
    }

    public static void loadUserDictionaryIntoTrie(Context context, MultiGlideTrie trie, String lang) {
        loadUserDictionaryIntoTrie(context, trie, lang, false);
    }

    public static void loadUserDictionaryIntoTrie(
            Context context,
            MultiGlideTrie trie,
            String lang,
            boolean hasDedicatedUmlauts
    ) {
        if (context == null || trie == null) return;
        String targetKey = normalizeLanguageKey(lang);
        try {
            ContentResolver cr = context.getContentResolver();
            if (cr == null) return;
            Uri uri = UserDictionary.Words.CONTENT_URI;
            String[] projection = new String[] {
                    UserDictionary.Words.WORD,
                    UserDictionary.Words.FREQUENCY,
                    UserDictionary.Words.LOCALE
            };
            try (Cursor cursor = cr.query(uri, projection, null, null, null)) {
                if (cursor != null && cursor.moveToFirst()) {
                    int wordCol = cursor.getColumnIndex(UserDictionary.Words.WORD);
                    int freqCol = cursor.getColumnIndex(UserDictionary.Words.FREQUENCY);
                    int localeCol = cursor.getColumnIndex(UserDictionary.Words.LOCALE);
                    do {
                        String entryLocale = (localeCol >= 0) ? cursor.getString(localeCol) : null;
                        if (entryLocale != null && !entryLocale.trim().isEmpty()
                                && !languageMatches(entryLocale, targetKey)) {
                            continue;
                        }
                        String word = (wordCol >= 0) ? cursor.getString(wordCol) : null;
                        if (word != null && word.length() >= 2) {
                            int rawFreq = (freqCol >= 0) ? cursor.getInt(freqCol) : 128;
                            int freqByte = Math.max(120, Math.min(255, rawFreq > 0 ? rawFreq : 128));
                            boolean isProper = Character.isUpperCase(word.charAt(0));
                            MultiGlideDictionaryLoader.insertWordIntoTrie(
                                    trie, word, freqByte, isProper, lang, hasDedicatedUmlauts);
                        }
                    } while (cursor.moveToNext());
                }
            }
        } catch (Throwable t) {
            Log.w("GboardMultiGlideDict", "UserDictionary query skipped: " + t.getMessage());
        }
    }

    /**
     * Learns a committed word into the active MultiGlideTrie & BigramTable so user-typed
     * vocabulary is immediately available for subsequent 2-finger swipes.
     */
    public static void recordCommittedWord(String prevWord, String committedWord, String lang) {
        if (committedWord == null || committedWord.length() < 2) return;
        String key = normalizeLanguageKey(lang);
        LanguagePack pack = PACKS.get(key);

        String countKey = key + "|" + committedWord.toLowerCase(Locale.ROOT);
        int commits = COMMIT_COUNTS.merge(countKey, 1, Integer::sum);
        if (pack == null) return;

        boolean learnWord = commits >= KineticaConstants.PERSONAL_MERGE_MIN_COUNT;
        boolean learnBigram = prevWord != null && !prevWord.isEmpty();
        if (!learnWord && !learnBigram) return;

        // Perform trie mutation + re-compaction asynchronously on LOADER_EXECUTOR so
        // uncompactForMutation() never blocks the UI thread and the trie stays compacted.
        final LanguagePack targetPack = pack;
        final String targetPrev = prevWord;
        final String targetWord = committedWord;
        final String targetKey = key;
        final boolean doLearnWord = learnWord;
        final boolean doLearnBigram = learnBigram;
        LOADER_EXECUTOR.execute(() -> {
            targetPack.rwLock.writeLock().lock();
            try {
                if (doLearnWord) {
                    int existingFreq = targetPack.trie.lookupFrequency(targetWord);
                    int freqByte = Math.min(255, Math.max(128, existingFreq + 8));
                    MultiGlideDictionaryLoader.insertWordIntoTrie(
                            targetPack.trie, targetWord, freqByte, false, targetKey, targetPack.hasDedicatedUmlauts);
                    targetPack.trie.compact();
                }
                if (doLearnBigram) {
                    targetPack.bigrams.put(targetPrev, targetWord, 50);
                }
            } catch (Throwable t) {
                Log.w(TAG, "Async recordCommittedWord failed: " + t.getMessage());
            } finally {
                targetPack.rwLock.writeLock().unlock();
            }
        });
    }

    static String normalizeLanguageKey(String lang) {
        if (lang == null || lang.trim().isEmpty()) return "de";
        String lower = lang.trim().toLowerCase(Locale.ROOT);
        int sep = lower.indexOf('-');
        if (sep < 0) sep = lower.indexOf('_');
        String base = (sep > 0) ? lower.substring(0, sep) : lower;
        return base.isEmpty() ? "de" : base;
    }

    private static Object getDelight5Facilitator(Context context) {
        probeFacilitatorReflection(context);
        try {
            if (getFacilitatorNoArgMethod != null) {
                Object inst = getFacilitatorNoArgMethod.invoke(null);
                if (inst != null) return inst;
            }
            if (getFacilitatorContextMethod != null && context != null) {
                return getFacilitatorContextMethod.invoke(null, context);
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static void probeFacilitatorReflection(Context context) {
        if (reflectionProbed) return;
        synchronized (REFLECTION_LOCK) {
            if (reflectionProbed) return;
            try {
                ClassLoader cl = context != null
                        ? context.getClassLoader()
                        : GboardMultiGlideDictionaryManager.class.getClassLoader();
                Class<?> cls = Class.forName(DELIGHT5_FACILITATOR_CLASS, false, cl);
                List<Method> lmListMethods = new ArrayList<>();
                for (Method m : cls.getDeclaredMethods()) {
                    int mods = m.getModifiers();
                    if (Modifier.isStatic(mods) && m.getReturnType() == cls) {
                        Class<?>[] params = m.getParameterTypes();
                        if (params.length == 0) {
                            m.setAccessible(true);
                            getFacilitatorNoArgMethod = m;
                        } else if (params.length == 1 && Context.class.isAssignableFrom(params[0])) {
                            m.setAccessible(true);
                            getFacilitatorContextMethod = m;
                        }
                    } else if (!Modifier.isStatic(mods) && m.getParameterCount() == 0) {
                        if (m.getReturnType() == Locale.class) {
                            m.setAccessible(true);
                            getLocaleMethod = m;
                        } else if (List.class.isAssignableFrom(m.getReturnType())) {
                            m.setAccessible(true);
                            lmListMethods.add(m);
                        }
                    }
                }
                facilitatorLmListMethods = lmListMethods;
            } catch (Throwable ignored) {
            } finally {
                reflectionProbed = true;
            }
        }
    }
}

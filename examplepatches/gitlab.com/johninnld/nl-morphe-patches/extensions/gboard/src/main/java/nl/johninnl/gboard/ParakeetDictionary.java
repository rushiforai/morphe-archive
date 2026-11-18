package nl.johninnl.gboard;

import android.content.Context;
import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * Parakeet's use of the Voice dictionary's voice correction list (Gboard's own list, which Rambler
 * also uses): the names and words you add, import or export there, including contact names when
 * Rambler contact names is patched in.
 *
 * <p>The list lives in Gboard's own store. The {@code wired}, {@code readCorrectionList} and
 * {@code addEntries} bodies are placeholders that the Parakeet personal dictionary patch replaces
 * with the calls Gboard's list screen makes; unpatched, Parakeet behaves exactly as before.
 */
public final class ParakeetDictionary {
    private static final String TAG = "MorpheParakeet";
    private static final String KEY_ENABLED = "dictionary";
    private static final String WORDS_FILE = "words.txt";
    private static final String CONTACTS_RUNTIME = "dev.jason.gboardpatches.extension.rambler.GboardRamblerContactsRuntime";

    /** A prepared list and the vocabulary file the recognizer must be loaded with. */
    static final class Prepared {
        final CorrectionDictionary dictionary;
        final File vocab;

        Prepared(CorrectionDictionary dictionary, File vocab) {
            this.dictionary = dictionary;
            this.vocab = vocab;
        }
    }

    private static final Object LOCK = new Object();
    private static List<String> preparedWords;
    private static Prepared prepared;
    private static BpeTokenizer tokenizer;
    private static Set<String> common;
    private static Set<String> frequent;

    private ParakeetDictionary() {}

    // ---- Placeholders, replaced by the patch ----

    /** True once the patch has supplied Gboard's list calls. */
    static boolean wired() {
        return false;
    }

    /** Adds the list's words to {@code words}; false while Gboard's store is not ready. */
    static boolean readCorrectionList(Context context, LinkedHashSet<String> words) {
        return false;
    }

    /** Adds the word of every entry in one of the list's entry lists. */
    static void addEntries(List<?> entries, LinkedHashSet<String> words) {
    }

    // ---- Settings ----

    public static boolean available() {
        try {
            return wired();
        } catch (Throwable t) {
            return false;
        }
    }

    public static boolean enabled(Context context) {
        return ParakeetStore.prefs(context).getBoolean(KEY_ENABLED, true);
    }

    public static void setEnabled(Context context, boolean on) {
        ParakeetStore.prefs(context).edit().putBoolean(KEY_ENABLED, on).apply();
    }

    static File dataDir(Context context) {
        return new File(new File(ParakeetStore.root(context), "dictionary"), "data-" + ParakeetCatalog.DICTIONARY_DATA_VERSION);
    }

    private static File stateDir(Context context) {
        return new File(new File(ParakeetStore.root(context), "dictionary"), "state");
    }

    public static boolean dataInstalled(Context context) {
        File dir = dataDir(context);
        for (ParakeetCatalog.Asset file : ParakeetCatalog.DICTIONARY_FILES) {
            if (!ParakeetStore.verified(new File(dir, file.name), file.size, file.sha256)) return false;
        }
        return true;
    }

    public static long missingDataBytes(Context context) {
        long total = 0;
        File dir = dataDir(context);
        for (ParakeetCatalog.Asset file : ParakeetCatalog.DICTIONARY_FILES) {
            if (!ParakeetStore.verified(new File(dir, file.name), file.size, file.sha256)) total += file.size;
        }
        return total;
    }

    /** True when Parakeet should use the list now. */
    public static boolean usable(Context context) {
        return available() && enabled(context) && dataInstalled(context);
    }

    /** Entry count shown in settings: the last list read, or -1 before the first read. */
    public static int lastWordCount(Context context) {
        List<String> words = savedWords(context);
        return words == null ? -1 : words.size();
    }

    // ---- Voice session ----

    /** Called when a voice session starts: adds new contact names in the background. */
    static void onSessionStart(Context context) {
        if (!usable(context)) return;
        try {
            Class<?> contacts = Class.forName(CONTACTS_RUNTIME);
            Method start = contacts.getMethod("onVoiceTypingStart", Context.class);
            start.invoke(null, context);
        } catch (ClassNotFoundException | NoSuchMethodException e) {
            // Rambler contact names is not patched in.
        } catch (Throwable t) {
            Log.w(TAG, "Adding contact names failed", t);
        }
    }

    /**
     * Reads the list and prepares it for decoding, reusing earlier work when the list is
     * unchanged. Returns null when Parakeet should decode without it. Never throws.
     */
    static Prepared prepare(Context context) {
        try {
            if (!usable(context)) return null;
            List<String> words = readList(context);
            synchronized (LOCK) {
                if (prepared != null && words.equals(preparedWords)) return prepared;
                long start = System.nanoTime();
                loadData(context);
                HotwordVocab vocab = new HotwordVocab(tokenizer);
                CorrectionDictionary dictionary = new CorrectionDictionary(words, common, frequent, tokenizer, vocab);
                File file = null;
                if (!dictionary.isEmpty()) {
                    file = new File(stateDir(context), "bpe-" + digest(dictionary.boosted) + ".vocab");
                    if (!file.isFile()) {
                        mkdirs(stateDir(context));
                        vocab.write(file);
                    }
                    deleteOtherVocabs(context, file);
                }
                prepared = new Prepared(dictionary, file);
                preparedWords = words;
                Log.i(TAG, "Voice correction list: " + dictionary.boosted.size() + " boosted, "
                        + dictionary.ordinary.size() + " ordinary, " + dictionary.unsupported.size() + " unsupported, in "
                        + (System.nanoTime() - start) / 1_000_000 + " ms");
                return prepared;
            }
        } catch (Throwable t) {
            Log.w(TAG, "Voice correction list unavailable", t);
            return null;
        }
    }

    /** Frees the tokenizer and word lists along with the recognizer. */
    static void release() {
        synchronized (LOCK) {
            prepared = null;
            preparedWords = null;
            tokenizer = null;
            common = null;
            frequent = null;
        }
    }

    /** Gboard's list when its store is ready, otherwise the copy saved at the last read. */
    private static List<String> readList(Context context) {
        LinkedHashSet<String> words = new LinkedHashSet<>();
        boolean read;
        try {
            read = readCorrectionList(context, words);
        } catch (Throwable t) {
            Log.w(TAG, "Reading the voice correction list failed", t);
            read = false;
        }
        if (read) {
            List<String> list = new ArrayList<>(words);
            if (!list.equals(savedWords(context))) save(context, list);
            return list;
        }
        List<String> saved = savedWords(context);
        return saved == null ? new ArrayList<String>() : saved;
    }

    private static void loadData(Context context) throws IOException {
        if (tokenizer == null) {
            tokenizer = BpeTokenizer.fromJson(new String(read(new File(dataDir(context), ParakeetCatalog.TOKENIZER.name)),
                    StandardCharsets.UTF_8));
        }
        if (common == null) {
            Set<String> words = new HashSet<>(120_000);
            Set<String> top = new HashSet<>(30_000);
            for (ParakeetCatalog.Asset file : Arrays.asList(ParakeetCatalog.COMMON_DUTCH, ParakeetCatalog.COMMON_ENGLISH)) {
                try (InputStream in = new FileInputStream(new File(dataDir(context), file.name))) {
                    CommonWords.read(in, words, top);
                }
            }
            common = words;
            frequent = top;
        }
    }

    private static List<String> savedWords(Context context) {
        File file = new File(stateDir(context), WORDS_FILE);
        if (!file.isFile()) return null;
        try {
            String text = new String(read(file), StandardCharsets.UTF_8);
            List<String> words = new ArrayList<>();
            for (String line : text.split("\n")) if (!line.isEmpty()) words.add(line);
            return words;
        } catch (IOException e) {
            return null;
        }
    }

    private static void save(Context context, List<String> words) {
        try {
            mkdirs(stateDir(context));
            File file = new File(stateDir(context), WORDS_FILE);
            File partial = new File(file.getPath() + ".part");
            StringBuilder text = new StringBuilder();
            for (String word : words) text.append(word.replace('\n', ' ')).append('\n');
            try (FileOutputStream out = new FileOutputStream(partial)) {
                out.write(text.toString().getBytes(StandardCharsets.UTF_8));
                out.getFD().sync();
            }
            if (!partial.renameTo(file)) throw new IOException("Cannot store " + file.getName());
        } catch (IOException e) {
            Log.w(TAG, "Saving the voice correction list failed", e);
        }
    }

    private static void deleteOtherVocabs(Context context, File keep) {
        File[] files = stateDir(context).listFiles();
        if (files == null) return;
        for (File file : files) {
            if (file.getName().startsWith("bpe-") && !file.equals(keep)) file.delete();
        }
    }

    private static String digest(List<String> words) {
        MessageDigest digest = ParakeetStore.digest();
        digest.update(ParakeetCatalog.DICTIONARY_DATA_VERSION.getBytes(StandardCharsets.UTF_8));
        for (String word : words) {
            digest.update((byte) '\n');
            digest.update(word.getBytes(StandardCharsets.UTF_8));
        }
        return ParakeetStore.hex(digest.digest()).substring(0, 16);
    }

    private static void mkdirs(File dir) throws IOException {
        if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("Cannot create " + dir.getName());
    }

    private static byte[] read(File file) throws IOException {
        try (InputStream in = new FileInputStream(file)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream((int) Math.max(16, file.length()));
            byte[] buffer = new byte[1 << 16];
            for (int n; (n = in.read(buffer)) > 0; ) out.write(buffer, 0, n);
            return out.toByteArray();
        }
    }
}

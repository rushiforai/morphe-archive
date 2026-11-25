package nl.johninnl.gboard;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/**
 * The voice correction list prepared for Parakeet: which entries are boosted while decoding,
 * which ones the sound-alike matcher may propose, and the hotword text sherpa-onnx reads.
 *
 * <p>An entry made only of very frequent words (Vos, Bakker, Visser) is left out of both: the
 * audio cannot tell the name from the word, so boosting it would only change capitals. The wider
 * {@code common} list keeps the matcher and the capital fix away from every ordinary word.
 */
final class CorrectionDictionary {
    static final float BOOST = 2.5f;
    static final float VERIFY_BOOST = 3.0f;
    static final int MAX_ENTRY_LENGTH = 64;
    static final int MAX_ENTRY_WORDS = 6;
    static final int MAX_ENTRIES = 3000;

    /** Entries after cleaning, in list order. */
    final List<String> entries;
    /** Entries boosted in the first decode and offered to the matcher. */
    final List<String> boosted;
    /** Entries skipped because every word is ordinary. */
    final List<String> ordinary;
    /** Entries skipped because Parakeet's vocabulary cannot spell them. */
    final List<String> unsupported;
    final String hotwords;
    final SoundAlike matcher;
    private final Set<String> common;
    private final Set<String> frequent;
    private final Set<String> boostedWords;

    CorrectionDictionary(Collection<String> rawWords, Set<String> common, Set<String> frequent, BpeTokenizer tokenizer,
                         HotwordVocab vocab) {
        this.common = common == null ? Collections.<String>emptySet() : common;
        this.frequent = frequent == null ? this.common : frequent;
        LinkedHashSet<String> cleaned = new LinkedHashSet<>();
        for (String raw : rawWords) {
            String entry = clean(raw);
            if (entry != null && cleaned.size() < MAX_ENTRIES) cleaned.add(entry);
        }
        entries = Collections.unmodifiableList(new ArrayList<>(cleaned));

        List<String> candidates = new ArrayList<>();
        List<String> ordinaryEntries = new ArrayList<>();
        Set<String> words = new LinkedHashSet<>();
        for (String entry : entries) {
            if (allFrequent(entry)) {
                ordinaryEntries.add(entry);
            } else {
                candidates.add(entry);
                Collections.addAll(words, entry.split(" "));
            }
        }
        HotwordVocab.Fit fit = vocab == null ? null : vocab.fit(words);
        List<String> boostedEntries = new ArrayList<>();
        List<String> unsupportedEntries = new ArrayList<>();
        Set<String> spelled = new HashSet<>();
        for (String entry : candidates) {
            boolean ok = tokenizer != null;
            if (ok) for (String word : entry.split(" ")) ok &= fit == null || !fit.unsupported.contains(word);
            if (ok) {
                boostedEntries.add(entry);
                Collections.addAll(spelled, entry.split(" "));
            } else {
                unsupportedEntries.add(entry);
            }
        }
        boosted = Collections.unmodifiableList(boostedEntries);
        ordinary = Collections.unmodifiableList(ordinaryEntries);
        unsupported = Collections.unmodifiableList(unsupportedEntries);
        boostedWords = spelled;
        hotwords = hotwords(boosted, BOOST);
        matcher = new SoundAlike(boosted, this.common);
    }

    boolean isEmpty() {
        return boosted.isEmpty();
    }

    /** sherpa-onnx's per-stream hotword text: one phrase per line ("/"), each with its boost. */
    static String hotwords(Collection<String> phrases, float boost) {
        StringBuilder out = new StringBuilder();
        for (String phrase : phrases) {
            if (out.length() > 0) out.append('/');
            out.append(phrase).append(" :").append(boost);
        }
        return out.toString();
    }

    /**
     * Normalised entry, or null when unusable. Slashes and line breaks would split a hotword and a
     * word starting with a colon would be read as a boost, so those are removed.
     */
    static String clean(String raw) {
        if (raw == null) return null;
        String text = BpeTokenizer.normalize(raw).replace('/', ' ').replace('\n', ' ').replace('\r', ' ').trim();
        StringBuilder out = new StringBuilder();
        int count = 0;
        for (String word : text.split("\\s+")) {
            while (word.startsWith(":")) word = word.substring(1);
            if (word.isEmpty()) continue;
            if (out.length() > 0) out.append(' ');
            out.append(word);
            count++;
        }
        String entry = out.toString();
        if (entry.isEmpty() || entry.length() > MAX_ENTRY_LENGTH || count > MAX_ENTRY_WORDS) return null;
        boolean letter = false;
        for (int i = 0; i < entry.length() && !letter; i++) letter = Character.isLetter(entry.charAt(i));
        if (!letter || entry.contains("@")) return null;
        return entry;
    }

    private boolean allFrequent(String entry) {
        for (String word : entry.split(" ")) {
            if (!frequent.contains(word.toLowerCase(Locale.ROOT))) return false;
        }
        return true;
    }

    /**
     * Undoes a capital the boost added to an ordinary word that merely starts a boosted word, such
     * as "De Timmerman maakt" while "Timmermans" is boosted. Sentence starts and exact boosted
     * words are left alone.
     */
    String restoreOrdinaryCase(String text) {
        if (boostedWords.isEmpty()) return text;
        StringBuilder out = new StringBuilder(text);
        int i = 0;
        while (i < text.length()) {
            if (!Character.isLetter(text.charAt(i))) {
                i++;
                continue;
            }
            int end = i;
            while (end < text.length() && (Character.isLetter(text.charAt(end)) || text.charAt(end) == '\''
                    || text.charAt(end) == '-')) end++;
            String word = text.substring(i, end);
            if (Character.isUpperCase(word.charAt(0)) && !sentenceStart(text, i) && !boostedWords.contains(word)
                    && common.contains(word.toLowerCase(Locale.ROOT)) && prefixOfBoosted(word)) {
                out.setCharAt(i, Character.toLowerCase(word.charAt(0)));
            }
            i = end;
        }
        return out.toString();
    }

    private boolean prefixOfBoosted(String word) {
        for (String boostedWord : boostedWords) {
            if (boostedWord.length() > word.length() && boostedWord.startsWith(word)) return true;
        }
        return false;
    }

    private static boolean sentenceStart(String text, int at) {
        for (int i = at - 1; i >= 0; i--) {
            char c = text.charAt(i);
            if (Character.isWhitespace(c)) continue;
            return c == '.' || c == '!' || c == '?';
        }
        return true;
    }
}

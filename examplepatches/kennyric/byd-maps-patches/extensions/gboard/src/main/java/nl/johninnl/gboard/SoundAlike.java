package nl.johninnl.gboard;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Finds words in a transcript that sound like a dictionary entry but are spelled differently,
 * such as "Oud-Bijland" for Oud-Beijerland or "Prins Hendrik de" for Prins Hendrikkade. It compares
 * Dutch pronunciation keys of one to three neighbouring words with each entry. Ordinary words
 * from the common-word list are never replaced, and nothing here is final: every proposal must
 * still be confirmed by the speech model.
 */
final class SoundAlike {
    static final int MAX_WINDOW = 3;
    private static final Pattern WORD = Pattern.compile("[\\p{L}\\p{M}\\p{N}][\\p{L}\\p{M}\\p{N}'’-]*");
    private static final Pattern DIGIT = Pattern.compile("\\p{N}");

    /** One proposed replacement of {@code text.substring(start, end)}. */
    static final class Proposal {
        final int start;
        final int end;
        final String entry;
        final double similarity;

        Proposal(int start, int end, String entry, double similarity) {
            this.start = start;
            this.end = end;
            this.entry = entry;
            this.similarity = similarity;
        }

        @Override
        public String toString() {
            return start + ".." + end + "→" + entry;
        }
    }

    private static final class Entry {
        final String text;
        final String key;

        Entry(String text, String key) {
            this.text = text;
            this.key = key;
        }
    }

    private final List<Entry> entries = new ArrayList<>();
    private final Set<String> common;

    /** {@code common} holds lower-case ordinary words; entries are matched in the order given. */
    SoundAlike(Collection<String> dictionary, Set<String> common) {
        this.common = common == null ? Collections.<String>emptySet() : common;
        for (String word : dictionary) {
            String key = key(word);
            if (key.length() >= 3) entries.add(new Entry(word, key));
        }
    }

    boolean isEmpty() {
        return entries.isEmpty();
    }

    /** Non-overlapping proposals for {@code text}, left to right. */
    List<Proposal> propose(String text) {
        List<int[]> words = new ArrayList<>();
        Matcher m = WORD.matcher(text);
        while (m.find()) words.add(new int[]{m.start(), m.end()});
        List<Proposal> out = new ArrayList<>();
        int i = 0;
        while (i < words.size()) {
            Proposal chosen = null;
            int chosenWords = 0;
            for (int n = 1; n <= MAX_WINDOW && i + n <= words.size(); n++) {
                if (n > 1 && !joinable(text, words.get(i + n - 2), words.get(i + n - 1))) break;
                int start = words.get(i)[0];
                int end = words.get(i + n - 1)[1];
                String span = text.substring(start, end);
                if (DIGIT.matcher(span).find()) break;
                if (n == 1 && isCommon(span)) continue;
                if (letters(span) < 4) continue;
                Entry entry = best(key(span));
                if (entry == null) continue;
                double sim = similarity(key(span), entry.key);
                if (n > 1) {
                    // The window must not absorb a leading or trailing word that is not part of the match.
                    String tail = text.substring(words.get(i + 1)[0], end);
                    String head = text.substring(start, words.get(i + n - 2)[1]);
                    if (sameMatch(tail, entry, sim) || sameMatch(head, entry, sim)) continue;
                }
                if (chosen == null || sim > chosen.similarity + 0.05) {
                    chosen = new Proposal(start, end, entry.text, sim);
                    chosenWords = n;
                }
            }
            if (chosen != null && !text.substring(chosen.start, chosen.end).equals(chosen.entry)) {
                out.add(chosen);
                i += chosenWords;
            } else {
                i++;
            }
        }
        return out;
    }

    private boolean sameMatch(String part, Entry entry, double sim) {
        if (part.equals(entry.text)) return true;
        Entry match = best(key(part));
        return match == entry && similarity(key(part), entry.key) >= sim - 0.05;
    }

    private static int letters(String text) {
        int count = 0;
        for (int i = 0; i < text.length(); i++) if (Character.isLetter(text.charAt(i))) count++;
        return count;
    }

    private boolean isCommon(String word) {
        return common.contains(word.toLowerCase(Locale.ROOT));
    }

    /** Words are only joined across a plain space, never across punctuation. */
    private static boolean joinable(String text, int[] left, int[] right) {
        return text.substring(left[1], right[0]).equals(" ");
    }

    private Entry best(String key) {
        Entry best = null;
        double bestSim = 0;
        for (Entry entry : entries) {
            if (Math.abs(entry.key.length() - key.length()) > 3) continue;
            double sim = similarity(key, entry.key);
            if (sim >= required(entry.key) && sim > bestSim) {
                best = entry;
                bestSim = sim;
            }
        }
        return best;
    }

    /** Short keys must match exactly; longer ones may differ more. */
    static double required(String key) {
        if (key.length() <= 4) return 1.0;
        if (key.length() <= 6) return 0.8;
        return 0.72;
    }

    static double similarity(String a, String b) {
        int longest = Math.max(Math.max(a.length(), b.length()), 1);
        return 1.0 - (double) levenshtein(a, b) / longest;
    }

    static int levenshtein(String a, String b) {
        int[] previous = new int[b.length() + 1];
        int[] current = new int[b.length() + 1];
        for (int j = 0; j <= b.length(); j++) previous[j] = j;
        for (int i = 1; i <= a.length(); i++) {
            current[0] = i;
            for (int j = 1; j <= b.length(); j++) {
                int cost = a.charAt(i - 1) == b.charAt(j - 1) ? 0 : 1;
                current[j] = Math.min(Math.min(previous[j] + 1, current[j - 1] + 1), previous[j - 1] + cost);
            }
            int[] swap = previous;
            previous = current;
            current = swap;
        }
        return previous[b.length()];
    }

    private static final String[][] SOUNDS = {
            {"sch", "sg"}, {"ij", "ei"}, {"y", "ei"}, {"ae", "a"}, {"aa", "a"}, {"ee", "e"}, {"oo", "o"}, {"uu", "u"},
            {"ph", "f"}, {"th", "t"}, {"ch", "g"}, {"ck", "k"}, {"qu", "kw"}, {"q", "k"}, {"x", "ks"}, {"au", "ou"},
            {"dt", "t"}, {"v", "f"}, {"z", "s"}, {"w", "v"}, {"ea", "i"}, {"oa", "o"},
    };

    /** A rough Dutch pronunciation key: letters only, sound-alike spellings merged. */
    static String key(String text) {
        String s = Normalizer.normalize(text.toLowerCase(Locale.ROOT), Normalizer.Form.NFKD);
        StringBuilder letters = new StringBuilder(s.length());
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c >= 'a' && c <= 'z') letters.append(c);
            else if (Character.isLetter(c) && Character.getType(c) != Character.NON_SPACING_MARK) letters.append(c);
        }
        s = letters.toString();
        for (String[] sound : SOUNDS) s = s.replace(sound[0], sound[1]);
        s = s.replaceAll("c(?=[eiy])", "s").replace('c', 'k');
        s = s.replaceAll("d$", "t");
        s = s.replaceAll("(?<=[^aeiou])h", "");
        s = s.replaceAll("(.)\\1+", "$1");
        return s;
    }
}

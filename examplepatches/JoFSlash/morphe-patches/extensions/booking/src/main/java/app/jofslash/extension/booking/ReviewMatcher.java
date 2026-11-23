package app.jofslash.extension.booking;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Pattern;

/**
 * The Review check keyword matcher: normalises review text and keywords the same way and tests
 * the keyword lists from {@link Strings} (English) and {@link ReviewKeywords} (the other
 * languages) against it. Pure Java, no Android.
 */
final class ReviewMatcher {
    private ReviewMatcher() {
    }

    private static final Pattern MARKS = Pattern.compile("\\p{M}+");
    private static final Pattern NON_WORD = Pattern.compile("[^\\p{L}\\p{N}]+");

    private static final String[] TIER1;
    private static final String[][] TIER2;
    private static final String[] NEGATIONS;

    static {
        int categories = Strings.FLAG_KEYWORDS.length;
        Set<String> tier1 = new LinkedHashSet<>();
        List<Set<String>> tier2 = new ArrayList<>();
        Set<String> negations = new LinkedHashSet<>();
        add(tier1, Strings.FLAG_TIER1_KEYWORDS);
        for (int i = 0; i < categories; i++) {
            Set<String> row = new LinkedHashSet<>();
            add(row, Strings.FLAG_KEYWORDS[i]);
            tier2.add(row);
        }
        add(negations, Strings.FLAG_NEGATIONS);
        for (String[][] language : ReviewKeywords.ALL) {
            add(tier1, language[0]);
            for (int i = 0; i < categories; i++) add(tier2.get(i), language[i + 1]);
            add(negations, language[categories + 1]);
        }
        TIER1 = tier1.toArray(new String[0]);
        TIER2 = new String[categories][];
        for (int i = 0; i < categories; i++) TIER2[i] = tier2.get(i).toArray(new String[0]);
        NEGATIONS = negations.toArray(new String[0]);
    }

    private static void add(Set<String> into, String[] keywords) {
        for (String keyword : keywords) {
            String k = normalize(keyword);
            if (!k.trim().isEmpty()) into.add(k);
        }
    }

    /**
     * Lower case, diacritics stripped (NFD, combining marks removed), ß/ł/ø/œ/æ spelled out,
     * German ae/oe/ue folded to a/o/u (so "Gebühr", "Gebuehr" and "Gebuhr" are the same), and
     * every run of anything that isn't a letter or digit turned into one space. Leading and
     * trailing spaces are kept, so keywords can mark word boundaries.
     */
    static String normalize(String s) {
        if (s == null || s.isEmpty()) return "";
        String t = s.toLowerCase(Locale.ROOT)
                .replace("ß", "ss").replace("ł", "l").replace("ø", "o")
                .replace("œ", "oe").replace("æ", "ae").replace("đ", "d");
        t = Normalizer.normalize(t, Normalizer.Form.NFD);
        t = MARKS.matcher(t).replaceAll("");
        t = t.replace("ae", "a").replace("oe", "o").replace("ue", "u");
        return NON_WORD.matcher(t).replaceAll(" ");
    }

    /** What one review matched. */
    static final class Match {
        /** True when a tier-1 (hard scam / money taken) keyword matched. */
        final boolean tier1;
        /** The tier-1 label (when tier1) followed by the tier-2 category labels. */
        final Set<String> labels;

        Match(boolean tier1, Set<String> labels) {
            this.tier1 = tier1;
            this.labels = labels;
        }
    }

    /** Matches raw review text; returns null when nothing matched. */
    static Match match(String text) {
        String haystack = " " + normalize(text) + " ";
        if (haystack.trim().isEmpty()) return null;
        for (String negation : NEGATIONS) {
            if (haystack.contains(negation)) haystack = haystack.replace(negation, " ");
        }

        boolean tier1 = false;
        for (String keyword : TIER1) {
            if (haystack.contains(keyword)) {
                tier1 = true;
                break;
            }
        }
        Set<String> labels = new LinkedHashSet<>();
        if (tier1) labels.add(Strings.FLAG_TIER1_LABEL); // Tier-1 label leads.
        for (int i = 0; i < TIER2.length; i++) {
            for (String keyword : TIER2[i]) {
                if (haystack.contains(keyword)) {
                    labels.add(Strings.FLAG_LABELS[i]);
                    break;
                }
            }
        }
        return labels.isEmpty() ? null : new Match(tier1, labels);
    }
}

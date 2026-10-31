package app.morphe.extension.sabp.read;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Coarse alignment without speech recognition: matches the audiobook's chapter list (titles and
 * start times from SABP) to the document's headings, keeping both in order. Each confident pair
 * becomes an approximate anchor "this heading starts at this time".
 *
 * <p>Titles are compared by chapter number when both have one ("Chapter 12", "12.", "XII",
 * "Twelve") and by shared words otherwise. Chapter titles that differ between audio and book simply
 * don't pair; they never pair out of order.
 */
public final class ChapterAligner {
    public static final class Pair {
        public final double seconds;
        public final int word;
        public final float score;

        Pair(double seconds, int word, float score) {
            this.seconds = seconds;
            this.word = word;
            this.score = score;
        }
    }

    private ChapterAligner() {
    }

    /**
     * @param audioTitles chapter titles from the audiobook
     * @param audioStarts their start times in seconds (book time)
     */
    public static List<Pair> align(List<String> audioTitles, List<Double> audioStarts, List<BookText.Section> sections) {
        int a = audioTitles.size(), b = sections.size();
        ArrayList<Pair> out = new ArrayList<>();
        if (a == 0 || b == 0) return out;
        // Normalise every title once (was per pair: 2.6 s for a 716 × 760 book in testing).
        Title[] at = new Title[a], st = new Title[b];
        for (int i = 0; i < a; i++) at[i] = new Title(audioTitles.get(i));
        for (int j = 0; j < b; j++) st[j] = new Title(sections.get(j).title);
        float[][] sim = new float[a][b];
        for (int i = 0; i < a; i++) for (int j = 0; j < b; j++) sim[i][j] = similarity(at[i], st[j]);
        // Monotonic best pairing (like sequence alignment with free gaps).
        float[][] dp = new float[a + 1][b + 1];
        for (int i = 1; i <= a; i++) {
            for (int j = 1; j <= b; j++) {
                float match = sim[i - 1][j - 1] >= 0.6f ? dp[i - 1][j - 1] + sim[i - 1][j - 1] : -1f;
                dp[i][j] = Math.max(Math.max(dp[i - 1][j], dp[i][j - 1]), match);
            }
        }
        int i = a, j = b;
        while (i > 0 && j > 0) {
            float s = sim[i - 1][j - 1];
            if (s >= 0.6f && Math.abs(dp[i][j] - (dp[i - 1][j - 1] + s)) < 1e-4f) {
                Double t = audioStarts.get(i - 1);
                if (t != null && t >= 0) out.add(0, new Pair(t, sections.get(j - 1).firstWord, s));
                i--;
                j--;
            } else if (dp[i - 1][j] >= dp[i][j - 1]) {
                i--;
            } else {
                j--;
            }
        }
        return out;
    }

    static final class Title {
        final String norm, kind;
        final Integer number;
        final String[] words;

        Title(String s) {
            norm = norm(s);
            number = norm.isEmpty() ? null : number(norm);
            kind = kind(norm);
            words = norm.split(" ");
        }
    }

    static float similarity(String audio, String doc) {
        return similarity(new Title(audio), new Title(doc));
    }

    static float similarity(Title ta, Title tb) {
        String x = ta.norm, y = tb.norm;
        if (x.isEmpty() || y.isEmpty()) return 0f;
        Integer nx = ta.number, ny = tb.number;
        if (nx != null && ny != null) {
            if (!nx.equals(ny)) return 0f;
            // Same number: strong unless both carry different explicit kinds (Part 2 vs Chapter 2).
            String kx = ta.kind, ky = tb.kind;
            return (kx != null && ky != null && !kx.equals(ky)) ? 0.3f : 0.95f;
        }
        if (x.equals(y)) return 1f;
        String[] wx = ta.words, wy = tb.words;
        int common = 0;
        for (String p : wx) for (String q : wy) if (p.length() > 2 && p.equals(q)) { common++; break; }
        int denom = Math.max(1, Math.min(meaningful(wx), meaningful(wy)));
        return Math.min(1f, common / (float) denom);
    }

    private static int meaningful(String[] w) {
        int n = 0;
        for (String s : w) if (s.length() > 2) n++;
        return n;
    }

    private static String norm(String s) {
        return s.toLowerCase(Locale.ROOT).replaceAll("[^\\p{L}\\p{N} ]", " ").replaceAll("\\s+", " ").trim();
    }

    private static final Pattern KIND = Pattern.compile("\\b(chapter|part|book|section|act)\\b");

    private static String kind(String s) {
        Matcher m = KIND.matcher(s);
        return m.find() ? m.group(1) : null;
    }

    private static final String[] WORDS = {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
            "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty"};

    /** First chapter number in a title: digits, roman numerals or number words (up to twenty). */
    static Integer number(String s) {
        Matcher d = Pattern.compile("\\b(\\d{1,4})\\b").matcher(s);
        if (d.find()) return Integer.parseInt(d.group(1));
        for (String w : s.split(" ")) {
            for (int i = 0; i < WORDS.length; i++) if (WORDS[i].equals(w)) return i;
            if (w.matches("[ivxlcdm]{1,8}") && (s.startsWith(w) || s.matches(".*\\b(chapter|part|book)\\s+" + w + "\\b.*"))) {
                int r = roman(w);
                if (r > 0) return r;
            }
        }
        return null;
    }

    private static int roman(String s) {
        int total = 0, prev = 0;
        for (int i = s.length() - 1; i >= 0; i--) {
            int v;
            switch (s.charAt(i)) {
                case 'i': v = 1; break;
                case 'v': v = 5; break;
                case 'x': v = 10; break;
                case 'l': v = 50; break;
                case 'c': v = 100; break;
                case 'd': v = 500; break;
                case 'm': v = 1000; break;
                default: return -1;
            }
            total += v < prev ? -v : v;
            prev = Math.max(prev, v);
        }
        return total;
    }
}

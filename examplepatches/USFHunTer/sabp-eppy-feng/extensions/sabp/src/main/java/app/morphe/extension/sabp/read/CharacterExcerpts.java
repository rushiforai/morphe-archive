package app.morphe.extension.sabp.read;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.TreeSet;

/**
 * What the book has said about a character so far: paragraphs that mention the name before the
 * listening position, for a suggested note that can't spoil. The first few mentions introduce the
 * character; the latest ones say where things stand.
 */
public final class CharacterExcerpts {
    public static final int FIRST = 4, LAST = 8, MAX_WORDS = 3000;

    private CharacterExcerpts() {
    }

    /** Paragraphs (cut at the position) mentioning the name before word {@code position}, in book order; empty if none. */
    public static List<String> pick(BookText t, String name, int position) {
        String[] want = tokens(name);
        ArrayList<Integer> hits = new ArrayList<>();
        if (want.length == 0 || position <= 0 || t.pagesOnly) return new ArrayList<>();
        for (int p = 0; p < t.paras.size(); p++) {
            BookText.Para para = t.paras.get(p);
            if (para.firstWord >= position) break;
            if (para.wordCount == 0) continue;
            int end = Math.min(para.firstWord + para.wordCount, position);
            if (mentions(t, para.firstWord, end, want)) hits.add(p);
        }
        TreeSet<Integer> chosen = new TreeSet<>();
        for (int i = 0; i < hits.size(); i++) if (i < FIRST || i >= hits.size() - LAST) chosen.add(hits.get(i));
        // Keep the latest paragraphs when cutting to the word cap.
        ArrayList<String> out = new ArrayList<>();
        int words = 0;
        for (int p : chosen.descendingSet()) {
            BookText.Para para = t.paras.get(p);
            boolean cut = para.firstWord + para.wordCount > position;
            String s = cut ? para.text.substring(0, t.wordStart[position]).trim() : para.text;
            int n = cut ? position - para.firstWord : para.wordCount;
            if (words + n > MAX_WORDS && !out.isEmpty()) break;
            out.add(s);
            words += n;
        }
        Collections.reverse(out);
        return out;
    }

    static String[] tokens(String name) {
        ArrayList<String> w = new ArrayList<>();
        for (String s : name.trim().split("\\s+")) {
            String n = BookText.normalize(s);
            if (!n.isEmpty()) w.add(n);
        }
        return w.toArray(new String[0]);
    }

    /** The name's words, in order, somewhere in words [from, end). */
    private static boolean mentions(BookText t, int from, int end, String[] want) {
        for (int i = from; i + want.length <= end; i++) {
            int k = 0;
            while (k < want.length && same(t, i + k, want[k])) k++;
            if (k == want.length) return true;
        }
        return false;
    }

    /** "Mara's" (indexed as "marass") counts as "mara". */
    private static boolean same(BookText t, int w, String want) {
        String got = t.words[w];
        if (got.equals(want)) return true;
        if (!got.equals(want + "s")) return false;
        String raw = t.paras.get(t.wordPara[w]).text.substring(t.wordStart[w], t.wordEnd[w]);
        return raw.contains("'") || raw.contains("’");
    }
}

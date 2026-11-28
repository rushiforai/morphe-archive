package app.morphe.extension.sabp.read;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/** Words picked out of the document: the one under a finger, a character name, a sentence. */
public final class Words {
    private Words() {
    }

    /**
     * Document word at a character offset in paragraph p: the word containing it, else the next
     * word in the paragraph, else its last word. -1 for a paragraph without words.
     */
    public static int at(BookText t, int p, int offset) {
        BookText.Para para = t.paras.get(p);
        if (para.wordCount == 0) return -1;
        int last = para.firstWord + para.wordCount - 1;
        for (int w = para.firstWord; w < last; w++) if (offset < t.wordEnd[w]) return w;
        return last;
    }

    /** The word as written, without a possessive "'s" or a trailing apostrophe. */
    public static String display(BookText t, int w) {
        return clean(raw(t, w));
    }

    /**
     * A character name from a pressed word: a capitalised word grows over the capitalised words right
     * next to it in the same sentence ("Mara Rising Dawn"), not over punctuation or a possessive.
     */
    public static String name(BookText t, int w) {
        if (!capitalised(t, w)) return display(t, w);
        BookText.Para para = t.paras.get(t.wordPara[w]);
        int first = para.firstWord, last = first + para.wordCount - 1;
        int a = w, z = w;
        while (a > first && capitalised(t, a - 1) && joined(t, a - 1) && !possessive(t, a - 1)
                && !NOT_NAMES.contains(t.words[a - 1])) a--;
        while (z < last && !possessive(t, z) && joined(t, z) && capitalised(t, z + 1)) z++;
        return clean(para.text.substring(t.wordStart[a], t.wordEnd[z]));
    }

    /** The sentence word w is in, with its closing punctuation. */
    public static String sentence(BookText t, int w) {
        int[] se = t.sentence(w);
        String s = t.paras.get(t.wordPara[w]).text;
        return s.substring(t.wordStart[se[0]], extendToPunctuation(s, t.wordEnd[se[1]]));
    }

    /** The first n words of a text, with "…" when there's more. */
    public static String opening(String s, int n) {
        String[] w = s.trim().split("\\s+");
        if (w.length <= n) return s.trim();
        return String.join(" ", Arrays.copyOf(w, n)) + "…";
    }

    public static int extendToPunctuation(String s, int to) {
        while (to < s.length() && ".,!?;:”’\"')".indexOf(s.charAt(to)) >= 0) to++;
        return to;
    }

    // Capitalised at a sentence start, but not part of a name.
    private static final Set<String> NOT_NAMES = new HashSet<>(Arrays.asList(
            "the", "a", "an", "and", "but", "or", "so", "then", "when", "as", "if", "he", "she", "it", "they", "we", "i",
            "you", "his", "her", "my", "our", "their", "this", "that"));

    private static String raw(BookText t, int w) {
        return t.paras.get(t.wordPara[w]).text.substring(t.wordStart[w], t.wordEnd[w]);
    }

    private static String clean(String s) {
        if (s.length() > 2 && (s.endsWith("'s") || s.endsWith("’s"))) s = s.substring(0, s.length() - 2);
        while (s.endsWith("'") || s.endsWith("’")) s = s.substring(0, s.length() - 1);
        return s;
    }

    private static boolean capitalised(BookText t, int w) {
        return Character.isUpperCase(raw(t, w).charAt(0));
    }

    private static boolean possessive(BookText t, int w) {
        return !clean(raw(t, w)).equals(raw(t, w));
    }

    /** Only spaces between word w and the next. */
    private static boolean joined(BookText t, int w) {
        String s = t.paras.get(t.wordPara[w]).text;
        return s.substring(t.wordEnd[w], t.wordStart[w + 1]).trim().isEmpty();
    }
}

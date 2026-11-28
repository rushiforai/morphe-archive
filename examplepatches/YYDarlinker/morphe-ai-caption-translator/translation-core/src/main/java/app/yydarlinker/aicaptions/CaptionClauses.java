package app.yydarlinker.aicaptions;

import java.util.ArrayList;
import java.util.List;

/**
 * Punctuation-delimited clauses in UTF-16 offsets. A page may contain several complete clauses,
 * but it may start inside a clause only when that page ends inside the same clause: a long clause
 * is split on its own, never as "previous clause + half of the next one".
 */
final class CaptionClauses {
    private static final String PUNCTUATION = ",，、;；:：.!?。！？…؟।\u060c\u061b\u0964\u0965",
            CLOSING = "\"'”’」』）)]》】";

    private final int[] ends, coreEnds;
    final int length;
    /** Offsets strictly inside a quoted span: a page may not start or end there. */
    private final boolean[] quoted;

    private CaptionClauses(int length, int[] ends, int[] coreEnds, boolean[] quoted) {
        this.length = length;
        this.ends = ends;
        this.coreEnds = coreEnds;
        this.quoted = quoted;
    }

    static CaptionClauses of(String text) {
        String value = text == null ? "" : text;
        int length = value.length();
        List<Integer> found = new ArrayList<>(), cores = new ArrayList<>();
        for (int at = 0; at < length; ) {
            int cp = value.codePointAt(at), next = at + Character.charCount(cp);
            if (!clauseMark(cp) || numberSeparator(value, at, cp)) {
                at = next;
                continue;
            }
            // A punctuation run ("?!", "……") and trailing closing quotes stay with this clause.
            int core = next;
            while (core < length) {
                int following = value.codePointAt(core);
                if (!clauseMark(following)) break;
                core += Character.charCount(following);
            }
            while (core < length) {
                int following = value.codePointAt(core);
                if (!closing(following)) break;
                core += Character.charCount(following);
            }
            int end = core;
            while (end < length && Character.isWhitespace(value.codePointAt(end)))
                end += Character.charCount(value.codePointAt(end));
            if (found.isEmpty() || end > found.get(found.size() - 1)) {
                cores.add(core);
                found.add(end);
            }
            at = Math.max(next, end);
        }
        if (found.isEmpty() || found.get(found.size() - 1) < length) {
            cores.add(length);
            found.add(length);
        }
        int[] ends = new int[found.size()], coreEnds = new int[cores.size()];
        for (int i = 0; i < ends.length; i++) {
            ends[i] = found.get(i);
            coreEnds[i] = cores.get(i);
        }
        return new CaptionClauses(length, ends, coreEnds, quotedSpans(value));
    }

    /** Clause end offsets in ascending order, including the end of the text. */
    int[] ends() {
        return ends.clone();
    }

    static boolean mark(int cp) {
        return clauseMark(cp);
    }

    /** Clause index at [offset]; an exact clause end belongs to the following clause. */
    int index(int offset) {
        int low = 0, high = coreEnds.length;
        while (low < high) {
            int middle = (low + high) >>> 1;
            if (coreEnds[middle] <= offset) low = middle + 1;
            else high = middle;
        }
        return low;
    }

    boolean inside(int offset) {
        return offset > 0 && offset < length && !boundary(offset);
    }

    /** A page boundary never falls between the opening and closing marks of one quotation. */
    boolean insideQuoted(int offset) {
        return offset > 0 && offset < quoted.length && quoted[offset];
    }

    /** True when a page [from,to) does not mix a prefix of one clause with another clause. */
    boolean allows(int from, int to) {
        if (from < 0 || to > length || from >= to) return false;
        if (insideQuoted(from) || to < length && insideQuoted(to)) return false;
        if (to == length) return true;
        if (inside(to)) return index(from) == index(to);
        return !inside(from) || to == ends[index(from)];
    }

    private boolean boundary(int offset) {
        int low = 0, high = coreEnds.length;
        while (low < high) {
            int middle = (low + high) >>> 1;
            if (coreEnds[middle] <= offset) low = middle + 1;
            else high = middle;
        }
        int clause = low - 1;
        return clause >= 0 && offset <= ends[clause];
    }

    private static boolean clauseMark(int cp) {
        return PUNCTUATION.indexOf(cp) >= 0;
    }

    /**
     * Offsets that sit between a quotation's opening and closing mark. A clause separator inside a
     * quotation is not a licence to split the quoted words across two subtitles.
     */
    private static boolean[] quotedSpans(String text) {
        boolean[] inside = new boolean[text.length() + 1];
        int[] open = new int[8];
        int depth = 0;
        for (int at = 0; at < text.length(); ) {
            int cp = text.codePointAt(at);
            int next = at + Character.charCount(cp);
            if (opens(cp)) {
                if (depth < open.length) open[depth++] = at;
            } else if (closes(cp) && depth > 0) {
                int start = open[--depth];
                if (next - 1 > start + 1) java.util.Arrays.fill(inside, start + 1, next, true);
            }
            at = next;
        }
        return inside;
    }

    private static boolean opens(int cp) {
        return cp == 0x201C || cp == 0x300C || cp == 0x300E;
    }

    private static boolean closes(int cp) {
        return cp == 0x201D || cp == 0x300D || cp == 0x300F;
    }

    private static boolean closing(int cp) {
        int type = Character.getType(cp);
        return CLOSING.indexOf(cp) >= 0
                || type == Character.END_PUNCTUATION
                || type == Character.FINAL_QUOTE_PUNCTUATION;
    }

    /** "1,000", "3.14" and "12:30" keep their digits together. */
    private static boolean numberSeparator(String text, int at, int cp) {
        if (cp != ',' && cp != '.' && cp != ':') return false;
        int next = at + Character.charCount(cp);
        return at > 0
                && next < text.length()
                && Character.isDigit(text.codePointBefore(at))
                && Character.isDigit(text.codePointAt(next));
    }
}

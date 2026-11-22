package app.revanced.extension.rif;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The pure (Android-free, unit-tested) part of {@link InlineTables}: cutting a table out of a
 * comment's raw HTML the way rif does, parsing it, finding where rif's flattened version of
 * it sits in the rendered body, and sizing columns.
 *
 * <p>How rif flattens a table (read in code, {@code o5.z}): at {@code <table>} it emits a
 * paragraph break, a heading-styled link line "[View formatted table]" (a
 * {@code /redditisfun-popout-N} link, N = the table's index in the body) and another break; every
 * {@code <tr>} starts with a break and every cell ends with one space; {@code </table>} is a
 * break. Runs of breaks merge and Html collapses whitespace, so only the non-whitespace
 * characters are reliable: {@link #flattenedRange} matches those.
 */
final class TableModel {
    private TableModel() {}

    static final int LEFT = 0;
    static final int CENTER = 1;
    static final int RIGHT = 2;

    /** The placeholder link's text (a literal in rif's {@code o5.z$a.startElement}). */
    static final String LINK_TEXT = "[View formatted table]";
    private static final String POPOUT = "/redditisfun-popout-";

    /** One cell: its inner HTML (unescaped once, as the table's own markup), header or not. */
    static final class Cell {
        final String html;
        final boolean header;
        final int align;

        Cell(String html, boolean header, int align) {
            this.html = html;
            this.header = header;
            this.align = align;
        }
    }

    /** Rows of equal length (short rows are padded with empty cells). */
    static final class Table {
        final List<List<Cell>> rows;
        final int columns;

        Table(List<List<Cell>> rows, int columns) {
            this.rows = rows;
            this.columns = columns;
        }
    }

    /** N of a {@code /redditisfun-popout-N} link, or -1 if the URL isn't one. */
    static int popoutIndex(String url) {
        if (url == null) return -1;
        int at = url.indexOf(POPOUT);
        if (at < 0) return -1;
        int i = at + POPOUT.length();
        int end = i;
        while (end < url.length() && url.charAt(end) >= '0' && url.charAt(end) <= '9' && end - i < 6) end++;
        if (end == i) return -1;
        return Integer.parseInt(url.substring(i, end));
    }

    /**
     * The N-th (0-based) {@code <table ...></table>} of [html], cut the way rif's
     * {@code TablePopoutSpan.g()} does: from the (N+1)-th "<table" through the first
     * "</table>" after it. [escaped]: [html] is HTML-escaped itself, as Reddit's
     * {@code body_html} is, so the markers are "&lt;table" and "&lt;/table&gt;". The result
     * is real HTML (unescaped once). Null if there's no such table.
     */
    static String cutTable(String html, int n, boolean escaped) {
        if (html == null || n < 0) return null;
        String open = escaped ? "&lt;table" : "<table";
        String close = escaped ? "&lt;/table&gt;" : "</table>";
        int from = 0;
        int at = -1;
        for (int i = 0; i <= n; i++) {
            at = html.indexOf(open, from);
            if (at < 0) return null;
            from = at + open.length();
        }
        int end = html.indexOf(close, at);
        if (end < 0) return null;
        String cut = html.substring(at, end + close.length());
        return escaped ? unescape(cut) : cut;
    }

    private static final Pattern ENTITY = Pattern.compile("&(#[0-9]{1,7}|#[xX][0-9a-fA-F]{1,6}|[a-zA-Z]{2,6});");

    /** One level of HTML unescaping: &amp;lt; becomes &lt;, not "<". */
    static String unescape(String s) {
        if (s.indexOf('&') < 0) return s;
        Matcher m = ENTITY.matcher(s);
        StringBuilder out = new StringBuilder(s.length());
        int last = 0;
        while (m.find()) {
            String name = m.group(1);
            String rep = null;
            if (name.charAt(0) == '#') {
                try {
                    int cp = name.charAt(1) == 'x' || name.charAt(1) == 'X'
                            ? Integer.parseInt(name.substring(2), 16) : Integer.parseInt(name.substring(1));
                    if (Character.isValidCodePoint(cp)) rep = new String(Character.toChars(cp));
                } catch (NumberFormatException ignored) {
                }
            } else if (name.equals("lt")) {
                rep = "<";
            } else if (name.equals("gt")) {
                rep = ">";
            } else if (name.equals("amp")) {
                rep = "&";
            } else if (name.equals("quot")) {
                rep = "\"";
            } else if (name.equals("apos")) {
                rep = "'";
            } else if (name.equals("nbsp")) {
                rep = "\u00A0";
            }
            if (rep == null) continue; // leave unknown entities for Html to handle
            out.append(s, last, m.start()).append(rep);
            last = m.end();
        }
        return out.append(s, last, s.length()).toString();
    }

    private static final Pattern ALIGN_ATTR = Pattern.compile(
            "\\balign\\s*=\\s*[\"']?\\s*(left|center|right)", Pattern.CASE_INSENSITIVE);
    private static final Pattern ALIGN_STYLE = Pattern.compile(
            "text-align\\s*:\\s*(left|center|right)", Pattern.CASE_INSENSITIVE);

    /** Alignment from a cell's attributes: style="text-align:x" wins over align="x". */
    static int alignment(String attrs) {
        Matcher m = ALIGN_STYLE.matcher(attrs);
        if (!m.find()) {
            m = ALIGN_ATTR.matcher(attrs);
            if (!m.find()) return LEFT;
        }
        String a = m.group(1).toLowerCase(Locale.ROOT);
        return a.equals("center") ? CENTER : a.equals("right") ? RIGHT : LEFT;
    }

    /** End index of the tag starting at [lt] (the '>'), skipping quoted attribute values; -1 if open. */
    private static int tagEnd(String s, int lt) {
        char quote = 0;
        for (int i = lt + 1; i < s.length(); i++) {
            char c = s.charAt(i);
            if (quote != 0) {
                if (c == quote) quote = 0;
            } else if (c == '"' || c == '\'') {
                quote = c;
            } else if (c == '>') {
                return i;
            }
        }
        return -1;
    }

    /**
     * Parses one {@code <table>} (as cut by {@link #cutTable}). Null if it has no cells or
     * contains a second table (rif's cut would end at the inner one's close, so the range
     * couldn't be trusted).
     */
    static Table parse(String html) {
        if (html == null) return null;
        List<List<Cell>> rows = new ArrayList<>();
        List<Cell> row = null;
        boolean inCell = false;
        boolean header = false;
        int align = LEFT;
        int cellStart = 0;
        int tables = 0;
        int i = 0;
        int n = html.length();
        while (i < n) {
            int lt = html.indexOf('<', i);
            if (lt < 0 || lt + 1 >= n) break;
            if (html.startsWith("<!--", lt)) {
                int end = html.indexOf("-->", lt + 4);
                i = end < 0 ? n : end + 3;
                continue;
            }
            int gt = tagEnd(html, lt);
            if (gt < 0) break;
            int p = lt + 1;
            boolean closing = html.charAt(p) == '/';
            if (closing) p++;
            int nameEnd = p;
            while (nameEnd < gt && Character.isLetterOrDigit(html.charAt(nameEnd))) nameEnd++;
            String name = html.substring(p, nameEnd).toLowerCase(Locale.ROOT);
            i = gt + 1;
            boolean boundary = name.equals("td") || name.equals("th") || name.equals("tr")
                    || name.equals("thead") || name.equals("tbody") || name.equals("tfoot")
                    || name.equals("table");
            if (!boundary) continue; // inline markup stays inside the cell's HTML
            if (name.equals("table")) {
                if (!closing && ++tables > 1) return null;
                if (!closing) continue;
            }
            if (inCell) {
                if (row == null) row = new ArrayList<>();
                row.add(new Cell(html.substring(cellStart, lt).trim(), header, align));
                inCell = false;
            }
            if (name.equals("table")) break; // </table>
            if (name.equals("tr") || name.equals("thead") || name.equals("tbody") || name.equals("tfoot")) {
                if (row != null) rows.add(row);
                row = null;
                if (name.equals("tr") && !closing) row = new ArrayList<>();
            } else if (!closing) { // td, th
                header = name.equals("th");
                align = alignment(html.substring(nameEnd, gt));
                cellStart = gt + 1;
                inCell = true;
            }
        }
        if (inCell) {
            if (row == null) row = new ArrayList<>();
            row.add(new Cell(html.substring(cellStart).replaceAll("(?is)</t[dh]\\s*>\\s*$", "").trim(),
                    header, align));
        }
        if (row != null) rows.add(row);
        int columns = 0;
        for (List<Cell> r : rows) columns = Math.max(columns, r.size());
        if (columns == 0) return null;
        for (List<Cell> r : rows) {
            while (r.size() < columns) r.add(new Cell("", false, LEFT));
        }
        return new Table(rows, columns);
    }

    private static boolean isSpace(char c) {
        return Character.isWhitespace(c) || c == '\u00A0';
    }

    /**
     * Where rif's flattened table sits in the rendered [body]: the range [start, end) that one
     * replacement character should take the place of, or null if the body doesn't hold what
     * the table would flatten to (then the caller leaves it alone). [linkStart, linkEnd) is the
     * "[View formatted table]" link; [cellTexts] are the cells' plain texts, row by row.
     *
     * <p>The end is found by matching the cells' non-whitespace characters one by one
     * (whitespace in the body is skipped: Html collapses it and rif's breaks and cell
     * separators vary), so it can't run past the table's last character. Spaces just before
     * the closing break go with the range; the break itself stays, as the paragraph break after
     * the table (and the break before the link stays as the one before it).
     */
    static int[] flattenedRange(CharSequence body, int linkStart, int linkEnd, List<String> cellTexts) {
        if (body == null || linkStart < 0 || linkEnd > body.length() || linkStart >= linkEnd) return null;
        if (!body.subSequence(linkStart, linkEnd).toString().equals(LINK_TEXT)) return null;
        int end = matchCells(body, linkEnd, cellTexts);
        if (end < 0) return null;
        int q = end;
        while (q < body.length() && isSpace(body.charAt(q)) && body.charAt(q) != '\n') q++;
        if (q < body.length() && body.charAt(q) == '\n') end = q;
        return new int[]{linkStart, end};
    }

    /** Just past the last matched character, or -1 if [body] from [from] doesn't hold the cells' text. */
    static int matchCells(CharSequence body, int from, List<String> cellTexts) {
        int p = from;
        int len = body.length();
        for (String text : cellTexts) {
            for (int i = 0; i < text.length(); i++) {
                char c = text.charAt(i);
                if (isSpace(c)) continue;
                while (p < len && isSpace(body.charAt(p))) p++;
                if (p >= len || body.charAt(p) != c) return -1;
                p++;
            }
        }
        return p;
    }

    /** Words with fewer characters than this are never broken. */
    static final int WHOLE_WORD_CHARS = 6;
    /** Extra px on a long word's column minimum, so rounding can't push its second half to a third line. */
    static final int WORD_SLACK = 2;

    /**
     * Where a word of [t] from [from] to [to] may break to keep a column narrow: the offset after
     * the first ceil(n/2) characters (code points, so a surrogate pair stays whole), or -1 if the
     * word is short ({@link #WHOLE_WORD_CHARS}) and stays whole.
     */
    static int splitPoint(CharSequence t, int from, int to) {
        int chars = Character.codePointCount(t, from, to);
        if (chars < WHOLE_WORD_CHARS) return -1;
        return Character.offsetByCodePoints(t, from, (chars + 1) / 2);
    }

    /**
     * The least width a word needs: its whole width if it has fewer than {@link #WHOLE_WORD_CHARS}
     * characters, else the wider of its two halves' widths (split at {@link #splitPoint}) plus
     * {@link #WORD_SLACK}, so it wraps at most once.
     */
    static int wordMinimum(int chars, int whole, int firstHalf, int secondHalf) {
        if (chars < WHOLE_WORD_CHARS) return whole;
        return Math.min(whole, Math.max(firstHalf, secondHalf) + WORD_SLACK);
    }

    /**
     * Column widths for [target] px (the available width minus borders), in this order:
     * (a) [natural] (each column's width on one line) if they fit; (b) else shrunk towards
     * [whole] (each column's longest whole word plus padding) if those fit, so no word breaks;
     * (c) else shrunk further towards [once] (the wrap-at-most-once minimum, see
     * {@link #wordMinimum}); (d) if even those exceed [target], exactly [once]: the table is wider
     * than [target] and the caller lets it run off the edge. Shrinking takes each column's slack
     * in proportion, and never goes below the level it's shrinking towards.
     */
    static int[] columnWidths(int[] natural, int[] whole, int[] once, int target) {
        int n = natural.length;
        int[] nat = new int[n];
        int[] wh = new int[n];
        int[] on = new int[n];
        long sumNat = 0;
        long sumWhole = 0;
        long sumOnce = 0;
        for (int i = 0; i < n; i++) {
            on[i] = Math.max(1, Math.min(once[i], Math.min(whole[i], natural[i])));
            wh[i] = Math.max(on[i], Math.min(whole[i], natural[i]));
            nat[i] = Math.max(wh[i], natural[i]);
            sumNat += nat[i];
            sumWhole += wh[i];
            sumOnce += on[i];
        }
        if (sumNat <= target) return nat;
        if (sumWhole <= target) return shrink(nat, wh, sumNat, sumWhole, target);
        if (sumOnce >= target) return on;
        return shrink(wh, on, sumWhole, sumOnce, target);
    }

    /** From [hi] (sum [sumHi] > [target]) towards [lo] (sum [sumLo] <= target), proportionally to hi - lo. */
    private static int[] shrink(int[] hi, int[] lo, long sumHi, long sumLo, int target) {
        int n = hi.length;
        long extra = target - sumLo;
        long gap = sumHi - sumLo; // > 0
        int[] w = new int[n];
        long used = 0;
        for (int i = 0; i < n; i++) {
            w[i] = lo[i] + (int) (extra * (hi[i] - lo[i]) / gap);
            used += w[i];
        }
        for (int i = 0; i < n && used < target; i++) { // rounding left a few px
            if (w[i] < hi[i]) {
                w[i]++;
                used++;
            }
        }
        return w;
    }
}

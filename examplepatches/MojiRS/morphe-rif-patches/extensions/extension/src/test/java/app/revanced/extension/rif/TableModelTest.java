package app.revanced.extension.rif;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** JVM tests for the pure table logic in {@link TableModel}. */
public class TableModelTest {

    private static final String REDDIT_TABLE =
            "<table><thead>\n<tr>\n<th align=\"left\">Name</th>\n<th align=\"center\">Qty</th>\n"
                    + "<th align=\"right\">Price</th>\n</tr>\n</thead><tbody>\n"
                    + "<tr>\n<td align=\"left\">Apple</td>\n<td align=\"center\">3</td>\n<td align=\"right\">1.50</td>\n</tr>\n"
                    + "<tr>\n<td align=\"left\"><strong>Pear</strong></td>\n<td align=\"center\">10</td>\n"
                    + "<td align=\"right\"><a href=\"https://example.com/p\">link</a></td>\n</tr>\n"
                    + "</tbody></table>";

    // ---- popoutIndex ----

    @Test
    public void popoutIndexReadsTheTableNumber() {
        assertEquals(0, TableModel.popoutIndex("/redditisfun-popout-0"));
        assertEquals(12, TableModel.popoutIndex("https://www.reddit.com/redditisfun-popout-12"));
        assertEquals(-1, TableModel.popoutIndex("https://example.com/x"));
        assertEquals(-1, TableModel.popoutIndex("/redditisfun-popout-"));
        assertEquals(-1, TableModel.popoutIndex(null));
    }

    // ---- cutTable ----

    @Test
    public void cutTableFindsTheNthTableLikeRif() {
        String html = "<div><table><tr><td>a</td></tr></table><p>x</p><table><tr><td>b</td></tr></table></div>";
        assertEquals("<table><tr><td>a</td></tr></table>", TableModel.cutTable(html, 0, false));
        assertEquals("<table><tr><td>b</td></tr></table>", TableModel.cutTable(html, 1, false));
        assertNull(TableModel.cutTable(html, 2, false));
        assertNull(TableModel.cutTable(html, -1, false));
        assertNull(TableModel.cutTable("<table><tr>", 0, false)); // never closed
    }

    @Test
    public void cutTableOfEscapedHtmlIsUnescapedOnce() {
        String html = "&lt;div class=&quot;md&quot;&gt;&lt;table&gt;&lt;tr&gt;&lt;td align=&quot;left&quot;&gt;"
                + "a &amp;amp; b &amp;lt;i&amp;gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;&lt;/div&gt;";
        assertEquals("<table><tr><td align=\"left\">a &amp; b &lt;i&gt;</td></tr></table>",
                TableModel.cutTable(html, 0, true));
        // Escaped bodies hold no real "<table"; unescaped bodies hold no "&lt;table".
        assertNull(TableModel.cutTable(html, 0, false));
    }

    @Test
    public void unescapeNumericAndNamed() {
        assertEquals("a<b>\"c\"&'d' e f", TableModel.unescape("a&lt;b&gt;&quot;c&quot;&amp;&#39;d&#x27; e&nbsp;f"));
        assertEquals("&unknown; &#xZZ;", TableModel.unescape("&unknown; &#xZZ;"));
    }

    // ---- parse ----

    @Test
    public void parseHeaderAndBodyCellsWithAlignment() {
        TableModel.Table t = TableModel.parse(REDDIT_TABLE);
        assertNotNull(t);
        assertEquals(3, t.columns);
        assertEquals(3, t.rows.size());
        TableModel.Cell name = t.rows.get(0).get(0);
        assertEquals("Name", name.html);
        assertTrue(name.header);
        assertEquals(TableModel.LEFT, name.align);
        assertEquals(TableModel.CENTER, t.rows.get(0).get(1).align);
        assertEquals(TableModel.RIGHT, t.rows.get(0).get(2).align);
        TableModel.Cell apple = t.rows.get(1).get(0);
        assertEquals("Apple", apple.html);
        assertEquals(false, apple.header);
        assertEquals(TableModel.RIGHT, t.rows.get(1).get(2).align);
    }

    @Test
    public void parseKeepsNestedInlineHtmlOfCells() {
        TableModel.Table t = TableModel.parse(REDDIT_TABLE);
        assertEquals("<strong>Pear</strong>", t.rows.get(2).get(0).html);
        assertEquals("<a href=\"https://example.com/p\">link</a>", t.rows.get(2).get(2).html);
    }

    @Test
    public void parseKeepsEntitiesAndQuotedAngleBracketsInAttributes() {
        TableModel.Table t = TableModel.parse(
                "<table><tr><td>a &amp; b &lt;c&gt;</td><td><a href=\"/x?a=1&amp;b=>2\">go</a></td></tr></table>");
        assertEquals("a &amp; b &lt;c&gt;", t.rows.get(0).get(0).html);
        assertEquals("<a href=\"/x?a=1&amp;b=>2\">go</a>", t.rows.get(0).get(1).html);
    }

    @Test
    public void parseReadsStyleAlignmentAndPrefersIt() {
        TableModel.Table t = TableModel.parse(
                "<table><tr><td style=\"text-align:right\">a</td><td align=\"center\" style=\"text-align: left\">b</td>"
                        + "<TD ALIGN=RIGHT>c</TD></tr></table>");
        assertEquals(TableModel.RIGHT, t.rows.get(0).get(0).align);
        assertEquals(TableModel.LEFT, t.rows.get(0).get(1).align);
        assertEquals(TableModel.RIGHT, t.rows.get(0).get(2).align);
    }

    @Test
    public void parsePadsShortRowsAndToleratesMissingCloseTags() {
        TableModel.Table t = TableModel.parse(
                "<table><tr><td>a<td>b<td>c<tr><td>d</table>");
        assertEquals(3, t.columns);
        assertEquals("a", t.rows.get(0).get(0).html);
        assertEquals("c", t.rows.get(0).get(2).html);
        assertEquals("d", t.rows.get(1).get(0).html);
        assertEquals("", t.rows.get(1).get(2).html);
    }

    @Test
    public void parseEmptyCellsAndNoCells() {
        TableModel.Table t = TableModel.parse("<table><tr><td></td><td> </td></tr></table>");
        assertEquals(2, t.columns);
        assertEquals("", t.rows.get(0).get(1).html);
        assertNull(TableModel.parse("<table></table>"));
        assertNull(TableModel.parse(null));
    }

    @Test
    public void parseRefusesNestedTables() {
        assertNull(TableModel.parse("<table><tr><td><table><tr><td>x</td></tr></table></td></tr></table>"));
    }

    // ---- flattenedRange ----

    /** What rif's body holds for a table: break, link line, break, rows each ending in a space and break. */
    private static String flattened(String before, String[][] rows, String after) {
        StringBuilder b = new StringBuilder(before).append("\n\n").append(TableModel.LINK_TEXT).append("\n\n");
        for (String[] row : rows) {
            for (String cell : row) b.append(cell).append(' ');
            b.append("\n\n");
        }
        return b.append(after).toString();
    }

    private static List<String> texts(String[][] rows) {
        List<String> out = new ArrayList<>();
        for (String[] row : rows) out.addAll(Arrays.asList(row));
        return out;
    }

    private static final String[][] ROWS = {{"Name", "Qty"}, {"Apple", "3"}, {"Two words", "10"}};

    @Test
    public void rangeCoversLinkAndCellsButNotTheBreaks() {
        String body = flattened("Intro text", ROWS, "After text");
        int linkStart = body.indexOf(TableModel.LINK_TEXT);
        int[] range = TableModel.flattenedRange(body, linkStart, linkStart + TableModel.LINK_TEXT.length(), texts(ROWS));
        assertNotNull(range);
        assertEquals(linkStart, range[0]);
        // Ends before the closing "\n\n" (the space after the last cell goes with the range).
        assertEquals("After text", body.substring(range[1] + 2));
        assertEquals("Two words 10 ", body.substring(range[1] - 13, range[1]));
        assertEquals("Intro text\n\n", body.substring(0, range[0]));
    }

    @Test
    public void rangeOfTableAtTheEndOfTheBody() {
        // rif trims trailing whitespace, then appends one space.
        String body = flattened("", ROWS, "").trim() + " ";
        int linkStart = body.indexOf(TableModel.LINK_TEXT);
        int[] range = TableModel.flattenedRange(body, linkStart, linkStart + TableModel.LINK_TEXT.length(), texts(ROWS));
        assertNotNull(range);
        assertEquals(body.length() - 1, range[1]); // the final space stays
    }

    @Test
    public void rangeIgnoresWhitespaceDifferencesAndEmptyCells() {
        String[][] rows = {{"a", ""}, {"", "b c"}};
        String body = "x\n\n" + TableModel.LINK_TEXT + "\n\na \n\nb c \n\ntail";
        int linkStart = body.indexOf(TableModel.LINK_TEXT);
        int[] range = TableModel.flattenedRange(body, linkStart, linkStart + TableModel.LINK_TEXT.length(), texts(rows));
        assertNotNull(range);
        assertEquals("tail", body.substring(range[1] + 2));
    }

    @Test
    public void rangeNeverEatsFollowingTextEvenWhenItLooksLikeACell() {
        // The next paragraph starts with what the table's last cell says; only the table's own
        // characters are consumed.
        String[][] rows = {{"a", "b"}};
        String body = "\n\n" + TableModel.LINK_TEXT + "\n\na b \n\nb is next";
        int linkStart = body.indexOf(TableModel.LINK_TEXT);
        int[] range = TableModel.flattenedRange(body, linkStart, linkStart + TableModel.LINK_TEXT.length(), texts(rows));
        assertNotNull(range);
        assertEquals("b is next", body.substring(range[1] + 2));
    }

    @Test
    public void mismatchLeavesTheTableUntouched() {
        String body = flattened("Intro", ROWS, "After");
        int linkStart = body.indexOf(TableModel.LINK_TEXT);
        int linkEnd = linkStart + TableModel.LINK_TEXT.length();
        // A cell's text differs.
        List<String> wrong = texts(ROWS);
        wrong.set(3, "Pear");
        assertNull(TableModel.flattenedRange(body, linkStart, linkEnd, wrong));
        // The body is shorter than the table.
        assertNull(TableModel.flattenedRange(body.substring(0, body.indexOf("Two")), linkStart, linkEnd, texts(ROWS)));
        // Not the placeholder link's text.
        assertNull(TableModel.flattenedRange(body, linkStart + 1, linkEnd, texts(ROWS)));
        assertNull(TableModel.flattenedRange(body, linkStart, linkStart, texts(ROWS)));
    }

    @Test
    public void tableWithNoTextEndsAtTheLink() {
        String body = "a\n\n" + TableModel.LINK_TEXT + "\n\nnext";
        int linkStart = body.indexOf(TableModel.LINK_TEXT);
        int linkEnd = linkStart + TableModel.LINK_TEXT.length();
        int[] range = TableModel.flattenedRange(body, linkStart, linkEnd, Arrays.asList("", ""));
        assertNotNull(range);
        assertEquals(linkEnd, range[1]);
    }

    // ---- columnWidths ----

    private static int sum(int[] a) {
        int s = 0;
        for (int v : a) s += v;
        return s;
    }

    @Test
    public void widthsFitAsIsWhenTheyFit() {
        int[] nat = {100, 50};
        int[] whole = {60, 40};
        int[] once = {30, 20};
        assertArrayEquals(nat, TableModel.columnWidths(nat, whole, once, 200));
        assertArrayEquals(nat, TableModel.columnWidths(nat, whole, once, 150));
    }

    @Test
    public void wholeWordsFitSoNoColumnGoesBelowItsLongestWord() {
        int[] nat = {400, 100, 100};
        int[] whole = {100, 50, 50};
        int[] once = {50, 25, 25};
        int[] w = TableModel.columnWidths(nat, whole, once, 300);
        assertEquals(300, sum(w));
        for (int i = 0; i < 3; i++) assertTrue("column " + i, w[i] >= whole[i] && w[i] <= nat[i]);
        // The column with the most to give gives the most.
        assertTrue(w[0] - whole[0] > w[1] - whole[1]);
        // Exactly the whole words' sum: nothing is left to give.
        assertArrayEquals(whole, TableModel.columnWidths(nat, whole, once, 200));
    }

    @Test
    public void wordsBreakOnlyOnceWholeWordsCantFit() {
        // Whole words sum to 260 > 240 > once minimums' 130: shrink between them.
        int[] nat = {500, 300, 200};
        int[] whole = {100, 100, 60};
        int[] once = {50, 50, 30};
        int[] w = TableModel.columnWidths(nat, whole, once, 240);
        assertEquals(240, sum(w));
        for (int i = 0; i < 3; i++) assertTrue("column " + i, w[i] >= once[i] && w[i] <= whole[i]);
        assertArrayEquals(once, TableModel.columnWidths(nat, whole, once, 130));
    }

    @Test
    public void overflowGivesTheOnceMinimumsEvenWhenTheyExceedTheTarget() {
        int[] nat = {300, 400, 200, 300};
        int[] whole = {120, 140, 100, 90};
        int[] once = {80, 90, 70, 60};
        int[] w = TableModel.columnWidths(nat, whole, once, 200);
        assertArrayEquals(once, w);
        assertTrue(sum(w) > 200);
    }

    @Test
    public void aMinimumAboveItsNaturalWidthIsClamped() {
        assertArrayEquals(new int[]{20, 400},
                TableModel.columnWidths(new int[]{20, 500}, new int[]{50, 450}, new int[]{50, 400}, 100));
    }

    @Test
    public void shortWordsStayWhole() {
        // Fewer than 6 characters: the whole word's width, however wide.
        assertEquals(37, TableModel.wordMinimum(5, 37, 20, 17));
        assertEquals(1, TableModel.wordMinimum(1, 1, 1, 1));
        assertEquals(-1, TableModel.splitPoint("Fifth", 0, 5));
    }

    @Test
    public void longWordsNeedTheirLongerHalfPlusSlack() {
        // 6 or more characters: the wider half (plus the slack), never above the whole word.
        assertEquals(30 + TableModel.WORD_SLACK, TableModel.wordMinimum(6, 55, 30, 25));
        assertEquals(30 + TableModel.WORD_SLACK, TableModel.wordMinimum(7, 60, 25, 30));
        assertEquals(10, TableModel.wordMinimum(6, 10, 9, 9));
    }

    @Test
    public void wordsSplitAfterTheCeilingOfHalfTheirCharacters() {
        assertEquals(4, TableModel.splitPoint("Seventh", 0, 7)); // 7 chars: first half is 4
        assertEquals(3, TableModel.splitPoint("Sixths", 0, 6));
        // Inside a longer text, offsets are in that text.
        assertEquals(3 + 4, TableModel.splitPoint("a  Seventh", 3, 10));
    }

    @Test
    public void aSurrogatePairIsNotSplit() {
        String word = "ab😀cdef"; // 7 code points, 8 chars: first half = 4 code points
        int at = TableModel.splitPoint(word, 0, word.length());
        assertEquals(5, at); // a b <pair> c: the pair counts as one
        assertFalse(Character.isLowSurrogate(word.charAt(at)));
    }
}

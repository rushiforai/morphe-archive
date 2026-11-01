package dev.jason.gboardpatches.extension.extendeddictionary;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public final class WordListParserTest {
    private static final String V2 = "# Gboard Dictionary version:2\n";
    private static final String FORMAT_4 =
            "# Gboard Dictionary format:shortcut\tword\tlanguage_tag\tpos_tag\n";
    private static final String FORMAT_3 =
            "# Gboard Dictionary format:shortcut\tword\tlanguage_tag\n";

    @Test
    public void parsesGboardVersionTwoExportWithPosTags() throws Exception {
        List<WordListParser.Row> rows = parse(V2 + FORMAT_4
                + "omw\tOn my way!\ten-US\t\n"
                + "こうちく\t構築\tja-JP\t名詞\n"
                + "# From OS\n"
                + "\tplain\t\t\n");

        assertEquals(3, rows.size());
        assertRow(rows.get(0), "omw", "On my way!", "en-US", "");
        assertRow(rows.get(1), "こうちく", "構築", "ja-JP",
                "名詞");
        assertRow(rows.get(2), "", "plain", "", "");
    }

    @Test
    public void acceptsThreeColumnHeaderVersionOneAndHeaderlessFiles() throws Exception {
        assertRow(parse(V2 + FORMAT_3 + "a\tAlpha\ten-US\n").get(0), "a", "Alpha", "en-US", "");
        assertRow(parse("# Gboard Dictionary version:1\nb\tBeta\ten-GB\n").get(0),
                "b", "Beta", "en-GB", "");
        assertRow(parse(FORMAT_3 + "c\tGamma\tfr\n").get(0), "c", "Gamma", "fr", "");

        List<WordListParser.Row> headerless = parse("d\tDelta\tde-DE\ne\tEpsilon\tja-JP\t名詞\n");
        assertEquals(2, headerless.size());
        assertRow(headerless.get(1), "e", "Epsilon", "ja-JP", "名詞");
    }

    @Test
    public void skipsBlankLinesLinesWithoutTabsAndEmptyWordsWithoutTrimming() throws Exception {
        List<WordListParser.Row> rows = parse(V2 + FORMAT_3
                + "\r\n"
                + "comment without tab\r\n"
                + "x\t\ten-US\r\n"
                + " sp \t Word \ten-US\r\n");

        assertEquals(1, rows.size());
        assertRow(rows.get(0), " sp ", " Word ", "en-US", "");
    }

    @Test
    public void rejectsWrongColumnCountsWithLineNumbers() {
        assertError(V2 + FORMAT_4 + "ok\tOk\ten-US\t\nshort\tShort\ten-US\n",
                WordListParser.Error.WRONG_COLUMN_COUNT, 4);
        assertError(V2 + FORMAT_3 + "a\tA\ten-US\t\n", WordListParser.Error.WRONG_COLUMN_COUNT, 3);
        assertError("a\tA\n", WordListParser.Error.WRONG_COLUMN_COUNT, 1);
        assertError("a\tA\ten\tx\ty\n", WordListParser.Error.WRONG_COLUMN_COUNT, 1);
    }

    @Test
    public void rejectsUnsupportedHeadersTagsAndEncoding() throws Exception {
        assertError("# Gboard Dictionary version:3\n", WordListParser.Error.UNSUPPORTED_HEADER, 1);
        assertError(V2 + "a\tA\ten-US\n", WordListParser.Error.UNSUPPORTED_HEADER, 2);
        assertError(V2, WordListParser.Error.UNSUPPORTED_HEADER, 2);
        assertError("a\tA\ten_US\n", WordListParser.Error.INVALID_LANGUAGE_TAG, 1);

        byte[] invalid = {'a', '\t', (byte) 0xC3, (byte) 0x28, '\t', 'e', 'n', '\n'};
        try {
            WordListParser.parse(invalid);
            fail("Expected invalid UTF-8 to fail");
        } catch (WordListParser.ParseException expected) {
            assertEquals(WordListParser.Error.INVALID_ENCODING, expected.error);
        }
    }

    @Test
    public void enforcesFieldLengthAndRowCap() throws Exception {
        assertEquals(100_000, WordListParser.MAX_ROWS_PER_IMPORT);
        assertEquals(120_000, WordListParser.MAX_LINES);
        String maxWord = "w".repeat(WordListParser.MAX_FIELD_LENGTH);
        assertEquals(1, parse("s\t" + maxWord + "\ten\n").size());
        assertError("s\t" + maxWord + "w\ten\n", WordListParser.Error.FIELD_TOO_LONG, 1);
        assertError("s".repeat(WordListParser.MAX_FIELD_LENGTH + 1) + "\tw\ten\n",
                WordListParser.Error.FIELD_TOO_LONG, 1);

        StringBuilder atCap = new StringBuilder();
        for (int index = 0; index < WordListParser.MAX_ROWS_PER_IMPORT; index++) {
            atCap.append("s\tword").append(index).append("\ten-US\n");
        }
        assertEquals(WordListParser.MAX_ROWS_PER_IMPORT, parse(atCap.toString()).size());
        assertError(atCap + "s\tover\ten-US\n", WordListParser.Error.TOO_MANY_ROWS,
                WordListParser.MAX_ROWS_PER_IMPORT + 1);
    }

    @Test
    public void readsEveryTextEntryOfAZipLikeGboardRestore() throws Exception {
        byte[] zip = zip(
                "dictionary.txt", V2 + FORMAT_4 + "a\tAlpha\ten-US\t\n",
                "folder/", null,
                "extra.txt", "b\tBeta\ten-US\n");

        List<WordListParser.Row> rows = WordListParser.parse(zip);

        assertEquals(2, rows.size());
        assertRow(rows.get(0), "a", "Alpha", "en-US", "");
        assertRow(rows.get(1), "b", "Beta", "en-US", "");
    }

    @Test
    public void zipEntryNameThatIsNotUtf8IsAParseErrorNotACrash() throws Exception {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        try (ZipOutputStream zip = new ZipOutputStream(output, Charset.forName("Shift_JIS"))) {
            zip.putNextEntry(new ZipEntry("辞書.txt"));
            zip.write("a\tb\tja-JP\n".getBytes(StandardCharsets.UTF_8));
            zip.closeEntry();
        }

        assertParseError(output.toByteArray(), WordListParser.Error.UNREADABLE);
    }

    @Test
    public void rejectsOverlongLinesBeforeBufferingThem() {
        assertError("x".repeat(WordListParser.MAX_LINE_CHARS + 1),
                WordListParser.Error.LINE_TOO_LONG, 1);
        assertError("a\tA\ten\n" + "y".repeat(WordListParser.MAX_LINE_CHARS + 1) + "\n",
                WordListParser.Error.LINE_TOO_LONG, 2);
    }

    @Test
    public void countsSkippedLinesAgainstTheLineCap() {
        assertError("\n".repeat(WordListParser.MAX_LINES + 1),
                WordListParser.Error.TOO_MANY_LINES, WordListParser.MAX_LINES + 1);
    }

    @Test
    public void rejectsInputThatInflatesBeyondTheByteCap() throws Exception {
        String line = "x".repeat(1000) + "\n";
        String inflated = line.repeat(WordListParser.MAX_INPUT_BYTES / line.length() + 1);
        byte[] zip = zip("dictionary.txt", inflated);
        assertTrue(zip.length < WordListParser.MAX_INPUT_BYTES / 100);

        assertParseError(zip, WordListParser.Error.INPUT_TOO_LARGE);
        assertParseError(new byte[WordListParser.MAX_INPUT_BYTES + 1],
                WordListParser.Error.INPUT_TOO_LARGE);
    }

    @Test
    public void capsLanguageAndPosTagLengthBeforeMatchingThem() {
        String tooLong = "a".repeat(WordListParser.MAX_FIELD_LENGTH + 1);
        assertError("s\tw\t" + tooLong + "\n", WordListParser.Error.FIELD_TOO_LONG, 1);
        assertError("s\tw\tja-JP\t" + tooLong + "\n", WordListParser.Error.FIELD_TOO_LONG, 1);
    }

    @Test
    public void emptyInputYieldsNoRows() throws Exception {
        assertTrue(WordListParser.parse(new byte[0]).isEmpty());
        assertTrue(parse(V2 + FORMAT_4).isEmpty());
    }

    private static List<WordListParser.Row> parse(String text) throws Exception {
        return WordListParser.parse(text.getBytes(StandardCharsets.UTF_8));
    }

    private static void assertError(String text, WordListParser.Error error, int line) {
        try {
            parse(text);
            fail("Expected " + error);
        } catch (WordListParser.ParseException expected) {
            assertEquals(error, expected.error);
            assertEquals(line, expected.lineNumber);
        } catch (Exception unexpected) {
            throw new AssertionError(unexpected);
        }
    }

    private static void assertParseError(byte[] data, WordListParser.Error error) {
        try {
            WordListParser.parse(data);
            fail("Expected " + error);
        } catch (WordListParser.ParseException expected) {
            assertEquals(error, expected.error);
        }
    }

    private static void assertRow(WordListParser.Row row, String shortcut, String word,
            String localeTag, String posTag) {
        assertEquals(shortcut, row.shortcut);
        assertEquals(word, row.word);
        assertEquals(localeTag, row.localeTag);
        assertEquals(posTag, row.posTag);
    }

    private static byte[] zip(String... namesAndContents) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        try (ZipOutputStream zip = new ZipOutputStream(output)) {
            for (int index = 0; index < namesAndContents.length; index += 2) {
                zip.putNextEntry(new ZipEntry(namesAndContents[index]));
                String content = namesAndContents[index + 1];
                if (content != null) {
                    zip.write(content.getBytes(StandardCharsets.UTF_8));
                }
                zip.closeEntry();
            }
        }
        return output.toByteArray();
    }
}

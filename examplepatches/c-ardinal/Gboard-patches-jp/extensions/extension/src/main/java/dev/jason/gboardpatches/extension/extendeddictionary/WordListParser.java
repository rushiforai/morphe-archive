package dev.jason.gboardpatches.extension.extendeddictionary;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/** Parses Gboard's personal dictionary export format (text or ZIP of text entries). */
final class WordListParser {
    static final int MAX_ROWS_PER_IMPORT = 100_000;
    static final int MAX_FIELD_LENGTH = 256;
    static final int MAX_INPUT_BYTES = 8 * 1024 * 1024;
    static final int MAX_LINE_CHARS = 4 * MAX_FIELD_LENGTH + 3;
    static final int MAX_LINES = 120_000;
    static final String VERSION_PREFIX = "# Gboard Dictionary version:";
    static final String FORMAT_PREFIX = "# Gboard Dictionary format:";
    private static final String FORMAT_THREE_COLUMNS =
            FORMAT_PREFIX + "shortcut\tword\tlanguage_tag";
    private static final String FORMAT_FOUR_COLUMNS = FORMAT_THREE_COLUMNS + "\tpos_tag";
    private static final int ANY_COLUMN_COUNT = 0;
    private static final Pattern LANGUAGE_TAG =
            Pattern.compile("[A-Za-z]{2,8}(-[A-Za-z0-9]{1,8})*");

    enum Error {
        INVALID_ENCODING,
        UNSUPPORTED_HEADER,
        WRONG_COLUMN_COUNT,
        INVALID_LANGUAGE_TAG,
        FIELD_TOO_LONG,
        TOO_MANY_ROWS,
        TOO_MANY_LINES,
        LINE_TOO_LONG,
        INPUT_TOO_LARGE,
        UNREADABLE
    }

    static final class Row {
        final String shortcut;
        final String word;
        final String localeTag;
        final String posTag;

        Row(String shortcut, String word, String localeTag, String posTag) {
            this.shortcut = shortcut;
            this.word = word;
            this.localeTag = localeTag;
            this.posTag = posTag;
        }
    }

    static final class ParseException extends Exception {
        final Error error;
        final int lineNumber;

        ParseException(Error error, int lineNumber) {
            super(error + " at line " + lineNumber);
            this.error = error;
            this.lineNumber = lineNumber;
        }
    }

    private WordListParser() {
    }

    static List<Row> parse(byte[] data) throws ParseException {
        return parse(data, null);
    }

    /** As parse(data); progress (may be null) receives raw input bytes consumed. */
    static List<Row> parse(byte[] data, ExtendedDictionaryImporter.Progress progress)
            throws ParseException {
        if (data.length > MAX_INPUT_BYTES) {
            throw new ParseException(Error.INPUT_TOO_LARGE, 0);
        }
        List<Row> rows = new ArrayList<>();
        ByteArrayInputStream raw = new ByteArrayInputStream(data);
        Runnable report = progress == null ? () -> {
        } : () -> progress.onProgress(data.length - raw.available(), data.length);
        try {
            if (isZip(data)) {
                try (ZipInputStream zip = new ZipInputStream(raw)) {
                    InputBudget budget = new InputBudget(zip, report);
                    ZipEntry entry;
                    while ((entry = zip.getNextEntry()) != null) {
                        if (!entry.isDirectory()) {
                            parseText(budget, rows);
                        }
                    }
                }
            } else {
                parseText(new InputBudget(raw, report), rows);
            }
            if (progress != null) {
                progress.onProgress(data.length, data.length);
            }
        } catch (InputBudget.Exceeded exceeded) {
            throw new ParseException(Error.INPUT_TOO_LARGE, 0);
        } catch (IOException | IllegalArgumentException failure) {
            // ZipInputStream throws IllegalArgumentException for non-UTF-8 entry names.
            throw new ParseException(Error.UNREADABLE, 0);
        }
        return Collections.unmodifiableList(rows);
    }

    private static boolean isZip(byte[] data) {
        return data.length >= 4 && data[0] == 'P' && data[1] == 'K'
                && data[2] == 3 && data[3] == 4;
    }

    private static void parseText(InputBudget input, List<Row> rows)
            throws IOException, ParseException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(input,
                StandardCharsets.UTF_8.newDecoder()
                        .onMalformedInput(CodingErrorAction.REPORT)
                        .onUnmappableCharacter(CodingErrorAction.REPORT)));
        int lineNumber = 0;
        int columns = ANY_COLUMN_COUNT;
        boolean headerAllowed = true;
        String line;
        while ((line = readLine(reader, input, lineNumber + 1)) != null) {
            lineNumber++;
            if (headerAllowed && lineNumber == 1 && line.startsWith(VERSION_PREFIX)) {
                String version = line.substring(VERSION_PREFIX.length());
                if ("1".equals(version)) {
                    columns = 3;
                    headerAllowed = false;
                } else if (!"2".equals(version)) {
                    throw new ParseException(Error.UNSUPPORTED_HEADER, lineNumber);
                } else {
                    String format = readLine(reader, input, ++lineNumber);
                    columns = formatColumns(format, lineNumber);
                    headerAllowed = false;
                }
                continue;
            }
            if (headerAllowed && line.startsWith(FORMAT_PREFIX)) {
                columns = formatColumns(line, lineNumber);
                headerAllowed = false;
                continue;
            }
            headerAllowed = false;
            Row row = parseRow(line, columns, lineNumber);
            if (row == null) {
                continue;
            }
            if (rows.size() >= MAX_ROWS_PER_IMPORT) {
                throw new ParseException(Error.TOO_MANY_ROWS, lineNumber);
            }
            rows.add(row);
        }
    }

    /** Like BufferedReader.readLine (LF, CR or CRLF) but bounded in length and line count. */
    private static String readLine(BufferedReader reader, InputBudget budget, int lineNumber)
            throws IOException, ParseException {
        StringBuilder line = new StringBuilder();
        try {
            int character = reader.read();
            if (character < 0) {
                return null;
            }
            if (++budget.lines > MAX_LINES) {
                throw new ParseException(Error.TOO_MANY_LINES, lineNumber);
            }
            budget.report.run();
            while (character >= 0 && character != '\n' && character != '\r') {
                if (line.length() >= MAX_LINE_CHARS) {
                    throw new ParseException(Error.LINE_TOO_LONG, lineNumber);
                }
                line.append((char) character);
                character = reader.read();
            }
            if (character == '\r') {
                reader.mark(1);
                if (reader.read() != '\n') {
                    reader.reset();
                }
            }
            return line.toString();
        } catch (CharacterCodingException failure) {
            throw new ParseException(Error.INVALID_ENCODING, lineNumber);
        }
    }

    private static int formatColumns(String format, int lineNumber) throws ParseException {
        String trimmed = format == null ? "" : format.trim();
        if (FORMAT_THREE_COLUMNS.equals(trimmed)) {
            return 3;
        }
        if (FORMAT_FOUR_COLUMNS.equals(trimmed)) {
            return 4;
        }
        throw new ParseException(Error.UNSUPPORTED_HEADER, lineNumber);
    }

    private static Row parseRow(String line, int columns, int lineNumber)
            throws ParseException {
        if (line.isEmpty() || line.indexOf('\t') < 0) {
            return null;
        }
        String[] fields = line.split("\t", -1);
        boolean validCount = columns == ANY_COLUMN_COUNT
                ? fields.length == 3 || fields.length == 4
                : fields.length == columns;
        if (!validCount) {
            throw new ParseException(Error.WRONG_COLUMN_COUNT, lineNumber);
        }
        String shortcut = fields[0];
        String word = fields[1];
        String localeTag = fields[2];
        String posTag = fields.length == 4 ? fields[3] : "";
        if (word.isEmpty()) {
            return null;
        }
        for (String field : fields) {
            if (field.length() > MAX_FIELD_LENGTH) {
                throw new ParseException(Error.FIELD_TOO_LONG, lineNumber);
            }
        }
        if (!localeTag.isEmpty() && !LANGUAGE_TAG.matcher(localeTag).matches()) {
            throw new ParseException(Error.INVALID_LANGUAGE_TAG, lineNumber);
        }
        return new Row(shortcut, word, localeTag, posTag);
    }

    /** Caps inflated bytes and physical lines across every entry of one import. */
    private static final class InputBudget extends FilterInputStream {
        private long remainingBytes = MAX_INPUT_BYTES;
        private int lines;
        private final Runnable report;

        InputBudget(InputStream input, Runnable report) {
            super(input);
            this.report = report;
        }

        @Override
        public int read() throws IOException {
            int value = super.read();
            if (value >= 0) {
                consume(1);
            }
            return value;
        }

        @Override
        public int read(byte[] buffer, int offset, int length) throws IOException {
            int count = super.read(buffer, offset, length);
            if (count > 0) {
                consume(count);
            }
            return count;
        }

        @Override
        public void close() {
        }

        private void consume(int count) throws Exceeded {
            remainingBytes -= count;
            if (remainingBytes < 0) {
                throw new Exceeded();
            }
        }

        static final class Exceeded extends IOException {
        }
    }
}

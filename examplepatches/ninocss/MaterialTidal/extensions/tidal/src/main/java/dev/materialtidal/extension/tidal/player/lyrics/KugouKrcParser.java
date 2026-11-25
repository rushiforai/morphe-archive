package dev.materialtidal.extension.tidal.player.lyrics;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.InflaterInputStream;

import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.LyricLineData;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.SyllableLyricsDocument;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.SyllableWordBuilder;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.WordGroup;

/**
 * Pure-Java decoder and parser for KuGou KRC syllable-synced karaoke lyrics.
 *
 * <p>KRC format: 4-byte header {@code "krc1"}, followed by XOR-obfuscated zlib stream
 * yielding UTF-8 {@code [lineStart,lineDur]<wordOffset,wordDur,0>word...} markup.
 */
public final class KugouKrcParser {

    private static final byte[] KRC_XOR_KEY = new byte[]{
            64, 71, 97, 119, 94, 50, 116, 71, 81, 54, 49, 45, (byte) 206, (byte) 210, 110, 105
    };
    private static final int MAX_DECOMPRESSED_BYTES = 1024 * 1024;

    private static final Pattern LINE_PATTERN =
            Pattern.compile("^\\[(\\d+),(\\d+)\\](.+)$");
    private static final Pattern TOKEN_PATTERN =
            Pattern.compile("<(\\d+),(\\d+),\\d+>([^<]*)");
    private static final Pattern OFFSET_PATTERN =
            Pattern.compile("^\\[offset:([+-]?\\d+)\\]$", Pattern.CASE_INSENSITIVE);

    private KugouKrcParser() {
    }

    public static String decodeKrcBase64(String base64Content) {
        if (base64Content == null || base64Content.trim().isEmpty()) {
            return null;
        }
        try {
            byte[] raw = Base64.getMimeDecoder().decode(base64Content.trim());
            if (raw.length <= 4
                    || raw[0] != 'k'
                    || raw[1] != 'r'
                    || raw[2] != 'c'
                    || raw[3] != '1') {
                return null;
            }
            byte[] xored = new byte[raw.length - 4];
            for (int i = 4; i < raw.length; i++) {
                xored[i - 4] = (byte) (raw[i] ^ KRC_XOR_KEY[(i - 4) % KRC_XOR_KEY.length]);
            }
            try (InflaterInputStream iis = new InflaterInputStream(new ByteArrayInputStream(xored));
                 ByteArrayOutputStream baos = new ByteArrayOutputStream(4096)) {
                byte[] buf = new byte[4096];
                int total = 0;
                int read;
                while ((read = iis.read(buf)) != -1) {
                    total += read;
                    if (total > MAX_DECOMPRESSED_BYTES) {
                        return null;
                    }
                    baos.write(buf, 0, read);
                }
                return new String(baos.toByteArray(), StandardCharsets.UTF_8);
            }
        } catch (Throwable ignored) {
            return null;
        }
    }

    public static SyllableLyricsDocument parseKrcText(
            String krcText,
            String trackTitle,
            String trackArtist,
            String providerLabel
    ) {
        if (krcText == null || krcText.trim().isEmpty()) {
            return null;
        }

        long offsetMs = 0L;
        String[] rows = krcText.split("\r?\n");
        for (String row : rows) {
            if (row == null) continue;
            Matcher om = OFFSET_PATTERN.matcher(row.trim());
            if (om.matches()) {
                try {
                    offsetMs = Long.parseLong(om.group(1));
                } catch (NumberFormatException ignored) {
                }
                break;
            }
        }

        String normTitle = SyllableLyricsMatcher.normalize(SyllableLyricsMatcher.cleanTitle(trackTitle));
        String normArtist = SyllableLyricsMatcher.normalize(SyllableLyricsMatcher.primaryArtist(trackArtist));

        List<LyricLineData> parsedLines = new ArrayList<>();
        boolean anyTimedWords = false;

        for (String rawRow : rows) {
            if (rawRow == null) {
                continue;
            }
            Matcher lm = LINE_PATTERN.matcher(rawRow.trim());
            if (!lm.matches()) {
                continue;
            }

            long lineStart = Long.parseLong(lm.group(1));
            long lineDur = Long.parseLong(lm.group(2));
            String body = lm.group(3);

            List<WordGroup> words = new ArrayList<>();
            SyllableWordBuilder builder = new SyllableWordBuilder(false, words);
            Matcher tm = TOKEN_PATTERN.matcher(body);
            boolean matchedAnyToken = false;

            while (tm.find()) {
                matchedAnyToken = true;
                long tokOffset = Long.parseLong(tm.group(1));
                long tokDur = Math.max(40L, Long.parseLong(tm.group(2)));
                String tokText = tm.group(3);
                if (tokText == null || tokText.isEmpty()) {
                    continue;
                }
                long absStart = Math.max(0L, lineStart + offsetMs + tokOffset);
                long absEnd = absStart + tokDur;
                builder.append(tokText, absStart, absEnd);
            }
            builder.flush(false);

            if (!matchedAnyToken || words.isEmpty()) {
                continue;
            }

            String fullText = SyllableLyricsModels.buildLineText(words);
            if (fullText.isEmpty()) {
                continue;
            }
            long adjStart = Math.max(0L, lineStart + offsetMs);
            if (isBoilerplateCreditLine(fullText, adjStart, normTitle, normArtist)) {
                continue;
            }

            long lineEnd = adjStart + Math.max(40L, lineDur);
            for (WordGroup w : words) {
                if (w.endMs > lineEnd) {
                    lineEnd = w.endMs;
                }
            }

            anyTimedWords = true;
            parsedLines.add(new LyricLineData(
                    fullText,
                    adjStart,
                    lineEnd,
                    words,
                    Collections.emptyList(),
                    false,
                    false
            ));
        }

        if (!anyTimedWords || parsedLines.isEmpty()) {
            return null;
        }

        List<LyricLineData> withBreaks = SyllableLyricsModels.insertInstrumentalBreaks(parsedLines);
        String label = providerLabel != null ? providerLabel : "KuGou";
        return new SyllableLyricsDocument(label, true, true, false, withBreaks);
    }

    private static boolean isBoilerplateCreditLine(
            String lineText,
            long lineStartMs,
            String normTitle,
            String normArtist
    ) {
        if (lineStartMs >= 18_000L) {
            return false;
        }
        String lower = lineText.trim().toLowerCase(Locale.ROOT);
        if (lower.startsWith("lyrics by")
                || lower.startsWith("composed by")
                || lower.startsWith("produced by")
                || lower.startsWith("written by")
                || lower.startsWith("arranged by")
                || lower.startsWith("mixed by")
                || lower.startsWith("mastered by")
                || lower.startsWith("作词")
                || lower.startsWith("作曲")
                || lower.startsWith("编曲")
                || lower.startsWith("制作人")
                || lower.startsWith("词：")
                || lower.startsWith("曲：")) {
            return true;
        }
        if (lineStartMs < 3000L && !normTitle.isEmpty() && !normArtist.isEmpty()) {
            String normLine = SyllableLyricsMatcher.normalize(lineText);
            if (normLine.equals(normTitle + normArtist) || normLine.equals(normArtist + normTitle)) {
                return true;
            }
        }
        return false;
    }
}

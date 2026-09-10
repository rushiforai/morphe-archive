/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

import androidx.annotation.Nullable;

/**
 * Strict parser for the HTTP {@code Content-Range} header of partial media responses.
 *
 * <p>A valid response for a requested range looks like
 * {@code Content-Range: bytes <start>-<end>/<total>} where {@code start}/{@code end} are
 * the actually served byte offsets (inclusive) and {@code total} is the full representation
 * size. Missing, malformed or inconsistent headers are a read failure: a corrupt or partial
 * body must never be silently accepted and uploaded to Yandex.
 */
final class YandexVotContentRange {
    final long start;
    final long end;
    final long total;

    private YandexVotContentRange(long start, long end, long total) {
        this.start = start;
        this.end = end;
        this.total = total;
    }

    /**
     * @return the parsed range, or null when the header is missing, malformed, uses a
     *     non-numeric or unknown ({@code *}) total, or describes an impossible range.
     */
    @Nullable
    static YandexVotContentRange parse(@Nullable String header) {
        if (header == null) return null;

        String value = header.trim();
        // Unit is case-insensitive per RFC 9110. Require a single space after it.
        if (value.length() < 6 || !value.regionMatches(true, 0, "bytes", 0, 5)) {
            return null;
        }
        if (value.charAt(5) != ' ' && value.charAt(5) != '\t') return null;
        value = value.substring(6).trim();

        int dash = value.indexOf('-');
        int slash = value.lastIndexOf('/');
        if (dash <= 0 || slash <= dash + 1 || slash == value.length() - 1) return null;

        Long start = parseLongPart(value.substring(0, dash));
        Long end = parseLongPart(value.substring(dash + 1, slash));
        Long total = parseLongPart(value.substring(slash + 1));
        if (start == null || end == null || total == null) return null;
        if (start > end) return null;
        if (total <= end) return null; // total must cover the served range

        return new YandexVotContentRange(start, end, total);
    }

    /**
     * Validates the header of a {@code 206 Partial Content} response against the byte range
     * that was requested and the known full file size.
     *
     * @param header the raw {@code Content-Range} header (may be null)
     * @param requestedStart the inclusive first byte that was requested
     * @param requestedEnd the inclusive last byte that was requested
     * @param knownTotal the full file size when already known, {@code 0} when unknown
     * @throws YandexVotAudioTransfer.SourceReadException when the header is missing,
     *     malformed, does not cover exactly the requested range, or reports a total that
     *     contradicts the known file size
     */
    static YandexVotContentRange require(
            @Nullable String header,
            long requestedStart,
            long requestedEnd,
            long knownTotal
    ) throws YandexVotAudioTransfer.SourceReadException {
        YandexVotContentRange range = parse(header);
        if (range == null) {
            throw new YandexVotAudioTransfer.SourceReadException(
                    "Missing or malformed Content-Range header");
        }
        if (range.start != requestedStart || range.end != requestedEnd) {
            throw new YandexVotAudioTransfer.SourceReadException(
                    "Content-Range does not match the requested byte range");
        }
        if (knownTotal > 0 && range.total != knownTotal) {
            throw new YandexVotAudioTransfer.SourceReadException(
                    "Content-Range total does not match the known file size");
        }
        return range;
    }

    @Nullable
    private static Long parseLongPart(String value) {
        if (value.isEmpty()) return null;
        try {
            long parsed = Long.parseLong(value);
            return parsed >= 0 ? parsed : null;
        } catch (NumberFormatException ex) {
            return null;
        }
    }
}

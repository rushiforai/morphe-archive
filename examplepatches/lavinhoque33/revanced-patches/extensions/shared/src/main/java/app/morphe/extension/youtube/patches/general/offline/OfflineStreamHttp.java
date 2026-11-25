/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.youtube.patches.general.offline;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.StandardCharsets;
import java.util.Locale;

/** HTTP byte-range handling for the watch player's private loopback source. */
final class OfflineStreamHttp {
    private static final String BYTES = "bytes=";
    private static final int BUFFER_SIZE = 256 * 1024;

    record Request(String method, String target, String rangeHeader, boolean close) {
        String path() {
            int query = target.indexOf('?');
            return query < 0 ? target : target.substring(0, query);
        }

        private String byteRange() throws IOException {
            // The platform client sends a Range header; YouTube media requests may use range=.
            // A header for a seek takes precedence over any range in the original URL.
            if (rangeHeader != null) {
                if (!rangeHeader.regionMatches(true, 0, BYTES, 0, BYTES.length())) {
                    throw new IllegalArgumentException("Unsupported range unit");
                }
                return rangeHeader.substring(BYTES.length());
            }

            String value = queryRange(target);
            if (value != null && value.regionMatches(true, 0, BYTES, 0, BYTES.length())) {
                return value.substring(BYTES.length());
            }
            return value;
        }
    }

    private record ByteRange(long start, long end) {
        long length() {
            return end - start + 1;
        }
    }

    private OfflineStreamHttp() {
    }

    static Request readRequest(BufferedReader in) throws IOException {
        String requestLine = in.readLine();
        if (requestLine == null) return null;
        String[] parts = requestLine.split(" ", 3);
        String range = null;
        boolean close = false;
        for (String line = in.readLine(); line != null && !line.isEmpty(); line = in.readLine()) {
            if (line.regionMatches(true, 0, "range:", 0, 6)) {
                // This endpoint serves one byte range, not multipart responses.
                range = range == null ? line.substring(6).trim() : "";
            } else if (line.regionMatches(true, 0, "connection:", 0, 11)) {
                close |= line.toLowerCase(Locale.ROOT).contains("close");
            }
        }
        return new Request(parts[0], parts.length > 1 ? parts[1] : "", range, close);
    }

    private static String queryRange(String target) throws IOException {
        int query = target.indexOf('?');
        if (query < 0) return null;

        String value = null;
        for (int start = query + 1; start < target.length();) {
            int end = target.indexOf('&', start);
            if (end < 0) end = target.length();
            if (end - start >= 6 && target.startsWith("range=", start)) {
                if (value != null) throw new IllegalArgumentException("Multiple URL ranges");
                value = URLDecoder.decode(target.substring(start + 6, end), StandardCharsets.UTF_8.name());
            } else if (end - start == 5 && target.startsWith("range", start)) {
                throw new IllegalArgumentException("Missing URL range");
            }
            start = end + 1;
        }
        return value;
    }

    /** @return Whether another request can be read on this connection. */
    static boolean serve(Request request, OutputStream out, FileChannel channel, long offset, long declaredLength,
                         String mimeType) throws IOException {
        // Some content providers expose a slice of a file. Never advertise or cross its physical EOF.
        final long available = Math.max(0, channel.size() - offset);
        final long total = declaredLength < 0 ? available : Math.min(available, declaredLength);

        final String requestedRange;
        final ByteRange range;
        try {
            requestedRange = request.byteRange();
            range = requestedRange == null ? new ByteRange(0, total - 1) : parseRange(requestedRange, total);
        } catch (IllegalArgumentException ex) {
            writeStatus(out, "400 Bad Request");
            return false;
        }
        if (range == null) {
            writeHeaders(request, out, "416 Range Not Satisfiable", 0, "bytes */" + total, null);
            return !request.close;
        }

        // At offset 0, Android MediaHTTPConnection normally sends no Range header and uses the
        // int-valued URLConnection.getContentLength() for HTTP 200. Native MediaHTTP caches that
        // size, so Matroska treats large files as unseekable live streams. Use a whole-file 206
        // here to make the platform read the long total from Content-Range, including on rewind.
        final boolean partial = requestedRange != null || total > Integer.MAX_VALUE;
        final String contentRange = partial ? "bytes " + range.start + "-" + range.end + "/" + total : null;
        final long length = range.length();
        writeHeaders(request, out, partial ? "206 Partial Content" : "200 OK", length, contentRange, mimeType);

        if (!"HEAD".equals(request.method) && length > 0 && !copy(channel, out, offset + range.start, length)) {
            return false;
        }
        return !request.close;
    }

    /** @return Null if a syntactically valid range doesn't overlap the file. */
    private static ByteRange parseRange(String range, long total) {
        int dash = range.indexOf('-');
        if (dash < 0) throw new IllegalArgumentException("Missing range separator");

        if (dash == 0) {
            long suffix = decimal(range, 1, range.length());
            return suffix == 0 || total == 0 ? null : new ByteRange(Math.max(0, total - suffix), total - 1);
        }

        long start = decimal(range, 0, dash);
        long end = dash == range.length() - 1 ? total - 1 : Math.min(decimal(range, dash + 1, range.length()),
                total - 1);
        return start > end ? null : new ByteRange(start, end);
    }

    private static long decimal(String value, int start, int end) {
        if (start == end) throw new IllegalArgumentException("Missing range bound");
        long result = 0;
        for (int index = start; index < end; index++) {
            int digit = value.charAt(index) - '0';
            if (digit < 0 || digit > 9) throw new IllegalArgumentException("Invalid range bound");
            // Larger starts never overlap; larger ends and suffixes can be clamped to the file.
            result = result > (Long.MAX_VALUE - digit) / 10 ? Long.MAX_VALUE : result * 10 + digit;
        }
        return result;
    }

    private static boolean copy(FileChannel channel, OutputStream out, long offset, long remaining) throws IOException {
        ByteBuffer buffer = ByteBuffer.allocate((int) Math.min(BUFFER_SIZE, remaining));
        while (remaining > 0) {
            buffer.clear();
            buffer.limit((int) Math.min(buffer.capacity(), remaining));
            int count = channel.read(buffer, offset);
            if (count <= 0) return false; // The file was truncated after the headers; close, never reuse the socket.
            out.write(buffer.array(), 0, count);
            offset += count;
            remaining -= count;
        }
        return true;
    }

    private static void writeHeaders(Request request, OutputStream out, String status, long length,
                                     String contentRange, String mimeType) throws IOException {
        String headers = "HTTP/1.1 " + status + "\r\n"
                + (mimeType == null ? "" : "Content-Type: " + mimeType + "\r\n")
                + "Accept-Ranges: bytes\r\n"
                + "Content-Length: " + length + "\r\n"
                + (contentRange == null ? "" : "Content-Range: " + contentRange + "\r\n")
                + (request.close ? "Connection: close\r\n" : "") + "\r\n";
        out.write(headers.getBytes(StandardCharsets.ISO_8859_1));
    }

    static void writeStatus(OutputStream out, String status) throws IOException {
        out.write(("HTTP/1.1 " + status + "\r\nContent-Length: 0\r\nConnection: close\r\n\r\n")
                .getBytes(StandardCharsets.ISO_8859_1));
    }
}

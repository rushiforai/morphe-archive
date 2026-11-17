/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import com.google.protobuf.CodedInputStream;

import java.io.IOException;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.utils.Utils;

/** One-shot confirmation evidence. Opaque context/parameters are never traversed or formatted. */
final class SmartShuffleKeepDiagnostics {
    static final int MAX_BYTES = 256 * 1024;
    static final int MAX_SCANNED_BYTES = 512 * 1024;
    static final int MAX_DEPTH = 16;
    static final int MAX_NODES = 512;
    static final int MAX_LINES = 384;

    private enum Kind { REQUEST, ACTION, RESPONSE, RESULT, ADDED }

    private SmartShuffleKeepDiagnostics() {}

    static void dump(long occurrenceId, String videoId, String destination, String reason,
                     Object request, Object response, byte[] requestBytes, byte[] responseBytes) {
        if (!Utils.isContextSet() || !BaseSettings.DEBUG.get()) return;

        // Never serialize an unowned/foreign callback merely to diagnose it.
        Dump dump = new Dump(occurrenceId, videoId, destination);
        dump.line("reason=" + reason + " role=request native-class=" + type(request)
                + " bytes=" + size(requestBytes));
        dump.line("role=response native-class=" + type(response) + " bytes=" + size(responseBytes));
        dump.inspect(requestBytes, "request", Kind.REQUEST);
        dump.inspect(responseBytes, "response", Kind.RESPONSE);
    }


    private static String type(Object value) {
        return value == null ? "null" : value.getClass().getName();
    }

    private static String size(byte[] bytes) {
        return bytes == null ? "unavailable" : Integer.toString(bytes.length);
    }

    private static final class Dump {
        final long occurrenceId;
        final String videoId;
        final String destination;
        int lines;
        int nodes;
        int scanned;
        boolean truncated;

        Dump(long occurrenceId, String videoId, String destination) {
            this.occurrenceId = occurrenceId;
            this.videoId = videoId;
            this.destination = destination;
        }

        void line(String structure) {
            if (truncated) return;
            if (lines >= MAX_LINES - 1) {
                truncate("lines");
                return;
            }
            lines++;
            SmartShuffleManager.debug(() -> "Smart Shuffle Keep confirmation occurrence=" + occurrenceId
                    + " " + structure);
        }

        void truncate(String reason) {
            if (truncated) return;
            truncated = true;
            lines++;
            SmartShuffleManager.debug(() -> "Smart Shuffle Keep confirmation occurrence=" + occurrenceId
                    + " TRUNCATED reason=" + reason + " nodes=" + nodes + " scanned-bytes=" + scanned);
        }

        void inspect(byte[] bytes, String path, Kind kind) {
            if (bytes == null) line("path=" + path + " status=encoding-unavailable");
            else if (bytes.length > MAX_BYTES) truncate("bytes");
            else walk(bytes, 0, bytes.length, path, kind, 0);
        }

        void walk(byte[] bytes, int offset, int length, String path, Kind kind, int depth) {
            if (truncated) return;
            if (depth > MAX_DEPTH) {
                truncate("depth");
                return;
            }
            if (++nodes > MAX_NODES) {
                truncate("nodes");
                return;
            }
            if (length > MAX_SCANNED_BYTES - scanned) {
                truncate("scanned-bytes");
                return;
            }
            scanned += length;
            line("path=" + path + " kind=" + kind.name().toLowerCase(java.util.Locale.ROOT) + " bytes=" + length);
            CodedInputStream input = CodedInputStream.newInstance(bytes, offset, length);
            int index = 0;
            try {
                for (int tag; !truncated && (tag = input.readTag()) != 0; index++) {
                    int field = tag >>> 3;
                    int wire = tag & 7;
                    String at = path + "/" + field + "[" + index + "]";
                    if (wire == 2) {
                        int size = input.readRawVarint32();
                        int start = offset + input.getTotalBytesRead();
                        input.skipRawBytes(size);
                        String detail = "path=" + at + " field=" + field + " wire=2 bytes=" + size;
                        if ((kind == Kind.ACTION && field == 2) || (kind == Kind.ADDED && field == 1)) {
                            detail += " video-match=" + matches(bytes, start, size, videoId);
                        } else if ((kind == Kind.REQUEST && field == 3) || (kind == Kind.RESPONSE && field == 20)) {
                            detail += " destination-known=" + (destination != null) + " destination-match="
                                    + matches(bytes, start, size, destination);
                        } else if (kind == Kind.ADDED && field == 2) {
                            detail += " has-entry=" + (size != 0);
                        }
                        line(detail);
                        Kind child = kind == Kind.REQUEST && field == 2 ? Kind.ACTION
                                : kind == Kind.RESPONSE && field == 12 ? Kind.RESULT
                                : kind == Kind.RESULT && field == 138418859 ? Kind.ADDED : null;
                        if (child != null) walk(bytes, start, size, at, child, depth + 1);
                    } else if (wire == 0) {
                        long value = input.readUInt64();
                        String detail = "path=" + at + " field=" + field + " wire=0";
                        if (kind == Kind.ACTION && field == 6) detail += " action-add=" + (value == 1);
                        if (kind == Kind.RESPONSE && field == 2) detail += " status-success=" + (value == 1);
                        line(detail);
                    } else {
                        if (wire == 3 || wire == 4 || !input.skipField(tag)) throw new IOException();
                        line("path=" + at + " field=" + field + " wire=" + wire);
                    }
                }
            } catch (IOException | RuntimeException ignored) {
                line("path=" + path + " status=malformed");
            }
        }

        private static boolean matches(byte[] bytes, int start, int size, String expected) {
            if (expected == null || expected.length() != size) return false;
            for (int index = 0; index < size; index++) {
                char value = expected.charAt(index);
                if (value > 127 || value != (bytes[start + index] & 0xff)) return false;
            }
            return true;
        }
    }
}

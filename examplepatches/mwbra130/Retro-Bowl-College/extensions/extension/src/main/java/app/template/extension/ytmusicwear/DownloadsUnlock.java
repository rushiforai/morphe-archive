package app.template.extension.ytmusicwear;

import java.io.ByteArrayOutputStream;

/**
 * YouTube Music (Wear OS) — downloads unlock, extension side.
 *
 * A raw protobuf wire-format editor for the app's OfflineabilityRenderer
 * message (the value the offline save path consults before saving a
 * video or playlist). It deliberately uses no generated proto classes
 * and no protobuf library: the message is small, its layout is stable,
 * and editing at the wire level preserves every field this code does
 * not touch byte-for-byte, including fields from newer proto revisions.
 *
 * Message layout (from the official Morphe patches' offline.proto,
 * which declares only the fields that are read or changed):
 *
 *   OfflineabilityRenderer {
 *     bool offlineable = 1;
 *     bytes notOfflineableDialog = 2;
 *     repeated OfflineFormat formats = 3;
 *   }
 *   OfflineFormat {
 *     OfflineFormatLabel name = 1;
 *     OfflineFormatType formatType = 3;
 *     OfflineFormatAvailability availability = 4;  // 1=FREE, 2=PREMIUM_LOCKED
 *   }
 *
 * Semantics mirror the official Morphe extension's unlockOfflineability:
 * - If the renderer is already offlineable and no format is
 *   PREMIUM_LOCKED, return null (caller keeps the original object).
 * - Otherwise return rewritten bytes: offlineable set to true, the
 *   not-offlineable dialog removed, and every PREMIUM_LOCKED format's
 *   availability flipped to FREE.
 * - If there are no formats at all, return null: the official code
 *   synthesizes default formats in that case, but on the Wear build an
 *   empty format list means there is nothing concrete to unlock, and
 *   inventing formats the server never offered is not attempted.
 * - Any malformed input returns null. This editor must never break a
 *   save: worst case is the app's original behavior.
 */
public final class DownloadsUnlock {

    private DownloadsUnlock() {
    }

    private static final int FIELD_OFFLINEABLE = 1;
    private static final int FIELD_NOT_OFFLINEABLE_DIALOG = 2;
    private static final int FIELD_FORMATS = 3;
    private static final int FORMAT_FIELD_AVAILABILITY = 4;

    private static final int WIRETYPE_VARINT = 0;
    private static final int WIRETYPE_FIXED64 = 1;
    private static final int WIRETYPE_LENGTH_DELIMITED = 2;
    private static final int WIRETYPE_FIXED32 = 5;

    private static final long AVAILABILITY_FREE = 1;
    private static final long AVAILABILITY_PREMIUM_LOCKED = 2;

    /** One parsed field: its number, wire type, and source byte span. */
    private static final class Field {
        int number;
        int wireType;
        int spanStart;      // offset of the tag
        int tagEnd;         // offset just past the tag varint
        int payloadStart;   // offset of the payload (past the length prefix, if any)
        int spanEnd;        // offset just past the payload
        long varintValue;   // valid when wireType == WIRETYPE_VARINT
        int length;         // valid when wireType == WIRETYPE_LENGTH_DELIMITED
    }

    private static final class Cursor {
        final byte[] data;
        int pos;

        Cursor(byte[] data) {
            this.data = data;
        }

        long readVarint() {
            long result = 0;
            int shift = 0;
            while (pos < data.length && shift < 70) {
                int b = data[pos++] & 0xFF;
                result |= (long) (b & 0x7F) << shift;
                if ((b & 0x80) == 0) {
                    return result;
                }
                shift += 7;
            }
            throw new IllegalArgumentException("malformed varint");
        }
    }

    private static Field readField(Cursor c) {
        if (c.pos >= c.data.length) {
            return null;
        }
        Field f = new Field();
        f.spanStart = c.pos;
        long tag = c.readVarint();
        f.number = (int) (tag >>> 3);
        f.wireType = (int) (tag & 7);
        f.tagEnd = c.pos;
        f.payloadStart = c.pos;
        switch (f.wireType) {
            case WIRETYPE_VARINT:
                f.varintValue = c.readVarint();
                break;
            case WIRETYPE_FIXED64:
                if (c.pos + 8 > c.data.length) {
                    throw new IllegalArgumentException("truncated fixed64");
                }
                c.pos += 8;
                break;
            case WIRETYPE_LENGTH_DELIMITED: {
                long len = c.readVarint();
                if (len < 0 || len > c.data.length - c.pos) {
                    throw new IllegalArgumentException("bad length");
                }
                f.length = (int) len;
                f.payloadStart = c.pos;
                c.pos += f.length;
                break;
            }
            case WIRETYPE_FIXED32:
                if (c.pos + 4 > c.data.length) {
                    throw new IllegalArgumentException("truncated fixed32");
                }
                c.pos += 4;
                break;
            default:
                throw new IllegalArgumentException("unsupported wire type " + f.wireType);
        }
        f.spanEnd = c.pos;
        return f;
    }

    /**
     * Rewrites one serialized OfflineFormat: availability
     * PREMIUM_LOCKED (2) becomes FREE (1); everything else is copied
     * byte-for-byte.
     *
     * @param lockedOut single-element array, set to true if a locked
     *                  format was found (whether or not it is flipped,
     *                  which it always is when found).
     */
    private static byte[] rewriteFormat(byte[] format, boolean[] lockedOut) {
        ByteArrayOutputStream out = new ByteArrayOutputStream(format.length);
        Cursor c = new Cursor(format);
        Field f;
        while ((f = readField(c)) != null) {
            if (f.number == FORMAT_FIELD_AVAILABILITY
                    && f.wireType == WIRETYPE_VARINT
                    && f.varintValue == AVAILABILITY_PREMIUM_LOCKED) {
                lockedOut[0] = true;
                // Tag bytes verbatim, then the new value.
                out.write(format, f.spanStart, f.payloadStart - f.spanStart);
                out.write((int) AVAILABILITY_FREE);
            } else {
                out.write(format, f.spanStart, f.spanEnd - f.spanStart);
            }
        }
        return out.toByteArray();
    }

    /**
     * @param rendererBytes serialized OfflineabilityRenderer from the app
     * @return rewritten bytes with saving unlocked, or null to keep the
     * original (already unlocked, nothing to unlock, or unreadable input)
     */
    public static byte[] unlockOfflineability(byte[] rendererBytes) {
        if (rendererBytes == null || rendererBytes.length == 0) {
            return null;
        }
        try {
            // Pass 1: analyze.
            boolean offlineable = false;
            boolean sawOfflineable = false;
            int formatCount = 0;
            boolean anyLocked = false;
            Cursor scan = new Cursor(rendererBytes);
            Field f;
            while ((f = readField(scan)) != null) {
                if (f.number == FIELD_OFFLINEABLE && f.wireType == WIRETYPE_VARINT) {
                    sawOfflineable = true;
                    offlineable = f.varintValue != 0;
                } else if (f.number == FIELD_FORMATS
                        && f.wireType == WIRETYPE_LENGTH_DELIMITED) {
                    formatCount++;
                    byte[] formatBytes = new byte[f.length];
                    System.arraycopy(rendererBytes, f.payloadStart, formatBytes, 0, f.length);
                    boolean[] locked = new boolean[1];
                    rewriteFormat(formatBytes, locked);
                    if (locked[0]) {
                        anyLocked = true;
                    }
                }
            }
            if (formatCount == 0) {
                return null;
            }
            if (offlineable && !anyLocked) {
                return null;
            }

            // Pass 2: emit, preserving field order.
            ByteArrayOutputStream out = new ByteArrayOutputStream(rendererBytes.length);
            if (!sawOfflineable) {
                out.write((FIELD_OFFLINEABLE << 3) | WIRETYPE_VARINT);
                out.write(1);
            }
            Cursor emit = new Cursor(rendererBytes);
            while ((f = readField(emit)) != null) {
                if (f.number == FIELD_NOT_OFFLINEABLE_DIALOG) {
                    // Dropped: this dialog is what the app shows instead of saving.
                    continue;
                }
                if (f.number == FIELD_OFFLINEABLE && f.wireType == WIRETYPE_VARINT) {
                    out.write(rendererBytes, f.spanStart, f.payloadStart - f.spanStart);
                    out.write(1);
                } else if (f.number == FIELD_FORMATS
                        && f.wireType == WIRETYPE_LENGTH_DELIMITED) {
                    byte[] formatBytes = new byte[f.length];
                    System.arraycopy(rendererBytes, f.payloadStart, formatBytes, 0, f.length);
                    byte[] rewritten = rewriteFormat(formatBytes, new boolean[1]);
                    out.write(rendererBytes, f.spanStart, f.tagEnd - f.spanStart);
                    writeVarint(out, rewritten.length);
                    out.write(rewritten, 0, rewritten.length);
                } else {
                    out.write(rendererBytes, f.spanStart, f.spanEnd - f.spanStart);
                }
            }
            return out.toByteArray();
        } catch (RuntimeException ex) {
            return null;
        }
    }

    private static void writeVarint(ByteArrayOutputStream out, long value) {
        long v = value;
        while ((v & ~0x7FL) != 0) {
            out.write(((int) v & 0x7F) | 0x80);
            v >>>= 7;
        }
        out.write((int) v);
    }
}

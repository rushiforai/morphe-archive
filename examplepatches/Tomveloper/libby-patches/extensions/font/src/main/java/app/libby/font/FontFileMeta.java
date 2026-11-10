package app.libby.font;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.charset.StandardCharsets;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;

/**
 * Reads the weight and slant metadata of a font file without loading the whole
 * file. Supports sfnt (TTF/OTF) and WOFF1. WOFF2 stores its table directory
 * inside a Brotli stream and Android has no Brotli decoder, so WOFF2 reports
 * {@code ok == false} and the caller falls back to a manual weight.
 */
final class FontFileMeta {

    private static final int MAX_TABLE = 1 << 20;
    private static final int MAX_TABLES = 512;

    /** True when at least one metadata table could be parsed. */
    boolean ok;
    /** True when fvar reports a wght axis wider than a single point. */
    boolean variable;
    /** Default instance weight; the only weight for a static face. */
    int weight = 400;
    int weightMin = 400;
    int weightMax = 400;
    boolean italic;
    /** Short debug reason when ok is false. */
    String reason = "";

    static FontFileMeta read(File file) {
        FontFileMeta meta = new FontFileMeta();
        try (RandomAccessFile raf = new RandomAccessFile(file, "r")) {
            long size = raf.length();
            if (size < 12) {
                meta.reason = "too-small";
                return meta;
            }

            byte[] signature = new byte[4];
            raf.readFully(signature);

            if (is(signature, "wOF2")) {
                meta.reason = "woff2";
            } else if (is(signature, "wOFF")) {
                readWoff(raf, size, meta);
            } else if (is(signature, "ttcf")) {
                meta.reason = "collection";
            } else if (is(signature, "OTTO") || is(signature, "true")
                    || isTrueType(signature) || is(signature, "typ1")) {
                readSfnt(raf, size, meta);
            } else {
                meta.reason = "unknown";
            }
        } catch (Exception e) {
            meta.ok = false;
            meta.reason = "read";
        }
        return meta;
    }

    private static void readSfnt(RandomAccessFile raf, long size, FontFileMeta meta)
            throws IOException {
        raf.seek(4);
        int numTables = raf.readUnsignedShort();
        if (numTables <= 0 || numTables > MAX_TABLES) {
            meta.reason = "tables";
            return;
        }

        long os2 = -1;
        long head = -1;
        long fvar = -1;
        int os2Length = 0;
        int headLength = 0;
        int fvarLength = 0;

        raf.seek(12);
        for (int i = 0; i < numTables; i++) {
            byte[] tag = new byte[4];
            raf.readFully(tag);
            raf.readInt(); // checksum
            long offset = raf.readInt() & 0xFFFFFFFFL;
            long length = raf.readInt() & 0xFFFFFFFFL;
            if (offset <= 0 || length <= 0 || offset + length > size) {
                continue;
            }
            String name = tag(tag);
            if ("OS/2".equals(name)) {
                os2 = offset;
                os2Length = (int) Math.min(length, MAX_TABLE);
            } else if ("head".equals(name)) {
                head = offset;
                headLength = (int) Math.min(length, MAX_TABLE);
            } else if ("fvar".equals(name)) {
                fvar = offset;
                fvarLength = (int) Math.min(length, MAX_TABLE);
            }
        }

        if (os2 >= 0) {
            readOs2(readAt(raf, os2, os2Length), meta);
        }
        if (head >= 0) {
            readHead(readAt(raf, head, headLength), meta);
        }
        if (fvar >= 0) {
            readFvar(readAt(raf, fvar, fvarLength), meta);
        }
        meta.ok = os2 >= 0 || head >= 0 || fvar >= 0;
        if (!meta.ok) {
            meta.reason = "no-metadata";
        }
    }

    private static void readWoff(RandomAccessFile raf, long size, FontFileMeta meta)
            throws IOException {
        raf.seek(12);
        int numTables = raf.readUnsignedShort();
        if (numTables <= 0 || numTables > MAX_TABLES) {
            meta.reason = "tables";
            return;
        }

        raf.seek(44);
        boolean sawOs2 = false;
        boolean sawHead = false;
        boolean sawFvar = false;

        for (int i = 0; i < numTables; i++) {
            byte[] tag = new byte[4];
            raf.readFully(tag);
            long offset = raf.readInt() & 0xFFFFFFFFL;
            long compLength = raf.readInt() & 0xFFFFFFFFL;
            long origLength = raf.readInt() & 0xFFFFFFFFL;
            raf.readInt(); // checksum

            String name = tag(tag);
            if (!"OS/2".equals(name) && !"head".equals(name) && !"fvar".equals(name)) {
                continue;
            }
            if (offset <= 0 || compLength <= 0 || origLength <= 0
                    || offset + compLength > size || origLength > MAX_TABLE) {
                continue;
            }

            byte[] table = readWoffTable(raf, offset, compLength, origLength);
            if (table == null) {
                continue;
            }
            if ("OS/2".equals(name)) {
                readOs2(table, meta);
                sawOs2 = true;
            } else if ("head".equals(name)) {
                readHead(table, meta);
                sawHead = true;
            } else {
                readFvar(table, meta);
                sawFvar = true;
            }
        }

        meta.ok = sawOs2 || sawHead || sawFvar;
        if (!meta.ok) {
            meta.reason = "no-metadata";
        }
    }

    private static byte[] readWoffTable(RandomAccessFile raf, long offset,
                                        long compLength, long origLength) throws IOException {
        byte[] raw = new byte[(int) compLength];
        raf.seek(offset);
        raf.readFully(raw);
        if (compLength == origLength) {
            return raw;
        }
        return inflate(raw, (int) origLength);
    }

    private static byte[] inflate(byte[] input, int outputLength) {
        byte[] out = new byte[outputLength];
        Inflater inflater = new Inflater();
        try {
            inflater.setInput(input);
            int total = 0;
            while (total < outputLength && !inflater.finished()) {
                int written = inflater.inflate(out, total, outputLength - total);
                if (written == 0) {
                    if (inflater.needsInput() || inflater.needsDictionary()) {
                        break;
                    }
                }
                total += written;
            }
            return total == outputLength ? out : null;
        } catch (DataFormatException e) {
            return null;
        } finally {
            inflater.end();
        }
    }

    private static byte[] readAt(RandomAccessFile raf, long offset, int length)
            throws IOException {
        byte[] data = new byte[length];
        raf.seek(offset);
        raf.readFully(data);
        return data;
    }

    private static void readOs2(byte[] table, FontFileMeta meta) {
        if (table == null || table.length < 6) {
            return;
        }
        meta.weight = clamp(u16(table, 4));
        meta.weightMin = meta.weight;
        meta.weightMax = meta.weight;
        if (table.length >= 64 && (u16(table, 62) & 0x01) != 0) {
            meta.italic = true;
        }
    }

    private static void readHead(byte[] table, FontFileMeta meta) {
        if (table != null && table.length >= 46 && (u16(table, 44) & 0x02) != 0) {
            meta.italic = true;
        }
    }

    private static void readFvar(byte[] table, FontFileMeta meta) {
        if (table == null || table.length < 16) {
            return;
        }
        int axesOffset = u16(table, 4);
        int axisCount = u16(table, 8);
        int axisSize = u16(table, 10);
        if (axisCount <= 0 || axisCount > 64 || axisSize < 20 || axesOffset <= 0) {
            return;
        }

        for (int i = 0; i < axisCount; i++) {
            int axis = axesOffset + i * axisSize;
            if (axis + 16 > table.length) {
                break;
            }
            if (!"wght".equals(tag(table, axis))) {
                continue;
            }
            int min = fixed(table, axis + 4);
            int def = fixed(table, axis + 8);
            int max = fixed(table, axis + 12);
            if (max < min) {
                int swap = min;
                min = max;
                max = swap;
            }
            if (max > min) {
                meta.variable = true;
                meta.weightMin = clamp(min);
                meta.weightMax = clamp(max);
                meta.weight = clamp(def);
            }
            return;
        }
    }

    private static int clamp(int weight) {
        return Math.max(1, Math.min(1000, weight));
    }

    private static boolean is(byte[] data, String text) {
        if (data == null || data.length < text.length()) {
            return false;
        }
        for (int i = 0; i < text.length(); i++) {
            if ((data[i] & 0xff) != text.charAt(i)) {
                return false;
            }
        }
        return true;
    }

    private static boolean isTrueType(byte[] signature) {
        return signature.length >= 4 && signature[0] == 0 && signature[1] == 1
                && signature[2] == 0 && signature[3] == 0;
    }

    private static String tag(byte[] table, int offset) {
        return new String(table, offset, 4, StandardCharsets.US_ASCII);
    }

    private static String tag(byte[] tag) {
        return new String(tag, StandardCharsets.US_ASCII);
    }

    private static int u16(byte[] data, int offset) {
        return ((data[offset] & 0xff) << 8) | (data[offset + 1] & 0xff);
    }

    private static int fixed(byte[] data, int offset) {
        int value = ((data[offset] & 0xff) << 24)
                | ((data[offset + 1] & 0xff) << 16)
                | ((data[offset + 2] & 0xff) << 8)
                | (data[offset + 3] & 0xff);
        return Math.round(value / 65536f);
    }
}

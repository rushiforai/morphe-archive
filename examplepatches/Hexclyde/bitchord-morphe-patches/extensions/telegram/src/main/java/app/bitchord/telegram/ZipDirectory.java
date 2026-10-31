package app.bitchord.telegram;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;

/**
 * Reads what's in a zip without downloading it: the list of files sits at the end of the archive,
 * and each file's data can be read from where it starts. Albums shared as zips are almost always
 * stored without compression (FLAC doesn't compress further), so a song inside can be read
 * directly; deflated ones are decompressed as they're read.
 */
final class ZipDirectory {
    private ZipDirectory() {}

    /** Reads bytes of the zip on Telegram, downloading only that part. */
    interface Range {
        byte[] read(long offset, int length) throws Exception;
    }

    /** What the player reads a song from when it isn't a file of its own: in a zip, or a track. */
    interface Source {
        /** Up to {@code length} bytes at {@code position}; -1 at the end. */
        int read(long position, byte[] buffer, int offset, int length) throws Exception;

        void close();
    }

    static final int STORED = 0, DEFLATED = 8;

    /** The end record and its comment always fit in the last 64 KB and 22 bytes. */
    static final int TAIL = 65_557;

    /** Larger lists than this aren't read; no album needs that many entries. */
    static final int MAX_DIRECTORY = 16 * 1024 * 1024;

    static final Set<String> AUDIO =
            new HashSet<>(
                    Arrays.asList(
                            "flac", "wav", "aiff", "aif", "alac", "m4a", "mp3", "ogg", "opus",
                            "aac"));

    static final class Entry {
        /** Position in the zip's list, from 1. */
        final int index;

        final String name;
        final int method, flags;
        final long compressedSize, size, localOffset;

        Entry(
                int index,
                String name,
                int method,
                int flags,
                long compressedSize,
                long size,
                long localOffset) {
            this.index = index;
            this.name = name;
            this.method = method;
            this.flags = flags;
            this.compressedSize = compressedSize;
            this.size = size;
            this.localOffset = localOffset;
        }

        /** An audio file this can play: not a folder, not encrypted, stored or deflated. */
        boolean playable() {
            if (name.endsWith("/") || (flags & 1) != 0) return false;
            if (method != STORED && method != DEFLATED) return false;
            String base = baseName();
            if (base.startsWith("._") || name.startsWith("__MACOSX/")) return false;
            int dot = base.lastIndexOf('.');
            return dot > 0 && AUDIO.contains(base.substring(dot + 1).toLowerCase(Locale.ROOT));
        }

        String baseName() {
            int slash = name.lastIndexOf('/');
            return slash < 0 ? name : name.substring(slash + 1);
        }

        /** The folder it's in, or "". */
        String folder() {
            int slash = name.lastIndexOf('/');
            if (slash <= 0) return "";
            String path = name.substring(0, slash);
            int up = path.lastIndexOf('/');
            return up < 0 ? path : path.substring(up + 1);
        }

        String extension() {
            String base = baseName();
            return base.substring(base.lastIndexOf('.') + 1).toLowerCase(Locale.ROOT);
        }
    }

    /** The zip's list of files, read from its end. */
    static List<Entry> read(Range range, long fileSize) throws Exception {
        if (fileSize < 22) throw new IOException("Not a zip");
        long tailStart = Math.max(0, fileSize - TAIL);
        byte[] tail = range.read(tailStart, (int) (fileSize - tailStart));
        int end = -1;
        for (int at = tail.length - 22; at >= 0; at--)
            if (u32(tail, at) == 0x06054b50L && at + 22 + u16(tail, at + 20) == tail.length) {
                end = at;
                break;
            }
        if (end < 0)
            for (int at = tail.length - 22; at >= 0; at--)
                if (u32(tail, at) == 0x06054b50L) {
                    end = at;
                    break;
                }
        if (end < 0) throw new IOException("Not a zip, or not a whole one");
        if (u16(tail, end + 4) != 0 || u16(tail, end + 6) != 0)
            throw new IOException("Zips split into parts aren't supported");
        long count = u16(tail, end + 10), size = u32(tail, end + 12), offset = u32(tail, end + 16);
        if (count == 0xffff || size == 0xffffffffL || offset == 0xffffffffL) {
            int locator = end - 20;
            if (locator < 0 || u32(tail, locator) != 0x07064b50L)
                throw new IOException("Damaged zip64 end record");
            long at = u64(tail, locator + 8);
            byte[] record =
                    at >= tailStart && at + 56 <= fileSize
                            ? Arrays.copyOfRange(
                                    tail, (int) (at - tailStart), (int) (at - tailStart) + 56)
                            : range.read(at, 56);
            if (u32(record, 0) != 0x06064b50L) throw new IOException("Damaged zip64 end record");
            count = u64(record, 32);
            size = u64(record, 40);
            offset = u64(record, 48);
        }
        if (size > MAX_DIRECTORY || offset + size > fileSize)
            throw new IOException("The zip's list of files is too large or damaged");
        byte[] list =
                offset >= tailStart
                        ? Arrays.copyOfRange(
                                tail, (int) (offset - tailStart), (int) (offset - tailStart + size))
                        : range.read(offset, (int) size);
        List<Entry> entries = new ArrayList<>();
        int at = 0;
        for (int i = 1; i <= count && at + 46 <= list.length; i++) {
            if (u32(list, at) != 0x02014b50L) throw new IOException("Damaged zip list");
            int flags = u16(list, at + 8), method = u16(list, at + 10);
            long compressed = u32(list, at + 20), plain = u32(list, at + 24);
            int nameLength = u16(list, at + 28),
                    extra = u16(list, at + 30),
                    comment = u16(list, at + 32);
            long local = u32(list, at + 42);
            if (at + 46 + nameLength + extra > list.length)
                throw new IOException("Damaged zip list");
            String name = name(list, at + 46, nameLength, (flags & 0x800) != 0);
            // Zip64 sizes and offsets, in this order, for the fields that overflowed.
            int e = at + 46 + nameLength, endExtra = e + extra;
            while (e + 4 <= endExtra) {
                int id = u16(list, e), length = u16(list, e + 2);
                if (id == 0x0001) {
                    int v = e + 4;
                    if (plain == 0xffffffffL && v + 8 <= e + 4 + length) {
                        plain = u64(list, v);
                        v += 8;
                    }
                    if (compressed == 0xffffffffL && v + 8 <= e + 4 + length) {
                        compressed = u64(list, v);
                        v += 8;
                    }
                    if (local == 0xffffffffL && v + 8 <= e + 4 + length) local = u64(list, v);
                }
                e += 4 + length;
            }
            entries.add(new Entry(i, name, method, flags, compressed, plain, local));
            at += 46 + nameLength + extra + comment;
        }
        return entries;
    }

    /** Where an entry's data starts, from its local header (the 30 bytes, name and extra). */
    static long dataOffset(byte[] local, Entry entry) throws IOException {
        if (local.length < 30 || u32(local, 0) != 0x04034b50L)
            throw new IOException("Damaged zip entry");
        return entry.localOffset + 30 + u16(local, 26) + u16(local, 28);
    }

    /** UTF-8 when the zip says so or when it's valid UTF-8; otherwise the old DOS code page. */
    static String name(byte[] b, int at, int length, boolean utf8) {
        if (utf8) return new String(b, at, length, StandardCharsets.UTF_8);
        try {
            CharBuffer chars =
                    StandardCharsets.UTF_8
                            .newDecoder()
                            .onMalformedInput(CodingErrorAction.REPORT)
                            .onUnmappableCharacter(CodingErrorAction.REPORT)
                            .decode(ByteBuffer.wrap(b, at, length));
            return chars.toString();
        } catch (CharacterCodingException e) {
            StringBuilder text = new StringBuilder();
            for (int i = 0; i < length; i++) {
                int c = b[at + i] & 0xff;
                text.append(c < 128 ? (char) c : CP437_HIGH.charAt(c - 128));
            }
            return text.toString();
        }
    }

    /** The upper half of the DOS code page old zip tools write names in. */
    private static final String CP437_HIGH =
            "ÇüéâäàåçêëèïîìÄÅÉæÆôöòûùÿÖÜ¢£¥₧ƒáíóúñÑªº¿⌐¬½¼¡«»░▒▓│┤╡╢╖╕╣║╗╝╜╛┐"
                    + "└┴┬├─┼╞╟╚╔╩╦╠═╬╧╨╤╥╙╘╒╓╫╪┘┌█▄▌▐▀αßΓπΣσµτΦΘΩδ∞φε∩≡±≥≤⌠⌡÷≈°∙·√ⁿ²■\u00a0";

    /**
     * Reads an entry's uncompressed bytes from {@code position}: stored entries straight from the
     * zip, deflated ones decompressed from the entry's start.
     */
    static final class EntryReader implements Source {
        final Range range;
        final long data, compressedSize, size;
        final int method;
        private Inflater inflater;
        private long fed, produced;
        private final byte[] chunk = new byte[64 * 1024];

        EntryReader(Range range, long data, int method, long compressedSize, long size) {
            this.range = range;
            this.data = data;
            this.method = method;
            this.compressedSize = compressedSize;
            this.size = size;
        }

        @Override
        public int read(long position, byte[] buffer, int offset, int length) throws Exception {
            if (position >= size) return -1;
            int wanted = (int) Math.min(length, size - position);
            if (method == STORED) {
                byte[] bytes = range.read(data + position, wanted);
                System.arraycopy(bytes, 0, buffer, offset, bytes.length);
                return bytes.length;
            }
            if (inflater == null || position < produced) {
                if (inflater != null) inflater.end();
                inflater = new Inflater(true);
                fed = 0;
                produced = 0;
            }
            // Decompress and drop whatever comes before the position asked for.
            byte[] skip = position > produced ? new byte[64 * 1024] : null;
            while (true) {
                if (inflater.needsInput()) {
                    if (fed >= compressedSize) {
                        if (produced >= size) return -1;
                        throw new IOException("Damaged zip entry: it ends early");
                    }
                    int n = (int) Math.min(chunk.length, compressedSize - fed);
                    byte[] bytes = range.read(data + fed, n);
                    inflater.setInput(bytes, 0, bytes.length);
                    fed += bytes.length;
                }
                int got;
                try {
                    if (position > produced) {
                        got =
                                inflater.inflate(
                                        skip, 0, (int) Math.min(skip.length, position - produced));
                        produced += got;
                        if (got == 0 && inflater.finished()) return -1;
                        continue;
                    }
                    got = inflater.inflate(buffer, offset, wanted);
                } catch (DataFormatException e) {
                    throw new IOException("Damaged zip entry", e);
                }
                produced += got;
                if (got > 0) return got;
                if (inflater.finished()) return -1;
            }
        }

        @Override
        public void close() {
            if (inflater != null) inflater.end();
            inflater = null;
        }
    }

    static int u16(byte[] b, int at) {
        return (b[at] & 0xff) | (b[at + 1] & 0xff) << 8;
    }

    static long u32(byte[] b, int at) {
        return (u16(b, at) | (long) u16(b, at + 2) << 16) & 0xffffffffL;
    }

    static long u64(byte[] b, int at) {
        return u32(b, at) | u32(b, at + 4) << 32;
    }
}

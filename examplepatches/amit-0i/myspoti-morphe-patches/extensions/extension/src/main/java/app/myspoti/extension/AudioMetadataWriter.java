package app.myspoti.extension;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

/** Writes the metadata Myspoti already stores into the exported audio container. */
final class AudioMetadataWriter {
    private AudioMetadataWriter() {}

    static boolean supportsLyricsEmbedding(String extension) {
        if (extension == null) return false;
        String value = extension.toLowerCase(Locale.ROOT);
        return "mp3".equals(value) || "flac".equals(value) || "m4a".equals(value) || "mp4".equals(value);
    }

    static boolean writeTagged(File input, File output, String title, String artist, String album,
                               long durationMs, File cover) throws IOException {
        return writeTagged(input, output, title, artist, album, durationMs, cover, null);
    }

    static boolean writeTagged(File input, File output, String title, String artist, String album,
                               long durationMs, File cover, String lyrics) throws IOException {
        String name = input.getName().toLowerCase(Locale.ROOT);
        if (name.endsWith(".mp3")) {
            writeMp3(input, output, title, artist, album, durationMs, cover, lyrics);
            return true;
        }
        if (name.endsWith(".flac")) {
            writeFlac(input, output, title, artist, album, cover, lyrics);
            return true;
        }
        if (name.endsWith(".m4a") || name.endsWith(".mp4")) {
            writeMp4(input, output, title, artist, album, cover, lyrics);
            return true;
        }
        copyFile(input, output);
        return false;
    }

    // ---------------------------------------------------------------------
    // MP3: ID3v2.3 text frames + front-cover APIC frame.
    // ---------------------------------------------------------------------

    private static void writeMp3(File input, File output, String title, String artist, String album,
                                 long durationMs, File cover, String lyrics) throws IOException {
        ByteArrayOutputStream frames = new ByteArrayOutputStream();
        if (!empty(title)) writeId3TextFrame(frames, "TIT2", title);
        if (!empty(artist)) writeId3TextFrame(frames, "TPE1", artist);
        if (!empty(album)) writeId3TextFrame(frames, "TALB", album);
        if (!empty(artist)) writeId3TextFrame(frames, "TPE2", artist);
        if (durationMs > 0) writeId3TextFrame(frames, "TLEN", Long.toString(durationMs));
        if (cover != null && cover.isFile() && cover.length() > 0 && cover.length() < 16L * 1024L * 1024L) {
            writeId3PictureFrame(frames, cover);
        }
        if (!empty(lyrics)) writeId3LyricsFrame(frames, lyrics);

        byte[] payload = frames.toByteArray();
        try (OutputStream out = new FileOutputStream(output); InputStream in = new FileInputStream(input)) {
            out.write(new byte[] {'I', 'D', '3', 3, 0, 0});
            out.write(synchsafe(payload.length));
            out.write(payload);
            copy(in, out);
        }
    }

    private static void writeId3TextFrame(OutputStream out, String id, String value) throws IOException {
        ByteArrayOutputStream payload = new ByteArrayOutputStream();
        payload.write(1); // UTF-16 with BOM, valid for ID3v2.3.
        payload.write(value.getBytes(StandardCharsets.UTF_16));
        writeId3Frame(out, id, payload.toByteArray());
    }

    /** ID3v2.3 USLT frame: standard unsynchronised lyric text for common third-party players. */
    private static void writeId3LyricsFrame(OutputStream out, String lyrics) throws IOException {
        ByteArrayOutputStream payload = new ByteArrayOutputStream();
        payload.write(1); // UTF-16 with BOM.
        payload.write(new byte[] { 'e', 'n', 'g' });
        // ID3v2.3's UTF-16 strings require a BOM at the start of each string. Use
        // little-endian BOMs for the empty descriptor and lyric text; this layout is
        // accepted by FFmpeg/FFprobe and common ID3 readers.
        payload.write(0xff); payload.write(0xfe);
        payload.write(0); payload.write(0); // Empty UTF-16 descriptor terminator.
        payload.write(0xff); payload.write(0xfe);
        payload.write(lyrics.getBytes(StandardCharsets.UTF_16LE));
        writeId3Frame(out, "USLT", payload.toByteArray());
    }

    private static void writeId3PictureFrame(OutputStream out, File cover) throws IOException {
        byte[] image = readLimited(cover, 16 * 1024 * 1024);
        String mime = imageMime(cover, image);
        ByteArrayOutputStream payload = new ByteArrayOutputStream(image.length + 32);
        payload.write(0); // ISO-8859-1 fields in APIC.
        payload.write(mime.getBytes(StandardCharsets.ISO_8859_1));
        payload.write(0);
        payload.write(3); // Front cover.
        payload.write(0); // Empty description.
        payload.write(image);
        writeId3Frame(out, "APIC", payload.toByteArray());
    }

    private static void writeId3Frame(OutputStream out, String id, byte[] payload) throws IOException {
        out.write(id.getBytes(StandardCharsets.US_ASCII));
        writeInt(out, payload.length);
        out.write(0);
        out.write(0);
        out.write(payload);
    }

    private static byte[] synchsafe(int value) {
        return new byte[] {(byte) ((value >>> 21) & 0x7f), (byte) ((value >>> 14) & 0x7f),
                (byte) ((value >>> 7) & 0x7f), (byte) (value & 0x7f)};
    }

    // ---------------------------------------------------------------------
    // FLAC: Vorbis comments + PICTURE metadata blocks, with audio frames copied byte-for-byte.
    // ---------------------------------------------------------------------

    private static void writeFlac(File input, File output, String title, String artist, String album,
                                  File cover, String lyrics) throws IOException {
        List<FlacBlock> preserved = new ArrayList<>();
        boolean streamInfo = false;
        try (InputStream in = new FileInputStream(input)) {
            byte[] magic = readExact(in, 4);
            if (!Arrays.equals(magic, new byte[] {'f', 'L', 'a', 'C'})) throw new IOException("Invalid FLAC stream header");
            boolean last = false;
            while (!last) {
                byte[] header = readExact(in, 4);
                last = (header[0] & 0x80) != 0;
                int type = header[0] & 0x7f;
                int size = ((header[1] & 0xff) << 16) | ((header[2] & 0xff) << 8) | (header[3] & 0xff);
                byte[] data = readExact(in, size);
                if (type == 0) streamInfo = true;
                if (type != 4 && type != 6) preserved.add(new FlacBlock(type, data));
            }
            if (!streamInfo) throw new IOException("FLAC STREAMINFO metadata block is missing");

            List<FlacBlock> blocks = new ArrayList<>(preserved);
            blocks.add(new FlacBlock(4, vorbisComments(title, artist, album, lyrics)));
            if (cover != null && cover.isFile() && cover.length() > 0 && cover.length() < 16L * 1024L * 1024L) {
                blocks.add(new FlacBlock(6, flacPicture(cover)));
            }

            try (OutputStream out = new FileOutputStream(output)) {
                out.write(magic);
                for (int i = 0; i < blocks.size(); i++) {
                    FlacBlock block = blocks.get(i);
                    if (block.data.length > 0xffffff) throw new IOException("FLAC metadata block is too large");
                    out.write((block.type & 0x7f) | (i == blocks.size() - 1 ? 0x80 : 0));
                    out.write((block.data.length >>> 16) & 0xff);
                    out.write((block.data.length >>> 8) & 0xff);
                    out.write(block.data.length & 0xff);
                    out.write(block.data);
                }
                copy(in, out); // Audio frames begin immediately after the last metadata block.
            }
        }
    }

    private static final class FlacBlock {
        final int type;
        final byte[] data;
        FlacBlock(int type, byte[] data) { this.type = type; this.data = data; }
    }

    private static byte[] vorbisComments(String title, String artist, String album, String lyrics) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        DataOutputStream out = new DataOutputStream(bytes);
        writeLittleInt(out, 7);
        out.write("MySpoti".getBytes(StandardCharsets.UTF_8));
        List<String> comments = new ArrayList<>();
        if (!empty(title)) comments.add("TITLE=" + title);
        if (!empty(artist)) {
            comments.add("ARTIST=" + artist);
            comments.add("ALBUMARTIST=" + artist);
        }
        if (!empty(album)) comments.add("ALBUM=" + album);
        if (!empty(lyrics)) comments.add("LYRICS=" + lyrics.replace("\r", ""));
        writeLittleInt(out, comments.size());
        for (String comment : comments) {
            byte[] value = comment.getBytes(StandardCharsets.UTF_8);
            writeLittleInt(out, value.length);
            out.write(value);
        }
        out.flush();
        return bytes.toByteArray();
    }

    private static byte[] flacPicture(File cover) throws IOException {
        byte[] image = readLimited(cover, 16 * 1024 * 1024);
        ByteArrayOutputStream bytes = new ByteArrayOutputStream(image.length + 64);
        DataOutputStream out = new DataOutputStream(bytes);
        writeInt(out, 3); // Cover (front).
        byte[] mime = imageMime(cover, image).getBytes(StandardCharsets.US_ASCII);
        writeInt(out, mime.length); out.write(mime);
        writeInt(out, 0); // Empty description.
        writeInt(out, 0); writeInt(out, 0); writeInt(out, 0); writeInt(out, 0); // Unknown dimensions/depth.
        writeInt(out, image.length); out.write(image);
        out.flush();
        return bytes.toByteArray();
    }

    private static void writeLittleInt(DataOutputStream out, int value) throws IOException {
        out.write(value & 0xff); out.write((value >>> 8) & 0xff);
        out.write((value >>> 16) & 0xff); out.write((value >>> 24) & 0xff);
    }

    // ---------------------------------------------------------------------
    // M4A/MP4: iTunes-style ©nam/©ART/©alb/covr atoms; update chunk offsets when moov grows.
    // ---------------------------------------------------------------------

    private static final class TopAtom {
        final long start;
        final long size;
        final int headerSize;
        final String type;
        TopAtom(long start, long size, int headerSize, String type) {
            this.start = start; this.size = size; this.headerSize = headerSize; this.type = type;
        }
    }

    private static void writeMp4(File input, File output, String title, String artist, String album,
                                 File cover, String lyrics) throws IOException {
        try (RandomAccessFile raf = new RandomAccessFile(input, "r")) {
            List<TopAtom> atoms = readTopAtoms(raf);
            TopAtom moov = null;
            boolean mediaAfterMoov = false;
            for (TopAtom atom : atoms) if ("moov".equals(atom.type)) moov = atom;
            if (moov == null) throw new IOException("M4A metadata container (moov) was not found");
            for (TopAtom atom : atoms) if ("mdat".equals(atom.type) && atom.start >= moov.start + moov.size) mediaAfterMoov = true;

            if (moov.size > Integer.MAX_VALUE) throw new IOException("M4A movie metadata is too large");
            byte[] oldMoov = readRange(raf, moov.start, (int) moov.size);
            byte[] newMoov = addMp4Metadata(oldMoov, title, artist, album, cover, lyrics);
            long delta = (long) newMoov.length - moov.size;
            if (mediaAfterMoov && delta != 0) newMoov = adjustChunkOffsets(newMoov, moov.start + moov.size, delta);

            try (OutputStream out = new FileOutputStream(output)) {
                for (TopAtom atom : atoms) {
                    if (atom == moov) {
                        out.write(newMoov);
                    } else {
                        copyRange(raf, atom.start, atom.size, out);
                    }
                }
            }
        }
    }

    private static List<TopAtom> readTopAtoms(RandomAccessFile raf) throws IOException {
        List<TopAtom> atoms = new ArrayList<>();
        long position = 0;
        long fileLength = raf.length();
        while (position + 8 <= fileLength) {
            raf.seek(position);
            long size = readUnsignedInt(raf);
            byte[] typeBytes = new byte[4]; raf.readFully(typeBytes);
            String type = new String(typeBytes, StandardCharsets.ISO_8859_1);
            int header = 8;
            if (size == 1) { size = raf.readLong(); header = 16; }
            else if (size == 0) size = fileLength - position;
            if (size < header || position + size > fileLength) throw new IOException("Invalid M4A atom: " + type);
            atoms.add(new TopAtom(position, size, header, type));
            position += size;
        }
        if (position != fileLength) throw new IOException("Trailing bytes outside M4A atoms");
        return atoms;
    }

    private static byte[] addMp4Metadata(byte[] moov, String title, String artist, String album, File cover, String lyrics) throws IOException {
        String type = boxType(moov);
        if (!"moov".equals(type)) throw new IOException("Invalid M4A moov atom");
        List<byte[]> children = parseBoxes(moov, boxHeaderSize(moov), moov.length);
        byte[] udta = null;
        int udtaIndex = -1;
        for (int i = 0; i < children.size(); i++) if ("udta".equals(boxType(children.get(i)))) { udta = children.get(i); udtaIndex = i; break; }
        byte[] updatedUdta = updateUdta(udta, title, artist, album, cover, lyrics);
        if (udtaIndex >= 0) children.set(udtaIndex, updatedUdta); else children.add(updatedUdta);
        return makeBox("moov", concat(children));
    }

    private static byte[] updateUdta(byte[] udta, String title, String artist, String album, File cover, String lyrics) throws IOException {
        List<byte[]> children = udta == null ? new ArrayList<byte[]>() : parseBoxes(udta, boxHeaderSize(udta), udta.length);
        int metaIndex = -1;
        byte[] meta = null;
        for (int i = 0; i < children.size(); i++) if ("meta".equals(boxType(children.get(i)))) { meta = children.get(i); metaIndex = i; break; }
        byte[] updatedMeta = updateMeta(meta, title, artist, album, cover, lyrics);
        if (metaIndex >= 0) children.set(metaIndex, updatedMeta); else children.add(updatedMeta);
        return makeBox("udta", concat(children));
    }

    private static byte[] updateMeta(byte[] meta, String title, String artist, String album, File cover, String lyrics) throws IOException {
        byte[] fullBox = new byte[] {0, 0, 0, 0};
        List<byte[]> children = new ArrayList<>();
        if (meta != null) {
            int payload = boxHeaderSize(meta);
            if (meta.length < payload + 4) throw new IOException("Malformed M4A meta atom");
            fullBox = Arrays.copyOfRange(meta, payload, payload + 4);
            children = parseBoxes(meta, payload + 4, meta.length);
        }
        boolean hasHandler = false;
        List<byte[]> kept = new ArrayList<>();
        for (byte[] child : children) {
            String type = boxType(child);
            if ("hdlr".equals(type)) hasHandler = true;
            if (!"ilst".equals(type)) kept.add(child);
        }
        if (!hasHandler) kept.add(0, makeHandlerAtom());
        kept.add(makeIlst(title, artist, album, cover, lyrics));
        return makeBox("meta", concatWithPrefix(fullBox, kept));
    }

    private static byte[] makeHandlerAtom() throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        DataOutputStream out = new DataOutputStream(bytes);
        out.writeInt(0); // version + flags
        out.writeInt(0); // pre_defined
        out.write("mdir".getBytes(StandardCharsets.US_ASCII));
        out.write(new byte[12]);
        out.write(0);
        return makeBox("hdlr", bytes.toByteArray());
    }

    private static byte[] makeIlst(String title, String artist, String album, File cover, String lyrics) throws IOException {
        List<byte[]> items = new ArrayList<>();
        if (!empty(title)) items.add(mp4TextItem("©nam", title));
        if (!empty(artist)) {
            items.add(mp4TextItem("©ART", artist));
            items.add(mp4TextItem("aART", artist));
        }
        if (!empty(album)) items.add(mp4TextItem("©alb", album));
        if (!empty(lyrics)) items.add(mp4TextItem("©lyr", lyrics));
        if (cover != null && cover.isFile() && cover.length() > 0 && cover.length() < 16L * 1024L * 1024L) {
            byte[] image = readLimited(cover, 16 * 1024 * 1024);
            int dataType = "image/png".equals(imageMime(cover, image)) ? 14 : 13;
            items.add(mp4DataItem("covr", dataType, image));
        }
        return makeBox("ilst", concat(items));
    }

    private static byte[] mp4TextItem(String type, String value) throws IOException {
        return mp4DataItem(type, 1, value.getBytes(StandardCharsets.UTF_8));
    }

    private static byte[] mp4DataItem(String type, int dataType, byte[] value) throws IOException {
        ByteArrayOutputStream data = new ByteArrayOutputStream(value.length + 8);
        DataOutputStream d = new DataOutputStream(data);
        d.writeInt(dataType); d.writeInt(0); d.write(value);
        return makeBox(type, makeBox("data", data.toByteArray()));
    }

    private static byte[] adjustChunkOffsets(byte[] moov, long threshold, long delta) throws IOException {
        String type = boxType(moov);
        if ("stco".equals(type) || "co64".equals(type)) {
            byte[] copy = moov.clone();
            int payload = boxHeaderSize(copy);
            if (copy.length < payload + 8) throw new IOException("Malformed " + type + " atom");
            long count = unsignedInt(copy, payload + 4);
            int entry = payload + 8;
            int width = "stco".equals(type) ? 4 : 8;
            if (count > (copy.length - entry) / width) throw new IOException("Malformed chunk-offset table");
            for (int i = 0; i < (int) count; i++) {
                int offset = entry + i * width;
                long value = width == 4 ? unsignedInt(copy, offset) : readLong(copy, offset);
                if (value >= threshold) {
                    long shifted = value + delta;
                    if (shifted < 0 || (width == 4 && shifted > 0xffffffffL)) throw new IOException("M4A chunk offset overflow");
                    putLongOrInt(copy, offset, shifted, width);
                }
            }
            return copy;
        }
        if (!isContainer(type)) return moov;
        int payload = boxHeaderSize(moov);
        if ("meta".equals(type)) payload += 4; // FullBox version/flags precede child atoms.
        List<byte[]> children = parseBoxes(moov, payload, moov.length);
        List<byte[]> adjusted = new ArrayList<>(children.size());
        for (byte[] child : children) adjusted.add(adjustChunkOffsets(child, threshold, delta));
        byte[] childBytes = concat(adjusted);
        if ("meta".equals(type)) childBytes = concatWithPrefix(Arrays.copyOfRange(moov, boxHeaderSize(moov), boxHeaderSize(moov) + 4), adjusted);
        return makeBox(type, childBytes);
    }

    private static boolean isContainer(String type) {
        return "moov".equals(type) || "trak".equals(type) || "mdia".equals(type) || "minf".equals(type)
                || "stbl".equals(type) || "edts".equals(type) || "dinf".equals(type) || "udta".equals(type)
                || "meta".equals(type) || "ilst".equals(type) || "mvex".equals(type) || "moof".equals(type)
                || "traf".equals(type);
    }

    private static List<byte[]> parseBoxes(byte[] bytes, int start, int end) throws IOException {
        List<byte[]> boxes = new ArrayList<>();
        int position = start;
        while (position + 8 <= end) {
            long size = unsignedInt(bytes, position);
            int header = 8;
            if (size == 1) {
                if (position + 16 > end) throw new IOException("Truncated extended atom");
                size = readLong(bytes, position + 8); header = 16;
            } else if (size == 0) size = end - position;
            if (size < header || size > Integer.MAX_VALUE || position + size > end) throw new IOException("Malformed nested M4A atom");
            boxes.add(Arrays.copyOfRange(bytes, position, (int) (position + size)));
            position += (int) size;
        }
        if (position != end) throw new IOException("Malformed M4A atom children");
        return boxes;
    }

    private static int boxHeaderSize(byte[] box) throws IOException {
        if (box.length < 8) throw new IOException("Truncated atom header");
        return unsignedInt(box, 0) == 1 ? 16 : 8;
    }

    private static String boxType(byte[] box) throws IOException {
        if (box.length < 8) throw new IOException("Truncated atom");
        return new String(box, 4, 4, StandardCharsets.ISO_8859_1);
    }

    private static byte[] makeBox(String type, byte[] payload) throws IOException {
        byte[] typeBytes = type.getBytes(StandardCharsets.ISO_8859_1);
        if (typeBytes.length != 4) throw new IOException("Invalid MP4 atom type: " + type);
        ByteArrayOutputStream bytes = new ByteArrayOutputStream(payload.length + 8);
        DataOutputStream out = new DataOutputStream(bytes);
        out.writeInt(payload.length + 8); out.write(typeBytes); out.write(payload);
        return bytes.toByteArray();
    }

    private static byte[] concat(List<byte[]> parts) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (byte[] part : parts) out.write(part);
        return out.toByteArray();
    }

    private static byte[] concatWithPrefix(byte[] prefix, List<byte[]> parts) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        out.write(prefix);
        for (byte[] part : parts) out.write(part);
        return out.toByteArray();
    }

    // ---------------------------------------------------------------------
    // Shared file and binary helpers.
    // ---------------------------------------------------------------------

    private static boolean empty(String value) { return value == null || value.trim().isEmpty(); }

    private static String imageMime(File file, byte[] data) {
        if (data.length >= 8 && data[0] == (byte) 0x89 && data[1] == 'P' && data[2] == 'N' && data[3] == 'G') return "image/png";
        if (data.length >= 3 && data[0] == (byte) 0xff && data[1] == (byte) 0xd8 && data[2] == (byte) 0xff) return "image/jpeg";
        return file.getName().toLowerCase(Locale.ROOT).endsWith(".png") ? "image/png" : "image/jpeg";
    }

    private static byte[] readLimited(File file, int max) throws IOException {
        long length = file.length();
        if (length > max) throw new IOException("Cover image is too large to embed");
        try (InputStream in = new FileInputStream(file); ByteArrayOutputStream out = new ByteArrayOutputStream((int) length)) {
            copy(in, out);
            return out.toByteArray();
        }
    }

    private static byte[] readExact(InputStream in, int count) throws IOException {
        byte[] data = new byte[count];
        int offset = 0;
        while (offset < count) {
            int read = in.read(data, offset, count - offset);
            if (read < 0) throw new EOFException("Unexpected end of audio file");
            offset += read;
        }
        return data;
    }

    private static void copyFile(File input, File output) throws IOException {
        try (InputStream in = new FileInputStream(input); OutputStream out = new FileOutputStream(output)) { copy(in, out); }
    }

    private static void copy(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[128 * 1024];
        int count;
        while ((count = in.read(buffer)) != -1) if (count > 0) out.write(buffer, 0, count);
    }

    private static void copyRange(RandomAccessFile raf, long start, long length, OutputStream out) throws IOException {
        raf.seek(start);
        byte[] buffer = new byte[128 * 1024];
        long remaining = length;
        while (remaining > 0) {
            int count = raf.read(buffer, 0, (int) Math.min(buffer.length, remaining));
            if (count < 0) throw new EOFException("Truncated M4A file");
            out.write(buffer, 0, count);
            remaining -= count;
        }
    }

    private static byte[] readRange(RandomAccessFile raf, long start, int length) throws IOException {
        byte[] bytes = new byte[length];
        raf.seek(start); raf.readFully(bytes);
        return bytes;
    }

    private static long readUnsignedInt(RandomAccessFile raf) throws IOException {
        return raf.readInt() & 0xffffffffL;
    }

    private static long unsignedInt(byte[] bytes, int offset) {
        return ((long) (bytes[offset] & 0xff) << 24) | ((long) (bytes[offset + 1] & 0xff) << 16)
                | ((long) (bytes[offset + 2] & 0xff) << 8) | (long) (bytes[offset + 3] & 0xff);
    }

    private static long readLong(byte[] bytes, int offset) {
        long value = 0;
        for (int i = 0; i < 8; i++) value = (value << 8) | (bytes[offset + i] & 0xffL);
        return value;
    }

    private static void putLongOrInt(byte[] bytes, int offset, long value, int width) {
        if (width == 4) {
            bytes[offset] = (byte) (value >>> 24); bytes[offset + 1] = (byte) (value >>> 16);
            bytes[offset + 2] = (byte) (value >>> 8); bytes[offset + 3] = (byte) value;
        } else {
            for (int i = 7; i >= 0; i--) { bytes[offset + i] = (byte) value; value >>>= 8; }
        }
    }

    private static void writeInt(OutputStream out, int value) throws IOException {
        out.write((value >>> 24) & 0xff); out.write((value >>> 16) & 0xff);
        out.write((value >>> 8) & 0xff); out.write(value & 0xff);
    }
}

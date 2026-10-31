package app.bitchord.telegram;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.atomic.AtomicLong;
import java.util.zip.CRC32;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public final class ZipDirectoryTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    /** A FLAC file: header with STREAMINFO, then noise. */
    static byte[] flac(int rate, int bits, long samples, int bodyBytes, long seed) {
        byte[] out = new byte[8 + 34 + bodyBytes];
        System.arraycopy("fLaC".getBytes(StandardCharsets.US_ASCII), 0, out, 0, 4);
        out[4] = (byte) 0x80; // last block, STREAMINFO
        out[7] = 34;
        int s = 8 + 10;
        long packed =
                ((long) rate << 44) | ((long) (2 - 1) << 41) | ((long) (bits - 1) << 36) | samples;
        for (int i = 0; i < 8; i++) out[s + i] = (byte) (packed >>> (56 - 8 * i));
        Random random = new Random(seed);
        for (int i = 8 + 34; i < out.length; i++) out[i] = (byte) random.nextInt(256);
        return out;
    }

    /** A WAV file of silence. */
    static byte[] wav(int rate, int seconds) {
        int data = rate * 2 * 2 * seconds;
        byte[] out = new byte[44 + data];
        String[] tags = {"RIFF", "WAVE", "fmt ", "data"};
        int[] at = {0, 8, 12, 36};
        for (int i = 0; i < 4; i++)
            System.arraycopy(tags[i].getBytes(StandardCharsets.US_ASCII), 0, out, at[i], 4);
        le32(out, 4, 36 + data);
        le32(out, 16, 16);
        out[20] = 1;
        out[22] = 2;
        le32(out, 24, rate);
        le32(out, 28, rate * 4);
        out[32] = 4;
        out[34] = 16;
        le32(out, 40, data);
        return out;
    }

    static void le32(byte[] b, int at, int v) {
        for (int i = 0; i < 4; i++) b[at + i] = (byte) (v >>> (8 * i));
    }

    static void add(ZipOutputStream zip, String name, byte[] data, boolean stored)
            throws Exception {
        ZipEntry e = new ZipEntry(name);
        if (stored) {
            CRC32 crc = new CRC32();
            crc.update(data);
            e.setMethod(ZipEntry.STORED);
            e.setSize(data.length);
            e.setCompressedSize(data.length);
            e.setCrc(crc.getValue());
        }
        zip.putNextEntry(e);
        zip.write(data);
        zip.closeEntry();
    }

    static ZipDirectory.Range over(byte[] zip, AtomicLong read) {
        return (offset, length) -> {
            read.addAndGet(length);
            return Arrays.copyOfRange(
                    zip, (int) offset, (int) Math.min(zip.length, offset + length));
        };
    }

    static byte[] entryBytes(byte[] zip, ZipDirectory.Entry e, ZipDirectory.Range range)
            throws Exception {
        long data = ZipDirectory.dataOffset(range.read(e.localOffset, 30 + 1024), e);
        ZipDirectory.EntryReader reader =
                new ZipDirectory.EntryReader(range, data, e.method, e.compressedSize, e.size);
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[10_000];
        long position = 0;
        int n;
        while ((n = reader.read(position, buffer, 0, buffer.length)) != -1) {
            out.write(buffer, 0, n);
            position += n;
        }
        reader.close();
        return out.toByteArray();
    }

    public static void main(String[] args) throws Exception {
        // Lengths from headers.
        byte[] song = flac(96000, 24, 96000L * 183, 600_000, 1);
        org.json.JSONObject header = AudioHeader.parse(song, 64);
        check(
                header.getInt("seconds") == 183 && header.getInt("bits") == 24,
                "FLAC length: " + header);
        byte[] wave = wav(44100, 3);
        check(AudioHeader.parse(wave, 64).getInt("seconds") == 3, "WAV length");

        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (ZipOutputStream zip = new ZipOutputStream(bytes)) {
            add(zip, "Pink Floyd - The Wall (1979) [FLAC 24-96]/", new byte[0], true);
            add(
                    zip,
                    "Pink Floyd - The Wall (1979) [FLAC 24-96]/01 - In The Flesh.flac",
                    song,
                    true);
            add(
                    zip,
                    "Pink Floyd - The Wall (1979) [FLAC 24-96]/02 - The Thin Ice.wav",
                    wave,
                    false);
            add(zip, "Pink Floyd - The Wall (1979) [FLAC 24-96]/cover.jpg", new byte[5000], false);
            add(zip, "__MACOSX/._01 - In The Flesh.flac", new byte[100], false);
            byte[] big = flac(44100, 16, 44100L * 60, 20_000_000, 2);
            add(zip, "Disc 2/03 - Another Brick In The Wall.flac", big, true);
        }
        byte[] zip = bytes.toByteArray();
        AtomicLong read = new AtomicLong();
        ZipDirectory.Range range = over(zip, read);
        List<ZipDirectory.Entry> entries = ZipDirectory.read(range, zip.length);
        check(
                read.get() <= ZipDirectory.TAIL,
                "Only the end is read: " + read.get() + " bytes of " + zip.length);
        check(entries.size() == 6, "Six entries");
        List<String> playable = new ArrayList<>();
        for (ZipDirectory.Entry e : entries)
            if (e.playable()) playable.add(e.index + " " + e.baseName());
        check(
                playable.equals(
                        List.of(
                                "2 01 - In The Flesh.flac",
                                "3 02 - The Thin Ice.wav",
                                "6 03 - Another Brick In The Wall.flac")),
                "Audio only, no folders, covers or macOS leftovers: " + playable);
        ZipDirectory.Entry first = entries.get(1), second = entries.get(2), third = entries.get(5);
        check(first.folder().equals("Pink Floyd - The Wall (1979) [FLAC 24-96]"), "Folder");
        check(third.folder().equals("Disc 2") && third.extension().equals("flac"), "Nested folder");
        check(
                first.method == ZipDirectory.STORED && second.method == ZipDirectory.DEFLATED,
                "Methods");

        // Every byte comes back as it went in, stored or deflated.
        check(Arrays.equals(entryBytes(zip, first, range), song), "Stored entry");
        check(Arrays.equals(entryBytes(zip, second, range), wave), "Deflated entry");

        // Reading from the middle, and going back, as a player seeking does.
        long data = ZipDirectory.dataOffset(range.read(second.localOffset, 30 + 1024), second);
        ZipDirectory.EntryReader reader =
                new ZipDirectory.EntryReader(
                        range, data, second.method, second.compressedSize, second.size);
        byte[] part = new byte[100];
        int got = reader.read(300_000, part, 0, 100);
        check(
                got > 0
                        && Arrays.equals(
                                Arrays.copyOf(part, got),
                                Arrays.copyOfRange(wave, 300_000, 300_000 + got)),
                "Deflated seek forward");
        got = reader.read(10, part, 0, 100);
        check(
                got > 0
                        && Arrays.equals(
                                Arrays.copyOf(part, got), Arrays.copyOfRange(wave, 10, 10 + got)),
                "Deflated seek back");
        check(reader.read(second.size, part, 0, 100) == -1, "End");
        reader.close();

        // A stored song deep in a large zip reads just its bytes.
        read.set(0);
        long thirdData = ZipDirectory.dataOffset(range.read(third.localOffset, 30 + 1024), third);
        ZipDirectory.EntryReader deep =
                new ZipDirectory.EntryReader(
                        range, thirdData, third.method, third.compressedSize, third.size);
        got = deep.read(10_000_000, part, 0, 100);
        check(
                got == 100 && read.get() < 4096,
                "Seeking a stored song reads only what's needed: " + read.get());

        // Zip64: more entries than the old format can count.
        ByteArrayOutputStream many = new ByteArrayOutputStream();
        try (ZipOutputStream z = new ZipOutputStream(many)) {
            for (int i = 0; i < 70_000; i++) add(z, "t/" + i + ".txt", new byte[0], true);
            add(z, "last.flac", song, true);
        }
        byte[] large = many.toByteArray();
        List<ZipDirectory.Entry> lots =
                ZipDirectory.read(over(large, new AtomicLong()), large.length);
        check(
                lots.size() == 70_001 && lots.get(70_000).baseName().equals("last.flac"),
                "Zip64: " + lots.size());
        check(
                Arrays.equals(
                        entryBytes(large, lots.get(70_000), over(large, new AtomicLong())), song),
                "Zip64 entry");

        // Old zips name files in the DOS code page.
        byte[] dos = {(byte) 0x80, 'a', (byte) 0x82, '.', 'f', 'l', 'a', 'c'};
        check(
                ZipDirectory.name(dos, 0, dos.length, false).equals("Çaé.flac"),
                "Code page 437 names");
        byte[] utf = "Beyoncé.flac".getBytes(StandardCharsets.UTF_8);
        check(
                ZipDirectory.name(utf, 0, utf.length, false).equals("Beyoncé.flac"),
                "UTF-8 without the flag");

        // Not a zip, or only part of one.
        byte[] junk = new byte[5000];
        try {
            ZipDirectory.read(over(junk, new AtomicLong()), junk.length);
            check(false, "Junk read as a zip");
        } catch (java.io.IOException e) {
            check(true, "Junk refused");
        }
        System.out.println(
                "PASS: "
                        + checks
                        + " zip list, zip64, stored and deflated read, and header length checks.");
    }
}

package app.bitchord.telegram;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.file.Files;
import java.util.*;

public final class AudioHeaderTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    static byte[] flac(int rate, int channels, int bits, byte[] prefix) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        out.write(prefix, 0, prefix.length);
        out.write('f');
        out.write('L');
        out.write('a');
        out.write('C');
        out.write(0x80); // last block, STREAMINFO
        out.write(0);
        out.write(0);
        out.write(34);
        byte[] info = new byte[34];
        info[1] = 0x10;
        info[3] = 0x10;
        info[10] = (byte) (rate >> 12);
        info[11] = (byte) (rate >> 4);
        info[12] = (byte) (((rate & 0xf) << 4) | ((channels - 1) << 1) | ((bits - 1) >> 4));
        info[13] = (byte) (((bits - 1) & 0xf) << 4);
        out.write(info, 0, info.length);
        return out.toByteArray();
    }

    static byte[] wav(int rate, int channels, int bits, int format) {
        ByteBuffer b = ByteBuffer.allocate(64).order(ByteOrder.LITTLE_ENDIAN);
        b.put("RIFF".getBytes()).putInt(56).put("WAVE".getBytes());
        b.put("LIST".getBytes()).putInt(4).put("INFO".getBytes()); // a chunk before fmt
        b.put("fmt ".getBytes()).putInt(16).putShort((short) format).putShort((short) channels);
        b.putInt(rate).putInt(rate * channels * bits / 8).putShort((short) (channels * bits / 8));
        b.putShort((short) bits);
        return Arrays.copyOf(b.array(), b.position());
    }

    static byte[] aiff(int rate, int channels, int bits) {
        ByteBuffer b = ByteBuffer.allocate(64).order(ByteOrder.BIG_ENDIAN);
        b.put("FORM".getBytes()).putInt(46).put("AIFF".getBytes());
        b.put("COMM".getBytes()).putInt(18).putShort((short) channels).putInt(1000);
        b.putShort((short) bits);
        int exponent = 16383 + 31 - Integer.numberOfLeadingZeros(rate);
        long mantissa = ((long) rate) << (63 - (31 - Integer.numberOfLeadingZeros(rate)));
        b.putShort((short) exponent).putLong(mantissa);
        return Arrays.copyOf(b.array(), b.position());
    }

    static JSONObject parse(byte[] bytes) {
        return AudioHeader.parse(bytes, bytes.length);
    }

    public static void main(String[] args) throws Exception {
        JSONObject cd = parse(flac(44100, 2, 16, new byte[0]));
        check(
                cd.getString("codec").equals("flac")
                        && cd.getInt("bits") == 16
                        && cd.getInt("rate") == 44100
                        && cd.getInt("channels") == 2,
                "CD FLAC " + cd);
        check(AudioHeader.label(cd).equals("FLAC 16bit"), "FLAC 16bit legend");
        JSONObject hires = parse(flac(96000, 2, 24, new byte[0]));
        check(hires.getInt("bits") == 24 && hires.getInt("rate") == 96000, "Hi-res FLAC");
        check(AudioHeader.label(hires).equals("FLAC 24bit"), "FLAC 24bit legend");
        check(parse(flac(48000, 6, 24, new byte[0])).getInt("channels") == 6, "5.1 FLAC");
        byte[] id3 = new byte[10 + 300];
        id3[0] = 'I';
        id3[1] = 'D';
        id3[2] = '3';
        id3[3] = 4;
        id3[8] = 2; // 2 << 7 = 256
        id3[9] = 44; // + 44 = 300
        check(parse(flac(44100, 2, 16, id3)).getInt("bits") == 16, "FLAC behind an ID3 tag");
        byte[] cut = flac(44100, 2, 16, new byte[0]);
        check(AudioHeader.parse(cut, 12) == null, "Cut-short header");
        JSONObject w = parse(wav(48000, 2, 24, 1));
        check(
                w.getString("codec").equals("wav") && w.getInt("bits") == 24,
                "WAV after a LIST chunk");
        check(parse(wav(44100, 2, 32, 3)).getInt("bits") == 32, "Float WAV");
        check(parse(wav(44100, 2, 16, 0x55)) == null, "Compressed WAV isn't labelled");
        JSONObject a = parse(aiff(44100, 2, 16));
        check(a.getString("codec").equals("aiff") && a.getInt("rate") == 44100, "AIFF " + a);
        check(parse("ID3 not audio at all".getBytes()) == null, "Not audio");
        check(parse(new byte[0]) == null, "Empty");
        check(AudioHeader.label(null).isEmpty(), "No header, no legend");

        // Probe cache: reads a downloaded prefix, remembers it, and survives a restart.
        File dir = Files.createTempDirectory("formats").toFile();
        File head = new File(dir, "song.flac");
        Files.write(head.toPath(), flac(192000, 2, 24, new byte[0]));
        File store = new File(dir, "formats.json");
        FormatProbe probe = new FormatProbe(store);
        JSONObject row = new JSONObject().put("id", "10_5").put("file", 9).put("format", "flac");
        JSONObject lossy = new JSONObject().put("id", "10_6").put("file", 8).put("format", "mp3");
        List<Integer> asked = new ArrayList<>();
        FormatProbe.await(
                probe.probe(
                        Arrays.asList(row, lossy),
                        (file, done) -> {
                            asked.add(file);
                            done.finished(head.getPath());
                        },
                        8),
                1000);
        check(asked.equals(List.of(9)), "Only lossless files are probed");
        probe.annotate(Arrays.asList(row, lossy));
        check(row.getInt("bits") == 24 && row.getInt("rate") == 192000, "Row annotated");
        check(!lossy.has("bits"), "Lossy row untouched");
        asked.clear();
        probe.probe(List.of(row), (file, done) -> asked.add(file), 8);
        check(asked.isEmpty(), "Known files aren't probed again");
        check(new FormatProbe(store).get("10_5").getInt("bits") == 24, "Cache survives a restart");
        probe.clear();
        check(probe.get("10_5") == null && !store.exists(), "Sign-out clears the cache");

        // Quality uses the real bit depth when it's known.
        check(
                TrackDetails.quality("flac", "", 25_000_000, 240, 24).equals("HI_RES_LOSSLESS"),
                "24-bit FLAC is hi-res even at a modest bitrate");
        check(
                TrackDetails.quality("flac", "", 90_000_000, 240, 16).equals("LOSSLESS"),
                "16-bit FLAC isn't hi-res, whatever the bitrate");
        System.out.println("PASS: " + checks + " audio header, format cache and legend checks.");
    }
}

package app.bitchord.telegram;

import org.json.JSONObject;

import java.util.Arrays;
import java.util.Random;

/**
 * Fake lossless files. The check was tried on FLAC files made from MP3 (128 to 320 kbps, V0) and
 * AAC (128 and 256 kbps) encodes: 128 and 192 kbps MP3 and 128 kbps AAC were found, 256 kbps and up
 * were called inconclusive, as Spectra calls them. These tests use noise shaped like those spectra,
 * made here, so no audio is kept in the repo.
 */
public final class LosslessCheckTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    interface Cutoff {
        double at(int block, Random random);
    }

    /**
     * Noise whose spectrum stops at each block's cutoff, blocks of 1,024 samples overlap-added,
     * louder and quieter in turns like music.
     */
    static int[][] noise(int rate, int seconds, int bits, Cutoff cutoff, long seed) {
        int n = 2048, hop = 1024, samples = rate * seconds, blocks = samples / hop;
        Random random = new Random(seed);
        double[] cuts = new double[blocks], level = new double[blocks];
        for (int b = 0; b < blocks; b++) {
            cuts[b] = cutoff.at(b, random);
            level[b] = 0.3 + 0.7 * random.nextDouble();
        }
        double[][] out = new double[2][samples + n];
        double[] window = new double[n];
        for (int i = 0; i < n; i++) window[i] = Math.sin(Math.PI * (i + 0.5) / n);
        double[] re = new double[n], im = new double[n];
        for (int ch = 0; ch < 2; ch++)
            for (int b = 0; b < blocks; b++) {
                Arrays.fill(re, 0);
                Arrays.fill(im, 0);
                for (int k = 1; k < n / 2; k++) {
                    double f = (double) k * rate / n;
                    if (f >= cuts[b]) break;
                    double m = level[b] / Math.sqrt(1 + f / 1000),
                            phase = random.nextDouble() * 2 * Math.PI;
                    re[k] = m * Math.cos(phase);
                    im[k] = -m * Math.sin(phase); // conjugate, so the forward FFT gives the inverse
                    re[n - k] = re[k];
                    im[n - k] = -im[k];
                }
                Fingerprint.fft(re, im);
                for (int i = 0; i < n && b * hop + i < samples; i++)
                    out[ch][b * hop + i] += re[i] * window[i];
            }
        double peak = 1e-9;
        for (double[] channel : out) for (double v : channel) peak = Math.max(peak, Math.abs(v));
        int[][] pcm = new int[2][samples];
        double full = (1 << (bits - 1)) - 1;
        for (int ch = 0; ch < 2; ch++)
            for (int i = 0; i < samples; i++)
                pcm[ch][i] = (int) Math.round(out[ch][i] / peak * 0.7 * full);
        return pcm;
    }

    static JSONObject check(byte[] flac, int seconds) throws Exception {
        JSONObject row =
                new JSONObject()
                        .put("chat", -100)
                        .put("message", 5)
                        .put("format", "flac")
                        .put("size", flac.length)
                        .put("duration", seconds);
        return LosslessCheck.check(row, CueTest.over(flac));
    }

    public static void main(String[] args) throws Exception {
        int seconds = 12;
        // A genuine CD-quality file: music all the way up.
        int[][] full = noise(44100, seconds, 16, (b, r) -> 22050, 1);
        JSONObject genuine = check(TestFlac.encode(full, 44100, 16, null), seconds);
        check(genuine.optString("verdict").equals("ok"), "genuine: " + genuine);
        check(!genuine.has("cutoff"), "no edge in a genuine file: " + genuine);
        check(genuine.optInt("bits") == 16 && genuine.optInt("declared") == 16, "16 bits used");

        // Made from a 128 kbps MP3: a wall at 16 kHz, and many moments cut lower still.
        int[][] mp3 =
                noise(
                        44100,
                        seconds,
                        16,
                        (b, r) -> r.nextDouble() < 0.3 ? 16000 : 13800 + 1800 * r.nextDouble(),
                        2);
        JSONObject fake = check(TestFlac.encode(mp3, 44100, 16, null), seconds);
        check(fake.optString("verdict").equals("lossy"), "fake: " + fake);
        check(Math.abs(fake.optInt("cutoff") - 16000) < 300, "cut at 16 kHz: " + fake);
        check(fake.optInt("kbps") == 128, "from about 128 kbps: " + fake);
        check(fake.optDouble("lock") < 0.8, "music doesn’t keep reaching the edge: " + fake);
        check(LosslessCheck.fake(fake), "counts as fake");

        // A hard edge at 20 kHz: CD-era filters and 256-320 kbps encodes both look like this, so
        // it's at most a hint, and only when the music doesn't keep reaching the edge.
        int[][] high = noise(44100, seconds, 16, (b, r) -> 20000, 3);
        JSONObject limited = check(TestFlac.encode(high, 44100, 16, null), seconds);
        check(Math.abs(limited.optInt("cutoff") - 20000) < 300, "edge at 20 kHz: " + limited);
        check(
                limited.optString("verdict")
                        .equals(limited.optDouble("lock") < 0.5 ? "suspect" : "ok"),
                "ambiguous edge: " + limited);
        check(!LosslessCheck.fake(limited), "never called fake");
        JSONObject hint = new JSONObject().put("verdict", "suspect");

        // Hi-res made from a CD-rate master.
        int[][] up = noise(96000, 6, 24, (b, r) -> 21000, 4);
        JSONObject upsampled = check(TestFlac.encode(up, 96000, 24, null), 6);
        check(upsampled.optString("verdict").equals("upsampled"), "upsampled: " + upsampled);
        check(upsampled.optInt("from") == 44100, "from 44.1 kHz: " + upsampled);

        // A 16-bit file stored as 24-bit.
        int[][] padded = new int[2][full[0].length];
        for (int ch = 0; ch < 2; ch++)
            for (int i = 0; i < padded[ch].length; i++) padded[ch][i] = full[ch][i] << 8;
        byte[] paddedFlac = TestFlac.encode(padded, 44100, 24, null);
        JSONObject pad = check(paddedFlac, seconds);
        check(pad.optString("verdict").equals("ok"), "padded is fine otherwise: " + pad);
        check(pad.optInt("bits") == 16 && pad.optInt("declared") == 24, "16 of 24 bits: " + pad);
        check(LosslessCheck.padded(pad) == 16, "padded");

        // A lossy encoder in the tags.
        byte[] tagged = TestFlac.withComment(full, 44100, 16, "ENCODER=LAME3.100 -V2");
        JSONObject lame = check(tagged, seconds);
        check(lame.optString("verdict").equals("suspect"), "LAME tag: " + lame);
        check(lame.optString("encoder").startsWith("LAME3.100"), "names the encoder: " + lame);
        check(LosslessCheck.encoder(null) == null, "no comments, no encoder");

        // The first bytes alone: the tag, and which bits the first frames use.
        JSONObject head = AudioHeader.parse(Arrays.copyOf(tagged, 64 * 1024), 64 * 1024);
        check(head.optString("encoder").startsWith("LAME"), "quick: tag " + head);
        // (A tone, which TestFlac packs small enough for a few frames to fit in the first bytes.)
        int[][] tone = TestFlac.signal(2, 44100, 16, 5);
        for (int[] channel : tone) for (int i = 0; i < channel.length; i++) channel[i] <<= 8;
        byte[] toneFlac = TestFlac.encode(tone, 44100, 24, null);
        JSONObject padHead = AudioHeader.parse(Arrays.copyOf(toneFlac, 64 * 1024), 64 * 1024);
        check(padHead.optInt("bits") == 24 && padHead.optInt("real") == 16, "quick: " + padHead);
        JSONObject quick = LosslessCheck.of(new JSONObject(), padHead);
        check(LosslessCheck.padded(quick) == 16, "quick padding counts: " + quick);
        JSONObject quickTag = LosslessCheck.of(null, head);
        check(quickTag.optString("verdict").equals("suspect"), "quick tag: " + quickTag);
        check(
                LosslessCheck.of(new JSONObject().put("check", fake), padHead) == fake,
                "a full check wins");
        JSONObject genuineHead =
                AudioHeader.parse(
                        Arrays.copyOf(
                                TestFlac.encode(TestFlac.signal(2, 44100, 24, 6), 44100, 24, null),
                                64 * 1024),
                        64 * 1024);
        check(genuineHead.optInt("real") == 24, "quick: 24 bits used " + genuineHead);
        check(LosslessCheck.padded(LosslessCheck.of(null, genuineHead)) == 0, "not padded");
        check(LosslessCheck.of(new JSONObject(), null) == null, "nothing known");
        LosslessCheck.enabled = false;
        check(
                LosslessCheck.of(new JSONObject().put("check", fake), padHead) == null,
                "switched off");
        LosslessCheck.enabled = true;

        // What it means for BitChord.
        check(LosslessCheck.quality("LOSSLESS", fake).equals("LOW"), "128 kbps fake ranks low");
        JSONObject fake320 = new JSONObject().put("verdict", "lossy").put("kbps", 320);
        check(
                LosslessCheck.quality("LOSSLESS", fake320).equals("HIGH"),
                "320 kbps fake ranks high");
        JSONObject fake192 = new JSONObject().put("verdict", "lossy").put("kbps", 192);
        check(LosslessCheck.quality("LOSSLESS", fake192).isEmpty(), "192 kbps fake: no tier");
        check(
                LosslessCheck.quality("HI_RES_LOSSLESS", upsampled).equals("LOSSLESS"),
                "upsampled is CD");
        check(LosslessCheck.quality("HI_RES_LOSSLESS", pad).equals("LOSSLESS"), "padded is CD");
        check(LosslessCheck.quality("LOSSLESS", hint).equals("LOSSLESS"), "a hint changes nothing");
        check(LosslessCheck.quality("HIGH", fake).equals("HIGH"), "lossy files are left alone");
        check(LosslessCheck.quality("LOSSLESS", null).equals("LOSSLESS"), "unchecked");
        check(LosslessCheck.bits(24, pad) == 16 && LosslessCheck.bits(24, genuine) == 24, "bits");
        check(
                LosslessCheck.legend("FLAC 16bit", fake).equals("FLAC 16bit · from ≈128 kbps"),
                LosslessCheck.legend("FLAC 16bit", fake));
        check(LosslessCheck.legend("FLAC 16bit", hint).equals("FLAC 16bit · maybe lossy"), "hint");
        check(
                LosslessCheck.legend("FLAC 24bit", upsampled).equals("FLAC 24bit · from 44.1 kHz"),
                "up");
        check(LosslessCheck.legend("FLAC 24bit", pad).equals("FLAC 24bit · really 16bit"), "pad");
        check(LosslessCheck.legend("FLAC 16bit", genuine).equals("FLAC 16bit"), "genuine legend");
        check(LosslessCheck.legend("", fake).isEmpty(), "no legend, nothing added");
        JSONObject unknownFake = new JSONObject().put("verdict", "lossy");
        check(
                LosslessCheck.legend("FLAC", unknownFake).equals("FLAC · from a lossy file"),
                "no kbps");
        check(LosslessCheck.rate(48000).equals("48 kHz"), "48 kHz");

        // Where it listens, and what it can read.
        check(LosslessCheck.segments(30L * 44100, 44100).size() == 1, "short files whole");
        long total = 300L * 44100;
        java.util.List<long[]> parts = LosslessCheck.segments(total, 44100);
        check(parts.size() == LosslessCheck.SEGMENTS, "stretches");
        for (long[] p : parts)
            check(p[0] >= 0 && p[1] <= total && p[1] - p[0] == 8L * 44100, "inside");
        check(LosslessCheck.kbps(16000) == 128 && LosslessCheck.kbps(19000) == 256, "kbps table");
        check(
                LosslessCheck.sourceRate(21797) == 44100
                        && LosslessCheck.sourceRate(23900) == 48000,
                "rates");
        check(LosslessCheck.checkable(new JSONObject().put("format", "FLAC")), "flac");
        check(LosslessCheck.checkable(new JSONObject().put("format", "wav")), "wav");
        check(!LosslessCheck.checkable(new JSONObject().put("format", "mp3")), "not mp3");
        check(!LosslessCheck.checkable(new JSONObject().put("format", "m4a")), "not m4a");
        check(
                !LosslessCheck.checkable(
                        new JSONObject()
                                .put("format", "flac")
                                .put("zip", new JSONObject().put("method", 8))),
                "not inside a compressed zip");
        check(
                LosslessCheck.checkable(
                        new JSONObject().put("format", "wav").put("cue", new JSONObject())),
                "cue tracks");
        check(
                LosslessCheck.key(new JSONObject().put("chat", -100).put("message", 5))
                        .equals("-100_5"),
                "key");
        check(
                LosslessCheck.key(
                                new JSONObject()
                                        .put("chat", -100)
                                        .put("message", 5)
                                        .put("entry", CueAlbums.BASE + 300 + 7))
                        .equals("-100_5_3"),
                "a cue album's tracks share their album's key");
        check(
                LosslessCheck.key(
                                new JSONObject()
                                        .put("chat", -100)
                                        .put("message", 5)
                                        .put("entry", CueAlbums.BASE + 4))
                        .equals("-100_5"),
                "a posted album's tracks share the post's key");
        boolean refused = false;
        try {
            check(new byte[] {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, 1);
        } catch (java.io.IOException e) {
            refused = true;
        }
        check(refused, "not FLAC or WAV: refused");
        System.out.println(
                "PASS: " + checks + " fake lossless, upsampling, padding and tag checks.");
    }
}

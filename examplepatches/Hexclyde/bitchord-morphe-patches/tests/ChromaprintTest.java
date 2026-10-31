package app.bitchord.telegram;

import org.json.JSONObject;

import java.security.MessageDigest;

/**
 * Chromaprint fingerprints and AcoustID answers. The expected fingerprints were made by
 * libchromaprint 1.5.1 from the same samples; the port matches it bit for bit, resampling included.
 */
public final class ChromaprintTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    /** Thirty seconds of chords that change every half second, with a little noise. */
    static short[] tune(int rate, int seconds, long seed) {
        java.util.Random r = new java.util.Random(seed);
        short[] out = new short[rate * seconds];
        double[] f = {220, 247, 262, 294, 330, 349, 392, 440};
        double a = 0, b = 0, c = 0, fa = 220, fb = 330, fc = 440;
        for (int i = 0; i < out.length; i++) {
            if (i % (rate / 2) == 0) {
                fa = f[r.nextInt(8)];
                fb = f[r.nextInt(8)] * 1.5;
                fc = f[r.nextInt(8)] * 2;
            }
            a += 2 * Math.PI * fa / rate;
            b += 2 * Math.PI * fb / rate;
            c += 2 * Math.PI * fc / rate;
            double v =
                    0.3 * Math.sin(a)
                            + 0.2 * Math.sin(b)
                            + 0.15 * Math.sin(c)
                            + 0.02 * r.nextGaussian();
            out[i] = (short) Math.round(Math.max(-1, Math.min(1, v)) * 32767);
        }
        return out;
    }

    static String sha256(String text) throws Exception {
        StringBuilder hex = new StringBuilder();
        for (byte x :
                MessageDigest.getInstance("SHA-256")
                        .digest(text.getBytes(java.nio.charset.StandardCharsets.UTF_8)))
            hex.append(String.format("%02x", x));
        return hex.toString();
    }

    static void same(int rate, long first, long last, String start, String hash) throws Exception {
        short[] audio = tune(rate, 30, 42);
        int[] fp = Chromaprint.fingerprint(audio, audio.length, rate);
        check(fp.length == 221, rate + ": 221 values, not " + fp.length);
        check((fp[0] & 0xffffffffL) == first, rate + ": first value " + (fp[0] & 0xffffffffL));
        check((fp[220] & 0xffffffffL) == last, rate + ": last value " + (fp[220] & 0xffffffffL));
        String encoded = Chromaprint.encode(fp);
        check(encoded.startsWith(start), rate + ": " + encoded.substring(0, 40));
        check(sha256(encoded).equals(hash), rate + ": the whole fingerprint as libchromaprint's");
    }

    public static void main(String[] args) throws Exception {
        same(
                44100,
                3563862484L,
                1418201738L,
                "AQAA3ZOSJY1CKfjR5Mdx-_iHZlzIFL2C60OeQ9eD",
                "2060c50ba9b4d75b930ae3836f889cde9ecef649e1db77a9c04ac8e19ea6f05f");
        same(
                48000,
                2049224840L,
                579635787L,
                "AQAA3WSjjUqC4-3wCxN1pO4hxcqxH--JHr-O481R",
                "cbb2f83da501d5bfffdccd9e4d096dd53c6b81e1553193f5a7cd933e5ac52470");
        same(
                11025,
                552448459L,
                37127183L,
                "AQAA3YmWMIqixJh0R2geCgeN57gePMOPOv3QnHnA",
                "dec81e148d17d371a741bd8ab06506ca07d993cc196562f2b10a21a6933e1240");
        check(Chromaprint.fingerprint(new short[1000], 1000, 44100).length == 0, "too short");
        check(Chromaprint.encode(new int[0]).equals("AQAAAA"), "empty");

        // AcoustID's answers.
        String answer =
                "{\"status\":\"ok\",\"results\":[{\"id\":\"a\",\"score\":0.55,\"recordings\":"
                    + "[{\"id\":\"r0\",\"title\":\"Wrong\",\"duration\":200,\"artists\":"
                    + "[{\"name\":\"Nobody\"}]}]},{\"id\":\"b\",\"score\":0.96,\"recordings\":[{\"id\":\"r1\",\"title\":\"Too"
                    + " Long\",\"duration\":400,\"artists\":[{\"name\":\"X\"}]},{\"id\":\"r2\",\"title\":\"One"
                    + " More Light\",\"duration\":255.4,\"artists\":[{\"name\":\"Linkin"
                    + " Park\",\"joinphrase\":\" feat. \"},{\"name\":\"Guest\"}]}]}]}";
        JSONObject best = AcoustId.best(answer, 254);
        check(best != null && best.optString("title").equals("One More Light"), "best: " + best);
        check(best.optString("artist").equals("Linkin Park feat. Guest"), "credits: " + best);
        check(best.optDouble("score") == 0.96 && best.optString("id").equals("r2"), "score and id");
        check(best.optString("by").equals("AcoustID"), "by");
        check(AcoustId.best(answer, 120) == null, "lengths too far apart");
        check(AcoustId.best("{\"status\":\"ok\",\"results\":[]}", 200) == null, "nothing found");
        check(
                AcoustId.best(
                                "{\"status\":\"ok\",\"results\":[{\"id\":\"c\",\"score\":0.99}]}",
                                200)
                        == null,
                "a fingerprint without recordings");
        boolean bad = false;
        try {
            AcoustId.best(
                    "{\"status\":\"error\",\"error\":{\"code\":4,\"message\":\"invalid API key\"}}",
                    200);
        } catch (AcoustId.BadKey e) {
            bad = e.getMessage().equals("invalid API key");
        }
        check(bad, "a refused key");
        boolean busy = false;
        try {
            AcoustId.best(
                    "{\"status\":\"error\",\"error\":{\"code\":14,\"message\":\"too many"
                            + " requests\"}}",
                    200);
        } catch (AcoustId.BadKey e) {
            busy = false;
        } catch (java.io.IOException e) {
            busy = true;
        }
        check(busy, "other refusals aren't the key's fault");
        check(FileChecks.validKey("Abc123def") && !FileChecks.validKey("short"), "key shape");
        check(!FileChecks.validKey("has space 123") && !FileChecks.validKey(null), "key shape 2");
        System.out.println(
                "PASS: " + checks + " Chromaprint fingerprint and AcoustID answer checks.");
    }
}

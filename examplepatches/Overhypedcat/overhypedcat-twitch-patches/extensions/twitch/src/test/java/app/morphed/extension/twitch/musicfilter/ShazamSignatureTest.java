package app.morphed.extension.twitch.musicfilter;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

/** The signature against shazamio_core's (shazam.bin, made by make_shazam_fixture.py). */
public class ShazamSignatureTest {
    private static final String PREFIX = "data:audio/vnd.shazam.sig;base64,";

    /**
     * shazamio_core runs its input through its own decoder first, so a few peaks land a pass or a few bins apart;
     * Shazam matches on the peaks as a whole. Almost all of them must be the same.
     */
    @Test
    public void agreesWithShazamioCore() throws IOException {
        ByteBuffer buf = FilterTest.resource("shazam.bin");
        short[] sound = new short[buf.getInt()];
        for (int i = 0; i < sound.length; i++) sound[i] = buf.getShort();
        byte[] uri = new byte[buf.getInt()];
        buf.get(uri);
        String expected = new String(uri, StandardCharsets.US_ASCII);

        String got = ShazamSignature.uri(sound);
        assertTrue(got.startsWith(PREFIX));
        java.util.List<int[]> want = peaks(Base64.getDecoder().decode(expected.substring(PREFIX.length())));
        java.util.List<int[]> have = peaks(Base64.getDecoder().decode(got.substring(PREFIX.length())));
        int matched = 0;
        for (int[] a : want) {
            for (int[] b : have) {
                if (a[0] == b[0] && Math.abs(a[1] - b[1]) <= 1 && Math.abs(a[2] - b[2]) <= 64
                        && Math.abs(a[3] - b[3]) <= 8) {
                    matched++;
                    break;
                }
            }
        }
        assertTrue(matched + " of " + want.size() + " peaks matched", matched >= want.size() * 0.9);
        assertTrue(have.size() >= want.size() * 0.9 && have.size() <= want.size() * 1.1);
    }

    /** [band, pass, magnitude, bin] of every peak. */
    private static java.util.List<int[]> peaks(byte[] signature) {
        ByteBuffer b = ByteBuffer.wrap(signature).order(ByteOrder.LITTLE_ENDIAN);
        java.util.List<int[]> out = new java.util.ArrayList<>();
        for (int p = 56; p + 8 <= signature.length; ) {
            int band = b.getInt(p) & 0xf, size = b.getInt(p + 4);
            int q = p + 8, end = q + size, pass = 0;
            while (q < end) {
                if ((signature[q] & 0xff) == 0xff) {
                    pass = b.getInt(q + 1);
                    q += 5;
                    continue;
                }
                pass += signature[q] & 0xff;
                out.add(new int[]{band, pass, b.getShort(q + 1) & 0xffff, b.getShort(q + 3) & 0xffff});
                q += 5;
            }
            p = end + (4 - size % 4) % 4;
        }
        return out;
    }

    @Test
    public void headerSaysWhatShazamExpects() {
        short[] silence = new short[16000 * 3];
        byte[] bytes = Base64.getDecoder().decode(ShazamSignature.uri(silence).substring(PREFIX.length()));
        ByteBuffer header = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN);
        assertEquals(0xcafe2580, header.getInt(0));
        assertEquals(bytes.length - 48, header.getInt(8));
        assertEquals(0x94119c00, header.getInt(12));
        assertEquals(3 << 27, header.getInt(28));
        assertEquals(48000 + 3840, header.getInt(40));
    }
}

/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.notifications;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import org.junit.Test;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;

/**
 * The title tag of an MP4 is turned into a free atom in place, under the one chain the tag lives
 * in, and a file without that chain, or one whose sizes don't add up, is left exactly as it was.
 */
public class Mp4TitleTest {

    @Test
    public void theTitleAtomBecomesAFreeAtomAndNothingElseMoves() {
        byte[] file = tagged("FB_FBPN_min7p8db");
        int name = indexOf(file, new byte[] { (byte) 0xA9, 'n', 'a', 'm' });
        byte[] before = file.clone();

        byte[] after = Mp4Title.untitled(file);

        assertEquals(before.length, after.length);
        assertEquals("free", new String(after, name, 4, StandardCharsets.US_ASCII));
        for (int i = 0; i < before.length; i++) {
            if (i >= name && i < name + 4) continue;
            assertEquals("byte " + i, before[i], after[i]);
        }
        assertNotEquals(-1, indexOf(after, "FB_FBPN_min7p8db".getBytes(StandardCharsets.US_ASCII)));
    }

    @Test
    public void aFileWithoutTheTagChainIsLeftAlone() {
        byte[] noUdta = concat(atom("ftyp", "M4A ".getBytes(StandardCharsets.US_ASCII)),
                atom("moov", atom("mvhd", new byte[8])), atom("mdat", new byte[16]));
        assertArrayEquals(noUdta.clone(), Mp4Title.untitled(noUdta));

        byte[] noTitle = concat(atom("ftyp", new byte[4]),
                atom("moov", atom("udta", atom("meta", concat(new byte[4], atom("ilst", atom("cpil", new byte[8])))))),
                atom("mdat", new byte[4]));
        assertArrayEquals(noTitle.clone(), Mp4Title.untitled(noTitle));

        byte[] ogg = "OggS\0\2the rest".getBytes(StandardCharsets.US_ASCII);
        assertArrayEquals(ogg.clone(), Mp4Title.untitled(ogg));
        assertArrayEquals(new byte[0], Mp4Title.untitled(new byte[0]));
    }

    @Test
    public void aSizeThatRunsPastTheEndStopsTheWalk() {
        byte[] file = tagged("x");
        // The moov atom claims more than the file holds.
        int moov = indexOf(file, "moov".getBytes(StandardCharsets.US_ASCII)) - 4;
        file[moov] = 0x7F;
        assertArrayEquals(file.clone(), Mp4Title.untitled(file));
    }

    @Test
    public void aWideMoovIsWalkedTheSame() {
        byte[] inner = atom("udta", atom("meta", concat(new byte[4], atom("ilst", atom("©nam", atom("data", new byte[12]))))));
        ByteArrayOutputStream wide = new ByteArrayOutputStream();
        long size = 16 + inner.length;
        wide.write(0); wide.write(0); wide.write(0); wide.write(1);
        wide.write("moov".getBytes(StandardCharsets.US_ASCII), 0, 4);
        for (int shift = 56; shift >= 0; shift -= 8) wide.write((int) (size >> shift));
        wide.write(inner, 0, inner.length);
        byte[] file = concat(atom("ftyp", new byte[4]), wide.toByteArray(), atom("mdat", new byte[4]));
        int name = indexOf(file, new byte[] { (byte) 0xA9, 'n', 'a', 'm' });
        byte[] after = Mp4Title.untitled(file);
        assertEquals("free", new String(after, name, 4, StandardCharsets.US_ASCII));
    }

    /** An MP4 shaped like the stock chime: ftyp, moov with the tag chain, mdat. */
    static byte[] tagged(String title) {
        byte[] data = concat(new byte[] { 0, 0, 0, 1, 0, 0, 0, 0 }, title.getBytes(StandardCharsets.UTF_8));
        byte[] ilst = atom("ilst", concat(atom("©nam", atom("data", data)), atom("cpil", atom("data", new byte[9]))));
        byte[] meta = atom("meta", concat(new byte[4], atom("hdlr", new byte[26]), ilst));
        byte[] moov = atom("moov", concat(atom("mvhd", new byte[100]), atom("udta", meta)));
        return concat(atom("ftyp", "M4A \0\0\0\0".getBytes(StandardCharsets.US_ASCII)), moov, atom("mdat", new byte[40]));
    }

    private static byte[] atom(String type, byte[] body) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        int size = 8 + body.length;
        out.write(size >>> 24); out.write(size >>> 16); out.write(size >>> 8); out.write(size);
        byte[] name = type.getBytes(StandardCharsets.ISO_8859_1);
        out.write(name, 0, 4);
        out.write(body, 0, body.length);
        return out.toByteArray();
    }

    private static byte[] concat(byte[]... parts) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (byte[] part : parts) out.write(part, 0, part.length);
        return out.toByteArray();
    }

    static int indexOf(byte[] in, byte[] what) {
        outer:
        for (int i = 0; i + what.length <= in.length; i++) {
            for (int j = 0; j < what.length; j++) if (in[i + j] != what[j]) continue outer;
            return i;
        }
        return -1;
    }
}

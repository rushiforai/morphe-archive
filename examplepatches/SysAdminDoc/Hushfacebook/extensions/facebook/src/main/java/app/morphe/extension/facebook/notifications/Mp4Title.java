/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.notifications;

import java.nio.charset.StandardCharsets;

/**
 * Takes the title tag out of an MP4 file, in place.
 *
 * <p>Android's sound picker shows a sound by MediaStore's title, and the scanner sets that from
 * the file's own title tag when it has one, over anything the row was inserted with: Facebook's
 * chime is tagged {@code FB_FBPN_min7p8db}, and that is what the picker would show. With no tag
 * the scanner falls back to the file's name without its extension. The tag is the {@code ©nam}
 * atom under {@code moov/udta/meta/ilst}; renaming its type to {@code free}, four bytes in
 * place, drops it without moving a byte, so no other atom's size or offset changes.
 */
final class Mp4Title {
    private static final byte[] NAME = { (byte) 0xA9, 'n', 'a', 'm' };
    private static final byte[] FREE = "free".getBytes(StandardCharsets.US_ASCII);

    private Mp4Title() {
    }

    /** Renames the title atom to {@code free} when the file has one under the usual chain; anything else is left as it is. */
    static byte[] untitled(byte[] mp4) {
        int moov = child(mp4, 0, mp4.length, "moov", 0);
        if (moov < 0) return mp4;
        int udta = child(mp4, moov + header(mp4, moov), end(mp4, moov), "udta", 0);
        if (udta < 0) return mp4;
        int meta = child(mp4, udta + header(mp4, udta), end(mp4, udta), "meta", 0);
        if (meta < 0) return mp4;
        // A meta atom is a full box: four bytes of version and flags come before its children.
        int ilst = child(mp4, meta + header(mp4, meta) + 4, end(mp4, meta), "ilst", 0);
        if (ilst < 0) return mp4;
        int name = child(mp4, ilst + header(mp4, ilst), end(mp4, ilst), null, 0);
        if (name < 0) return mp4;
        System.arraycopy(FREE, 0, mp4, name + 4, 4);
        return mp4;
    }

    /**
     * The offset of the first atom typed {@code type} between {@code from} and {@code to}, or of
     * the title atom when {@code type} is null, or -1. A size that doesn't fit stops the walk.
     */
    private static int child(byte[] data, int from, int to, String type, int depth) {
        int off = from;
        while (off + 8 <= to) {
            long size = size(data, off);
            int header = 8;
            if (size == 1) {
                if (off + 16 > to) return -1;
                size = ((long) size(data, off + 8) << 32) | size(data, off + 12);
                header = 16;
            } else if (size == 0) {
                size = to - off;
            }
            if (size < header || off + size > to) return -1;
            boolean match = type == null ? matches(data, off + 4, NAME) : matches(data, off + 4, type.getBytes(StandardCharsets.US_ASCII));
            if (match) return off;
            off += (int) size;
        }
        return -1;
    }

    /** 16 for an atom carrying a 64-bit size, else 8. */
    private static int header(byte[] data, int atom) {
        return size(data, atom) == 1 ? 16 : 8;
    }

    private static int end(byte[] data, int atom) {
        long size = size(data, atom);
        if (size == 1) size = ((long) size(data, atom + 8) << 32) | size(data, atom + 12);
        else if (size == 0) size = data.length - atom;
        return (int) Math.min(data.length, atom + size);
    }

    private static long size(byte[] data, int at) {
        return ((long) (data[at] & 0xFF) << 24) | ((data[at + 1] & 0xFF) << 16) | ((data[at + 2] & 0xFF) << 8) | (data[at + 3] & 0xFF);
    }

    private static boolean matches(byte[] data, int at, byte[] type) {
        for (int i = 0; i < 4; i++) if (data[at + i] != type[i]) return false;
        return true;
    }
}

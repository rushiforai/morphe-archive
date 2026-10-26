/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.extension.music;

import android.util.Base64;
import java.io.*;
import java.nio.*;
import java.nio.charset.StandardCharsets;

/** Bounded, read-only Ogg/OpusTags front-cover reader. Audio packets are not decoded. */
public final class OpusPicture {
    private static final int LIMIT = 8 * 1024 * 1024;
    public static byte[] read(File file) {
        try (DataInputStream input = new DataInputStream(new FileInputStream(file))) {
            ByteArrayOutputStream packet = new ByteArrayOutputStream();
            int consumed = 0;
            for (int pages = 0; pages < 128 && consumed < LIMIT; pages++) {
                byte[] header = new byte[27]; input.readFully(header); consumed += 27;
                if (header[0] != 'O' || header[1] != 'g' || header[2] != 'g' || header[3] != 'S' || header[4] != 0) return null;
                int segments = header[26] & 255;
                byte[] sizes = new byte[segments]; input.readFully(sizes); consumed += segments;
                for (byte raw : sizes) {
                    int size = raw & 255;
                    if (consumed + size > LIMIT || packet.size() + size > LIMIT) return null;
                    byte[] chunk = new byte[size]; input.readFully(chunk); consumed += size; packet.write(chunk);
                    if (size < 255) {
                        byte[] bytes = packet.toByteArray(); packet.reset();
                        if (bytes.length >= 8 && new String(bytes, 0, 8, StandardCharsets.US_ASCII).equals("OpusTags")) return fromTags(bytes);
                        if (bytes.length < 8 || !new String(bytes, 0, 8, StandardCharsets.US_ASCII).equals("OpusHead")) return null;
                    }
                }
            }
        } catch (IOException | IllegalArgumentException failure) { return null; }
        return null;
    }
    public static byte[] fromTags(byte[] bytes) {
        try {
            if (bytes.length > LIMIT || bytes.length < 16 || !new String(bytes, 0, 8, StandardCharsets.US_ASCII).equals("OpusTags")) return null;
            ByteBuffer tags = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN);
            tags.position(8);
            int vendor = tags.getInt();
            if (vendor < 0 || vendor > tags.remaining() - 4) return null;
            tags.position(tags.position() + vendor);
            int count = tags.getInt();
            if (count < 0 || count > tags.remaining() / 4) return null;
            byte[] fallback = null;
            for (int i = 0; i < count; i++) {
                int length = tags.getInt();
                if (length < 0 || length > tags.remaining()) return null;
                byte[] comment = new byte[length]; tags.get(comment);
                String text = new String(comment, StandardCharsets.UTF_8);
                String prefix = "METADATA_BLOCK_PICTURE=";
                if (!text.regionMatches(true, 0, prefix, 0, prefix.length())) continue;
                byte[] encoded = Base64.decode(text.substring(prefix.length()), Base64.DEFAULT);
                ByteBuffer picture = ByteBuffer.wrap(encoded).order(ByteOrder.BIG_ENDIAN);
                int type = picture.getInt();
                int mime = picture.getInt();
                if (mime < 0 || mime > picture.remaining() - 4) continue;
                picture.position(picture.position() + mime);
                int description = picture.getInt();
                if (description < 0 || description > picture.remaining() - 20) continue;
                picture.position(picture.position() + description + 16);
                int imageLength = picture.getInt();
                if (imageLength <= 0 || imageLength > picture.remaining()) continue;
                byte[] image = new byte[imageLength]; picture.get(image);
                if (type == 3) return image;
                if (fallback == null) fallback = image;
            }
            return fallback;
        } catch (IllegalArgumentException | BufferUnderflowException failure) { return null; }
    }
}

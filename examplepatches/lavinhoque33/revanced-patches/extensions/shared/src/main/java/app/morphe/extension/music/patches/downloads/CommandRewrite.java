/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Retargets a tapped watch command from the music video of a song to the song itself, on the serialized message so
 * that no obfuscated class is needed. Only two things change: the video id of the watch endpoint (field 1) and, when
 * it is present and says official music video, the music video type of the endpoint's music config. When asked, it
 * also sets the config's playlist content type to audio preferred, the explicit hint the app reads when a watch starts
 * and turns into its audio mode (an unknown hint falls back to the video mode for an account without Premium). Every
 * other field, known or not, is copied byte for byte, so the playlist, the position, the playlist entry id, the params
 * and the tracking stay as the app built them.
 *
 * <p>Path of the type: command, watch endpoint 48,687,757, supported configs 136,656,028, music config 136,657,325,
 * field 2 (the enum, 1 = song/ATV, 2 = official music video/OMV); field 3 of the same config is the content type.
 */
final class CommandRewrite {
    static final int WATCH_ENDPOINT_FIELD = 48_687_757;
    static final int VIDEO_ID_FIELD = 1;
    static final int SUPPORTED_CONFIG_FIELD = 136_656_028;
    static final int MUSIC_CONFIG_FIELD = 136_657_325;
    static final int MUSIC_VIDEO_TYPE_FIELD = 2;
    static final int TYPE_ATV = 1;
    static final int TYPE_OMV = 2;
    /** The playlist content type of the music config: 0 unknown, 1 audio preferred, 2 video preferred. */
    static final int HINT_FIELD = 3;
    static final int HINT_ATV_PREFERRED = 1;
    private static final int VIDEO_ID_LENGTH = 11;

    private CommandRewrite() {}

    /**
     * The retargeted command, what happened to the music video type ({@code "2->1"} or {@code "untouched"}) and to
     * the audio preference hint ({@code added}, {@code replaced}, {@code present} or {@code none}).
     */
    record Result(byte[] command, String type, String hint) {}

    /** One field of a serialized message: where its tag, value and end are. */
    private record Field(int number, int wireType, int start, int tagEnd, int valueStart, int end) {}

    /** The music config with its edits and what they were. */
    private record ConfigEdit(byte[] watch, String type, String hint) {}


    /**
     * What a renderer retarget did: how many id strings and commands it replaced.
     *
     * @param ids      Fields that held exactly the old id.
     * @param commands Commands whose watch endpoint was retargeted.
     */
    record RendererResult(byte[] renderer, int ids, int commands, String type, String hint) {
        /** Both the renderer's own id and its watch command name the new song. */
        boolean complete() {
            return ids > 0 && commands > 0;
        }

        String describe() {
            return "ids=" + ids + ",commands=" + commands + ",type=" + type + ",hint=" + hint;
        }
    }

    /**
     * Retargets a panel renderer: its own video id field and its watch command(s), found among its top-level fields.
     * Ids are 11 characters, so the replacement keeps every length except the command's, which is rebuilt by
     * [#retarget]. Menus, thumbnails and the rest are copied unchanged.
     *
     * @return The result, or null when the renderer does not parse or the ids are not video ids.
     */
    @Nullable
    static RendererResult retargetRenderer(byte[] renderer, String fromId, String toId, boolean setHint) {
        if (fromId.length() != VIDEO_ID_LENGTH || !isVideoId(toId)) return null;
        try {
            byte[] from = fromId.getBytes(StandardCharsets.ISO_8859_1);
            byte[] to = toId.getBytes(StandardCharsets.ISO_8859_1);
            ByteArrayOutputStream out = new ByteArrayOutputStream(renderer.length + 16);
            int copied = 0;
            int ids = 0;
            int commands = 0;
            String type = "untouched";
            String hint = "none";
            for (Field field : parse(renderer)) {
                if (field.wireType != 2) continue;

                byte[] payload = payload(renderer, field);
                byte[] replacement = null;
                if (Arrays.equals(payload, from)) {
                    replacement = to;
                    ids++;
                } else {
                    Result retargeted = retarget(payload, fromId, toId, setHint);
                    if (retargeted != null) {
                        replacement = retargeted.command();
                        commands++;
                        type = retargeted.type();
                        hint = retargeted.hint();
                    }
                }
                if (replacement == null) continue;

                out.write(renderer, copied, field.tagEnd - copied);
                writeVarint(out, replacement.length);
                out.write(replacement, 0, replacement.length);
                copied = field.end;
            }
            out.write(renderer, copied, renderer.length - copied);
            return new RendererResult(out.toByteArray(), ids, commands, type, hint);
        } catch (IllegalArgumentException malformed) {
            return null;
        }
    }

    /**
     * Retargets a watch command from one video id to another, see the class comment.
     *
     * @param fromId  The video id the watch endpoint carries now.
     * @param toId    The video id to carry instead.
     * @param setHint Also ask the app for the audio mode by the config's playlist content type (see
     *                {@link #HINT_FIELD}), which it reads when a watch starts. Pass false while the data-saving
     *                override is held (see {@link AudioFirstLogic#hintsIn}); it is audio already.
     * @return The retargeted command, or null when it has no watch endpoint with exactly {@code fromId} or when it
     * cannot be read. A type other than official music video is left as it is, and a config of another shape is
     * left untouched (no type switch, no hint).
     */
    @Nullable
    static Result retarget(byte[] command, String fromId, String toId, boolean setHint) {
        return retarget(command, fromId, toId, setHint, TYPE_ATV);
    }

    /**
     * As {@link #retarget(byte[], String, String, boolean)}, to a video of the given music video type: the type of the
     * config changes only when it is the other one of the two, so a song (ATV) tapped for its music video (OMV) names
     * the video as the app lists it. {@code type} says what happened ({@code "1->2"}, {@code "2->1"} or
     * {@code "untouched"}).
     */
    @Nullable
    static Result retarget(byte[] command, String fromId, String toId, boolean setHint, int toType) {
        if (fromId.length() != VIDEO_ID_LENGTH || !isVideoId(toId)) return null;
        try {
            Field watchField = first(parse(command), WATCH_ENDPOINT_FIELD, 2);
            if (watchField == null) return null;
            byte[] watch = payload(command, watchField);

            Field idField = first(parse(watch), VIDEO_ID_FIELD, 2);
            if (idField == null || !new String(payload(watch, idField), StandardCharsets.ISO_8859_1).equals(fromId)) {
                return null;
            }
            byte[] newWatch = replacePayload(watch, idField, toId.getBytes(StandardCharsets.ISO_8859_1));

            String type = "untouched";
            String hint = "none";
            try {
                ConfigEdit edit = editSupportedConfig(newWatch, setHint, toType);
                if (edit != null) {
                    newWatch = edit.watch;
                    type = edit.type;
                    hint = edit.hint;
                }
            } catch (IllegalArgumentException unrecognised) {
                // The config does not have the expected shape: keep it untouched.
            }
            return new Result(replacePayload(command, watchField, newWatch), type, hint);
        } catch (IllegalArgumentException malformed) {
            return null;
        }
    }

    /** The watch endpoint with its music config edited, or null when it has no music config. */
    @Nullable
    private static ConfigEdit editSupportedConfig(byte[] watch, boolean setHint, int toType) {
        Field supportedField = first(parse(watch), SUPPORTED_CONFIG_FIELD, 2);
        if (supportedField == null) return null;
        byte[] supported = payload(watch, supportedField);

        Field musicField = first(parse(supported), MUSIC_CONFIG_FIELD, 2);
        if (musicField == null) return null;
        byte[] music = payload(supported, musicField);

        List<Field> fields = parse(music);
        Field hintField = first(fields, HINT_FIELD, 0);
        for (Field field : fields) {
            if (setHint && field.number == HINT_FIELD && field.wireType != 0) {
                throw new IllegalArgumentException("Hint");
            }
        }
        ByteArrayOutputStream out = new ByteArrayOutputStream(music.length + 2);
        String type = "untouched";
        String hint = "none";
        boolean hintWritten = hintField != null || !setHint;
        for (Field field : fields) {
            if (!hintWritten && field.number > HINT_FIELD) {
                writeHint(out);
                hint = "added";
                hintWritten = true;
            }
            int otherType = toType == TYPE_ATV ? TYPE_OMV : TYPE_ATV;
            if (field.number == MUSIC_VIDEO_TYPE_FIELD && field.wireType == 0
                    && readVarint(music, new int[]{field.valueStart}) == otherType) {
                out.write(music, field.start, field.valueStart - field.start);
                writeVarint(out, toType);
                type = otherType + "->" + toType;
            } else if (setHint && field == hintField) {
                boolean already = readVarint(music, new int[]{field.valueStart}) == HINT_ATV_PREFERRED;
                if (already) {
                    out.write(music, field.start, field.end - field.start);
                } else {
                    writeHint(out);
                }
                hint = already ? "present" : "replaced";
            } else {
                out.write(music, field.start, field.end - field.start);
            }
        }
        if (!hintWritten) {
            writeHint(out);
            hint = "added";
        }

        byte[] newSupported = replacePayload(supported, musicField, out.toByteArray());
        return new ConfigEdit(replacePayload(watch, supportedField, newSupported), type, hint);
    }

    private static void writeHint(ByteArrayOutputStream out) {
        writeVarint(out, (long) HINT_FIELD << 3);
        writeVarint(out, HINT_ATV_PREFERRED);
    }

    private static boolean isVideoId(String id) {
        if (id.length() != VIDEO_ID_LENGTH) return false;
        for (int index = 0; index < id.length(); index++) {
            char c = id.charAt(index);
            if (!((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || c == '-' || c == '_')) {
                return false;
            }
        }
        return true;
    }

    @Nullable
    private static Field first(List<Field> fields, int number, int wireType) {
        for (Field field : fields) {
            if (field.number == number && field.wireType == wireType) return field;
        }
        return null;
    }

    private static byte[] payload(byte[] message, Field field) {
        byte[] bytes = new byte[field.end - field.valueStart];
        System.arraycopy(message, field.valueStart, bytes, 0, bytes.length);
        return bytes;
    }

    /** The message with the length-delimited field's payload replaced; everything else is copied unchanged. */
    private static byte[] replacePayload(byte[] message, Field field, byte[] payload) {
        ByteArrayOutputStream out = new ByteArrayOutputStream(message.length + payload.length);
        out.write(message, 0, field.tagEnd);
        writeVarint(out, payload.length);
        out.write(payload, 0, payload.length);
        out.write(message, field.end, message.length - field.end);
        return out.toByteArray();
    }

    private static List<Field> parse(byte[] message) {
        List<Field> fields = new ArrayList<>();
        int[] position = {0};
        while (position[0] < message.length) {
            int start = position[0];
            long key = readVarint(message, position);
            int number = (int) (key >>> 3);
            int wireType = (int) (key & 7);
            int tagEnd = position[0];
            if (number <= 0) throw new IllegalArgumentException("Field number 0");
            switch (wireType) {
                case 0 -> readVarint(message, position);
                case 1 -> position[0] = checked(message, position[0], 8);
                case 5 -> position[0] = checked(message, position[0], 4);
                case 2 -> {
                    long length = readVarint(message, position);
                    if (length < 0 || length > message.length) throw new IllegalArgumentException("Bad length");
                    int valueStart = position[0];
                    position[0] = checked(message, valueStart, (int) length);
                    fields.add(new Field(number, wireType, start, tagEnd, valueStart, position[0]));
                    continue;
                }
                default -> throw new IllegalArgumentException("Unsupported wire type " + wireType);
            }
            fields.add(new Field(number, wireType, start, tagEnd, tagEnd, position[0]));
        }
        return fields;
    }

    private static int checked(byte[] message, int from, int length) {
        if (from + length > message.length) throw new IllegalArgumentException("Truncated field");
        return from + length;
    }

    private static long readVarint(byte[] data, int[] position) {
        long result = 0;
        for (int shift = 0; shift < 64; shift += 7) {
            if (position[0] >= data.length) throw new IllegalArgumentException("Truncated varint");
            byte b = data[position[0]++];
            result |= (long) (b & 0x7F) << shift;
            if ((b & 0x80) == 0) return result;
        }
        throw new IllegalArgumentException("Malformed varint");
    }

    private static void writeVarint(ByteArrayOutputStream out, long value) {
        while ((value & ~0x7FL) != 0) {
            out.write((int) ((value & 0x7F) | 0x80));
            value >>>= 7;
        }
        out.write((int) value);
    }
}

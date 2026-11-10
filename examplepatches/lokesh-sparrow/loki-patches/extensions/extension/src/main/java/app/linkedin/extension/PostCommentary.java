/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.regex.Pattern;

/**
 * The text of a feed post, for Copy text in the post's &#8943; menu.
 * <p>
 * The text is in the component whose view tracking (Component field 26, ViewTrackingAnnotations) is named
 * feed-commentary: TextBlock.text, a TextModel whose field 1 is the text. The earlier lookup went to the innermost
 * message containing "feed-commentary", which is the ViewTrackingAnnotations itself, and took its longest string: the
 * contentTrackingId (field 4), a 16 byte id in base64 such as 1oJRCzEhRL+9jybkyTUkyA==. That is what was copied.
 * It also could not see a text with line breaks, as the string scanner skips anything with a control character.
 * <p>
 * So: find that component, leave out its view tracking, its triggers and its state bindings, and take the longest
 * text left, line breaks allowed. Field numbers are those of LinkedIn 4.1.1270 (proto.sdui.components.core).
 */
final class PostCommentary {
    static final String NAME = "feed-commentary";
    private static final int VIEW_TRACKING = 26;
    private static final int TRIGGERS = 25;
    private static final int VIEW_NAME = 1;
    private static final String BINDING = "MemoryNamespace";
    /** A contentTrackingId: 16 bytes in base64. Never a post. */
    private static final Pattern TRACKING_ID = Pattern.compile("[A-Za-z0-9+/_-]{22}==");
    private static final int MAX_DEPTH = 48;

    private PostCommentary() {
    }

    /** The post's text, or null when none could be found. */
    static String text(byte[] payload) {
        byte[] component = component(payload, 0);
        if (component == null) return null;
        List<ProtoEdit.Field> fields = ProtoEdit.parse(component);
        if (fields == null) return null;
        String[] best = {null};
        // The content of a component is its compactData (field 35, a CompactAny holding the TextBlock). The rest is
        // the component's own machinery: key, view tracking, triggers, reuse ids, debug ids.
        for (ProtoEdit.Field field : fields) {
            if (field.wireType != 2 || field.number != COMPACT_DATA) continue;
            // CompactAny.payload (2) is the TextBlock: TextBlock.text (1) is a TextModel, TextModel.text (1) the post.
            String exact = asText(path(path(path(field.data, 2), 1), 1));
            if (exact != null && !exact.trim().isEmpty()) return exact;
            collect(field.data, best, 0);
        }
        return best[0];
    }

    /** The first length-delimited field with that number, or null. */
    private static byte[] path(byte[] data, int number) {
        List<ProtoEdit.Field> fields = parse(data);
        if (fields == null) return null;
        for (ProtoEdit.Field field : fields) {
            if (field.number == number && field.wireType == 2) return field.data;
        }
        return null;
    }

    private static final int COMPACT_DATA = 35;

    /** A message, also when LinkedIn prefixes it with a single 0x00 byte, as it does for some embedded payloads. */
    private static List<ProtoEdit.Field> parse(byte[] data) {
        if (data == null || data.length == 0) return null;
        List<ProtoEdit.Field> fields = ProtoEdit.parse(data);
        if (fields == null && data.length > 1 && data[0] == 0) {
            fields = ProtoEdit.parse(java.util.Arrays.copyOfRange(data, 1, data.length));
        }
        return fields;
    }

    /** Whether a string is a tracking id rather than writing: used to refuse one from the old lookup. */
    static boolean isTrackingId(String text) {
        return text != null && TRACKING_ID.matcher(text).matches();
    }

    /** The first component, in order, whose view tracking is named feed-commentary. */
    private static byte[] component(byte[] data, int depth) {
        if (data == null || depth > MAX_DEPTH || !ProtoEdit.contains(data, NAME)) return null;
        List<ProtoEdit.Field> fields = ProtoEdit.parse(data);
        if (fields == null) return null;
        for (ProtoEdit.Field field : fields) {
            if (field.number == VIEW_TRACKING && field.wireType == 2 && NAME.equals(viewName(field.data))) return data;
        }
        for (ProtoEdit.Field field : fields) {
            if (field.wireType != 2 || !ProtoEdit.contains(field.data, NAME)) continue;
            byte[] found = component(field.data, depth + 1);
            if (found != null) return found;
        }
        return null;
    }

    private static String viewName(byte[] viewTracking) {
        List<ProtoEdit.Field> fields = ProtoEdit.parse(viewTracking);
        if (fields == null) return null;
        for (ProtoEdit.Field field : fields) {
            if (field.number == VIEW_NAME && field.wireType == 2) {
                return new String(field.data, StandardCharsets.UTF_8);
            }
        }
        return null;
    }

    /** Keeps the longest piece of writing under this message, leaving state bindings out. */
    private static void collect(byte[] data, String[] best, int depth) {
        if (depth > MAX_DEPTH) return;
        List<ProtoEdit.Field> fields = parse(data);
        if (fields == null) {
            consider(asText(data), best);
            return;
        }
        // A binding to the screen's state ({2: "MemoryNamespace", 3: {1: key}}) holds keys, not writing.
        for (ProtoEdit.Field field : fields) {
            if (field.wireType == 2 && BINDING.equals(new String(field.data, StandardCharsets.UTF_8))) return;
        }
        String before = best[0];
        boolean nested = false;
        for (ProtoEdit.Field field : fields) {
            if (field.wireType == 2) {
                nested = true;
                collect(field.data, best, depth + 1);
            }
        }
        // Short writing can also read as a message ("Hi" is field 9 = 105): numbers only, nothing found, keep it.
        if (!nested && best[0] == before) consider(asText(data), best);
    }

    private static void consider(String candidate, String[] best) {
        if (candidate == null) return;
        String trimmed = candidate.trim();
        if (trimmed.isEmpty() || trimmed.equals(NAME) || trimmed.startsWith("urn:li:") || trimmed.startsWith("http")
                || isTrackingId(trimmed)) {
            return;
        }
        if (best[0] == null || candidate.length() > best[0].length()) best[0] = candidate;
    }

    /** The bytes as text: valid UTF-8 whose only control characters are line breaks and tabs. */
    private static String asText(byte[] data) {
        if (data == null || data.length == 0) return null;
        for (byte b : data) {
            int c = b & 0xff;
            if ((c < 0x20 && c != '\n' && c != '\r' && c != '\t') || c == 0x7f) return null;
        }
        try {
            return StandardCharsets.UTF_8.newDecoder()
                    .onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT)
                    .decode(ByteBuffer.wrap(data)).toString();
        } catch (CharacterCodingException e) {
            return null;
        }
    }
}

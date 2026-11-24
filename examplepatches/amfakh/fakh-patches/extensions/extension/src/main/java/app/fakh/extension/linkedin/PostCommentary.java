/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.linkedin;

import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;

/**
 * Reads the text of a post or a comment out of the server-driven payload of a feed item, for Copy text.
 *
 * <p>A text sits in a component that carries a view-tracking message (field 26) whose first field is the view name:
 * {@code feed-commentary} for a post, {@code feed-commentary-expand} on the Video tab, {@code comment-commentary} for a
 * comment. The component holds the text either in a CompactAny (field 35, text at 2/1/1) or in a TextBlock (field 29,
 * text at 1/1). Field numbers are those of LinkedIn 4.1.1270.
 */
final class PostCommentary {
    private static final int TEXT_BLOCK = 29;
    private static final int COMPACT_DATA = 35;
    private static final int VIEW_TRACKING = 26;
    private static final int MAX_DEPTH = 48;

    private PostCommentary() {
    }

    /**
     * The text of a post.
     *
     * @param payload the item's payload
     * @return the text, or null when the payload has none
     */
    static String text(byte[] payload) {
        byte[] component = component(payload, "feed-commentary", 0);
        return read(component != null ? component : component(payload, "feed-commentary-expand", 0));
    }

    /**
     * The text of a comment.
     *
     * @param payload the item's payload
     * @return the text, or null when the payload has none
     */
    static String commentText(byte[] payload) {
        return read(component(payload, "comment-commentary", 0));
    }

    /** The text of a component: the known place first, then the longest plain text under its content fields. */
    private static String read(byte[] component) {
        List<ProtoEdit.Field> fields = component == null ? null : ProtoEdit.parse(component);
        if (fields == null) return null;
        String longest = null;
        for (ProtoEdit.Field field : fields) {
            if (field.wireType != 2 || (field.number != COMPACT_DATA && field.number != TEXT_BLOCK)) continue;
            byte[] known = field.number == COMPACT_DATA
                    ? ProtoEdit.nested(field.data, 2, 1, 1)
                    : ProtoEdit.nested(field.data, 1, 1);
            String text = plain(known);
            if (text != null && !text.trim().isEmpty()) return text;
            String guess = longestText(field.data, 0);
            if (guess != null && (longest == null || guess.length() > longest.length())) longest = guess;
        }
        return longest;
    }

    /** The first message, outermost first, whose view tracking is named {@code name}. */
    private static byte[] component(byte[] message, String name, int depth) {
        if (message == null || depth > MAX_DEPTH || !ProtoEdit.contains(message, name)) return null;
        List<ProtoEdit.Field> fields = ProtoEdit.parse(message);
        if (fields == null) return null;
        for (ProtoEdit.Field field : fields) {
            if (field.number != VIEW_TRACKING || field.wireType != 2) continue;
            List<ProtoEdit.Field> tracking = ProtoEdit.parse(field.data);
            if (tracking != null && !tracking.isEmpty() && name.equals(new String(tracking.get(0).data, StandardCharsets.UTF_8))) {
                return message;
            }
        }
        for (ProtoEdit.Field field : fields) {
            byte[] inner = field.wireType == 2 ? component(field.data, name, depth + 1) : null;
            if (inner != null) return inner;
        }
        return null;
    }

    /**
     * The longest text below a message, for a layout the known places do not cover. Screen-state bindings (a field
     * equal to "MemoryNamespace"), URNs, links and the view name hold ids, not writing, and are skipped.
     */
    private static String longestText(byte[] message, int depth) {
        if (depth > MAX_DEPTH) return null;
        List<ProtoEdit.Field> fields = ProtoEdit.parse(message);
        if (fields == null && message.length > 1 && message[0] == 0) {
            fields = ProtoEdit.parse(Arrays.copyOfRange(message, 1, message.length));
        }
        if (fields == null) return writing(plain(message));
        String longest = null;
        boolean nested = false;
        for (ProtoEdit.Field field : fields) {
            if (field.wireType != 2) continue;
            if ("MemoryNamespace".equals(new String(field.data, StandardCharsets.UTF_8))) return null;
            nested = true;
            String inner = longestText(field.data, depth + 1);
            if (inner != null && (longest == null || inner.length() > longest.length())) longest = inner;
        }
        // A short text can read as a message made of numbers only; with nothing found below it, it is the text.
        return nested || longest != null ? longest : writing(plain(message));
    }

    /** The text unless it is an id, a URN, a link or the view name itself. */
    private static String writing(String text) {
        if (text == null) return null;
        String trimmed = text.trim();
        boolean id = trimmed.matches("[A-Za-z0-9+/_-]{22}==");
        boolean skipped = trimmed.isEmpty() || id || trimmed.startsWith("urn:li:") || trimmed.startsWith("http")
                || trimmed.startsWith("feed-commentary");
        return skipped ? null : text;
    }

    /** The bytes as UTF-8 text with no control characters but line breaks and tabs, or null. */
    private static String plain(byte[] bytes) {
        if (bytes == null || bytes.length == 0) return null;
        for (byte b : bytes) {
            if ((b >= 0 && b < 0x20 && b != '\n' && b != '\r' && b != '\t') || b == 0x7f) return null;
        }
        try {
            return StandardCharsets.UTF_8.newDecoder()
                    .onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT)
                    .decode(ByteBuffer.wrap(bytes)).toString();
        } catch (CharacterCodingException e) {
            return null;
        }
    }
}

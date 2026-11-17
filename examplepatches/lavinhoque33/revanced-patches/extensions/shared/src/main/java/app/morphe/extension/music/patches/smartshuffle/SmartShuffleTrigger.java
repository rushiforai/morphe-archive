/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.WireFormat;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

/** Read-only decoding of the two native start commands captured on Moto, not generated watch params. */
final class SmartShuffleTrigger {
    static final int WATCH = 48687757;
    static final int WATCH_PLAYLIST = 52666186;
    private static final String HEADER_KEY = "elevate_shuffle_toggle_button_entity_key_";

    enum Kind { PLAYLIST, SONG }

    record Start(String playlistId, Kind kind) {}
    record Labels(String shuffleOff, String shuffleOn) {}

    private SmartShuffleTrigger() {}

    static Labels labels(byte[] bytes) {
        String[] labels = new String[2];
        collectLabels(bytes, 0, labels);
        return new Labels(labels[0], labels[1]);
    }

    private static void collectLabels(byte[] bytes, int depth, String[] labels) {
        if (depth > 48) return;
        byte[] toggle = field(bytes, 479644279);
        if (toggle != null) {
            for (int state = 1; state <= 2; state++) {
                byte[] wrapper = field(toggle, state);
                byte[] button = wrapper == null ? null : field(wrapper, 461054335);
                if (button != null) labels[state - 1] = text(button, 5);
            }
        }
        try {
            CodedInputStream input = CodedInputStream.newInstance(bytes);
            for (int tag; (tag = input.readTag()) != 0;) {
                if (WireFormat.getTagWireType(tag) == WireFormat.WIRETYPE_LENGTH_DELIMITED) {
                    collectLabels(input.readByteArray(), depth + 1, labels);
                } else if (!input.skipField(tag)) break;
            }
        } catch (IOException | IllegalArgumentException ignored) {
            // Strings and opaque native bytes are leaves.
        }
    }

    static boolean playlist(String id) {
        return id != null && !id.isEmpty() && !id.startsWith("RD") && !id.startsWith("OLAK");
    }

    static Start command(byte[] bytes) {
        byte[] endpoint = field(bytes, WATCH_PLAYLIST);
        if (endpoint != null) {
            String playlistId = text(endpoint, 1);
            return playlist(playlistId) ? new Start(playlistId, Kind.PLAYLIST) : null;
        }
        endpoint = field(bytes, WATCH);
        if (endpoint == null) return null;
        String playlistId = text(endpoint, 2);
        if (!playlist(playlistId) || text(endpoint, 1).isEmpty() || text(endpoint, 13).isEmpty()) return null;
        // Captured song starts carry field 13 (playlist entry), unlike restored queues and queue skips.
        return new Start(playlistId, Kind.SONG);
    }

    static String headerPlaylist(byte[] bytes) {
        return headerPlaylist(bytes, 0);
    }

    private static String headerPlaylist(byte[] bytes, int depth) {
        if (depth > 48) return null;
        try {
            CodedInputStream input = CodedInputStream.newInstance(bytes);
            for (int tag; (tag = input.readTag()) != 0;) {
                if (WireFormat.getTagWireType(tag) != WireFormat.WIRETYPE_LENGTH_DELIMITED) {
                    if (!input.skipField(tag)) break;
                    continue;
                }
                byte[] value = input.readByteArray();
                String text = new String(value, StandardCharsets.UTF_8);
                if (text.startsWith(HEADER_KEY)) {
                    String id = text.substring(HEADER_KEY.length());
                    if (playlist(id)) return id;
                }
                String found = headerPlaylist(value, depth + 1);
                if (found != null) return found;
            }
        } catch (IOException | IllegalArgumentException ignored) {
            // A length-delimited leaf can be a string rather than another message.
        }
        return null;
    }

    static byte[] field(byte[] bytes, int number) {
        try {
            CodedInputStream input = CodedInputStream.newInstance(bytes);
            for (int tag; (tag = input.readTag()) != 0;) {
                if (WireFormat.getTagFieldNumber(tag) == number
                        && WireFormat.getTagWireType(tag) == WireFormat.WIRETYPE_LENGTH_DELIMITED) {
                    return input.readByteArray();
                }
                if (!input.skipField(tag)) break;
            }
        } catch (IOException | IllegalArgumentException ignored) {
            // Malformed or unrelated commands never activate the feature.
        }
        return null;
    }

    private static String text(byte[] bytes, int number) {
        byte[] value = field(bytes, number);
        return value == null ? "" : new String(value, StandardCharsets.UTF_8);
    }

    static boolean accepts(Start start, String visiblePlaylist, boolean visibleHeader, boolean songRow,
                           boolean shuffled, boolean enabled, boolean recentUserCommand) {
        return recentUserCommand && enabled && shuffled && start != null
                && start.playlistId().equals(visiblePlaylist)
                && (start.kind() == Kind.PLAYLIST ? visibleHeader : songRow);
    }
}

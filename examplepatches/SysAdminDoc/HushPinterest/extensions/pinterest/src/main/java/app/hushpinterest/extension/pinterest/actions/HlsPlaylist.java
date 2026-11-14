/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import androidx.annotation.Nullable;

import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Reads the HLS playlists Pinterest streams a video with (#27). Most video pins carry no MP4 at all,
 * only a master playlist on the media host. Its variants are fragmented MP4 cut from one file each,
 * with the sound in a separate audio playlist; older pins have MPEG-TS pieces with the sound inside.
 * Either way the parts of the best variant, fetched whole and put end to end, make a file Android's
 * MediaExtractor reads, so Download pin can join them into one MP4 without decoding anything.
 */
final class HlsPlaylist {
    private HlsPlaylist() {}

    /** The type a playlist link names, shown for a streamed video's link in the media details. */
    static final String TYPE = "application/vnd.apple.mpegurl";
    /** More parts than any pin's video has. A playlist with more isn't read. */
    static final int MOST_PARTS = 4000;

    /** Whether a Content-Type header is one an HLS playlist is served with. */
    static boolean type(@Nullable String header) {
        if (header == null) return false;
        String type = header.split(";", 2)[0].trim().toLowerCase(Locale.ROOT);
        return type.equals(TYPE) || type.equals("application/x-mpegurl")
                || type.equals("audio/mpegurl") || type.equals("audio/x-mpegurl");
    }

    /** The best variant of a master playlist: its media playlist, and the audio playlist it plays with. */
    static final class Choice {
        final URI media;
        /** Null when the variant carries its own sound, or has none. */
        @Nullable final URI audio;

        Choice(URI media, @Nullable URI audio) {
            this.media = media;
            this.audio = audio;
        }
    }

    /** Whether [text] is a playlist at all: its first line is the HLS header. */
    static boolean playlist(@Nullable String text) {
        if (text == null) return false;
        for (String line : lines(text)) return line.equals("#EXTM3U");
        return false;
    }

    /** Whether [text] is a master playlist, one that lists variants rather than parts. */
    static boolean master(String text) {
        for (String line : lines(text)) if (line.startsWith("#EXT-X-STREAM-INF:")) return true;
        return false;
    }

    /**
     * The variant with the highest bandwidth in master playlist [text], read from [base], with the
     * audio playlist its audio group names (the default one, else the first). Null when no variant
     * is on the media host, or its audio is somewhere else.
     */
    @Nullable
    static Choice best(URI base, String text) {
        if (!playlist(text)) return null;
        List<String> lines = lines(text);
        Map<String, URI> audio = new HashMap<>();
        Map<String, Boolean> chosenDefault = new HashMap<>();
        URI media = null;
        String group = null;
        long highest = -1;
        for (int i = 0; i < lines.size(); i++) {
            String line = lines.get(i);
            if (line.startsWith("#EXT-X-MEDIA:")) {
                Map<String, String> tags = attributes(line.substring("#EXT-X-MEDIA:".length()));
                String id = tags.get("GROUP-ID"), uri = tags.get("URI");
                if (!"AUDIO".equals(tags.get("TYPE")) || id == null || uri == null) continue;
                boolean preferred = "YES".equals(tags.get("DEFAULT"));
                // The default rendition wins, else the first one listed.
                if (audio.containsKey(id) && (Boolean.TRUE.equals(chosenDefault.get(id)) || !preferred)) continue;
                URI resolved = resolve(base, uri);
                if (resolved == null) continue;
                audio.put(id, resolved);
                chosenDefault.put(id, preferred);
            } else if (line.startsWith("#EXT-X-STREAM-INF:")) {
                Map<String, String> tags = attributes(line.substring("#EXT-X-STREAM-INF:".length()));
                String next = null;
                for (int j = i + 1; j < lines.size(); j++) {
                    String candidate = lines.get(j);
                    if (candidate.startsWith("#")) continue;
                    next = candidate;
                    break;
                }
                URI variant = next == null ? null : resolve(base, next);
                long bandwidth = number(tags.get("BANDWIDTH"));
                if (variant == null || bandwidth <= highest) continue;
                highest = bandwidth;
                media = variant;
                group = tags.get("AUDIO");
            }
        }
        if (media == null) return null;
        if (group == null) return new Choice(media, null);
        // A variant that names an audio group with no playlist of its own carries the sound itself.
        boolean named = false;
        for (String line : lines) {
            if (!line.startsWith("#EXT-X-MEDIA:")) continue;
            Map<String, String> tags = attributes(line.substring("#EXT-X-MEDIA:".length()));
            if ("AUDIO".equals(tags.get("TYPE")) && group.equals(tags.get("GROUP-ID")) && tags.get("URI") != null) named = true;
        }
        if (!named) return new Choice(media, null);
        URI sound = audio.get(group);
        return sound == null ? null : new Choice(media, sound);
    }

    /**
     * The files a finished media playlist [text], read from [base], is cut from, in order: its
     * initialization file, then each file its parts come from. Parts that are byte ranges of one file
     * share it. Empty when the playlist isn't finished, is encrypted, names a file off the media
     * host, or goes back to a file it already left, which putting the files end to end can't follow.
     */
    static List<URI> parts(URI base, String text) {
        if (!playlist(text) || master(text)) return Collections.emptyList();
        List<String> lines = lines(text);
        boolean finished = false;
        URI map = null;
        List<URI> parts = new ArrayList<>();
        for (String line : lines) {
            if (line.equals("#EXT-X-ENDLIST")) {
                finished = true;
            } else if (line.startsWith("#EXT-X-KEY:")) {
                String method = attributes(line.substring("#EXT-X-KEY:".length())).get("METHOD");
                if (!"NONE".equals(method)) return Collections.emptyList();
            } else if (line.startsWith("#EXT-X-MAP:")) {
                String uri = attributes(line.substring("#EXT-X-MAP:".length())).get("URI");
                URI resolved = uri == null ? null : resolve(base, uri);
                // One initialization for the whole video, ahead of every part.
                if (resolved == null || (map != null && !map.equals(resolved)) || (map == null && !parts.isEmpty())) {
                    return Collections.emptyList();
                }
                map = resolved;
            } else if (!line.startsWith("#")) {
                URI part = resolve(base, line);
                if (part == null) return Collections.emptyList();
                if (parts.isEmpty() && map != null && !map.equals(part)) parts.add(map);
                if (!parts.isEmpty() && parts.get(parts.size() - 1).equals(part)) continue;
                if (parts.contains(part) || parts.size() == MOST_PARTS) return Collections.emptyList();
                parts.add(part);
            }
        }
        return finished && !parts.isEmpty() ? parts : Collections.emptyList();
    }

    /** [reference] read from [base], kept only on the media host. */
    @Nullable
    private static URI resolve(URI base, String reference) {
        try {
            URI resolved = base.resolve(reference.trim());
            return PinMedia.mediaUri(resolved.toString()) == null ? null : resolved;
        } catch (IllegalArgumentException malformed) {
            return null;
        }
    }

    private static List<String> lines(String text) {
        List<String> lines = new ArrayList<>();
        for (String line : text.split("\r?\n")) {
            String trimmed = line.trim();
            if (!trimmed.isEmpty()) lines.add(trimmed);
        }
        return lines;
    }

    private static long number(@Nullable String value) {
        if (value == null || !value.matches("[0-9]{1,18}")) return 0;
        return Long.parseLong(value);
    }

    /** A tag's attribute list: NAME=value pairs split by commas, where a quoted value may hold a comma. */
    static Map<String, String> attributes(String list) {
        Map<String, String> found = new HashMap<>();
        int at = 0, length = list.length();
        while (at < length) {
            int equals = list.indexOf('=', at);
            if (equals < 0) break;
            String name = list.substring(at, equals).trim();
            int end;
            String value;
            if (equals + 1 < length && list.charAt(equals + 1) == '"') {
                int close = list.indexOf('"', equals + 2);
                if (close < 0) break;
                value = list.substring(equals + 2, close);
                end = close + 1;
            } else {
                int comma = list.indexOf(',', equals + 1);
                end = comma < 0 ? length : comma;
                value = list.substring(equals + 1, end).trim();
            }
            found.putIfAbsent(name, value);
            int comma = list.indexOf(',', end);
            if (comma < 0) break;
            at = comma + 1;
        }
        return found;
    }
}

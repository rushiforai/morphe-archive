package io.github.sabopura.morphe.extension.twitch.player;

/**
 * Names what a player was given when that is a playlist's text instead of a URL. Twitch 31.9.0
 * loads a VOD's playlist itself and hands the player the text; fetched again, the same VOD's text
 * differs (serving id, tokens), so the text cannot stand for the content.
 */
final class PlayerContent {
    private static final String PLAYLIST = "playlist:";
    private static final String HEADER = "#EXTM3U";
    /** Where every live stream's renditions are served from; a VOD's are in the VOD's own folder. */
    private static final String LIVE_FOLDER = "/v1/playlist";

    private PlayerContent() {
    }

    static boolean isPlaylist(String source) {
        return source.regionMatches(firstVisible(source), HEADER, 0, HEADER.length());
    }

    static boolean isPlaylistName(String content) {
        return content.startsWith(PLAYLIST);
    }

    /**
     * Whether {@code content} names a playlist that can be a recording's. Twitch hands the player a
     * live stream's playlist as text too, and that one must not be taken for the VOD watched before it.
     */
    static boolean isRecordingName(String content) {
        return isPlaylistName(content) && !content.equals(PLAYLIST + LIVE_FOLDER);
    }

    /** The folder of the playlist's first rendition, which is the same every time the playlist is fetched. */
    static String playlistName(String playlist) {
        int at = 0, length = playlist.length();
        while (at < length) {
            int end = playlist.indexOf('\n', at);
            if (end < 0) end = length;
            String line = playlist.substring(at, end).trim();
            at = end + 1;
            if (line.isEmpty() || line.charAt(0) == '#') continue;
            int query = line.indexOf('?');
            if (query >= 0) line = line.substring(0, query);
            int scheme = line.indexOf("://");
            int path = scheme < 0 ? 0 : line.indexOf('/', scheme + 3);
            int file = line.lastIndexOf('/');
            return PLAYLIST + (path < 0 || file <= path ? "" : line.substring(path, file));
        }
        return PLAYLIST;
    }

    private static int firstVisible(String text) {
        int at = 0;
        while (at < text.length() && (text.charAt(at) <= ' ' || text.charAt(at) == '﻿')) at++;
        return at;
    }
}

/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4595
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-12.
 */
package app.morphe.extension.music.patches.misc;

import static app.morphe.extension.music.patches.misc.EnableAudioVideoSwitchPatch.isVideoId;
import static app.morphe.extension.music.patches.misc.EnableAudioVideoSwitchPatch.normalize;

import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.music.patches.album.PlaylistRequest.Song;

/** Matches an album recording to metadata belonging to the requested video, never a queue position. */
final class AlbumSongMatcher {
    static final int MAX_LENGTH_DIFFERENCE_SECONDS = 45;
    private static final Pattern VARIANT_WORDS = Pattern.compile(
            "\\b(remix|live|acoustic|instrumental|sped up|slowed|edit|extended|karaoke|cover)\\b");

    private AlbumSongMatcher() {}

    @Nullable
    static Song match(String videoId, @Nullable JSONObject source, Song[] songs) {
        if (source == null || !videoId.equals(source.optString("videoId", ""))) return null;

        String artist = firstRun(source, "longBylineText");
        if (artist.isEmpty()) artist = firstRun(source, "shortBylineText");
        return match(videoId, firstRun(source, "title"), normalize(artist),
                parseLength(firstRun(source, "lengthText")), songs);
    }

    @Nullable
    static Song match(String videoId, String title, String artist, int length, Song[] songs) {
        String wantedTitle = comparableTitle(title, artist);
        if (wantedTitle.isEmpty() || artist.isEmpty()) return null;

        Set<String> variants = variantWords(title);
        Song found = null;
        for (Song song : songs) {
            if (song == null || !isVideoId(song.videoId()) || videoId.equals(song.videoId())) continue;
            if (!wantedTitle.equals(comparableTitle(song.title(), artist))
                    || !normalize(song.artist()).contains(artist)
                    || !variants.equals(variantWords(song.title()))) continue;
            if (length > 0 && song.durationSeconds() > 0
                    && Math.abs(length - song.durationSeconds()) > MAX_LENGTH_DIFFERENCE_SECONDS) continue;

            // Multiple recordings with this metadata are not an exact association.
            if (found != null && !found.videoId().equals(song.videoId())) return null;
            found = song;
        }
        return found;
    }

    private static String firstRun(JSONObject renderer, String name) {
        JSONObject text = renderer.optJSONObject(name);
        JSONArray runs = text == null ? null : text.optJSONArray("runs");
        JSONObject run = runs == null ? null : runs.optJSONObject(0);
        return run == null ? "" : run.optString("text", "");
    }

    /** Videos are often called "Artist - Title", the song just "Title". */
    static String comparableTitle(String title, String comparableArtist) {
        String text = normalize(title);
        String prefix = comparableArtist + " ";
        return text.startsWith(prefix) ? text.substring(prefix.length()) : text;
    }

    static Set<String> variantWords(String title) {
        Set<String> words = new HashSet<>();
        Matcher matcher = VARIANT_WORDS.matcher(title.toLowerCase(Locale.ROOT));
        while (matcher.find()) words.add(matcher.group());
        return words;
    }

    /** Seconds from m:ss or h:mm:ss, or zero if invalid. */
    static int parseLength(String length) {
        int seconds = 0;
        for (String part : length.split(":")) {
            try {
                seconds = seconds * 60 + Integer.parseInt(part.trim());
            } catch (NumberFormatException ex) {
                return 0;
            }
        }
        return seconds;
    }
}

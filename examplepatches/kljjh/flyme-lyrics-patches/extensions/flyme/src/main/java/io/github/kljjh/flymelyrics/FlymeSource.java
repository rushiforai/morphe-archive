/* SPDX-License-Identifier: GPL-3.0-only. Matching and title fallback follow Morphe MiniplayerLyrics. */
package io.github.kljjh.flymelyrics;

import app.morphe.extension.music.patches.lyrics.LyricsManager;
import app.morphe.extension.music.patches.lyrics.model.MetadataCleaner;
import app.morphe.extension.music.patches.lyrics.model.TrackInfo;
import app.morphe.extension.music.settings.Settings;
import java.util.Objects;

final class FlymeSource {
    static boolean enabled() { return Settings.LYRICS_ENABLED.get(); }
    static String[] identify(String title, String artist) {
        if (title == null || title.trim().isEmpty() || artist == null || artist.trim().isEmpty()) return null;
        return MetadataCleaner.parseCleanTitleAndArtist(title, artist);
    }
    static String currentLine(String[] displayed, String rawTitle) {
        LyricsManager manager = LyricsManager.getInstance();
        TrackInfo track = manager.getCurrentTrack();
        if (displayed == null || track == null || !manager.areLyricsSynced()
                || !Objects.equals(track.title(), displayed[1]) || !Objects.equals(track.artist(), displayed[0])) return null;
        String line = manager.getCurrentLineText();
        return line == null ? rawTitle : line;
    }
}

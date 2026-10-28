package app.originisland.extension;

import android.util.Log;

import java.util.List;
import java.util.Locale;

/**
 * Gives the music card the lyrics LastWave shows for the song that plays.
 *
 * The player of LastWave loads the lyrics of the song that plays, checks they are still for
 * that song, and keeps them as a state that holds the lines. Its classes are obfuscated, so the
 * patch fills the bridges below with reads of them.
 */
@SuppressWarnings("unused")
public final class LastWaveLyrics {

    private static final String TAG = "OriginIslandLastWave";

    /**
     * The media id of the song the player is keeping lyrics for.
     */
    private static volatile String loadingFor = "";

    private LastWaveLyrics() {
    }

    // Bridges, filled by the patch. The unused parameters are registers for the reads.

    /**
     * @return The time the line starts at, in milliseconds.
     */
    static long lineStartTimeMs(Object line, Object unused) {
        throw new UnsupportedOperationException();
    }

    /**
     * @return The text of the line.
     */
    static String lineText(Object line) {
        throw new UnsupportedOperationException();
    }

    static String titleOf(Object playableTrack) {
        throw new UnsupportedOperationException();
    }

    static String artistOf(Object playableTrack) {
        throw new UnsupportedOperationException();
    }

    /**
     * Injection point. Called as the player keeps what it loaded as the lyrics of a song.
     */
    public static void onLyricsTrack(Object playableTrack) {
        try {
            loadingFor = playableTrack == null ? "" : LastWaveMusicCardPatch.mediaIdOf(
                    titleOf(playableTrack), artistOf(playableTrack));
        } catch (Throwable ex) {
            Log.e(TAG, "onLyricsTrack failure", ex);
        }
    }

    /**
     * Injection point. Called as the player makes the state of lyrics it loaded.
     */
    public static void onLyricsLoaded(List<?> lines, boolean synced) {
        try {
            LastWaveMusicCardPatch.onLyricsChanged(loadingFor, synced ? toLrc(lines) : "");
        } catch (Throwable ex) {
            Log.e(TAG, "onLyricsLoaded failure", ex);
        }
    }

    private static String toLrc(List<?> lines) {
        StringBuilder lrc = new StringBuilder();
        if (lines == null) {
            return "";
        }

        for (Object line : lines) {
            long startTimeMs = lineStartTimeMs(line, null);
            String text = lineText(line);
            if (startTimeMs < 0 || text == null || text.trim().isEmpty()) {
                continue;
            }

            lrc.append(String.format(Locale.US, "[%02d:%02d.%02d]",
                    startTimeMs / 60000, (startTimeMs / 1000) % 60, (startTimeMs % 1000) / 10));
            lrc.append(text.replace('\n', ' ')).append('\n');
        }

        return lrc.toString();
    }
}

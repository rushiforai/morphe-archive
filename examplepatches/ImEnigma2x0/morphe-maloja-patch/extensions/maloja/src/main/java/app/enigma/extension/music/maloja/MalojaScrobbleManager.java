package app.enigma.extension.music.maloja;

import android.media.MediaMetadata;
import android.media.session.PlaybackState;
import android.os.Handler;
import android.os.Looper;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Tracks the current song from the media session and scrobbles it to Maloja once enough of it
 * has played. Mirrors the timer rules of the official Morphe scrobbling patch.
 * <p>
 * All methods must be called on the main thread.
 */
public class MalojaScrobbleManager {
    private static MalojaScrobbleManager instance;

    public static MalojaScrobbleManager getInstance() {
        Utils.verifyOnMainThread();
        if (instance == null) {
            instance = new MalojaScrobbleManager();
        }
        return instance;
    }

    private final Handler handler = new Handler(Looper.getMainLooper());
    private final ExecutorService executor = Executors.newSingleThreadExecutor();

    /** Metadata of the current track, kept so it can be read again as the song of an album. */
    private MediaMetadata currentMetadata;

    private String currentTitle;
    private String currentArtist;
    private String currentAlbum;
    private int currentDurationSeconds;

    /** Wall clock start of the song, sent to Maloja as the listen time. */
    private long songStartedAtSeconds;
    private boolean songStarted;
    private boolean isPlayerPlaying;

    /** Playback of the current song accumulated before the current play stretch. */
    private long playedMillis;
    /** When the current play stretch started, or zero while paused. */
    private long playingSince;
    /** Played time at which the song is scrobbled, or negative if it is not scrobbled at all. */
    private long scrobbleAtPlayedMillis = -1;
    private boolean scrobbled;
    private Runnable scrobbleRunnable;

    private MalojaScrobbleManager() {
        AlbumSongBridge.addChangeListener(this::reloadCurrentTrack);
    }

    /**
     * The song of an album, and the video id of the app itself, can both land after the metadata
     * of a track, so the track is read again whenever either of them arrives.
     */
    private void reloadCurrentTrack() {
        Utils.runOnMainThread(() -> {
            MediaMetadata metadata = currentMetadata;
            if (metadata != null) {
                onSetMetadata(metadata);
            }
        });
    }

    public void onSetMetadata(MediaMetadata metadata) {
        Utils.verifyOnMainThread();
        if (metadata == null) return;

        currentMetadata = metadata;

        String rawTitle = metadata.getString(MediaMetadata.METADATA_KEY_TITLE);
        final String rawArtist = metadata.getString(MediaMetadata.METADATA_KEY_ARTIST);
        final String album = MetadataCleaner.cleanAlbum(metadata.getString(MediaMetadata.METADATA_KEY_ALBUM));
        int duration = (int) (metadata.getLong(MediaMetadata.METADATA_KEY_DURATION) / 1000);

        // With the official "Play album songs" patch the metadata still describes the music video,
        // which names another version of the song and is minutes longer. Only the artist is the same.
        AlbumSongBridge.Song song = AlbumSongBridge.currentSong();
        final boolean songDurationKnown = song != null && song.durationSeconds > 0;
        if (song != null) {
            if (song.title != null && !song.title.isBlank()) {
                rawTitle = song.title;
            }
            if (songDurationKnown) {
                duration = song.durationSeconds;
            }
        }

        final String[] resolved = MetadataCleaner.resolveTitleAndArtist(rawTitle, rawArtist);
        final String title = resolved[0];
        final String artist = resolved[1];
        if (title == null || title.isBlank() || artist == null || artist.isBlank()) {
            return;
        }

        if (!title.equals(currentTitle) || !artist.equals(currentArtist)) {
            Logger.printDebug(() -> "New song detected: " + title + " - " + artist);
            stopTimer();
            songStarted = false;
            scrobbled = false;

            currentTitle = title;
            currentArtist = artist;
            currentAlbum = album;
            currentDurationSeconds = duration;

            if (isPlayerPlaying) {
                onSongStart();
            }
            return;
        }

        // Same song, but the duration or album may only arrive with a later metadata update.
        // The album song is authoritative, since it is shorter than the video it replaces.
        final boolean durationChanged = songDurationKnown
                ? duration != currentDurationSeconds
                : duration > currentDurationSeconds;
        if (durationChanged) {
            final int newDuration = duration;
            Logger.printDebug(() -> "Updated duration for " + title + ": " + newDuration + "s");
            currentDurationSeconds = duration;
        }
        if (album != null && !album.isBlank() && (currentAlbum == null || currentAlbum.isBlank())) {
            currentAlbum = album;
        }

        if (durationChanged && songStarted && !scrobbled && MalojaSettings.ENABLED.get()) {
            // Recompute the timer from the song start with the corrected duration, whether the
            // timer was skipped for an unknown duration or is still running with the old one.
            startTimer();
        }
    }

    public void onSetPlaybackState(PlaybackState state) {
        Utils.verifyOnMainThread();
        if (state == null) return;

        final boolean wasPlaying = isPlayerPlaying;
        isPlayerPlaying = state.getState() == PlaybackState.STATE_PLAYING;
        // The app repeats the playing state on buffering and position updates.
        if (wasPlaying == isPlayerPlaying) return;

        if (currentTitle == null || currentArtist == null) return;

        if (isPlayerPlaying) {
            if (!songStarted) {
                onSongStart();
            } else {
                onSongResume();
            }
        } else if (songStarted) {
            onSongPause();
        }
    }

    private void onSongStart() {
        final long now = System.currentTimeMillis();
        songStartedAtSeconds = now / 1000;
        songStarted = true;
        playedMillis = 0;
        playingSince = now;

        if (MalojaSettings.ENABLED.get()) {
            startTimer();
        }
    }

    private void onSongResume() {
        playingSince = System.currentTimeMillis();
        scheduleFromPlayedTime();
    }

    private void onSongPause() {
        cancelRunnable();
        if (playingSince != 0L) {
            playedMillis += System.currentTimeMillis() - playingSince;
            playingSince = 0L;
        }
    }

    private long currentPlayedMillis() {
        return playingSince == 0L ? playedMillis : playedMillis + System.currentTimeMillis() - playingSince;
    }

    /**
     * Decides how much of the song must play before it is scrobbled and (re)schedules the
     * scrobble accordingly. Safe to call again when the song length is corrected: only the
     * played time counts, so pauses never bring the scrobble forward.
     */
    private void startTimer() {
        cancelRunnable();

        final int minSongDuration = MalojaSettings.minSongDurationSeconds();
        if (currentDurationSeconds <= minSongDuration) {
            Logger.printDebug(() -> "Duration " + currentDurationSeconds
                    + "s <= minimum " + minSongDuration + "s, skipping scrobble");
            scrobbleAtPlayedMillis = -1;
            return;
        }

        final float delayPercent = MalojaSettings.delayPercent() / 100.0f;
        final long delayMillis = MalojaSettings.delaySeconds() * 1000L;
        final long thresholdMillis = (long) (currentDurationSeconds * 1000L * delayPercent);
        scrobbleAtPlayedMillis = Math.min(thresholdMillis, delayMillis);

        scheduleFromPlayedTime();
    }

    private void scheduleFromPlayedTime() {
        cancelRunnable();
        if (scrobbled || scrobbleAtPlayedMillis < 0 || !MalojaSettings.ENABLED.get()) return;

        final long remainingMillis = scrobbleAtPlayedMillis - currentPlayedMillis();
        if (remainingMillis <= 0) {
            scrobble();
        } else if (isPlayerPlaying) {
            scrobbleRunnable = () -> {
                scrobbleRunnable = null;
                scrobble();
            };
            handler.postDelayed(scrobbleRunnable, remainingMillis);
        }
    }

    private void stopTimer() {
        cancelRunnable();
        scrobbleAtPlayedMillis = -1;
        playedMillis = 0;
        playingSince = 0L;
    }

    private void cancelRunnable() {
        if (scrobbleRunnable != null) {
            handler.removeCallbacks(scrobbleRunnable);
            scrobbleRunnable = null;
        }
    }

    private void scrobble() {
        if (scrobbled) return;
        scrobbled = true;

        final String serverUrl = MalojaSettings.SERVER_URL.get();
        final String apiKey = MalojaSettings.API_KEY.get();
        final String artist = currentArtist;
        final String track = currentTitle;
        final String album = currentAlbum;
        final int duration = currentDurationSeconds;
        final long listenedAt = songStartedAtSeconds;

        executor.submit(() -> {
            try {
                if (Maloja.scrobble(serverUrl, apiKey, artist, track, album, duration, listenedAt)) {
                    Logger.printDebug(() -> "Scrobbled to Maloja: '" + track + "' by " + artist);
                }
            } catch (Exception ex) {
                Logger.printException(() -> "Maloja scrobble failure", ex);
            }
        });
    }
}

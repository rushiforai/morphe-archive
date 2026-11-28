/*
 * Personal use only. See the README for details.
 *
 * Based on the ScrobbleManager of the Morphe scrobbling patch (GPLv3).
 */

package app.big1mosha.selfhostscrobble.extension;

import android.media.MediaMetadata;
import android.media.session.PlaybackState;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.Pair;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Watches the media session and reports tracks to the configured server.
 *
 * <p>All methods must be called on the main thread.
 */
final class ScrobbleManager {
    private static final String TAG = "SelfHostScrobble";

    private static ScrobbleManager instance;

    static ScrobbleManager getInstance() {
        if (instance == null) {
            instance = new ScrobbleManager();
        }
        return instance;
    }

    private final Handler handler = new Handler(Looper.getMainLooper());
    private final ExecutorService executor = Executors.newSingleThreadExecutor();

    private String currentTitle;
    private String currentArtist;
    private String currentAlbum;
    private String currentSongId;
    private int currentDurationSeconds;

    private long songStartedAtSeconds;
    private boolean songStarted;
    private boolean isPlayerPlaying;

    private long scrobbleRemainingMillis;
    private long scrobbleTimerStartedAt;
    private boolean scrobbled;
    private Runnable scrobbleRunnable;

    private ScrobbleManager() {
    }

    void onSetMetadata(MediaMetadata metadata) {
        if (metadata == null || !Config.isConfigured()) {
            return;
        }

        try {
            String songId = metadata.getString(MediaMetadata.METADATA_KEY_MEDIA_ID);
            String album = cleanAlbum(metadata.getString(MediaMetadata.METADATA_KEY_ALBUM));
            String rawTitle = metadata.getString(MediaMetadata.METADATA_KEY_TITLE);
            String rawArtist = metadata.getString(MediaMetadata.METADATA_KEY_ARTIST);

            Pair<String, String> resolved = resolveTitleAndArtist(rawTitle, rawArtist);
            String title = resolved.first;
            String artist = resolved.second;
            int duration = (int) (metadata.getLong(MediaMetadata.METADATA_KEY_DURATION) / 1000);

            if (title == null || title.trim().isEmpty() || artist == null || artist.trim().isEmpty()) {
                return;
            }

            if (!title.equals(currentTitle) || !artist.equals(currentArtist)) {
                Log.d(TAG, "New track: " + title + " - " + artist);
                stopTimer();
                songStarted = false;
                scrobbled = false;

                currentTitle = title;
                currentArtist = artist;
                currentAlbum = album;
                currentSongId = songId;
                currentDurationSeconds = duration;

                if (isPlayerPlaying) {
                    onSongStart();
                }
            } else {
                boolean updated = false;

                if (duration > currentDurationSeconds) {
                    currentDurationSeconds = duration;
                    updated = true;
                }
                if (album != null && !album.trim().isEmpty()
                        && (currentAlbum == null || currentAlbum.trim().isEmpty())) {
                    currentAlbum = album;
                    updated = true;
                }
                if (songId != null && !songId.trim().isEmpty()
                        && (currentSongId == null || currentSongId.trim().isEmpty())) {
                    currentSongId = songId;
                    updated = true;
                }

                if (updated && songStarted && isPlayerPlaying) {
                    // Metadata arrived after playback started, so the timer may have been skipped.
                    if (!scrobbled && scrobbleRunnable == null && scrobbleTimerStartedAt == 0L) {
                        startTimer();
                    }
                    if (Config.NOW_PLAYING) {
                        ListenBrainzClient.nowPlaying(
                                currentArtist, currentTitle, currentAlbum,
                                currentSongId, currentDurationSeconds
                        );
                    }
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "onSetMetadata failed", t);
        }
    }

    void onSetPlaybackState(PlaybackState state) {
        if (state == null) {
            return;
        }

        isPlayerPlaying = state.getState() == PlaybackState.STATE_PLAYING;

        if (currentTitle == null || currentArtist == null) {
            return;
        }

        if (isPlayerPlaying) {
            if (!songStarted) {
                onSongStart();
            } else {
                onSongResume();
            }
        } else {
            onSongPause();
        }
    }

    private void onSongStart() {
        songStartedAtSeconds = System.currentTimeMillis() / 1000;
        songStarted = true;

        startTimer();

        if (Config.NOW_PLAYING) {
            ListenBrainzClient.nowPlaying(
                    currentArtist, currentTitle, currentAlbum,
                    currentSongId, currentDurationSeconds
            );
        }
    }

    private void onSongResume() {
        if (!scrobbled && scrobbleRemainingMillis > 0) {
            cancelRunnable();
            scrobbleTimerStartedAt = System.currentTimeMillis();
            scheduleScrobble(scrobbleRemainingMillis);
        }
    }

    private void onSongPause() {
        if (!songStarted) {
            return;
        }

        cancelRunnable();
        if (scrobbleTimerStartedAt != 0L) {
            long elapsed = System.currentTimeMillis() - scrobbleTimerStartedAt;
            scrobbleRemainingMillis = Math.max(0, scrobbleRemainingMillis - elapsed);
            scrobbleTimerStartedAt = 0L;
        }
    }

    private void startTimer() {
        cancelRunnable();

        if (currentDurationSeconds <= Config.MIN_SONG_DURATION_SECONDS) {
            Log.d(TAG, "Skipping short track (" + currentDurationSeconds + "s)");
            return;
        }

        long thresholdMillis = (long) (currentDurationSeconds * 1000L * (Config.DELAY_PERCENT / 100.0f));
        long totalDelayMillis = Math.min(thresholdMillis, Config.DELAY_SECONDS * 1000L);
        long elapsedMillis = Math.max(
                0,
                System.currentTimeMillis() - (songStartedAtSeconds * 1000L)
        );

        scrobbleRemainingMillis = totalDelayMillis - elapsedMillis;

        if (scrobbleRemainingMillis <= 0) {
            scrobble();
            return;
        }

        if (isPlayerPlaying) {
            scrobbleTimerStartedAt = System.currentTimeMillis();
            scheduleScrobble(scrobbleRemainingMillis);
        } else {
            scrobbleTimerStartedAt = 0L;
        }
    }

    private void stopTimer() {
        cancelRunnable();
        scrobbleRemainingMillis = 0L;
        scrobbleTimerStartedAt = 0L;
    }

    private void scheduleScrobble(long delayMillis) {
        scrobbleRunnable = () -> {
            scrobble();
            scrobbleRunnable = null;
        };
        handler.postDelayed(scrobbleRunnable, delayMillis);
    }

    private void cancelRunnable() {
        if (scrobbleRunnable != null) {
            handler.removeCallbacks(scrobbleRunnable);
            scrobbleRunnable = null;
        }
    }

    private void scrobble() {
        if (scrobbled) {
            return;
        }
        scrobbled = true;

        final String artist = currentArtist;
        final String title = currentTitle;
        final String album = currentAlbum;
        final String songId = currentSongId;
        final int duration = currentDurationSeconds;
        final long timestamp = songStartedAtSeconds;

        executor.submit(() -> ListenBrainzClient.scrobble(
                artist, title, album, songId, duration, timestamp
        ));
    }

    private String cleanTitle(String title) {
        if (title == null) {
            return null;
        }

        String clean = title;
        if (Config.CLEAN_METADATA) {
            clean = clean.replaceAll("(?i)\\s*[（(\\[](official\\s+)?(video|audio|music\\s+video|lyric\\s+video|visualizer)[）)\\]]", "");
            clean = clean.replaceAll("(?i)\\s*[（(\\[](\\d{4}\\s+)?remaster(ed)?(\\s+\\d{4})?[）)\\]]", "");
            clean = clean.replaceAll("(?i)\\s*[（(\\[]live(\\s+at\\s+.*|\\s+\\d{4})?[）)\\]]", "");
            clean = clean.replaceAll("(?i)\\s*[（(\\[](mono|stereo|hq|hd)[）)\\]]", "");
            clean = applyCustomRegex(clean);
        }
        return clean.replaceAll("\\s+", " ").trim();
    }

    private String cleanArtist(String artist) {
        if (artist == null) {
            return null;
        }

        String clean = artist;
        if (Config.CLEAN_METADATA) {
            clean = clean.replaceAll("(?i)\\s*-\\s*topic$", "");
            clean = applyCustomRegex(clean);
        }
        return clean.replaceAll("\\s+", " ").trim();
    }

    private String cleanAlbum(String album) {
        if (album == null) {
            return null;
        }

        String clean = album;
        if (Config.CLEAN_METADATA) {
            clean = clean.replaceAll("(?i)\\s*[（(\\[](\\d{4}\\s+)?remaster(ed)?(\\s+\\d{4})?[）)\\]]", "");
            clean = applyCustomRegex(clean);
        }
        return clean.replaceAll("\\s+", " ").trim();
    }

    private Pair<String, String> resolveTitleAndArtist(String rawTitle, String rawArtist) {
        String title = cleanTitle(rawTitle);
        String artist = cleanArtist(rawArtist);

        if (Config.PARSE_TITLE && rawTitle != null) {
            String separator = " - ";
            int separatorIndex = rawTitle.indexOf(separator);
            if (separatorIndex > 0 && separatorIndex < rawTitle.length() - separator.length()) {
                String parsedArtist = cleanArtist(rawTitle.substring(0, separatorIndex).trim());
                String parsedTrack = cleanTitle(rawTitle.substring(separatorIndex + separator.length()).trim());
                if (!parsedArtist.isEmpty() && !parsedTrack.isEmpty()) {
                    title = parsedTrack;
                    artist = parsedArtist;
                }
            }
        }

        return new Pair<>(title, artist);
    }

    private String applyCustomRegex(String input) {
        String regex = Config.CUSTOM_REGEX;
        if (regex.trim().isEmpty()) {
            return input;
        }

        try {
            return input.replaceAll(regex, "");
        } catch (Exception ex) {
            Log.w(TAG, "Invalid custom regex: " + regex, ex);
            return input;
        }
    }
}

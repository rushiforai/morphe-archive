package dev.ytmruskippper.skipper;

import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.widget.Toast;

import org.json.JSONException;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/**
 * Decides whether the current track is skipped, and feeds artist countries to {@link ArtistFlags}.
 * <p>
 * A track is evaluated once two callbacks agree on it: the notification track (title and artists)
 * and the player response (the video ID that is actually loaded). Title and list rules decide
 * immediately. The country rule looks the artists up on a background thread, and its results only
 * count within the lookup window that starts with the track. A skip waits for the skip delay, then
 * sends Next through the media session once it shows this track playing.
 * <p>
 * All state is confined to the main thread. The app calls in from other threads.
 */
public final class TrackSkipper {
    private static final String TAG = "YtmRuSkipper";
    private static final long SKIP_RETRY_MS = 200;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService LOOKUPS = Executors.newSingleThreadExecutor();
    private static final MusicBrainz MUSIC_BRAINZ = new MusicBrainz();
    private static final Runnable TRY_SKIP = TrackSkipper::trySkip;

    private static MediaSession session;
    /** Video ID from the latest player response. */
    private static String loadedVideoId;
    /** Latest notification track. Evaluated once its video ID matches {@link #loadedVideoId}. */
    private static NotificationTrack current;

    /**
     * Identifies the evaluation of {@link #current}. Results of a lookup started for an older
     * evaluation are ignored. Null when the track has not been evaluated yet.
     */
    private static Object evaluationToken;
    private static Future<?> lookup;
    /** Country results after this time no longer skip the track. */
    private static long lookupDeadline;

    /** Why the track is skipped, or null when it is kept. */
    private static String skipReason;
    private static long skipAt;
    private static boolean sentNext;

    private TrackSkipper() {}

    // region Callbacks from the app hooks.

    public static void onPlayerResponse(String videoId) {
        onMain(() -> {
            if (!Objects.equals(loadedVideoId, videoId)) {
                loadedVideoId = videoId;
                cancelEvaluation();
            }
            evaluateIfReady();
        });
    }

    public static void onNotificationTrack(Object model, CharSequence title, CharSequence credit) {
        final NotificationTrack track;
        try {
            track = NotificationTrack.read(model, title, credit);
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w(TAG, "Could not read notification track", error);
            return;
        }
        if (track.videoId == null || track.videoId.isEmpty() || track.title.trim().isEmpty()) return;

        onMain(() -> {
            // The notification updates several times per track, so only a change starts over.
            boolean newTrack = current == null || !track.videoId.equals(current.videoId);
            boolean newMetadata = newTrack || !track.title.equals(current.title)
                    || !track.artistNames().equals(current.artistNames());
            if (newMetadata) {
                current = track;
                cancelEvaluation();
            }
            if (newTrack) {
                sentNext = false;
                lookupDeadline = SystemClock.elapsedRealtime() + SkipperSettings.lookupWindowMs();
            }
            evaluateIfReady();
        });
    }

    public static void onSessionMetadata(MediaSession newSession, MediaMetadata metadata) {
        onMain(() -> {
            session = newSession;
            if (metadata == null) {
                // Playback stopped.
                current = null;
                loadedVideoId = null;
                cancelEvaluation();
                ArtistFlags.onTrack(null);
                return;
            }
            evaluateIfReady();
        });
    }

    /** Applies changed settings to the current track, with a fresh lookup window. */
    static void onSettingsChanged() {
        onMain(() -> {
            cancelEvaluation();
            if (current != null) lookupDeadline = SystemClock.elapsedRealtime() + SkipperSettings.lookupWindowMs();
            ArtistFlags.render();
            evaluateIfReady();
        });
    }

    // endregion

    private static void evaluateIfReady() {
        boolean confirmed = current != null && current.videoId.equals(loadedVideoId);
        ArtistFlags.onTrack(confirmed ? current : null);
        if (!confirmed || sentNext) return;
        if (skipReason != null) {
            trySkip();
            return;
        }
        if (evaluationToken != null || lookupExpired()) return;

        NotificationTrack track = current;
        List<String> artists = track.artistNames();
        Object token = new Object();
        evaluationToken = token;

        SkipRules.Decision decision = SkipperSettings.skipEnabled()
                ? SkipRules.evaluate(track.title, artists) : SkipRules.Decision.KEEP;
        if (decision == SkipRules.Decision.RUSSIAN_TITLE) requestSkip("Russian title");
        if (decision == SkipRules.Decision.BLOCKED_ARTIST) requestSkip("always-skip list");

        // Flags need the countries even when a rule already decided.
        boolean showFlags = SkipperSettings.flagsEnabled();
        boolean skipByCountry = decision == SkipRules.Decision.LOOK_UP_ARTISTS;
        if (!sentNext && !artists.isEmpty() && (showFlags || skipByCountry)) {
            Set<String> blockedCountries = skipByCountry ? SkipperSettings.blockedCountries() : Collections.<String>emptySet();
            long deadline = lookupDeadline;
            lookup = LOOKUPS.submit(() ->
                    lookUpArtists(track, artists, token, deadline, showFlags, blockedCountries));
        }
    }

    /** Runs on the lookup thread. Stops at the first blocked artist. */
    private static void lookUpArtists(NotificationTrack track, List<String> artists, Object token,
                                      long deadline, boolean showFlags, Set<String> blockedCountries) {
        for (String artist : artists) {
            try {
                if (Thread.currentThread().isInterrupted()) return;
                String country = MUSIC_BRAINZ.artistCountry(artist, deadline);
                boolean blocked = SkipRules.isBlockedCountry(country, blockedCountries);
                if (!showFlags && !blocked) continue;

                MAIN.post(() -> {
                    boolean stale = evaluationToken != token || current != track
                            || !track.videoId.equals(loadedVideoId) || lookupExpired();
                    if (stale) return;
                    if (showFlags) ArtistFlags.onCountry(track, artist, country);
                    if (blocked) requestSkip(artist + " is from " + country);
                });
                if (blocked) return;
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
                return;
            } catch (IOException | JSONException error) {
                if (Thread.currentThread().isInterrupted()) return;
                Log.d(TAG, "MusicBrainz lookup unavailable", error);
            }
        }
    }

    private static void requestSkip(String reason) {
        skipReason = reason;
        skipAt = SystemClock.elapsedRealtime() + SkipperSettings.skipDelayMs();
        trySkip();
    }

    /**
     * Sends Next once the skip delay has passed and the media session shows this track playing.
     * Until then it retries, for example while playback is paused or the session lags behind.
     */
    private static void trySkip() {
        MAIN.removeCallbacks(TRY_SKIP);
        if (!SkipperSettings.skipEnabled() || sentNext || skipReason == null
                || current == null || !current.videoId.equals(loadedVideoId)) return;

        long wait = skipAt - SystemClock.elapsedRealtime();
        if (wait > 0) {
            MAIN.postDelayed(TRY_SKIP, wait);
            return;
        }
        try {
            MediaController controller = session != null && session.isActive() ? session.getController() : null;
            if (controller != null && isPlayingCurrentTrack(controller)) {
                sentNext = true;
                controller.getTransportControls().skipToNext();
                Log.i(TAG, "Sent Next for " + current.videoId + " (" + skipReason + ")");
                showToast(current.title, skipReason);
                return;
            }
            MAIN.postDelayed(TRY_SKIP, SKIP_RETRY_MS);
        } catch (RuntimeException error) {
            Log.w(TAG, "Could not invoke the media session's Next action", error);
        }
    }

    private static boolean isPlayingCurrentTrack(MediaController controller) {
        PlaybackState playback = controller.getPlaybackState();
        MediaMetadata metadata = controller.getMetadata();
        return playback != null
                && playback.getState() == PlaybackState.STATE_PLAYING
                && (playback.getActions() & PlaybackState.ACTION_SKIP_TO_NEXT) != 0
                && metadata != null
                && current.title.equals(metadata.getString(MediaMetadata.METADATA_KEY_TITLE));
    }

    private static void showToast(String title, String reason) {
        if (!SkipperSettings.toastEnabled() || SkipperSettings.context() == null) return;
        try {
            Toast.makeText(SkipperSettings.context(), "Skipped " + title + " (" + reason + ")",
                    Toast.LENGTH_SHORT).show();
        } catch (RuntimeException error) {
            Log.w(TAG, "Could not show the skip toast", error);
        }
    }

    private static boolean lookupExpired() {
        return SystemClock.elapsedRealtime() >= lookupDeadline;
    }

    private static void cancelEvaluation() {
        if (lookup != null) lookup.cancel(true);
        lookup = null;
        MAIN.removeCallbacks(TRY_SKIP);
        evaluationToken = null;
        skipReason = null;
    }

    private static void onMain(Runnable callback) {
        if (Looper.myLooper() == Looper.getMainLooper()) callback.run();
        else MAIN.post(callback);
    }
}

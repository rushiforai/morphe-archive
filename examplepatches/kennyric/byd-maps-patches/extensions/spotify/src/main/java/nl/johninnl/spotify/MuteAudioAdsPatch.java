package nl.johninnl.spotify;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.media.AudioManager;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;

import java.util.Locale;

import nl.johninnl.spotify.shared.Logger;

/**
 * Skips an audio ad when Spotify's player allows it, and mutes the stream only when the ad cannot
 * be skipped.
 * <p>
 * The media-session transport controls are the same route a car head unit uses for its next
 * button; Spotify's ad restrictions decide whether the command is accepted. A short fallback
 * timer mutes the stream if the ad is still current after the skip request.
 */
@SuppressWarnings("unused")
public final class MuteAudioAdsPatch {
    private static final String ACTION_METADATA_CHANGED = "com.spotify.music.metadatachanged";
    private static final String ACTION_PLAYBACK_STATE_CHANGED = "com.spotify.music.playbackstatechanged";

    private static final String[] AD_ID_MARKERS = {"spotify:ad", "spotifyad:", ":ad:", "/ad/", "audio-ad", "video-ad"};
    private static final String[] AD_TITLES = {"Advertisement", "Werbung", "Publicité", "Anuncio", "Advertentie", "Reklama"};

    private static volatile MuteAudioAdsPatch instance;

    private final AudioManager audioManager;
    private final Handler handler = new Handler(Looper.getMainLooper());

    private volatile boolean isAdPlaying;
    private volatile boolean isMuted;
    private volatile String currentAdId;
    private volatile String skippedAdId;
    private volatile long currentAdDurationMs;
    private volatile MediaSession currentSession;
    private volatile boolean wasMutedByUser;
    private volatile int volumeBeforeAd = -1;

    /** Wait before falling back to muting, so the player can answer the skip request first. */
    private static final long SKIP_FALLBACK_MS = 900;

    private MuteAudioAdsPatch(Context context) {
        audioManager = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
    }

    /**
     * Starts listening for Spotify media broadcasts. Safe to call multiple times.
     */
    public static void initialize(Context context) {
        if (instance != null) return;
        synchronized (MuteAudioAdsPatch.class) {
            if (instance != null) return;
            Context appContext = context.getApplicationContext() != null ? context.getApplicationContext() : context;
            instance = new MuteAudioAdsPatch(appContext);
            instance.registerReceiver(appContext);
        }
    }

    private static MuteAudioAdsPatch getInstance() {
        if (instance == null) {
            Application application = currentApplication();
            if (application != null) initialize(application);
        }
        return instance;
    }

    @SuppressLint("PrivateApi")
    private static Application currentApplication() {
        try {
            return (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable ex) {
            Logger.error("currentApplication failure", ex);
            return null;
        }
    }

    /**
     * Injection point: replaces calls to {@link MediaSession#setMetadata(MediaMetadata)}.
     */
    public static void setMetadata(MediaSession session, MediaMetadata metadata) {
        session.setMetadata(metadata);
        onMetadataChanged(metadata, session);
    }

    public static void onMetadataChanged(MediaMetadata metadata) {
        onMetadataChanged(metadata, null);
    }

    public static void onMetadataChanged(MediaMetadata metadata, MediaSession session) {
        if (metadata == null) return;
        try {
            MuteAudioAdsPatch muter = getInstance();
            if (muter == null) return;

            String id = metadata.getString(MediaMetadata.METADATA_KEY_MEDIA_ID);
            if (id == null) id = metadata.getString(MediaMetadata.METADATA_KEY_MEDIA_URI);
            muter.onTrackChanged(
                    id,
                    metadata.getString(MediaMetadata.METADATA_KEY_TITLE),
                    metadata.getString(MediaMetadata.METADATA_KEY_ARTIST),
                    metadata.getLong(MediaMetadata.METADATA_KEY_DURATION),
                    session
            );
        } catch (Throwable ex) {
            Logger.error("onMetadataChanged failure", ex);
        }
    }

    static boolean isAd(String id, String title, String artist, long durationMs) {
        String lowerId = id == null ? "" : id.toLowerCase(Locale.ROOT);
        for (String marker : AD_ID_MARKERS) {
            if (lowerId.contains(marker)) return true;
        }

        String trimmedTitle = title == null ? "" : title.trim();
        for (String adTitle : AD_TITLES) {
            if (trimmedTitle.equalsIgnoreCase(adTitle)) return true;
        }

        // Short items "by Spotify" without a real title are ads as well.
        String trimmedArtist = artist == null ? "" : artist.trim();
        return trimmedArtist.equalsIgnoreCase("Spotify")
                && durationMs >= 1000 && durationMs <= 45000
                && (trimmedTitle.isEmpty() || trimmedTitle.equalsIgnoreCase("Spotify"));
    }

    private void onTrackChanged(String id, String title, String artist, long durationMs, MediaSession session) {
        boolean ad = isAd(id, title, artist, durationMs);
        isAdPlaying = ad;
        if (!ad) {
            currentAdId = null;
            skippedAdId = null;
            handler.post(this::unmute);
            return;
        }

        currentAdId = id == null ? "" : id;
        currentAdDurationMs = durationMs;
        currentSession = session;
        handler.post(() -> onAdStarted(session));
    }

    private void onAdStarted(MediaSession session) {
        if (!isAdPlaying) return;
        String adId = currentAdId;
        if (adId != null && !adId.equals(skippedAdId) && skipAd(session)) {
            skippedAdId = adId;
            handler.postDelayed(this::muteIfStillSkippable, SKIP_FALLBACK_MS);
            return;
        }
        if (adId != null && adId.equals(skippedAdId)) {
            // A repeated metadata update for the same ad; the fallback timer owns the decision.
            return;
        }
        mute();
    }

    /**
     * Uses Spotify's own media-session next command. A car head unit's Skip button takes this
     * route, so an ad that the player permits to be skipped ends immediately instead of being
     * muted for its full duration.
     */
    private boolean skipAd(MediaSession session) {
        if (session == null) return false;
        try {
            MediaController controller = session.getController();
            if (controller == null || controller.getTransportControls() == null) return false;
            controller.getTransportControls().skipToNext();
            Logger.info("Requested skip for audio ad");
            return true;
        } catch (Throwable ex) {
            Logger.error("ad skip request failure", ex);
            return false;
        }
    }

    private void muteIfStillSkippable() {
        if (!isAdPlaying) {
            unmute();
            return;
        }
        if (currentAdId != null && currentAdId.equals(skippedAdId) && seekPastAd()) {
            handler.postDelayed(this::muteIfAdSurvived, SKIP_FALLBACK_MS);
            return;
        }
        if (currentAdId != null && currentAdId.equals(skippedAdId)) {
            mute();
        }
    }

    /**
     * Second chance when the player refused the skip: jump to the end of the ad. If seeking is
     * allowed, this leaves the ad with zero remaining playback instead of muting it.
     */
    private boolean seekPastAd() {
        MediaSession session = currentSession;
        long durationMs = currentAdDurationMs;
        if (session == null || durationMs <= 0) return false;
        try {
            MediaController controller = session.getController();
            if (controller == null || controller.getTransportControls() == null) return false;
            controller.getTransportControls().seekTo(durationMs);
            Logger.info("Seeked to the end of the audio ad");
            return true;
        } catch (Throwable ex) {
            Logger.error("ad seek request failure", ex);
            return false;
        }
    }

    private void muteIfAdSurvived() {
        if (isAdPlaying && currentAdId != null && currentAdId.equals(skippedAdId)) {
            Logger.info("Ad still playing after skip and seek; muting");
            mute();
        }
    }

    private void mute() {
        if (isMuted) return;

        try {
            wasMutedByUser = audioManager.isStreamMute(AudioManager.STREAM_MUSIC);
        } catch (Throwable ex) {
            wasMutedByUser = false;
        }
        volumeBeforeAd = audioManager.getStreamVolume(AudioManager.STREAM_MUSIC);

        if (!wasMutedByUser && volumeBeforeAd != 0) {
            try {
                audioManager.adjustStreamVolume(AudioManager.STREAM_MUSIC, AudioManager.ADJUST_MUTE, 0);
                Logger.info("Muted audio ad");
            } catch (Throwable ex) {
                Logger.error("mute failure", ex);
            }
        }
        isMuted = true;
    }

    private void unmute() {
        if (!isMuted) return;
        isMuted = false;
        if (wasMutedByUser) return;

        try {
            audioManager.adjustStreamVolume(AudioManager.STREAM_MUSIC, AudioManager.ADJUST_UNMUTE, 0);
            if (volumeBeforeAd > 0 && audioManager.getStreamVolume(AudioManager.STREAM_MUSIC) == 0) {
                audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, volumeBeforeAd, 0);
            }
            Logger.info("Unmuted after ad");
        } catch (Throwable ex) {
            Logger.error("unmute failure", ex);
        }
    }

    @SuppressLint({"UnspecifiedRegisterReceiverFlag", "WrongConstant"})
    private void registerReceiver(Context context) {
        try {
            IntentFilter filter = new IntentFilter();
            filter.addAction(ACTION_METADATA_CHANGED);
            filter.addAction(ACTION_PLAYBACK_STATE_CHANGED);

            BroadcastReceiver receiver = new BroadcastReceiver() {
                @Override
                public void onReceive(Context context, Intent intent) {
                    String action = intent.getAction();
                    if (ACTION_METADATA_CHANGED.equals(action)) {
                        onTrackChanged(
                                intent.getStringExtra("id"),
                                intent.getStringExtra("track"),
                                intent.getStringExtra("artist"),
                                intent.getIntExtra("length", -1),
                                null
                        );
                    } else if (ACTION_PLAYBACK_STATE_CHANGED.equals(action)
                            && !intent.getBooleanExtra("playing", true)
                            && !isAdPlaying) {
                        handler.post(MuteAudioAdsPatch.this::unmute);
                    }
                }
            };

            if (Build.VERSION.SDK_INT >= 33) {
                // Spotify sends these broadcasts itself, so they must be exported.
                context.registerReceiver(receiver, filter, Context.RECEIVER_EXPORTED);
            } else {
                context.registerReceiver(receiver, filter);
            }
        } catch (Throwable ex) {
            Logger.error("registerReceiver failure", ex);
        }
    }
}

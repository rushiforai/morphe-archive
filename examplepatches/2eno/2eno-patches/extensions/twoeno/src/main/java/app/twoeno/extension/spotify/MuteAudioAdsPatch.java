package app.twoeno.extension.spotify;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.media.AudioManager;
import android.media.MediaMetadata;
import android.media.session.MediaSession;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;

import java.util.Locale;

import app.twoeno.extension.shared.Logger;

/**
 * Mutes the music stream while Spotify plays an audio ad and restores it afterwards.
 * <p>
 * Ads are detected from the media session metadata and, as a fallback,
 * from the "device broadcast status" intents Spotify sends.
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
    private volatile boolean wasMutedByUser;
    private volatile int volumeBeforeAd = -1;

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
        onMetadataChanged(metadata);
    }

    public static void onMetadataChanged(MediaMetadata metadata) {
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
                    metadata.getLong(MediaMetadata.METADATA_KEY_DURATION)
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

    private void onTrackChanged(String id, String title, String artist, long durationMs) {
        isAdPlaying = isAd(id, title, artist, durationMs);
        handler.post(isAdPlaying ? this::mute : this::unmute);
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
                                intent.getIntExtra("length", -1)
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

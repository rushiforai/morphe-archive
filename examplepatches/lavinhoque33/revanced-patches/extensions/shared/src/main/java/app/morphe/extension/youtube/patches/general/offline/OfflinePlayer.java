/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-05.
 * Written by lavinhoque33, 2026-10-10.
 * Modified by lavinhoque33, 2026-10-24.
 */

package app.morphe.extension.youtube.patches.general.offline;

import android.annotation.SuppressLint;
import android.app.Notification;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.AudioAttributes;
import android.media.AudioFocusRequest;
import android.media.AudioManager;
import android.media.MediaMetadata;
import android.media.MediaPlayer;
import android.media.PlaybackParams;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Surface;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.sponsorblock.objects.SegmentCategory;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.VideoInformation;

/**
 * Process-wide offline player. It outlives the player screen, which only attaches and detaches
 * its surface, so audio keeps playing in the background and with the screen off.
 * <p>
 * All methods must be called on the main thread.
 */
@SuppressLint("NewApi")
public final class OfflinePlayer {
    private static final long SEEK_STEP_MS = 10_000;
    private static final long POSITION_SAVE_INTERVAL_MS = 5_000;
    /** Resume positions this close to the end restart the video instead. */
    private static final long RESUME_END_MARGIN_MS = 5_000;
    private static final float DUCK_VOLUME = 0.2f;

    /** Notified of every state change, on the main thread. */
    interface Listener {
        void onPlayerStateChanged();
    }

    private static final Handler handler = new Handler(Looper.getMainLooper());
    private static final CopyOnWriteArrayList<Listener> listeners = new CopyOnWriteArrayList<>();

    @Nullable
    private static MediaPlayer player;
    @Nullable
    private static MediaSession session;
    @Nullable
    private static OfflineVideo current;
    @Nullable
    private static Bitmap artwork;
    @Nullable
    private static Surface surface;
    private static final List<String> queue = new ArrayList<>();

    private static boolean prepared;
    private static boolean playWhenPrepared;
    private static boolean resumeOnFocusGain;
    private static boolean noisyReceiverRegistered;
    private static float speed = 1.0f;
    private static int videoWidth;
    private static int videoHeight;
    @Nullable
    private static AudioFocusRequest focusRequest;
    private static final Set<OfflineSponsorSegments.Segment> skippedOnce = new HashSet<>();
    private static OfflineSponsorSegments.Segment manualSegment;
    private static long lastSponsorSkip;
    private static final java.util.function.Function<String, String> sponsorBehavior = OfflineSponsorBlock::behavior;

    private static final Runnable sponsorTicker = new Runnable() {
        @Override
        public void run() {
            if (!isPlaying()) return;
            OfflineVideo video = current;
            if (video == null || video.sponsorSegments.isEmpty()) return;
            long position = getPosition();
            boolean valid = Settings.SB_ENABLED.get()
                    && OfflineSponsorSegments.durationMatches(video.sponsorDurationMs, getDuration());
            OfflineSponsorSegments.Segment automatic = valid ? OfflineSponsorSegments.at(video.sponsorSegments,
                    video.sponsorCategories, position, true, skippedOnce, sponsorBehavior) : null;
            if (automatic != null && OfflineSponsorSegments.skipTarget(automatic, position,
                    video.sponsorDurationMs, getDuration()) >= 0
                    && OfflineSponsorSegments.canRepeat(SystemClock.elapsedRealtime(), lastSponsorSkip)) {
                skipSponsor(automatic);
            }
            OfflineSponsorSegments.Segment manual = valid ? OfflineSponsorSegments.at(video.sponsorSegments,
                    video.sponsorCategories, getPosition(), false, skippedOnce, sponsorBehavior) : null;
            if (manual != manualSegment) {
                manualSegment = manual;
                notifyListeners();
            }
            handler.removeCallbacks(this);
            handler.postDelayed(this, OfflineSponsorSegments.nextDelay(video.sponsorSegments, getPosition(), speed));
        }
    };

    static String manualSponsorText() {
        if (manualSegment == null || getPosition() < manualSegment.startMs()
                || getPosition() >= manualSegment.endMs()) return "";
        SegmentCategory category = SegmentCategory.byCategoryKey(manualSegment.category());
        return category == null ? "" : category.skipButtonTextMiddle.toString();
    }

    static void skipManualSponsor() {
        if (!manualSponsorText().isEmpty()) skipSponsor(manualSegment);
    }

    private static void skipSponsor(OfflineSponsorSegments.Segment segment) {
        long position = getPosition();
        OfflineVideo video = current;
        if (video == null) return;
        long target = OfflineSponsorSegments.skipTarget(segment, position, video.sponsorDurationMs, getDuration());
        if (target < 0) return;
        skippedOnce.add(segment);
        lastSponsorSkip = SystemClock.elapsedRealtime();
        manualSegment = null;
        seekTo(target);
        SegmentCategory category = SegmentCategory.byCategoryKey(segment.category());
        if (category != null && Settings.SB_TOAST_ON_SKIP.get()) {
            long duration = getDuration();
            Utils.showToastShort((position < duration / 4 ? category.skippedToastBeginning
                    : position > duration * 3 / 4 ? category.skippedToastEnd : category.skippedToastMiddle).toString());
        }
    }

    private OfflinePlayer() {
    }

    // region public state

    static void addListener(Listener listener) {
        listeners.addIfAbsent(listener);
    }

    static void removeListener(Listener listener) {
        listeners.remove(listener);
    }

    private static void notifyListeners() {
        for (Listener listener : listeners) listener.onPlayerStateChanged();
    }

    static boolean isSessionActive() {
        return current != null && player != null;
    }

    static boolean isPlaying() {
        try {
            return player != null && prepared && player.isPlaying();
        } catch (IllegalStateException ex) {
            return false;
        }
    }

    static boolean isPrepared() {
        return prepared;
    }

    @Nullable
    static OfflineVideo getCurrent() {
        return current;
    }

    /** The thumbnail of the current entry, which the player screen shows for audio. */
    @Nullable
    static Bitmap getArtwork() {
        return artwork;
    }

    static long getPosition() {
        try {
            return player != null && prepared ? player.getCurrentPosition() : 0;
        } catch (IllegalStateException ex) {
            return 0;
        }
    }

    static long getDuration() {
        try {
            if (player != null && prepared) return player.getDuration();
        } catch (IllegalStateException ignored) {
        }
        return current != null ? current.lengthMs : 0;
    }

    static float getSpeed() {
        return speed;
    }

    static int getVideoWidth() {
        return videoWidth;
    }

    static int getVideoHeight() {
        return videoHeight;
    }

    static boolean hasPrevious() {
        return current != null && queue.indexOf(current.key()) > 0;
    }

    static boolean hasNext() {
        if (current == null) return false;
        int index = queue.indexOf(current.key());
        return index >= 0 && index < queue.size() - 1;
    }

    // endregion

    // region playback control

    /**
     * Starts playing a video, or keeps playing it if it is already the current one.
     *
     * @param order The entry keys of the library in display order, for previous and next.
     */
    static void play(OfflineVideo video, List<String> order) {
        queue.clear();
        queue.addAll(order);
        if (!queue.contains(video.key())) queue.add(video.key());

        if (current != null && current.key().equals(video.key()) && player != null) {
            if (!isPlaying()) resume();
            return;
        }
        open(video, true);
    }

    private static void open(OfflineVideo video, boolean autoPlay) {
        savePosition();
        releasePlayer();
        Context context = Utils.getContext();
        current = video;
        skippedOnce.clear();
        manualSegment = null;
        lastSponsorSkip = 0;
        if (!video.audioOnly && OfflineFormats.CODEC_AV1.equals(video.codec)) {
            java.util.regex.Matcher quality = java.util.regex.Pattern.compile("^(\\d+)p(\\d+)?").matcher(video.qualityLabel);
            if (quality.find() && !OfflineFormats.canDecodeAv1(0, Integer.parseInt(quality.group(1)),
                    quality.group(2) != null ? Integer.parseInt(quality.group(2)) : 30, "video/mp4; codecs=\"av01.0.08m.08\"")) {
                Utils.showToastLong(app.morphe.extension.shared.utils.StringRef.str("revanced_offline_av1_unplayable_toast"));
            }
        }
        artwork = video.thumbnailPath.isEmpty() ? null : BitmapFactory.decodeFile(video.thumbnailPath);
        prepared = false;
        playWhenPrepared = autoPlay;
        videoWidth = 0;
        videoHeight = 0;

        MediaPlayer mediaPlayer = new MediaPlayer();
        player = mediaPlayer;
        mediaPlayer.setAudioAttributes(new AudioAttributes.Builder()
                .setUsage(AudioAttributes.USAGE_MEDIA)
                .setContentType(video.audioOnly
                        ? AudioAttributes.CONTENT_TYPE_MUSIC
                        : AudioAttributes.CONTENT_TYPE_MOVIE)
                .build());
        mediaPlayer.setWakeMode(context, android.os.PowerManager.PARTIAL_WAKE_LOCK);
        mediaPlayer.setOnPreparedListener(mp -> {
            if (mp != player) return;
            prepared = true;
            long resume = video.lastPositionMs;
            if (resume > 0 && resume < mp.getDuration() - RESUME_END_MARGIN_MS) {
                mp.seekTo((int) resume);
            }
            applySpeed();
            Logger.printInfo(() -> "Prepared " + video.key() + " (" + mp.getDuration() + " ms), resume at " + resume);
            if (playWhenPrepared) resume();
            else onStateChanged();
        });
        mediaPlayer.setOnVideoSizeChangedListener((mp, width, height) -> {
            videoWidth = width;
            videoHeight = height;
            notifyListeners();
        });
        mediaPlayer.setOnSeekCompleteListener(mp -> {
            if (mp == player) notifyListeners();
        });
        mediaPlayer.setOnCompletionListener(mp -> {
            if (mp != player) return;
            Logger.printInfo(() -> "Completed " + video.key());
            OfflineIndex.savePosition(video.key(), 0);
            video.lastPositionMs = 0;
            if (hasNext()) {
                skip(1);
            } else {
                abandonFocus();
                onStateChanged();
            }
        });
        mediaPlayer.setOnErrorListener((mp, what, extra) -> {
            Logger.printException(() -> "Playback error " + what + "/" + extra + " for " + video.key());
            Utils.showToastShort(app.morphe.extension.shared.utils.StringRef.str("revanced_offline_playback_error"));
            close();
            return true;
        });

        try {
            mediaPlayer.setDataSource(context, Uri.parse(video.contentUri));
            if (surface != null && surface.isValid()) mediaPlayer.setSurface(surface);
            mediaPlayer.prepareAsync();
        } catch (Exception ex) {
            Logger.printException(() -> "Could not open " + video.contentUri, ex);
            Utils.showToastShort(app.morphe.extension.shared.utils.StringRef.str("revanced_offline_playback_error"));
            close();
            return;
        }
        ensureSession().setActive(true);
        updateMetadata();
        onStateChanged();
    }

    static void resume() {
        MediaPlayer mediaPlayer = player;
        if (mediaPlayer == null) return;
        if (!prepared) {
            playWhenPrepared = true;
            return;
        }
        resumeOnFocusGain = false;
        if (!requestFocus()) {
            Logger.printInfo(() -> "Audio focus denied, not resuming");
            return;
        }
        pauseMainPlayer();
        try {
            mediaPlayer.start();
        } catch (IllegalStateException ex) {
            Logger.printException(() -> "Could not start playback", ex);
            return;
        }
        registerNoisyReceiver();
        OfflineServiceHooks.startPlaybackForeground();
        // YouTube's own player pauses shortly after losing audio focus, and may take the
        // notification of a shared service instance with it.
        handler.postDelayed(OfflineServiceHooks::ensurePlaybackNotification, 1_000);
        onStateChanged();
    }

    static void pause() {
        resumeOnFocusGain = false;
        pausePlayback(true);
    }

    /**
     * Pauses without giving up the audio focus, so the matching gain resumes playback.
     */
    private static void pauseOnFocusLoss() {
        // A second transient loss must not forget the resume that the first one waits for.
        boolean wasPlaying = isPlaying() || resumeOnFocusGain;

        pausePlayback(false);
        resumeOnFocusGain = wasPlaying;
    }

    /**
     * @param abandonFocus whether to give up the focus, letting other apps play.
     *                     Only the transient focus loss keeps it, to resume on the matching gain.
     */
    private static void pausePlayback(boolean abandonFocus) {
        playWhenPrepared = false;
        MediaPlayer mediaPlayer = player;
        if (mediaPlayer != null && prepared) {
            try {
                if (mediaPlayer.isPlaying()) mediaPlayer.pause();
            } catch (IllegalStateException ignored) {
            }
        }
        unregisterNoisyReceiver();
        savePosition();
        if (abandonFocus) abandonFocus();
        onStateChanged();
    }

    static void togglePlayPause() {
        if (isPlaying()) pause();
        else resume();
    }

    static void seekTo(long positionMs) {
        MediaPlayer mediaPlayer = player;
        if (mediaPlayer == null || !prepared) return;
        long target = Math.max(0, Math.min(positionMs, getDuration()));
        // The default mode snaps to the previous sync frame, which can be seconds away.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            mediaPlayer.seekTo(target, MediaPlayer.SEEK_CLOSEST);
        } else {
            mediaPlayer.seekTo((int) target);
        }
        onStateChanged();
    }

    static void seekBy(long deltaMs) {
        seekTo(getPosition() + deltaMs);
    }

    static void seekForward() {
        seekBy(SEEK_STEP_MS);
    }

    static void seekBackward() {
        seekBy(-SEEK_STEP_MS);
    }

    static void setSpeed(float newSpeed) {
        speed = newSpeed;
        applySpeed();
        onStateChanged();
    }

    private static void applySpeed() {
        MediaPlayer mediaPlayer = player;
        if (mediaPlayer == null || !prepared) return;
        try {
            final boolean wasPlaying = mediaPlayer.isPlaying();
            PlaybackParams params = mediaPlayer.getPlaybackParams().setSpeed(speed);
            mediaPlayer.setPlaybackParams(params);
            // Setting the params of a paused player starts it.
            if (!wasPlaying && mediaPlayer.isPlaying()) mediaPlayer.pause();
        } catch (Exception ex) {
            Logger.printException(() -> "Could not set the speed to " + speed, ex);
        }
    }

    /** Moves through the library order. With a direction of -1 a played-in video restarts first. */
    static void skip(int direction) {
        if (current == null) return;
        if (direction < 0 && getPosition() > 3000) {
            seekTo(0);
            return;
        }
        int index = queue.indexOf(current.key()) + direction;
        while (index >= 0 && index < queue.size()) {
            OfflineVideo next = OfflineIndex.get(queue.get(index));
            if (next != null) {
                open(next, true);
                return;
            }
            index += direction;
        }
    }

    /** Ends the session: stops playback, the notification and the foreground service. */
    static void close() {
        Logger.printInfo(() -> "Closing offline playback");
        savePosition();
        releasePlayer();
        current = null;
        artwork = null;
        abandonFocus();
        if (session != null) {
            session.setActive(false);
            session.release();
            session = null;
        }
        OfflineServiceHooks.stopPlaybackForeground();
        notifyListeners();
    }

    /** Ends the session if it plays the given entry, which is about to be deleted. */
    static void closeIfPlaying(String key) {
        if (current != null && current.key().equals(key)) close();
    }

    private static void releasePlayer() {
        MediaPlayer mediaPlayer = player;
        player = null;
        prepared = false;
        unregisterNoisyReceiver();
        handler.removeCallbacks(positionSaver);
        handler.removeCallbacks(sponsorTicker);
        manualSegment = null;
        if (mediaPlayer != null) {
            try {
                mediaPlayer.reset();
            } catch (Exception ignored) {
            }
            mediaPlayer.release();
        }
    }

    // endregion

    // region main player coordination

    /**
     * Injection point, called before the main player applies a play-when-ready value.
     * <p>
     * YouTube's player is built without audio focus handling, so the app never receives a focus
     * loss when a video starts and the focus listener above cannot stop the overlap. The two
     * directions are therefore explicit: this hook pauses the offline player when the main player
     * starts, and {@link #resume()} pauses the main player.
     *
     * @return the given value unchanged, the main player keeps its own state.
     */
    public static boolean onMainPlayerPlayWhenReady(Object player, boolean playing) {
        // setPlayWhenReady can run off the main thread, and everything here is main thread only.
        if (playing && VideoInformation.isCurrentPlayer(player)) {
            Utils.runOnMainThreadNowOrLater(() -> pauseForMainPlayer(player));
        }
        return playing;
    }

    private static void pauseForMainPlayer(Object player) {
        if (!VideoInformation.isCurrentPlayer(player) || !isPlaying() || isQuietPlayback()) return;

        Logger.printInfo(() -> "Main player started, pausing offline playback");
        pause();
    }

    /** Pauses the main player, which otherwise plays over the offline track. */
    private static void pauseMainPlayer() {
        if (!VideoInformation.isPlayerPlaying() || isQuietPlayback()) return;

        Logger.printInfo(() -> "Offline playback started, pausing the main player");
        VideoInformation.setPlayerPlaying(false);
    }

    /**
     * Feed previews have no sound, so they do not stop the offline track. Shorts do play sound and take
     * audio focus themselves, which pauses the offline track like any other video.
     */
    private static boolean isQuietPlayback() {
        return PlayerType.getCurrent() == PlayerType.INLINE_MINIMAL;
    }

    // endregion

    // region surface

    static void attachSurface(@Nullable Surface newSurface) {
        surface = newSurface;
        MediaPlayer mediaPlayer = player;
        if (mediaPlayer == null) return;
        try {
            mediaPlayer.setSurface(newSurface);
        } catch (Exception ex) {
            Logger.printDebug(() -> "Could not attach the surface", ex);
        }
    }

    /** Detaches only if the given surface is still the attached one. */
    static void detachSurface(@Nullable Surface oldSurface) {
        if (oldSurface != null && oldSurface != surface) return;
        attachSurface(null);
    }

    // endregion

    // region position

    private static final Runnable positionSaver = new Runnable() {
        @Override
        public void run() {
            savePosition();
            OfflineServiceHooks.ensurePlaybackNotification();
            if (isPlaying()) handler.postDelayed(this, POSITION_SAVE_INTERVAL_MS);
        }
    };

    private static void savePosition() {
        OfflineVideo video = current;
        if (video == null || player == null || !prepared) return;
        long position = getPosition();
        video.lastPositionMs = position;
        final String key = video.key();
        Utils.runOnBackgroundThread(() -> OfflineIndex.savePosition(key, position));
    }

    // endregion

    // region audio focus and noisy

    private static final AudioManager.OnAudioFocusChangeListener focusListener = change -> {
        MediaPlayer mediaPlayer = player;
        switch (change) {
            case AudioManager.AUDIOFOCUS_LOSS -> {
                // Another player, for example YouTube's own, took over for good.
                Logger.printInfo(() -> "Audio focus lost, pausing offline playback");
                pause();
            }
            case AudioManager.AUDIOFOCUS_LOSS_TRANSIENT -> pauseOnFocusLoss();
            case AudioManager.AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK -> {
                if (mediaPlayer != null) mediaPlayer.setVolume(DUCK_VOLUME, DUCK_VOLUME);
            }
            case AudioManager.AUDIOFOCUS_GAIN -> {
                if (mediaPlayer != null) mediaPlayer.setVolume(1f, 1f);
                if (resumeOnFocusGain) {
                    resumeOnFocusGain = false;
                    resume();
                }
            }
            default -> {
            }
        }
    };

    private static boolean requestFocus() {
        AudioManager audio = (AudioManager) Utils.getContext().getSystemService(Context.AUDIO_SERVICE);
        if (audio == null) return true;
        if (focusRequest == null) {
            focusRequest = new AudioFocusRequest.Builder(AudioManager.AUDIOFOCUS_GAIN)
                    .setAudioAttributes(new AudioAttributes.Builder()
                            .setUsage(AudioAttributes.USAGE_MEDIA)
                            .setContentType(AudioAttributes.CONTENT_TYPE_MOVIE)
                            .build())
                    .setOnAudioFocusChangeListener(focusListener, handler)
                    .setWillPauseWhenDucked(false)
                    .build();
        }
        return audio.requestAudioFocus(focusRequest) == AudioManager.AUDIOFOCUS_REQUEST_GRANTED;
    }

    private static void abandonFocus() {
        // Null out the request first: a listener callback dispatched by the framework must not
        // abandon twice and re-enter itself.
        AudioFocusRequest request = focusRequest;
        focusRequest = null;
        if (request == null) return;

        AudioManager audio = (AudioManager) Utils.getContext().getSystemService(Context.AUDIO_SERVICE);
        if (audio != null) audio.abandonAudioFocusRequest(request);
    }

    private static final BroadcastReceiver noisyReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            if (AudioManager.ACTION_AUDIO_BECOMING_NOISY.equals(intent.getAction())) {
                Logger.printInfo(() -> "Audio becoming noisy, pausing offline playback");
                pause();
            }
        }
    };

    private static void registerNoisyReceiver() {
        if (noisyReceiverRegistered) return;
        IntentFilter filter = new IntentFilter(AudioManager.ACTION_AUDIO_BECOMING_NOISY);
        Context context = Utils.getContext();
        if (Build.VERSION.SDK_INT >= 33) {
            context.registerReceiver(noisyReceiver, filter, Context.RECEIVER_NOT_EXPORTED);
        } else {
            context.registerReceiver(noisyReceiver, filter);
        }
        noisyReceiverRegistered = true;
    }

    private static void unregisterNoisyReceiver() {
        if (!noisyReceiverRegistered) return;
        noisyReceiverRegistered = false;
        try {
            Utils.getContext().unregisterReceiver(noisyReceiver);
        } catch (Exception ignored) {
        }
    }

    // endregion

    // region media session and notification

    private static MediaSession ensureSession() {
        if (session != null) return session;
        MediaSession mediaSession = new MediaSession(Utils.getContext(), "RVXOfflinePlayer");
        mediaSession.setCallback(new MediaSession.Callback() {
            @Override
            public void onPlay() {
                resume();
            }

            @Override
            public void onPause() {
                pause();
            }

            @Override
            public void onStop() {
                close();
            }

            @Override
            public void onSkipToNext() {
                skip(1);
            }

            @Override
            public void onSkipToPrevious() {
                skip(-1);
            }

            @Override
            public void onSeekTo(long position) {
                seekTo(position);
            }

            @Override
            public void onFastForward() {
                seekForward();
            }

            @Override
            public void onRewind() {
                seekBackward();
            }
        }, handler);
        session = mediaSession;
        return mediaSession;
    }

    private static void updateMetadata() {
        OfflineVideo video = current;
        if (video == null || session == null) return;
        MediaMetadata.Builder metadata = new MediaMetadata.Builder()
                .putString(MediaMetadata.METADATA_KEY_TITLE, video.title)
                .putString(MediaMetadata.METADATA_KEY_ARTIST, video.author)
                .putString(MediaMetadata.METADATA_KEY_MEDIA_ID, video.videoId)
                .putLong(MediaMetadata.METADATA_KEY_DURATION, getDuration());
        if (artwork != null) metadata.putBitmap(MediaMetadata.METADATA_KEY_ART, artwork);
        session.setMetadata(metadata.build());
    }

    private static void updatePlaybackState() {
        if (session == null) return;
        final boolean playing = isPlaying();
        long actions = PlaybackState.ACTION_PLAY | PlaybackState.ACTION_PAUSE | PlaybackState.ACTION_PLAY_PAUSE
                | PlaybackState.ACTION_SEEK_TO | PlaybackState.ACTION_STOP
                | PlaybackState.ACTION_FAST_FORWARD | PlaybackState.ACTION_REWIND
                | PlaybackState.ACTION_SKIP_TO_PREVIOUS;
        if (hasNext()) actions |= PlaybackState.ACTION_SKIP_TO_NEXT;
        int state = !prepared ? PlaybackState.STATE_BUFFERING
                : playing ? PlaybackState.STATE_PLAYING : PlaybackState.STATE_PAUSED;
        session.setPlaybackState(new PlaybackState.Builder()
                .setActions(actions)
                .setState(state, getPosition(), playing ? speed : 0f)
                .build());
    }

    @Nullable
    static Notification buildNotification(Context context) {
        OfflineVideo video = current;
        if (video == null || player == null) return null;
        return OfflineNotifications.buildPlayback(context, ensureSession().getSessionToken(),
                video.title, video.author, artwork, isPlaying(), video.key());
    }

    private static void onStateChanged() {
        updateMetadata();
        updatePlaybackState();
        handler.removeCallbacks(positionSaver);
        if (isPlaying()) handler.postDelayed(positionSaver, POSITION_SAVE_INTERVAL_MS);
        handler.removeCallbacks(sponsorTicker);
        if (isPlaying()) handler.post(sponsorTicker);
        OfflineServiceHooks.updatePlaybackNotification();
        notifyListeners();
    }

    // endregion
}

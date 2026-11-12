package io.github.bryceaspringfield.morphe.extension.youtube;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.KeyEvent;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.patches.VideoInformation.VideoQualityInterface;
import app.morphe.extension.youtube.shared.VideoState;

/**
 * Playback with the screen off.
 * <ul>
 *   <li>Keep playing when the screen turns off: a video playing when the screen turns off, which pauses within the next
 *       8 s with no tap of the user (the screen is off), is played again with the media Play key.</li>
 *   <li>Audio only while the screen is off: the lowest video quality while the screen is off, and the quality before
 *       when it turns on again. A video's format list is read when it loads, so the video stream itself cannot be
 *       dropped mid-play without reloading the video.</li>
 * </ul>
 */
public final class PlaybackExtras {

    private static final long PAUSE_WINDOW_MS = 8000;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static boolean registered;
    private static long screenOffAt;
    private static boolean playingAtScreenOff;
    private static int resumes;
    private static VideoQualityInterface qualityBefore;

    private PlaybackExtras() {
    }

    static synchronized void register() {
        if (registered) return;
        registered = true;
        try {
            IntentFilter f = new IntentFilter();
            f.addAction(Intent.ACTION_SCREEN_OFF);
            f.addAction(Intent.ACTION_SCREEN_ON);
            Utils.getContext().getApplicationContext().registerReceiver(new BroadcastReceiver() {
                @Override
                public void onReceive(Context context, Intent intent) {
                    if (Intent.ACTION_SCREEN_OFF.equals(intent.getAction())) onScreenOff();
                    else onScreenOn();
                }
            }, f);
            VideoState.getOnChange().addObserver(PlaybackExtras::onState);
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: screen receiver not registered", t);
        }
    }

    private static void onScreenOff() {
        screenOffAt = SystemClock.uptimeMillis();
        resumes = 0;
        // The video state lags at times (tested on 2026-11-11: paused in the state while the media session played), so
        // a video whose time moves in the next second counts as playing too.
        boolean stated = VideoState.getCurrent() == VideoState.PLAYING;
        long time = VideoInformation.getVideoTime();
        playingAtScreenOff = stated;
        MAIN.postDelayed(() -> {
            if (screenOffAt == 0) return;
            playingAtScreenOff = stated || VideoInformation.getVideoTime() != time;
            if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: screen off, playing " + playingAtScreenOff);
            if (XSettings.AUDIO_ONLY_SCREEN_OFF.get() && playingAtScreenOff) lowestQuality();
        }, 1000);
    }

    private static void onScreenOn() {
        screenOffAt = 0;
        VideoQualityInterface before = qualityBefore;
        qualityBefore = null;
        if (before != null) {
            MAIN.post(() -> {
                try {
                    VideoInformation.changeQuality(before);
                    Logger.printDebug(() -> "YouTube Extras: screen on, quality back to " + before.patch_getQualityName());
                } catch (Throwable t) {
                    Logger.printDebug(() -> "YouTube Extras: quality not restored: " + t);
                }
            });
        }
    }

    private static void onState(VideoState state) {
        if (state != VideoState.PAUSED || screenOffAt == 0 || !playingAtScreenOff || !XSettings.KEEP_PLAYING_SCREEN_OFF.get()) return;
        long since = SystemClock.uptimeMillis() - screenOffAt;
        if (since > PAUSE_WINDOW_MS || resumes >= 3) return;
        resumes++;
        Logger.printDebug(() -> "YouTube Extras: paused " + since + " ms after the screen turned off; playing again");
        MAIN.postDelayed(() -> {
            if (VideoState.getCurrent() != VideoState.PAUSED || screenOffAt == 0) return;
            try {
                AudioManager am = (AudioManager) Utils.getContext().getSystemService(Context.AUDIO_SERVICE);
                long t = SystemClock.uptimeMillis();
                am.dispatchMediaKeyEvent(new KeyEvent(t, t, KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_MEDIA_PLAY, 0));
                am.dispatchMediaKeyEvent(new KeyEvent(t, t, KeyEvent.ACTION_UP, KeyEvent.KEYCODE_MEDIA_PLAY, 0));
            } catch (Throwable t) {
                Logger.printDebug(() -> "YouTube Extras: play key failed: " + t);
            }
        }, 300);
    }

    private static void lowestQuality() {
        try {
            VideoQualityInterface[] all = VideoInformation.getCurrentQualities();
            VideoQualityInterface now = VideoInformation.getCurrentQuality();
            if (all == null || all.length == 0) return;
            VideoQualityInterface low = null;
            for (VideoQualityInterface q : all) {
                int r = q.patch_getResolution();
                if (r > 0 && (low == null || r < low.patch_getResolution())) low = q;
            }
            if (low == null || (now != null && now.patch_getResolution() == low.patch_getResolution())) return;
            qualityBefore = now;
            VideoInformation.changeQuality(low);
            final VideoQualityInterface l = low;
            Logger.printDebug(() -> "YouTube Extras: screen off, quality " + l.patch_getQualityName());
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: lowest quality not set: " + t);
        }
    }
}

package io.github.bryceaspringfield.morphe.extension.youtube;

import android.app.Activity;
import android.app.Application;
import android.app.PictureInPictureParams;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Rational;
import android.view.KeyEvent;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.patches.VideoInformation.VideoQualityInterface;
import app.morphe.extension.youtube.shared.VideoState;

public final class PlaybackExtras {

    private static final long PAUSE_WINDOW_MS = 8000;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static boolean registered;
    private static long screenOffAt;
    private static long leftAt;
    private static boolean pipArmed;
    private static int pipTicks;
    private static long pipLastTime = -1;
    private static boolean playingAtScreenOff;
    private static int resumes;
    private static VideoQualityInterface qualityBefore;
    private static boolean audioOnlyByScreen;

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
            ((Application) Utils.getContext().getApplicationContext()).registerActivityLifecycleCallbacks(
                    new Application.ActivityLifecycleCallbacks() {
                        @Override public void onActivityPaused(Activity a) { onLeave(a); }
                        @Override public void onActivityResumed(Activity a) { leftAt = 0; }
                        @Override public void onActivityCreated(Activity a, Bundle b) { }
                        @Override public void onActivityStarted(Activity a) { }
                        @Override public void onActivityStopped(Activity a) { }
                        @Override public void onActivitySaveInstanceState(Activity a, Bundle b) { }
                        @Override public void onActivityDestroyed(Activity a) { }
                    });
            MAIN.postDelayed(PlaybackExtras::pipTick, 2000);
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: screen receiver not registered", t);
        }
    }

    private static void onLeave(Activity a) {
        try {
            if (a.isFinishing() || a.isChangingConfigurations() || a.isInPictureInPictureMode()) return;
            if (!XSettings.KEEP_PLAYING_SCREEN_OFF.get() && !XSettings.AUDIO_ONLY.get()) return;
            if (!((android.os.PowerManager) a.getSystemService(Context.POWER_SERVICE)).isInteractive()) return;
            leftAt = SystemClock.uptimeMillis();
            resumes = 0;
            boolean stated = VideoState.getCurrent() == VideoState.PLAYING;
            long time = VideoInformation.getVideoTime();
            playingAtLeave = stated;
            MAIN.postDelayed(() -> {
                if (leftAt == 0) return;
                playingAtLeave = stated || VideoInformation.getVideoTime() != time;
                if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: app left, playing " + playingAtLeave);
                if (playingAtLeave && AudioOnly.isOn()) AudioOnly.set(true, "app left");
            }, 1000);
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: app leave not handled: " + t);
        }
    }

    private static boolean playingAtLeave;

    private static void pipTick() {
        try {
            Activity a = ResumedActivity.main();
            if (a != null && android.os.Build.VERSION.SDK_INT >= 31) {
                long time = VideoInformation.getVideoTime();
                boolean moved = time != pipLastTime;
                pipLastTime = time;
                VideoState vs = VideoState.getCurrent();
                boolean want = XSettings.AUTO_PIP.get() && (vs == VideoState.PLAYING || (vs == null && moved))
                        && app.morphe.extension.youtube.shared.PlayerType.getCurrent().isMaximizedOrFullscreen()
                        && !a.isInPictureInPictureMode();
                if (XSettings.DEBUG.get() && XSettings.AUTO_PIP.get() && ++pipTicks % 5 == 0) {
                    Logger.printDebug(() -> "YouTube Extras: auto picture in picture check: state " + VideoState.getCurrent()
                            + ", player " + app.morphe.extension.youtube.shared.PlayerType.getCurrent() + ", in pip " + a.isInPictureInPictureMode() + ", armed " + pipArmed);
                }
                if (want != pipArmed) {
                    pipArmed = want;
                    a.setPictureInPictureParams(new PictureInPictureParams.Builder()
                            .setAspectRatio(new Rational(16, 9)).setAutoEnterEnabled(want).build());
                    if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: auto picture in picture " + want);
                }
            }
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: auto picture in picture not set: " + t);
        }
        MAIN.postDelayed(PlaybackExtras::pipTick, 2000);
    }

    private static void onScreenOff() {
        screenOffAt = SystemClock.uptimeMillis();
        resumes = 0;
        boolean stated = VideoState.getCurrent() == VideoState.PLAYING;
        long time = VideoInformation.getVideoTime();
        playingAtScreenOff = stated;
        MAIN.postDelayed(() -> {
            if (screenOffAt == 0) return;
            playingAtScreenOff = stated || VideoInformation.getVideoTime() != time;
            if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: screen off, playing " + playingAtScreenOff);
            if (XSettings.AUDIO_ONLY_SCREEN_OFF.get() && playingAtScreenOff && !XSettings.AUDIO_ONLY.get()) {
                audioOnlyByScreen = AudioOnly.set(true, "screen off");
                if (!audioOnlyByScreen) lowestQuality();
            }
        }, 1000);
    }

    private static void onScreenOn() {
        screenOffAt = 0;
        if (audioOnlyByScreen) {
            audioOnlyByScreen = false;
            if (!XSettings.AUDIO_ONLY.get()) AudioOnly.set(false, "screen on");
        }
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
        if (state != VideoState.PAUSED || !XSettings.KEEP_PLAYING_SCREEN_OFF.get()) return;
        boolean off = screenOffAt != 0 && playingAtScreenOff;
        boolean left = leftAt != 0 && playingAtLeave;
        if (!off && !left) return;
        long since = SystemClock.uptimeMillis() - (off ? screenOffAt : leftAt);
        if (since > PAUSE_WINDOW_MS || resumes >= 3) return;
        resumes++;
        Logger.printDebug(() -> "YouTube Extras: paused " + since + " ms after the " + (off ? "screen turned off" : "app was left") + "; playing again");
        MAIN.postDelayed(() -> {
            if (VideoState.getCurrent() != VideoState.PAUSED || (screenOffAt == 0 && leftAt == 0)) return;
            mediaKey(KeyEvent.KEYCODE_MEDIA_PLAY);
        }, 300);
    }

    static void audioOnlyQuality(boolean on, boolean keepPick) {
        if (on) {
            if (XSettings.AUDIO_ONLY_LOW_DATA.get() && qualityBefore == null) MAIN.post(PlaybackExtras::lowestQuality);
        } else {
            VideoQualityInterface before = qualityBefore;
            qualityBefore = null;
            if (before != null && !keepPick) {
                MAIN.post(() -> {
                    try {
                        VideoInformation.changeQuality(before);
                    } catch (Throwable t) {
                        Logger.printDebug(() -> "YouTube Extras: quality not restored: " + t);
                    }
                });
            }
        }
    }

    static boolean mediaKey(int keyCode) {
        try {
            AudioManager am = (AudioManager) Utils.getContext().getSystemService(Context.AUDIO_SERVICE);
            long t = SystemClock.uptimeMillis();
            am.dispatchMediaKeyEvent(new KeyEvent(t, t, KeyEvent.ACTION_DOWN, keyCode, 0));
            am.dispatchMediaKeyEvent(new KeyEvent(t, t, KeyEvent.ACTION_UP, keyCode, 0));
            return true;
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: media key " + keyCode + " failed: " + t);
            return false;
        }
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

/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-23.
 * Based on the A–B loop in Morphe PR #4685 (Copyright 2026 Morphe; see NOTICE).
 */
package app.morphe.extension.music.patches.loop;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.view.View;

import java.lang.ref.WeakReference;

import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.music.shared.VideoInformation;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Main-thread owner of the current A–B section and its native playback deadline. */
@SuppressWarnings("unused")
public final class RepeatSection {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final RepeatRange RANGE = new RepeatRange();
    private static final Runnable TICK = RepeatSection::checkPosition;
    private static final SharedPreferences.OnSharedPreferenceChangeListener PREFERENCE = (preferences, key) -> {
        if (Settings.AB_REPEAT.key.equals(key)) {
            // RVX settings updates the cached Setting in another listener for the same preference.
            // SharedPreferences does not guarantee listener order. Read the cache after dispatch completes.
            MAIN.post(RepeatSection::refreshPreference);
        }
    };

    /** Added to the native coordinator. It reads the selected ExoPlayer, never a fading-out instance. */
    public interface Playback {
        long rvxRepeatPosition();
        long rvxRepeatDuration();
        boolean rvxRepeatPlaying();
    }

    private static WeakReference<Playback> playback = new WeakReference<>(null);
    private static String observedVideoId = "";
    private static boolean watchingPreference;
    private static boolean wrapping;

    private RepeatSection() {}

    /** Injection point on the native local playback coordinator's constructor. */
    public static void onPlaybackCreated(Playback player) {
        onMain(() -> {
            clear();
            playback = new WeakReference<>(player);
        });
    }

    /** Injection point for loads, stops, and native queue advances, including a repeated video ID. */
    public static void onPlaybackBoundary() {
        if (Settings.AB_REPEAT.get()) onMain(RepeatSection::clear);
    }

    /** Injection point for the current video ID, including media swaps not routed through the load facade. */
    public static void onVideoId(String id) {
        if (!Settings.AB_REPEAT.get()) return;
        onMain(() -> {
            if (!id.equals(observedVideoId)) clear();
            observedVideoId = id;
        });
    }

    /** Observe the native seek without rewriting it or intercepting any gesture. */
    public static void onSeek(long position) {
        if (!Settings.AB_REPEAT.get()) return;

        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(() -> onSeek(position));
        } else if (!wrapping && RANGE.manualSeek(position)) {
            changed();
        }
    }

    /** Injection point on the Now Playing time-bar constructor. */
    public static void bindTimeBar(View timeBar) {
        if (!watchingPreference) {
            Setting.preferences.preferences.registerOnSharedPreferenceChangeListener(PREFERENCE);
            watchingPreference = true;
        }
        RepeatControls.watch(timeBar);
    }

    /** Consulted only by Crossfade's proactive automatic scheduler, not by manual navigation. */
    public static boolean holdsAutomaticAdvance() {
        return Settings.AB_REPEAT.get() && RANGE.active();
    }

    static long start() {
        return RANGE.start();
    }

    static long end() {
        return RANGE.end();
    }

    static void setNextPoint() {
        if (!Settings.AB_REPEAT.get() || RANGE.active()) return;
        Playback player = playback.get();
        String videoId = VideoInformation.getVideoId();
        if (player == null || videoId.isEmpty()) {
            showUnavailable();
            return;
        }

        try {
            long position = player.rvxRepeatPosition();
            long duration = player.rvxRepeatDuration();
            if (position < 0 || duration <= 0) {
                showUnavailable();
                return;
            }
            if (RANGE.start() == RepeatRange.UNSET) {
                if (!RANGE.setStart(position, duration)) {
                    Utils.showToastShort(str("morphe_music_ab_repeat_invalid_start"));
                    return;
                }
                observedVideoId = videoId;
            } else if (!RANGE.setEnd(position, duration)) {
                Utils.showToastShort(str("morphe_music_ab_repeat_invalid_end"));
                return;
            }
            changed();
        } catch (Exception exception) {
            Logger.printException(() -> "Could not set A–B repeat point", exception);
            showUnavailable();
        }
    }

    static void clear() {
        if (RANGE.clear()) changed();
    }

    private static void changed() {
        MAIN.removeCallbacks(TICK);
        RepeatControls.refresh();
        if (RANGE.active()) MAIN.post(TICK);
    }

    private static void showUnavailable() {
        Utils.showToastShort(str("morphe_music_ab_repeat_unavailable"));
    }

    private static void refreshPreference() {
        if (!Settings.AB_REPEAT.get()) clear();
        RepeatControls.refresh();
    }

    private static void checkPosition() {
        Playback player = playback.get();
        if (!RANGE.active() || !Settings.AB_REPEAT.get() || player == null) {
            clear();
            return;
        }

        try {
            long duration = player.rvxRepeatDuration();
            if (duration > 0 && !RANGE.fits(duration)) {
                clear();
                return;
            }

            if (!player.rvxRepeatPlaying()) {
                MAIN.postDelayed(TICK, 200);
                return;
            }

            long position = player.rvxRepeatPosition();
            if (RANGE.shouldWrap(position)) {
                wrapping = true;
                try {
                    // Local director only: do not send a loop seek to a cast device.
                    if (!VideoInformation.overrideVideoTime(RANGE.start())) {
                        clear();
                        showUnavailable();
                        return;
                    }
                } finally {
                    wrapping = false;
                }
            }
            if (RANGE.active()) {
                long distance = RANGE.end() - position;
                float speed = Math.max(0.25f, VideoInformation.getPlaybackSpeed());
                long delay = Math.max(16, Math.min(200, (long) (distance / speed)));
                MAIN.postDelayed(TICK, delay);
            }
        } catch (Exception exception) {
            clear();
            Logger.printException(() -> "A–B repeat playback check failed", exception);
        }
    }

    private static void onMain(Runnable callback) {
        if (Looper.myLooper() == Looper.getMainLooper()) callback.run();
        else MAIN.post(callback);
    }
}

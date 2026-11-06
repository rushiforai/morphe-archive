/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This program is free software: you can redistribute it and/or modify it under the terms of the
 * GNU General Public License as published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * Written by lavinhoque33, 2026-10-24
 */

package app.morphe.extension.music.patches;

import android.os.Handler;
import android.os.Looper;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.music.patches.CrossfadeManager.FadeCurve;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.shared.settings.preference.SeekBarPreference;
import app.morphe.extension.shared.utils.Logger;

/**
 * Fades the volume of the music player in at the start of a track and out at its end.
 * <p>
 * The gain is a pure function of the playback position and the duration of the track, so every case
 * (pause, seek, skip, repeat one, switching a setting off) needs no special handling:
 * the fade-in covers the first seconds of the track, and the fade-out the last seconds.
 * The gain is multiplied with the volume the app asks for, so it composes with whatever else sets the volume.
 * <p>
 * Crossfade already blends tracks, so the fades are not used while it is on.
 */
@SuppressWarnings("unused")
public final class FadeManager {

    /**
     * Update interval while a track is playing, so a fade has no audible steps.
     */
    private static final long PLAYING_TICK_MS = 25;

    /**
     * Update interval while the position does not move (paused, buffering).
     */
    private static final long STALLED_TICK_MS = 250;

    /**
     * Update interval while both fades are off, to notice a setting being switched on.
     */
    private static final long DISABLED_TICK_MS = 500;

    /**
     * The gain is rounded to this many steps, which is finer than the ear can tell
     * and spares the player redundant volume changes.
     */
    private static final float GAIN_STEPS = 256f;

    /**
     * Crossfade freezes its setting for the process lifetime (it needs a restart), and so do the fades.
     */
    private static final boolean CROSSFADE_ON = Settings.CROSSFADE_ENABLED.get();

    private static final class PlayerState {
        /**
         * Volume the app last asked for.
         */
        float appVolume = 1f;

        /**
         * Gain currently applied on top of {@link #appVolume}.
         */
        float gain = 1f;

        long lastPosition = -1;
    }

    /**
     * More than one player can be alive at the same time.
     */
    private static final Map<FadePlayer, PlayerState> players = Collections.synchronizedMap(new WeakHashMap<>());

    // Only used by the tick on the main thread, kept to avoid allocating on every tick.
    private static final List<FadePlayer> tickPlayers = new ArrayList<>();
    private static final List<PlayerState> tickStates = new ArrayList<>();

    private static final Handler handler = new Handler(Looper.getMainLooper());
    private static final Runnable tickRunnable = FadeManager::tick;
    private static boolean started;

    /**
     * Set while the fade sets the volume of a player, so {@link #onSetVolume} does not mistake it for the app.
     */
    private static volatile boolean applyingFade;

    private static boolean isFadeEnabled() {
        return !CROSSFADE_ON && (Settings.FADE_IN_ENABLED.get() || Settings.FADE_OUT_ENABLED.get());
    }

    private static PlayerState getState(FadePlayer player) {
        synchronized (players) {
            PlayerState state = players.get(player);
            if (state == null) {
                state = new PlayerState();
                players.put(player, state);
            }
            return state;
        }
    }

    /**
     * Injection point. Called when an ExoPlayer is created.
     */
    public static void initializeExoPlayer(FadePlayer player) {
        try {
            getState(player);
            start();
        } catch (Exception ex) {
            Logger.printException(() -> "initializeExoPlayer failure", ex);
        }
    }

    private static synchronized void start() {
        if (!started) {
            started = true;
            handler.post(tickRunnable);
        }
    }

    /**
     * Injection point. Called with the volume the app sets on a player.
     *
     * @return The volume to set, which is the requested volume with the fade gain applied.
     */
    public static float onSetVolume(FadePlayer player, float volume) {
        try {
            if (applyingFade) {
                return volume;
            }

            PlayerState state = getState(player);
            state.appVolume = volume;

            // The app sets the volume as a track starts, so use the gain of the new position
            // instead of waiting for the next tick.
            state.gain = isFadeEnabled() ? computeGain(player.patch_getPositionMs(), player.patch_getDurationMs()) : 1f;

            return volume * state.gain;
        } catch (Exception ex) {
            Logger.printException(() -> "onSetVolume failure", ex);
        }
        return volume;
    }

    private static void tick() {
        long delay = DISABLED_TICK_MS;
        try {
            final boolean enabled = isFadeEnabled();
            synchronized (players) {
                for (Map.Entry<FadePlayer, PlayerState> entry : players.entrySet()) {
                    tickPlayers.add(entry.getKey());
                    tickStates.add(entry.getValue());
                }
            }

            boolean playing = false;
            for (int i = 0, size = tickPlayers.size(); i < size; i++) {
                final FadePlayer player = tickPlayers.get(i);
                final PlayerState state = tickStates.get(i);
                try {
                    final float gain;
                    if (enabled) {
                        final long position = player.patch_getPositionMs();
                        gain = computeGain(position, player.patch_getDurationMs());
                        if (position != state.lastPosition) {
                            state.lastPosition = position;
                            playing = true;
                        }
                    } else {
                        gain = 1f;
                    }
                    applyGain(player, state, gain);
                } catch (Exception ex) {
                    // The player is released.
                    players.remove(player);
                    Logger.printDebug(() -> "Dropping player: " + ex);
                }
            }

            if (enabled) {
                delay = playing ? PLAYING_TICK_MS : STALLED_TICK_MS;
            }
        } catch (Exception ex) {
            Logger.printException(() -> "tick failure", ex);
        } finally {
            tickPlayers.clear();
            tickStates.clear();
            handler.postDelayed(tickRunnable, delay);
        }
    }

    private static void applyGain(FadePlayer player, PlayerState state, float gain) {
        if (gain == state.gain) {
            return;
        }

        state.gain = gain;

        if (BaseSettings.DEBUG.get()) {
            final float volume = state.appVolume * gain;
            final long position = state.lastPosition;
            Logger.printDebug(() -> "Fade gain: " + gain + " volume: " + volume + " position: " + position + " ms");
        }

        applyingFade = true;
        try {
            player.patch_setFadeVolume(state.appVolume * gain);
        } finally {
            applyingFade = false;
        }
    }

    private static long getFadeMs(IntegerSetting durationSetting) {
        return SeekBarPreference.clampToRange(durationSetting) * 1000L;
    }

    /**
     * @param position Playback position in milliseconds.
     * @param duration Duration in milliseconds, or a value less than 1 if unknown.
     * @return The gain from 0 (silent) to 1 (normal volume) at the position.
     */
    private static float computeGain(long position, long duration) {
        final boolean durationKnown = duration > 0;
        long fadeInMs = Settings.FADE_IN_ENABLED.get() ? getFadeMs(Settings.FADE_IN_DURATION) : 0;
        long fadeOutMs = durationKnown && Settings.FADE_OUT_ENABLED.get() ? getFadeMs(Settings.FADE_OUT_DURATION) : 0;

        // A track shorter than both fades shortens them in proportion, so they do not overlap.
        final long totalMs = fadeInMs + fadeOutMs;
        if (durationKnown && totalMs > duration) {
            fadeInMs = fadeInMs * duration / totalMs;
            fadeOutMs = fadeOutMs * duration / totalMs;
        }

        final FadeCurve curve = Settings.CROSSFADE_CURVE.get();
        float gain = 1f;

        if (position >= 0 && position < fadeInMs) {
            gain *= curve.in((float) position / fadeInMs);
        }

        final long remainingMs = duration - position;
        if (fadeOutMs > 0 && remainingMs < fadeOutMs) {
            final float progress = 1f - Math.max(remainingMs, 0) / (float) fadeOutMs;
            gain *= curve.out(progress);
        }

        return Math.round(gain * GAIN_STEPS) / GAIN_STEPS;
    }
}

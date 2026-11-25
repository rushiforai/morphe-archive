/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.patches.video;

import static app.morphe.extension.youtube.patches.video.CustomPlaybackSpeedPatch.PLAYBACK_SPEED_MAXIMUM;
import static app.morphe.extension.youtube.patches.video.CustomPlaybackSpeedPatch.SPEED_ADJUSTMENT_CHANGE;

import java.util.Arrays;

/** Preset parsing and the shared grid for manual speed adjustments. */
public final class PlaybackSpeedValues {
    private PlaybackSpeedValues() {
    }

    public static boolean isPlayable(float rate) {
        return rate > 0f && rate <= PLAYBACK_SPEED_MAXIMUM;
    }

    /** Keeps the host's limiter when custom speeds are off, without touching the pitch bound. */
    static float limitSoftwareSpeed(float speed, float stockMinimum, float stockMaximum, boolean customSpeeds) {
        if (customSpeeds && isPlayable(speed)) return Math.min(speed, stockMaximum);

        return Math.max(stockMinimum, Math.min(speed, stockMaximum));
    }

    /** Returns sorted, exact preset speeds or throws for an invalid list. */
    public static float[] parsePresets(String text) {
        String[] tokens = text.trim().split("\\s+");
        float[] rates = new float[tokens.length];
        for (int i = 0; i < tokens.length; i++) {
            float rate = Float.parseFloat(tokens[i]);
            if (!Float.isFinite(rate) || rate <= 0f) {
                throw new IllegalArgumentException("Invalid playback speed: " + tokens[i]);
            }
            if (rate > PLAYBACK_SPEED_MAXIMUM) {
                throw new SpeedTooHighException();
            }
            rates[i] = rate;
        }

        Arrays.sort(rates);
        for (int i = 1; i < rates.length; i++) {
            if (rates[i - 1] == rates[i]) throw new IllegalArgumentException("Duplicate playback speed: " + rates[i]);
        }
        return rates;
    }

    static final class SpeedTooHighException extends IllegalArgumentException {
    }

    public static int speedToStep(float rate) {
        return (int) Math.round(rate / SPEED_ADJUSTMENT_CHANGE);
    }

    public static float stepToSpeed(int step) {
        int lastStep = speedToStep(PLAYBACK_SPEED_MAXIMUM);
        return (float) (Math.max(1, Math.min(step, lastStep)) * SPEED_ADJUSTMENT_CHANGE);
    }

    public static float adjust(float current, int direction) {
        return stepToSpeed(speedToStep(current) + direction);
    }

    /** Swipe by 0.05× without snapping a custom preset to the slider grid. */
    public static float adjustBySwipe(float current, int steps) {
        int hundredths = Math.round(current * 100) + steps * 5;
        return Math.max(5, Math.min(hundredths, (int) (PLAYBACK_SPEED_MAXIMUM * 100))) / 100f;
    }
}

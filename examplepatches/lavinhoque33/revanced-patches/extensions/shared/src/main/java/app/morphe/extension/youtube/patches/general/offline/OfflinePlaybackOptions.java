/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.patches.general.offline;

import java.util.Arrays;

import app.morphe.extension.youtube.patches.video.PlaybackSpeedValues;

final class OfflinePlaybackOptions {
    static final float[] STOCK_SPEEDS = {0.25f, 0.5f, 0.75f, 1f, 1.25f, 1.5f, 1.75f, 2f};

    enum Completion {
        REPLAY, PAUSE_AT_START, NEXT_OR_STOP
    }

    private OfflinePlaybackOptions() {
    }

    static float defaultSpeed(float configured, boolean whitelisted) {
        // Auto has no previous user choice on a new item. Resume keeps the current engine rate.
        return !whitelisted && PlaybackSpeedValues.isPlayable(configured) ? configured : 1f;
    }

    static boolean shouldRememberSpeed(boolean remember, float configured, float accepted) {
        return remember && configured != accepted;
    }

    static float[] speedChoices(float[] sortedPresets, float current) {
        int position = Arrays.binarySearch(sortedPresets, current);
        if (position >= 0) return sortedPresets;

        int insertion = -position - 1;
        float[] choices = new float[sortedPresets.length + 1];
        System.arraycopy(sortedPresets, 0, choices, 0, insertion);
        choices[insertion] = current;
        System.arraycopy(sortedPresets, insertion, choices, insertion + 1, sortedPresets.length - insertion);
        return choices;
    }

    static Completion completion(boolean repeat, boolean pauseAfterRepeat) {
        if (!repeat) return Completion.NEXT_OR_STOP;
        return pauseAfterRepeat ? Completion.PAUSE_AT_START : Completion.REPLAY;
    }
}

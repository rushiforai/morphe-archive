/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4618
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-12.
 */

package app.morphe.extension.music.patches;

import android.media.AudioManager;

import app.morphe.extension.music.settings.Settings;

@SuppressWarnings("unused")
public class DisableAudioDuckingPatch {

    private static volatile boolean duckingDisabled;

    /**
     * Injection point.
     *
     * @param original If the app pauses when ducked, which it does for spoken content.
     */
    public static boolean willPauseWhenDucked(boolean original) {
        duckingDisabled = Settings.DISABLE_AUDIO_DUCKING.get() && !original;
        if (CrossfadeTrace.isEnabled()) {
            CrossfadeTrace.event("FOCUS_REQUEST", null, () -> "originalWillPause=" + original
                    + " willPauseWhenDucked=" + (original || duckingDisabled)
                    + " duckingDisabled=" + duckingDisabled);
        }

        return original || duckingDisabled;
    }

    /**
     * Injection point.
     */
    public static boolean ignoreAudioFocusChange(int focusChange) {
        if (CrossfadeTrace.isEnabled()) {
            CrossfadeTrace.event("FOCUS_CHANGE", null, () -> "change=" + focusChange
                    + " duckingDisabled=" + duckingDisabled
                    + " ignored=" + (duckingDisabled
                    && focusChange == AudioManager.AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK));
        }
        return duckingDisabled && focusChange == AudioManager.AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK;
    }
}

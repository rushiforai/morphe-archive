/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.youtube.patches.playback;

import static android.media.AudioManager.AUDIOFOCUS_GAIN;
import static android.media.AudioManager.AUDIOFOCUS_GAIN_TRANSIENT;
import static android.media.AudioManager.AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK;
import static android.media.AudioManager.AUDIOFOCUS_LOSS;

import app.morphe.extension.youtube.settings.Settings;

@SuppressWarnings("unused")
public final class PauseOnAudioInterruptPatch {
    private PauseOnAudioInterruptPatch() {}

    private static final class PlaybackSetting {
        // Android focus requests are immutable once built. Request and listener use the same setting until restart.
        private static final boolean ENABLED = Settings.PAUSE_ON_AUDIO_INTERRUPT.get();
    }

    /** Called with YouTube's own AudioFocusRequestCompat builder flag. */
    public static boolean willPauseWhenDucked(boolean nativePause) {
        return willPauseWhenDucked(nativePause, PlaybackSetting.ENABLED);
    }

    static boolean willPauseWhenDucked(boolean nativePause, boolean enabled) {
        return nativePause || enabled;
    }

    /** Only called if YouTube would otherwise lower the volume. */
    public static boolean shouldPauseOnDuck(boolean alreadyPausedForDuck) {
        return shouldPauseOnDuck(alreadyPausedForDuck, PlaybackSetting.ENABLED);
    }

    static boolean shouldPauseOnDuck(boolean alreadyPausedForDuck, boolean enabled) {
        return enabled && !alreadyPausedForDuck;
    }

    public static boolean endsInterruption(int focusChange) {
        // These are the same gain events the native listener handles. A genuine transient loss
        // is not the end of an existing interruption.
        return switch (focusChange) {
            case AUDIOFOCUS_GAIN, AUDIOFOCUS_GAIN_TRANSIENT, AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK,
                 AUDIOFOCUS_LOSS -> true;
            default -> false;
        };
    }
}

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
import static android.media.AudioManager.AUDIOFOCUS_LOSS_TRANSIENT;
import static android.media.AudioManager.AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK;
import static app.morphe.extension.youtube.patches.playback.PauseOnAudioInterruptPatch.endsInterruption;
import static app.morphe.extension.youtube.patches.playback.PauseOnAudioInterruptPatch.shouldPauseOnDuck;
import static app.morphe.extension.youtube.patches.playback.PauseOnAudioInterruptPatch.willPauseWhenDucked;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class PauseOnAudioInterruptPatchTest {
    @Test
    public void disabledPreservesBothStockRequestFlagsAndNeverOverridesNativeDuck() {
        assertFalse(willPauseWhenDucked(false, false));
        assertTrue(willPauseWhenDucked(true, false));
        assertFalse(shouldPauseOnDuck(false, false));
    }

    @Test
    public void repeatedDuckAfterManualResumeUsesStockUntilInterruptionEnds() {
        assertTrue(willPauseWhenDucked(false, true));
        boolean pausedForDuck = shouldPauseOnDuck(false, true);
        assertTrue(pausedForDuck);

        // A Play command does not clear the listener's interruption bit. Neither does another duck.
        assertFalse(endsInterruption(AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK));
        assertFalse(shouldPauseOnDuck(pausedForDuck, true));
        assertFalse(endsInterruption(AUDIOFOCUS_LOSS_TRANSIENT));
        assertFalse(shouldPauseOnDuck(pausedForDuck, true));
    }

    @Test
    public void nativeGainOrFullLossAllowsTheNextDuckToPause() {
        for (int change : new int[] {
                AUDIOFOCUS_GAIN, AUDIOFOCUS_GAIN_TRANSIENT, AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK, AUDIOFOCUS_LOSS
        }) {
            boolean pausedForDuck = shouldPauseOnDuck(false, true);
            pausedForDuck &= !endsInterruption(change);
            assertTrue(shouldPauseOnDuck(pausedForDuck, true));
        }
    }
}

/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.patches.general.offline;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.List;

import kotlin.Unit;

import org.junit.Test;

import app.morphe.extension.youtube.patches.player.DoubleTapSeekPatch;
import app.morphe.extension.youtube.patches.video.PlaybackSpeedValues;
import app.morphe.extension.youtube.swipecontrols.misc.ScrollDistanceHelper;

public class OfflinePlaybackOptionsTest {
    @Test
    public void customPresetsAreSortedExactlyAndNonPresetCurrentIsShown() {
        float[] presets = PlaybackSpeedValues.parsePresets(" 3.0\n .5  2.5\t 1.027  0.25 ");
        assertArrayEquals(new float[]{0.25f, 0.5f, 1.027f, 2.5f, 3f},
                OfflinePlaybackOptions.speedChoices(presets, 2.5f), 0f);
        assertArrayEquals(new float[]{0.25f, 0.5f, 1f, 1.027f, 2.5f, 3f},
                OfflinePlaybackOptions.speedChoices(presets, 1f), 0f);
        assertArrayEquals(new float[]{0.25f, 0.5f, 1.027f, 2.5f, 3f, 4f},
                OfflinePlaybackOptions.speedChoices(presets, 4f), 0f);
    }

    @Test
    public void stockChoicesDoNotIncludeAuto() {
        assertArrayEquals(new float[]{0.25f, 0.5f, 0.75f, 1f, 1.25f, 1.5f, 1.75f, 2f},
                OfflinePlaybackOptions.speedChoices(OfflinePlaybackOptions.STOCK_SPEEDS, 1f), 0f);
    }

    @Test
    public void malformedPresetsAreRejected() {
        for (String invalid : new String[]{"", "NaN 1", "Infinity 1", "0 1", "-2 1", "1 1.0", "8.001"}) {
            assertThrows(invalid, IllegalArgumentException.class, () -> PlaybackSpeedValues.parsePresets(invalid));
        }
    }

    @Test
    public void newItemsResolveConfiguredDefaultOrNormalWithoutLeakingSessionSpeed() {
        assertEquals(1.35f, OfflinePlaybackOptions.defaultSpeed(1.35f, false), 0f);
        assertEquals(1f, OfflinePlaybackOptions.defaultSpeed(-2f, false), 0f);
        assertEquals(1f, OfflinePlaybackOptions.defaultSpeed(1.35f, true), 0f);
        assertEquals(1f, OfflinePlaybackOptions.defaultSpeed(Float.NaN, false), 0f);
        assertEquals(1f, OfflinePlaybackOptions.defaultSpeed(8.01f, false), 0f);
    }

    @Test
    public void rememberChangesTheSameDefaultReadByTheNextItem() {
        float configured = -2f;
        float accepted = 2.5f;
        assertFalse(OfflinePlaybackOptions.shouldRememberSpeed(false, configured, accepted));
        assertEquals(1f, OfflinePlaybackOptions.defaultSpeed(configured, false), 0f);

        assertTrue(OfflinePlaybackOptions.shouldRememberSpeed(true, configured, accepted));
        assertEquals(accepted, OfflinePlaybackOptions.defaultSpeed(accepted, false), 0f);
        assertFalse(OfflinePlaybackOptions.shouldRememberSpeed(true, accepted, accepted));
    }

    @Test
    public void sliderAndButtonsUseThePointZeroFiveGridWithoutChangingExactPresets() {
        assertEquals(1.05f, PlaybackSpeedValues.stepToSpeed(21), 0f);
        assertEquals(1.1f, PlaybackSpeedValues.adjust(1.027f, 1), 0f);
        assertEquals(1f, PlaybackSpeedValues.adjust(1.027f, -1), 0f);
        assertEquals(0.05f, PlaybackSpeedValues.adjust(0.05f, -1), 0f);
        assertEquals(8f, PlaybackSpeedValues.adjust(8f, 1), 0f);
        assertEquals(1.027f, PlaybackSpeedValues.parsePresets("1.027")[0], 0f);
    }

    @Test
    public void directionalSeekUsesTheRequestedSignAndIndependentFallback() {
        assertEquals(17, DoubleTapSeekPatch.offlineSeconds(true, 17));
        assertEquals(-4, DoubleTapSeekPatch.offlineSeconds(false, 4));
        assertEquals(10, DoubleTapSeekPatch.offlineSeconds(true, 0));
        assertEquals(-10, DoubleTapSeekPatch.offlineSeconds(false, -1));
        assertEquals(10, DoubleTapSeekPatch.offlineSeconds(true, Integer.MAX_VALUE));
    }

    @Test
    public void repeatOneOverridesQueueAdvanceAndPauseOnlyAppliesWhenRepeating() {
        assertEquals(OfflinePlaybackOptions.Completion.REPLAY, OfflinePlaybackOptions.completion(true, false));
        assertEquals(OfflinePlaybackOptions.Completion.PAUSE_AT_START, OfflinePlaybackOptions.completion(true, true));
        assertEquals(OfflinePlaybackOptions.Completion.NEXT_OR_STOP, OfflinePlaybackOptions.completion(false, true));
        assertEquals(OfflinePlaybackOptions.Completion.NEXT_OR_STOP, OfflinePlaybackOptions.completion(false, false));
    }

    @Test
    public void swipeSpeedStepsDoNotSnapCustomPresetsToTheSliderGrid() {
        assertEquals(1.08f, PlaybackSpeedValues.adjustBySwipe(1.03f, 1), 0f);
        assertEquals(0.93f, PlaybackSpeedValues.adjustBySwipe(1.03f, -2), 0f);
        assertEquals(0.05f, PlaybackSpeedValues.adjustBySwipe(0.07f, -1), 0f);
        assertEquals(8f, PlaybackSpeedValues.adjustBySwipe(7.99f, 1), 0f);
    }

    @Test
    public void exactSwipeStepKeepsItsOriginalDirection() {
        List<Integer> directions = new ArrayList<>();
        ScrollDistanceHelper steps = new ScrollDistanceHelper(3, (before, after, direction) -> {
            directions.add(direction);
            return Unit.INSTANCE;
        });

        steps.add(3);
        steps.add(-6);
        assertEquals(List.of(1, -1, -1), directions);
    }
}

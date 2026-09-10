/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class YandexVotTimingTest {
    @Test
    public void pollingIsIndependentFromLongServerEstimate() {
        assertEquals(15, YandexVotTiming.pollDelaySeconds(600));
        assertEquals(15, YandexVotTiming.pollDelaySeconds(15));
        assertEquals(5, YandexVotTiming.pollDelaySeconds(5));
        assertEquals(10, YandexVotTiming.pollDelaySeconds(0));
    }

    @Test
    public void onlyPostUploadServerEtaCanStartCountdown() {
        // STATUS_AUDIO_REQUESTED is observed before the source upload.  Its absent/zero value
        // must keep the UI indeterminate until a fresh processing response provides an ETA.
        assertEquals(-1, YandexVotTiming.serverEstimateOrNone(-1));
        assertEquals(-1, YandexVotTiming.serverEstimateOrNone(0));
        assertEquals(47, YandexVotTiming.serverEstimateOrNone(47));
    }

    @Test
    public void countdownDeadlineCanTightenButNeverMoveLater() {
        long now = 1_000_000L;
        long current = now + 60_000L;

        assertEquals(current, YandexVotTiming.tightenDeadlineMs(now, current, 600));
        assertEquals(now + 5_000L, YandexVotTiming.tightenDeadlineMs(now, current, 5));
        assertEquals(now - 1L, YandexVotTiming.tightenDeadlineMs(now, now - 1L, 3));
    }

    @Test
    public void buttonAndBottomSheetUseTheSameMinuteRounding() {
        assertEquals(1, YandexVotTiming.roundedDisplayMinutes(60));
        assertEquals(2, YandexVotTiming.roundedDisplayMinutes(61));
        assertEquals(2, YandexVotTiming.roundedDisplayMinutes(89));
        assertEquals(2, YandexVotTiming.roundedDisplayMinutes(120));
    }
}

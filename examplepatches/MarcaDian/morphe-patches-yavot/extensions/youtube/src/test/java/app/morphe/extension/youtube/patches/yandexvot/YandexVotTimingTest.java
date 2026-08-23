package app.morphe.extension.youtube.patches.yandexvot;

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
    public void countdownDeadlineCanTightenButNeverMoveLater() {
        final long now = 1_000_000L;
        final long current = now + 60_000L;

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

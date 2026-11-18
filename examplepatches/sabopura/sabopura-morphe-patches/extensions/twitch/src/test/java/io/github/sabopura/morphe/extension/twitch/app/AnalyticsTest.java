package io.github.sabopura.morphe.extension.twitch.app;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class AnalyticsTest {
    @Test
    public void keepsTheEventsThatCountAView() {
        assertTrue(Analytics.keptEvent("minute-watched"));
        assertTrue(Analytics.keptEvent("clips_minute_watched"));
        assertTrue(Analytics.keptEvent("video-play"));
        assertTrue(Analytics.keptEvent("n_second_play"));
    }

    @Test
    public void otherEventsAreNotKept() {
        assertFalse(Analytics.keptEvent("screen_view"));
        assertFalse(Analytics.keptEvent("crashlytics_crash"));
        assertFalse(Analytics.keptEvent("video_play_anon"));
    }
}

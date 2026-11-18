package io.github.sabopura.morphe.extension.twitch.app;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class VideoQualityTest {
    @Test
    public void autoMeansTwitchDefault() {
        assertNull(VideoQuality.chosen("auto", "auto", false));
    }

    @Test
    public void meteredOnlyAppliesWhenMeteredAndLower() {
        assertEquals("720p", VideoQuality.chosen("720p", "480p", false));
        assertEquals("480p", VideoQuality.chosen("720p", "480p", true));
        assertEquals("720p", VideoQuality.chosen("720p", "1080p60", true));
        assertEquals("360p", VideoQuality.chosen("auto", "360p", true));
    }

    @Test
    public void unknownValuesFallBackToTwitch() {
        assertNull(VideoQuality.chosen("bogus", "auto", false));
    }

    @Test
    public void clipsUsePlainHeights() {
        assertEquals("source", VideoQuality.clipName("source"));
        assertEquals("720", VideoQuality.clipName("720p60"));
        assertEquals("240", VideoQuality.clipName("160p"));
    }
}

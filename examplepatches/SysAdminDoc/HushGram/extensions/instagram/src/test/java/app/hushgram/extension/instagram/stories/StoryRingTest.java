/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.stories;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;

import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;

/** What Story ring size makes of the size Instagram settles on for the stories row. */
@RunWith(RobolectricTestRunner.class)
public class StoryRingTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        Settings.STORY_RING.resetToDefault();
        Settings.STORY_RING_SCALE.resetToDefault();
    }

    /** Picking the patch turns its switch on, and the size starts as Instagram's, so the row is unchanged. */
    @Test
    public void picked_theRowKeepsInstagramsSize() {
        assertTrue(Settings.STORY_RING.get());
        assertEquals(StoryRingSize.INSTAGRAM, Settings.STORY_RING_SCALE.get());
        assertEquals(270f, StoryRing.size(270f), 0f);
    }

    @Test
    public void aChosenSizeScalesTheRow() {
        Settings.STORY_RING_SCALE.save(StoryRingSize.LARGEST);
        assertEquals(351f, StoryRing.size(270f), 0.01f);
        Settings.STORY_RING_SCALE.save(StoryRingSize.SMALLEST);
        assertEquals(189f, StoryRing.size(270f), 0.01f);
    }

    @Test
    public void withTheSwitchOffTheRowKeepsInstagramsSize() {
        Settings.STORY_RING_SCALE.save(StoryRingSize.LARGER);
        Settings.STORY_RING.save(false);
        assertEquals(270f, StoryRing.size(270f), 0f);
    }

    /** A size that isn't a size passes through as it came. */
    @Test
    public void noSizeIsLeftAsItIs() {
        Settings.STORY_RING_SCALE.save(StoryRingSize.LARGEST);
        assertEquals(0f, StoryRing.size(0f), 0f);
        assertEquals(-4f, StoryRing.size(-4f), 0f);
        assertTrue(Float.isNaN(StoryRing.size(Float.NaN)));
    }

    /** The shares the list offers, smallest first, with Instagram's in the middle. */
    @Test
    public void theSizesRunFromSmallestToLargest() {
        StoryRingSize[] sizes = StoryRingSize.values();
        for (int i = 1; i < sizes.length; i++) assertTrue(sizes[i - 1].scale < sizes[i].scale);
        assertEquals(StoryRingSize.INSTAGRAM, sizes[sizes.length / 2]);
        assertEquals(85, StoryRingSize.SMALLER.percent());
    }
}

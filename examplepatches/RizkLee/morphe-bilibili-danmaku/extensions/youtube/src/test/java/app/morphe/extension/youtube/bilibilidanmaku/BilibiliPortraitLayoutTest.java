package app.morphe.extension.youtube.bilibilidanmaku;

import static org.junit.Assert.*;
import org.junit.Test;

public class BilibiliPortraitLayoutTest {
    @Test public void portraitUsesMostOfTheScreenBetweenTitleAndControls() {
        float height = 2400f, density = 3f, lineHeight = 66f;
        float top = BilibiliPortraitLayout.top(height, density, 0);
        float bottom = BilibiliPortraitLayout.bottom(height, density);
        float area = BilibiliPortraitLayout.areaHeight(height, top, bottom, 75, lineHeight);
        int rows = BilibiliPortraitLayout.rowCount(area, lineHeight);
        assertTrue("Title row stays clear", top >= 88f * density);
        assertTrue("Seek bar and buttons stay clear", top + area <= height - bottom);
        assertTrue("Tracks should span most of a tall display", area > height * .6f);
        // Same track spacing as landscape: rows are packed with the plain line height.
        assertEquals((int) (area / lineHeight), rows);
    }

    @Test public void cutoutPushesTracksDown() {
        float density = 3f;
        assertTrue(BilibiliPortraitLayout.top(2400f, density, 130f) >= 130f + 64f * density);
    }

    @Test public void areaSettingStillLimitsTracks() {
        float height = 2400f, density = 3f;
        float top = BilibiliPortraitLayout.top(height, density, 0);
        float bottom = BilibiliPortraitLayout.bottom(height, density);
        assertEquals(height * .3f, BilibiliPortraitLayout.areaHeight(height, top, bottom, 30, 60f), .01f);
    }

    @Test public void smallAreasStillHaveOneTrack() {
        assertEquals(1, BilibiliPortraitLayout.rowCount(30f, 50f));
        assertEquals(BilibiliPortraitLayout.MAX_ROWS, BilibiliPortraitLayout.rowCount(100_000f, 10f));
    }
}

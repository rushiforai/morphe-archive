/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import android.graphics.drawable.ColorDrawable;
import android.view.View;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * The comment bar under an opened post (#171): a dark page fills it with the AMOLED color, so a
 * photo no longer shows through, and a light page keeps TikTok's see-through bar.
 */
@RunWith(RobolectricTestRunner.class)
public class AmoledInputBarTest {
    private static final int MOCHA = 0xFF181825;

    @Test
    @Config(qualifiers = "night")
    public void aDarkPageFillsTheBarWithTheChosenColor() {
        View bar = new View(RuntimeEnvironment.getApplication());
        AmoledInputBar.paint(bar, MOCHA);
        assertEquals(MOCHA, ((ColorDrawable) bar.getBackground()).getColor());
    }

    @Test
    @Config(qualifiers = "notnight")
    public void aLightPageKeepsTikToksBar() {
        View bar = new View(RuntimeEnvironment.getApplication());
        AmoledInputBar.paint(bar, MOCHA);
        assertNull(bar.getBackground());
    }

    @Test
    public void aMissingBarIsLeftAlone() {
        AmoledInputBar.paint(null, MOCHA);
    }
}

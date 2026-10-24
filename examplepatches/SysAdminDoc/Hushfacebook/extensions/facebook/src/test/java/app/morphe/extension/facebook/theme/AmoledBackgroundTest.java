/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * The Background color row (issue #214) takes the colours the patch's Background colour option
 * takes, with the same lightest step for each, so a colour typed in settings looks as it would
 * patched in. The numbers are AmoledBackgroundOptionTest's.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AmoledBackgroundTest {
    private static final int SAND = 0xFF5B513F;

    @Test
    public void theRowTakesTheOptionsColoursAndKeepsThemInOneForm() {
        assertEquals(Integer.valueOf(0xFF0D1117), AmoledBackground.colour("#0D1117"));
        assertEquals(Integer.valueOf(0xFF0D1117), AmoledBackground.colour(" 0d1117 "));
        assertEquals(Integer.valueOf(0xFF0D1117), AmoledBackground.colour("#FF0D1117"));
        assertEquals("#0D1117", AmoledBackground.stored(" #ff0d1117 "));
        assertEquals("a blank row leaves the patched colour", "", AmoledBackground.stored("  "));
        for (String refused : new String[] {"#800D1117", "#545454", "#FFFFFF", "black", "#0D111"}) {
            assertNull(refused, AmoledBackground.stored(refused));
        }
    }

    @Test
    public void eachColourGetsTheOptionsLightestStep() {
        assertEquals(AmoledTheme.LIGHTEST_STEP, AmoledBackground.lightestStep(0xFF3A3A3A));
        assertEquals(35, AmoledBackground.lightestStep(0xFF3B3B3B));
        assertEquals(11, AmoledBackground.lightestStep(0xFF535353));
        assertEquals(Integer.valueOf(0xFF535353), AmoledBackground.colour(AmoledBackground.LIGHTEST_ADMITTED_GREY));
        assertEquals(AmoledBackground.NONE, AmoledBackground.lightestStep(0xFF545454));
        assertEquals(12, AmoledBackground.lightestStep(SAND));
        assertArrayEquals(new int[] {SAND, 0xFF5F5543, 0xFF615746, 0xFF645A48}, AmoledBackground.surfaces(SAND, 12));
    }

    @Test
    public void aRefusedColourSaysWhy() {
        for (String taken : new String[] {null, "", "#000000", "#0D1117", "#5B513F", "#FF3B3B3B"}) {
            assertNull(taken, AmoledBackground.problem(taken));
        }
        assertTrue(AmoledBackground.problem("navy").contains("#RRGGBB"));
        assertTrue(AmoledBackground.problem("#123").contains("isn't a color"));
        assertTrue(AmoledBackground.problem("#800D1117").contains("see-through"));
        String tooLight = AmoledBackground.problem("#545454");
        assertTrue(tooLight, tooLight.contains("too light") && tooLight.contains(AmoledBackground.LIGHTEST_ADMITTED_GREY));
    }
}

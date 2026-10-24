/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * The Light background color row (issue #214) takes a colour Facebook's light text stays readable
 * on, and refuses the rest with what to pick instead. The surfaces it makes are AmoledThemeTest's.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AmoledLightBackgroundTest {
    private static final int CREAM = 0xFFFFF8E7;

    @Test
    public void theRowTakesLightColoursAndKeepsThemInOneForm() {
        assertEquals(Integer.valueOf(CREAM), AmoledLightBackground.colour("#FFF8E7"));
        assertEquals(Integer.valueOf(CREAM), AmoledLightBackground.colour(" fff8e7 "));
        assertEquals(Integer.valueOf(CREAM), AmoledLightBackground.colour("#FFFFF8E7"));
        assertEquals("a blank row is Facebook's white", Integer.valueOf(0xFFFFFFFF), AmoledLightBackground.colour("  "));
        assertEquals("#FFF8E7", AmoledLightBackground.stored(" #ffFFF8E7 "));
        assertEquals("a blank row leaves Facebook's white", "", AmoledLightBackground.stored("  "));
        for (String refused : new String[] {"#80FFF8E7", "#A5A5A5", "#979797", "#2D88FF", "#000000", "cream", "#FFF8E"}) {
            assertNull(refused, AmoledLightBackground.stored(refused));
        }
    }

    /**
     * The floor keeps secondary text darkened to 4.5:1 at 1.3:1 from the primary text, as the dark
     * row does, and #A6A6A6 is the darkest grey it takes. One step darker, #A5A5A5, reaches the floor,
     * but the whole step its secondary text darkens by leaves it 1.29:1 from the primary text.
     */
    @Test
    public void theDarkestGreyItTakesIsTheOneItNames() {
        assertEquals(0.25683, AmoledLightBackground.FLOOR, 0.00001);
        assertEquals(Integer.valueOf(0xFFA6A6A6), AmoledLightBackground.colour(AmoledLightBackground.DARKEST_ADMITTED_GREY));
        for (int value = 0; value <= 0xFF; value++) {
            int grey = 0xFF000000 | value * 0x010101;
            assertEquals(Integer.toHexString(grey), value >= 0xA6, AmoledLightBackground.admitted(grey));
        }
        assertNull("Facebook's blue is too dark", AmoledLightBackground.colour("#2D88FF"));
    }

    @Test
    public void facebooksGreysSitAsFarBelowTheColourAsBelowWhite() {
        assertEquals("white is the colour", CREAM, AmoledLightBackground.surface(CREAM, 0xFFFFFFFF));
        assertEquals("a comment's bubble", 0xFFF0EBDD, AmoledLightBackground.surface(CREAM, 0xFFF0F2F5));
        assertEquals("the wash", 0xFFC9C5B9, AmoledLightBackground.surface(CREAM, 0xFFC9CCD1));
        assertEquals("on the darkest grey", 0xFF97999C, AmoledLightBackground.surface(0xFFA6A6A6, 0xFFF0F2F5));
        assertEquals("stops at black", 0xFF000000, AmoledLightBackground.surface(0xFF0A0A0A, 0xFFC9CCD1));
    }

    /** The row fills Facebook's greys no darker than a grey button, the darkest grey with text on it. */
    @Test
    public void theRowFillsNoGreyDarkerThanAGreyButton() {
        assertEquals("white is the colour", CREAM, AmoledLightBackground.fill(CREAM, 0xFFFFFFFF));
        assertEquals("a comment's bubble", 0xFFF0EBDD, AmoledLightBackground.fill(CREAM, 0xFFF0F2F5));
        assertEquals("a grey button", 0xFFE2DED1, AmoledLightBackground.fill(CREAM, AmoledLightBackground.TEXT_SURFACE_GREY));
        assertEquals("the wash stops at the grey button", 0xFFE2DED1, AmoledLightBackground.fill(CREAM, 0xFFC9CCD1));
    }

    @Test
    public void aRefusedColourSaysWhy() {
        for (String taken : new String[] {null, "", "#FFF8E7", "#FFFFFF", "#A6A6A6", "#FFFFF8E7"}) {
            assertNull(taken, AmoledLightBackground.problem(taken));
        }
        assertTrue(AmoledLightBackground.problem("cream").contains("#RRGGBB"));
        assertTrue(AmoledLightBackground.problem("#FFF").contains("isn't a color"));
        assertTrue(AmoledLightBackground.problem("#80FFF8E7").contains("see-through"));
        String tooDark = AmoledLightBackground.problem("#2D88FF");
        assertTrue(tooDark, tooDark.contains("too dark") && tooDark.contains(AmoledLightBackground.DARKEST_ADMITTED_GREY));
    }
}

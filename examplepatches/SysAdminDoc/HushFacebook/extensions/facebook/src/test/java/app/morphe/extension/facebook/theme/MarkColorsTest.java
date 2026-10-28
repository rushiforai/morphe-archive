/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** Badge and logo colors (#263): which colours the picked codes replace, and which codes the rows take. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MarkColorsTest {
    private static final int FACEBOOK_RED = 0xFFE41E3F;
    private static final int FACEBOOK_BLUE = 0xFF0866FF;

    @Test
    public void aPickedBadgeColorTakesTheBadgeTokenOnly() {
        assertEquals(0xFF2ECC71, MarkColors.fds(FACEBOOK_RED, "NOTIFICATION_BADGE", "#2ECC71", ""));
        assertEquals("another red keeps Facebook's", FACEBOOK_RED,
                MarkColors.fds(FACEBOOK_RED, "DECORATIVE_ICON_RED", "#2ECC71", ""));
        assertEquals("the logo's pick isn't the badge's", FACEBOOK_RED,
                MarkColors.fds(FACEBOOK_RED, "NOTIFICATION_BADGE", "", "#2ECC71"));
    }

    @Test
    public void aPickedLogoColorTakesTheWordmarkAndTheLogo() {
        assertEquals(0xFFFF00AA, MarkColors.fds(FACEBOOK_BLUE, "FB_WORDMARK", "", "#FF00AA"));
        assertEquals(0xFFFF00AA, MarkColors.fds(FACEBOOK_BLUE, "FB_LOGO", "", "#FF00AA"));
        assertEquals("a link's blue keeps Facebook's", FACEBOOK_BLUE,
                MarkColors.fds(FACEBOOK_BLUE, "BLUE_LINK", "", "#FF00AA"));
    }

    @Test
    public void blankOrRefusedCodesKeepFacebooksColor() {
        assertEquals(FACEBOOK_RED, MarkColors.fds(FACEBOOK_RED, "NOTIFICATION_BADGE", "", ""));
        assertEquals(FACEBOOK_RED, MarkColors.fds(FACEBOOK_RED, "NOTIFICATION_BADGE", null, null));
        assertEquals(FACEBOOK_RED, MarkColors.fds(FACEBOOK_RED, "NOTIFICATION_BADGE", "green", ""));
        assertEquals(FACEBOOK_RED, MarkColors.fds(FACEBOOK_RED, "NOTIFICATION_BADGE", "#802ECC71", ""));
    }

    @Test
    public void thePickKeepsFacebooksAlpha() {
        assertEquals(0x802ECC71, MarkColors.fds(0x80E41E3F, "NOTIFICATION_BADGE", "#2ECC71", ""));
    }

    @Test
    public void theRowsKeepCodesInCapitals() {
        assertEquals("", MarkColors.stored("  "));
        assertEquals("#2ECC71", MarkColors.stored(" 2ecc71 "));
        assertEquals("#2ECC71", MarkColors.stored("#FF2ECC71"));
        assertNull(MarkColors.stored("#802ECC71"));
        assertNull(MarkColors.stored("green"));
        assertNull(MarkColors.problem(""));
        assertNull(MarkColors.problem("#2ECC71"));
        assertNotNull(MarkColors.problem("green"));
        assertNotNull(MarkColors.problem("#802ECC71"));
    }
}

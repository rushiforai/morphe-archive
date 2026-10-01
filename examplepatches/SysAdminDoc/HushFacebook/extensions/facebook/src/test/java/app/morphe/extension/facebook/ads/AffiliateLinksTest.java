/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Hide affiliate product links: with the switch on, each of the three places gets the answer it
 * gets for a post with no shop link, and each card is counted under its place; a post with no card
 * keeps Facebook's answer. Off or paused, every card stays.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AffiliateLinksTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final Object CARD = new Object();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_AFFILIATE_LINKS.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.AFFILIATE_LINKS + ":")) return line;
        }
        return null;
    }

    @Test
    public void everyCardIsAnsweredAwayAndNoCardStaysNone() {
        assertTrue("the switch doesn't start on", Settings.HIDE_AFFILIATE_LINKS.get());
        assertFalse("a reel kept its product card", AffiliateLinks.keepReelCard(true));
        assertNull("a feed post kept its product footer", AffiliateLinks.keepFooter("affiliate_footer"));
        assertNull("the comment sheet kept its product card", AffiliateLinks.keepCommentCard(CARD));
        assertFalse("a reel without a card got one", AffiliateLinks.keepReelCard(false));
        assertNull(AffiliateLinks.keepFooter(null));
        assertNull(AffiliateLinks.keepCommentCard(null));
        assertEquals(FamilyNames.AFFILIATE_LINKS + ": invoked 6, 3 found, 0 missing. Counted: "
                + AffiliateLinks.REEL_CARD + " 1, " + AffiliateLinks.FEED_CARD + " 1, "
                + AffiliateLinks.COMMENT_CARD + " 1", statusLine());
    }

    @Test
    public void offOrPausedEveryCardStays() {
        Settings.HIDE_AFFILIATE_LINKS.save(false);
        assertTrue(AffiliateLinks.keepReelCard(true));
        assertEquals("affiliate_footer", AffiliateLinks.keepFooter("affiliate_footer"));
        assertSame(CARD, AffiliateLinks.keepCommentCard(CARD));
        Settings.HIDE_AFFILIATE_LINKS.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            assertTrue("a Hushfacebook paused by " + reason + " hid a reel's card", AffiliateLinks.keepReelCard(true));
            assertEquals("a Hushfacebook paused by " + reason + " hid a post's card",
                    "affiliate_footer", AffiliateLinks.keepFooter("affiliate_footer"));
            assertSame("a Hushfacebook paused by " + reason + " hid the comment sheet's card",
                    CARD, AffiliateLinks.keepCommentCard(CARD));
            PauseForTests.resume();
        }
    }

    /** The patch hands Facebook's answer over as an int, since a boolean method may return one. */
    @Test
    public void thePatchsIntEntryReadsNonZeroAsYes() {
        assertFalse("a reel's card handed over as 1 stayed", AffiliateLinks.keepReelCard(1));
        assertFalse(AffiliateLinks.keepReelCard(0));
        Settings.HIDE_AFFILIATE_LINKS.save(false);
        assertTrue("with the switch off, 1 lost Facebook's yes", AffiliateLinks.keepReelCard(1));
        assertFalse(AffiliateLinks.keepReelCard(0));
    }
}

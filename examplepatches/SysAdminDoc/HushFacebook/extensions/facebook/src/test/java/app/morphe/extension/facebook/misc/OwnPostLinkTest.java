/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
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
 * Sanitize sharing links' own-link switch (#98): on, a share hands out the post's own address in
 * place of the facebook.com/share/ link Facebook keeps for it; off, paused or before the settings
 * are ready, the link is Facebook's. With no /share/ link, or no own address to give, nothing
 * changes either way.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class OwnPostLinkTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String SHARE = "https://www.facebook.com/share/p/1EtN3asFKy/";
    private static final String OWN = "https://www.facebook.com/story.php?story_fbid=1674727604699253&id=100064860875397";

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.SHARE_POST_OWN_LINK.resetToDefault();
        OwnPostLink.forgetForTests();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.SANITIZE_SHARING_LINKS + ":")) return line;
        }
        return "";
    }

    @Test
    public void theSwitchStartsOffAndOffTheShareLinkStays() {
        assertFalse(Settings.SHARE_POST_OWN_LINK.defaultValue);
        assertSame(SHARE, OwnPostLink.shareLink(SHARE, OWN));
    }

    @Test
    public void onThePostsOwnLinkGoesOut() {
        Settings.SHARE_POST_OWN_LINK.save(true);
        assertSame(OWN, OwnPostLink.shareLink(SHARE, OWN));
        String line = statusLine();
        assertTrue(line, line.contains(OwnPostLink.OWN_LINK_GIVEN + " 1"));
    }

    @Test
    public void onWithoutAShareLinkFacebooksAnswerStays() {
        Settings.SHARE_POST_OWN_LINK.save(true);
        // Facebook returns the own address itself when its cache has nothing.
        assertNull(OwnPostLink.shareLink(null, OWN));
        assertEquals("", OwnPostLink.shareLink("", OWN));
        assertFalse(statusLine().contains(OwnPostLink.OWN_LINK_GIVEN));
    }

    @Test
    public void onWithoutAnOwnAddressTheShareLinkStays() {
        Settings.SHARE_POST_OWN_LINK.save(true);
        assertSame(SHARE, OwnPostLink.shareLink(SHARE, null));
        assertSame(SHARE, OwnPostLink.shareLink(SHARE, ""));
        assertSame(SHARE, OwnPostLink.shareLink(SHARE, "fb://story/1674727604699253"));
        assertFalse(statusLine().contains(OwnPostLink.OWN_LINK_GIVEN));
    }

    @Test
    public void webLinksAreHttpOrHttpsInAnyCase() {
        assertTrue(OwnPostLink.isWebLink("HTTPS://www.facebook.com/reel/1/"));
        assertTrue(OwnPostLink.isWebLink("http://facebook.com/1"));
        assertFalse(OwnPostLink.isWebLink("www.facebook.com/1"));
        assertFalse(OwnPostLink.isWebLink(null));
    }

    @Test
    public void pausedTheShareLinkComesBack() {
        Settings.SHARE_POST_OWN_LINK.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertSame(SHARE, OwnPostLink.shareLink(SHARE, OWN));
        PauseForTests.resume();
        assertSame(OWN, OwnPostLink.shareLink(SHARE, OWN));
    }

    @Test
    public void beforeTheSettingsAreReadyTheShareLinkStays() {
        Settings.SHARE_POST_OWN_LINK.save(true);
        SettingsContextRule.withoutContext(() -> assertSame(SHARE, OwnPostLink.shareLink(SHARE, OWN)));
    }
}

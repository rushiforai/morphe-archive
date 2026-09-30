/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import com.facebook.feed.tab.FeedTab;
import com.facebook.video.videohome.tab.WatchTab;

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
 * Hide the Reels tab dot: with the switch on, the jewel controller's count for the Reels tab is
 * answered with none and counted; another tab, or no tab, keeps Facebook's count. Off or paused,
 * every tab does.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReelsTabDotTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_REELS_TAB_DOT.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.REELS_TAB_DOT + ":")) return line;
        }
        return null;
    }

    @Test
    public void onlyTheReelsTabLosesItsCount() {
        assertTrue("the switch doesn't start on", Settings.HIDE_REELS_TAB_DOT.get());
        assertTrue(ReelsTabDot.clear(new WatchTab()));
        assertFalse("another tab lost its count", ReelsTabDot.clear(new FeedTab()));
        assertFalse("no tab lost a count", ReelsTabDot.clear(null));
        assertEquals(FamilyNames.REELS_TAB_DOT + ": invoked 3, 1 found, 0 missing. Counted: "
                + ReelsTabDot.CLEARED + " 1", statusLine());
    }

    @Test
    public void offOrPausedTheReelsTabKeepsItsCount() {
        Settings.HIDE_REELS_TAB_DOT.save(false);
        assertFalse(ReelsTabDot.clear(new WatchTab()));
        Settings.HIDE_REELS_TAB_DOT.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            assertFalse("a Hushfacebook paused by " + reason + " cleared the count", ReelsTabDot.clear(new WatchTab()));
            PauseForTests.resume();
        }
    }
}

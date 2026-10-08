/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import com.facebook.api.feedtype.FeedType;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.PatchFamily;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Following feed on Home: with the switch on, Home's feed type comes back as the Following feed's,
 * counted, while every other feed type, the Feeds tab's filters among them, comes back as it was.
 * Off, paused, or before the settings are ready, Home keeps its own.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class FollowingHomeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.FOLLOWING_FEED_HOME.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.FOLLOWING_HOME + ":")) return line;
        }
        return null;
    }

    @Test
    public void onHomeAsksForTheFollowingFeedAndOtherFeedsStay() {
        Settings.FOLLOWING_FEED_HOME.save(true);
        assertSame("Home kept the ranked feed", FeedType.FOLLOWING_FEED, FollowingHome.feedType(FeedType.TOP_STORIES));
        assertSame("a second request went out for the ranked feed",
                FeedType.FOLLOWING_FEED, FollowingHome.feedType(FeedType.TOP_STORIES));
        for (FeedType filter : new FeedType[] {FeedType.FAVORITES, FeedType.MOST_RECENT, FeedType.MOST_RECENT_ALL,
                FeedType.MOST_RECENT_FRIEND, FeedType.FOLLOWING_FEED}) {
            assertSame("the " + filter + " feed was changed", filter, FollowingHome.feedType(filter));
        }
        assertNull("no feed type came back as one", FollowingHome.feedType(null));
        assertEquals(FamilyNames.FOLLOWING_HOME + ": invoked 8, 1 found, 0 missing. Counted: "
                + FollowingHome.SWAPPED + " 2", statusLine());
    }

    @Test
    public void offOrPausedHomeKeepsItsOwnFeed() {
        assertFalse("the switch doesn't start off", Settings.FOLLOWING_FEED_HOME.get());
        assertSame("off, Home asked for the Following feed", FeedType.TOP_STORIES, FollowingHome.feedType(FeedType.TOP_STORIES));

        Settings.FOLLOWING_FEED_HOME.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(reason);
            assertSame("a Hushfacebook paused by " + reason + " changed Home's feed",
                    FeedType.TOP_STORIES, FollowingHome.feedType(FeedType.TOP_STORIES));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertSame("Home's feed changed before the settings were ready",
                FeedType.TOP_STORIES, FollowingHome.feedType(FeedType.TOP_STORIES)));

        String line = statusLine();
        assertFalse("a request left to Facebook was counted: " + line, line != null && line.contains("Counted"));
        assertSame("on again after the pause, Home kept the ranked feed",
                FeedType.FOLLOWING_FEED, FollowingHome.feedType(FeedType.TOP_STORIES));
    }

    @Test
    public void theSwitchNeedsNoRestartAndTravelsWithItsFamily() {
        assertFalse("Home asks for its feed on every load, so no restart is needed", Settings.FOLLOWING_FEED_HOME.rebootApp);
        assertNull("nothing asks before the switch changes", Settings.FOLLOWING_FEED_HOME.userDialogMessage);
        assertTrue("Pause and the report don't know the switch",
                PatchFamily.FOLLOWING_HOME.switches.contains(Settings.FOLLOWING_FEED_HOME));
    }
}

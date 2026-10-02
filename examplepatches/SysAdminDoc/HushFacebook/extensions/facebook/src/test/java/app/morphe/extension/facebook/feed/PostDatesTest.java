/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
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
 * Keep post dates: with the switch on, a post header's yes to rotating its subtitle is answered as
 * a no, and counted, and its no stays a no. Off or paused, Facebook's yes stands.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PostDatesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.KEEP_POST_DATES.resetToDefault();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.POST_DATES + ":")) return line;
        }
        return null;
    }

    @Test
    public void aHeaderThatWouldRotateKeepsTheOneLine() {
        assertTrue("the switch doesn't start on", Settings.KEEP_POST_DATES.get());
        assertFalse("the header still rotates its subtitle", PostDates.cycling(true));
        assertFalse("a header that doesn't rotate was made to", PostDates.cycling(false));
        assertEquals(FamilyNames.POST_DATES + ": invoked 2, 1 found, 0 missing. Counted: "
                + PostDates.ONE_LINE + " 1", statusLine());
    }

    @Test
    public void offOrPausedFacebooksRotationStands() {
        Settings.KEEP_POST_DATES.save(false);
        assertTrue(PostDates.cycling(true));
        assertFalse(PostDates.cycling(false));
        Settings.KEEP_POST_DATES.save(true);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            assertTrue("a Hushfacebook paused by " + reason + " kept the header from rotating", PostDates.cycling(true));
            PauseForTests.resume();
        }
        assertEquals(FamilyNames.POST_DATES + ": invoked 4, 1 found, 0 missing", statusLine());
    }
}

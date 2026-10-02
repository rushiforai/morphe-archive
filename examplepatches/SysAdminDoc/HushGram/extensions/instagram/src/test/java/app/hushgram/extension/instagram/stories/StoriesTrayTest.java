/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.stories;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;

import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;

/** What Hide suggested stories takes out of Home's stories tray, and when it hides the tray. */
@RunWith(RobolectricTestRunner.class)
public class StoriesTrayTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Named like 449's reel types. */
    enum ReelType { USER_REEL, HIGHLIGHT_REEL, SUGGESTED_USER, SUGGESTED_USER_REEL, SUGGESTED_CREATOR_REEL }

    /** A tray item keeping its reel type in an enum field, as 449's ReelResponseItem does. */
    static final class TrayItem {
        final ReelType reelType;

        TrayItem(ReelType reelType) {
            this.reelType = reelType;
        }
    }

    @Test
    public void suggestedStoriesAreTakenOut() {
        assertNull(StoriesTray.filter(new TrayItem(ReelType.SUGGESTED_USER_REEL)));
        assertNull(StoriesTray.filter(new TrayItem(ReelType.SUGGESTED_USER)));
        assertNull(StoriesTray.filter(new TrayItem(ReelType.SUGGESTED_CREATOR_REEL)));
    }

    @Test
    public void storiesFromAccountsYouFollowStay() {
        TrayItem followed = new TrayItem(ReelType.USER_REEL);
        TrayItem highlight = new TrayItem(ReelType.HIGHLIGHT_REEL);
        assertSame(followed, StoriesTray.filter(followed));
        assertSame(highlight, StoriesTray.filter(highlight));
        assertNull(StoriesTray.filter(null));
    }

    @Test
    public void withTheSwitchOffSuggestedStoriesStay() {
        Settings.HIDE_SUGGESTED_STORIES.save(false);
        try {
            TrayItem suggested = new TrayItem(ReelType.SUGGESTED_USER_REEL);
            assertSame(suggested, StoriesTray.filter(suggested));
        } finally {
            Settings.HIDE_SUGGESTED_STORIES.save(true);
        }
    }

    /** The whole tray stays until its own switch, off to start, is turned on. */
    @Test
    public void theTrayStaysUntilItsSwitchIsOn() {
        assertFalse(StoriesTray.hideTray());
        Settings.HIDE_STORIES_TRAY.save(true);
        try {
            assertTrue(StoriesTray.hideTray());
        } finally {
            Settings.HIDE_STORIES_TRAY.save(false);
        }
    }
}

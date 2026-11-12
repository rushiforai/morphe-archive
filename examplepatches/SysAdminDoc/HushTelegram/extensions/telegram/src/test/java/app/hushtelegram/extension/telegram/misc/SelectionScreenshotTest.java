/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.graphics.Rect;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.Arrays;
import java.util.Collections;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SelectionScreenshotTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** The chat's list, under a 100 pixel top bar on a 1080 by 2000 screen. */
    private static final Rect LIST = new Rect(0, 100, 1080, 2000);

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.SELECTION_SCREENSHOT);
        SettingReadsForTests.mend(Settings.SELECT_BETWEEN);
        SettingReadsForTests.mend(Settings.ALLOW_SCREENSHOTS);
        Settings.SELECTION_SCREENSHOT.resetToDefault();
        Settings.SELECT_BETWEEN.resetToDefault();
        Settings.ALLOW_SCREENSHOTS.resetToDefault();
        PatchFamilyForTests.resetCapabilities();
        HookStatus.clear();
    }

    @Test public void theBandRunsTheListsWidthFromTheHighestMessageToTheLowest() {
        // A narrow outgoing bubble low down and a wide incoming one higher up, with whatever sits between them.
        Rect band = SelectionScreenshot.band(LIST, Arrays.asList(new Rect(600, 1400, 1060, 1600), new Rect(20, 500, 900, 700)));
        assertEquals(new Rect(0, 500, 1080, 1600), band);
    }

    @Test public void aMessageHalfUnderTheTopBarIsCutAtTheList() {
        Rect band = SelectionScreenshot.band(LIST, Arrays.asList(new Rect(0, 40, 1080, 300), new Rect(0, 1900, 1080, 2100)));
        assertEquals(new Rect(0, 100, 1080, 2000), band);
    }

    @Test public void aMessageScrolledOffTheListMeansNoPicture() {
        assertNull(SelectionScreenshot.band(LIST, Arrays.asList(new Rect(0, 500, 1080, 700), new Rect(0, 2100, 1080, 2300))));
        assertNull(SelectionScreenshot.band(LIST, Collections.<Rect>emptyList()));
    }

    @Test public void offByDefaultTheButtonsTapIsStillKeptFromTelegram() {
        assertFalse(Settings.SELECTION_SCREENSHOT.get());
        assertFalse(SelectionScreenshot.on());
        // Telegram's own handler never sees the button's number, even with the switch off.
        assertEquals(SelectBetween.TAKEN, SelectBetween.clicked(new Object(), SelectionScreenshot.ITEM));
    }

    @Test public void theSwitchAloneDoesNothingWhenThePatchCouldNotPutTheButtonIn() {
        Settings.SELECTION_SCREENSHOT.save(true);
        PatchFamilyForTests.installed(PatchFamily.Capability.SELECT_BETWEEN);
        assertFalse(SelectionScreenshot.on());
        PatchFamilyForTests.installed(PatchFamily.Capability.SELECT_BETWEEN, PatchFamily.Capability.SELECTION_SCREENSHOT);
        assertTrue(SelectionScreenshot.on());
    }

    @Test public void onWithNothingSelectedTheTapIsTakenAndNothingIsTried() {
        Settings.SELECTION_SCREENSHOT.save(true);
        PatchFamilyForTests.installed(PatchFamily.Capability.SELECTION_SCREENSHOT);
        // The stubs answer nothing off a patched app, so no messages are selected and no picture is taken.
        assertEquals(SelectBetween.TAKEN, SelectBetween.clicked(new Object(), SelectionScreenshot.ITEM));
        // Select between's own button and Telegram's buttons are untouched.
        assertEquals(7, SelectBetween.clicked(new Object(), 7));
        SelectBetween.addItem(new Object());
    }

    @Test public void secretChatsAreRefusedEvenWithAllowScreenshotsOn() {
        // Off a patched app every message reads as secret, the safe answer.
        Settings.ALLOW_SCREENSHOTS.save(true);
        assertEquals("Not in secret chats", SelectionScreenshot.refusal(Collections.singletonList(new Object())));
        assertNull(SelectionScreenshot.refusal(Collections.emptyList()));
    }
}

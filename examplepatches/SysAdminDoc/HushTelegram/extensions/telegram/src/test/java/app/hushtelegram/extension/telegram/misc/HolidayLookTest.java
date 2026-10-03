/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Collections;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HolidayLookTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        settle();
    }

    @After public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HOLIDAY_LOOK);
        settle();
    }

    /** The switch at its default, any look this process showed put back, and no counts. */
    private static void settle() {
        Settings.HOLIDAY_LOOK.resetToDefault();
        if (HolidayLook.mode() != HolidayLook.STOCK) assertEquals(HolidayLook.STOCK, HolidayLook.mode());
        HookStatus.clear();
    }

    @Test public void telegramKeepsItsOwnDatesAsShipped() {
        assertFalse(Settings.HOLIDAY_LOOK.get());
        assertEquals(HolidayLook.STOCK, HolidayLook.mode());
        assertEquals(HolidayLook.STOCK, HolidayLook.mode());
        assertEquals(Collections.singletonList("Holiday look all year: invoked 2, 0 found, 0 missing"), HookStatus.report());
    }

    @Test public void switchedOnTheLookShowsOnEveryCheckAndCountsOnce() {
        Settings.HOLIDAY_LOOK.save(true);
        for (int frame = 0; frame < 3; frame++) assertEquals(HolidayLook.SHOW, HolidayLook.mode());
        assertEquals(Collections.singletonList("Holiday look all year: invoked 3, 0 found, 0 missing. "
                + "Counted: holiday look shown 1"), HookStatus.report());
    }

    @Test public void switchedOffTheLookIsPutBackOnceThenTelegramDecides() {
        Settings.HOLIDAY_LOOK.save(true);
        assertEquals(HolidayLook.SHOW, HolidayLook.mode());
        Settings.HOLIDAY_LOOK.save(false);
        assertEquals(HolidayLook.RESTORE, HolidayLook.mode());
        assertEquals(HolidayLook.STOCK, HolidayLook.mode());
        assertEquals(Collections.singletonList("Holiday look all year: invoked 3, 0 found, 0 missing. "
                + "Counted: holiday look shown 1, holiday look restored 1"), HookStatus.report());
        Settings.HOLIDAY_LOOK.save(true);
        assertEquals(HolidayLook.SHOW, HolidayLook.mode());
    }

    @Test public void everyPauseReasonPutsTheLookBackAndResumeShowsItAgain() {
        Settings.HOLIDAY_LOOK.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            assertEquals(reason.name(), HolidayLook.SHOW, HolidayLook.mode());
            PauseForTests.pause(reason);
            assertEquals(reason.name(), HolidayLook.RESTORE, HolidayLook.mode());
            assertEquals(reason.name(), HolidayLook.STOCK, HolidayLook.mode());
            PauseForTests.resume();
        }
        assertEquals(HolidayLook.SHOW, HolidayLook.mode());
    }

    @Test public void unavailableSettingsLeaveTelegramsCheckAlone() {
        Settings.HOLIDAY_LOOK.save(true);
        SettingsContextRule.withoutContext(() -> assertEquals(HolidayLook.STOCK, HolidayLook.mode()));
    }

    @Test public void unreadableSettingFailsOpenAndReportsItsStateFailure() {
        Settings.HOLIDAY_LOOK.save(true);
        assertEquals(HolidayLook.SHOW, HolidayLook.mode());
        SettingReadsForTests.breakReads(Settings.HOLIDAY_LOOK);
        assertEquals(HolidayLook.RESTORE, HolidayLook.mode());
        assertEquals(HolidayLook.STOCK, HolidayLook.mode());
        assertEquals(Collections.singletonList("a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.HOLIDAY_LOOK));
    }
}

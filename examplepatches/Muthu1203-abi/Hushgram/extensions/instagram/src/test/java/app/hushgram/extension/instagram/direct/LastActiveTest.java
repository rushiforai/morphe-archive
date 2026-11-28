/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.direct;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

/**
 * What stands in for Instagram's "Active 3h ago": the exact time while the switch is on, and null,
 * which keeps Instagram's own text, otherwise.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class LastActiveTest {
    private static final String ZONE = "America/New_York";
    private static final long MINUTE = 60L * 1000;
    private static final long HOUR = 60 * MINUTE;
    private static final long DAY = 24 * HOUR;

    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private Locale locale;
    private TimeZone zone;
    private Context context;
    /** Oct 9, 2026, 6:15 PM in New York. */
    private long now;

    @Before
    public void enable() {
        locale = Locale.getDefault();
        zone = TimeZone.getDefault();
        Locale.setDefault(Locale.US);
        TimeZone.setDefault(TimeZone.getTimeZone(ZONE));
        context = RuntimeEnvironment.getApplication();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        Settings.SHOW_LAST_ACTIVE.save(true);
        HookStatus.clear();
        now = at(9, 18, 15);
        hourSetting("12");
    }

    @After
    public void restore() {
        hourSetting(null);
        Locale.setDefault(locale);
        TimeZone.setDefault(zone);
        Settings.SHOW_LAST_ACTIVE.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        HookStatus.clear();
    }

    @Test
    public void todayGetsTheTimeOnAnyHourSetting() {
        assertEquals("Active at 3:42 PM", plain(LastActive.exact(at(9, 15, 42), now)));
        hourSetting("24");
        assertEquals("Active at 15:42", plain(LastActive.exact(at(9, 15, 42), now)));
        assertEquals("Active at 00:05", plain(LastActive.exact(at(9, 0, 5), now)));
        assertTrue(HookStatus.missing(FamilyNames.LAST_ACTIVE).toString(), HookStatus.missing(FamilyNames.LAST_ACTIVE).isEmpty());
    }

    @Test
    public void yesterdayGetsYesterdayAndTheTime() {
        assertEquals("Active yesterday at 9:10 PM", plain(LastActive.exact(at(8, 21, 10), now)));
        // Just past midnight is still yesterday, though it's under a day and a half from now.
        assertEquals("Active yesterday at 12:01 AM", plain(LastActive.exact(at(8, 0, 1), now)));
        hourSetting("24");
        assertEquals("Active yesterday at 21:10", plain(LastActive.exact(at(8, 21, 10), now)));
    }

    @Test
    public void earlierInTheWeekGetsTheDateAndTime() {
        assertEquals("Active Oct 6 at 3:42 PM", plain(LastActive.exact(at(6, 15, 42), now)));
        hourSetting("24");
        assertEquals("Active Oct 3 at 18:20", plain(LastActive.exact(at(3, 18, 20), now)));
    }

    @Test
    public void aTimeSevenDaysBackOrMoreKeepsInstagramsNothing() {
        assertNotNull(LastActive.exact(now - 7 * DAY + MINUTE, now));
        assertNull(LastActive.exact(now - 7 * DAY - MINUTE, now));
        assertNull(LastActive.exact(now - 30 * DAY, now));
    }

    /** Instagram answers Active now itself and never asks, and a time that close is left to it however it's asked. */
    @Test
    public void activeNowIsLeftToInstagram() {
        assertNull(LastActive.exact(now, now));
        assertNull(LastActive.exact(now - MINUTE, now));
        assertNull(LastActive.exact(now - 4 * MINUTE, now));
        assertNotNull(LastActive.exact(now - 6 * MINUTE, now));
    }

    @Test
    public void aMissingOrImpossibleTimeKeepsInstagramsText() {
        assertNull(LastActive.exact(0L, now));
        assertNull(LastActive.exact(-1L, now));
        assertNull(LastActive.exact(Long.MIN_VALUE, now));
        assertNull("in the future", LastActive.exact(now + HOUR, now));
        assertNull(LastActive.exact(Long.MAX_VALUE, now));
    }

    @Test
    public void offPausedAndUnreadyKeepInstagramsText() {
        long then = at(9, 15, 42);
        assertNotNull(LastActive.exact(then, now));

        Settings.SHOW_LAST_ACTIVE.save(false);
        assertNull(LastActive.exact(then, now));
        Settings.SHOW_LAST_ACTIVE.save(true);

        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertNull(LastActive.exact(then, now));
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();

        SettingsContextRule.withoutContext(() -> assertNull(LastActive.exact(then, now)));
        assertNotNull("back on", LastActive.exact(then, now));
    }

    /** The injected call has no clock argument: it reads the phone's. */
    @Test
    public void theHookReadsThePhonesClock() {
        long hourAgo = System.currentTimeMillis() - HOUR;
        assertNotNull(LastActive.exact(hourAgo));
        assertNull(LastActive.exact(System.currentTimeMillis()));
        assertNull(LastActive.exact(System.currentTimeMillis() - 30 * DAY));
    }

    /** Off, paused or unready, the hook is counted as reached and nothing is formatted, so nothing is bound. */
    @Test
    public void offPausedAndUnreadyFormatNothing() {
        HookStatus.clear();
        long then = at(9, 15, 42);
        Settings.SHOW_LAST_ACTIVE.save(false);
        assertNull(LastActive.exact(then, now));
        Settings.SHOW_LAST_ACTIVE.save(true);
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertNull(LastActive.exact(then, now));
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() -> assertNull(LastActive.exact(then, now)));
        assertEquals(FamilyNames.LAST_ACTIVE + ": invoked 3, 0 found, 0 missing", report());

        assertNotNull(LastActive.exact(then, now));
        assertEquals(FamilyNames.LAST_ACTIVE + ": invoked 4, 1 found, 0 missing", report());
    }

    private static String report() {
        for (String line : HookStatus.report()) if (line.startsWith(FamilyNames.LAST_ACTIVE)) return line;
        throw new AssertionError("no line for the family in " + HookStatus.report());
    }

    /** Oct [day], 2026 at [hour]:[minute] in New York, in milliseconds. */
    private static long at(int day, int hour, int minute) {
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone(ZONE), Locale.US);
        calendar.clear();
        calendar.set(2026, Calendar.OCTOBER, day, hour, minute, 30);
        return calendar.getTimeInMillis();
    }

    private static void hourSetting(String value) {
        android.provider.Settings.System.putString(RuntimeEnvironment.getApplication().getContentResolver(),
                android.provider.Settings.System.TIME_12_24, value);
    }

    /** Newer ICU puts a narrow no-break space before PM; the words are what's checked. */
    private static String plain(String label) {
        assertNotNull("no label", label);
        return label.replace(' ', ' ').replace(' ', ' ');
    }
}

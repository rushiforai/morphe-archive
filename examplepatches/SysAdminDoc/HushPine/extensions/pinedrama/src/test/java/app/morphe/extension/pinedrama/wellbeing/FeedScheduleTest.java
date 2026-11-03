package app.morphe.extension.pinedrama.wellbeing;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.PausedProcess;
import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.settings.Settings;

import java.util.BitSet;
import java.util.Calendar;
import java.util.TimeZone;
import java.util.concurrent.atomic.AtomicLong;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * The feed lock's weekly hours, read on the phone's wall clock: start in, end out, overlaps
 * merged, past midnight into the next day, the clocks changing either way, and a new zone.
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28, qualifiers = "en")
public class FeedScheduleTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final TimeZone NEW_YORK = TimeZone.getTimeZone("America/New_York");
    private static final TimeZone TOKYO = TimeZone.getTimeZone("Asia/Tokyo");
    private final AtomicLong now = new AtomicLong();

    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        Settings.FEED_LOCK.resetToDefault();
        Settings.FEED_LOCK_HOURS.resetToDefault();
        FeedSchedule.resetForTests();
        FeedLock.resetForTests();
        FeedSchedule.setClockForTests(now::get, NEW_YORK);
    }

    @After public void tearDown() {
        Settings.FEED_LOCK.resetToDefault();
        Settings.FEED_LOCK_HOURS.resetToDefault();
        FeedSchedule.resetForTests();
        FeedLock.resetForTests();
        PausedProcess.set(false);
    }

    /** A wall-clock moment in New York. 2026-10-26 is a Monday. */
    private static long local(int month, int day, int hour, int minute) {
        Calendar calendar = Calendar.getInstance(NEW_YORK);
        calendar.clear();
        calendar.set(2026, month, day, hour, minute, 0);
        return calendar.getTimeInMillis();
    }

    private static long utc(int month, int day, int hour, int minute) {
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
        calendar.clear();
        calendar.set(2026, month, day, hour, minute, 0);
        return calendar.getTimeInMillis();
    }

    @Test public void overlappingHoursMergeAndSundayNightCarriesIntoMonday() {
        FeedSchedule.Hours hours = FeedSchedule.parse("Mon 10:00-12:00; Mon 11:00-13:00\nSun 22-2");
        assertNull(hours.problem);
        long mid = local(Calendar.OCTOBER, 26, 10, 30);
        assertEquals("the merged hours ended at the first one's end",
                local(Calendar.OCTOBER, 26, 13, 0), FeedSchedule.nextChange(hours.minutes, mid, NEW_YORK));
        // Sunday 22:00 to Monday 02:00, across the end of the week.
        assertTrue(hours.minutes.get(1));
        assertFalse(hours.minutes.get(2 * 60));
        assertTrue(hours.minutes.get(FeedSchedule.MINUTES_PER_WEEK - 1));
    }

    @Test public void daysCanBeNamedEveryWayOrLeftOut() {
        BitSet every = FeedSchedule.parse("22:00-23:00").minutes;
        BitSet named = FeedSchedule.parse("Mon-Sun 22:00-23:00").minutes;
        BitSet wrapped = FeedSchedule.parse("Fri-Thu 22:00-23:00").minutes;
        BitSet listed = FeedSchedule.parse("weekdays, Sat Sunday 22:00-23:00").minutes;
        assertEquals(7 * 60, every.cardinality());
        assertEquals(every, named);
        assertEquals(every, wrapped);
        assertEquals(every, listed);
        assertEquals(2 * FeedSchedule.MINUTES_PER_DAY,
                FeedSchedule.parse("weekends 0:00-24:00").minutes.cardinality());
        assertEquals(FeedSchedule.parse("Tu 9-17").minutes, FeedSchedule.parse("tue 09:00 - 17:00").minutes);
    }

    @Test public void looseningIsAnyMinuteTheOldHoursLockedAndTheNewOnesDoNot() {
        assertTrue(FeedSchedule.loosens("Mon-Fri 21:00-07:00", "Mon-Fri 22:00-07:00"));
        assertTrue(FeedSchedule.loosens("Mon-Fri 21:00-07:00", ""));
        assertTrue(FeedSchedule.loosens("Mon-Fri 21:00-07:00", "Funday"));
        assertFalse(FeedSchedule.loosens("Mon-Fri 21:00-07:00", "Mon-Fri 20:00-08:00"));
        assertFalse(FeedSchedule.loosens("Mon-Fri 21:00-07:00", "21:00-07:00"));
        assertFalse(FeedSchedule.loosens("", "Mon 9-10"));
    }

    @Test public void theRowSaysWhenTheHoursNextChange() {
        now.set(local(Calendar.OCTOBER, 26, 21, 30));
        FeedSchedule.setClockForTests(now::get, NEW_YORK);
        String tuesday = FeedSchedule.dayTimeLabel(local(Calendar.OCTOBER, 27, 7, 0));
        assertTrue(tuesday, tuesday.startsWith("Tue 7:00"));
        assertEquals("Locked now, until " + tuesday, FeedSchedule.statusLine("Mon-Fri 21:00-07:00"));
        assertEquals("Next lock starts " + FeedSchedule.dayTimeLabel(local(Calendar.OCTOBER, 31, 13, 0)),
                FeedSchedule.statusLine("Sat Sun 13:00-15:00"));
        assertEquals("Locked all week", FeedSchedule.statusLine("0:00-24:00"));
        assertNull(FeedSchedule.statusLine(""));
        assertNull(FeedSchedule.statusLine("Funday 9-17"));
    }

    @Test public void aLockAWeekAwayNamesItsDateSoTodaysWeekdayIsNotReadAsGone() {
        now.set(local(Calendar.OCTOBER, 27, 15, 50));
        FeedSchedule.setClockForTests(now::get, NEW_YORK);
        String nextWeek = FeedSchedule.dayTimeLabel(local(Calendar.NOVEMBER, 3, 15, 0));
        // The pattern is the locale's own (Robolectric hands the skeleton back as it is), so only
        // its parts are checked: the weekday, the month and day, then the time.
        assertTrue(nextWeek, nextWeek.matches("Tue\\W*Nov\\W*3 3:00\\WPM"));
        assertEquals("Next lock starts " + nextWeek, FeedSchedule.statusLine("Tue 15:00-15:50"));
        String friday = FeedSchedule.dayTimeLabel(local(Calendar.OCTOBER, 30, 9, 0));
        assertTrue(friday, friday.startsWith("Fri 9:00"));
    }
}

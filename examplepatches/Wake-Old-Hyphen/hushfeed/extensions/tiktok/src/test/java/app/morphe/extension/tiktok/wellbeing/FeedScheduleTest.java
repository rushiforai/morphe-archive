package app.morphe.extension.tiktok.wellbeing;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.PausedProcess;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;

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
        SettingsStatus.blockAuthorEnabled = true;
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
        SettingsStatus.blockAuthorEnabled = false;
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

    private boolean coversAt(long at) {
        now.set(at);
        FeedSchedule.setClockForTests(now::get, NEW_YORK);
        return FeedSchedule.coversNow();
    }

    @Test public void startIsInsideEndIsOutsideAndANightRunsIntoTheNextDay() {
        Settings.FEED_LOCK_HOURS.save("Mon-Fri 21:00-07:00");
        assertFalse(coversAt(local(Calendar.OCTOBER, 26, 20, 59)));
        assertTrue("the start minute is not locked", coversAt(local(Calendar.OCTOBER, 26, 21, 0)));
        assertTrue("Monday night stopped at midnight", coversAt(local(Calendar.OCTOBER, 27, 6, 59)));
        assertFalse("the end minute is locked", coversAt(local(Calendar.OCTOBER, 27, 7, 0)));
        assertTrue("Friday night stopped at midnight", coversAt(local(Calendar.OCTOBER, 31, 6, 30)));
        assertFalse("Saturday evening was locked", coversAt(local(Calendar.OCTOBER, 31, 21, 30)));
        assertFalse("Monday morning was locked by a Sunday it never named",
                coversAt(local(Calendar.OCTOBER, 26, 6, 30)));
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

    @Test public void unreadableHoursSayWhichPartAndLockNothing() {
        assertNotNull(FeedSchedule.problem("Funday 9-17"));
        assertNotNull(FeedSchedule.problem("25:00-26:00"));
        assertNotNull(FeedSchedule.problem("Mon 24:00-06:00"));
        assertNotNull(FeedSchedule.problem("9:75-10:00"));
        String same = FeedSchedule.problem("Mon 9:00 - 9:00");
        assertNotNull(same);
        assertTrue(same, same.contains("Mon 9:00 - 9:00"));
        assertNull(FeedSchedule.problem(""));
        assertNull(FeedSchedule.problem("  "));

        Settings.FEED_LOCK_HOURS.save("Funday 9-17");
        assertFalse(coversAt(local(Calendar.OCTOBER, 26, 12, 0)));
    }

    @Test public void aStartTheClocksSkipTakesEffectAtTheFirstMinuteAfterTheSkip() {
        // 2026-03-08 in New York: 2:00 EST becomes 3:00 EDT at 07:00 UTC.
        BitSet hours = FeedSchedule.parse("Sun 2:30-4:00").minutes;
        long before = utc(Calendar.MARCH, 8, 6, 0);
        assertEquals(utc(Calendar.MARCH, 8, 7, 0), FeedSchedule.nextChange(hours, before, NEW_YORK));
        Settings.FEED_LOCK_HOURS.save("Sun 2:30-4:00");
        assertFalse(coversAt(utc(Calendar.MARCH, 8, 6, 59)));
        assertTrue("the first minute after the skip is not locked", coversAt(utc(Calendar.MARCH, 8, 7, 0)));
        // 4:00 EDT, one real hour after the skip.
        assertEquals(utc(Calendar.MARCH, 8, 8, 0),
                FeedSchedule.nextChange(hours, utc(Calendar.MARCH, 8, 7, 0), NEW_YORK));
        // A boundary past the change is reached an hour sooner than the wall clock's difference.
        BitSet later = FeedSchedule.parse("Sun 5:00-6:00").minutes;
        assertEquals(utc(Calendar.MARCH, 8, 9, 0), FeedSchedule.nextChange(later, before, NEW_YORK));
    }

    @Test public void aRepeatedHourStaysInsideTheSameHoursBothTimes() {
        // 2026-11-01 in New York: 2:00 EDT goes back to 1:00 EST at 06:00 UTC.
        Settings.FEED_LOCK_HOURS.save("Sun 1:00-2:00");
        assertTrue(coversAt(utc(Calendar.NOVEMBER, 1, 5, 30)));
        assertTrue("the repeated 1:30 is not locked", coversAt(utc(Calendar.NOVEMBER, 1, 6, 30)));
        assertFalse(coversAt(utc(Calendar.NOVEMBER, 1, 7, 0)));
        BitSet hours = FeedSchedule.parse("Sun 1:00-2:00").minutes;
        assertEquals("the hours ended at the first 2:00, which never comes",
                utc(Calendar.NOVEMBER, 1, 7, 0),
                FeedSchedule.nextChange(hours, utc(Calendar.NOVEMBER, 1, 5, 30), NEW_YORK));
        BitSet later = FeedSchedule.parse("Sun 3:00-4:00").minutes;
        assertEquals("a start past the change came an hour early", utc(Calendar.NOVEMBER, 1, 8, 0),
                FeedSchedule.nextChange(later, utc(Calendar.NOVEMBER, 1, 4, 0), NEW_YORK));
    }

    @Test public void aNewZoneIsTheClockReadAgain() {
        Settings.FEED_LOCK_HOURS.save("22:00-06:00");
        // 03:00 UTC is 23:00 in New York and noon in Tokyo.
        long at = utc(Calendar.OCTOBER, 27, 3, 0);
        now.set(at);
        FeedSchedule.setClockForTests(now::get, NEW_YORK);
        assertTrue(FeedSchedule.coversNow());
        FeedSchedule.setClockForTests(now::get, TOKYO);
        assertFalse("the old zone's answer stuck after the zone changed", FeedSchedule.coversNow());
    }

    @Test public void theHoursTurnTheFeedLockOnAndPausedTheyDoNot() {
        Settings.FEED_LOCK_HOURS.save("Mon 21:00-22:00");
        now.set(local(Calendar.OCTOBER, 26, 20, 0));
        FeedSchedule.setClockForTests(now::get, NEW_YORK);
        assertFalse(FeedLock.isOn());
        now.set(local(Calendar.OCTOBER, 26, 21, 0));
        // The answer is reused for up to a minute, so a boundary is where it is read again.
        FeedSchedule.setClockForTests(now::get, NEW_YORK);
        assertTrue(FeedLock.isOn());
        assertTrue(FeedLock.onByHoursOnly());
        assertEquals(local(Calendar.OCTOBER, 26, 22, 0), FeedSchedule.nextChangeAt());

        PausedProcess.set(true);
        assertFalse("paused, the hours still locked the feed", FeedLock.isOn());
        PausedProcess.set(false);

        SettingsStatus.blockAuthorEnabled = false;
        assertFalse("the hours locked a feed with no hooks to unlock it", FeedLock.isOn());
    }

    @Test public void anAnswerIsReusedUntilTheBoundaryAndNoLonger() {
        Settings.FEED_LOCK_HOURS.save("Mon 21:00-22:00");
        now.set(local(Calendar.OCTOBER, 26, 20, 59) + 59_000L);
        FeedSchedule.setClockForTests(now::get, NEW_YORK);
        assertFalse(FeedSchedule.coversNow());
        now.set(local(Calendar.OCTOBER, 26, 21, 0));
        assertTrue("the boundary went by on a stale answer", FeedSchedule.coversNow());
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

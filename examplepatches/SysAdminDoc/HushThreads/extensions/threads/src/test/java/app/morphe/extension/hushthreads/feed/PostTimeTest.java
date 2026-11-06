/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.provider.Settings.System;
import android.text.format.DateUtils;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.Calendar;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PostTimeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Context context;

    /**
     * The patch is in Morphe Manager's default selection with its switch off; these tests turn it
     * on. Cleared first as well, so a test that stopped half way leaves nothing behind.
     */
    @Before public void turnTheSwitchOn() {
        restore();
        context = RuntimeEnvironment.getApplication();
        Settings.EXACT_POST_TIMES.save(true);
    }

    @After public void restore() {
        PauseForTests.resume();
        Settings.EXACT_POST_TIMES.resetToDefault();
        HookStatus.clear();
    }

    /** Seconds since 1970 for 3:30 in the afternoon on a day of [year], in the phone's time zone. */
    private static double afternoon(int year) {
        Calendar time = Calendar.getInstance();
        time.clear();
        time.set(year, Calendar.MARCH, 4, 15, 30, 0);
        return time.getTimeInMillis() / 1000d;
    }

    /** Android's own text for [seconds], with the no-break spaces the header carries. */
    private String android(double seconds, int flags) {
        return PostTime.unbroken(DateUtils.formatDateTime(context, (long) (seconds * 1000), PostTime.FLAGS | flags));
    }

    /** The first character a line could break at in [text], or -1 when it has none. */
    private static int breakableSpace(String text) {
        for (int i = 0; i < text.length(); i++) {
            if (Character.isWhitespace(text.charAt(i))) return i;
        }
        return -1;
    }

    /** The switch starts off, so a default build keeps "3h" and "2d" until it's turned on. */
    @Test public void theSwitchStartsOffAndOnWritesTheDateAndTime() {
        assertFalse("the switch starts on", Settings.EXACT_POST_TIMES.defaultValue);
        double seconds = afternoon(2020);
        String shown = PostTime.exact(context, seconds);
        assertEquals(android(seconds, 0), shown);
        // An older post keeps its year, and the time is there as well as the date.
        assertTrue(shown, shown.contains("2020"));
        assertTrue(shown, shown.contains("30"));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(FamilyNames.EXACT_POST_TIMES + ": invoked 1"));
        assertTrue(report, report.contains(PostTime.SHOWN + " 1"));
    }

    /** The time follows the phone's 12 or 24-hour setting. */
    @Test public void theTimeFollowsThePhonesClockFormat() {
        double seconds = afternoon(2021);
        System.putString(context.getContentResolver(), System.TIME_12_24, "24");
        String day = PostTime.exact(context, seconds);
        assertEquals(android(seconds, DateUtils.FORMAT_24HOUR), day);
        assertTrue(day, day.contains("15:30"));

        System.putString(context.getContentResolver(), System.TIME_12_24, "12");
        String twelve = PostTime.exact(context, seconds);
        assertEquals(android(seconds, DateUtils.FORMAT_12HOUR), twelve);
        assertTrue(twelve, twelve.contains("3:30"));
        assertNotEquals(day, twelve);
    }

    /**
     * The time never splits across two lines: this year's and an older post's, in either clock
     * format, carry no space a line can break at, so a time that doesn't fit beside a long name
     * moves under it whole. TalkBack gets the same text.
     */
    @Test public void theTimeStaysInOnePiece() {
        double thisYear = afternoon(Calendar.getInstance().get(Calendar.YEAR));
        for (String clock : new String[]{"12", "24"}) {
            System.putString(context.getContentResolver(), System.TIME_12_24, clock);
            for (double seconds : new double[]{afternoon(2020), thisYear}) {
                String shown = PostTime.exact(context, seconds);
                assertNotNull(shown);
                assertEquals(clock + "-hour " + shown, -1, breakableSpace(shown));
                assertTrue(shown, shown.indexOf((char) 0x00A0) >= 0 || shown.indexOf((char) 0x202F) >= 0);
                assertEquals(shown, PostTime.spoken("Threads' own", context, seconds));
            }
        }
        assertEquals("Nov" + (char) 0x00A0 + "4," + (char) 0x00A0 + "10:25" + (char) 0x202F + "PM",
                PostTime.unbroken("Nov 4, 10:25" + (char) 0x2009 + "PM"));
    }

    /** Off, Threads writes the time itself. */
    @Test public void offLeavesTheTimeToThreads() {
        Settings.EXACT_POST_TIMES.save(false);
        assertNull(PostTime.exact(context, afternoon(2020)));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(PostTime.LEFT_TO_THREADS + "switch off 1"));
        assertFalse(report, report.contains(PostTime.SHOWN));
    }

    /** Paused or in safe mode, the saved switch stays on and Threads writes the time. */
    @Test public void pauseAndSafeModeLeaveTheTimeToThreads() {
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        assertNull(PostTime.exact(context, afternoon(2020)));
        assertTrue(Settings.EXACT_POST_TIMES.savedValue());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(PostTime.LEFT_TO_THREADS + "HushThreads paused 1"));
        PauseForTests.resume();

        PauseForTests.pause(HushThreadsPause.Reason.CRASH_LOOP);
        assertNull(PostTime.exact(context, afternoon(2020)));
        assertTrue(Settings.EXACT_POST_TIMES.savedValue());
    }

    /**
     * A value that can't be a post's time in seconds, milliseconds by mistake among them, and a
     * missing context get Threads' own text rather than a wrong date.
     */
    @Test public void aTimeThatIsntAPostsGoesToThreads() {
        for (double odd : new double[]{Double.NaN, Double.POSITIVE_INFINITY, 0, -1, 999_999_999, afternoon(2021) * 1000}) {
            assertNull(String.valueOf(odd), PostTime.exact(context, odd));
        }
        assertNull(PostTime.exact(null, afternoon(2021)));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(PostTime.LEFT_TO_THREADS + "not a post's time 6"));
        assertTrue(report, report.contains(PostTime.LEFT_TO_THREADS + "no context 1"));
        assertFalse(report, report.contains(PostTime.SHOWN));
    }

    /**
     * TalkBack reads a recent post's time as the header shows it while the switch is on, and
     * Threads' own description off, paused or for a time no post can have. It counts nothing.
     */
    @Test public void aRecentPostsSpokenTimeMatchesItsHeader() {
        double seconds = java.lang.System.currentTimeMillis() / 1000d - 3 * 3600;
        String header = PostTime.exact(context, seconds);
        assertNotNull(header);
        HookStatus.clear();
        assertEquals(header, PostTime.spoken("3 hours ago", context, seconds));
        assertEquals("Threads' own", PostTime.spoken("Threads' own", context, Double.NaN));
        assertEquals("Threads' own", PostTime.spoken("Threads' own", null, seconds));
        assertNull(PostTime.spoken(null, context, 0));

        Settings.EXACT_POST_TIMES.save(false);
        assertEquals("3 hours ago", PostTime.spoken("3 hours ago", context, seconds));
        Settings.EXACT_POST_TIMES.save(true);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        assertEquals("3 hours ago", PostTime.spoken("3 hours ago", context, seconds));
        String report = String.join("\n", HookStatus.report());
        assertFalse(report, report.contains(PostTime.SHOWN));
        assertFalse(report, report.contains(PostTime.LEFT_TO_THREADS));
        assertFalse(report, report.contains(FamilyNames.EXACT_POST_TIMES + ": invoked"));
    }

    /** A header Threads already drew keeps its text until it's drawn again, so no restart is asked for. */
    @Test public void aChangeNeedsNoRestart() {
        assertFalse(Settings.EXACT_POST_TIMES.rebootApp);
    }
}

/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.stories;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.os.SystemClock;

import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

/** What the story time hooks answer: the posted date and time while the switch is on, Instagram's label otherwise. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class StoryTimeTest {
    private static final String ZONE = "America/New_York";
    /** The year the stories are posted in, and the clock's, so the label leaves the year out. */
    private static final int YEAR = 2026;

    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private Locale locale;
    private TimeZone zone;

    @Before
    public void enable() {
        locale = Locale.getDefault();
        zone = TimeZone.getDefault();
        Locale.setDefault(Locale.US);
        TimeZone.setDefault(TimeZone.getTimeZone(ZONE));
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        Settings.SHOW_STORY_TIME.save(true);
        HookStatus.clear();
        // Robolectric's clock starts in 1970, and a date outside the current year gets its year,
        // so the clock moves to a little after the story went up, the way a phone's would be.
        assertTrue(SystemClock.setCurrentTimeMillis((postedOnOctober2(0) + 2 * 60 * 60) * 1000L));
    }

    @After
    public void restore() {
        hourSetting(null);
        Locale.setDefault(locale);
        TimeZone.setDefault(zone);
        Settings.SHOW_STORY_TIME.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        HookStatus.clear();
    }

    /** A phone set to 12-hour time gets the month, the day and the time with AM or PM. */
    @Test
    public void aTwelveHourPhoneGetsTheDateAndTimeWithPm() {
        hourSetting("12");
        assertEquals("Oct 2, 3:45 PM", plain(StoryTime.label(postedOnOctober2(0))));
    }

    /** A phone set to 24-hour time gets the same date with the 24-hour time. */
    @Test
    public void aTwentyFourHourPhoneGetsTheTwentyFourHourTime() {
        hourSetting("24");
        assertEquals("Oct 2, 15:45", plain(StoryTime.label(postedOnOctober2(0))));
    }

    /** The phone's language picks the date's words and order. */
    @Test
    public void theLabelFollowsThePhonesLanguage() {
        Locale.setDefault(Locale.GERMANY);
        hourSetting("24");
        String label = plain(StoryTime.label(postedOnOctober2(0)));
        assertTrue(label, label.startsWith("2. Okt"));
        assertTrue(label, label.endsWith("15:45"));
    }

    /** A story from another year, a highlight say, says which year. */
    @Test
    public void aStoryFromAnotherYearSaysTheYear() {
        hourSetting("12");
        assertEquals("Oct 2, " + (YEAR - 1) + ", 3:45 PM", plain(StoryTime.label(postedOnOctober2(-1))));
    }

    /** Off, paused or before the settings are read, the label is Instagram's, and so is the header's flag. */
    @Test
    public void offPausedAndUnreadyKeepInstagramsLabel() {
        long posted = postedOnOctober2(0);
        assertNotNull(StoryTime.label(posted));
        assertFalse("on, the header asks the story item", StoryTime.relativeHeader(1));
        assertFalse(StoryTime.relativeHeader(0));

        Settings.SHOW_STORY_TIME.save(false);
        assertNull(StoryTime.label(posted));
        assertTrue(StoryTime.relativeHeader(1));
        assertFalse(StoryTime.relativeHeader(0));
        Settings.SHOW_STORY_TIME.save(true);

        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        assertNull(StoryTime.label(posted));
        assertTrue(StoryTime.relativeHeader(1));
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();

        SettingsContextRule.withoutContext(() -> {
            assertNull(StoryTime.label(posted));
            assertTrue(StoryTime.relativeHeader(1));
            assertFalse(StoryTime.relativeHeader(0));
        });
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            assertNull(StoryTime.label(posted));
            assertTrue(StoryTime.relativeHeader(1));
        });

        assertNotNull("back on", StoryTime.label(posted));
        assertTrue(HookStatus.missing(FamilyNames.STORY_TIME).toString(), HookStatus.missing(FamilyNames.STORY_TIME).isEmpty());
    }

    /** A time that can't be a posted one, none at all or one too large for milliseconds, keeps Instagram's label. */
    @Test
    public void aTimeThatIsntOneKeepsInstagramsLabel() {
        assertNull(StoryTime.label(0));
        assertNull(StoryTime.label(-1));
        assertNull(StoryTime.label(Long.MAX_VALUE));
        assertNull(StoryTime.label(Long.MAX_VALUE / 1000L + 1));
    }

    /** Seconds since 1970 of October 2 at 3:45:30 PM in New York, [years] from {@link #YEAR}. */
    private static long postedOnOctober2(int years) {
        Calendar posted = Calendar.getInstance(TimeZone.getTimeZone(ZONE), Locale.US);
        posted.clear();
        posted.set(YEAR + years, Calendar.OCTOBER, 2, 15, 45, 30);
        return posted.getTimeInMillis() / 1000L;
    }

    /** The phone's 12 or 24-hour setting, or null for the language's own. */
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

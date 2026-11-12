/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.content.SharedPreferences;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.telegram.settings.Settings;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SongDatesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final long ME = 777L;
    private static final long SONG = 4242L;

    @Before public void reset() {
        prefs().edit().clear().commit();
        restore();
    }

    @After public void restore() {
        PauseForTests.resume();
        Settings.SONG_DATES.resetToDefault();
        HookStatus.clear();
    }

    @Test public void theFirstDayASongWentOnTheProfileStaysUntilItsRemoved() {
        SongDates.note(ME, SONG, 1_000L);
        SongDates.note(ME, SONG, 2_000L);
        assertEquals(1_000L, SongDates.added(ME, SONG));
        // Another account on this phone, or another song, has its own day.
        assertEquals(0L, SongDates.added(888L, SONG));
        assertEquals(0L, SongDates.added(ME, 5L));
        assertEquals(0L, SongDates.added(ME, 0L));

        SongDates.forget(ME, SONG);
        assertEquals(0L, SongDates.added(ME, SONG));
        SongDates.note(ME, SONG, 3_000L);
        assertEquals(3_000L, SongDates.added(ME, SONG));
    }

    @Test public void theDayGoesAfterTheArtistOrStandsAlone() {
        assertEquals("Daft Punk " + (char) 0xB7 + " Nov 11, 2026", SongDates.withDay("Daft Punk", "Nov 11, 2026"));
        assertEquals("Nov 11, 2026", SongDates.withDay("", "Nov 11, 2026"));
        assertEquals("Nov 11, 2026", SongDates.withDay(null, "Nov 11, 2026"));
    }

    @Test public void startsOffAndAnswersOffWhilePaused() {
        assertFalse(Settings.SONG_DATES.get());
        assertFalse(SongDates.on());
        Settings.SONG_DATES.save(true);
        assertTrue(SongDates.on());
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(SongDates.on());
    }

    @Test public void aRealMessageKeepsTelegramsArtist() {
        Settings.SONG_DATES.save(true);
        SongDates.note(ME, SONG, 1_000L);
        // Unpatched, every message reads as a real one with Telegram's own artist.
        assertNull(SongDates.author(new Object(), 0));
        assertNull(SongDates.author(null, 1));
        SongDates.saving(new Object());
        assertEquals(1, prefs().getAll().size());
    }

    private static SharedPreferences prefs() {
        return SongDates.store.apply(Utils.getContext());
    }
}

package io.github.sabopura.morphe.extension.twitch.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.TimeZone;

import org.junit.Test;

public class HistoryFormatTest {
    private static final TimeZone TOKYO = TimeZone.getTimeZone("Asia/Tokyo");
    /** 2026-11-14 (Sat) 23:05:59 in Tokyo. */
    private static final long SATURDAY_NIGHT = 1_794_665_159_000L;
    private static final long HOUR = 3_600_000L, DAY = 24 * HOUR;

    @Test
    public void clockIsLocalHoursAndMinutes() {
        assertEquals("23:05", HistoryFormat.clock(SATURDAY_NIGHT, TOKYO));
        assertEquals("14:05", HistoryFormat.clock(SATURDAY_NIGHT, TimeZone.getTimeZone("UTC")));
        assertEquals("00:05", HistoryFormat.clock(SATURDAY_NIGHT + HOUR, TOKYO));
    }

    @Test
    public void messageWithoutTimeShowsNoClockOrDay() {
        assertEquals("", HistoryFormat.clock(0, TOKYO));
        assertNull(HistoryFormat.day(0, 0, SATURDAY_NIGHT, TOKYO, true));
    }

    @Test
    public void firstRowOfTodayNeedsNoHeading() {
        assertNull(HistoryFormat.day(0, SATURDAY_NIGHT, SATURDAY_NIGHT + HOUR / 2, TOKYO, true));
    }

    @Test
    public void headingAppearsOnlyWhereTheDayChanges() {
        long now = SATURDAY_NIGHT + 2 * HOUR;
        assertEquals("昨日", HistoryFormat.day(0, SATURDAY_NIGHT, now, TOKYO, true));
        assertNull(HistoryFormat.day(SATURDAY_NIGHT - HOUR, SATURDAY_NIGHT, now, TOKYO, true));
        assertEquals("今日", HistoryFormat.day(SATURDAY_NIGHT, SATURDAY_NIGHT + HOUR, now, TOKYO, true));
        assertEquals("Today", HistoryFormat.day(SATURDAY_NIGHT, SATURDAY_NIGHT + HOUR, now, TOKYO, false));
    }

    @Test
    public void olderDaysNameTheDateAndYearOnlyWhenItDiffers() {
        assertEquals("11月14日（土）", HistoryFormat.day(0, SATURDAY_NIGHT, SATURDAY_NIGHT + 3 * DAY, TOKYO, true));
        assertEquals("Sat, Nov 14", HistoryFormat.day(0, SATURDAY_NIGHT, SATURDAY_NIGHT + 3 * DAY, TOKYO, false));
        long nextYear = SATURDAY_NIGHT + 60 * DAY;
        assertEquals("2026年11月14日（土）", HistoryFormat.day(0, SATURDAY_NIGHT, nextYear, TOKYO, true));
        assertEquals("Sat, Nov 14, 2026", HistoryFormat.day(0, SATURDAY_NIGHT, nextYear, TOKYO, false));
    }

    @Test
    public void countsUseThousandsSeparators() {
        assertEquals("1,000", HistoryFormat.count(1000));
        assertEquals("128", HistoryFormat.count(128));
    }

    @Test
    public void darkNameColourIsLiftedOnTheDarkSheet() {
        int sheet = 0xFF18181B, blue = 0xFF0000FF;
        int shown = HistoryFormat.readable(blue, sheet);
        assertNotEquals(blue, shown);
        assertTrue(HistoryFormat.contrast(shown, sheet) >= 4.5);
    }

    @Test
    public void paleNameColourIsDeepenedOnTheLightSheet() {
        int sheet = 0xFFFFFFFF, yellow = 0xFFFFFF00;
        int shown = HistoryFormat.readable(yellow, sheet);
        assertTrue(HistoryFormat.contrast(shown, sheet) >= 4.5);
        assertTrue((shown & 0xFF) == 0 && (shown >> 16 & 0xFF) == (shown >> 8 & 0xFF));
    }

    @Test
    public void readableNameColourIsKept() {
        assertEquals(0xFF00FF7F, HistoryFormat.readable(0xFF00FF7F, 0xFF18181B));
    }
}

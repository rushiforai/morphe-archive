package com.waze.gw;

import java.util.Calendar;
import java.util.Locale;

/** Pure local-time policy for the daily headlight reminder. */
final class HeadlightReminderSchedule {
    static final int PHASE_OFF = 0;
    static final int PHASE_TURN_ON_SOON = 1;
    static final int PHASE_TURN_ON = 2;
    static final int PHASE_KEEP_ON = 3;

    private static final int START_MINUTE = 17 * 60 + 30;
    private static final int NIGHT_START_MINUTE = 18 * 60 + 30;
    private static final int KEEP_ON_START_MINUTE = 5 * 60;
    private static final int END_MINUTE = 6 * 60;

    private HeadlightReminderSchedule() { }

    static boolean inWindow(int hour, int minute) {
        return phaseAt(hour, minute) != PHASE_OFF;
    }

    static int phaseAt(int hour, int minute) {
        if (hour < 0 || hour > 23 || minute < 0 || minute > 59) return PHASE_OFF;
        int value = hour * 60 + minute;
        if (value >= START_MINUTE && value < NIGHT_START_MINUTE) return PHASE_TURN_ON_SOON;
        if (value >= NIGHT_START_MINUTE || value < KEEP_ON_START_MINUTE) return PHASE_TURN_ON;
        if (value < END_MINUTE) return PHASE_KEEP_ON;
        return PHASE_OFF;
    }

    static boolean inWindow(Calendar calendar) {
        return calendar != null && inWindow(calendar.get(Calendar.HOUR_OF_DAY),
                calendar.get(Calendar.MINUTE));
    }

    static int phaseAt(Calendar calendar) {
        return calendar == null ? PHASE_OFF
                : phaseAt(calendar.get(Calendar.HOUR_OF_DAY), calendar.get(Calendar.MINUTE));
    }

    static String dayKey(Calendar calendar) {
        if (calendar == null) return "";
        Calendar night = (Calendar) calendar.clone();
        int value = night.get(Calendar.HOUR_OF_DAY) * 60 + night.get(Calendar.MINUTE);
        // 00:00-05:59 belongs to the evening that started on the previous date.
        if (value < END_MINUTE) night.add(Calendar.DAY_OF_MONTH, -1);
        return String.format(Locale.US, "%04d-%02d-%02d",
                night.get(Calendar.YEAR), night.get(Calendar.MONTH) + 1,
                night.get(Calendar.DAY_OF_MONTH));
    }
}

package app.southstar21.extension.instagram.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.format.DateFormat;

import java.util.Locale;

/** A time of day, picked with a time picker and stored as minutes after midnight. */
public final class TimeSetting extends Setting {
    private final int defaultMinutes;

    public TimeSetting(String key, String title, String summary, int defaultHour, int defaultMinute) {
        super(key, title, summary, false);
        this.defaultMinutes = defaultHour * 60 + defaultMinute;
    }

    /** Minutes after midnight. */
    public int get() {
        SharedPreferences prefs = Settings.preferencesOrNull();
        int value = prefs == null ? defaultMinutes : prefs.getInt(key, defaultMinutes);
        return value >= 0 && value < 24 * 60 ? value : defaultMinutes;
    }

    public void set(int minutes) {
        Settings.preferences().edit().putInt(key, ((minutes % (24 * 60)) + 24 * 60) % (24 * 60)).apply();
    }

    /** "22:30", or "10:30 PM" when the phone uses a 12-hour clock. */
    public static String format(int minutes) {
        int hour = minutes / 60, minute = minutes % 60;
        Context context = Settings.contextOrNull();
        if (context == null || DateFormat.is24HourFormat(context)) {
            return String.format(Locale.US, "%d:%02d", hour, minute);
        }
        int hour12 = hour % 12 == 0 ? 12 : hour % 12;
        return String.format(Locale.US, "%d:%02d %s", hour12, minute, hour < 12 ? "AM" : "PM");
    }
}

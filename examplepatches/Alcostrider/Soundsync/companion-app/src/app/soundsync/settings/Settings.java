package app.soundsync.settings;

import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.service.quicksettings.TileService;

/** The two settings, shared with the patched apps through {@link SettingsProvider}. */
final class Settings {
    static final String AUTHORITY = "app.soundsync.settings";
    static final Uri CONFIG = Uri.parse("content://" + AUTHORITY + "/config");

    static final int MODE_OFF = 0;
    static final int MODE_ANDROID_AUTO = 1;
    static final int MODE_ALWAYS = 2;

    static final int MIN_DELAY = 0;
    static final int MAX_DELAY = 2000;
    static final int DEFAULT_DELAY = 750;

    private Settings() {
    }

    private static SharedPreferences sp(Context c) {
        return c.getApplicationContext().getSharedPreferences("soundsync", Context.MODE_PRIVATE);
    }

    static int clamp(int ms) {
        return Math.max(MIN_DELAY, Math.min(MAX_DELAY, ms));
    }

    static int delay(Context c) {
        return clamp(sp(c).getInt("delay_ms", DEFAULT_DELAY));
    }

    static int mode(Context c) {
        int m = sp(c).getInt("mode", MODE_ANDROID_AUTO);
        return (m >= MODE_OFF && m <= MODE_ALWAYS) ? m : MODE_ANDROID_AUTO;
    }

    static void setDelay(Context c, int ms) {
        sp(c).edit().putInt("delay_ms", clamp(ms)).apply();
        changed(c);
    }

    static void changeDelay(Context c, int deltaMs) {
        setDelay(c, delay(c) + deltaMs);
    }

    static void setMode(Context c, int mode) {
        sp(c).edit().putInt("mode", mode).apply();
        changed(c);
    }

    /** A car app that isn't Android Auto (DriveDeck) said it's connected; ignored after this long. */
    private static final long HOST_STALE_MS = 12L * 60 * 60 * 1000;

    static void setCarHost(Context c, boolean connected, String host) {
        sp(c).edit().putBoolean("host_connected", connected).putString("host_name", host)
                .putLong("host_at", System.currentTimeMillis()).apply();
        changed(c);
    }

    /** The car app connected right now, such as "DriveDeck", or null. */
    static String carHost(Context c) {
        SharedPreferences p = sp(c);
        if (!p.getBoolean("host_connected", false)) return null;
        long age = System.currentTimeMillis() - p.getLong("host_at", 0);
        return (age >= 0 && age < HOST_STALE_MS) ? p.getString("host_name", "Car app") : null;
    }

    /**
     * The mode the patched apps get. "Only while connected to Android Auto" also counts a car app
     * such as DriveDeck that says it's connected: the patched apps then apply the delay as if set
     * to Always, and go back to checking Android Auto when it disconnects. No repatching needed.
     */
    static int effectiveMode(Context c) {
        int m = mode(c);
        return (m == MODE_ANDROID_AUTO && carHost(c) != null) ? MODE_ALWAYS : m;
    }

    static String modeLabel(int mode) {
        switch (mode) {
            case MODE_OFF:
                return "Off";
            case MODE_ALWAYS:
                return "Always on";
            default:
                return "With Android Auto";
        }
    }

    /** Tells patched apps that are playing right now, and refreshes the tile. */
    private static void changed(Context c) {
        c.getContentResolver().notifyChange(CONFIG, null);
        try {
            TileService.requestListeningState(c, new ComponentName(c, SyncTileService.class));
        } catch (Exception ignored) {
        }
    }
}

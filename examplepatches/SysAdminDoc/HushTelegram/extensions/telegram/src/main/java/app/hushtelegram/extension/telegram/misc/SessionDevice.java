/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.os.Build;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.StringSetting;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * The device in Active sessions (#79): every account tells Telegram a device name and a system
 * version when it connects, and Settings > Devices on your other phones and computers shows them.
 *
 * <p>Telegram builds both in ConnectionsManager's constructor (the phone's maker and model run
 * together, and "SDK" with the Android API level) and hands them to init, which passes them to the
 * native connection. The patch runs each through {@link #model} and {@link #system} at the top of
 * init, so a name saved here goes out instead and an empty one leaves Telegram's own.
 *
 * <p>The connection doesn't send them on every launch, though: it tells the server the device again
 * only when the build number init gets differs from the one it saved the last time it did (or after
 * a language or proxy change). {@link #version} folds the saved name and system version into that
 * number, so a change goes out on the next launch, and clearing both gives Telegram's own back.
 */
public final class SessionDevice {
    /** Room for a long name, and far less than a line the sessions list can't show. */
    public static final int MAX_LENGTH = 64;

    private SessionDevice() {}

    /** Injected at the top of ConnectionsManager.init on the device name Telegram built. */
    public static String model(String stock) {
        return chosen(Settings.SESSION_DEVICE_NAME, stock, "session device name");
    }

    /** Injected at the top of ConnectionsManager.init on the system version Telegram built. */
    public static String system(String stock) {
        return chosen(Settings.SESSION_SYSTEM_VERSION, stock, "session system version");
    }

    /**
     * Injected at the top of ConnectionsManager.init on Telegram's build number, which the native
     * connection only compares with the one it saved to decide whether to send the device again.
     * Telegram's own with both boxes empty, otherwise mixed with what {@link #model} and
     * {@link #system} send, so each different pair gets its own number and goes out once.
     */
    public static int version(int stock) {
        try {
            if (!Utils.settingsReady()) return stock;
            String model = clean(Settings.SESSION_DEVICE_NAME.get());
            String system = clean(Settings.SESSION_SYSTEM_VERSION.get());
            if (model.isEmpty() && system.isEmpty()) return stock;
            return fold(stock, (model + '\n' + system).hashCode());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "session device version", failure);
            return stock;
        }
    }

    /**
     * Telegram's build number with a saved pair's hash folded in, never the number itself and never
     * 0, which the connection keeps for "not started yet" and would answer by sending the device on
     * every launch.
     */
    static int fold(int stock, int mix) {
        int folded = stock ^ (mix == 0 ? 1 : mix);
        // Differs from stock in every bit but the last, which is set, so it's neither stock nor 0.
        return folded != 0 ? folded : ~stock | 1;
    }

    private static String chosen(StringSetting setting, String stock, String what) {
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
        try {
            if (!Utils.settingsReady()) return stock;
            String value = clean(setting.get());
            if (value.isEmpty()) return stock;
            HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, what + " changed");
            return value;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, what, failure);
            return stock;
        }
    }

    /**
     * What was typed as one line Telegram can send: line breaks, tabs and other control
     * characters become spaces, runs of spaces become one, the ends are trimmed, and anything past
     * {@link #MAX_LENGTH} characters is cut, never in the middle of a character.
     */
    public static String clean(String typed) {
        if (typed == null) return "";
        StringBuilder out = new StringBuilder(Math.min(typed.length(), MAX_LENGTH));
        boolean space = false;
        for (int at = 0; at < typed.length(); ) {
            int point = typed.codePointAt(at);
            at += Character.charCount(point);
            if (Character.isISOControl(point) || Character.isWhitespace(point) || Character.isSpaceChar(point)) {
                space = out.length() > 0;
                continue;
            }
            int needed = Character.charCount(point) + (space ? 1 : 0);
            if (out.length() + needed > MAX_LENGTH) break;
            if (space) out.append(' ');
            space = false;
            out.appendCodePoint(point);
        }
        return out.toString();
    }

    /** The name Telegram sends on its own, the way its constructor builds it. */
    public static String stockModel() {
        String model = String.valueOf(Build.MANUFACTURER) + Build.MODEL;
        return model.trim().isEmpty() ? "Android unknown" : model;
    }

    /** The system version Telegram sends on its own. */
    public static String stockSystem() {
        return "SDK " + Build.VERSION.SDK_INT;
    }
}

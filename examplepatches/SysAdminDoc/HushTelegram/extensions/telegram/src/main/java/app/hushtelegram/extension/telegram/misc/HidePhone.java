/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.SharedPreferences;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.Setting;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.lang.reflect.Method;
import java.util.List;
import java.util.function.IntFunction;

/**
 * Telegram formats a phone number for the screen in one place, and every screen that shows one
 * (the side menu, Settings, profiles, the add contact bar, contact cards) asks it. Each ask comes
 * here instead, and a number that belongs to one of your signed-in accounts comes back with its
 * digits covered. Other people's numbers, and the contact cards Telegram sends, stay as they are.
 */
public final class HidePhone {
    private HidePhone() {}

    /**
     * Asked in place of Telegram's phone formatter.
     *
     * @param formatter Telegram's formatter
     * @param raw the number as stored
     * @return the number as the screen shows it
     */
    public static String shown(Object formatter, String raw) {
        String formatted = stockFormat(formatter, raw);
        return formatted != null && hides(raw) ? cover(formatted) : formatted;
    }

    /**
     * Asked with the number Telegram's "Is this still your number?" card is about to put in its
     * question, right after formatting it. The card asks you to check the number, so it gets the
     * digits back: the number this thread just covered, when [shown] is that number covered. Two
     * accounts' numbers can cover the same way, which is why it's the one just formatted.
     */
    public static String asked(String shown) {
        String real = COVERED.get();
        COVERED.remove();
        if (real == null || shown == null || !mask(real).equals(shown)) return shown;
        HookStatus.counted(FamilyNames.HIDE_PHONE_NUMBER, "number shown in the card asking about it");
        return real;
    }

    /** The last number each thread covered, kept for [asked]. */
    private static final ThreadLocal<String> COVERED = new ThreadLocal<>();

    /** [formatted] with its digits covered, remembered on this thread until [asked]. */
    static String cover(String formatted) {
        COVERED.set(formatted);
        return mask(formatted);
    }

    static boolean hides(String raw) {
        if (!on()) return false;
        try {
            if (!own(raw, HidePhone::ownPhone, accounts())) return false;
            HookStatus.counted(FamilyNames.HIDE_PHONE_NUMBER, "own number covered");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_PHONE_NUMBER, "own number", failure);
            return false;
        }
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.HIDE_PHONE_NUMBER);
        try {
            if (!Utils.settingsReady()) return false;
            watchSwitch();
            return Settings.HIDE_PHONE_NUMBER.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_PHONE_NUMBER, "switch", failure);
            return false;
        }
    }

    private static final String NOTIFICATION_CENTER = "org.telegram.messenger.NotificationCenter";

    /** Hears the switch flip. Held here: the settings file keeps only a weak reference to it. */
    private static final SharedPreferences.OnSharedPreferenceChangeListener WATCH = (store, changed) -> {
        if (!Settings.HIDE_PHONE_NUMBER.key.equals(changed)) return;
        HookStatus.counted(FamilyNames.HIDE_PHONE_NUMBER, "switch flipped");
        Utils.runOnMainThread(HidePhone::redrawNumbers);
    };

    /** The store {@link #WATCH} listens to: the settings file's, which a test may swap for a fresh one. */
    private static volatile SharedPreferences watched;

    /**
     * Watches the switch from the first number Telegram shows, so a flip (the switch, a quick setup
     * or an import) redraws the numbers already on screen. Telegram 13.2 keeps its Settings tab
     * built, and the number at its top kept the old look until a restart.
     */
    private static void watchSwitch() {
        SharedPreferences store = Setting.preferences.preferences;
        if (watched == store) return;
        synchronized (HidePhone.class) {
            if (watched == store) return;
            if (watched != null) watched.unregisterOnSharedPreferenceChangeListener(WATCH);
            store.registerOnSharedPreferenceChangeListener(WATCH);
            watched = store;
        }
    }

    /** {@link #redraw} for Telegram's NotificationCenter and every signed-in account. Main thread only. */
    static void redrawNumbers() {
        try {
            redraw(Class.forName(NOTIFICATION_CENTER), Accounts.signedIn());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_PHONE_NUMBER, "redraw", failure);
        }
    }

    /**
     * Tells each account's screens what Telegram tells them after a profile edit: the interface
     * changed, so the Settings tab sets its header again, and the account's own info changed, so
     * the side menu draws its rows again. Each asks {@link #shown} anew.
     *
     * @param centers Telegram's NotificationCenter class
     */
    static void redraw(Class<?> centers, List<Accounts.Entry> accounts) throws ReflectiveOperationException {
        Method instance = HostNames.method(centers, "getInstance", int.class);
        Method post = HostNames.method(centers, "postNotificationName", int.class, Object[].class);
        int interfaces = HostNames.field(centers, "updateInterfaces").getInt(null);
        int ownInfo = HostNames.field(centers, "mainUserInfoChanged").getInt(null);
        for (Accounts.Entry account : accounts) {
            Object center = instance.invoke(null, account.index);
            if (center == null) continue;
            // Screens that read updateInterfaces cast its first argument to the mask of what changed.
            post.invoke(center, interfaces, new Object[] {Integer.valueOf(0)});
            post.invoke(center, ownInfo, new Object[0]);
            HookStatus.counted(FamilyNames.HIDE_PHONE_NUMBER, "numbers on screen redrawn");
        }
    }

    /** Whether [raw] has the same digits as the number of one of the first [count] accounts. */
    static boolean own(String raw, IntFunction<String> phones, int count) {
        String digits = digits(raw);
        if (digits.isEmpty()) return false;
        for (int account = 0; account < count; account++) {
            if (digits.equals(digits(phones.apply(account)))) return true;
        }
        return false;
    }

    /** Every digit becomes a dot, so the plus sign and the spacing still read as a phone number. */
    static String mask(String formatted) {
        StringBuilder out = new StringBuilder(formatted.length());
        for (int i = 0; i < formatted.length(); i++) {
            char c = formatted.charAt(i);
            out.append(Character.isDigit(c) ? '•' : c);
        }
        return out.toString();
    }

    private static String digits(String text) {
        if (text == null) return "";
        StringBuilder out = new StringBuilder(text.length());
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (c >= '0' && c <= '9') out.append(c);
        }
        return out.toString();
    }

    /** Telegram's own formatting. Replaced with the formatter's method when patching. */
    public static String stockFormat(Object formatter, String raw) { return raw; }

    /** The number of a signed-in account, or null. Replaced when patching. */
    public static String ownPhone(int account) { return null; }

    /** How many accounts Telegram can hold. Replaced when patching. */
    public static int accounts() { return 0; }
}

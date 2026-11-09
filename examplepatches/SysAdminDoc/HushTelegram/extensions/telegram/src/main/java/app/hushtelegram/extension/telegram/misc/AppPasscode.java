/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.os.SystemClock;

import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;

/**
 * Telegram's own app passcode, asked for again before something HushTelegram keeps out of sight.
 * It never stores, sends or reads the passcode itself: Telegram checks what was typed against the
 * one it already holds, and this only reports whether there is one and what Telegram said.
 */
public final class AppPasscode {
    private AppPasscode() {}

    /** Wrong tries in a row before a short wait, so a PIN can't be guessed by tapping through it. */
    static final int MISSES = 5;

    /** How long the wait after [MISSES] wrong tries lasts. */
    static final long WAIT_MILLIS = 30_000L;

    /** Telegram's side, through the stubs below. A test answers it itself. */
    static Telegram telegram = new Stubs();

    private static int missed;
    private static long blockedUntil;

    /** Forgets the wrong tries on record. For tests. */
    static void forgetTries() {
        missed = 0;
        blockedUntil = 0;
    }

    /** How long until another try is let through, or 0 when one is. */
    public static long waitMillis() {
        return Math.max(0, blockedUntil - SystemClock.elapsedRealtime());
    }

    /** Whether the app has a passcode set. False when Telegram can't be asked. */
    public static boolean isSet() {
        try {
            return telegram.passcodeSet();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "app passcode", failure);
            return false;
        }
    }

    /** Whether the passcode is a PIN of digits, so the prompt can show the number keyboard. */
    public static boolean isPin() {
        try {
            return telegram.passcodePin();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "app passcode type", failure);
            return false;
        }
    }

    /** Whether [typed] is the app's passcode. Anything Telegram can't check counts as wrong. */
    public static boolean matches(String typed) {
        try {
            if (waitMillis() > 0 || typed == null || typed.isEmpty()) return false;
            if (telegram.passcodeMatches(typed)) {
                missed = 0;
                return true;
            }
            if (++missed >= MISSES) {
                missed = 0;
                blockedUntil = SystemClock.elapsedRealtime() + WAIT_MILLIS;
            }
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "app passcode check", failure);
            return false;
        }
    }

    /** What this needs from Telegram. */
    interface Telegram {
        boolean passcodeSet();

        boolean passcodePin();

        boolean passcodeMatches(String typed);
    }

    private static final class Stubs implements Telegram {
        @Override public boolean passcodeSet() { return AppPasscode.passcodeSet(); }
        @Override public boolean passcodePin() { return AppPasscode.passcodePin(); }
        @Override public boolean passcodeMatches(String typed) { return AppPasscode.passcodeMatches(typed); }
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** {@code SharedConfig.passcodeHash} is neither null nor empty. */
    public static boolean passcodeSet() { return false; }

    /** {@code SharedConfig.passcodeType == SharedConfig.PASSCODE_TYPE_PIN}. */
    public static boolean passcodePin() { return false; }

    /** {@code SharedConfig.checkPasscode(typed)}. */
    public static boolean passcodeMatches(String typed) { return false; }
}

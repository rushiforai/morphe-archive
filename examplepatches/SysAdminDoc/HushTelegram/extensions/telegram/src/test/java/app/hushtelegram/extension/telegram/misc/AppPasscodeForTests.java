/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Lets tests give the app passcode a Telegram that holds one passcode, and forget the wrong tries. */
public final class AppPasscodeForTests {
    private AppPasscodeForTests() {}

    private static AppPasscode.Telegram saved;

    /** Telegram with [passcode] set, or none when it is null. A PIN when it is all digits. */
    public static final class Fake implements AppPasscode.Telegram {
        public String passcode;
        public int asked;

        public Fake(String passcode) {
            this.passcode = passcode;
        }

        @Override public boolean passcodeSet() { return passcode != null && !passcode.isEmpty(); }
        @Override public boolean passcodePin() { return passcode != null && passcode.chars().allMatch(Character::isDigit); }
        @Override public boolean passcodeMatches(String typed) {
            asked++;
            return typed.equals(passcode);
        }
    }

    public static Fake use(String passcode) {
        if (saved == null) saved = AppPasscode.telegram;
        Fake fake = new Fake(passcode);
        AppPasscode.telegram = fake;
        reset();
        return fake;
    }

    /** Back to the stubs, with no wrong tries on record. */
    public static void restore() {
        if (saved != null) AppPasscode.telegram = saved;
        saved = null;
        reset();
    }

    private static void reset() {
        AppPasscode.forgetTries();
    }
}

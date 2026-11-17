/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Sets {@link DoNotDisturb}'s state for tests outside its package, as a tap on the menu item would. */
public final class DoNotDisturbForTests {
    private DoNotDisturbForTests() {}

    public static void on(boolean on) {
        DoNotDisturb.Stored.ON.save(on);
    }

    public static boolean isOn() {
        return DoNotDisturb.Stored.ON.get();
    }

    public static void forget() {
        DoNotDisturb.Stored.ON.resetToDefault();
    }
}

/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.view.View;

/** Asks {@link ProfileDc} for a row directly, since the unpatched app has no photo data center to read. */
public final class ProfileDcForTests {
    private ProfileDcForTests() {}

    /** Whether a profile menu would get a row for data center 2. */
    public static boolean row(View menu) {
        return ProfileDc.addRow(menu, 2);
    }
}

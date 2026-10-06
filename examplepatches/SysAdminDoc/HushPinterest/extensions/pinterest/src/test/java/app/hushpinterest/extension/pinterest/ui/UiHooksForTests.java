/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

/** Lets tests in other packages name the class the save toast hook treats as a save toast. */
public final class UiHooksForTests {
    private UiHooksForTests() {}

    public static void saveToast(Class<?> type) {
        UiHooks.saveToastForTests = type;
    }
}

/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

/** Lets a test in another package put a pin in the record, which only a save does in the app. */
public final class SavedRecordForTests {
    private SavedRecordForTests() {}

    public static void add(String id) {
        SavedRecord.add(id);
    }
}

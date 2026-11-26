/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import java.util.List;

/** Reaches Hide pins you've already seen's package-level parts from other packages' tests. */
public final class SeenPinsForTests {
    private SeenPinsForTests() {}

    /** Nothing seen, nothing brought, the real clock. */
    public static void clear() {
        SeenPins.clearForTests();
    }

    /** Home's page hook, as SavedPins hands it the page's items. */
    public static void homePage(List<?> items) {
        SeenPins.homePage(items);
    }
}

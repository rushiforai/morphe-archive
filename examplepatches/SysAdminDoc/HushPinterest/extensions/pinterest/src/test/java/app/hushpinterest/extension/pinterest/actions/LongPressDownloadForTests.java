/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import android.view.View;

import org.robolectric.RuntimeEnvironment;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/** Lets tests outside this package long-press a pin. They need LongPressDownloadTest.NativeMenu as a shadow. */
public final class LongPressDownloadForTests {
    private LongPressDownloadForTests() {}

    /** True when a long-pressed pin's menu got the Download button. */
    public static boolean addsDownloadButton() {
        LongPressDownloadTest.Menu menu = new LongPressDownloadTest.Menu(RuntimeEnvironment.getApplication());
        List<Object> buttons = new ArrayList<>();
        buttons.add(new View(menu.getContext()));
        menu.layout(buttons);
        menu.show(new LongPressDownloadTest.Event(Map.of("id", "123456")));
        return menu.items.size() != 2;
    }
}

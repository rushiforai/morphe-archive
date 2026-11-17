/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import org.robolectric.RuntimeEnvironment;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/** Lets tests outside this package long-press a pin. They need LongPressDownloadTest.NativeMenu as a shadow. */
public final class LongPressDownloadForTests {
    private LongPressDownloadForTests() {}

    /** The buttons a hide switch takes out, as {@link #hidesButton} names them. */
    public static final int SAVE = LongPressDownload.SAVE, SEND = LongPressDownload.SEND, SEARCH = LongPressDownload.SEARCH,
            SEND_APP = LongPressDownload.SEND_APP;

    /** True when a long-pressed pin's menu got the Download button. */
    public static boolean addsDownloadButton() {
        LongPressDownloadTest.Menu menu = new LongPressDownloadTest.Menu(RuntimeEnvironment.getApplication());
        List<Object> buttons = new ArrayList<>();
        buttons.add(new LongPressDownloadTest.Button(menu.getContext()));
        menu.layout(buttons);
        menu.show(new LongPressDownloadTest.Event(Map.of("id", "123456")));
        return menu.items.size() != 2;
    }

    /** True when a long-pressed picture's menu got the View button. Nothing is tapped, so nothing is fetched. */
    public static boolean addsViewButton() {
        int label = LongPressDownloadTest.NativeMenu.label;
        LongPressDownloadTest.NativeMenu.label = android.R.string.ok;
        try {
            LongPressDownloadTest.Menu menu = new LongPressDownloadTest.Menu(RuntimeEnvironment.getApplication());
            List<Object> buttons = new ArrayList<>();
            buttons.add(new LongPressDownloadTest.Button(menu.getContext()));
            menu.layout(buttons);
            menu.show(new LongPressDownloadTest.Event(Map.of("id", "123456", "images",
                    Map.of("orig", Map.of("url", "https://i.pinimg.com/originals/123456.jpg")))));
            for (Object item : menu.items) {
                if (LongPressDownload.VIEW_TAG.equals(((android.view.View) item).getTag())) return true;
            }
            return false;
        } finally {
            LongPressDownloadTest.NativeMenu.label = label;
        }
    }

    /** True when a long-pressed pin's menu of Save, Send, Search image and Send with an app lost the one of [kind]. */
    public static boolean hidesButton(int kind) {
        LongPressDownloadTest.Menu menu = new LongPressDownloadTest.Menu(RuntimeEnvironment.getApplication());
        List<Object> buttons = new ArrayList<>();
        for (int each : new int[]{SAVE, SEND, SEARCH, SEND_APP}) buttons.add(new LongPressDownloadTest.Button(menu.getContext(), each));
        menu.layout(buttons);
        Object button = buttons.get(kind - SAVE);
        menu.show(new LongPressDownloadTest.Event(Map.of("id", "123456")));
        return !menu.items.contains(button);
    }
}

/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.view.View;
import java.util.function.Consumer;
import org.robolectric.RuntimeEnvironment;

/** Lets a test in another package ask whether the chat list's new message button got hidden. */
public final class MainTabsForTests {
    private MainTabsForTests() {}

    public static boolean hidesNewMessage() {
        View button = new View(RuntimeEnvironment.getApplication());
        MainTabs.newMessageButton(button);
        return button.getVisibility() == View.GONE;
    }

    /** Whether the main screen's bar glass, registered as Telegram builds it, gets an outline. */
    public static boolean outlinesBar() {
        Object colors = new Object();
        MainTabs.barGlass(colors);
        return MainTabs.barOutlineColor(colors, 0) != 0 && MainTabs.barOutlineWidth(colors, 0f) > 0f;
    }

    /** Stands in for the patched stub that has the chat list draw its Downloads button again. */
    public static void redrawWith(Consumer<Object> redraw) {
        MainTabs.downloadsRedraw = redraw;
    }

    /** Back to the stub, with no chat list remembered. */
    public static void restore() {
        MainTabs.clearDownloadsForTests();
    }
}

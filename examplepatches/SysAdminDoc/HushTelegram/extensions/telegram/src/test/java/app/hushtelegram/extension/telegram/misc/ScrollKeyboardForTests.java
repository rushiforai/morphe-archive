/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.robolectric.Shadows.shadowOf;

import android.view.View;
import android.view.inputmethod.InputMethodManager;
import org.robolectric.RuntimeEnvironment;

/** Drags a stand-in chat list with Robolectric's keyboard up. */
public final class ScrollKeyboardForTests {
    private ScrollKeyboardForTests() {}

    /** Whether a finger starting to drag the list closed the keyboard. */
    public static boolean dragCloses() {
        View list = new View(RuntimeEnvironment.getApplication());
        InputMethodManager keyboard = list.getContext().getSystemService(InputMethodManager.class);
        keyboard.showSoftInput(list, 0);
        ScrollKeyboard.chatScrolled(list, ScrollKeyboard.DRAGGING);
        return !shadowOf(keyboard).isSoftInputVisible();
    }
}

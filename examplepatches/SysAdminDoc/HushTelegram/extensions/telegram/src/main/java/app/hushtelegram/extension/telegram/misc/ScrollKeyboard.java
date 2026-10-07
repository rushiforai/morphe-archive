/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.os.Build;
import android.view.View;
import android.view.WindowInsets;
import android.view.inputmethod.InputMethodManager;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * A chat's message list tells its scroll listener each time scrolling starts or stops, and the
 * listener tells this class first. Telegram itself closes the keyboard there only while you search
 * the chat. Telegram's own emoji and sticker panel isn't the system keyboard and stays open.
 */
public final class ScrollKeyboard {
    /** RecyclerView's state for a finger starting to drag the list. */
    static final int DRAGGING = 1;

    private ScrollKeyboard() {}

    /**
     * Called first when the chat's message list starts or stops scrolling.
     *
     * @param list the message list
     * @param state RecyclerView's new scroll state
     */
    public static void chatScrolled(View list, int state) {
        HookStatus.invoked(FamilyNames.HIDE_KEYBOARD_ON_SCROLL);
        try {
            if (list == null || !closes(state) || !keyboardShown(list)) return;
            InputMethodManager keyboard = list.getContext().getSystemService(InputMethodManager.class);
            if (keyboard != null && keyboard.hideSoftInputFromWindow(list.getWindowToken(), 0)) {
                HookStatus.counted(FamilyNames.HIDE_KEYBOARD_ON_SCROLL, "keyboard closed on scroll");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_KEYBOARD_ON_SCROLL, "keyboard on scroll", failure);
        }
    }

    /** Whether a scroll in [state] closes the keyboard: a finger starting to drag, with the switch on. */
    static boolean closes(int state) {
        return state == DRAGGING && Utils.settingsReady() && Settings.HIDE_KEYBOARD_ON_SCROLL.get();
    }

    /** Whether the system keyboard is up. Before Android 11 the window can't say, so the answer is yes. */
    static boolean keyboardShown(View view) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) return true;
        WindowInsets insets = view.getRootWindowInsets();
        return insets == null || insets.isVisible(WindowInsets.Type.ime());
    }
}

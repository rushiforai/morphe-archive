/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.view.View;
import android.view.inputmethod.InputMethodManager;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowInputMethodManager;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ScrollKeyboardTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int IDLE = 0;
    private static final int SETTLING = 2;

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_KEYBOARD_ON_SCROLL);
        Settings.HIDE_KEYBOARD_ON_SCROLL.resetToDefault();
        HookStatus.clear();
    }

    /** The keyboard, shown for [list]. */
    private static ShadowInputMethodManager keyboardUpFor(View list) {
        InputMethodManager keyboard = list.getContext().getSystemService(InputMethodManager.class);
        keyboard.showSoftInput(list, 0);
        ShadowInputMethodManager shadow = shadowOf(keyboard);
        assertTrue(shadow.isSoftInputVisible());
        return shadow;
    }

    @Test public void offByDefaultLeavesTheKeyboardUp() {
        assertFalse(Settings.HIDE_KEYBOARD_ON_SCROLL.get());
        View list = new View(RuntimeEnvironment.getApplication());
        ShadowInputMethodManager keyboard = keyboardUpFor(list);
        ScrollKeyboard.chatScrolled(list, ScrollKeyboard.DRAGGING);
        assertTrue(keyboard.isSoftInputVisible());
    }

    @Test public void onADragClosesTheKeyboard() {
        Settings.HIDE_KEYBOARD_ON_SCROLL.save(true);
        View list = new View(RuntimeEnvironment.getApplication());
        ShadowInputMethodManager keyboard = keyboardUpFor(list);
        ScrollKeyboard.chatScrolled(list, ScrollKeyboard.DRAGGING);
        assertFalse(keyboard.isSoftInputVisible());
        assertTrue(String.join("\n", HookStatus.report()).contains("keyboard closed on scroll 1"));
    }

    @Test public void onlyAFingerStartingToDragCounts() {
        Settings.HIDE_KEYBOARD_ON_SCROLL.save(true);
        View list = new View(RuntimeEnvironment.getApplication());
        ShadowInputMethodManager keyboard = keyboardUpFor(list);
        // A fling settling or the list stopping, as after a new message scrolls it, leaves it up.
        ScrollKeyboard.chatScrolled(list, SETTLING);
        ScrollKeyboard.chatScrolled(list, IDLE);
        assertTrue(keyboard.isSoftInputVisible());
        assertFalse(ScrollKeyboard.closes(SETTLING));
        assertTrue(ScrollKeyboard.closes(ScrollKeyboard.DRAGGING));
    }

    @Test public void noListIsLeftAlone() {
        Settings.HIDE_KEYBOARD_ON_SCROLL.save(true);
        ScrollKeyboard.chatScrolled(null, ScrollKeyboard.DRAGGING);
        assertTrue(HookStatus.missing(FamilyNames.HIDE_KEYBOARD_ON_SCROLL).isEmpty());
    }

    @Test public void pausingOrAnEarlyStartLeavesTheKeyboardUp() {
        Settings.HIDE_KEYBOARD_ON_SCROLL.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), ScrollKeyboard.closes(ScrollKeyboard.DRAGGING));
            assertTrue(Settings.HIDE_KEYBOARD_ON_SCROLL.savedValue());
            PauseForTests.resume();
            assertTrue(reason.name(), ScrollKeyboard.closes(ScrollKeyboard.DRAGGING));
        }
        SettingsContextRule.withoutContext(() -> assertFalse(ScrollKeyboard.closes(ScrollKeyboard.DRAGGING)));
    }

    @Test public void anUnreadableSwitchLeavesTheKeyboardUpAndReportsIt() {
        Settings.HIDE_KEYBOARD_ON_SCROLL.save(true);
        SettingReadsForTests.breakReads(Settings.HIDE_KEYBOARD_ON_SCROLL);
        View list = new View(RuntimeEnvironment.getApplication());
        ShadowInputMethodManager keyboard = keyboardUpFor(list);
        ScrollKeyboard.chatScrolled(list, ScrollKeyboard.DRAGGING);
        assertTrue(keyboard.isSoftInputVisible());
        assertFalse(HookStatus.missing(FamilyNames.HIDE_KEYBOARD_ON_SCROLL).isEmpty());
    }
}

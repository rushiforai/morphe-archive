/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import androidx.annotation.Nullable;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What Share sheet items' group switch answers in Facebook's share sheet (#104). Pick two or more
 * people and the sheet's footer offers Send to group, which makes a new group chat of them, beside
 * the send button, which then sends to each of them separately. Some sheets also offer a new group
 * of their own: a row above the people, an icon on their header or a button beside the search box,
 * each one Facebook turns on for some accounts. With the switch on, the footer is built without
 * Send to group and every new-group entry answers as though Facebook had left it off, so Send
 * separately is the one way to send to several people.
 *
 * <p>The hooks go in only with Share sheet items. Off, paused, settings that aren't ready yet, or
 * a failure in here, and each answer is Facebook's own.
 */
public final class ShareSheetGroups {
    /** Counted under the patch's name each time a footer is built without its Send to group button. */
    static final String BUTTON_KEPT_OUT = "Send to group button kept out";

    /** Counted under the patch's name each time a new-group entry is answered off. */
    static final String ENTRY_KEPT_OUT = "New group entry kept out";

    private static final String FAMILY = FamilyNames.SHARE_SHEET_ITEMS;

    private static volatile boolean logged;

    private ShareSheetGroups() {
    }

    /**
     * The hook where the share sheet footer's guards meet, handed the Send to group button, or null
     * when Facebook didn't build one. Answers null with the switch on, so the footer lays itself
     * out as it does for one pick, and the button otherwise. Never throws.
     */
    @Nullable
    public static Object sendToGroupButton(@Nullable Object button) {
        HookStatus.invoked(FAMILY);
        // Settings mustn't load before the extension has its context.
        if (button == null || !Utils.settingsReady()) return button;
        try {
            if (!Settings.HIDE_SHARE_GROUP_BUTTONS.get()) return button;
            HookStatus.bound(FAMILY, "send to group button");
            HookStatus.counted(FAMILY, BUTTON_KEPT_OUT);
            logOnce();
            return null;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "send to group button", failure);
            return button;
        }
    }

    /**
     * The hook after the boolean that decides whether a new-group row, header icon or search button
     * is drawn, handed Facebook's answer. Answers false with the switch on, and Facebook's answer
     * otherwise. Never throws.
     */
    public static boolean offerNewGroup(boolean offered) {
        HookStatus.invoked(FAMILY);
        if (!offered || !Utils.settingsReady()) return offered;
        try {
            if (!Settings.HIDE_SHARE_GROUP_BUTTONS.get()) return true;
            HookStatus.bound(FAMILY, "new group entry");
            HookStatus.counted(FAMILY, ENTRY_KEPT_OUT);
            logOnce();
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "new group entry", failure);
            return true;
        }
    }

    private static void logOnce() {
        if (logged) return;
        logged = true;
        Logger.printDebug(() -> "Share sheet items: kept a group button out of a share sheet");
    }

    /** Forgets the one-time log line. Tests only. */
    static void forgetForTests() {
        logged = false;
    }
}

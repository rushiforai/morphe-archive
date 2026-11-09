/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.util.SparseArray;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * The Administrators row in the side menu: a tap shows only the groups and channels you own or
 * manage, and a second tap brings the rest back. It runs in the prune hook that already follows
 * every sort, so it only changes what this phone lists. Nothing is sent to Telegram, and it starts
 * off again each time Telegram restarts.
 */
public final class AdminChats {
    private AdminChats() {}

    /** What the diagnostic report counts each sort that left only your administrator chats as. */
    static final String FILTERED = "chat list limited to administrator chats";

    /** Telegram's side, through the stub below. A test answers it itself. */
    static Telegram telegram = new Stubs();

    private static volatile boolean active;

    /** Whether the row belongs in the side menu: its switch is on and this build can filter. */
    public static boolean available() {
        try {
            return Utils.settingsReady() && Settings.ADMIN_CHATS.get() && PatchFamily.Capability.ADMIN_CHATS.installed();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "administrators row", failure);
            return false;
        }
    }

    /** Whether the chat list shows only the chats you manage right now. */
    public static boolean showing() {
        return active && available();
    }

    /** Turns the filter on or off, refreshes the chat list and says which it is. Main thread only. */
    public static void toggle() {
        active = !active;
        HiddenChats.refreshAll();
        Utils.showToastShort(active ? L10n.t("Showing chats you manage.") : L10n.t("Showing all chats."));
    }

    /** The side menu row's words: what a tap does next. */
    public static String rowLabel() {
        return showing() ? L10n.t("Show all chats") : L10n.t("Administrators");
    }

    /**
     * Called from {@link HiddenChats#prune} after the hidden chats left: takes every chat that isn't
     * yours to manage out of each folder's list and each folder tab's list, while the filter is on.
     */
    static void prune(Object controller) {
        try {
            if (!showing()) return;
            HiddenChats.Telegram chats = HiddenChats.telegram;
            SparseArray<?> folders = chats.folders(controller);
            for (int i = 0; folders != null && i < folders.size(); i++) keepAdmin(controller, folders.valueAt(i));
            Object[] tabs = chats.selectedFilters(controller);
            for (int i = 0; tabs != null && i < tabs.length; i++) {
                if (tabs[i] != null) keepAdmin(controller, chats.filterDialogs(tabs[i]));
            }
            HookStatus.counted(FamilyNames.HIDE_FOLDER_COUNTERS, FILTERED);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "administrator chats", failure);
        }
    }

    private static void keepAdmin(Object controller, @Nullable Object list) {
        if (!(list instanceof List)) return;
        List<?> dialogs = (List<?>) list;
        // Asked of every chat before any leaves, so a Telegram that fails midway leaves the list as it was.
        List<Object> leaving = new ArrayList<>();
        for (Object dialog : dialogs) {
            if (dialog == null || !manages(controller, HiddenChats.telegram.dialogId(dialog))) leaving.add(dialog);
        }
        for (Object gone : leaving) {
            Iterator<?> each = dialogs.iterator();
            while (each.hasNext()) {
                if (each.next() == gone) {
                    each.remove();
                    break;
                }
            }
        }
    }

    /** Ends the filter without touching the list. For tests. */
    static void forget() {
        active = false;
    }

    /** Whether a chat by its dialog id is a group or channel you own or administer. A person never is. */
    static boolean manages(Object controller, long dialogId) {
        return dialogId < 0 && telegram.isAdmin(controller, -dialogId);
    }

    /** What this needs from Telegram. */
    interface Telegram {
        boolean isAdmin(Object controller, long chatId);
    }

    private static final class Stubs implements Telegram {
        @Override public boolean isAdmin(Object controller, long chatId) { return AdminChats.isAdmin(controller, chatId); }
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** The chat's {@code creator} flag, or its {@code admin_rights} not being null. */
    public static boolean isAdmin(Object controller, long chatId) { return false; }
}

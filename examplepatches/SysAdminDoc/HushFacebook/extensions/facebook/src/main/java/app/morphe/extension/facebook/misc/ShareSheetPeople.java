/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import androidx.annotation.Nullable;

import java.util.AbstractCollection;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What Share sheet items' people switch answers in Facebook's share sheet (#169): the row of round
 * profile pictures of people to send the post to, and the placeholder drawn while it loads. The
 * sheet's body adds each of them to the list of children it is collecting; with the switch on that
 * add is skipped, so the row is never part of the sheet. The search box and the other ways to share
 * stay.
 *
 * <p>The hook goes in only with Share sheet items. Off, paused, settings that aren't ready yet, or
 * a failure in here, and the row is added as Facebook meant to.
 */
public final class ShareSheetPeople {
    /** Counted under the patch's name each time a people row is left out of a share sheet. */
    static final String ROW_KEPT_OUT = "People row kept out";

    private static final String FAMILY = FamilyNames.SHARE_SHEET_ITEMS;

    private static volatile boolean logged;

    private ShareSheetPeople() {
    }

    /**
     * The hook in place of the sheet's {@code children.add(row)} for a people row. Answers false
     * without adding when the switch is on, and does the add otherwise. Never throws on its own
     * account: a failure reading the switch adds the row.
     */
    public static boolean addRow(AbstractCollection<Object> children, @Nullable Object row) {
        HookStatus.invoked(FAMILY);
        if (hidden()) return false;
        return children.add(row);
    }

    /**
     * The hook in place of the shared helper some builds add a people row through, which adds the
     * row and then {@code next} when there is one. The row goes through {@link #addRow}; {@code next}
     * is another part of the sheet and is always added.
     */
    public static void addRowThen(@Nullable Object row, @Nullable Object next, AbstractCollection<Object> children) {
        addRow(children, row);
        if (next != null) children.add(next);
    }

    private static boolean hidden() {
        // Settings mustn't load before the extension has its context.
        if (!Utils.settingsReady()) return false;
        try {
            if (!Settings.HIDE_SHARE_PEOPLE_ROW.get()) return false;
            HookStatus.bound(FAMILY, "people row");
            HookStatus.counted(FAMILY, ROW_KEPT_OUT);
            if (!logged) {
                logged = true;
                Logger.printDebug(() -> "Share sheet items: kept the people row out of a share sheet");
            }
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "people row", failure);
            return false;
        }
    }

    /** Forgets the one-time log line. Tests only. */
    static void forgetForTests() {
        logged = false;
    }
}

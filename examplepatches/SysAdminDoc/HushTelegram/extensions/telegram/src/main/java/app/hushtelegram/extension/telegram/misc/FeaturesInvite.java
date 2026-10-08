/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;

/**
 * Settings has a Telegram Features row under Help, and the Contacts list starts with Invite
 * Friends, or lists your phone's contacts to invite when none of them use Telegram. With the
 * switch on, Settings leaves the Features row out and Contacts leaves out the invite rows, with
 * Recent Calls and your contacts moving up. Nothing else in either list changes.
 */
public final class FeaturesInvite {
    private FeaturesInvite() {}

    /** A list that isn't the Contacts list, or one without invite rows. */
    static final int NO_INVITES = 0;
    /** Contacts with Invite Friends as the first row of its first section. */
    static final int INVITE_ROW = 1;
    /** Contacts with none of your contacts on Telegram: its second section lists people to invite. */
    static final int INVITE_LIST = 2;

    /** Adds Settings' Telegram Features row unless the switch hides it. */
    public static boolean addFeaturesRow(ArrayList<Object> rows, Object row) {
        if (rows != null && row != null && on()) {
            HookStatus.counted(FamilyNames.HIDE_FEATURES_AND_INVITE, "Telegram Features hidden");
            return false;
        }
        return rows.add(row);
    }

    /**
     * Asked whenever a sectioned list counts the rows of one section.
     *
     * @param adapter the list's adapter, any of Telegram's sectioned lists
     * @return Telegram's count, less the invite rows for Contacts with the switch on
     */
    public static int sectionCount(Object adapter, int section, int count) {
        if (section < 0 || section > 1 || count < 1) return count;
        try {
            int hidden = hiddenRows(inviteLayout(adapter), section, count);
            if (hidden == 0 || !on()) return count;
            HookStatus.counted(FamilyNames.HIDE_FEATURES_AND_INVITE, "invite rows hidden");
            return count - hidden;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FEATURES_AND_INVITE, "contacts count", failure);
            return count;
        }
    }

    /**
     * Asked whenever a sectioned list turns a row of the whole list into a row of its section.
     *
     * @return Telegram's row, moved past a hidden Invite Friends row
     */
    public static int sectionRow(Object adapter, int section, int row) {
        if (section != 0 || row < 0) return row;
        try {
            int shift = shift(inviteLayout(adapter), section);
            if (shift == 0 || !on()) return row;
            return row + shift;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FEATURES_AND_INVITE, "contacts row", failure);
            return row;
        }
    }

    /** How many of a section's rows are invites: Invite Friends, or the whole invite list. */
    static int hiddenRows(int layout, int section, int count) {
        if (layout == INVITE_ROW && section == 0) return 1;
        if (layout == INVITE_LIST && section == 1) return count;
        return 0;
    }

    /** How far a row of the section moves to skip a hidden Invite Friends row before it. */
    static int shift(int layout, int section) {
        return layout == INVITE_ROW && section == 0 ? 1 : 0;
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.HIDE_FEATURES_AND_INVITE);
        try {
            return Utils.settingsReady() && Settings.HIDE_FEATURES_AND_INVITE.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FEATURES_AND_INVITE, "switch", failure);
            return false;
        }
    }

    /** Which invite rows the adapter shows: one of the constants above. Replaced when patching. */
    public static int inviteLayout(Object adapter) { return NO_INVITES; }
}

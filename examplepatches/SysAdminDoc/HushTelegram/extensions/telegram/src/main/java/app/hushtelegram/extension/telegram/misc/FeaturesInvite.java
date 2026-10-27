/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.SharedPreferences;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.Setting;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Settings has a Telegram Features row under Help, and the Contacts list starts with Invite
 * Friends, or lists your phone's contacts to invite when none of them use Telegram. With the
 * switch on, Settings leaves the Features row out and Contacts leaves out the invite rows, with
 * Recent Calls and your contacts moving up. Nothing else in either list changes. Settings keeps
 * the rows it built while it stays open, so a flip of the switch asks each Settings screen to
 * build its list again.
 */
public final class FeaturesInvite {
    private FeaturesInvite() {}

    /** Settings screens that built their list, held weakly. Telegram builds lists on the main thread. */
    private static final Set<Object> SHOWN = Collections.newSetFromMap(new WeakHashMap<>());
    /** Held here because SharedPreferences keeps its listeners weakly. */
    private static SharedPreferences.OnSharedPreferenceChangeListener watch;

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

    /** Asked as a Settings screen starts building its list, so a later flip of the switch builds it again. */
    public static void listShown(Object settings) {
        if (settings == null) return;
        SHOWN.add(settings);
        if (watch != null) return;
        try {
            String key = Settings.HIDE_FEATURES_AND_INVITE.key;
            SharedPreferences.OnSharedPreferenceChangeListener listener = (store, changed) -> {
                if (key.equals(changed)) Utils.runOnMainThread(FeaturesInvite::rebuildShown);
            };
            Setting.preferences.preferences.registerOnSharedPreferenceChangeListener(listener);
            watch = listener;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FEATURES_AND_INVITE, "switch watch", failure);
        }
    }

    /** Builds every shown Settings list again, which asks {@link #addFeaturesRow} anew. */
    static void rebuildShown() {
        for (Object settings : new ArrayList<>(SHOWN)) {
            try {
                rebuildList(settings);
                HookStatus.counted(FamilyNames.HIDE_FEATURES_AND_INVITE, "Settings list rebuilt");
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.HIDE_FEATURES_AND_INVITE, "settings rebuild", failure);
            }
        }
    }

    /** Asks one Settings screen's list to build its rows again. Replaced when patching. */
    public static void rebuildList(Object settings) {}

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

    /** Lets tests see which Settings screens a flip would rebuild. */
    static Set<Object> shown() { return SHOWN; }

    /** Which invite rows the adapter shows: one of the constants above. Replaced when patching. */
    public static int inviteLayout(Object adapter) { return NO_INVITES; }
}

/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Modified for HushGram (Instagram), 2026.
 */
package app.hushgram.extension.instagram.settings;

import static app.hushgram.extension.instagram.settings.HushgramPreferenceFragment.category;
import static app.hushgram.extension.instagram.settings.HushgramPreferenceFragment.toggle;

import android.content.Context;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;

import java.util.Set;

import app.hushgram.extension.instagram.misc.NotificationGroups;
import app.hushgram.extension.shared.L10n;

/** Builds the Notifications category of HushGram settings. */
final class NotificationsCategory {
    private NotificationsCategory() { }

    static void add(HushgramPreferenceFragment page, PreferenceScreen screen, Context context, Set<PatchFamily> build) {
        if (build.contains(PatchFamily.NOTIFICATION_GROUPS)) {
            PreferenceCategory notifications = category(screen, L10n.t("Notifications"), SettingsIcons.NOTIFICATIONS,
                    L10n.t("Group Instagram's notifications so they don't pile up."));
            SwitchPreference grouping = toggle(context, Settings.GROUP_NOTIFICATIONS, L10n.t("Group notifications"),
                    L10n.t("Puts every notification from Instagram in one group that shows how many it holds, so they "
                            + "don't fill your notification shade. Tapping one still opens it."));
            // Turned off, HushGram's summaries come down at once. The notifications under them stay.
            grouping.setOnPreferenceChangeListener((row, value) -> {
                if (Boolean.FALSE.equals(value)) NotificationGroups.switchedOff(row.getContext());
                return true;
            });
            notifications.addPreference(grouping);
            notifications.addPreference(toggle(context, Settings.GROUP_NOTIFICATIONS_BY_TYPE, L10n.t("Group by type"),
                    L10n.t("A group for each kind of notification, such as comments or messages, in place of one group.")));
        }
    }
}

/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.settings.preference.categories;

import android.content.Context;
import android.preference.PreferenceScreen;

import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.preference.InputTextPreference;
import app.morphe.extension.tiktok.settings.preference.ShareActionChecklistPreference;
import app.morphe.extension.tiktok.settings.preference.ShareAppPickerPreference;
import app.morphe.extension.tiktok.settings.preference.TogglePreference;
import app.morphe.extension.tiktok.share.ShareSurface;

@SuppressWarnings("deprecation")
public final class SharePreferenceCategory extends ConditionalPreferenceCategory {
    public SharePreferenceCategory(Context context, PreferenceScreen screen) {
        super(context, screen);
        setTitle("Share sheet");
    }

    /** Whether this page has anything on it. The row into it asks the same question. */
    public static boolean isAvailable() {
        return SettingsStatus.shareSheetEnabled || SettingsStatus.duetStitchEnabled;
    }

    @Override
    public boolean getSettingsStatus() {
        return isAvailable();
    }

    @Override
    public void addPreferences(Context context) {
        if (SettingsStatus.shareSheetEnabled) {
            addPreference(new TogglePreference(context, "Hide sharing apps", "Hide the Share via row.", Settings.HIDE_SHARE_CHANNELS));
            addPreference(new ShareAppPickerPreference(context));
            addPreference(new TogglePreference(context, "Hide video actions", "Hide the actions row of the share sheet.", Settings.HIDE_SHARE_ACTIONS));
            addPreference(new TogglePreference(
                    context,
                    "Hide the Send to row",
                    "Hide the row of friends at the top of the share sheet.",
                    Settings.HIDE_SHARE_CONTACTS
            ));
            addPreference(new ShareActionChecklistPreference(context));
            addPreference(new ShareActionChecklistPreference(context, ShareSurface.PROFILE));
            addPreference(new ShareActionChecklistPreference(context, ShareSurface.LIVE));
            addPreference(new InputTextPreference(
                    context,
                    "Hide people and options by name",
                    "Comma separated names exactly as the share sheet shows them: friends in the "
                            + "Send to row, share targets such as Facebook, and actions such as "
                            + "Create group or Repost. Stable keys such as copy, save and dislike also work before the sheet opens.",
                    Settings.SHARE_HIDDEN_ITEMS
            ));
        }
        // Duet and Stitch are entries in this sheet. The switch was on App's Player card.
        if (SettingsStatus.duetStitchEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Allow Duet and Stitch anyway",
                    "Ignore the creator's choice so the Duet and Stitch entries appear. "
                            + "Everything else the app checks still applies, and whether the "
                            + "upload is accepted is the server's decision.",
                    Settings.ALLOW_DUET_AND_STITCH
            ));
        }
    }
}

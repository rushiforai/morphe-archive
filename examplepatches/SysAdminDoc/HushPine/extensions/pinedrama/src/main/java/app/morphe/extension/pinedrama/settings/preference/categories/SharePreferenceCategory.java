/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.pinedrama.settings.preference.categories;

import android.content.Context;
import android.preference.PreferenceScreen;

import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.pinedrama.settings.SettingsStatus;
import app.morphe.extension.pinedrama.settings.preference.TogglePreference;

@SuppressWarnings("deprecation")
public final class SharePreferenceCategory extends ConditionalPreferenceCategory {
    public SharePreferenceCategory(Context context, PreferenceScreen screen) {
        super(context, screen);
        setTitle("Share sheet");
    }

    /** Whether this page has anything on it. The row into it asks the same question. */
    public static boolean isAvailable() {
        return SettingsStatus.duetStitchEnabled;
    }

    @Override
    public boolean getSettingsStatus() {
        return isAvailable();
    }

    @Override
    public void addPreferences(Context context) {
        // Duet and Stitch are entries in this sheet. The switch was on App's Player card.
        if (SettingsStatus.duetStitchEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Allow Duet and Stitch anyway",
                    "Shows the Duet and Stitch options even when the creator turned them off. "
                            + "PineDrama may still refuse to accept the result.",
                    Settings.ALLOW_DUET_AND_STITCH
            ));
            addPreference(new TogglePreference(
                    context,
                    "Allow Add to Story anyway",
                    "Shows Add to Story in the share sheet even when the creator "
                            + "turned off content reuse. PineDrama may still refuse to post it.",
                    Settings.ALLOW_ADD_TO_STORY
            ));
        }
    }
}

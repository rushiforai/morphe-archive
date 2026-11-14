/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-12
 */

package app.morphe.extension.shared.settings.preference;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.content.Context;
import android.util.AttributeSet;

import app.morphe.extension.shared.settings.SharedYouTubeSettings;

@SuppressWarnings({"unused", "deprecation"})
public class PatchesUpdateChannelPreference extends CustomDialogListPreference {
    public PatchesUpdateChannelPreference(Context context, AttributeSet attributes) {
        super(context, attributes);

        setEntries(new CharSequence[]{str("revanced_patches_update_off"), str("revanced_patches_update_stable"),
                str("revanced_patches_update_development")});
        setEntryValues(new String[]{"OFF", "STABLE", "DEV"});
        setValue(SharedYouTubeSettings.PATCHES_UPDATE_NOTICE.get());
        setSummary("%s");
    }
}

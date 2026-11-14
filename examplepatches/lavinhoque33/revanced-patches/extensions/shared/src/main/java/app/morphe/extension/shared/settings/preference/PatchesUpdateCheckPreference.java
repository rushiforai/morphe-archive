/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-12
 */

package app.morphe.extension.shared.settings.preference;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.preference.Preference;
import android.util.AttributeSet;

import app.morphe.extension.shared.patches.PatchesUpdateNoticePatch;
import app.morphe.extension.shared.utils.Utils;

@SuppressWarnings({"unused", "deprecation"})
public class PatchesUpdateCheckPreference extends Preference {
    public PatchesUpdateCheckPreference(Context context, AttributeSet attributes) {
        super(context, attributes);

        setOnPreferenceClickListener(preference -> {
            Context owner = getContext();
            while (!(owner instanceof Activity) && owner instanceof ContextWrapper wrapper) {
                Context base = wrapper.getBaseContext();
                if (base == owner) break;
                owner = base;
            }
            Activity activity = owner instanceof Activity ? (Activity) owner : Utils.getActivity();
            if (activity != null) PatchesUpdateNoticePatch.checkNow(activity);
            return true;
        });
    }
}

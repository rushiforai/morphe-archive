/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.music.settings.preference;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.preference.Preference;
import android.util.AttributeSet;

import app.morphe.extension.music.patches.downloads.MusicDeviceExport;
import app.morphe.extension.music.settings.ActivityHook;

@SuppressWarnings({"deprecation", "unused"})
public final class ExportDeviceFilesPreference extends Preference {
    public ExportDeviceFilesPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        setPersistent(false);
    }

    @Override
    protected void onClick() {
        Context context = getContext();
        while (!(context instanceof Activity) && context instanceof ContextWrapper wrapper) {
            context = wrapper.getBaseContext();
        }
        Activity activity = context instanceof Activity host ? host : ActivityHook.getActivity();
        if (activity != null && !activity.isFinishing() && !activity.isDestroyed()) MusicDeviceExport.show(activity);
    }
}

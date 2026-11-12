/*
 * SPDX-License-Identifier: GPL-3.0-only
 * Copyright (C) 2026 ShortEnigma0
 * Expert RAW extension for Morphe. See LICENSE and NOTICE in the repository root.
 */
package app.morphe.extension.expertraw;

import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.util.AttributeSet;
import android.util.Log;
import com.samsung.android.app.galaxyraw.setting.CameraSwitchPreference;

/**
 * Settings switch that persists itself to PpBypass prefs and ignores the settings fragment's
 * listeners (the fragment vetoes / redirects preference keys it doesn't know).
 */
@SuppressWarnings("unused")
public class PpBypassPreference extends CameraSwitchPreference {
    private boolean mAttached = false;

    public PpBypassPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override
    public void onAttached() {
        super.onAttached();
        super.setChecked(PpBypass.isEnabled(getContext()));
        mAttached = true;
    }

    @Override
    public void setChecked(boolean checked) {
        boolean old = PpBypass.isEnabled(getContext());
        super.setChecked(checked);
        if (mAttached && old != checked) {
            PpBypass.set(getContext(), checked);
            showRestartDialog();
        }
    }

    @Override
    public boolean callChangeListener(Object newValue) {
        if (newValue instanceof Boolean) {
            boolean checked = (Boolean) newValue;
            boolean old = PpBypass.isEnabled(getContext());
            if (mAttached && old != checked) {
                PpBypass.set(getContext(), checked);
                showRestartDialog();
            }
        }
        return true;
    }

    private void showRestartDialog() {
        final Context context = getContext();
        if (context == null) return;
        try {
            new AlertDialog.Builder(context)
                .setTitle("Restart Expert RAW")
                .setMessage("Restart the app to apply changes?")
                .setPositiveButton("Restart", (dialog, which) -> restartApp(context))
                .setNegativeButton("Later", null)
                .show();
        } catch (Throwable t) {
            Log.w(PpBypass.TAG, "Could not show restart dialog: " + t);
        }
    }

    private static void restartApp(Context context) {
        try {
            String packageName = context.getPackageName();
            Intent intent = context.getPackageManager().getLaunchIntentForPackage(packageName);
            if (intent != null) {
                Intent restartIntent = Intent.makeRestartActivityTask(intent.getComponent());
                restartIntent.setPackage(packageName);
                context.startActivity(restartIntent);
                Runtime.getRuntime().exit(0);
            }
        } catch (Throwable t) {
            Log.w(PpBypass.TAG, "restartApp failed: " + t);
        }
    }

    @Override
    public void setOnPreferenceClickListener(OnPreferenceClickListener listener) {
    }

    @Override
    public void setOnPreferenceChangeListener(OnPreferenceChangeListener listener) {
    }
}

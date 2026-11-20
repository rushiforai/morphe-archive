/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-19.
 */

package app.morphe.extension.youtube.patches.shorts;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.view.View;

import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.youtube.settings.Settings;

/** A drawing-only switch for the native, background-only Shorts scrims. */
public final class ShortsScrimView extends View implements SharedPreferences.OnSharedPreferenceChangeListener {
    private boolean hideDimming;

    public ShortsScrimView(Context context) {
        super(context);
    }

    public ShortsScrimView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        Setting.preferences.preferences.registerOnSharedPreferenceChangeListener(this);
        updateDimming();
    }

    @Override
    protected void onDetachedFromWindow() {
        Setting.preferences.preferences.unregisterOnSharedPreferenceChangeListener(this);
        super.onDetachedFromWindow();
    }

    @Override
    public void onSharedPreferenceChanged(SharedPreferences preferences, String key) {
        if (key == null || Settings.HIDE_SHORTS_DIMMING.key.equals(key)) {
            updateDimming();
        }
    }

    private void updateDimming() {
        var setting = Settings.HIDE_SHORTS_DIMMING;
        // The settings fragment receives the same callback; its in-memory value may not be updated yet.
        boolean hide = Setting.preferences.getBoolean(setting.key, setting.defaultValue);
        if (hideDimming != hide) {
            hideDimming = hide;
            invalidate();
        }
    }

    @Override
    public void draw(Canvas canvas) {
        // Keep native visibility, hit testing, dimensions and drawable state unchanged.
        if (!hideDimming) {
            super.draw(canvas);
        }
    }
}

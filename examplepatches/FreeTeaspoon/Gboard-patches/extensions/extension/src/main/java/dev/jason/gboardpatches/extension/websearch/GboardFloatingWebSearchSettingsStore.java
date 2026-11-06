package dev.jason.gboardpatches.extension.websearch;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;

final class GboardFloatingWebSearchSettingsStore {
    private static final String TAG = "GboardPatches";

    private GboardFloatingWebSearchSettingsStore() {
    }

    static SharedPreferences preferences(Context context) {
        return GboardPatchesSettings.preferences(context);
    }

    static boolean writeEnabled(Context context, boolean enabled) {
        return write(context, editor -> editor.putBoolean(
                GboardFloatingWebSearchSettings.PREF_KEY_ENABLED, enabled));
    }

    static boolean writeStartPageMode(Context context, String mode) {
        if (!GboardFloatingWebSearchSettings.isStartPageMode(mode)) {
            return false;
        }
        return write(context, editor -> editor.putString(
                GboardFloatingWebSearchSettings.PREF_KEY_START_PAGE_MODE, mode));
    }

    static boolean writeCustomStartPage(Context context, String rawUrl) {
        String url = rawUrl == null ? "" : rawUrl.trim();
        if (!GboardFloatingWebSearchSettings.isAllowedHttpsUrl(url)) {
            return false;
        }
        return write(context, editor -> editor
                .putString(GboardFloatingWebSearchSettings.PREF_KEY_CUSTOM_START_PAGE_URL, url)
                .putString(GboardFloatingWebSearchSettings.PREF_KEY_START_PAGE_MODE,
                        GboardFloatingWebSearchSettings.START_PAGE_CUSTOM));
    }

    static boolean writeInitialHeightPercent(Context context, int percent) {
        if (!GboardFloatingWebSearchSettings.isAllowedHeightPercent(percent)) {
            return false;
        }
        return write(context, editor -> editor.putInt(
                GboardFloatingWebSearchSettings.PREF_KEY_INITIAL_HEIGHT_PERCENT, percent));
    }

    static boolean writeBrowserProvider(Context context, String provider) {
        if (!GboardFloatingWebSearchSettings.isBrowserProviderValue(provider)) {
            return false;
        }
        return write(context, editor -> editor.putString(
                GboardFloatingWebSearchSettings.PREF_KEY_BROWSER_PROVIDER, provider));
    }

    private static boolean write(Context context, EditorMutation mutation) {
        if (context == null || mutation == null) {
            return false;
        }
        try {
            SharedPreferences.Editor editor = preferences(context).edit();
            mutation.apply(editor);
            return editor.commit();
        } catch (Throwable failure) {
            try {
                Log.w(TAG, "Unable to write Floating Web Search setting", failure);
            } catch (Throwable ignored) {
                // Settings writes fail closed when diagnostics are unavailable.
            }
            return false;
        }
    }

    private interface EditorMutation {
        void apply(SharedPreferences.Editor editor);
    }
}

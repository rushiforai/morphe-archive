package dev.jason.gboardpatches.extension.settingshomepage;

import android.content.Context;

public final class GboardSettingsHomepageRuntime {
    private GboardSettingsHomepageRuntime() {
    }

    public static boolean shouldUseNewSettingsStyle(Context context) {
        try {
            return GboardSettingsHomepageSettings.shouldUseNewSettingsStyle(context);
        } catch (Throwable throwable) {
            GboardSettingsHomepageSettings.recoverForceNewFailure(
                    context,
                    "Failed to decide settings homepage style; falling back to legacy",
                    throwable);
            return false;
        }
    }
}

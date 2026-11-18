package dev.jason.gboardpatches.extension.websearch;

import android.content.Context;
import android.widget.Toast;

public final class GboardFloatingWebSearchRuntime {
    private GboardFloatingWebSearchRuntime() {
    }

    public static boolean isEnabled(Context context) {
        try {
            GboardFloatingWebSearchSettingsSnapshot snapshot = readSnapshotOrNull(context);
            return snapshot != null && snapshot.isEnabled();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void open(Context context) {
        try {
            open(context, readSnapshotOrNull(context));
        } catch (Throwable ignored) {
            showUnavailable(context);
        }
    }

    public static void open(Context context, GboardFloatingWebSearchSettingsSnapshot settings) {
        try {
            if (context == null || settings == null || !settings.isEnabled()) {
                showUnavailable(context);
                return;
            }
            if (!GboardCustomTabsProviderResolver.hasBrowsableActivity(
                    context, settings.getStartPageUrl())) {
                showToast(context, "No available browser");
                return;
            }
            if (!GboardFloatingWebSearchLauncher.open(context, settings)) {
                showUnavailable(context);
            }
        } catch (Throwable ignored) {
            showUnavailable(context);
        }
    }

    static GboardFloatingWebSearchSettingsSnapshot readSnapshotOrNull(Context context) {
        try {
            return GboardFloatingWebSearchSettings.readSnapshotOrNull(
                    GboardFloatingWebSearchSettingsStore.preferences(context));
        } catch (Throwable ignored) {
            return null;
        }
    }

    static void showUnavailable(Context context) {
        showToast(context, "Unable to open Floating Web Search");
    }

    private static void showToast(Context context, String message) {
        try {
            if (context == null) {
                return;
            }
            Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
            // User feedback cannot affect the Gboard click path.
        }
    }
}

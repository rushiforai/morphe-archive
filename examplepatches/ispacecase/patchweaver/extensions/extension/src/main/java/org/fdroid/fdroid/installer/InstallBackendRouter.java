package org.fdroid.fdroid.installer;

import android.content.Context;

import org.fdroid.fdroid.data.App;
import org.fdroid.fdroid.data.Apk;

import app.fdroidbackends.extension.InstallBackendPrefs;

/**
 * Entry point called from the single patched instruction added to the very start of
 * {@link InstallerFactory#create}. Returns null when F-Droid's normal
 * privileged/session/default installer selection should run unmodified (mode == system, or an
 * external package mode with nothing configured yet), otherwise returns the {@link Installer}
 * to use, bypassing F-Droid's own selection entirely — including its {@code SessionInstaller}
 * path, which bypasses external install-intent handlers and is exactly why this hook sits
 * before that selection rather than only changing an intent target further downstream.
 */
public final class InstallBackendRouter {
    private InstallBackendRouter() {
    }

    public static Installer maybeCreate(Context context, App app, Apk apk) {
        String mode = InstallBackendPrefs.getMode(context);

        if (InstallBackendPrefs.MODE_SHIZUKU.equals(mode)) {
            return new ShizukuInstaller(context, app, apk);
        }

        if (InstallBackendPrefs.MODE_INSTALLERX.equals(mode)
                || InstallBackendPrefs.MODE_CUSTOM.equals(mode)) {
            String targetPackage = InstallBackendPrefs.resolveTargetPackage(context);
            if (targetPackage == null) {
                // Custom mode with no package configured yet: fall through to F-Droid's
                // default selection rather than silently failing every install.
                return null;
            }
            return new ExternalInstaller(context, app, apk, targetPackage);
        }

        return null;
    }
}

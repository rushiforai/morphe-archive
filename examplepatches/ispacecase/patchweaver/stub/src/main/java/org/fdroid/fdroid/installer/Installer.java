package org.fdroid.fdroid.installer;

import android.content.Context;
import android.net.Uri;

import org.fdroid.fdroid.data.App;
import org.fdroid.fdroid.data.Apk;

/**
 * Stub matching org.fdroid.fdroid.installer.Installer from org.fdroid.fdroid 1.23.2 (1023052),
 * verified against smali_classes2/org/fdroid/fdroid/installer/Installer.smali. Compile-only:
 * extension classes are compiled against this so the extension DEX links against the real
 * Installer class (same package, same signatures) once merged into the patched app.
 */
public abstract class Installer {
    public static final String ACTION_INSTALL_COMPLETE = "org.fdroid.fdroid.installer.Installer.action.INSTALL_COMPLETE";
    public static final String ACTION_INSTALL_INTERRUPTED = "org.fdroid.fdroid.installer.Installer.action.INSTALL_INTERRUPTED";
    public static final String ACTION_INSTALL_USER_INTERACTION = "org.fdroid.fdroid.installer.Installer.action.INSTALL_USER_INTERACTION";
    public static final String ACTION_UNINSTALL_COMPLETE = "org.fdroid.fdroid.installer.Installer.action.UNINSTALL_COMPLETE";
    public static final String ACTION_UNINSTALL_INTERRUPTED = "org.fdroid.fdroid.installer.Installer.action.UNINSTALL_INTERRUPTED";
    public static final String EXTRA_APK = "org.fdroid.fdroid.installer.Installer.extra.APK";
    public static final String EXTRA_APP = "org.fdroid.fdroid.installer.Installer.extra.APP";

    final Context context;
    final App app;
    final Apk apk;

    Installer(Context context, App app, Apk apk) {
        this.context = context;
        this.app = app;
        this.apk = apk;
    }

    protected abstract void installPackageInternal(Uri localApkUri, Uri canonicalUri);

    protected abstract boolean isUnattended();

    protected abstract void uninstallPackage();

    void sendBroadcastInstall(Uri uri, String action) {
        throw new AssertionError("stub");
    }

    void sendBroadcastInstall(Uri uri, String action, String errorMessage) {
        throw new AssertionError("stub");
    }

    void sendBroadcastUninstall(String action) {
        throw new AssertionError("stub");
    }
}

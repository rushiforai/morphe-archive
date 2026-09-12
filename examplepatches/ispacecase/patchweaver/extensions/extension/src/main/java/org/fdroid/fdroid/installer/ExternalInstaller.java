package org.fdroid.fdroid.installer;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import org.fdroid.fdroid.data.App;
import org.fdroid.fdroid.data.Apk;

import app.fdroidbackends.extension.InstallBackendPrefs;

/**
 * Installer that hands the APK to a specific external installer app (InstallerX or a
 * user-chosen custom package) via an explicit {@code ACTION_INSTALL_PACKAGE} intent, instead of
 * going through F-Droid's own {@code PrivilegedInstaller}/{@code SessionInstaller}/
 * {@code DefaultInstaller} selection in {@link InstallerFactory#create}.
 *
 * Declared in the same package as the real {@code Installer} base class because its
 * constructor and the abstract methods it overrides are package-private/protected in that
 * class (verified in Installer.smali) — subclassing across packages would not compile/link.
 */
public class ExternalInstaller extends Installer {
    static final String ACTION_INSTALL_PACKAGE = "app.fdroidbackends.installer.action.INSTALL_PACKAGE";
    static final String ACTION_UNINSTALL_PACKAGE = "org.fdroid.fdroid.installer.DefaultInstaller.action.UNINSTALL_PACKAGE";
    static final String EXTRA_TARGET_PACKAGE = "app.fdroidbackends.installer.extra.TARGET_PACKAGE";
    static final String EXTRA_CANONICAL_URI = "app.fdroidbackends.installer.extra.CANONICAL_URI";

    private static final String DEFAULT_INSTALLER_ACTIVITY =
            "org.fdroid.fdroid.installer.DefaultInstallerActivity";

    private final String targetPackage;

    public ExternalInstaller(Context context, App app, Apk apk, String targetPackage) {
        super(context, app, apk);
        this.targetPackage = targetPackage;
    }

    @Override
    protected void installPackageInternal(Uri localApkUri, Uri canonicalUri) {
        Intent intent = new Intent(context, ExternalInstallerActivity.class);
        intent.setAction(ACTION_INSTALL_PACKAGE);
        intent.setData(localApkUri);
        intent.putExtra(EXTRA_TARGET_PACKAGE, targetPackage);
        intent.putExtra(EXTRA_CANONICAL_URI, canonicalUri.toString());
        intent.putExtra(EXTRA_APP, app);
        intent.putExtra(EXTRA_APK, apk);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }

    @Override
    protected boolean isUnattended() {
        // An external installer app shows its own confirmation UI, same as the system's
        // DefaultInstaller flow.
        return false;
    }

    @Override
    protected void uninstallPackage() {
        // Uninstall is unaffected by the chosen install backend: it always goes through
        // F-Droid's own DefaultInstallerActivity uninstall flow, addressed by component name so
        // no compile-time reference to that class (outside this package's stub set) is needed.
        Intent intent = new Intent();
        intent.setClassName(context.getPackageName(), DEFAULT_INSTALLER_ACTIVITY);
        intent.setAction(ACTION_UNINSTALL_PACKAGE);
        intent.putExtra(EXTRA_APP, app);
        intent.putExtra(EXTRA_APK, apk);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }
}

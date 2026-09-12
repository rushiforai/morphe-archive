package org.fdroid.fdroid.installer;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import org.fdroid.fdroid.data.App;
import org.fdroid.fdroid.data.Apk;

/**
 * Transparent relay activity. Re-issues the install as an explicit
 * {@code android.intent.action.INSTALL_PACKAGE} intent targeted (via {@code setPackage}) at the
 * chosen external installer app, following the exact contract
 * {@code DefaultInstallerActivity.installPackage(Uri)} uses for the system installer (verified
 * in DefaultInstallerActivity.smali) so the target app's own {@code ACTION_INSTALL_PACKAGE}
 * intent filter handles it, and reports the result back through the same broadcast actions
 * F-Droid's InstallManagerService already listens for.
 */
public class ExternalInstallerActivity extends Activity {
    private static final int REQUEST_CODE_INSTALL = 0;

    private ExternalInstaller installer;
    private Uri canonicalUri;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent intent = getIntent();
        App app = intent.getParcelableExtra(Installer.EXTRA_APP);
        Apk apk = intent.getParcelableExtra(Installer.EXTRA_APK);
        String targetPackage = intent.getStringExtra(ExternalInstaller.EXTRA_TARGET_PACKAGE);
        canonicalUri = Uri.parse(intent.getStringExtra(ExternalInstaller.EXTRA_CANONICAL_URI));
        installer = new ExternalInstaller(this, app, apk, targetPackage);

        Uri apkUri = intent.getData();
        if (apkUri == null || targetPackage == null || targetPackage.isEmpty()) {
            installer.sendBroadcastInstall(canonicalUri, Installer.ACTION_INSTALL_INTERRUPTED,
                    "No external installer package configured.");
            finish();
            return;
        }

        Intent installIntent = new Intent("android.intent.action.INSTALL_PACKAGE");
        installIntent.setPackage(targetPackage);
        installIntent.setData(apkUri);
        installIntent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        installIntent.putExtra("android.intent.extra.NOT_UNKNOWN_SOURCE", true);
        installIntent.putExtra("android.intent.extra.RETURN_RESULT", true);

        try {
            startActivityForResult(installIntent, REQUEST_CODE_INSTALL);
        } catch (ActivityNotFoundException e) {
            installer.sendBroadcastInstall(canonicalUri, Installer.ACTION_INSTALL_INTERRUPTED,
                    "\"" + targetPackage + "\" is not installed or does not handle installs.");
            finish();
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode != REQUEST_CODE_INSTALL) {
            finish();
            return;
        }

        if (resultCode == Activity.RESULT_OK) {
            installer.sendBroadcastInstall(canonicalUri, Installer.ACTION_INSTALL_COMPLETE);
        } else if (resultCode == Activity.RESULT_CANCELED) {
            installer.sendBroadcastInstall(canonicalUri, Installer.ACTION_INSTALL_INTERRUPTED,
                    "Install was cancelled.");
        } else {
            installer.sendBroadcastInstall(canonicalUri, Installer.ACTION_INSTALL_INTERRUPTED,
                    "External installer returned an error.");
        }
        finish();
    }
}

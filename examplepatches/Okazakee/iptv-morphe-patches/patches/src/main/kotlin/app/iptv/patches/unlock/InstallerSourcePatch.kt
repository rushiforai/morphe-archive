package app.iptv.patches.unlock

import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch

/**
 * Makes app-internal Android installer-source reads report Google Play.
 *
 * Covered by Morphe's shared helper:
 * - PackageManager.getInstallerPackageName(String)
 * - InstallSourceInfo.getInstallingPackageName()
 * - InstallSourceInfo.getInitiatingPackageName()
 * - InstallSourceInfo.getPackageSource()
 *
 * This intentionally does NOT claim to change the OS's actual install
 * provenance or a Google Play Integrity licensing/app-recognition verdict.
 */
internal val spoofPlayStoreInstallerSourcePatch =
    changePackageInstallerPatch {
        "com.android.vending"
    }

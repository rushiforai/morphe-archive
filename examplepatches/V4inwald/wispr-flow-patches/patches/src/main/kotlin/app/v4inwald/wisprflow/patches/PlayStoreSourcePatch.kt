/*
 * Copyright (C) 2026 V4inwald
 *
 * This file is part of wispr-flow-patches, GPL-3.0.
 */

package app.v4inwald.wisprflow.patches

import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.patcher.patch.patch
import app.v4inwald.wisprflow.patches.Constants.COMPATIBILITY_WISPR_FLOW

private const val PLAY_STORE = "com.android.vending"

/**
 * Makes the app report that it was installed from the Play Store.
 *
 * The app ships Google Play PairIP: `com.pairip.application.Application.attachBaseContext` calls
 * `LicenseClient.checkLicense()` on every start, the Play licensing service answers against the
 * Play signing certificate, and a locally re-signed build fails that check by construction. The
 * local fallback then asks the installer package name, which a side-loaded install answers
 * differently, and the app stops on its licensing dialog before any patched code runs.
 *
 * The hooks come from the patches library instead of being re-implemented here: it replaces the
 * result of every `getInstallerPackageName` / `getInstallingPackageName` /
 * `getInitiatingPackageName` / `getPackageSource` call site, which covers the PairIP gate and the
 * analytics and crash-report tagging that would otherwise record a side-load.
 */
@Suppress("unused")
val playStoreSourcePatch =
    patch(
        name = "Play Store install source",
        description = "Reports the app as installed from the Play Store, so the bundled Play licensing check accepts a re-signed build.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_WISPR_FLOW)

        dependsOn(
            changePackageInstallerPatch { PLAY_STORE },
        )
    }

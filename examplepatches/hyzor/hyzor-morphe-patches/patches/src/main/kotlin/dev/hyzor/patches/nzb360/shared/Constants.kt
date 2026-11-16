/*
 * Copyright 2026 rushiranpise
 * https://github.com/rushiranpise/morphe-patches
 *
 * Ported from the nzb360 "Unlock All Access" patch in rushiranpise/morphe-patches
 * (GPLv3), re-resolved for 25.3.
 */

package dev.hyzor.patches.nzb360.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /** `NZB360LicenseHelper`: the All Access flag plus every per-service unlock. */
    const val LICENSE_HELPER = "Lcom/kevinforeman/nzb360/helpers/NZB360LicenseHelper;"

    /**
     * `NZB360LicenseHelper$Service`: the per-module enum whose entries gate the dashboard
     * modules (SABnzbd, NZBget, Torrents, Radarr, Sonarr, Lidarr, Readarr, Prowlarr,
     * Tautulli, Overseerr, Unraid, Search, Bazarr, WebInterfaces, Tracearr).
     */
    const val LICENSE_SERVICE = "Lcom/kevinforeman/nzb360/helpers/NZB360LicenseHelper\$Service;"

    /** `UpgradeCenterKt`: the Compose upgrade screen; `SubscriptionSection` is the plan toggle. */
    const val UPGRADE_CENTER = "Lcom/kevinforeman/nzb360/upgradecenter/UpgradeCenterKt;"

    /** `Contract$UIState`: the upgrade-center state object, including `isSubscribed`. */
    const val UPGRADE_CENTER_STATE = "Lcom/kevinforeman/nzb360/upgradecenter/Contract\$UIState;"

    val NZB360 = Compatibility(
        name = "nzb360",
        packageName = "com.kevinforeman.nzb360",

        // The tested artifact is the APKMirror universal APK for 25.3 (versionCode 537, all
        // four ABIs in one file). nzb360 is APK-only on APKMirror, so a single APK target
        // covers it; there is no bundle to merge.
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1565C0,

        targets = listOf(
            AppTarget(version = "25.3", versionCode = 537),
        ),
    )
}

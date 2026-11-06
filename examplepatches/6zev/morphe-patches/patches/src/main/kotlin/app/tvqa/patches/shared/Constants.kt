/*
 * Patches for tvQuickActions Pro.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.tvqa.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * tvQuickActions Pro.
     *
     * 3.8.0 is the release these patches were developed and tested against. 3.7.0 exposes the
     * same licence policy class, so the licence patch is expected to work there too.
     */
    val TVQUICKACTIONS = Compatibility(
        name = "tvQuickActions Pro",
        packageName = "dev.vodik7.tvquickactions",
        // The original file is distributed as a plain APK, not as an APKM/XAPK bundle.
        apkFileType = ApkFileType.APK,
        // Background colour of the app icon, used by Morphe Manager.
        appIconColor = 0x1565C0,
        targets = listOf(
            AppTarget(version = "3.8.0"),
            AppTarget(version = "3.7.0"),
        )
    )

    /**
     * tvQuickActions Pro 3.8.0, the only release whose native engine is patched.
     *
     * 3.7.0 does not load the engine library at all, and the layout of the library differs
     * between releases, so the engine patch is limited to the version it was written for. It
     * also refuses to patch a library whose known offsets do not match, rather than corrupt it.
     */
    val TVQUICKACTIONS_3_8 = Compatibility(
        name = "tvQuickActions Pro",
        packageName = "dev.vodik7.tvquickactions",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1565C0,
        targets = listOf(
            AppTarget(version = "3.8.0"),
        )
    )
}

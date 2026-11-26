/*
 * Patches for tvQuickActions Pro.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.tvqa.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * tvQuickActions Pro.
     *
     * The patches recognise their targets by structure, not by offset, so every 3.x release is
     * accepted: the licence policy class is found by its preference store and its default
     * response, and the native routines are found by the code around them.
     */
    val TVQUICKACTIONS = Compatibility(
        name = "tvQuickActions Pro",
        packageName = "dev.vodik7.tvquickactions",
        // The original file is distributed as a plain APK, not as an APKM/XAPK bundle.
        apkFileType = ApkFileType.APK,
        // Background colour of the app icon, used by Morphe Manager.
        appIconColor = 0x1565C0,
        // A null version is the patcher's way of saying every version is accepted: both halves
        // match their targets by structure, and each one refuses to write when the structure it
        // expects is not there.
        targets = listOf(AppTarget(version = null))
    )
}

/*
 * Copyright 2026 anondev.
 *
 * GPLv3. See the LICENSE file for details.
 */

package app.anondev.patches.zotero.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Zotero for Android, pinned to the release this patch was written against.
     *
     * `aapt dump badging` on the target reports `versionName='1.0.0-247'` and
     * `versionCode='247'`. Morphe Manager and the CLI compare the declared `version` against
     * the APK's versionName, so the target must use the full `1.0.0-247` spelling — declaring
     * `1.0.0` (the marketing version) would not match this artifact, and leaving it null
     * would over-claim support for arbitrary future versions.
     *
     * `AppTarget.versionCodes` is deliberately not declared: per the template's own guidance
     * it is only needed when a single versionName has several architecture-specific releases
     * with different version codes. This artifact is one universal APK with a single
     * versionCode (247), so a plain `version` target is the correct declaration.
     */
    val COMPATIBILITY_ZOTERO = Compatibility(
        name = "Zotero",
        packageName = "org.zotero.android",
        apkFileType = ApkFileType.APK, // Universal single APK, not a split/XAPK/APKM.
        appIconColor = 0xCC2936, // Zotero brand red.
        targets = listOf(
            AppTarget(version = "1.0.0-247"),
        ),
    )
}

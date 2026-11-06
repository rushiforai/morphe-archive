package app.ronp.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WALMART = Compatibility(
        name = "Walmart",
        packageName = "com.walmart.android",
        // Walmart is distributed as a split bundle (APKM on APKMirror, XAPK on APKPure).
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0071DC,
        targets = listOf(
            // Fingerprints do not rely on obfuscated names, so newer versions should work.
            AppTarget(
                version = null,
                isExperimental = true,
            ),
            // Version the patch was built and checked against.
            AppTarget(
                version = "26.42",
            ),
        ),
    )
}

package app.memorizepi.patches.pi.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

/**
 * Compatibility declaration for "Memorize Pi Digits - 3.14π".
 *
 * Developed against version 11.01 (versionCode 11010, arm64-v8a),
 * the XAPK bundle distributed on APKPure.
 *
 * The version code is pinned for arm64-v8a because it is the only
 * architecture variant this patch set has been verified against.
 */
object Constants {
    val COMPATIBILITY_PI = Compatibility(
        name = "Memorize Pi Digits",
        packageName = "com.unknownprojectx.pi",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x5C6BC0,
        targets = listOf(
            AppTarget(
                version = "11.01",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 11010
                )
            )
        )
    )
}

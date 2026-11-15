package app.memorizepi.patches.mtisland.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

/**
 * Compatibility declaration for "Material Capsule" (package
 * `com.pryshedko.mtisland`).
 *
 * Developed against version 17.3 (versionCode 173, arm64-v8a), distributed
 * as an XAPK on APKPure. The app ships a single `classes.dex`; the
 * `config.arm64_v8a` split contains no PairIP library, so the PairIP variant
 * in use is the license-check-only wrapper (`com.pairip.licensecheck`).
 */
object Constants {
    val COMPATIBILITY_MATERIAL_CAPSULE = Compatibility(
        name = "Material Capsule",
        packageName = "com.pryshedko.mtisland",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x212121,
        targets = listOf(
            AppTarget(
                version = "17.3",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 173
                )
            )
        )
    )
}

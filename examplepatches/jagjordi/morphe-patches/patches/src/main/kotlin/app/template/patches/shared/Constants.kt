package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    // Flightradar24 publishes one version code shared by every ABI, so the
    // APKMirror bundle for any architecture carries the same code.
    val FLIGHTRADAR_COMPATIBILITY = Compatibility(
        name = "Flightradar24",
        packageName = "com.flightradar24free",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x327CB5,
        targets = listOf(
            AppTarget(
                version = "11.12.0",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 111200000,
                    SupportedAbi.ARMEABI_V7A to 111200000,
                    SupportedAbi.X86_64 to 111200000,
                    SupportedAbi.X86 to 111200000,
                ),
            ),
        ),
    )
}

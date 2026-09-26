package dev.supperelias2.sbstv.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val sideloadCompatibilityPatch = bytecodePatch(
    name = "Allow sideloaded installation",
    description = "Prevents the Play licensing redirect when launching a sideloaded SBS TV build.",
    default = true
) {
    compatibleWith(
        Compatibility(
            name = "SBS On Demand for Android TV",
            packageName = "com.sbs.ondemand.tv",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xDCBD1D,
            targets = listOf(AppTarget(version = "6.3.1"))
        )
    )

    execute {
        val method = PairipLicenseFingerprint.method
        check(method.implementation?.registerCount == 2) {
            "Unexpected PairIP provider register layout"
        }
        method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}

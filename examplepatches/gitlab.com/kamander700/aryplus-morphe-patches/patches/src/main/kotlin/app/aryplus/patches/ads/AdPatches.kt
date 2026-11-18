package app.aryplus.patches.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch

private val COMPATIBILITY_ARY_PLUS = Compatibility(
    name = "ARY+",
    packageName = "com.release.arylive",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xE50914,
    targets = listOf(
        AppTarget(version = "3.8.1"),
        AppTarget(version = null, isExperimental = true),
    ),
)

@Suppress("unused")
val hideVideoAdsPatch = patch(
    name = "Hide video ads",
    description = "Removes IMA pre-roll, mid-roll and post-roll ads from all players.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ARY_PLUS)

    execute {
        SetAdsConfigurationFingerprint.method.addInstruction(0, "const/4 p1, 0x0")
    }
}

@Suppress("unused")
val hideAppAdsPatch = patch(
    name = "Hide app ads",
    description = "Removes banner, native, interstitial and sticky ads driven by the server ad-experience config.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ARY_PLUS)

    execute {
        SetAdExperienceDataFingerprint.method.addInstruction(0, "return-void")
        RestoreAdExperienceFingerprint.method.addInstruction(0, "return-void")
    }
}

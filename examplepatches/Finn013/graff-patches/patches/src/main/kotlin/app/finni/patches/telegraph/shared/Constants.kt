package app.finni.patches.telegraph.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /** Package name of Telegraph Plus by p2021. */
    const val ORIGINAL_PACKAGE = "ir.p2021.telegraph"

    /** Package name used by Graff by default. */
    const val GRAFF_PACKAGE = "ir.finni.graff"

    val COMPATIBILITY_TELEGRAPH_PLUS = Compatibility(
        name = "Telegraph Plus",
        packageName = ORIGINAL_PACKAGE,
        description = "Telegraph Plus by p2021 (Telegram fork, ex Graph Messenger). " +
            "Use the original p2021 APK, not an already modified build.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2AABEE,
        targets = listOf(
            // Version the patches were developed and tested with (versionCode 71751, arm64-v8a).
            AppTarget(version = "13.0.2.0"),
            // Fingerprints avoid obfuscated names, so newer p2021 releases may work too.
            AppTarget(version = null, isExperimental = true),
        ),
    )
}

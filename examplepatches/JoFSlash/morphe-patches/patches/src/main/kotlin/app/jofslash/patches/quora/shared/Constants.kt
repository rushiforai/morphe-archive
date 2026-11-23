package app.jofslash.patches.quora.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /** SHA-1 of the certificate Quora signs its releases with. */
    const val QUORA_SIGNATURE = "62869ae6b37ac8407cc65331add254f12ad435e5"

    val COMPATIBILITY_QUORA = Compatibility(
        name = "Quora",
        packageName = "com.quora.android",
        // APKMirror ships Quora as a bundle (APKM).
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xB92B27,
        targets = listOf(
            AppTarget(version = "3.2.47"),
            AppTarget(version = "3.2.42"),
            // 3.2.30 was dropped: Quora's servers now refuse it as "no longer supported".
            AppTarget(version = null, isExperimental = true),
        )
    )
}

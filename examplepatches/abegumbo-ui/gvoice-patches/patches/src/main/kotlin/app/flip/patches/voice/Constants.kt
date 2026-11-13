package app.flip.patches.voice

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal const val VOICE_PACKAGE = "com.google.android.apps.googlevoice"
internal const val DEFAULT_PATCHED_PACKAGE = "app.flip.googlevoice"

/** SHA-1 of the certificate Google signs Voice with (checked on APKMirror, same key as YouTube). */
internal const val VOICE_SIGNATURE = "24bb24c05e47e0aefa68a58a766179d9b613a600"

/** MicroG RE (the GmsCore that Morphe Manager installs) uses this vendor prefix. */
internal const val GMS_VENDOR = "app.revanced"
internal const val GMS_PACKAGE = "$GMS_VENDOR.android.gms"

object Constants {
    val COMPATIBILITY_GOOGLE_VOICE = Compatibility(
        name = "Google Voice",
        packageName = VOICE_PACKAGE,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget(version = "2026.11.01.1014278023"),
            AppTarget(version = null, isExperimental = true),
        ),
    )
}

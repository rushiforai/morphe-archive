package app.infinity.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Infinity for Reddit+ — the "plus" build of docilealligator's client.
     *
     * [AppTarget.version] is left null on purpose: the spoof patch resolves every anchor
     * either from a stable literal (the OAuth redirect URI, the `0x10008000` intent flag)
     * or from the version name read out of the APK at patch time, so it is not tied to a
     * single release. Verified against 8.3.4 (versionCode 232).
     */
    val COMPATIBILITY_INFINITY_PLUS = Compatibility(
        name = "Infinity for Reddit+",
        packageName = "ml.docilealligator.infinityforreddit.plus",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0D47A1,
        targets = listOf(
            AppTarget(
                version = null
            )
        )
    )

    /**
     * The Patreon build ships the same bytecode under a different package name.
     */
    val COMPATIBILITY_INFINITY_PATREON = Compatibility(
        name = "Infinity for Reddit (Patreon)",
        packageName = "ml.docilealligator.infinityforreddit.patreon",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0D47A1,
        targets = listOf(
            AppTarget(
                version = null
            )
        )
    )

    val COMPATIBILITY_INFINITY = arrayOf(
        COMPATIBILITY_INFINITY_PLUS,
        COMPATIBILITY_INFINITY_PATREON
    )
}

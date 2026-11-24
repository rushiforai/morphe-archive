package app.jofslash.patches.imdb.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "com.imdb.mobile"

    /**
     * SHA-1 of IMDb's original signing certificate (from the APKPure APK, matching APKMirror's
     * "a773"). GmsCore support spoofs it to MicroG-RE, and the fetch script checks APKs against it.
     */
    const val SIGNATURE = "a773ecf7e3304a9482d4c3df40b12a49b7b2a002"

    /** IMDb keeps its own class names (com.imdb.*); only library internals and some lambdas are renamed. */
    const val APP = "Lcom/imdb"

    val COMPATIBILITY_IMDB = Compatibility(
        name = "IMDb",
        packageName = PACKAGE_NAME,
        // APKPure ships IMDb as a single universal APK, not a bundle.
        apkFileType = ApkFileType.APK,
        appIconColor = 0xF5C518,
        targets = listOf(
            AppTarget(version = "9.3.7.109370600"),
            AppTarget(version = null, isExperimental = true),
        )
    )
}

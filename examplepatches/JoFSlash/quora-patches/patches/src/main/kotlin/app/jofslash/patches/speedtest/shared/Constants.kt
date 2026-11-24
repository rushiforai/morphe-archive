package app.jofslash.patches.speedtest.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "org.zwanoo.android.speedtest"

    /**
     * SHA-1 of Ookla's original signing certificate (from the APKMirror base.apk). Kept for
     * reference and for any future Google-account support; the app's core (the speed test) needs
     * no account, so no patch uses it today.
     */
    const val SIGNATURE = "5f840b6985796679c8de6a7646fedab57632ef52"

    /** The app's own classes keep their names; only methods, inner classes and the libraries are renamed. */
    const val APP = "Lcom/ookla"

    val COMPATIBILITY_SPEEDTEST = Compatibility(
        name = "Speedtest",
        packageName = PACKAGE_NAME,
        // APKMirror ships Speedtest as a single (arm64-v8a) APK, not a bundle.
        apkFileType = ApkFileType.APK,
        appIconColor = 0x3A7CF5,
        targets = listOf(
            AppTarget(version = "7.1.5"),
            AppTarget(version = null, isExperimental = true),
        )
    )
}

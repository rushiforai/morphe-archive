package app.modprod.patches.signals.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {

    const val SIGNALS_PACKAGE = "com.zyncas.signals"

    /**
     * Signals / Crypto Trading App (Zyncas).
     * Verified against Apktool M decompile of v14.3.1 (154).
     */
    val COMPATIBILITY_SIGNALS = Compatibility(
        name = "Signals",
        packageName = SIGNALS_PACKAGE,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1B5E20,
        targets = listOf(
            AppTarget(version = "14.3.1"),
        ),
    )
}

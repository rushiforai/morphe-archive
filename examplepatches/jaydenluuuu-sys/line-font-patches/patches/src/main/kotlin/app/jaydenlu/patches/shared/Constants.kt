package app.jaydenlu.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * LINE (jp.naver.line.android). LINE ships as a split app bundle, so the file type is APKM.
     *
     * 26.14.0 is the version the other LINE patch bundles pin. The font patch edits resources
     * only and reads no obfuscated name, so it also allows any other version as experimental.
     */
    val COMPATIBILITY_LINE = Compatibility(
        name = "LINE",
        packageName = "jp.naver.line.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x06C755, // LINE brand green.
        targets = listOf(
            AppTarget(
                version = null,
                isExperimental = true,
            ),
            AppTarget(
                version = "26.14.0",
            ),
        ),
    )
}

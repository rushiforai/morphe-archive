package app.polishapps.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    const val YANOSIK_26_9_0 = "26.9.0"
    const val YANOSIK_26_10_0 = "26.10.0"

    private val TARGET_26_9_0 = AppTarget(
        version = YANOSIK_26_9_0,
        versionCodes = mapOf(SupportedAbi.ARM64_V8A to 6001512),
    )
    private val TARGET_26_10_0 = AppTarget(
        version = YANOSIK_26_10_0,
        versionCodes = mapOf(SupportedAbi.ARM64_V8A to 6012223),
    )

    private fun yanosik(vararg targets: AppTarget) = Compatibility(
        name = "Yanosik",
        packageName = "pl.neptis.yanosik.mobi.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xD4443C,
        targets = targets.toList(),
    )

    /**
     * Yanosik is distributed by APKMirror as an APKM bundle.
     *
     * Targets are pinned to exact version codes because the obfuscated class names the patches rely
     * on (gbf, kbb, fz1, ...) change between releases. Each patch keeps its targets per version, see
     * [targetsFor].
     */
    val COMPATIBILITY_YANOSIK = yanosik(TARGET_26_9_0, TARGET_26_10_0)

    /** For patches that have not been ported past 26.9.0. */
    val COMPATIBILITY_YANOSIK_26_9_0 = yanosik(TARGET_26_9_0)
}

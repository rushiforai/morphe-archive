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

    const val MOJ_ORANGE_5_153_0 = "5.153.0.87591"

    val COMPATIBILITY_MOJ_ORANGE = Compatibility(
        name = "Mój Orange",
        packageName = "pl.orange.mojeorange",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0xFF7900,
        targets = listOf(AppTarget(version = MOJ_ORANGE_5_153_0, versionCode = 87591)),
    )

    const val INPOST_4_23_1 = "4.23.1"

    val COMPATIBILITY_INPOST = Compatibility(
        name = "InPost Mobile",
        packageName = "pl.inpost.inmobile",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFFCD00,
        targets = listOf(AppTarget(version = INPOST_4_23_1, versionCode = 42301000)),
    )

    const val ZABKA_4_50_0 = "4.50.0"

    val COMPATIBILITY_ZABKA = Compatibility(
        name = "Żappka",
        packageName = "pl.zabka.apb2c",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x08A848,
        targets = listOf(AppTarget(version = ZABKA_4_50_0, versionCode = 60310)),
    )

    const val LIDL_PLUS_17_13_6 = "17.13.6"

    /**
     * Lidl Plus is a single APK from APKMirror (arm64-v8a, nodpi). The patches pin obfuscated names
     * of the coupon list screen, so only this exact build is listed.
     */
    val COMPATIBILITY_LIDL_PLUS = Compatibility(
        name = "Lidl Plus",
        packageName = "com.lidl.eci.lidlplus",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0050AA,
        targets = listOf(
            AppTarget(
                version = LIDL_PLUS_17_13_6,
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 1470410212),
            ),
        ),
    )

    const val VULCAN_26_08_00 = "26.08.00 (G)"

    val COMPATIBILITY_VULCAN = Compatibility(
        name = "eduVULCAN",
        packageName = "pl.edu.vulcan.hebe.ce",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x0000FF,
        targets = listOf(
            AppTarget(
                version = VULCAN_26_08_00,
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 1017),
            ),
        ),
    )
}

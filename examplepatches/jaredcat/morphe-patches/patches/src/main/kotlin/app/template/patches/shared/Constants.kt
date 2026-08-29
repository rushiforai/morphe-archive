package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    /**
     * ASL Bloom — APKPure XAPK (base + armeabi-v7a + density + locale splits).
     * The unlock patch targets the Hermes v96 bundle shipped in 1.36.63 (871).
     */
    val COMPATIBILITY_ASL_BLOOM = Compatibility(
        name = "ASL Bloom",
        packageName = "com.toleio.us",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x232A63,
        targets = listOf(
            AppTarget(
                version = "1.36.63",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 871,
                    SupportedAbi.ARMEABI_V7A to 871,
                ),
                description = "Use the XAPK matching your device architecture.",
            ),
        ),
    )

    /**
     * Expand (Monroe Institute) — APKPure XAPK (base + arm64 + density + locale splits).
     * Not reliably listed on APKMirror/UpToDown, so Manager may fall back to Google search;
     * download the XAPK yourself and pick it in the file picker.
     */
    val COMPATIBILITY_EXPAND = Compatibility(
        name = "Expand",
        packageName = "org.monroeinstitute.expand",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x2C2C31,
        targets = listOf(
            AppTarget(
                version = "2.1.1",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 841),
                description = "Download the arm64 XAPK from APKPure (not APKMirror). " +
                    "Use Morphe’s file picker if Continue opens Google.",
            ),
        ),
    )

    /**
     * Lumenate — APKPure XAPK (base + arm64 + density). Patches tested on 7.1.3 (394).
     * Same download caveat as Expand: prefer APKPure + file picker over Manager web-search.
     */
    val COMPATIBILITY_LUMENATE = Compatibility(
        name = "Lumenate",
        packageName = "com.lumenate.lumenateaa",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x1AABB8,
        targets = listOf(
            AppTarget(
                version = "7.1.3",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 394),
                description = "Download the arm64 XAPK from APKPure (not APKMirror). " +
                    "Use Morphe’s file picker if Continue opens Google.",
            ),
        ),
    )
}

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

    /**
     * OfferUp — split APK from Play Store / device (base + arm64 + en + xxhdpi).
     * Ad code lives in the base DEX (`com.offerup.ads`), so patch the merged/base APK.
     *
     * Resigning (any Morphe patch) invalidates the Play-signed Maps API key, so the
     * in-app map embed breaks. Warned via [Compatibility.description] for all OfferUp patches.
     */
    val COMPATIBILITY_OFFERUP = Compatibility(
        name = "OfferUp",
        packageName = "com.offerup",
        description = "Warning: patching OfferUp resigns the APK, so the listing map embed " +
            "stops working (Google Maps API key is tied to the Play Store signature).",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x00A87E,
        signatures = setOf(
            "b030bf5c258015aacf92c0c8e3c4f3c6ae17cdc6c4d4f1dd7686b78145aacb23",
        ),
        targets = listOf(
            AppTarget(
                version = "2026.38.0",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 2026380003),
                description = "Patch the device split APKs (base + arm64 + en + xxhdpi) " +
                    "or an APKS/APKM matching this version. Listing map embed will not work " +
                    "after install (resigning breaks the Maps API key).",
            ),
        ),
    )

    /**
     * Sweepy — split APK pulled from Play Store (base + arm64 + locale + density).
     * Premium gates live in the embedded Hermes v96 bundle.
     */
    val COMPATIBILITY_SWEEPY = Compatibility(
        name = "Sweepy",
        packageName = "app.sweepy.sweepy",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0x2FC7FF,
        signatures = setOf(
            "817b52b22fd3dc5583ac3302f3754cdccfd181f2ae9ba03b82f3755afd9db205",
        ),
        targets = listOf(
            AppTarget(
                version = "6.1.3",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 305),
                description = "Patch the device split APKs (base + arm64 + locale + density) " +
                    "or an APKS/APKM matching this version.",
            ),
        ),
    )
}

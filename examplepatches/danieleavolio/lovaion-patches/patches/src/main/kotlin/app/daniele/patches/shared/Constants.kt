package app.daniele.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Cinemaniac (it.papalillo.moviestowatch). The bytecode patches validate
     * exact bytes, so only the analyzed release is targeted.
     */
    val COMPATIBILITY_CINEMANIAC = Compatibility(
        name = "Cinemaniac", // App name as it appears in the Android launcher.
        packageName = "it.papalillo.moviestowatch",
        // File type of the analyzed APK (universal APK, versionCode 172).
        apkFileType = ApkFileType.APK,
        // Icon color in Morphe Manager (0xRRGGBB).
        appIconColor = 0xD32F2F,
        // SHA-256 of the signing certificate (apksigner verify --print-certs).
        signatures = setOf(
            "ca4bfb695d731fd138299522b35b185feeecc3f91e384d7c4822cef13231a2e0",
        ),
        targets = listOf(
            // Exact release the patches were developed against.
            AppTarget(version = "5.0.7"),
        ),
    )

    /**
     * Column (com.columnapp.column). The Hermes bytecode bundle is matched by
     * exact content, so only the analyzed release is targeted.
     */
    val COMPATIBILITY_COLUMN = Compatibility(
        name = "Column", // App name as it appears in the Android launcher.
        packageName = "com.columnapp.column",
        // Column is distributed as an XAPK (base APK + abi/locale/density splits).
        apkFileType = ApkFileType.XAPK,
        // Icon color in Morphe Manager (0xRRGGBB) — dark background of the app.
        appIconColor = 0x0F172A,
        // SHA-256 of the signing certificate (apksigner verify --print-certs).
        signatures = setOf(
            "1df0301d9ac41f57e3a8d9b3cadb415e512b0b86a301050c9d1b7f0a1feb5107",
        ),
        targets = listOf(
            // Exact release the patch was developed against.
            AppTarget(version = "2.0.1"),
        ),
    )

    /**
     * Tickdrop (com.sgnoogle.tickdrop). The plus gate is a single coroutine
     * emit inside the obfuscated dispatcher, matched by exact instructions,
     * so only the analyzed release is targeted.
     */
    val COMPATIBILITY_TICKDROP = Compatibility(
        name = "Tickdrop", // App name as it appears in the Android launcher.
        packageName = "com.sgnoogle.tickdrop",
        // Tickdrop is distributed as split APKs (base + abi/locale/density).
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x22C55E,
        // SHA-256 of the signing certificate (apksigner verify --print-certs).
        signatures = setOf(
            "fb3773930da3293dcce9352c40f5c17ca0623f34cb2b2571595e13ba536456ea",
        ),
        targets = listOf(
            // Exact release the patch was developed against.
            AppTarget(version = "1.9.6"),
        ),
    )

    /**
     * Photon Camera (com.hinnka.mycamera). The premium flow and the PairIP
     * entry point are matched structurally on top of exact instruction checks,
     * so only the analyzed release is targeted.
     */
    val COMPATIBILITY_PHOTON = Compatibility(
        name = "Photon Camera", // App name as it appears in the Android launcher.
        packageName = "com.hinnka.mycamera",
        // Photon Camera is distributed as an XAPK (base APK + abi/locale/density splits).
        apkFileType = ApkFileType.XAPK,
        // Icon color in Morphe Manager (0xRRGGBB) - the orange of the app icon.
        appIconColor = 0xF4692D,
        // SHA-256 of the signing certificate (apksigner verify --print-certs).
        signatures = setOf(
            "5a57ca9587732cd25e0185145fee709a3a729ed7b3bba127c1b7a70e34196535",
        ),
        targets = listOf(
            // Exact release the patches were developed against.
            AppTarget(version = "1.28.3.1"),
        ),
    )

    /**
     * Rare (com.rarecam.app). The Pro flow and the PairIP entry point are matched
     * structurally on top of exact instruction checks, so only the analyzed release
     * is targeted.
     */
    val COMPATIBILITY_RARE = Compatibility(
        name = "Rare", // App name as it appears in the Android launcher.
        packageName = "com.rarecam.app",
        // Rare is distributed as split APKs (base + locale/density splits).
        apkFileType = ApkFileType.XAPK,
        // Icon color in Morphe Manager (0xRRGGBB) - the sage of the app icon.
        appIconColor = 0xA3B58C,
        // SHA-256 of the signing certificate (apksigner verify --print-certs).
        signatures = setOf(
            "42947b25f3b0a5fc1b3905ba33f7e61cfc4b1fab9be3cc2173edf4103f2231cd",
        ),
        targets = listOf(
            // Exact release the patches were developed against.
            AppTarget(version = "1.0.95"),
        ),
    )

    /**
     * GuitarTuna (com.ovelin.guitartuna). The subscription gates are native
     * entry points matched by exact bytes, so only the analyzed release is
     * targeted.
     */
    val COMPATIBILITY_GUITARTUNA = Compatibility(
        name = "GuitarTuna", // App name as it appears in the Android launcher.
        packageName = "com.ovelin.guitartuna",
        // GuitarTuna is distributed as split APKs (base + abi/locale/density).
        apkFileType = ApkFileType.XAPK,
        // Icon color in Morphe Manager (0xRRGGBB) - the app's teal.
        appIconColor = 0x00A388,
        // SHA-256 of the signing certificate (apksigner verify --print-certs).
        signatures = setOf(
            "432eacd50197216ca879c8fd3c1322ad6e4c51cbfc76e4138d727b75cdc4864d",
        ),
        targets = listOf(
            // Exact release the patch was developed against.
            AppTarget(version = "7.103.0"),
        ),
    )
}

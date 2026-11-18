package app.gboardios.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val GBOARD_PACKAGE_NAME = "com.google.android.inputmethod.latin"

    /**
     * Supported Gboard builds, newest first, arm64-v8a only: phones need it, and listing the
     * x86_64 build let Morphe Manager accept it for a phone, where it fails with
     * INSTALL_FAILED_NO_MATCHING_ABIS. Every ABI build shares the same resources.arsc, so the
     * x86_64 build still patches fine for an emulator with `morphe-desktop patch -f`. The version
     * name carries the ABI suffix.
     *
     * Each version maps to its resource id table under `/gboardios/ids/`, see [ResourceIds]. The
     * ids in the patches are those of 18.5.4, so the builds where the resources the patches use
     * keep their ids, such as the other 18.5.x builds, need no table (null).
     */
    val GBOARD_VERSIONS: Map<String, String?> = linkedMapOf(
        "18.6.3.1002251336-release" to "18.6.3.1002251336-release",
        "18.5.11.993608717-release" to null,
        "18.5.10.993608717-release" to null,
        "18.5.9.993608717-release" to null,
        "18.5.6.993608717-release" to null,
        "18.5.4.993608717-release" to null,
    )

    /**
     * SHA-256 digests of Gboard's signing certificates (Google Inc.), so that Morphe Manager can
     * check that an APK downloaded from any site is the original one. Gboard rotated its key: the
     * APK is signed with the new key for Android 13 and later, and with the old one for older
     * versions. From `apksigner verify --print-certs`; the same in every supported build.
     */
    private val GBOARD_SIGNATURES = setOf(
        "7ce83c1b71f3d572fed04c8d40c5cb10ff75e6d87d9df6fbd53f0468c2905053", // Android 13 and later
        "f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83", // Android 7 to 12
    )

    val COMPATIBILITY_GBOARD = Compatibility(
        name = "Gboard",
        packageName = GBOARD_PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A73E8,
        signatures = GBOARD_SIGNATURES,
        targets = GBOARD_VERSIONS.keys.map { AppTarget(version = "$it-arm64-v8a") },
    )
}

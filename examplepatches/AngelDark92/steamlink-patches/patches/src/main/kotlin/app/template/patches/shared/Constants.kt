package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    const val EXPERIMENTAL_COMPATIBILITY_NAME = "Steam Link Experimental"

    private const val STEAM_LINK_PACKAGE = "com.valvesoftware.steamlinkvr"
    private const val STEAM_LINK_VERSION = "2.0.22"
    private val LEGACY_STEAM_LINK_BUILDS =
        intArrayOf(5001712, 5002172, 5002206, 5002244, 5002313)
    private val NATIVE_XR_STEAM_LINK_BUILDS = intArrayOf(5002318, 5002322)

    fun isNativeXrSteamLinkBuild(versionCode: String): Boolean =
        NATIVE_XR_STEAM_LINK_BUILDS.any { it.toString() == versionCode }

    private fun steamLinkBuildCompatibility(
        versionCode: Int,
        name: String = "Steam Link",
        description: String = "Verified Steam Link 2.0.22 build $versionCode.",
    ) = Compatibility(
        name = name,
        packageName = STEAM_LINK_PACKAGE,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1B2838,
        targets = listOf(
            AppTarget(
                version = STEAM_LINK_VERSION,
                versionCodes = SupportedAbi.entries.associateWith { versionCode },
                description = description,
            ),
        ),
    )

    val COMPATIBILITIES_STEAM_LINK_LEGACY =
        LEGACY_STEAM_LINK_BUILDS.map(::steamLinkBuildCompatibility)

    val COMPATIBILITIES_STEAM_LINK_NATIVE_XR =
        NATIVE_XR_STEAM_LINK_BUILDS.map { versionCode ->
            steamLinkBuildCompatibility(
                versionCode = versionCode,
                description = if (versionCode == 5002322) {
                    "Build 5002322 recommends only Appear on top, GXR face bridge, " +
                        "Microphone input preset, Unrestricted battery usage, Video dither, " +
                        "and Visual Delay Fix. Experimental XR projection patches remain optional."
                } else {
                    "Build $versionCode supports Device identity, Microphone input preset, OLED color " +
                        "calibration, Appear on top, GXR face bridge, Visual Delay Fix, " +
                        "Unrestricted battery usage, Video dither, and the experimental XR " +
                        "projection patches."
                },
            )
        }

    val COMPATIBILITIES_STEAM_LINK =
        COMPATIBILITIES_STEAM_LINK_LEGACY + COMPATIBILITIES_STEAM_LINK_NATIVE_XR

    // Morphe's Patch.default is global, not per AppTarget. Excluding the latest exact build from
    // a globally recommended patch is the only unambiguous way to keep older recommendations
    // while preventing that patch from being recommended for 5002322.
    val COMPATIBILITIES_STEAM_LINK_BEFORE_LATEST =
        COMPATIBILITIES_STEAM_LINK.filterNot { compatibility ->
            compatibility.targets.any { target ->
                target.versionCodes?.values?.contains(5002322) == true
            }
        }

    val COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL =
        (LEGACY_STEAM_LINK_BUILDS + NATIVE_XR_STEAM_LINK_BUILDS).map { versionCode ->
            steamLinkBuildCompatibility(
                versionCode = versionCode,
                name = EXPERIMENTAL_COMPATIBILITY_NAME,
                description = "Experimental XR projection patches for Steam Link 2.0.22 build $versionCode.",
            )
        }
}

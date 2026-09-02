package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    const val EXPERIMENTAL_COMPATIBILITY_NAME = "Steam Link Experimental"

    private const val STEAM_LINK_PACKAGE = "com.valvesoftware.steamlinkvr"
    private data class SteamLinkBuild(val version: String, val versionCode: Int)

    private val LEGACY_STEAM_LINK_BUILDS = listOf(
        SteamLinkBuild("2.0.20", 5001740),
        SteamLinkBuild("2.0.20", 5001712),
        SteamLinkBuild("2.0.22", 5002172),
        SteamLinkBuild("2.0.22", 5002206),
        SteamLinkBuild("2.0.22", 5002244),
        SteamLinkBuild("2.0.22", 5002313),
    )
    private val NATIVE_XR_STEAM_LINK_BUILDS = listOf(
        SteamLinkBuild("2.0.22", 5002318),
        SteamLinkBuild("2.0.22", 5002322),
    )

    fun isNativeXrSteamLinkBuild(version: String, versionCode: String): Boolean =
        NATIVE_XR_STEAM_LINK_BUILDS.any {
            it.version == version && it.versionCode.toString() == versionCode
        }

    private fun steamLinkBuildCompatibility(
        build: SteamLinkBuild,
        name: String = "Steam Link",
        description: String = if (build.versionCode == 5001740) {
            "Static-analysis adaptation for Steam Link ${build.version} build ${build.versionCode}; " +
                "pristine-APK patching and runtime validation remain pending."
        } else {
            "Verified Steam Link ${build.version} build ${build.versionCode}."
        },
    ) = Compatibility(
        name = name,
        packageName = STEAM_LINK_PACKAGE,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1B2838,
        targets = listOf(
            AppTarget(
                version = build.version,
                versionCodes = SupportedAbi.entries.associateWith { build.versionCode },
                description = description,
            ),
        ),
    )

    val COMPATIBILITIES_STEAM_LINK_LEGACY =
        LEGACY_STEAM_LINK_BUILDS.map(::steamLinkBuildCompatibility)

    val COMPATIBILITIES_STEAM_LINK_NATIVE_XR =
        NATIVE_XR_STEAM_LINK_BUILDS.map { build ->
            steamLinkBuildCompatibility(
                build = build,
                description = if (build.versionCode == 5002322) {
                    "Build 5002322 recommends Galaxy XR high-resolution 3-projection fix, GXR face bridge, " +
                        "Microphone input preset, Unrestricted battery usage, Video dither, " +
                        "and Visual Delay Fix. The retired single-projection reconstruction is excluded."
                } else {
                    "Build ${build.versionCode} supports Device identity, Microphone input preset, OLED color " +
                        "calibration, the legacy Appear on top option, GXR face bridge, Visual Delay Fix, " +
                        "Unrestricted battery usage, and Video dither."
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
                target.version == "2.0.22" && target.versionCodes?.values?.contains(5002322) == true
            }
        }

    val COMPATIBILITIES_STEAM_LINK_5002322 =
        COMPATIBILITIES_STEAM_LINK_NATIVE_XR.filter { compatibility ->
            compatibility.targets.any { target ->
                target.version == "2.0.22" && target.versionCodes?.values?.contains(5002322) == true
            }
        }

    val COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL =
        (LEGACY_STEAM_LINK_BUILDS + NATIVE_XR_STEAM_LINK_BUILDS).map { build ->
            steamLinkBuildCompatibility(
                build = build,
                name = EXPERIMENTAL_COMPATIBILITY_NAME,
                description = "Experimental patches for Steam Link ${build.version} build ${build.versionCode}.",
            )
        }

    val COMPATIBILITIES_STEAM_LINK_5002322_EXPERIMENTAL =
        COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL.filter { compatibility ->
            compatibility.targets.any { target ->
                target.version == "2.0.22" && target.versionCodes?.values?.contains(5002322) == true
            }
        }
}

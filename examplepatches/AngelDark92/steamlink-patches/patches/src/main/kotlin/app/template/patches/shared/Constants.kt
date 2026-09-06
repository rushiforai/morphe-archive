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
    private val FULL_FACEBRIDGE_STEAM_LINK_BUILDS =
        LEGACY_STEAM_LINK_BUILDS + SteamLinkBuild("2.0.22", 5002318)
    private val MODERN_TONGUE_BRIDGE_STEAM_LINK_BUILDS = listOf(
        SteamLinkBuild("2.0.22", 5002322),
    )
    private val HIGH_RESOLUTION_STEAM_LINK_BUILDS = listOf(
        SteamLinkBuild("2.0.20", 5001712),
        SteamLinkBuild("2.0.22", 5002244),
        SteamLinkBuild("2.0.22", 5002296),
        SteamLinkBuild("2.0.22", 5002313),
        SteamLinkBuild("2.0.22", 5002318),
        SteamLinkBuild("2.0.22", 5002322),
    )
    private val LEGACY_RECOMMENDED_STEAM_LINK_BUILDS = listOf(
        SteamLinkBuild("2.0.20", 5001740),
        SteamLinkBuild("2.0.22", 5002172),
        SteamLinkBuild("2.0.22", 5002206),
        SteamLinkBuild("2.0.22", 5002244),
    )
    private val LEGACY_XR_FOUNDATION_STEAM_LINK_BUILDS =
        LEGACY_STEAM_LINK_BUILDS + SteamLinkBuild("2.0.22", 5002296)

    // The 5001712 bundle is separate from the shared legacy bundle, but both use the
    // legacy recommendation defaults. Match exact pairs, not a numeric build cutoff.
    fun isLegacyRecommendedSteamLinkBuild(version: String, versionCode: String): Boolean =
        (version == "2.0.20" && versionCode == "5001712") ||
            LEGACY_RECOMMENDED_STEAM_LINK_BUILDS.any {
                it.version == version && it.versionCode.toString() == versionCode
            }

    fun isNativeXrSteamLinkBuild(version: String, versionCode: String): Boolean =
        NATIVE_XR_STEAM_LINK_BUILDS.any {
            it.version == version && it.versionCode.toString() == versionCode
        }

    fun isFullFacebridgeSteamLinkBuild(version: String, versionCode: String): Boolean =
        FULL_FACEBRIDGE_STEAM_LINK_BUILDS.any {
            it.version == version && it.versionCode.toString() == versionCode
        }

    fun isModernTongueBridgeSteamLinkBuild(version: String, versionCode: String): Boolean =
        MODERN_TONGUE_BRIDGE_STEAM_LINK_BUILDS.any {
            it.version == version && it.versionCode.toString() == versionCode
        }

    fun isHighResolutionSteamLinkBuild(version: String, versionCode: String): Boolean =
        HIGH_RESOLUTION_STEAM_LINK_BUILDS.any {
            it.version == version && it.versionCode.toString() == versionCode
        }

    fun isLegacyXrFoundationSteamLinkBuild(version: String, versionCode: String): Boolean =
        LEGACY_XR_FOUNDATION_STEAM_LINK_BUILDS.any {
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
                    "Build 5002322 recommends Galaxy XR high-resolution 3-projection fix, GXR tongue bridge, " +
                        "Microphone input preset (Voice Recognition), Unrestricted battery usage, " +
                        "Visual Delay Fix (60 ms), and OLED color calibration with the Final balanced tested profile. " +
                        "The retired projection experiments are excluded."
                } else {
                    "Build ${build.versionCode} recommends its native-Android-XR-safe set: Galaxy XR " +
                        "high-resolution 3-projection fix, Device identity, Microphone input preset, OLED color " +
                        "calibration, GXR face bridge, Visual Delay Fix, and Unrestricted battery usage. " +
                        "Appear on top remains an optional legacy fallback."
                },
            )
        }

    val COMPATIBILITIES_STEAM_LINK =
        COMPATIBILITIES_STEAM_LINK_LEGACY + COMPATIBILITIES_STEAM_LINK_NATIVE_XR

    // Retained for individual patches that are verified only before the latest exact build.
    val COMPATIBILITIES_STEAM_LINK_BEFORE_LATEST =
        COMPATIBILITIES_STEAM_LINK.filterNot { compatibility ->
            compatibility.targets.any { target ->
                target.version == "2.0.22" && target.versionCodes?.values?.contains(5002322) == true
            }
        }

    val COMPATIBILITIES_STEAM_LINK_FULL_FACEBRIDGE =
        COMPATIBILITIES_STEAM_LINK_BEFORE_LATEST

    val COMPATIBILITIES_STEAM_LINK_5002322 =
        COMPATIBILITIES_STEAM_LINK_NATIVE_XR.filter { compatibility ->
            compatibility.targets.any { target ->
                target.version == "2.0.22" && target.versionCodes?.values?.contains(5002322) == true
            }
        }

    val COMPATIBILITIES_STEAM_LINK_MODERN_TONGUE_BRIDGE =
        COMPATIBILITIES_STEAM_LINK_5002322

    val COMPATIBILITIES_STEAM_LINK_5002318 =
        COMPATIBILITIES_STEAM_LINK_NATIVE_XR.filter { compatibility ->
            compatibility.targets.any { target ->
                target.version == "2.0.22" && target.versionCodes?.values?.contains(5002318) == true
            }
        }

    val COMPATIBILITIES_STEAM_LINK_5001712 =
        COMPATIBILITIES_STEAM_LINK_LEGACY.filter { compatibility ->
            compatibility.targets.any { target ->
                target.version == "2.0.20" && target.versionCodes?.values?.contains(5001712) == true
            }
        }

    val COMPATIBILITIES_STEAM_LINK_LEGACY_RECOMMENDED =
        LEGACY_RECOMMENDED_STEAM_LINK_BUILDS.map(::steamLinkBuildCompatibility)

    val COMPATIBILITIES_STEAM_LINK_HIGH_RESOLUTION =
        HIGH_RESOLUTION_STEAM_LINK_BUILDS.map { build ->
            steamLinkBuildCompatibility(
                build = build,
                description = when (build.versionCode) {
                    5001712 -> "Exact Steam Link 2.0.20/5001712 high-resolution target with its isolated " +
                        "2-projection to 3-layer payload. The topology correction has prior user-reported " +
                        "startup and delayed-frame runtime evidence; this rebuilt binary remains uninstalled."
                    5002322 -> "Headset-validated Galaxy XR high-resolution patch target for exact Steam Link " +
                        "${build.version} build ${build.versionCode}."
                    else -> "Static decoded-base adaptation of the Galaxy XR high-resolution patch for exact " +
                        "Steam Link ${build.version} build ${build.versionCode}; headset validation pending."
                },
            )
        }

    val COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL =
        (LEGACY_STEAM_LINK_BUILDS + NATIVE_XR_STEAM_LINK_BUILDS).map { build ->
            steamLinkBuildCompatibility(
                build = build,
                name = EXPERIMENTAL_COMPATIBILITY_NAME,
                description = "Experimental patches for Steam Link ${build.version} build ${build.versionCode}.",
            )
        }

}

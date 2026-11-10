package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    const val EXPERIMENTAL_COMPATIBILITY_NAME = "Steam Link Experimental"
    private val legacy = listOf("2.0.20" to 5001712, "2.0.20" to 5001812, "2.0.21" to 5001968, "2.0.22" to 5002244)
    private val native = listOf("2.0.23" to 5002363, "2.0.24" to 5002395, "2.0.24" to 5002527)
    fun isLegacyXrFoundationSteamLinkBuild(version: String, versionCode: String) = legacy.any { it.first == version && it.second.toString() == versionCode }
    fun isNativeXrSteamLinkBuild(version: String, versionCode: String) = native.any { it.first == version && it.second.toString() == versionCode }
    private fun compatibility(build: Pair<String, Int>, experimental: Boolean = false) = Compatibility(
        name = if (experimental) EXPERIMENTAL_COMPATIBILITY_NAME else "Steam Link",
        packageName = "com.valvesoftware.steamlinkvr",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1B2838,
        targets = listOf(AppTarget(version = build.first,
            versionCodes = SupportedAbi.entries.associateWith { build.second },
            description = "Author patches for exact Steam Link ${build.first}/${build.second}.")),
    )
    val COMPATIBILITIES_STEAM_LINK = (legacy + native).map { compatibility(it) }
    val COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL = (legacy + native).map { compatibility(it, true) }
    val COMPATIBILITIES_STEAM_LINK_LEGACY_EXPERIMENTAL = legacy.map { compatibility(it, true) }
    val COMPATIBILITIES_STEAM_LINK_NATIVE_XR_EXPERIMENTAL = native.map { compatibility(it, true) }
}

package app.template.patches.steamlink.identity

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITY_STEAM_LINK
import app.template.patches.steamlink.androidxr.xrDeviceConfigBaselinePatch

private fun identityResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/steamlink/identity/$name")
        ?: error("Missing bundled resource: steamlink/identity/$name"))
        .use { it.readBytes() }

@Suppress("unused")
val deviceIdentityPatch = rawResourcePatch(
    name = "Device identity",
    description = "Overrides the HMD manufacturer/model identity reported to SteamVR (hmd_config.json only; " +
        "controller identity is unaffected). 'samsung-default' leaves the file untouched.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STEAM_LINK)
    dependsOn(xrDeviceConfigBaselinePatch)

    val profile by stringOption(
        key = "profile",
        default = "meta-quest-pro",
        values = mapOf(
            "Samsung Galaxy XR (default, no change)" to "samsung-default",
            "Meta Quest Pro" to "meta-quest-pro",
            "PICO 4 Pro" to "pico-4-pro",
        ),
        title = "HMD identity",
        description = "Which HMD identity to report to SteamVR.",
        required = true,
    )

    execute {
        val fileName = when (profile) {
            "samsung-default", "Samsung Galaxy XR (default, no change)" -> return@execute
            "meta-quest-pro", "Meta Quest Pro" -> "hmd_config_meta_quest_pro.json"
            "pico-4-pro", "PICO 4 Pro" -> "hmd_config_pico_4_pro.json"
            else -> throw PatchException("Unknown device identity profile: $profile")
        }
        get("assets/config/hmd_config.json").writeBytes(identityResource(fileName))
    }
}

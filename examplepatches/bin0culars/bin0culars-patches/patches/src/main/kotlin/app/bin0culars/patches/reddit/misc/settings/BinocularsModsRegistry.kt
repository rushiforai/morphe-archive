package app.bin0culars.patches.reddit.misc.settings

import app.morphe.patcher.patch.PatchException

enum class BinocularsModsSection(val id: String, val title: String) {
    FEED("feed", "Feed"),
    POSTS("posts", "Posts and comments"),
    MEDIA("media", "Media viewer"),
    NAVIGATION("navigation", "Navigation"),
    LINKS("links", "Links and sharing"),
    PRIVACY("privacy", "Privacy"),
    MISC("misc", "Other"),
}

data class BinocularsModsChoice(val value: String, val label: String)

data class BinocularsModsSetting(
    val key: String,
    val section: BinocularsModsSection,
    val title: String,
    val summary: String,
    val default: Boolean = false,
    val parentKey: String? = null,
    val choices: List<BinocularsModsChoice> = emptyList(),
    val defaultChoice: String? = null,
)

private val keyRegex = Regex("^[a-z0-9_]+$")
internal val registeredSettings = mutableListOf<BinocularsModsSetting>()

fun addBinocularsModsSetting(setting: BinocularsModsSetting) {
    if (!keyRegex.matches(setting.key)) {
        throw PatchException("Setting key '${setting.key}' must match [a-z0-9_]+")
    }
    if (registeredSettings.any { it.key == setting.key }) {
        throw PatchException("Duplicate setting key: '${setting.key}'")
    }
    registeredSettings.add(setting)
}

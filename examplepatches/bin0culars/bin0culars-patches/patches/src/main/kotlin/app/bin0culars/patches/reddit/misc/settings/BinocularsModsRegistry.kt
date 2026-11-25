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

data class BinocularsModsSlider(
    val min: Int,
    val max: Int,
    val step: Int,
    val unit: String,
    val default: Int,
)

data class BinocularsModsSetting(
    val key: String,
    val section: BinocularsModsSection,
    val title: String,
    val summary: String,
    val default: Boolean = false,
    val parentKey: String? = null,
    val choices: List<BinocularsModsChoice> = emptyList(),
    val defaultChoice: String? = null,
    val slider: BinocularsModsSlider? = null,
)

private val keyRegex = Regex("^[a-z0-9_]+$")
internal val registeredSettings = mutableListOf<BinocularsModsSetting>()

private fun sliderError(setting: BinocularsModsSetting, slider: BinocularsModsSlider): String? = when {
    setting.choices.isNotEmpty() -> "Slider setting cannot have choices"
    slider.step <= 0 -> "Slider step must be greater than 0"
    slider.min >= slider.max -> "Slider min must be less than max"
    (slider.max - slider.min) % slider.step != 0 -> "Slider range (max - min) must be divisible by step"
    slider.default !in slider.min..slider.max -> "Slider default must be within min..max"
    slider.unit.contains('|') || slider.unit.contains(',') -> "Slider unit cannot contain '|' or ','"
    else -> null
}

private fun settingError(setting: BinocularsModsSetting): String? = when {
    !keyRegex.matches(setting.key) -> "Setting key '${setting.key}' must match [a-z0-9_]+"
    registeredSettings.any { it.key == setting.key } -> "Duplicate setting key: '${setting.key}'"
    else -> setting.slider?.let { sliderError(setting, it) }?.let { "$it: '${setting.key}'" }
}

fun addBinocularsModsSetting(setting: BinocularsModsSetting) {
    settingError(setting)?.let { throw PatchException(it) }
    registeredSettings.add(setting)
}

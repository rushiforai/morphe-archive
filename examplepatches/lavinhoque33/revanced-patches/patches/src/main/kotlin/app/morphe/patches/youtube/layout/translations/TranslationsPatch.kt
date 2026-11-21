package app.morphe.patches.youtube.layout.translations

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.filePathOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.shared.translations.APP_LANGUAGES
import app.morphe.patches.shared.translations.baseTranslationsPatch
import app.morphe.patches.shared.translations.filterTranslations
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.patch.PatchList.TRANSLATIONS_FOR_YOUTUBE
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch

// Array of supported translations, each represented by its language code.
private val SUPPORTED_TRANSLATIONS = setOf(
    "ar",
    "az-rAZ",
    "bn",
    "cs-rCZ",
    "de-rDE",
    "el-rGR",
    "es-rES",
    "fa-rIR",
    "fr-rFR",
    "hu-rHU",
    "in",
    "it-rIT",
    "iw-rIL",
    "ja-rJP",
    "ko-rKR",
    "pl-rPL",
    "pt-rBR",
    "ru-rRU",
    "th-rTH",
    "tr-rTR",
    "uk-rUA",
    "vi-rVN",
    "zh-rCN",
    "zh-rTW",
)

@Suppress("unused")
val translationsBytecodePatch = bytecodePatch {
    dependsOn(settingsPatch)

    execute {
        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: TRANSLATIONS"
            ), TRANSLATIONS_FOR_YOUTUBE
        )
    }
}

@Suppress("unused")
val translationsPatch = resourcePatch(
    TRANSLATIONS_FOR_YOUTUBE.title,
    TRANSLATIONS_FOR_YOUTUBE.summary,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(translationsBytecodePatch)

    val customTranslations by filePathOption(
        key = "customTranslations",
        default = "",
        title = "Custom translations",
        description = """
            The path to the 'strings.xml' file.
            Please note that applying the 'strings.xml' file will overwrite all existing translations.
            """.trimIndent(),
    )

    val selectedTranslations by stringOption(
        key = "selectedTranslations",
        default = SUPPORTED_TRANSLATIONS.joinToString(", "),
        title = "Translations to add",
        description = "A list of translations to be added for the RVX settings, separated by commas.",
    )

    val selectedStringResources by stringOption(
        key = "selectedStringResources",
        default = APP_LANGUAGES.joinToString(", "),
        title = "String resources to keep",
        description = """
            A list of locales to keep, separated by commas. Choosing a language also keeps its regional variants.
            Locale-specific resources outside the selection are removed. Use "all" to keep every locale.

            The default English resources are always kept.
            """.trimIndent(),
    )

    execute {
        baseTranslationsPatch(
            customTranslations, selectedTranslations,
            SUPPORTED_TRANSLATIONS, "youtube"
        )

        addPreference(TRANSLATIONS_FOR_YOUTUBE)
    }

    finalize {
        filterTranslations(selectedStringResources, filterRvxPicker = true)
    }
}

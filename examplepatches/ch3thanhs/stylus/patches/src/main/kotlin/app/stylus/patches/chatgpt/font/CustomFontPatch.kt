package app.stylus.patches.chatgpt.font

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.stylus.patches.chatgpt.shared.Constants.COMPATIBILITY_CHATGPT

private val customFontFile = stringOption(
    key = "customFontFile",
    default = null,
    title = "Custom font",
    description = "The file path to your font. Tap the file picker and select it. " +
        "The font must be in TTF or OTF format. " +
        "A variable font is recommended so heading and body text keep their different weights.",
    required = true,
)

private val fontFeatureSettings = stringOption(
    key = "fontFeatureSettings",
    default = null,
    title = "Font feature settings",
    description = "Optional OpenType features for the custom font. For example, enter " +
        "'ss01' 1 to use Inter's open-style digits. You can also paste a CSS declaration " +
        "such as font-feature-settings: \"ss01\" 1;. Android ignores features that the " +
        "selected font does not support.",
    required = false,
)

@Suppress("unused")
val customFontChatGptPatch = patch(
    name = "Custom font",
    description = "Replaces ChatGPT's UI fonts with your own font.",
    default = false,
) {
    category("Font")
    compatibleWith(COMPATIBILITY_CHATGPT)
    dependsOn(chatGptFontHooksPatch)
    customFontFile()
    fontFeatureSettings()

    execute {
        val features = normalizeFontFeatureSettings(fontFeatureSettings.value)
        installChatGptFont(ChatGptFont.UI, customFontFile.value, features)
        patchComposeDesignTypeface()
        if (features != null) patchFontFeatureCalls()
    }
}

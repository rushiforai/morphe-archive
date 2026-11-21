package app.stylus.patches.chatgpt.font

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.stylus.patches.chatgpt.shared.Constants.COMPATIBILITY_CHATGPT

private val customMonospaceFontFileOption = stringOption(
    key = "customMonospaceFontFile",
    default = null,
    title = "Custom monospace font",
    description = "The file path to your monospace font. Tap the file picker and select it. " +
        "The font must be in TTF or OTF format.",
    required = true,
)

@Suppress("unused")
val customMonospaceFontChatGptPatch = patch(
    name = "Custom monospace font",
    description = "Replaces ChatGPT's monospace fonts with your own monospace font.",
    default = false,
) {
    category("Font")
    compatibleWith(COMPATIBILITY_CHATGPT)
    dependsOn(chatGptFontHooksPatch)
    customMonospaceFontFileOption()

    execute {
        installChatGptFont(ChatGptFont.MONOSPACE, customMonospaceFontFileOption.value)
        patchDirectMonospaceSpans()
    }
}

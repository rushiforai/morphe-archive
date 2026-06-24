package dev.jason.gboardpatches.patches.gboard.features.chinesevoice

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.shared.elements

private const val STRINGS_XML = "res/values/strings.xml"
private const val ENABLE_VOICE_IN_CHINESE_STRING_NAME = "string_0x7f140378"
private const val ENABLE_VOICE_IN_CHINESE_TRUE = "enable_voice_in_chinese=true"

internal val gboardChineseOnlineVoiceResourcePatch = resourcePatch(
    description = "把 Chinese IME 的 enable_voice_in_chinese condition string 改成 true。"
) {
    finalize {
        applyChineseVoiceInputResourcePatch()
    }
}

context(context: ResourcePatchContext)
private fun applyChineseVoiceInputResourcePatch() = with(context) {
    document(STRINGS_XML).use { document ->
        val stringElement = document.getElementsByTagName("string").elements().firstOrNull {
            it.getAttribute("name") == ENABLE_VOICE_IN_CHINESE_STRING_NAME
        } ?: error("Could not find string $ENABLE_VOICE_IN_CHINESE_STRING_NAME in $STRINGS_XML")

        stringElement.textContent = ENABLE_VOICE_IN_CHINESE_TRUE
    }
}

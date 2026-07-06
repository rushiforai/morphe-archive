package dev.jason.gboardpatches.patches.gboard.features.englishqwerty

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.shared.childElements
import dev.jason.gboardpatches.patches.gboard.shared.ensureTemplateAction
import dev.jason.gboardpatches.patches.gboard.shared.findSoftkeyList
import dev.jason.gboardpatches.patches.gboard.shared.findSoftkeyTemplate

private const val ENGLISH_QWERTY_XML = "res/xml/xml_0x7f171175.xml"
private const val ENGLISH_QWERTY_TEMPLATE_ID = "@id/id_0x7f0b21c5"

internal val gboardEnglishQwertySlideResourcePatch = resourcePatch(
    description = "補回英文 QWERTY 上滑切換大小寫的資源 metadata。"
) {
    finalize {
        applyEnglishQwertyResourcePatch()
    }
}

context(context: ResourcePatchContext)
private fun applyEnglishQwertyResourcePatch() = with(context) {
    document(ENGLISH_QWERTY_XML).use { document ->
        val template = document.findSoftkeyTemplate(ENGLISH_QWERTY_TEMPLATE_ID)
        ensureTemplateAction(
            template,
            type = "SLIDE_UP",
            data = "\$slideup_data\$",
            popupLabel = "\$slideup_data\$"
        )

        document.findSoftkeyList(ENGLISH_QWERTY_TEMPLATE_ID)
            .childElements("softkey")
            .forEach { key ->
                resolveEnglishSlideUpValue(key.getAttribute("press_data"))
                    ?.let { key.setAttribute("slideup_data", it) }
            }
    }
}

private fun resolveEnglishSlideUpValue(pressData: String): String? {
    if (pressData.length != 1) return null

    val char = pressData.single()
    return when {
        char in 'a'..'z' -> char.uppercaseChar().toString()
        char in 'A'..'Z' -> char.lowercaseChar().toString()
        else -> null
    }
}

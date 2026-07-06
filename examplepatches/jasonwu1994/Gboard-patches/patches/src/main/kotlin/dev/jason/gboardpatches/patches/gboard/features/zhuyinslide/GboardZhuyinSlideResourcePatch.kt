package dev.jason.gboardpatches.patches.gboard.features.zhuyinslide

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.shared.childElements
import dev.jason.gboardpatches.patches.gboard.shared.ensureTemplateAction
import dev.jason.gboardpatches.patches.gboard.shared.findSoftkeyList
import dev.jason.gboardpatches.patches.gboard.shared.findSoftkeyTemplate
import dev.jason.gboardpatches.patches.gboard.shared.setFooterLabelValue

private const val ZHUYIN_TEMPLATE_XML = "res/xml/xml_0x7f17117a.xml"
private const val ZHUYIN_KEYS_XML = "res/xml/xml_0x7f171179.xml"
private const val ZHUYIN_TOP_TEMPLATE_ID = "@id/id_0x7f0b21d6"
private const val ZHUYIN_BOTTOM_TEMPLATE_ID = "@id/id_0x7f0b21d7"
private const val FOOTER_LABEL_LOCATION = "@id/id_0x7f0b060f"

private val ZHUYIN_BOTTOM_ROW_SLIDE_DOWN_MAP = linkedMapOf(
    "ㄝ" to "…",
    "ㄡ" to "！",
    "ㄤ" to "：",
    "ㄥ" to "？"
)

internal val gboardZhuyinSlideResourcePatch = resourcePatch(
    description = "補回注音鍵盤的滑動輸入資源 metadata。"
) {
    finalize {
        applyZhuyinResourcePatch()
    }
}

context(context: ResourcePatchContext)
private fun applyZhuyinResourcePatch() = with(context) {
    document(ZHUYIN_TEMPLATE_XML).use { templateDocument ->
        val topTemplate = templateDocument.findSoftkeyTemplate(ZHUYIN_TOP_TEMPLATE_ID)
        ensureTemplateAction(
            topTemplate,
            type = "SLIDE_UP",
            data = "\$slideup_data\$",
            popupLabel = "\$slideup_data\$"
        )
        ensureTemplateAction(
            topTemplate,
            type = "SLIDE_DOWN",
            data = "\$press_data\$",
            popupLabel = "\$press_data\$"
        )
        setFooterLabelValue(topTemplate, FOOTER_LABEL_LOCATION, "\$press_data\$")

        val bottomTemplate = templateDocument.findSoftkeyTemplate(ZHUYIN_BOTTOM_TEMPLATE_ID)
        ensureTemplateAction(
            bottomTemplate,
            type = "SLIDE_DOWN",
            data = "\$slidedown_data\$",
            popupLabel = "\$slidedown_data\$"
        )
        setFooterLabelValue(bottomTemplate, FOOTER_LABEL_LOCATION, "\$slidedown_data\$")
    }

    document(ZHUYIN_KEYS_XML).use { keysDocument ->
        keysDocument.findSoftkeyList(ZHUYIN_TOP_TEMPLATE_ID)
            .childElements("softkey")
            .forEach { key ->
                if (key.hasAttribute("slideup_data")) return@forEach

                splitNonBlankTokens(key.getAttribute("long_press_data"))
                    .getOrNull(2)
                    ?.let { slideUpValue ->
                        key.setAttribute("slideup_data", slideUpValue)
                    }
            }

        keysDocument.findSoftkeyList(ZHUYIN_BOTTOM_TEMPLATE_ID)
            .childElements("softkey")
            .forEach { key ->
                when (val pressLabel = key.getAttribute("press_label")) {
                    "ㄦ" -> key.removeAttribute("slidedown_data")
                    in ZHUYIN_BOTTOM_ROW_SLIDE_DOWN_MAP ->
                        key.setAttribute("slidedown_data", ZHUYIN_BOTTOM_ROW_SLIDE_DOWN_MAP.getValue(pressLabel))
                }
            }
    }
}

private fun splitNonBlankTokens(text: String): List<String> =
    text.split(Regex("\\s+")).filter { it.isNotBlank() }

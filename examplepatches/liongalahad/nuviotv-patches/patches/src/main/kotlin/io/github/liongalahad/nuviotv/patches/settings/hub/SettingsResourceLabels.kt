package io.github.liongalahad.nuviotv.patches.settings.hub

import org.w3c.dom.Document
import org.w3c.dom.Element

/** Branding is invariant; the description follows each Android resource locale. */
internal object SettingsResourceLabels {
    fun transform(document: Document, qualifier: String, version: String) {
        val language = qualifier.removePrefix("values-").removePrefix("b+")
            .substringBefore('-').substringBefore('+')
        val description = when (language) {
            "es" -> "Ajustes de los parches"
            "it" -> "Impostazioni delle patch"
            "de" -> "Patch-Einstellungen"
            "fr" -> "Paramètres des patchs"
            "pt" -> "Definições dos patches"
            "ja" -> "パッチ設定"
            "ko" -> "패치 설정"
            "zh" -> if (qualifier.contains("Hant") || qualifier.contains("rTW") ||
                qualifier.contains("rHK") || qualifier.contains("rMO")) "修補程式設定" else "补丁设置"
            else -> "Patch settings"
        }
        val strings = document.getElementsByTagName("string")
        for (index in 0 until strings.length) {
            val element = strings.item(index) as? Element ?: continue
            when (element.getAttribute("name")) {
                "settings_experience" -> element.textContent = "Morphe"
                "settings_experience_subtitle" -> element.textContent = "$description  •  $version"
            }
        }
    }
}

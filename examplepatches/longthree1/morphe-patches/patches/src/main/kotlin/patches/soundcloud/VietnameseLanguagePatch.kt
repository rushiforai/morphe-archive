package patches.soundcloud

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

@Suppress("unused")
val vietnameseLanguagePatch = resourcePatch(
    name = "Vietnamese language",
    description = "Adds Vietnamese UI resources and known server-provided interface labels, preserves content titles, and enables Tiếng Việt in app locale selection.",
    default = true,
) {
    compatibleWith(soundcloud)
    dependsOn(originalInput, vietnameseUiLabelsPatch)

    execute {
        // 1. Add <locale android:name="vi" /> to res/xml/locales_config.xml
        val localesConfigPath = "res/xml/locales_config.xml"
        if (get(localesConfigPath).isFile) {
            document(localesConfigPath).use { document ->
                val locales = document.getElementsByTagName("locale")
                var hasVi = false
                for (i in 0 until locales.length) {
                    val el = locales.item(i) as? Element ?: continue
                    if (el.getAttribute("android:name") == "vi") {
                        hasVi = true
                        break
                    }
                }
                if (!hasVi) {
                    val newLocale = document.createElement("locale")
                    newLocale.setAttribute("android:name", "vi")
                    document.documentElement.appendChild(newLocale)
                }
            }
        }

        // 2. Write res/values-vi/strings.xml
        val stringsStream = object {}.javaClass.getResourceAsStream("/soundcloud/strings-vi.xml")
            ?: throw PatchException("Vietnamese strings resource not found in patch bundle (/soundcloud/strings-vi.xml)")
        val stringsXml = stringsStream.bufferedReader().use { it.readText() }
        val stringsFile = get("res/values-vi/strings.xml", false)
        stringsFile.parentFile.mkdirs()
        stringsFile.writeText(stringsXml)

        // 3. Write res/values-vi/plurals.xml
        val pluralsStream = object {}.javaClass.getResourceAsStream("/soundcloud/plurals-vi.xml")
            ?: throw PatchException("Vietnamese plurals resource not found in patch bundle (/soundcloud/plurals-vi.xml)")
        val pluralsXml = pluralsStream.bufferedReader().use { it.readText() }
        val pluralsFile = get("res/values-vi/plurals.xml", false)
        pluralsFile.parentFile.mkdirs()
        pluralsFile.writeText(pluralsXml)
    }
}

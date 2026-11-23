package io.github.xxlc.patches.grok

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.PublicXmlManager
import org.w3c.dom.Element

private val stringIds = mutableMapOf<String, Int>()

// Only read after resource dependency has run; never returns dummy valid ID 0.
internal fun stringId(name: String): Int = stringIds.getValue(name)

// Unnamed so shared patch does not appear in Manager list.
internal val downloadResourcesPatch = resourcePatch {
    compatibleWith(grokCompatibility)

    execute {
        stringIds.clear()
        listOf("values", "values-vi").forEach { directory ->
            val path = "res/$directory/strings.xml"
            val file = get(path)
            if (!file.exists()) {
                file.parentFile.mkdirs()
                file.writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?><resources/>")
            }
            document(path).use { document ->
                val strings = document.getElementsByTagName("string")
                val existing = (0 until strings.length).map { strings.item(it) as Element }
                xxlcStrings.forEach { string ->
                    val element = existing.singleOrNull { it.getAttribute("name") == string.name }
                        ?: document.createElement("string").also {
                            it.setAttribute("name", string.name)
                            document.documentElement.appendChild(it)
                        }
                    // DOM preserves %1$d; $ only needs escaping in Kotlin code.
                    element.textContent = if (directory == "values-vi") string.vi else string.en
                }
            }
        }

        // resourceId() only sees input resources. Allocate new IDs in public.xml
        // so both bytecode and resource compilation steps use the same ID.
        PublicXmlManager(get("res/values/public.xml")).use { publicIds ->
            xxlcStrings.forEach { string ->
                publicIds.createPublicId("string", string.name)
                stringIds[string.name] = publicIds.getDefinedIds().getValue("string" to string.name)
            }
        }
    }
}

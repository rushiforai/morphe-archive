package io.github.xxlc.patches.grok

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.PublicXmlManager
import org.w3c.dom.Element

internal const val DOWNLOAD_ALL_STRING = "grok_imagine_post_download_all"
internal var downloadAllStringId: Int = 0
    private set

// Không có tên để patch dùng chung không xuất hiện trong danh sách của Manager.
internal val downloadResourcesPatch = resourcePatch {
    compatibleWith(grokCompatibility)

    execute {
        mapOf("values" to "Download all", "values-vi" to "Tải tất cả").forEach { (directory, text) ->
            val path = "res/$directory/strings.xml"
            val file = get(path)
            if (!file.exists()) {
                file.parentFile.mkdirs()
                file.writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?><resources/>")
            }
            document(path).use { document ->
                val strings = document.getElementsByTagName("string")
                val existing = (0 until strings.length).map { strings.item(it) as Element }
                    .singleOrNull { it.getAttribute("name") == DOWNLOAD_ALL_STRING }
                val element = existing ?: document.createElement("string").also {
                    it.setAttribute("name", DOWNLOAD_ALL_STRING)
                    document.documentElement.appendChild(it)
                }
                element.textContent = text
            }
        }

        // resourceId() chỉ thấy tài nguyên đầu vào. Cấp ID mới trong public.xml
        // để cả bytecode và bước biên dịch tài nguyên dùng cùng một ID.
        PublicXmlManager(get("res/values/public.xml")).use { publicIds ->
            publicIds.createPublicId("string", DOWNLOAD_ALL_STRING)
            downloadAllStringId = publicIds.getDefinedIds().getValue("string" to DOWNLOAD_ALL_STRING)
        }
    }
}

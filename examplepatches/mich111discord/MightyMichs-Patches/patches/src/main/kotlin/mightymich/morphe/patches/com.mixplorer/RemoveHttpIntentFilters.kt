package mightymich.morphe.patches.com.mixplorer

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import org.w3c.dom.Node

/**
 * Removes http/https data schemes from VIEW (+ BROWSABLE) intent-filters so
 * MiXplorer no longer appears in browser "Open with" / link choosers.
 *
 * Alternative to hiding only DownloadActivity. Does not touch file/content/smb/ftp.
 */
@Suppress("unused")
val removeHttpIntentFiltersPatch = resourcePatch(
    name = "Remove HTTP/HTTPS intent filters",
    description = "Strips http/https schemes from VIEW/BROWSABLE intent-filters " +
        "so MiXplorer is not offered for web links.",
    default = false
) {
    compatibleWith(MiXplorerCompatibility.MIXPLORER)

    execute {
        document("AndroidManifest.xml").use { document ->
            val filters = document.getElementsByTagName("intent-filter")
            for (i in filters.length - 1 downTo 0) {
                val filter = filters.item(i) as? Element ?: continue

                var hasView = false
                var hasBrowsible = false
                val actions = filter.getElementsByTagName("action")
                for (a in 0 until actions.length) {
                    val el = actions.item(a) as? Element ?: continue
                    if (el.getAttribute("android:name") == "android.intent.action.VIEW") {
                        hasView = true
                    }
                }
                val cats = filter.getElementsByTagName("category")
                for (c in 0 until cats.length) {
                    val el = cats.item(c) as? Element ?: continue
                    if (el.getAttribute("android:name") == "android.intent.category.BROWSABLE") {
                        hasBrowsible = true
                    }
                }
                if (!hasView) continue

                // Remove http/https <data> nodes
                val dataNodes = filter.getElementsByTagName("data")
                var removedHttp = false
                for (d in dataNodes.length - 1 downTo 0) {
                    val data = dataNodes.item(d) as? Element ?: continue
                    val scheme = data.getAttribute("android:scheme")
                    if (scheme == "http" || scheme == "https") {
                        filter.removeChild(data)
                        removedHttp = true
                    }
                }

                // If filter was only for http(s) (no remaining data + BROWSABLE), drop BROWSABLE
                if (removedHttp && hasBrowsible) {
                    var stillHasData = false
                    val data2 = filter.getElementsByTagName("data")
                    for (d in 0 until data2.length) {
                        val data = data2.item(d) as? Element ?: continue
                        if (data.getAttribute("android:scheme").isNotEmpty() ||
                            data.getAttribute("android:mimeType").isNotEmpty()
                        ) {
                            stillHasData = true
                            break
                        }
                    }
                    // Keep filter if other schemes/mimes remain; only strip http(s) data.
                    // Optionally remove empty BROWSABLE-only leftovers:
                    if (!stillHasData) {
                        filter.parentNode?.removeChild(filter)
                    }
                }
            }
        }
    }
}

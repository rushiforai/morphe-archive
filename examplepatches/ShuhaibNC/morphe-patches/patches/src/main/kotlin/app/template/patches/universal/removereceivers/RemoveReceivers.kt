package app.template.patches.universal.removereceivers

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Original behaviour (ported from an APKEditor MATCH_REPLACE manifest script):
 *
 * Strip every <receiver>...</receiver> and every self-closing <receiver ... /> from
 * AndroidManifest.xml, replacing them with nothing. The old script did this with a single
 * regex covering both element shapes (open/close vs. self-closing) because it was editing
 * the manifest as raw text; here we just remove every matching node from the parsed DOM,
 * so both shapes are handled the same way with no regex needed.
 */
val removeAllReceiversPatch = resourcePatch(
    name = "Remove all receivers",
    description = "Removes every <receiver> declaration from AndroidManifest.xml.",
) {
    execute {
        document("AndroidManifest.xml").use { document ->
            val receivers = document.getElementsByTagName("receiver")

            // Equivalent of the MATCH_REPLACE deleting every <receiver>...</receiver> or
            // <receiver ... /> block. Collect first: getElementsByTagName returns a live
            // NodeList, so removing while iterating it directly would skip entries.
            val toRemove = buildList {
                for (i in 0 until receivers.length) {
                    (receivers.item(i) as? Element)?.let(::add)
                }
            }

            toRemove.forEach { receiver ->
                receiver.parentNode?.removeChild(receiver)
            }
        }
    }
}
package semicoloncolonel.mobilestream.patches.yttv.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// ─────────────────────────────────────────────────────────────────────────────
// Skip interval labels, part of "Change skip interval".
//
// The skip buttons read their accessibility labels from fixed strings with the
// number written in ("Rewind 15 seconds", "Fast forward 15 seconds"), and the
// double-tap hint uses "15 seconds". TalkBack would read 15 whatever interval
// the patch sets. In every language folder, the standalone number 15 in those
// strings is replaced with the chosen interval. Languages that write the number
// in other digits keep their original text.
// ─────────────────────────────────────────────────────────────────────────────

private val LABELS = setOf(
    "unplugged_rewind_seconds_button_content_description",
    "unplugged_skip_seconds_button_content_description",
    "double_tap_skip_default_boundary_text",
)

private val FIFTEEN = Regex("(?<![0-9])15(?![0-9])")

internal val skipIntervalLabelsPatch: ResourcePatch = resourcePatch {
    execute {
        val seconds = runCatching { changeSkipIntervalPatch.options["skipSeconds"].value as String? }
            .getOrNull()?.toIntOrNull() ?: return@execute
        if (seconds == 15) return@execute

        // Resource files are decoded when document() asks for them, so ask for
        // each language folder's strings.xml rather than checking for the file.
        val folders = get("res").listFiles { file -> file.isDirectory && file.name.startsWith("values") }
            .orEmpty()

        var changed = 0
        folders.forEach { folder ->
            val document = runCatching { document("res/${folder.name}/strings.xml") }.getOrNull() ?: return@forEach
            document.use { document ->
                val strings = document.getElementsByTagName("string")
                for (i in 0 until strings.length) {
                    val element = strings.item(i) as Element
                    if (element.getAttribute("name") !in LABELS) continue
                    val text = element.textContent
                    val updated = FIFTEEN.replace(text, seconds.toString())
                    if (updated != text) {
                        element.textContent = updated
                        changed++
                    }
                }
            }
        }
        if (changed == 0) throw PatchException("YouTube TV skip button labels not found")
    }
}

package app.template.patches.universal.noactionbar


import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import java.io.File


val hideTitleActionBarPatch = resourcePatch(
    name = "Hide title/action bar",
    description = "Removes the title/action bar from every declared style, in every " +
            "res/values*/styles.xml resource file.",
) {
    execute {
        // Equivalent of the old TARGET glob "res/values*/styles.xml": walk every
        // values*/ resource directory (values, values-v21, values-night, ...) and
        // patch styles.xml wherever it exists.
        val resDir = get("res")
        val valuesDirs = resDir.listFiles { file ->
            file.isDirectory && file.name.startsWith("values")
        } ?: emptyArray()

        valuesDirs.forEach { valuesDir ->
            val stylesFile = File(valuesDir, "styles.xml")
            if (!stylesFile.exists()) return@forEach

            val relativePath = stylesFile.relativeTo(get(".")).path

            document(relativePath).use { document ->
                val styles = document.getElementsByTagName("style")

                for (i in 0 until styles.length) {
                    val style = styles.item(i) as? Element ?: continue

                    // Equivalent of the two MATCH_REPLACE blocks: add both items to
                    // every <style>, whether it was self-closing or already had a body.
                    // Update in place instead of blindly appending, so re-running the
                    // patch (or a style that already sets one of these) doesn't produce
                    // duplicate <item> entries.
                    style.setOrAddItem(document, "windowActionBar", "false")
                    style.setOrAddItem(document, "android:windowNoTitle", "true")
                }
            }
        }
    }
}

private fun Element.setOrAddItem(document: org.w3c.dom.Document, name: String, value: String) {
    val items = getElementsByTagName("item")
    for (i in 0 until items.length) {
        val item = items.item(i) as? Element ?: continue
        if (item.getAttribute("name") == name) {
            item.textContent = value
            return
        }
    }

    val item = document.createElement("item")
    item.setAttribute("name", name)
    item.textContent = value
    appendChild(item)
}
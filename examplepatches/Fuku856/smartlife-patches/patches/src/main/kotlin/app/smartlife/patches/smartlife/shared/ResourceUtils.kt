package app.smartlife.patches.smartlife.shared

import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Element

/**
 * SmartLife gates most optional features (AI, ads, analytics) behind
 * <bool name="..."> entries in res/values/bools.xml. At runtime the app reads
 * the local bool first (obfuscated L.getBoolean via hhl/ihl) before any remote
 * override, so flipping these is the most robust, lowest-risk way to disable a
 * feature. Only the boolean names present in [values] are changed; unknown names
 * on a different app version are ignored.
 *
 * @return the set of boolean names that were actually found and changed.
 */
internal fun ResourcePatchContext.setBoolResources(values: Map<String, Boolean>): Set<String> {
    val changed = mutableSetOf<String>()
    val boolsFile = get("res/values/bools.xml")
    if (!boolsFile.exists()) return changed

    document("res/values/bools.xml").use { document ->
        val nodes = document.getElementsByTagName("bool")
        for (index in 0 until nodes.length) {
            val element = nodes.item(index) as? Element ?: continue
            val name = element.getAttribute("name")
            val newValue = values[name] ?: continue
            element.textContent = newValue.toString()
            changed += name
        }
    }
    return changed
}


/**
 * Remove class-name entries from the startup pipeline arrays in assets/module_app.json.
 * The file is minified JSON ("A","B",...), and the given fully-qualified class names appear
 * only as array elements (pipeline initializers), so removing each quoted element with its
 * adjacent comma stops that subsystem from starting without touching the service map.
 * Unknown names (different app version) are skipped.
 *
 * @return the set of class names that were found and removed.
 */
internal fun ResourcePatchContext.removeModuleAppPipelines(classNames: Collection<String>): Set<String> {
    val file = get("assets/module_app.json")
    if (!file.exists()) return emptySet()

    var text = file.readText()
    val removed = mutableSetOf<String>()
    for (name in classNames) {
        val quoted = "\"" + name + "\""
        if (!text.contains(quoted)) continue
        removed += name
        // Order matters: first/middle element (quoted,), then last element (,quoted),
        // then a sole element (quoted) leaving an empty array.
        while (text.contains("$quoted,")) text = text.replace("$quoted,", "")
        while (text.contains(",$quoted")) text = text.replace(",$quoted", "")
        while (text.contains(quoted)) text = text.replace(quoted, "")
    }
    if (removed.isNotEmpty()) file.writeText(text)
    return removed
}

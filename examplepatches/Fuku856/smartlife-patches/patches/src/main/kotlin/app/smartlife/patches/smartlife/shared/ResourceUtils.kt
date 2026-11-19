package app.smartlife.patches.smartlife.shared

import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Element
import java.util.Collections
import java.util.WeakHashMap
import java.util.logging.Logger

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

/** Asset files edited by the patches. */
internal const val MODULE_APP_JSON = "assets/module_app.json"
internal const val HOME_FRAGMENT_JSON = "assets/home_fragment_new.json"
internal const val PERSONAL_CENTER_JSON = "assets/personal_center_config_list.json"

/**
 * Parse the asset JSON file at [path] once, let [edit] apply all of a patch's changes
 * to the tree, and write it back once if [edit] returns true.
 *
 * A missing file or a file this parser cannot read (e.g. a future app version ships
 * non-strict JSON) is skipped with a warning instead of failing the whole patch.
 */
internal fun ResourcePatchContext.editAssetJson(
    patchName: String,
    path: String,
    edit: (JsonNode) -> Boolean,
) {
    val file = get(path)
    if (!file.exists()) {
        logger(patchName).warning("$patchName: $path not found (app version may differ); skipped")
        return
    }

    val root = try {
        JsonNode.parse(file.readText())
    } catch (e: IllegalArgumentException) {
        logger(patchName).warning("$patchName: could not parse $path (${e.message}); skipped")
        return
    }
    if (edit(root)) file.writeText(root.write())
}

/**
 * Log a warning for entries a patch expected but did not find, which usually means
 * the app version differs and the patch had no effect for them.
 */
internal fun warnIfMissing(patchName: String, what: String, expected: Collection<String>, found: Set<String>) {
    val missing = expected.toSet() - found
    if (missing.isEmpty()) return
    logger(patchName).warning("$patchName: these $what were not found (app version may differ): $missing")
}

private fun logger(patchName: String): Logger = Logger.getLogger(patchName)

internal const val ATTRIBUTION_PIPELINE = "com.thingclips.smart.attribution.common.AttributionConfigPipeline"

/** Patching sessions in which [ATTRIBUTION_PIPELINE] has already been removed. */
private val attributionRemovedIn: MutableSet<ResourcePatchContext> =
    Collections.synchronizedSet(Collections.newSetFromMap(WeakHashMap()))

/**
 * Remove the AppsFlyer attribution pipeline (install/campaign tracking) from the
 * module_app.json tree [root]. It is both ad-related and telemetry, so both "Hide ads"
 * and "Disable telemetry" call this. A warning is logged only when it was not found
 * and the other patch has not already removed it in this patching session.
 *
 * @return true if the tree was changed.
 */
internal fun ResourcePatchContext.removeAttributionPipeline(patchName: String, root: JsonNode): Boolean {
    val removed = root.removeArrayElements(setOf(ATTRIBUTION_PIPELINE)).isNotEmpty()
    if (removed) {
        attributionRemovedIn += this
    } else if (this !in attributionRemovedIn) {
        warnIfMissing(patchName, "module_app.json pipelines", listOf(ATTRIBUTION_PIPELINE), emptySet())
    }
    return removed
}

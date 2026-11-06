package app.template.patches.shared

import app.morphe.patcher.patch.Option
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Shared helpers for the 24 universal patches.
 *
 * Goals:
 *  - one manifest DOM traversal instead of one per tag,
 *  - tolerant comma/newline list parsing (blank entries and trailing commas are OK),
 *  - consistent, greppable patch logs,
 *  - a single fail-safe wrapper for best-effort bytecode layers.
 */

/** Prefix used by every universal patch log line. */
const val UNIVERSAL_LOG_TAG = "[Proteus/Universal]"

fun logUniversal(message: String) = println("$UNIVERSAL_LOG_TAG $message")

/** Run a best-effort layer without ever failing the whole patch. */
inline fun guarded(tag: String, block: () -> Unit) {
    runCatching(block).onFailure {
        logUniversal("$tag: layer skipped (${it.message})")
    }
}

/**
 * Parse a user-supplied list. Accepts commas, semicolons and newlines, trims
 * whitespace, drops empty tokens and returns [fallback] for null/blank input.
 */
fun parseTokens(value: String?, fallback: Collection<String> = emptyList()): Set<String> {
    if (value.isNullOrBlank()) return fallback.toSet()
    return value
        .split(',', ';', '\n', '\r')
        .map { it.trim() }
        .filter { it.isNotEmpty() }
        .toSet()
}

/** Validator for list options: any string is acceptable (invalid tokens are ignored). */
val RELAXED_LIST_VALIDATOR: Option<String>.(String?) -> Boolean = { true }

/** All manifest tags that can declare a permission. */
val UNIVERSAL_PERMISSION_TAGS = arrayOf(
    "uses-permission",
    "uses-permission-sdk-23",
    "uses-permission-sdk-m",
)

/**
 * Visit matching manifest elements in a **single** DOM traversal.
 * The node list is snapshotted first, so the callback may mutate attributes
 * without invalidating iteration.
 */
inline fun Document.forEachManifestElement(vararg tags: String, action: (Element) -> Unit) {
    val wanted = tags.toSet()
    val all = getElementsByTagName("*")
    val snapshot = ArrayList<Element>(all.length)
    for (index in 0 until all.length) {
        val element = all.item(index) as? Element ?: continue
        if (element.tagName in wanted) snapshot.add(element)
    }
    snapshot.forEach(action)
}

/**
 * Remove matching manifest elements in a single DOM traversal.
 * Removal happens in reverse document order so live NodeList indices stay valid.
 *
 * @return the `android:name` value of every removed element.
 */
inline fun Document.removeManifestElements(
    vararg tags: String,
    predicate: (Element) -> Boolean,
): List<String> {
    val wanted = tags.toSet()
    val all = getElementsByTagName("*")
    val matches = ArrayList<Element>()
    for (index in 0 until all.length) {
        val element = all.item(index) as? Element ?: continue
        if (element.tagName in wanted && predicate(element)) matches.add(element)
    }
    matches.asReversed().forEach { it.parentNode?.removeChild(it) }
    return matches.map { it.getAttribute("android:name") }
}

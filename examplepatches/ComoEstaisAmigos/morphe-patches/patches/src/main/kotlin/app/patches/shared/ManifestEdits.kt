package app.adebisi.patches.shared

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * 25 is the lowest target Android 14 (floor 23) and 15 (floor 24) install normally, and the
 * highest that stays clear of non-SDK interface restrictions (28) and scoped storage (29).
 */
internal const val TARGET_SDK = 25

internal fun namedElements(document: Document, tag: String, names: Collection<String>): List<Element> {
    val wanted = names.toSet()
    val list = document.getElementsByTagName(tag)
    return (0 until list.length).map { list.item(it) as Element }
        .filter { it.getAttribute("android:name") in wanted }
}

/**
 * Finds every [wanted] `(tag, android:name)` first, then removes them. A missing
 * entry refuses the APK so the manifest is never half edited. Duplicate names
 * are all removed.
 */
internal fun removeUnusedNamedEntries(document: Document, wanted: List<Pair<String, String>>) {
    val found = wanted.map { (tag, name) ->
        val matches = namedElements(document, tag, listOf(name))
        if (matches.isEmpty()) throw PatchException("AndroidManifest.xml has no <$tag> named $name")
        matches
    }
    found.flatten().forEach { it.parentNode.removeChild(it) }
}

internal fun removeNamedElements(
    document: Document,
    tag: String,
    names: Collection<String>,
    label: String = tag,
) {
    val wanted = names.toSet()
    val matches = namedElements(document, tag, wanted)
    if (matches.size != wanted.size) {
        throw PatchException(
            "AndroidManifest.xml $label: expected $wanted, found ${matches.map { it.getAttribute("android:name") }}",
        )
    }
    matches.forEach { it.parentNode.removeChild(it) }
}

internal fun removeMetaData(document: Document, names: Collection<String>) {
    removeNamedElements(document, "meta-data", names)
}

internal fun removeActivities(document: Document, names: Collection<String>) {
    removeNamedElements(document, "activity", names, "activities")
}

internal fun setTargetSdk(document: Document, target: Int = TARGET_SDK) {
    val manifest = document.documentElement
    val usesSdk = document.getElementsByTagName("uses-sdk").item(0) as Element?
        ?: document.createElement("uses-sdk").also { manifest.insertBefore(it, manifest.firstChild) }
    usesSdk.setAttribute("android:targetSdkVersion", target.toString())
}

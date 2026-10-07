/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.sharetargets

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.settingsPatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val PATCH = "Remove share targets"

/** The actions another app's share sheet looks for. */
internal val SHARE_ACTIONS = setOf("android.intent.action.SEND", "android.intent.action.SEND_MULTIPLE")

/** The meta-data that points an activity at its shortcuts file, where direct share targets live. */
private const val SHORTCUTS = "android.app.shortcuts"

/**
 * Takes [SHARE_ACTIONS] off every activity in [manifest], and a filter left with no action goes
 * with them, so the share sheet other apps open no longer lists Threads. Answers the components
 * it took them from, and the shortcuts files the activities name, where [removeShareTargets] has to
 * look as well. The `<queries>` entry, which is how Threads finds apps to share to, stays.
 * Refused, with nothing changed, when no activity takes a share.
 */
internal fun removeShareFilters(manifest: Document): Pair<List<String>, List<String>> {
    val application = manifest.documentElement?.children("application")?.singleOrNull()
        ?: throw PatchException("$PATCH: AndroidManifest.xml has no single application element")
    val components = application.children("activity") + application.children("activity-alias")
    val shared = components.mapNotNull { component ->
        val filters = component.children("intent-filter").filter { filter ->
            filter.children("action").any { it.getAttribute("android:name") in SHARE_ACTIONS }
        }
        if (filters.isEmpty()) null else component to filters
    }
    if (shared.isEmpty()) throw PatchException("$PATCH: no activity in AndroidManifest.xml takes a share")
    val shortcuts = components.flatMap { it.children("meta-data") }
        .filter { it.getAttribute("android:name") == SHORTCUTS }
        .map { meta ->
            val resource = meta.getAttribute("android:resource")
            if (!resource.startsWith("@xml/")) throw PatchException("$PATCH: the shortcuts meta-data points at \"$resource\"")
            "res/xml/${resource.removePrefix("@xml/")}.xml"
        }.distinct()
    for ((_, filters) in shared) for (filter in filters) {
        filter.children("action").filter { it.getAttribute("android:name") in SHARE_ACTIONS }.forEach(filter::removeChild)
        if (filter.children("action").isEmpty()) filter.parentNode.removeChild(filter)
    }
    return shared.map { (component, _) -> component.getAttribute("android:name") } to shortcuts
}

/** Takes every `<share-target>` out of a shortcuts file, the direct share contacts Android shows. */
internal fun removeShareTargets(shortcuts: Document): Int {
    val targets = shortcuts.documentElement?.children("share-target").orEmpty()
    targets.forEach { it.parentNode.removeChild(it) }
    return targets.size
}

private fun Element.children(tag: String): List<Element> =
    (0 until childNodes.length).mapNotNull { childNodes.item(it) as? Element }.filter { it.tagName == tag }

/** The manifest half: the share filters, then any direct share targets the activities name. */
internal val removeShareTargetsManifestPatch = resourcePatch {
    execute {
        val shortcuts = document("AndroidManifest.xml").use { removeShareFilters(it).second }
        shortcuts.forEach { path -> document(path).use { removeShareTargets(it) } }
    }
}

/**
 * Takes Threads out of the share sheet other apps open.
 *
 * Threads 448 to 450 take shares in one activity, BarcelonaShareHandlerActivity, through two intent
 * filters: text, and photos and videos. They declare no shortcuts file, so there are no direct share
 * targets to take out today; one a later build names goes too. The activity stays, so anything in
 * Threads that opens it by name still can.
 */
@Suppress("unused")
val removeShareTargetsPatch = bytecodePatch(
    name = "Remove share targets",
    description = "Takes Threads out of the share sheet other apps open, so it isn't offered when you share a " +
        "link, a photo or a video from somewhere else. It does that by removing the share entries from Threads' " +
        "manifest, along with any contacts Threads offers there for direct sharing. Sharing from Threads to " +
        "other apps still works.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, threadsExtensionPatch, removeShareTargetsManifestPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        enableStatus("removeShareTargets")
    }
}

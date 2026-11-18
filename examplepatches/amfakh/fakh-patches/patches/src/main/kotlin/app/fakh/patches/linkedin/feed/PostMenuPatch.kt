package app.fakh.patches.linkedin.feed

import app.fakh.patches.linkedin.shared.markIncluded
import app.fakh.patches.linkedin.shared.sduiComponentFilterPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch

/**
 * Declares the invisible activity that opens the fakhpatches://post/... links of the items added to a post's ⋯ menu.
 * LinkedIn opens them with an implicit ACTION_VIEW intent, so it is exported.
 */
private val postActionManifestPatch = patch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0)
            val activity = document.createElement("activity")
            activity.setAttribute("android:name", "app.fakh.extension.linkedin.PostActionActivity")
            activity.setAttribute("android:exported", "true")
            activity.setAttribute("android:excludeFromRecents", "true")
            activity.setAttribute("android:noHistory", "true")
            activity.setAttribute("android:taskAffinity", "")
            activity.setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
            val filter = document.createElement("intent-filter")
            listOf("action" to "android.intent.action.VIEW", "category" to "android.intent.category.DEFAULT").forEach { (tag, name) ->
                filter.appendChild(document.createElement(tag).apply { setAttribute("android:name", name) })
            }
            filter.appendChild(document.createElement("data").apply {
                setAttribute("android:scheme", "fakhpatches")
                setAttribute("android:host", "post")
            })
            activity.appendChild(filter)
            application.appendChild(activity)
        }
    }
}

/**
 * DocumentSingleViewData(properties, playerId, DocumentAsset, Source, navigablePages, isFullScreenMode, ...),
 * the document (PDF or carousel) player. Later parameters change between versions, so only these are matched.
 */
internal object DocumentPlayerFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/sdui/viewdata/document/DocumentSingleViewData;",
    name = "<init>",
    custom = { method, _ ->
        val types = method.parameterTypes.map { it.toString() }
        types.size >= 6 &&
            types[2] == "Lproto/sdui/components/core/document/DocumentAsset;" &&
            types[3] == "Lcom/linkedin/android/documentviewer/compose/source/Source;" &&
            types[4] == "I" && types[5] == "Z"
    },
)

/**
 * The shared hooks of the items added to the ⋯ menus (Copy text, Download media): the menu is edited and the posts and
 * comments are remembered in the SDUI component hook, and the invisible activity runs the items.
 */
val postMenuPatch = patch {
    dependsOn(sduiComponentFilterPatch, postActionManifestPatch)

    execute {
        markIncluded("isPostMenuIncluded")
    }
}

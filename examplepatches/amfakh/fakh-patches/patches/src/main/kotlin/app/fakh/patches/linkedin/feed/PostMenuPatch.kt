package app.fakh.patches.linkedin.feed

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.markIncluded
import app.fakh.patches.linkedin.shared.sduiComponentFilterPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
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
private object DocumentPlayerFingerprint : Fingerprint(
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

@Suppress("unused")
val postMenuPatch = patch(
    name = "Post menu items",
    description = "Adds Copy text, Download photos and videos, and Save document as PDF to the ⋯ menu of posts. " +
        "Adds a switch in Fakh Patches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feed")

    // The menu is edited and the posts are remembered in the SDUI component hook.
    dependsOn(sduiComponentFilterPatch, postActionManifestPatch)

    execute {
        markIncluded("isPostMenuIncluded")

        // p3 = DocumentAsset, p4 = Source, p5 = navigablePages, p6 = isFullScreenMode. A static call before the
        // super constructor is allowed, as long as it doesn't touch p0.
        DocumentPlayerFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p3 .. p6 }, $EXTENSION_PACKAGE/DocumentPdf;->onDocument(Ljava/lang/Object;Ljava/lang/Object;IZ)V"
        )
    }
}

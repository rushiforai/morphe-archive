package dev.jibon.notes.patches.compat

import app.morphe.patcher.patch.resourcePatch
import dev.jibon.notes.patches.shared.Constants.COMPATIBILITY_NOTES
import org.w3c.dom.Element

// Services that start themselves in the foreground through the app's ServiceManager, with the
// two-argument startForeground(): Android 14+ throws unless the manifest declares a type.
private val FOREGROUND_SERVICES = setOf(
    "com.samsung.android.app.notes.popupnote.PopupNoteService",
    "com.samsung.android.app.notes.screenoffmemo.ScreenOffMemoService",
    "com.samsung.android.support.senl.nt.coedit.service.CoeditService",
    "com.samsung.android.support.senl.nt.model.collector.CollectService",
    "com.samsung.android.support.senl.nt.model.service.NotesWordDocumentService",
)

internal fun Element.elements(tag: String): List<Element> {
    val nodes = getElementsByTagName(tag)
    return (0 until nodes.length).map { nodes.item(it) as Element }
}

@Suppress("unused")
val manifestCompatPatch = resourcePatch(
    name = "Manifest compatibility",
    description = "Makes One UI-only libraries optional (otherwise the install fails), gives foreground " +
        "services a type (Android 14+ crashes without one) and drops multiArch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NOTES)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            // One UI-only shared libraries: required="true" makes the install fail on other ROMs.
            listOf("uses-library", "uses-native-library").forEach { tag ->
                manifest.elements(tag).forEach { it.setAttribute("android:required", "false") }
            }
            manifest.elements("service").forEach { service ->
                val name = service.getAttribute("android:name")
                if (name in FOREGROUND_SERVICES && !service.hasAttribute("android:foregroundServiceType")) {
                    service.setAttribute("android:foregroundServiceType", "dataSync")
                }
            }
            // Only arm64 libraries are kept; with multiArch a device with 32-bit ABIs rejects the install.
            manifest.elements("application").forEach { it.removeAttribute("android:multiArch") }
        }
    }
}

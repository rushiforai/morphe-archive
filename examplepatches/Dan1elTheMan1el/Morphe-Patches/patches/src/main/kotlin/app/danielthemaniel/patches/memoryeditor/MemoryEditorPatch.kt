package app.danielthemaniel.patches.memoryeditor

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// =====================================================================================
// Memory editor (universal) — an iGameGod / GameGuardian-style in-app memory editor.
//
// No compatibleWith(): applies to any APK. Two halves:
//   BYTECODE: merges extensions/memoryeditor.dex (pure Java, so no per-ABI .so to ship).
//   RESOURCE: registers MemoryEditorProvider in the manifest. Providers are created right
//             after the Application object, so the editor boots in any app without hooking
//             app-specific code.
//
// At runtime the extension reads/writes the app's own memory through /proc/self/mem (no
// root), and shows a draggable "M" bubble on every activity. Tapping it opens the panel:
// first scan / refine (equal, changed, increased, …), result list, edit, save, freeze.
// =====================================================================================

private const val PROVIDER =
    "app.danielthemaniel.patches.memoryeditor.extension.MemoryEditorProvider"

private val memoryEditorExtensionPatch = bytecodePatch {
    extendWith("extensions/memoryeditor.dex")

    execute { }
}

@Suppress("unused")
val memoryEditorPatch = resourcePatch(
    name = "Memory editor",
    description = "Adds a floating in-app memory editor (like iGameGod / GameGuardian): scan for " +
        "a value, refine by changed/unchanged/increased/decreased, edit results live, and save or " +
        "freeze addresses. Works on any app without root. Server-side values can't be changed.",
    default = false,
) {
    dependsOn(memoryEditorExtensionPatch)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val packageName = manifest.getAttribute("package")
            val application = document.getElementsByTagName("application").item(0) as Element

            val providers = document.getElementsByTagName("provider")
            val alreadyAdded = (0 until providers.length)
                .mapNotNull { providers.item(it) as? Element }
                .any { it.getAttribute("android:name") == PROVIDER }
            if (alreadyAdded) return@use

            application.appendChild(
                document.createElement("provider").apply {
                    setAttribute("android:name", PROVIDER)
                    setAttribute("android:authorities", "$packageName.danielthemaniel.memoryeditor")
                    setAttribute("android:exported", "false")
                },
            )
        }
    }
}

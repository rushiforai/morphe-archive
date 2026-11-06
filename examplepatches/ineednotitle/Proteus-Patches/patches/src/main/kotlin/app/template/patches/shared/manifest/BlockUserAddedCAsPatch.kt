package app.template.patches.shared.manifest

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.forEachManifestElement
import app.template.patches.shared.logUniversal
import app.template.patches.shared.removeManifestElements

// Universal "Block user-added CAs" patch: if the app declares its own
// android:networkSecurityConfig, removes every <certificates src="user"/>
// element from the referenced res/xml. No config -> no-op (Android already
// ignores user CAs by default for API 24+). Fail-safe; default = false.
// Single-pass DOM traversal for both documents.

@Suppress("unused")
val blockUserAddedCAsPatch = resourcePatch(
    name = "Block user-added certificate authorities",
    description = """
        Removes user-added certificate authorities from the app's network security
        config (if it declares one), so the app does not trust certificates installed
        on the device.

        Applies to any app. No effect if the app has no network security config.
    """.trimIndent(),
    default = false,
) {
    execute {
        document("AndroidManifest.xml").use { doc ->
            var nsc: String? = null
            doc.forEachManifestElement("application") { application ->
                if (nsc == null) nsc = application.getAttribute("android:networkSecurityConfig")
            }
            val config = nsc
            if (config.isNullOrEmpty() || !config.startsWith("@xml/")) {
                logUniversal("Block user-added CAs: no app network security config — nothing to do.")
                return@use
            }

            val path = "res/xml/" + config.removePrefix("@xml/") + ".xml"
            try {
                document(path).use { nscDoc ->
                    val removed = nscDoc.removeManifestElements("certificates") { element ->
                        element.getAttribute("src") == "user"
                    }
                    logUniversal(
                        "Block user-added CAs: removed ${removed.size} user-CA entr(ies) from $path.",
                    )
                }
            } catch (e: Exception) {
                logUniversal(
                    "Block user-added CAs: could not read $path (${e.message}) — left stock.",
                )
            }
        }
    }
}

package app.template.patches.shared.manifest

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.forEachManifestElement
import app.template.patches.shared.logUniversal

// Universal "Block cleartext traffic" patch: sets
// android:usesCleartextTraffic="false" on <application>. Default = false
// (breaks apps with legacy HTTP endpoints). Single-pass DOM traversal.

@Suppress("unused")
val blockCleartextTrafficPatch = resourcePatch(
    name = "Block cleartext (HTTP) traffic",
    description = """
        Sets android:usesCleartextTraffic="false" so the app cannot send plaintext
        HTTP requests. Breaks apps that still use legacy HTTP endpoints.

        Applies to any app.
    """.trimIndent(),
    default = false,
) {
    execute {
        document("AndroidManifest.xml").use { doc ->
            var patched = 0
            doc.forEachManifestElement("application") { application ->
                if (application.getAttribute("android:usesCleartextTraffic") != "false") {
                    application.setAttribute("android:usesCleartextTraffic", "false")
                    patched++
                }
            }
            if (patched > 0) {
                logUniversal("Block cleartext: android:usesCleartextTraffic set to false on $patched application(s).")
            }
        }
    }
}

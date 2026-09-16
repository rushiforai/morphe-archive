package app.template.patches.googlephone

import app.morphe.patcher.annotation.Patch
import app.morphe.patcher.patch.ManifestPatch
import app.morphe.patcher.patch.annotation.PatchDescription

@Patch(
    name = "Remove Dialer Support Library",
    description = "Removes the com.google.android.dialer.support library requirement to allow installation on non-Pixel devices.",
    target = "com.google.android.dialer"
)
class RemoveDialerSupportLibraryPatch : ManifestPatch() {
    override fun execute(manifest: ManifestContext) {
        // Find and remove the specific <uses-library> tag from the AndroidManifest.xml
        manifest.document.select("uses-library[android:name=com.google.android.dialer.support]").forEach { element ->
            element.remove()
        }
    }
}

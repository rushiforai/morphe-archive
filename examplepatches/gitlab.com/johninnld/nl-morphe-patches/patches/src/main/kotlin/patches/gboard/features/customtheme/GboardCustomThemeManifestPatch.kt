package patches.gboard.features.customtheme

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import patches.gboard.shared.ensureManifestUsesPermission
import patches.gboard.Constants.COMPATIBILITY_GBOARD

internal val gboardCustomThemeManifestPatch = resourcePatch(
    description = "Add the network permission needed for Custom Theme on-demand downloads."
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    finalize { ensureCustomThemeNetworkPermission() }
}

context(context: ResourcePatchContext)
private fun ensureCustomThemeNetworkPermission() = with(context) {
    document("AndroidManifest.xml").use { document ->
        ensureManifestUsesPermission(document, document.documentElement, "android.permission.INTERNET")
    }
}

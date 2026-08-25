package io.github.liongalahad.stremio.patches.identity

import app.morphe.patcher.patch.resourcePatch
import io.github.liongalahad.stremio.patches.shared.Constants.STREMIO_COMPATIBILITY

@Suppress("unused")
val sideBySideInstallationPatch = resourcePatch(
    name = "Side-by-side installation",
    description = "Installs the patched app separately as Stremio Morphe instead of replacing official Stremio.",
    default = true
) {
    compatibleWith(STREMIO_COMPATIBILITY)

    finalize {
        document("AndroidManifest.xml").use(SideBySideManifest::transform)
    }
}

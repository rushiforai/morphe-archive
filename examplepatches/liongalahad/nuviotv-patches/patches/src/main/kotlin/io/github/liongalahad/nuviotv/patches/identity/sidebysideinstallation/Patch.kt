package io.github.liongalahad.nuviotv.patches.identity.sidebysideinstallation

import app.morphe.patcher.patch.resourcePatch
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY
import io.github.liongalahad.nuviotv.patches.shared.updates.patchedAppUpdatesPatch

@Suppress("unused")
val sideBySideInstallationPatch = resourcePatch(
    name = "Side-by-side installation",
    description = "Installs the patched app separately as Nuvio Morphe instead of replacing NuvioTV.",
    default = true,
) {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(patchedAppUpdatesPatch)

    // This must run after every selected resource patch has registered its providers.
    finalize {
        document("AndroidManifest.xml").use(SideBySideManifest::transform)
    }
}

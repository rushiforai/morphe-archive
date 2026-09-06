package io.github.liongalahad.nuviotv.patches.shared.updates

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY

private val patchedAppUpdateResourcesPatch = resourcePatch {
    compatibleWith(NUVIO_COMPATIBILITY)
    execute {
        document("AndroidManifest.xml").use(PatchedAppUpdateManifest::removeInstallPermission)
    }
}

/**
 * Mandatory infrastructure dependency for every public Nuvio patch.
 *
 * Patched APKs cannot safely install an official in-app update over their different signature and
 * modified package. Keep the update implementation unreachable without changing Nuvio's shared
 * full-build feature-policy flag, which also controls unrelated features.
 */
internal val patchedAppUpdatesPatch = bytecodePatch {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(patchedAppUpdateResourcesPatch)

    execute {
        listOf(
            UpdateViewModelConstructorFingerprint,
            CheckForUpdatesFingerprint,
            AboutUpdateControlsFingerprint
        ).forEach { it.matchAll(1..1) }

        // Covers the automatic constructor check and the About page's forced manual check.
        CheckForUpdatesFingerprint.method.addInstructions(0, "return-void")

        // Return before this dedicated Composable opens a group. Its caller still owns the
        // balanced surrounding group and continues with Privacy and the remaining About rows.
        AboutUpdateControlsFingerprint.method.addInstructions(0, "return-void")
    }
}

package app.aidan.patches.sidelineswap.shared

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.patch.PatchException

/** SidelineSwap 2.3.2 — Compose rewrite with R8-repackaged classes. */
internal const val SIDELINESWAP_2_3_2 = "2.3.2"

/**
 * Verifies that the artifact being patched is the Compose rewrite this bundle's anchors
 * were resolved against.
 *
 * 2.3.2 repackages every application class into the default package, so the descriptors
 * below are build-specific. An unrecognized version fails fast instead of applying
 * another build's anchors.
 */
internal fun PackageMetadata.requireSidelineSwapCompose() {
    if (versionName != SIDELINESWAP_2_3_2) {
        throw PatchException(
            "No verified targets for SidelineSwap $versionName; supported versions: $SIDELINESWAP_2_3_2"
        )
    }
}

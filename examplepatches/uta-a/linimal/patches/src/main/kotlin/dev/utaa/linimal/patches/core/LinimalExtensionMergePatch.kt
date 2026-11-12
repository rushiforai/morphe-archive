package dev.utaa.linimal.patches.core

import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.patchStatusCollector

/** Linimal runtime extension の DEX を対象 APK に統合します。 */
val linimalExtensionMergePatch = bytecodePatch(
    name = "Linimal extension",
    description = "Linimal の実行時 extension を対象 APK へ統合します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(linimalManifestComponentRegistrationPatch)
    extendWith("extensions/linimal.mpe")

    execute {
        patchStatusCollector.record(
            patchId = PatchId.EXTENSION_MERGE,
            expectedTargetCount = 0,
            actualTargetCount = 0,
            reason = "ExtensionMergeCompleted",
        )
    }
}

package dev.utaa.linimal.patches.core

import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.patchStatusResourcePatch

/** MPE の manifest が自動では merge されないため、必要な component を明示的に登録します。 */
val linimalManifestComponentRegistrationPatch = resourcePatch(
    name = "Linimal settings component",
    description = "Linimal の設定画面を AndroidManifest へ component として登録します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(patchStatusResourcePatch)

    execute {
        try {
            document("AndroidManifest.xml").use(LinimalManifestComponentRegistration::register)
        } catch (error: Exception) {
            throw PatchException("Cannot safely register Linimal Settings Activity.", error)
        }

        patchStatusCollector.record(
            patchId = PatchId.COMPONENT_REGISTRATION,
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "SettingsActivityRegistered",
        )
    }
}

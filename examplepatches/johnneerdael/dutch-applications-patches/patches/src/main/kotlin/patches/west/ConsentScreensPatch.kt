package patches.west

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val skipConsentScreens = bytecodePatch(
    name = "Skip consent screens",
    description = "Includes ad and tracking controls. Skips automatic cookie and player consent and notification permission prompts; hides cookie settings in both menus. Preserves real choices, native continuation, manual notification settings, push and user-selected embed privacy gates.",
) {
    dependsOn(originalInput, originalCode, disableTracking, consentResources)
    compatibleWith(west)
    execute {
        applyConsentHelpers()
        applyOwnedEdits(consentTargets)
    }
}

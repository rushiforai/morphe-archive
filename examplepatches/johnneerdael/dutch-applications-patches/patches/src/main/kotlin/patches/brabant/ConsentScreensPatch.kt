package patches.brabant

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val skipConsentScreens = bytecodePatch(name = "Skip consent screens", description = "Includes ad and tracking controls. Prevents startup notification permission requests and cookie dialog creation; removes Cookie instellingen from the menu before display. Preserves stored choices, player completion, manual notification settings and push services.") {
    dependsOn(originalInput, disableTracking, consentResources)
    compatibleWith(brabant)
    execute { applyOwnedEdits(consentTargets) }
}

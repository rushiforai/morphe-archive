package patches.ftm

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val skipConsentScreens = bytecodePatch(name = "Skip consent screens", description = "Skips the post-edition account offer as a guest and hides the cookie notice while blocking known collectors; keeps edition selection, manual login and existing consent values.") {
    compatibleWith(ftm)
    dependsOn(originalInput, disableTracking, webContent)
    execute { enable("Consent") }
}

package patches.ftm

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hidePremiumBanner = bytecodePatch(name = "Hide Premium banner", description = "Suppresses article decision modals and evidenced automatic trial promotions and stickybar while preserving manual membership links and editorial content.") {
    compatibleWith(ftm)
    dependsOn(originalInput, webContent, articleDecision)
    execute { enable("Premium") }
}

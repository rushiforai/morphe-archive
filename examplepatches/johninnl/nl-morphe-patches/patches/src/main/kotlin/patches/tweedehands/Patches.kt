package patches.tweedehands

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import patches.marktplaats.addInstructions
import patches.marktplaats.exact
import patches.marktplaats.suppressAdSlots
import patches.marktplaats.suppressAdRequests
import patches.marktplaats.suppressCoreMeasurement
import patches.marktplaats.suppressMarketingMeasurement
import patches.marktplaats.suppressFirebaseMeasurement
import patches.marktplaats.suppressPersistedMeasurement
import patches.marktplaats.suppressRemainingSdkEntries
import patches.marktplaats.suppressTrackingResources

private val trackingResources = resourcePatch {
    dependsOn(originalInput, originalFeature)
    execute {
        suppressTrackingResources()
        suppressBelgianTrackingResources()
    }
}

@Suppress("unused")
val hideAds = bytecodePatch(
    name = "Hide ads",
    description = "Removes display/native ads, paid seller placements, promotional search cards and advertising measurements.",
) {
    dependsOn(originalInput, firebaseCompatibility)
    compatibleWith(tweedehands)
    execute {
        suppressAdSlots(removePaidPlacements = true)
        suppressAdRequests()
        exact("Lc37;", "c()V", 0, 0, 0).addInstructions(0, "return-void")
        exact("Lc37;", "d()V", 0, 0, 0).addInstructions(0, "return-void")
        exact("Lc1c;", "a(Landroid/content/Context;)V", 0, 0, 0).addInstructions(0, "return-void")
    }
}

@Suppress("unused")
val disableThreatMetrix = bytecodePatch(
    name = "Disable ThreatMetrix",
    description = "Stops device/security profiling and its session headers.",
) {
    dependsOn(originalInput, firebaseCompatibility)
    compatibleWith(tweedehands)
    execute {
        val wrapper = "Lcom/horizon/android/core/networking/threatmetrix/a;"
        exact(wrapper, "d(${wrapper}Lcom/horizon/android/HorizonApplication;)V", 0, 0, 0)
            .addInstructions(0, "return-void")
        exact(wrapper, "e()Z", 0, 0, 0).addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}

@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Stops optional analytics, marketing, Gemius/CIM and device profiling.",
) {
    dependsOn(originalInput, hideAds, disableThreatMetrix, trackingResources)
    compatibleWith(tweedehands)
    execute {
        suppressCoreMeasurement()
        suppressMarketingMeasurement()
        suppressFirebaseMeasurement()
        suppressPersistedMeasurement()
        suppressRemainingSdkEntries()
        suppressGemius()
        suppressConsentMeasurement()
        suppressPublisherMeasurement()
        suppressFirebaseHeartbeats()
    }
}

@Suppress("unused")
val skipConsentScreens = bytecodePatch(
    name = "Skip consent screens",
    description = "Hides startup and manual privacy forms and requests genuine reject-all consent.",
) {
    dependsOn(originalInput, disableTracking)
    compatibleWith(tweedehands)
    execute {
        suppressConsentForms()
        suppressConsentRendering()
    }
}

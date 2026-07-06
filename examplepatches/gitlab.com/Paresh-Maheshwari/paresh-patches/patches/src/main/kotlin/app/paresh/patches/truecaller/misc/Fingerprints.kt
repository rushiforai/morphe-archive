package app.paresh.patches.truecaller.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

// Finds ti1/g (InAppUpdateManagerImpl) via constructor parameter name
object InAppUpdateManagerClassFingerprint : Fingerprint(
    strings = listOf("playAppUpdateManager", "configsInventory")
)

// Targets ti1/g.d(UpdateTrigger)Z — shouldTriggerUpdate check
object ShouldTriggerUpdateFingerprint : Fingerprint(
    classFingerprint = InAppUpdateManagerClassFingerprint,
    returnType = "Z",
    parameters = listOf("Lcom/truecaller/inappupdate/UpdateTrigger;"),
)

// Targets AppStartTracker.enableTracking() — prevents telemetry from activating
object AppStartTrackerFingerprint : Fingerprint(
    definingClass = "Lcom/truecaller/analytics/technical/AppStartTracker;",
    name = "enableTracking",
    returnType = "V",
)

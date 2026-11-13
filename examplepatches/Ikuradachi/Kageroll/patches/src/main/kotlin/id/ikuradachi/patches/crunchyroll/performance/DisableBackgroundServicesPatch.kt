package id.ikuradachi.patches.crunchyroll.performance

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

@Suppress("unused")
val disableBackgroundServicesPatch = bytecodePatch(
    name = "Disable background services",
    description = "Disables background broadcast receivers, schedulers, widget polling, Firebase session service binding, and DataTransport JobScheduler tasks to eliminate background wakeups and idle battery drain.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)

    execute {
        // Target 1: Google Engage continuation broadcast receiver
        GoogleEngageBroadcastReceiverFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")

        // Target 2: Google Engage background task publisher scheduler
        GoogleEngagePublisherFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")

        // Target 3: Continue Watching Glance widget receiver onEnabled
        ContinueWatchingWidgetReceiverOnEnabledFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")

        // Target 4: Continue Watching 30-minute recurring PeriodicWorkRequest scheduler
        ContinueWatchingPeriodicSchedulerFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")

        // Target 5: Firebase SessionLifecycleService background binder
        FirebaseSessionServiceBinderFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")

        // Target 6: Google DataTransport JobScheduler upload dispatcher
        DataTransportJobInfoSchedulerFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")
    }
}

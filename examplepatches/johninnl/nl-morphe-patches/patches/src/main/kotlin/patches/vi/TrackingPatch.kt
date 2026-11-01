package patches.vi

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Disables audited analytics, profiling, advertising identifiers and known stored telemetry uploads. Preserves account authentication, push infrastructure and native media playback.",
) {
    dependsOn(hideAds, trackingResources, analyticsPlayerResources)
    compatibleWith(vi)
    execute {
        measurementRequestFilter()
        applyOwnedEdits(trackingTargets)
    }
}

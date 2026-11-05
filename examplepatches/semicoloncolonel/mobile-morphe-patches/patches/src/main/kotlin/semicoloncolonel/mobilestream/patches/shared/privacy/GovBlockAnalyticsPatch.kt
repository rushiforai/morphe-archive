package semicoloncolonel.mobilestream.patches.shared.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.GOV_APPS

// NPS, MyTSA, FEMA, and National Forests & Grasslands all send Firebase
// Analytics, and NPS also sends Mapbox's map usage events. Collection is
// switched off in the manifest, and the shared host blocklist covers the
// uploads. Crashlytics, maps, alerts, and every app feature are left alone.

@Suppress("unused")
val govBlockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Firebase Analytics, and on NPS, Mapbox's map usage reports.",
    default = false,
) {
    compatibleWith(*GOV_APPS)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}

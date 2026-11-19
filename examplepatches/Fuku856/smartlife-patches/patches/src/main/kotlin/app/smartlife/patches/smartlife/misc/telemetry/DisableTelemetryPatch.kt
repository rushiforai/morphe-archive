package app.smartlife.patches.smartlife.misc.telemetry

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.smartlife.patches.smartlife.shared.Constants.COMPATIBILITY_SMARTLIFE
import app.smartlife.patches.smartlife.shared.config.configOverridePatch
import app.smartlife.patches.smartlife.shared.config.forceConfigBoolean
import app.smartlife.patches.smartlife.shared.MODULE_APP_JSON
import app.smartlife.patches.smartlife.shared.editAssetJson
import app.smartlife.patches.smartlife.shared.removeAttributionPipeline
import app.smartlife.patches.smartlife.shared.setBoolResources
import app.smartlife.patches.smartlife.shared.warnIfMissing

@Suppress("unused")
val disableTelemetryPatch = resourcePatch(
    name = "Disable telemetry",
    description = "Disables Firebase Analytics/Crashlytics and automatic page tracking, " +
        "and stops the app's analytics, log-upload and attribution subsystems from starting.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE)

    // The app reads these flags from ThingNGConfig fields (bools.xml is only a fallback default),
    // so they are also forced at the flag getter.
    dependsOn(configOverridePatch)

    val disableFirebase = booleanOption(
        key = "disableFirebase",
        default = true,
        title = "Disable Firebase",
        description = "Turns off Firebase Analytics and Crashlytics.",
    )

    val disablePageTracking = booleanOption(
        key = "disablePageTracking",
        default = true,
        title = "Disable page tracking",
        description = "Turns off automatic page/event tracking.",
    )

    val stopTrackingSubsystems = booleanOption(
        key = "stopTrackingSubsystems",
        default = true,
        title = "Stop tracking subsystems",
        description = "Removes the analytics, log-upload, API event, page tracking and " +
            "AppsFlyer attribution startup pipelines so they never start.",
    )

    execute {
        val flags = linkedMapOf<String, Boolean>()

        if (disableFirebase.value ?: true) {
            flags["firebase_analytics_enable"] = false
            flags["firebase_crash_enable"] = false
        }
        if (disablePageTracking.value ?: true) {
            flags["is_open_page_auto_track"] = false
        }

        flags.forEach { (key, value) -> forceConfigBoolean(key, value) }
        if (stopTrackingSubsystems.value ?: true) {
            val pipelines = listOf(
                "com.thingclips.smart.stat.StatPipeLine",
                "com.thingclips.smart.stat.StatUploadInitPipeline",
                "com.thingclips.smart.logupload.LogUploadPipeLine",
                "com.thingclips.smart.logupload.AppStartPipeLine",
                "com.thingclips.smart.apievent.ApiEventPipleLine",
                "com.thingclips.smart.auto.page.track.AutoPageTrackerPipeLine",
                "com.thing.trackcontrol.TrackFilterInitPipeline",
                "com.thingclips.smart.message.stat.NotifyPermissionStatPipeLine",
            )
            editAssetJson("Disable telemetry", MODULE_APP_JSON) { root ->
                val removed = root.removeArrayElements(pipelines.toSet())
                warnIfMissing("Disable telemetry", "module_app.json pipelines", pipelines, removed)
                // Attribution is tracking too, so it is stopped here even when ads are kept.
                removeAttributionPipeline("Disable telemetry", root) || removed.isNotEmpty()
            }
        }

        warnIfMissing("Disable telemetry", "bools.xml flags", flags.keys, setBoolResources(flags))
    }
}

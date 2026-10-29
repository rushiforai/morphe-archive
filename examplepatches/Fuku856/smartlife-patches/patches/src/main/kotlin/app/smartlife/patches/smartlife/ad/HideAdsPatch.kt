package app.smartlife.patches.smartlife.ad

import app.morphe.patcher.patch.resourcePatch
import app.smartlife.patches.smartlife.shared.Constants.COMPATIBILITY_SMARTLIFE
import app.smartlife.patches.smartlife.shared.removeModuleAppPipelines
import app.smartlife.patches.smartlife.shared.setBoolResources
import java.util.logging.Logger

@Suppress("unused")
val hideAdsPatch = resourcePatch(
    name = "Hide ads",
    description = "Disables in-app ads: AdMob/PID banners and the Tuya marketing ad service. " +
        "Works by turning off the app's own advertising feature flags.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE)

    execute {
        val flags = linkedMapOf(
            "is_admob_support" to false,
            "is_admob_banner_badge_enabled" to false,
            "is_marketing_advertising_support" to false,
        )

        // Also stop the ad subsystems from starting at all (module_app.json pipelines).
        removeModuleAppPipelines(
            listOf(
                "com.thingclips.smart.advertisement.AdvertisementManagerPipeline",
                "com.thingclips.smart.advertisement.AdvertisementManagerLoginPipeline",
                "com.thingclips.smart.advertisement.AdvertisementManagerLogoutPipeline",
                "com.thingclips.smart.advertisement.pid.pipeline.PidAdvertisePipeline",
                "com.thingclips.smart.advertisement.pid.pipeline.PidAdvertiseLoginPipeline",
                "com.thingclips.smart.advertisement.pid.pipeline.PidAdvertiseLogoutPipeline",
                "com.thingclips.smart.advertisement.admob.lifecycle.AdMobManagerLogoutPipeline",
                "com.thingclips.smart.activitypush.api.ActivityAdPushManagerPipeline",
            )
        )

        val changed = setBoolResources(flags)
        val missing = flags.keys - changed
        if (missing.isNotEmpty()) {
            Logger.getLogger(this::class.java.name).warning(
                "Hide ads: these flags were not found in bools.xml " +
                    "(app version may differ): $missing"
            )
        }
    }
}

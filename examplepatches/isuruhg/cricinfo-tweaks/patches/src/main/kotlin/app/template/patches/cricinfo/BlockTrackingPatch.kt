package app.template.patches.cricinfo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_CRICINFO

/**
 * Each analytics/telemetry SDK is wired through its own androidx.startup Initializer
 * under com.cricinfo.app.android.initializers (non-obfuscated). create(Context) returns
 * Boolean.TRUE and is the one place the SDK is configured and started. Returning
 * Boolean.TRUE immediately makes androidx Startup believe initialization succeeded
 * while the SDK never starts, so nothing is collected or transmitted.
 *
 * Deliberately NOT touched here:
 *  - CiAppInitializerCleverTap: besides analytics, its create() also registers the
 *    app's notification channels (Live Scores, Wicket, Toss, Breaking News, ...) and
 *    backs push delivery. Killing it would break the app's core push-notification
 *    feature, so CleverTap is left intact. (Ask if you want it disabled anyway.)
 *  - Firebase/Crashlytics/Conviva-video-playback remain functional except where the
 *    initializer below disables a pure-telemetry SDK.
 */
@Suppress("unused")
val blockTrackingPatch = bytecodePatch(
    name = "Block tracking & telemetry",
    description = "Stops AppsFlyer, comScore, Conviva and Adobe Marketing from " +
        "initializing, so they collect or send no attribution/analytics data. " +
        "Leaves CleverTap intact to preserve push notifications.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRICINFO)

    execute {
        val returnTrue = """
            sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            return-object v0
        """

        for (initializer in listOf(
            "Lcom/cricinfo/app/android/initializers/CiAppInitializerAppsFlyer;",
            "Lcom/cricinfo/app/android/initializers/CiAppInitializerComscore;",
            "Lcom/cricinfo/app/android/initializers/CiAppInitializerConviva;",
            "Lcom/cricinfo/app/android/initializers/CiAppInitializerAdobeMarketing;",
        )) {
            mutableClassDefByOrNull(initializer)
                ?.methods
                ?.filter { it.name == "create" }
                ?.forEach { it.addInstructions(0, returnTrue) }
        }
    }
}

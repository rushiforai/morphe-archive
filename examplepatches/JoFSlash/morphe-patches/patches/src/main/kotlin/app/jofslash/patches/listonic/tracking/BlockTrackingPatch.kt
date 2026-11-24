package app.jofslash.patches.listonic.tracking

import app.jofslash.patches.listonic.shared.Constants.COMPATIBILITY_LISTONIC
import app.jofslash.patches.listonic.shared.editManifest
import app.jofslash.patches.listonic.shared.methodOf
import app.jofslash.patches.listonic.shared.methodsOf
import app.jofslash.patches.listonic.shared.returnEarly
import app.jofslash.patches.listonic.shared.setApplicationMetaData
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

private const val AD_SHIFT_MANAGER = "Lcom/l/utils/ads/AdShiftManager;"
private const val TIKTOK_REPORTER = "Lcom/l/utils/ads/TikTokReporterImpl;"
private const val CLARITY = "Lcom/microsoft/clarity/Clarity;"
private const val GEMIUS_AUDIENCE = "Lcom/gemius/sdk/audience"

private val blockTrackingResourcePatch = resourcePatch {
    execute {
        editManifest { document ->
            // Firebase Analytics, Crashlytics, Performance and Sessions ship on; turn them off.
            document.setApplicationMetaData("firebase_analytics_collection_deactivated", "true")
            document.setApplicationMetaData("firebase_analytics_collection_enabled", "false")
            document.setApplicationMetaData("google_analytics_adid_collection_enabled", "false")
            document.setApplicationMetaData("google_analytics_default_allow_analytics_storage", "false")
            document.setApplicationMetaData("google_analytics_default_allow_ad_storage", "false")
            document.setApplicationMetaData("google_analytics_default_allow_ad_user_data", "false")
            document.setApplicationMetaData("google_analytics_default_allow_ad_personalization_signals", "false")
            document.setApplicationMetaData("firebase_crashlytics_collection_enabled", "false")
            document.setApplicationMetaData("firebase_performance_collection_deactivated", "true")
            document.setApplicationMetaData("firebase_sessions_enabled", "false")
            // The Facebook SDK (kept for Facebook sign-in) logs app events and the advertising ID on
            // its own unless told not to.
            document.setApplicationMetaData("com.facebook.sdk.AutoLogAppEventsEnabled", "false")
            document.setApplicationMetaData("com.facebook.sdk.AdvertiserIDCollectionEnabled", "false")
        }
    }
}

@Suppress("unused")
val blockTrackingPatch = bytecodePatch(
    name = "Block tracking",
    description = "Stops the trackers: AdShift install attribution, TikTok event reporting, Gemius audience " +
            "measurement, Microsoft Clarity session recording, Firebase Analytics, Crashlytics and " +
            "Performance, and Facebook's automatic app events. Your lists, sync and sign-in aren't touched.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_LISTONIC)

    dependsOn(blockTrackingResourcePatch)

    execute {
        // AdShift (install attribution): initialize() registers the SDK with every consent set to
        // "granted", start() starts sending. Never started, it sends nothing.
        methodOf(AD_SHIFT_MANAGER, "initialize").returnEarly()
        methodOf(AD_SHIFT_MANAGER, "start").returnEarly()

        // TikTok Business SDK: start(limitedDataUse) initializes it, track(event) sends events.
        methodOf(TIKTOK_REPORTER, "start", listOf("Z")).returnEarly()
        methodOf(TIKTOK_REPORTER, "track").returnEarly()

        // Gemius audience measurement (gemius.pl): the app starts it on its own at launch. Its events
        // (page views, the "Netpanel" panel) all go out through these send methods.
        methodOf("$GEMIUS_AUDIENCE/BaseEvent;", "sendEvent", emptyList()).returnEarly()
        methodOf("$GEMIUS_AUDIENCE/AudienceEvent;", "sendEvent", emptyList()).returnEarly()
        methodOf("$GEMIUS_AUDIENCE/NetpanelEvent;", "sendEvent", emptyList()).returnEarly()
        methodOf("$GEMIUS_AUDIENCE/internal/NetpanelEventManager;", "sendEvents").returnEarly()

        // Microsoft Clarity records sessions (screens and taps) when remote config turns it on. Both
        // initialize() overloads return a Boolean: answer "not started".
        methodsOf(CLARITY, "initialize").forEach {
            it.addInstructions(
                0,
                """
                    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                    return-object v0
                """
            )
        }
    }
}

package app.template.patches.onefootball.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_ONEFOOTBALL
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.misc.telemetry.forceFirebaseManifestSwitches
import com.android.tools.smali.dexlib2.AccessFlags

// Push has to keep working, so nothing here touches Firebase Messaging, Airship or firebase_core.
private const val ADJUST = "Lcom/adjust/sdk/Adjust;"
private const val ADJUST_EVENT = "Lcom/adjust/sdk/AdjustEvent;"
private const val ADJUST_DEEPLINK = "Lcom/adjust/sdk/AdjustDeeplink;"
private const val STRING = "Ljava/lang/String;"
private const val CONTEXT = "Landroid/content/Context;"

// The Adjust statics that send or schedule data. None takes a listener: every method that calls
// a listener back (getAdid, getAttribution, isEnabled, getGoogleAdId, the purchase verification
// and processAndResolveDeeplink) stays, so the app's callbacks still fire.
private val ADJUST_NO_OPS = listOf(
    "trackEvent" to listOf(ADJUST_EVENT),
    "trackAdRevenue" to listOf("Lcom/adjust/sdk/AdjustAdRevenue;"),
    "trackPlayStoreSubscription" to listOf("Lcom/adjust/sdk/AdjustPlayStoreSubscription;"),
    "trackThirdPartySharing" to listOf("Lcom/adjust/sdk/AdjustThirdPartySharing;"),
    "trackMeasurementConsent" to listOf("Z"),
    "onResume" to listOf(),
    "onPause" to listOf(),
    "setPushToken" to listOf(STRING, CONTEXT),
    "setReferrer" to listOf(STRING, CONTEXT),
    "processDeeplink" to listOf(ADJUST_DEEPLINK, CONTEXT),
    // The app's isEnabled listener (onIsEnabledRead) calls enable() again, which would undo the
    // disable() in initSdk below.
    "enable" to listOf(),
)

// The three Flutter tracking channels (Avo Inspector, XPA and the matches-stream filter). Dart
// awaits the call, so each is answered with the same Integer 0 the handler sends after tracking.
private val FLUTTER_TRACKING_HANDLERS: List<Pair<Fingerprint, String>> = listOf(
    LogEventHandleFingerprint to "logEvent",
    TrackXpaEventHandleFingerprint to "trackXpaEvent",
    TrackMatchesStreamFilterEventHandleFingerprint to "trackMatchesStreamFilterEvent",
)

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics, attribution and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_ONEFOOTBALL)

    execute {
        // 1. The app's own tracking opt-out (stock hardcoded false). With it set TrackingImpl
        // stops dispatching to the Adjust and Firebase destinations and RudderStack opts out at
        // its init. The tracking switch in the privacy screen then reads off.
        IsTrackingOptedOutFingerprint.method.returnEarly(true)

        // 2. Adjust: every sending static returns at once. initSdk stays, because without an
        // initialised SDK getAdid / getAttribution only queue their callbacks and never call
        // them back (only isEnabled has a pre-init path). Adjust.disable() runs first, so the
        // config copies startEnabled = false and the SDK starts disabled and sends nothing.
        val adjust = mutableClassDefBy(ADJUST)
        for ((name, parameters) in ADJUST_NO_OPS) {
            adjust.methods.singleOrNull {
                it.name == name && AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null &&
                    it.parameterTypes.map(CharSequence::toString) == parameters
            }?.returnEarly() ?: throw PatchException("Disable telemetry: no static $ADJUST->$name(${parameters.joinToString("")})")
        }
        adjust.methods.singleOrNull {
            it.name == "initSdk" && AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Lcom/adjust/sdk/AdjustConfig;")
        }?.addInstructionChecked(0, "invoke-static {}, $ADJUST->disable()V")
            ?: throw PatchException("Disable telemetry: no static $ADJUST->initSdk(AdjustConfig)")

        // 3. comScore: start() is never called, so the measurement never begins. configure()
        // runs earlier and only reads Analytics.getConfiguration(); the StreamingAnalytics calls
        // are wrapped in catch blocks.
        ComscoreStartFingerprint.method.returnEarly()

        // 4. Firebase Analytics, Crashlytics, Sessions and Performance, as their manifest
        // switches would set them. Messaging, Installations and firebase_core are untouched.
        forceFirebaseManifestSwitches(
            app = "OneFootball",
            analytics = true,
            crashlytics = true,
            sessions = true,
            performance = true,
        )

        // 5. The Flutter tracking channels answer success(0) on the call's own method name and
        // return; any other name still goes down the handler chain (getNext().handle). The
        // registers p1/p2 are v3/v4 (.registers 5 or more), v0/v1 are free, all 4-bit safe;
        // the checked helper throws if that changes (rule 11).
        for ((fingerprint, channelMethod) in FLUTTER_TRACKING_HANDLERS) {
            val handle: MutableMethod = fingerprint.method
            handle.addInstructionsWithLabelsChecked(
                0,
                """
                    const-string v0, "$channelMethod"
                    iget-object v1, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;
                    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :handle
                    const/4 v0, 0x0
                    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                    move-result-object v0
                    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel${'$'}Result;->success(Ljava/lang/Object;)V
                    return-void
                """,
                ExternalLabel("handle", handle.getInstruction(0)),
            )
        }

        // 6. Facebook App Events: the core logEvent returns at once, and the App Events enqueue
        // (its only caller) too as a second layer, so nothing is queued or sent. Auto-logging is
        // already off in the manifest.
        FacebookLogEventFingerprint.method.returnEarly()
        FacebookAppEventsEnqueueFingerprint.method.returnEarly()
    }
}

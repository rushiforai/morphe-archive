package io.github.xxlc.patches.grok

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode

private object InternalAnalyticsFingerprint : Fingerprint(
    definingClass = GrokNames.ANALYTICS,
    name = GrokNames.TRACK_EVENT_METHOD,
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/Double;", "Ljava/lang/String;", "Ljava/util/Map;"),
    filters = listOf(string("GrokAnalyticsImpl"), string("trackEvent: ")),
)

// The opt_out_ string is in preference reader, not in boolean getter.
private object MixpanelOptOutPreferenceFingerprint : Fingerprint(
    definingClass = GrokNames.MIXPANEL_PREFERENCES,
    name = GrokNames.MIXPANEL_READ_OPT_OUT_METHOD,
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(string("MixpanelAPI.PIdentity"), string("opt_out_")),
)

private object MixpanelOptOutFingerprint : Fingerprint(
    definingClass = GrokNames.MIXPANEL,
    name = GrokNames.MIXPANEL_OPT_OUT_METHOD,
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(methodCall(
        definingClass = GrokNames.MIXPANEL_PREFERENCES,
        name = GrokNames.MIXPANEL_READ_OPT_OUT_METHOD,
        parameters = listOf("Ljava/lang/String;"),
        returnType = "V",
    )),
)

private object HightouchEnqueueFingerprint : Fingerprint(
    definingClass = GrokNames.HIGHTOUCH,
    name = GrokNames.HIGHTOUCH_ENQUEUE_METHOD,
    isStatic = false,
    returnType = "V",
    parameters = listOf(GrokNames.ANALYTICS_PAYLOAD_BUILDER),
    filters = listOf(string("opt-out"), string("Created payload %s."), string("Running payload %s.")),
)

private object CrashlyticsCollectionFingerprint : Fingerprint(
    definingClass = GrokNames.APPLICATION,
    name = GrokNames.CRASHLYTICS_COLLECTION_METHOD,
    isStatic = true,
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(string("firebase_crashlytics_collection_enabled")),
)

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Block internal analytics events, Mixpanel and Hightouch payloads, and force Crashlytics collection off. Does not guarantee that every tracking connection is blocked.",
    default = true,
) {
    compatibleWith(grokCompatibility)

    val enabled by enabledOption(default = true)

    execute {
        if (enabled != true) return@execute

        InternalAnalyticsFingerprint.method.apply {
            requireRegisterCount(14) // .locals 10, p0 and three object parameters.
            returnEarly()
        }
        MixpanelOptOutPreferenceFingerprint.method.requireRegisterCount(5)
        MixpanelOptOutFingerprint.method.apply {
            requireRegisterCount(3)
            val readIndex = indexOfReference(Opcode.INVOKE_VIRTUAL, GrokNames.MIXPANEL_READ_OPT_OUT)
            requireRegisters(readIndex, 0, 2)
            // Return before monitor-enter; m/n skips sending when this getter returns true.
            returnEarly(true)
        }
        HightouchEnqueueFingerprint.method.apply {
            requireRegisterCount(12)
            // Only drops payload creation/dispatch; Runnable callers do not wait for results.
            returnEarly()
        }
        CrashlyticsCollectionFingerprint.method.apply {
            requireRegisterCount(5) // p0 is v4, encodable by const/4.
            // Preserve original setter and monitor balance; do not return early here.
            addInstruction(0, "const/4 p0, 0x0")
        }
    }
}

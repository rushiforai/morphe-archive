package semicoloncolonel.mobilestream.patches.yttv.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.yttv.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Block telemetry (OPT-IN, default OFF).
//
// YouTube TV 10.44 sends its own telemetry two ways:
//
// - HTTP pings. Every ping (quality-of-experience reports, attestation and
//   timing reports, reliability probes, view tracking, and ad measurement)
//   goes through one method of the ping service, which builds the request
//   from a ping object holding the target Uri. Both callers skip the ping
//   when that method returns null, so PingFilter decides per Uri. Playback
//   and watch-time reports are kept for resume points and watch history.
//
// - log_event, InnerTube's interaction logging, sent in batches by three
//   delayed-event dispatchers. The event store counts a batch as delivered
//   once the dispatcher returns success, so each dispatcher returns at once
//   and the stored events are dropped instead of retried.
//
// The shared layer also stops Firebase Analytics and Google Analytics, and
// the manifest switches turn off Firebase collection.
//
// Not touched: the player heartbeat, which YouTube TV uses for location and
// stream limits, playback, DRM licenses, and sign-in.
// ─────────────────────────────────────────────────────────────────────────────

private const val PING_FILTER = "Lsemicoloncolonel/mobilestream/extension/yttv/privacy/PingFilter;"
private const val PING_CONFIG_SET = "Lcom/google/android/libraries/youtube/net/config/HttpPingConfigSet;"

// The ping service method that turns a ping object into a request.
internal object PingRequestFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf(PING_CONFIG_SET, "L", "L"),
)

// Error loggers that identify two of the log_event dispatchers.
internal object DelayedLogDispatcherFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/Exception;"),
    strings = listOf("EventLoggingDelayedEventDispatcher.java"),
)

internal object FixedBatchLogDispatcherFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/Exception;"),
    strings = listOf("EventLoggingFixedBatchRetryDelayedEventDispatcher.java"),
)

// The third dispatcher's type key.
internal object BatchLogDispatcherKeyFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("must_log_events"),
)

// The log_event request's constructor.
internal object LogEventRequestFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("log_event"),
)

@Suppress("unused")
val blockTelemetryPatch = bytecodePatch(
    name = "Block telemetry",
    description = "Stops quality reports, interaction logging, view tracking, ad measurement, and Firebase Analytics.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // HTTP pings. p2 is a high register here, so it is copied to v0 first:
        // the patcher drops a 4-bit iget whose register is above v15.
        PingRequestFingerprint.method.apply {
            val pingType = parameterTypes[1].toString()
            val uriField = mutableClassDefBy(pingType).fields.firstOrNull { it.type == "Landroid/net/Uri;" }
                ?: throw PatchException("Ping target field not found")
            addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, p2
                    iget-object v0, v0, $pingType->${uriField.name}:Landroid/net/Uri;
                    invoke-static { v0 }, $PING_FILTER->shouldBlock(Landroid/net/Uri;)Z
                    move-result v0
                    if-eqz v0, :keep
                    const/4 v0, 0x0
                    return-object v0
                    :keep
                    nop
                """,
            )
        }

        // log_event dispatchers that hand batches to dispatchEvents(identity, context, events).
        listOf(DelayedLogDispatcherFingerprint, FixedBatchLogDispatcherFingerprint).forEach { fingerprint ->
            val dispatch = fingerprint.classDef.methods.firstOrNull { method ->
                method.returnType == "V" && method.parameterTypes.size == 3 &&
                    method.parameterTypes[0] == "Ljava/lang/String;" &&
                    method.parameterTypes[2] == "Ljava/util/List;"
            } ?: throw PatchException("dispatchEvents not found in ${fingerprint.classDef.type}")
            dispatch.addInstructions(0, "return-void")
        }

        // The batch dispatcher builds log_event requests itself and reports a result.
        val logEventRequest = LogEventRequestFingerprint.classDef.type
        val dispatcher = BatchLogDispatcherKeyFingerprint.classDef
        val dispatch = dispatcher.methods.firstOrNull { method ->
            method.parameterTypes.size == 1 && method.returnType.startsWith("L") &&
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.NEW_INSTANCE &&
                        ((it as ReferenceInstruction).reference as TypeReference).type == logEventRequest
                } == true
        } ?: throw PatchException("Batch log_event dispatch not found")

        // Result(SUCCESS_DONE_WITH_DISPATCH, null).
        val resultType = dispatch.returnType
        val resultConstructor = mutableClassDefBy(resultType).methods.firstOrNull {
            it.name == "<init>" && it.parameterTypes.size == 2
        } ?: throw PatchException("Dispatch result constructor not found")
        val statusType = resultConstructor.parameterTypes[0].toString()
        val statusInit = mutableClassDefBy(statusType).methods.first { it.name == "<clinit>" }
        val statusInstructions = statusInit.implementation!!.instructions.toList()
        val nameIndex = statusInstructions.indexOfFirst {
            it.opcode == Opcode.CONST_STRING &&
                ((it as ReferenceInstruction).reference as StringReference).string == "SUCCESS_DONE_WITH_DISPATCH"
        }
        if (nameIndex < 0) throw PatchException("Dispatch status SUCCESS_DONE_WITH_DISPATCH not found")
        val statusField = statusInstructions.drop(nameIndex).first { it.opcode == Opcode.SPUT_OBJECT }
            .let { (it as ReferenceInstruction).reference as FieldReference }
        val payloadType = resultConstructor.parameterTypes[1]
        dispatch.addInstructions(
            0,
            """
                sget-object v0, $statusType->${statusField.name}:$statusType
                new-instance v1, $resultType
                const/4 v2, 0x0
                invoke-direct { v1, v0, v2 }, $resultType-><init>($statusType$payloadType)V
                return-object v1
            """,
        )

        // Firebase Analytics and Google Analytics.
        blockTrackers()
    }
}

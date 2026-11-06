package app.template.patches.googlemessages

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

// Build: messages.android_20261020_00_RC01.phone_dynamic (obfuscated names, this build only).

/** SMS pipeline entry (class dlgs, method b). Anchored on log strings. */
object SmsPipelineFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("Received SMS for processing in pipeline."),
        string("Queued SMS for processing in pipeline."),
        string("Received empty list of messages. SubId: ")
    )
)

/** RCS entry points on IncomingRcsMessageProcessor (dnbd). */
object RcsIncomingAFingerprint : Fingerprint(
    definingClass = "Ldnbd;",
    name = "a",
    returnType = "Lfuim;",
    parameters = listOf("Ldlyk;")
)

object RcsIncomingBFingerprint : Fingerprint(
    definingClass = "Ldnbd;",
    name = "b",
    returnType = "Lfuim;",
    parameters = listOf("Ldlyk;")
)

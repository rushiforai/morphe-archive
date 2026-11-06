package app.morphe.patches.googlemessages.keywordfilter

import app.morphe.patcher.Fingerprint

/**
 * Build: messages.android_20261020_00_RC01.phone_dynamic
 * Verify the Fingerprint constructor/DSL against morphe-patches-template.
 */

/** SMS pipeline entry (class dlgs). Anchored on log strings that survive obfuscation. */
object SmsPipelineFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf(
        "Received SMS for processing in pipeline.",
        "Queued SMS for processing in pipeline.",
        "Received empty list of messages. SubId: "
    )
)

/**
 * RCS entry points on IncomingRcsMessageProcessor (class dnbd).
 * Both take the incoming-message object Ldlyk; (concrete class dluv, toString prints
 * "ReceiveRcsActionParameters{... messageRawText=..."). They return Lfuim; (a future).
 * These have no strings, so they are matched by class + name + signature. That only
 * works for this exact build.
 */
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

// MMS: not covered yet (ReceiveMmsMessageAction only downloads; text appears later).

package ajstrick81.morphe.patches.primevideo.gmb

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ─────────────────────────────────────────────────────────────────────────────
// Diagnostic-only target — GMB send-direction chokepoint (Java→native)
// classes2.dex / smali/com/amazon/ignitionshared/
//
// GMBMessageSender.sendGMBMessageToClient(String, String, long) is the sole
// public wrapper around the private native sendGMBMessage(String, String)
// JNI bridge. Since sendGMBMessage is private, this wrapper is its only
// call site and therefore the single chokepoint for every outbound GMB
// message (Java code → native/WASM Ignite engine).
//
// This complements the already-removed GMBMessageProcessor.processMessage
// diagnostic (receive direction, native→Java), which confirmed GMB carried
// zero ad-related traffic. This hook tests the opposite direction.
// ─────────────────────────────────────────────────────────────────────────────
object SendGMBMessageToClientFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/ignitionshared/GMBMessageSender;",
    name = "sendGMBMessageToClient",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "J"
    ),
    returnType = "I",
    accessFlags = listOf(AccessFlags.PUBLIC)
)

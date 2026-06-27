package ajstrick81.morphe.patches.primevideo.gmb

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import ajstrick81.morphe.patches.primevideo.misc.extension.primeVideoExtensionPatch
import ajstrick81.morphe.patches.primevideo.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Diagnostic-only — GMB send-direction logging (Java→native)
//
// Not an ad-suppression patch. Logs every eventType/payload passed into
// GMBMessageSender.sendGMBMessageToClient() to standard Android logcat, so
// the send direction of the GMB bus can be empirically checked against ad
// playback — the same question the now-removed processMessage diagnostic
// answered for the receive direction (result: zero ad-related traffic).
//
// Temporary/non-production: intended to be removed once the send direction
// has been confirmed ad-relevant or ad-irrelevant.
// ─────────────────────────────────────────────────────────────────────────────
@Suppress("unused")
val gmbSendDiagnosticPatch = bytecodePatch(
    name = "GMB send diagnostic (debug)",
    description = "Diagnostic-only: logs outbound GMB messages (Java→native) to logcat to test whether the send direction carries ad-related traffic.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(primeVideoExtensionPatch)

    execute {

        // ─────────────────────────────────────────────────────────────────────
        // Hook — GMBMessageSender.sendGMBMessageToClient(String, String, long)
        //
        // Passes eventType/payload straight through to the extension logger
        // and lets the original method body run unmodified afterward — pure
        // observation, no suppression, no register juggling beyond the call.
        // ─────────────────────────────────────────────────────────────────────
        SendGMBMessageToClientFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p1, p2}, Lajstrick81/morphe/extension/primevideo/gmb/SendDiagnosticPatch;->logGMBSend(Ljava/lang/String;Ljava/lang/String;)V
            """
        )
    }
}

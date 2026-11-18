package patches.tweedehands

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import patches.marktplaats.exact
import patches.marktplaats.target

private const val client = "Lo16;"
private const val request = "c(Ljava/net/URL;Ljava/lang/String;)Ljava/net/HttpURLConnection;"

internal val firebaseCompatibility = bytecodePatch {
    dependsOn(originalInput, originalFeature)
    execute {
        val method = exact(client, request, 0, 0, 0)
        check(method.getInstruction<ReferenceInstruction>(91).reference.let {
            it is StringReference && it.string == "X-Android-Cert"
        }) { "2dehands original Firebase certificate header changed" }
        // Preserve this original app's API registration identity after re-signing.
        // Only FIS's publisher fingerprint header changes; auth tokens, requests,
        // server decisions and PackageManager signatures remain real.
        method.addInstructions(92,
            "const-string v0, \"5BFB2470C28371C4273CA0232A57C120977619D3\"")
    }
}

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressFirebaseHeartbeats() {
    // The app Context is already captured in v3. Reuse the native absent-provider
    // path, retaining its diagnostic tag and certificate/HTTP construction.
    // The compatibility dependency has already validated the original and
    // inserted its certificate constant. Do not compare it to the old count.
    val method = target(client, request).method
    check(method.getInstruction<ReferenceInstruction>(92).reference.let {
        it is StringReference && it.string == "5BFB2470C28371C4273CA0232A57C120977619D3"
    }) { "2dehands Firebase compatibility dependency did not run" }
    method.addInstructionsWithLabels(25, """
        const/4 p0, 0x0
        goto/16 :no_heartbeat
    """.trimIndent(), ExternalLabel("no_heartbeat", method.getInstruction(29)))
}

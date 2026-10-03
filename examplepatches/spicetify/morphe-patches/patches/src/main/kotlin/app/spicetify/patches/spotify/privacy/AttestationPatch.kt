package app.spicetify.patches.spotify.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.spicetify.patches.spotify.settings.settingsPatch
import app.spicetify.patches.spotify.spotifyCompatibility
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

@Suppress("unused")
val attestationPatch = bytecodePatch(
    name = "Client token without Play attestation",
    description = "Acquires Spotify's client token without the Google Play attestation, " +
        "the way devices without Play services do. Known on 9.1.88 not to lift the catalog " +
        "gate; kept because the no-attestation presentation is harmless and may matter if " +
        "the gate's cohort changes. Password login keeps refusing the app, so sign in with " +
        "the emailed code. Experimental.",
    default = false,
) {
    compatibleWith(spotifyCompatibility)
    dependsOn(settingsPatch)

    execute {
        // p.toh1 is the client-token context. Its only reader decides, from this one
        // boolean, whether the Play-Integrity provider is attached to the token request;
        // answering false produces the request a device without Play services sends.
        val flag = mutableClassDefBy("Lp/toh1;").methods.singleOrNull {
            it.name == "F" && it.returnType == "Z" && it.parameterTypes.isEmpty()
        } ?: throw PatchException("Client token attestation flag p.toh1.F not found.")
        val body = flag.implementation?.instructions?.toList().orEmpty()
        if (body.size != 2 || body[0].opcode != Opcode.IGET_BOOLEAN ||
            (body[0] as? ReferenceInstruction)?.reference.toString() != "Lp/toh1;->zzq:Z" ||
            body[1].opcode != Opcode.RETURN
        ) {
            throw PatchException("Client token attestation flag changed its body.")
        }
        // The one register this method has is `this`, which the original body already
        // overwrites; claiming it for the constant is safe because we return immediately.
        flag.addInstructions(0, "const/4 v0, 0x0\n    return v0")
    }
}

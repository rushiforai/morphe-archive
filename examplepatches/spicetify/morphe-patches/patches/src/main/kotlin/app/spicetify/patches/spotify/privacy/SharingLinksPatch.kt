package app.spicetify.patches.spotify.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.spicetify.patches.spotify.spotifyCompatibility
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// The historical anddea ShareUrl constructor no longer exists in Spotify 9.1.80.
// Match the share URL builder instead, immediately after its final URI conversion.
internal object ShareLinkFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "L", "Ljava/util/Map;"),
    returnType = "L",
    strings = listOf("si", "context", "utm_source", "utm_medium", "utm_campaign", "Invalid uri "),
)

@Suppress("unused")
val sharingLinksPatch = bytecodePatch(
    name = "Clean sharing links",
    description = "Removes sharing identifiers and marketing parameters from open.spotify.com links. " +
        "Keeps playback timestamps, context, and other parameters.",
    default = true,
) {
    compatibleWith(spotifyCompatibility)
    extendWith("extensions/spotify.mpe")

    execute {
        val matches = ShareLinkFingerprint.matchAllOrNull().orEmpty()
        if (matches.size != 1) {
            throw PatchException("Expected one Spotify share URL builder, found ${matches.size}.")
        }
        val method = matches.single().method
        val instructions = method.implementation!!.instructions.toList()
        val uriConversionIndex = instructions.indexOfLast { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Landroid/net/Uri;" && reference.name == "toString" &&
                reference.parameterTypes.isEmpty() && reference.returnType == "Ljava/lang/String;"
        }
        val result = instructions.getOrNull(uriConversionIndex + 1)
        if (uriConversionIndex < 0 || result?.opcode != Opcode.MOVE_RESULT_OBJECT) {
            throw PatchException("Spotify share URL builder has no final URI string result.")
        }
        val register = (result as OneRegisterInstruction).registerA
        method.addInstructions(
            uriConversionIndex + 2,
            """
                invoke-static/range { v$register .. v$register }, Lapp/spicetify/extension/spotify/privacy/SharingLinks;->sanitizeUrl(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$register
            """.trimIndent(),
        )
    }
}

/*
 * Adapted from piko <https://github.com/crimera/piko>, GPLv3.
 *
 * Covers the post, profile, story and live share links. piko additionally hooks the audio and
 * highlight links, whose call sites need considerably more analysis; they are not ported here,
 * so those two link kinds are left untouched.
 */

package app.ahmedyarub.patches.instagram.links

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal const val LINKS_CLASS = "Lapp/ahmedyarub/extension/instagram/Links;"

internal object PermalinkResponseJsonParserFingerprint : Fingerprint(
    strings = listOf("XDTPermalinkResponse"),
    custom = { methodDef, _ -> methodDef.name.lowercase().contains("parsefromjson") },
)

internal object ProfileUrlResponseJsonParserFingerprint : Fingerprint(
    strings = listOf("profile_to_share_url"),
    custom = { methodDef, _ -> methodDef.name.lowercase().contains("parsefromjson") },
)

internal object StoryItemThirdPartySharingUrlResponseImplFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    definingClass = "StoryItemThirdPartySharingUrlResponseImpl;",
)

internal object LiveThirdPartySharingUrlResponseImplFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    definingClass = "Lcom/instagram/api/schemas/LiveThirdPartySharingUrlResponseImpl;",
)

/**
 * Routes every share URL the app produces through [extensionMethodName], which takes and
 * returns the URL string.
 */
context(_: BytecodePatchContext)
internal fun hookShareLinks(extensionMethodName: String) {
    fun hook(urlRegister: Int) = """
        invoke-static/range { v$urlRegister .. v$urlRegister }, $LINKS_CLASS->$extensionMethodName(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v$urlRegister
    """

    var hooked = 0

    // Parsed out of a JSON response and stored into a field.
    listOf(
        PermalinkResponseJsonParserFingerprint,
        ProfileUrlResponseJsonParserFingerprint,
    ).forEach { fingerprint ->
        val match = fingerprint.matchOrNull() ?: return@forEach

        match.method.apply {
            // The register must provably hold a String: the hook passes it to a
            // String parameter, and a mismatch is a verify error when the class loads,
            // which the extension's own error handling cannot catch. So the first field
            // store after the anchor is not assumed to be the URL - the first store to a
            // String field is used, and if there is none this call site is left alone.
            val assignmentIndex = instructions.withIndex().firstOrNull { (index, instruction) ->
                index > match.stringMatches.first().index &&
                    instruction.opcode == Opcode.IPUT_OBJECT &&
                    ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.type ==
                    "Ljava/lang/String;"
            }?.index ?: return@forEach

            addInstructions(assignmentIndex, hook(instructions[assignmentIndex].registersUsed[0]))
            hooked++
        }
    }

    // Returned directly by the response model.
    listOf(
        StoryItemThirdPartySharingUrlResponseImplFingerprint,
        LiveThirdPartySharingUrlResponseImplFingerprint,
    ).forEach { fingerprint ->
        val match = fingerprint.matchOrNull() ?: return@forEach

        // Safe by construction: the fingerprint only matches methods returning String, so
        // the register feeding return-object is a String.
        match.method.apply {
            val returnInstruction = instructions.last { it.opcode == Opcode.RETURN_OBJECT }

            addInstructions(returnInstruction.location.index, hook(returnInstruction.registersUsed[0]))
            hooked++
        }
    }

    // Each link kind is hooked independently: a call site that moved in a newer app version
    // should cost that one kind, not the whole patch. Failing only when nothing matched keeps
    // a silently useless patch from shipping.
    if (hooked == 0) throw PatchException("No share link call site matched")
}

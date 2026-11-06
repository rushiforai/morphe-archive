/*
 * Adapted from piko <https://github.com/crimera/piko>, GPLv3.
 *
 * Covers the post, profile, story and live share links. piko additionally hooks the audio and
 * highlight links, whose call sites need considerably more analysis; they are not ported here,
 * so those two link kinds are left untouched.
 */

package app.ahmedyarub.patches.instagram.links

import app.ahmedyarub.patches.shared.indicesOfString
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

/**
 * The profile share URL parser. On 449 its key, profile_to_share_url, is pooled, so the
 * parser is found by the response class name it reports on a missing field.
 */
internal object ProfileUrlResponseJsonParserFingerprint : Fingerprint(
    strings = listOf("ProfileThirdPartySharingUrlResponseImpl"),
    custom = { methodDef, _ -> methodDef.name.lowercase().contains("parsefromjson") },
)

/** The JSON key each parser reads the URL from. It is loaded before the URL is stored. */
private val URL_KEYS = mapOf(
    PermalinkResponseJsonParserFingerprint to "permalink",
    ProfileUrlResponseJsonParserFingerprint to "profile_to_share_url",
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

    // Parsed out of a JSON response and stored into a field.
    URL_KEYS.forEach { (fingerprint, key) ->
        fingerprint.method.apply {
            val keyIndex = indicesOfString(key).singleOrNull()
                ?: throw PatchException("${fingerprint.javaClass.simpleName} does not load $key exactly once")

            // The register must provably hold a String: the hook passes it to a
            // String parameter, and a mismatch is a verify error when the class loads,
            // which the extension's own error handling cannot catch. So the first field
            // store after the anchor is not assumed to be the URL - the first store to a
            // String field is used.
            val assignmentIndex = instructions.withIndex().firstOrNull { (index, instruction) ->
                index > keyIndex &&
                    instruction.opcode == Opcode.IPUT_OBJECT &&
                    ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.type ==
                    "Ljava/lang/String;"
            }?.index ?: throw PatchException("${fingerprint.javaClass.simpleName} stores no String after its key")

            addInstructions(assignmentIndex, hook(instructions[assignmentIndex].registersUsed[0]))
        }
    }

    // Returned directly by the response model.
    listOf(
        StoryItemThirdPartySharingUrlResponseImplFingerprint,
        LiveThirdPartySharingUrlResponseImplFingerprint,
    ).forEach { fingerprint ->
        val match = fingerprint.match()

        // Safe by construction: the fingerprint only matches methods returning String, so
        // the register feeding return-object is a String.
        match.method.apply {
            val returnInstruction = instructions.last { it.opcode == Opcode.RETURN_OBJECT }

            addInstructions(returnInstruction.location.index, hook(returnInstruction.registersUsed[0]))
        }
    }
}

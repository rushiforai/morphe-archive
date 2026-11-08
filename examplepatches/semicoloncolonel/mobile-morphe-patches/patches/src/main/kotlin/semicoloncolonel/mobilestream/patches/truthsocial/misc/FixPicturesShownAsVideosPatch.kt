package semicoloncolonel.mobilestream.patches.truthsocial.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.truthsocial.shared.Constants

// Truth Social 1.28.3. The feed draws a post's media in its video player
// when the post's "has video" check is true, and that check also looks at
// the post it replies to, a reshared post, and a quoted post. A post whose
// own media is a picture can then get the video player: the app builds a
// video item whose video address is the JPEG, shows a play button, and
// ignores taps. (Seen on a post that quotes an earlier picture post.)
//
// In the four places that pick the video player (the post body, quoted
// posts, replies on the detail screen, and the quote preview), the check
// goes through MediaTypeFix.hasVideo instead. It answers from the post's
// own media when the post has any, and otherwise calls the app's own check.
//
// The app's check is found by its body: it returns a boolean, takes nothing,
// and compares media types with TV on each of the four posts.
private const val MEDIA_TYPE_FIX = "Lsemicoloncolonel/mobilestream/extension/truthsocial/MediaTypeFix;"
private const val MEDIA_TYPE = "Lcom/truthsocial/core/data/models/TruthMediaType;"
private val CALLERS = listOf(
    "com.truthsocial.app.features.timeline.components.TruthContentBody (",
    "com.truthsocial.app.features.timeline.components.QuoteTruth.",
    "com.truthsocial.app.features.timeline.details.DetailReplyTruth.",
    "com.truthsocial.app.features.timeline.truthcomposer.components.QuoteTruthSummary.",
)

internal object HasVideoFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, _ ->
        (method.implementation?.instructions?.count {
            it.opcode == Opcode.SGET_OBJECT &&
                ((it as ReferenceInstruction).reference as FieldReference).let { field ->
                    field.definingClass == MEDIA_TYPE && field.name == "TV"
                }
        } ?: 0) >= 4
    },
)

internal object HasVideoMethodNameFingerprint : Fingerprint(
    definingClass = MEDIA_TYPE_FIX,
    name = "hasVideoMethod",
    returnType = "Ljava/lang/String;",
)

private fun Method.traceNames() = implementation?.instructions
    ?.filter { it.opcode == Opcode.CONST_STRING }
    ?.map { ((it as ReferenceInstruction).reference as StringReference).string }
    .orEmpty()

@Suppress("unused")
val fixPicturesShownAsVideosPatch = bytecodePatch(
    name = "Fix pictures shown as videos",
    description = "Shows a post's picture as a picture when the app would draw it as a video that cannot play.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        val hasVideo = HasVideoFingerprint.method
        HasVideoMethodNameFingerprint.method.addInstructions(
            0,
            "const-string v0, \"${hasVideo.name}\"\nreturn-object v0",
        )

        var calls = 0
        forEachMatchingMethod({ true }, { method ->
            method.traceNames().any { name -> CALLERS.any { name.startsWith(it) } } &&
                method.implementation?.instructions?.any { it.isCallTo(hasVideo) } == true
        }) { method ->
            val instructions = method.implementation!!.instructions.toList()
            instructions.indices.filter { instructions[it].isCallTo(hasVideo) }.forEach { index ->
                val post = (instructions[index] as FiveRegisterInstruction).registerC
                method.replaceInstruction(
                    index,
                    "invoke-static { v$post }, $MEDIA_TYPE_FIX->hasVideo(Ljava/lang/Object;)Z",
                )
                calls++
            }
        }
        if (calls == 0) throw PatchException("Video player checks not found")
    }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.isCallTo(target: Method): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL) return false
    val reference = (this as ReferenceInstruction).reference as MethodReference
    return reference.definingClass == target.definingClass && reference.name == target.name &&
        reference.returnType == "Z" && reference.parameterTypes.isEmpty()
}

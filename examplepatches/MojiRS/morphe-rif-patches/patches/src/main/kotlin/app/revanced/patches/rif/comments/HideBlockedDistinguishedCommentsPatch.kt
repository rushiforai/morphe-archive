package app.revanced.patches.rif.comments

import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.revanced.patches.rif.settings.addRevancedPreferenceCategory
import app.revanced.patches.rif.settings.checkBoxPreference
import app.revanced.patches.rif.settings.revancedSettingsPatch
import app.revanced.patches.rif.settings.revancedSettingsResourcePatch
import app.revanced.patches.rif.shared.RIF_BUILDS
import app.revanced.patches.rif.shared.RIF_COMPATIBILITY
import app.revanced.patches.rif.shared.requireScratchRegister
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.revanced.patches.rif.shared.classes

private const val EXTENSION = "Lapp/revanced/extension/rif/BlockedComments;"
private const val COMMENT_THING = "Lcom/andrewshu/android/reddit/things/objects/CommentThing;"

// Adds the "Blocked users" category to the ReVanced screen.
val hideBlockedCommentsSettingsResourcePatch = resourcePatch(
    description = "Adds the hide blocked users' distinguished comments setting.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    dependsOn(revancedSettingsResourcePatch)

    execute {
        addRevancedPreferenceCategory("Blocked users") { doc, category ->
            category.appendChild(
                doc.checkBoxPreference(
                    "HIDE_BLOCKED_DISTINGUISHED",
                    "Hide blocked users' mod comments",
                    summary = "Distinguished (mod and admin) comments, including pinned ones",
                    default = false,
                ),
            )
        }
    }
}

private fun Instruction.commentThingCall(): MethodReference? =
    if (opcode == Opcode.INVOKE_VIRTUAL) {
        ((this as ReferenceInstruction).reference as? MethodReference)
            ?.takeIf { it.definingClass == COMMENT_THING }
    } else {
        null
    }

// The comments-page adapter's private k0(Thing)Z (free n2.r / Platinum o2.r; identical bytecode
// shape in both): true drops the comment and its replies. Its body is
// `r0() && isEmpty(distinguished()) && !permalink && !viewerModerates` (r0 = collapsed code is
// BLOCKED_AUTHOR).
internal val commentFilterFingerprint = fingerprint {
    custom { method, classDef ->
        RIF_BUILDS.any { it.commentsAdapterClass == classDef.type } &&
            method.name == "k0" &&
            method.returnType == "Z" &&
            method.parameterTypes.size == 1 &&
            method.implementation?.instructions?.any { it.opcode == Opcode.INSTANCE_OF } == true
    }
}

@Suppress("unused")
val hideBlockedDistinguishedCommentsPatch = bytecodePatch(
    name = "Hide blocked mod comments",
    description = "Adds a setting to hide mod comments from blocked users. Off by default.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    dependsOn(hideBlockedCommentsSettingsResourcePatch, revancedSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        val filter = commentFilterFingerprint.method
        val code = filter.instructions.toList()

        // The CommentThing getters the filter calls, in order: blocked author, distinguished.
        val calls = code.mapIndexedNotNull { i, insn -> insn.commentThingCall()?.let { i to it } }
        if (calls.size < 2 || calls[1].second.returnType != "Ljava/lang/String;") {
            throw PatchException("unexpected filter shape in ${filter.definingClass}->${filter.name}")
        }
        val firstCall = calls[0].first
        val distinguished = calls[1].second.name

        // CommentThing's "NEAR_BLOCKED".equals(unrepliable_reason) getter, found by its string.
        val commentThing = classes.firstOrNull { it.type == COMMENT_THING }
            ?: throw PatchException("CommentThing not found")
        val nearBlocked = commentThing.methods.filter { m ->
            m.returnType == "Z" && m.parameterTypes.isEmpty() &&
                m.implementation?.instructions?.any {
                    it.opcode == Opcode.CONST_STRING &&
                        (it as ReferenceInstruction).reference.toString() == "NEAR_BLOCKED"
                } == true
        }.singleOrNull()?.name ?: throw PatchException("CommentThing NEAR_BLOCKED getter not found")

        // Rif's own exceptions (single-comment permalink, viewer moderates the sub) start at the
        // first field read after the distinguished check: jump there when we want it hidden.
        val exceptions = code.indexOfFirst { it.opcode == Opcode.IGET_OBJECT }
        if (exceptions <= firstCall) throw PatchException("filter exceptions not found")

        // Before the r0() call (p1 is already cast to CommentThing). v0 and v1 are locals; v1
        // holds the constant false the method returns on its early exits, so restore it.
        requireScratchRegister(filter)
        if (filter.implementation!!.registerCount < 4) throw PatchException("too few registers in k0")
        filter.addInstructionsWithLabels(
            firstCall,
            """
                invoke-virtual { p1 }, $COMMENT_THING->$nearBlocked()Z
                move-result v0
                invoke-virtual { p1 }, $COMMENT_THING->$distinguished()Ljava/lang/String;
                move-result-object v1
                invoke-static { v0, v1 }, $EXTENSION->hide(ZLjava/lang/String;)Z
                move-result v0
                const/4 v1, 0x0
                if-nez v0, :exceptions
            """,
            ExternalLabel("exceptions", filter.getInstruction(exceptions)),
        )
    }
}

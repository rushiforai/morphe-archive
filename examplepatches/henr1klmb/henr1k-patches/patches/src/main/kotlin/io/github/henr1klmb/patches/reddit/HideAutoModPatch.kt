package io.github.henr1klmb.patches.reddit

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import io.github.henr1klmb.patches.shared.ensureRegisters

@Suppress("unused")
val hideAutoModPatch = patch(
    name = "Hide AutoModerator comments",
    description = "Automatically collapses comments from AutoModerator in threads by default.",
) {
    compatibleWith(REDDIT_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        RedditDomainCommentConstructorFingerprint.method.patchAutoModCollapse("Lcom/reddit/domain/model/Comment;")
        RedditV1CommentConstructorFingerprint.methodOrNull?.patchAutoModCollapse("Lcom/reddit/data/model/v1/Comment;")
    }
}

private fun MutableMethod.patchAutoModCollapse(definingClass: String) {
    ensureRegisters(1)
    val impl = implementation ?: return
    val instructions = impl.instructions.toList()
    val collapsedIndex = instructions.indexOfFirst { inst ->
        if (inst.opcode != Opcode.IPUT_BOOLEAN) return@indexOfFirst false
        val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference ?: return@indexOfFirst false
        ref.definingClass == definingClass && ref.name == "collapsed"
    }
    if (collapsedIndex != -1) {
        val targetInst = instructions[collapsedIndex] as TwoRegisterInstruction
        val valueRegister = targetInst.registerA
        val objectRegister = targetInst.registerB

        addInstructions(
            collapsedIndex,
            """
            iget-object v0, v$objectRegister, $definingClass->author:Ljava/lang/String;
            invoke-static {v0, v$valueRegister}, Lio/github/henr1klmb/patches/shared/AutoModHelper;->shouldCollapse(Ljava/lang/String;Z)Z
            move-result v$valueRegister
            """.trimIndent(),
        )
    }
}

package io.github.pengusto.patches.messages

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

@Suppress("unused")
val readNotificationsPatch = bytecodePatch(
    name = "Dismiss notifications when marking conversations read",
    description = "Remove the selected conversation's notification after Mark as read in the conversation list.",
    default = true
) {
    compatibleWith(Compatibility(name = "Fossify Messages", packageName = "org.fossify.messages", targets = listOf(AppTarget(version = "1.10.1"))))
    extendWith("extensions/extension.mpe")
    execute {
        // R8's shared read/unread adapter lambda in the official 1.10.1 APK.
        // Patch only its read branch, after the original provider/database update.
        val method = Fingerprint(definingClass = "Lv90;", name = "a", returnType = "Ljava/lang/Object;", parameters = emptyList()).method
        val instructions = method.implementation!!.instructions
        val matches = instructions.indices.filter {
            (instructions[it] as? ReferenceInstruction)?.reference.toString() == "Lqp3;->k0(Landroid/content/Context;J)V"
        }
        check(matches.size == 1) { "Unsupported Messages mark-as-read binding" }
        val index = matches.single()
        check(instructions[index].opcode == Opcode.INVOKE_STATIC) { "Unexpected Messages mark-as-read invocation" }
        val call = instructions[index] as FiveRegisterInstruction
        check(call.registerCount == 3) { "Unexpected Messages mark-as-read arguments" }
        method.addInstruction(index + 1, BuilderInstruction35c(
            Opcode.INVOKE_STATIC, 3, call.registerC, call.registerD, call.registerE, 0, 0,
            ImmutableMethodReference("Lio/github/pengusto/patches/extension/messages/ReadNotifications;", "cancel", listOf("Landroid/content/Context;", "J"), "V")
        ))
    }
}

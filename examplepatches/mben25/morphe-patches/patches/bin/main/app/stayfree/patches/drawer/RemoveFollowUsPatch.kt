package app.stayfree.patches.drawer

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val R_STRING = "Lcom/burockgames/R\$string;"

@Suppress("unused")
val removeFollowUsPatch = bytecodePatch(
    name = "Remove Follow us",
    description = "Removes the \"• Follow us!\" link next to \"StayFree\" at the top of the side " +
        "menu. Tapping the header no longer opens StayFree's social media page.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    execute {
        val method = DrawerHeaderFingerprint.method
        val instructions = method.implementation!!.instructions

        fun indexOfString(name: String) = instructions.indexOfFirst {
            it.opcode == Opcode.SGET &&
                ((it as ReferenceInstruction).reference as FieldReference)
                    .let { field -> field.definingClass == R_STRING && field.name == name }
        }.takeIf { it >= 0 } ?: throw PatchException("R.string.$name not found in drawer header")

        fun isVoidStaticCall(index: Int) = instructions[index].let {
            (it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE) &&
                ((it as ReferenceInstruction).reference as MethodReference).returnType == "V"
        }

        val appNameIndex = indexOfString("app_name")
        val followUsIndex = indexOfString("follow_us")
        if (followUsIndex < appNameIndex) throw PatchException("Unexpected drawer header layout")

        // Between the two string loads the row draws exactly two things: the "StayFree" Text
        // (lt2.n) and the dot Icon (ee2.n). The last one is the dot.
        val headerDraws = (appNameIndex until followUsIndex).filter(::isVoidStaticCall)
        if (headerDraws.size != 2) throw PatchException("Drawer header dot not found")
        val dotCall = headerDraws.last()

        // The "Follow us!" Text: the first composable call after its string.
        val followUsCall = (followUsIndex until instructions.size).firstOrNull(::isVoidStaticCall)
            ?: throw PatchException("Follow us text call not found")

        // The row's click: `check-cast vL, Lcj4;` → `invoke-static {vM, vL}, p60.N(Lp27;Lcj4;)Lp27;`
        // → `move-result-object vM`. The result goes back into the modifier register, so
        // dropping the call and its move-result leaves the plain, non-clickable modifier.
        val clickCalls = (0 until appNameIndex).filter { index ->
            val instruction = instructions[index]
            if (instruction.opcode != Opcode.INVOKE_STATIC) return@filter false
            val reference = (instruction as ReferenceInstruction).reference as MethodReference
            val parameters = reference.parameterTypes.map(CharSequence::toString)
            val call = instruction as FiveRegisterInstruction
            val previous = instructions.getOrNull(index - 1)
            val next = instructions.getOrNull(index + 1)
            parameters.size == 2 && reference.returnType == parameters[0] &&
                previous?.opcode == Opcode.CHECK_CAST &&
                ((previous as ReferenceInstruction).reference as TypeReference).type == parameters[1] &&
                (previous as OneRegisterInstruction).registerA == call.registerD &&
                next?.opcode == Opcode.MOVE_RESULT_OBJECT &&
                (next as OneRegisterInstruction).registerA == call.registerC
        }
        if (clickCalls.size != 1) throw PatchException("Drawer header click modifier not found")
        val clickCall = clickCalls.single()

        // Replacing in place keeps every index above valid. Each removed call is a whole
        // composable group (Text, Icon) or a plain modifier function, so Compose stays balanced.
        listOf(followUsCall, dotCall).forEach { method.replaceInstruction(it, "nop") }
        method.replaceInstruction(clickCall + 1, "nop")
        method.replaceInstruction(clickCall, "nop")
    }
}

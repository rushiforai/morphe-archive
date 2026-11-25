package patches.applemusic

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11n
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import patches.shared.androidAutoHostVisibility

private const val CAR_CALLBACK = "Lcom/apple/android/music/player/c0;"
private const val LIBRARY_ROOT = "Lag/o;"
private const val LIBRARY_ROOT_METHOD = "l"
private const val GEARHEAD = "com.google.android.projection.gearhead"
private const val REJECT_RESULT = "LJ4/u;->b(I)LJ4/u;"

/**
 * Apple Music rejects a media-browser caller whose signing certificate is not in its allow-list,
 * and it builds the Android Auto root and search hints only for Google's `gearhead` package.
 * Both checks sit in the media3 `onGetLibraryRoot` callback.
 */
@Suppress("unused")
val appleMusicCustomAndroidAutoHosts = bytecodePatch(
    name = "Allow custom Android Auto hosts",
    description = "Lets Apple Music's car media browser accept a third-party Android Auto host such " +
        "as DriveDeck or Gearslip and use its Android Auto root. Apple Music's account, catalogue " +
        "and playback services are unchanged.",
    default = true,
) {
    compatibleWith(appleMusic)
    dependsOn(originalInput, androidAutoHostVisibility)

    execute {
        val method = mutableClassDefBy(CAR_CALLBACK).methods.singleOrNull { candidate ->
            candidate.name == LIBRARY_ROOT_METHOD && candidate.returnType == LIBRARY_ROOT &&
                candidate.parameterTypes.map(CharSequence::toString) ==
                listOf("LJ4/y1\$b;", "LJ4/m2\$e;", "LJ4/y1\$a;")
        } ?: throw IllegalStateException("Apple Music car library-root method changed")

        val size = method.implementation!!.instructions.size

        // Use the Android Auto root and its car browsing hints for every accepted host.
        val gearhead = (0 until size).firstOrNull { index ->
            ((method.getInstruction(index) as? ReferenceInstruction)?.reference as? StringReference)
                ?.string == GEARHEAD
        } ?: throw IllegalStateException("Apple Music gearhead comparison changed")
        val gearheadRegister = (method.getInstruction(gearhead) as OneRegisterInstruction).registerA
        val equals = (gearhead + 1 until size).firstOrNull { index ->
            val instruction = method.getInstruction(index)
            if (instruction.opcode != Opcode.INVOKE_VIRTUAL &&
                instruction.opcode != Opcode.INVOKE_VIRTUAL_RANGE
            ) return@firstOrNull false
            val reference = instruction.getReference<MethodReference>() ?: return@firstOrNull false
            val argument = when (instruction) {
                is FiveRegisterInstruction -> instruction.registerD
                is RegisterRangeInstruction -> instruction.startRegister + 1
                else -> return@firstOrNull false
            }
            reference.definingClass == "Ljava/lang/String;" && reference.name == "equals" &&
                reference.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;") &&
                argument == gearheadRegister
        } ?: throw IllegalStateException("Apple Music gearhead comparison changed")

        val result = equals + 1
        check(method.getInstruction(result).opcode == Opcode.MOVE_RESULT) {
            "Apple Music gearhead result changed"
        }
        val resultRegister = (method.getInstruction(result) as OneRegisterInstruction).registerA
        method.replaceInstruction(result, "const/4 v$resultRegister, 0x1")

        // The denied caller is answered with a RESULT_ERROR_NOT_SUPPORTED (-4) result.
        val rejection = (0 until size - 1).firstOrNull { index ->
            val instruction = method.getInstruction(index)
            instruction.opcode == Opcode.CONST_4 &&
                (instruction as Instruction11n).narrowLiteral == -4 &&
                method.getInstruction(index + 1).let { next ->
                    next.opcode == Opcode.INVOKE_STATIC &&
                        (next as? ReferenceInstruction)?.reference?.toString() == REJECT_RESULT
                }
        } ?: throw IllegalStateException("Apple Music car caller rejection changed")

        // The branch sits above the two receives that build the error result; force its condition.
        val verdict = (rejection - 1 downTo maxOf(0, rejection - 8)).firstOrNull { index ->
            method.getInstruction(index).opcode == Opcode.IF_NEZ
        } ?: throw IllegalStateException("Apple Music car caller verdict changed")
        val allowed = method.getInstruction(verdict)
        val allowedRegister = (allowed as OneRegisterInstruction).registerA
        method.addInstructions(verdict, "const/4 v$allowedRegister, 0x1")
    }
}

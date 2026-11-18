package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Keep the native track drawn without changing controls, touch or animation state. */
internal val persistentProgressHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        val host = Fingerprint(returnType = "V", strings = listOf("timed_markers_width")).classDef
        for ((name, expected) in listOf("onDraw" to 2, "W" to 1, "ae" to 1)) {
            val method = host.methods.single { it.name == name }
            val parameters = if (name == "onDraw") listOf("Landroid/graphics/Canvas;") else emptyList()
            val result = when (name) { "onDraw" -> "V"; "W" -> "F"; else -> "Z" }
            require(method.parameterTypes == parameters && method.returnType == result) {
                "Native track render signature changed: $name"
            }
            val instructions = method.implementation!!.instructions.toList()
            val reads = instructions.withIndex().filter { (_, instruction) ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                instruction.opcode == Opcode.IGET_OBJECT && field?.definingClass == host.type
                    && field.name == "ac" && field.type == "Ljru;"
            }
            require(reads.size == expected) { "Native track visibility reads changed: $name" }
            // The first onDraw read is its duration/initialization guard. Leave it intact.
            val selected = if (name == "onDraw") reads.takeLast(1) else reads
            for ((index, instruction) in selected.asReversed()) {
                val call = instructions[index + 1] as? FiveRegisterInstruction
                val ref = (instructions[index + 1] as? ReferenceInstruction)?.reference as? MethodReference
                require(instructions[index + 1].opcode == Opcode.INVOKE_VIRTUAL
                    && call != null && call.registerCount == 1
                    && call.registerC == (instruction as TwoRegisterInstruction).registerA
                    && ref?.definingClass == "Ljtf;" && ref.name == "c"
                    && ref.parameterTypes.isEmpty() && ref.returnType == "F")
                require(instructions[index + 2].opcode == Opcode.MOVE_RESULT)
                val register = (instructions[index + 2] as OneRegisterInstruction).registerA
                method.addInstructions(index + 3, """
                    invoke-static/range { v$register .. v$register }, $EXTENSION_PACKAGE/playback/PlayerBehavior;->progressVisibility(F)F
                    move-result v$register
                """)
            }
            println("Afterglow persistent track: ${host.type}->$name, ${selected.size} render reads")
        }
    }
}

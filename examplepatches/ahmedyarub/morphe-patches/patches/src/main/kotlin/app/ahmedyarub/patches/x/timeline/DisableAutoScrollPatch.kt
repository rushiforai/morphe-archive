package app.ahmedyarub.patches.x.timeline

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.x.shared.EXTENSION_PACKAGE
import app.ahmedyarub.patches.x.shared.xExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val SCROLL_POSITION_CLASS = "$EXTENSION_PACKAGE/ScrollPosition;"

/** Remembers a timeline's scroll position, in memory. */
private object SaveScrollPositionFingerprint : Fingerprint(
    strings = listOf("Saving scrolling positions for "),
)

/** The scroll position a timeline opens at: the remembered one, or the top. */
private object RestoreScrollPositionFingerprint : Fingerprint(
    strings = listOf("Restoring scrolling position for "),
)

private object HolderClassExtensionFingerprint : Fingerprint(
    definingClass = SCROLL_POSITION_CLASS,
    name = "holderClass",
)

@Suppress("unused")
val disableAutoScrollOnLaunchPatch = bytecodePatch(
    name = "Disable auto timeline scroll on launch",
    description = "Opens the home timelines where you left them, instead of at the newest posts.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(xExtensionPatch)

    execute {
        // Saved alongside the app's own map entry: put(timeline, position).
        SaveScrollPositionFingerprint.method.apply {
            val put = instructions.first { instruction ->
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    instruction.getReference<MethodReference>()?.let {
                        it.definingClass == "Ljava/util/concurrent/ConcurrentHashMap;" && it.name == "put"
                    } == true
            } as FiveRegisterInstruction

            addInstructions(
                instructions.indexOf(put as com.android.tools.smali.dexlib2.iface.instruction.Instruction),
                "invoke-static { v${put.registerD}, v${put.registerE} }, $SCROLL_POSITION_CLASS->save(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
        }

        // Restored where the app looks its map entry up: get(timeline), then cast to the holder.
        RestoreScrollPositionFingerprint.method.apply {
            val get = instructions.first { instruction ->
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    instruction.getReference<MethodReference>()?.let {
                        it.definingClass == "Ljava/util/concurrent/ConcurrentHashMap;" && it.name == "get"
                    } == true
            }
            val getIndex = instructions.indexOf(get)
            val timeline = (get as FiveRegisterInstruction).registerD
            val cast = instructions[getIndex + 2]
            if (cast.opcode != Opcode.CHECK_CAST) throw PatchException("The remembered position is not cast to its holder")
            val holder = cast.getReference<TypeReference>()!!.type
            val position = (cast as OneRegisterInstruction).registerA
            if (maxOf(timeline, position) > 15) throw PatchException("The position lookup keeps its values above v15")

            HolderClassExtensionFingerprint.method.returnEarly(holder.removePrefix("L").removeSuffix(";").replace('/', '.'))

            addInstructions(
                getIndex + 3,
                """
                invoke-static { v$timeline, v$position }, $SCROLL_POSITION_CLASS->restore(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$position
                check-cast v$position, $holder
                """,
            )
        }
    }
}

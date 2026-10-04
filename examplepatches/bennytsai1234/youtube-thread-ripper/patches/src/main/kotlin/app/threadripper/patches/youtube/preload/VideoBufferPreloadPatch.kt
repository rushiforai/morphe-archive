package app.threadripper.patches.youtube.preload

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.threadripper.patches.youtube.Constants.COMPATIBILITY_YOUTUBE
import app.threadripper.patches.youtube.settings.settingsResourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/threadripper/extension/youtube/Preload;"

@Suppress("unused")
val videoBufferPreloadPatch = bytecodePatch(
    name = "Video buffer preload",
    description = "Lets the player keep loading until a target amount of video is buffered, " +
        "within a memory limit, instead of stopping at the app's byte and time limits.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    extendWith("extensions/youtube.mpe")
    dependsOn(settingsResourcePatch)

    execute {
        val method = ShouldContinueLoadingFingerprint.method
        val instructions = method.implementation!!.instructions.toList()
        val parametersType = method.parameterTypes.single().toString()

        // media3 LoadControl.Parameters: bufferedDurationUs is the first long field the method
        // reads from the parameter, playbackSpeed the class's only float field.
        val parameterFields = instructions.mapNotNull { insn ->
            ((insn as? ReferenceInstruction)?.reference as? FieldReference)
                ?.takeIf { it.definingClass == parametersType }?.let { insn.opcode to it }
        }
        val bufferedField = parameterFields.firstOrNull { it.first == Opcode.IGET_WIDE }?.second
            ?: throw PatchException("bufferedDurationUs not found in ${method.definingClass}->${method.name}")
        val speedField = mutableClassDefBy(parametersType).fields.singleOrNull { it.type == "F" }
            ?: throw PatchException("playbackSpeed not found in $parametersType")

        // Byte limit check `allocator().getTotalBytesAllocated() >= this.byteLimit`: the allocator
        // getter is the first no-argument call on this class returning an object, followed by an
        // int getter on that object; the limit is the first int field of this class read here.
        val allocatorIndex = instructions.indexOfFirst { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            insn.opcode == Opcode.INVOKE_VIRTUAL && ref != null && ref.definingClass == method.definingClass &&
                ref.parameterTypes.isEmpty() && ref.returnType.startsWith("L")
        }
        if (allocatorIndex < 0) throw PatchException("Allocator getter not found")
        val allocatorGetter = (instructions[allocatorIndex] as ReferenceInstruction).reference as MethodReference
        val allocatedGetter = instructions.drop(allocatorIndex + 1).firstNotNullOfOrNull { insn ->
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf {
                it.definingClass == allocatorGetter.returnType && it.parameterTypes.isEmpty() && it.returnType == "I"
            }
        } ?: throw PatchException("Allocated-bytes getter not found")
        val byteLimitField = instructions.firstNotNullOfOrNull { insn ->
            ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf {
                insn.opcode == Opcode.IGET && it.definingClass == method.definingClass && it.type == "I"
            }
        } ?: throw PatchException("Byte limit field not found")

        // Final `iput-boolean decision, this, lastDecision; return decision`.
        val storeIndex = instructions.indices.last { i ->
            instructions[i].opcode == Opcode.IPUT_BOOLEAN && i + 1 < instructions.size &&
                instructions[i + 1].opcode == Opcode.RETURN &&
                (instructions[i + 1] as OneRegisterInstruction).registerA ==
                (instructions[i] as TwoRegisterInstruction).registerA
        }
        val decision = (instructions[storeIndex] as TwoRegisterInstruction).registerA

        // Seven scratch registers below 16 that do not hold the decision.
        val base = if (decision >= 7) 0 else decision + 1
        val impl = method.implementation!!
        val locals = impl.registerCount - method.parameterTypes.size - 1
        if (base + 7 > 16 || base + 7 > locals) {
            throw PatchException("No scratch registers in ${method.name} (decision v$decision, $locals locals)")
        }
        val r = (0 until 7).map { "v${base + it}" }
        fun ref(m: MethodReference) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
        fun ref(f: FieldReference) = "${f.definingClass}->${f.name}:${f.type}"
        fun ref(f: com.android.tools.smali.dexlib2.iface.Field) = "${f.definingClass}->${f.name}:${f.type}"
        val store = instructions[storeIndex] as TwoRegisterInstruction
        val storeField = (instructions[storeIndex] as ReferenceInstruction).reference as FieldReference

        // Branches into the store keep landing on its (replaced) first instruction.
        method.replaceInstruction(storeIndex, "move/from16 ${r[0]}, v$decision")
        method.addInstructions(
            storeIndex + 1,
            """
                move-object/from16 ${r[3]}, p0
                move-object/from16 ${r[6]}, p1
                invoke-virtual { ${r[3]} }, ${ref(allocatorGetter)}
                move-result-object ${r[1]}
                invoke-virtual { ${r[1]} }, ${ref(allocatedGetter)}
                move-result ${r[1]}
                iget ${r[2]}, ${r[3]}, ${ref(byteLimitField)}
                iget ${r[5]}, ${r[6]}, ${ref(speedField)}
                iget-wide ${r[3]}, ${r[6]}, ${ref(bufferedField)}
                invoke-static/range { ${r[0]} .. ${r[5]} }, $EXTENSION_CLASS->shouldContinueLoading(ZIIJF)Z
                move-result v$decision
                iput-boolean v$decision, v${store.registerB}, ${ref(storeField)}
            """,
        )
    }
}

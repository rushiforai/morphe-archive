/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.postparty

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val BUILDER_CLASS = "LV7/a;"
private const val TRANSCODE_FLAG_CLASS = "LBi/T;"
private const val TRANSCODE_FLAG_FIELD = "a"

private fun isStatic(method: MutableMethod): Boolean = (method.accessFlags and AccessFlags.STATIC.value) != 0

private fun constFor(reg: Int, value: Int): String = when {
    reg < 16 -> "const/4 v$reg, $value"
    reg < 256 -> "const/16 v$reg, $value"
    else -> throw PatchException("Register v$reg is too wide for a const instruction.")
}

private fun nullOutParam(method: MutableMethod, paramIndex: Int) {
    val impl = method.implementation
        ?: throw PatchException("${method.name} has no implementation.")

    val paramRegs = method.parameterTypes.sumOf {
        if (it.toString() == "J" || it.toString() == "D") 2 else 1
    } + if (isStatic(method)) 0 else 1

    val reg = impl.registerCount - paramRegs + paramIndex
    method.addInstruction(0, constFor(reg, 0))
}

@Suppress("unused")
val removeClipBumperPatch = patch(
    name = "Remove clip bumper",
    description = "Removes the Postparty logo bumper from all exports. NOTE: I SUCK AT CODING, USE *MODIFIED* CLIPS. TRIM A SECOND OR ADD A STICKER!",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "Postparty",
            packageName = "com.lifeonair.postparty",
            targets = listOf(AppTarget(version = "1.7.0")),
        ),
    )

    execute {
        val builders = mutableClassDefByOrNull(BUILDER_CLASS)
            ?: throw PatchException("$BUILDER_CLASS not found; class name drifted.")

        val flagClass = mutableClassDefByOrNull(TRANSCODE_FLAG_CLASS)
            ?: throw PatchException("$TRANSCODE_FLAG_CLASS not found; class name drifted.")

        val methods = builders.methods.filterIsInstance<MutableMethod>()

        val singleClip = methods.firstOrNull { m ->
            m.name == "h" &&
                m.returnType == "Ljava/lang/String;" &&
                m.parameterTypes.size == 8 &&
                isStatic(m)
        } ?: throw PatchException("V7.a.h single-clip builder not found.")

        val multiClip = methods.firstOrNull { m ->
            m.name == "l" &&
                m.returnType == "Ljava/lang/Object;" &&
                m.parameterTypes.size == 8 &&
                isStatic(m)
        } ?: throw PatchException("V7.a.l multi-clip builder not found.")

        nullOutParam(singleClip, 4)
        nullOutParam(multiClip, 2)

        val ctor = flagClass.methods
            .filterIsInstance<MutableMethod>()
            .firstOrNull { it.name == "<init>" }
            ?: throw PatchException("$TRANSCODE_FLAG_CLASS has no constructor.")

        val impl = ctor.implementation
            ?: throw PatchException("$TRANSCODE_FLAG_CLASS.<init> has no implementation.")

        val list = impl.instructions

        val idx = list.indexOfFirst { ins: Instruction ->
            if (ins.opcode != Opcode.IPUT_BOOLEAN) return@indexOfFirst false

            val ref = ins.getReference<FieldReference>() ?: return@indexOfFirst false
            ref.definingClass == TRANSCODE_FLAG_CLASS &&
                ref.name == TRANSCODE_FLAG_FIELD &&
                ref.type == "Z"
        }

        if (idx < 0) {
            throw PatchException("No IPUT_BOOLEAN to $TRANSCODE_FLAG_CLASS->$TRANSCODE_FLAG_FIELD:Z found.")
        }

        val valueReg = (list[idx] as TwoRegisterInstruction).registerA
        ctor.addInstruction(idx, constFor(valueReg, 1))

        val paramsClass = mutableClassDefByOrNull("LCi/f;")
            ?: throw PatchException("LCi/f; not found; class name drifted.")

        val paramsCtor = paramsClass.methods
            .filterIsInstance<MutableMethod>()
            .firstOrNull {
                it.name == "<init>" &&
                    it.parameterTypes.size == 5 &&
                    it.parameterTypes[0].toString() == "J"
            }
            ?: throw PatchException("Ci/f.<init>(J,Long,Long,Long,Long) not found.")

        paramsCtor.addInstructions(
            0,
            """
                if-nez p4, :morphe_edit_end_present
                invoke-static/range {p1 .. p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
                move-result-object p4
                :morphe_edit_end_present
            """.trimIndent(),
        )
    }
}

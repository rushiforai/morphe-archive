package app.morphe.patches.tv360

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation

private const val HUAWEI16_HOME_ACTIVITY = "Lcom/viettel/tv360/ui/home/HomeBoxActivity;"
private const val HUAWEI16_ORIENTATION_CALL = "Landroid/app/Activity;->setRequestedOrientation(I)V"
private const val HUAWEI16_ORIENTATION_HELPER =
    "$HUAWEI16_HOME_ACTIVITY->morpheHuawei16SensorOrientation(Landroid/app/Activity;I)V"

/**
 * Huawei TV360 Bitel 1.6 / versionCode 161 runtime rotation.
 *
 * Evidence from the untouched 1.6 APK's classes4.dex:
 * - HomeBoxActivity.v2(Z)V invokes Activity.setRequestedOrientation twice.
 * - HomeBoxActivity.onCreate(Bundle)V invokes it exactly once.
 *
 * Replaces only those three invokes, with an equal-width static invoke.
 * All other activities, login, player and licensing paths remain unmodified.
 * An invocation reference inventory alone does not validate the register
 * arrangement; each callsite's format and argument count are checked below.
 */
@Suppress("unused")
val tv360Huawei16SensorRotationRuntimePatch = bytecodePatch(
    name = "TV360 Bitel 1.6 - Sensor Rotation (Runtime)",
    description = "Applies device-sensor rotation to the home activity's three verified orientation requests.",
    default = false,
) {
    compatibleWith("com.bitel.tv360"("1.6"))
    dependsOn(tv360Huawei16SensorRotationPatch)

    execute {
        val home = Fingerprint(
            definingClass = HUAWEI16_HOME_ACTIVITY,
            name = "v2",
            returnType = "V",
            parameters = listOf("Z"),
        ).method
        val onCreate = Fingerprint(
            definingClass = HUAWEI16_HOME_ACTIVITY,
            name = "onCreate",
            returnType = "V",
            parameters = listOf("Landroid/os/Bundle;"),
        ).method

        fun replacements(
            methodName: String,
            instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
            expected: Int,
        ): List<Pair<Int, String>> {
            val matched = instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE) &&
                    (instruction as? ReferenceInstruction)?.reference?.toString() == HUAWEI16_ORIENTATION_CALL
            }
            if (matched.size != expected) {
                throw PatchException(
                    "Huawei 1.6 rotation: expected $expected orientation invokes in $methodName, found ${matched.size}"
                )
            }
            return matched.map { (index, instruction) ->
                val replacement = when (instruction.opcode) {
                    Opcode.INVOKE_VIRTUAL -> {
                        val args = instruction as? FiveRegisterInstruction
                            ?: throw PatchException("Huawei 1.6 rotation: invalid 35c in $methodName")
                        if (args.registerCount != 2) {
                            throw PatchException("Huawei 1.6 rotation: expected receiver+int in $methodName")
                        }
                        "invoke-static {v${args.registerC}, v${args.registerD}}, $HUAWEI16_ORIENTATION_HELPER"
                    }
                    Opcode.INVOKE_VIRTUAL_RANGE -> {
                        val args = instruction as? RegisterRangeInstruction
                            ?: throw PatchException("Huawei 1.6 rotation: invalid 3rc in $methodName")
                        if (args.registerCount != 2) {
                            throw PatchException("Huawei 1.6 rotation: expected two register words in $methodName")
                        }
                        "invoke-static/range {v${args.startRegister} .. v${args.startRegister + 1}}, $HUAWEI16_ORIENTATION_HELPER"
                    }
                    else -> throw PatchException("Huawei 1.6 rotation: unsupported invoke in $methodName")
                }
                index to replacement
            }
        }

        val homeInstructions = home.implementation?.instructions?.toList()
            ?: throw PatchException("Huawei 1.6 rotation: v2(Z) lacks implementation")
        val startInstructions = onCreate.implementation?.instructions?.toList()
            ?: throw PatchException("Huawei 1.6 rotation: onCreate lacks implementation")
        val homeChanges = replacements("v2(Z)", homeInstructions, 2)
        val startChanges = replacements("onCreate(Bundle)", startInstructions, 1)

        val activity = mutableClassDefBy(HUAWEI16_HOME_ACTIVITY)
        if (activity.methods.any { it.name == "morpheHuawei16SensorOrientation" }) {
            throw PatchException("Huawei 1.6 rotation: helper already defined")
        }

        val helper = ImmutableMethod(
            HUAWEI16_HOME_ACTIVITY,
            "morpheHuawei16SensorOrientation",
            listOf(
                ImmutableMethodParameter("Landroid/app/Activity;", null, null),
                ImmutableMethodParameter("I", null, null),
            ),
            "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable()
        helper.addInstructions(
            0,
            """
            const/16 p1, 0xa
            invoke-virtual {p0, p1}, Landroid/app/Activity;->setRequestedOrientation(I)V
            return-void
            """.trimIndent(),
        )
        activity.methods.add(helper)

        for ((index, instruction) in homeChanges.sortedByDescending { it.first }) {
            home.replaceInstruction(index, instruction)
        }
        for ((index, instruction) in startChanges.sortedByDescending { it.first }) {
            onCreate.replaceInstruction(index, instruction)
        }
    }
}

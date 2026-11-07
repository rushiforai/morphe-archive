package app.noam.patches.chesscom.misc.icon

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.chesscom.shared.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val ADAPTIVE_ICON = "Landroid/graphics/drawable/AdaptiveIconDrawable;"
private const val LAUNCHER_ICON = "Lcom/chess/launchericon/a;"

/**
 * Some devices (EMUI on Huawei, for one) return their own wrapper around the adaptive launcher
 * icon instead of [android.graphics.drawable.AdaptiveIconDrawable]. The app then drops the drawable
 * and asks Compose for the icon resource, which is an `<adaptive-icon>` XML that Compose cannot
 * read, and the notification prompt crashes.
 *
 * This keeps the drawable the system already returned, so the app's own `Drawable -> Bitmap`
 * conversion runs instead. That conversion handles any drawable, and on devices where the icon is
 * a real AdaptiveIconDrawable nothing changes.
 */
internal val launcherIconPatch = bytecodePatch(
    description = "Keeps the launcher icon the system returned when it is not a plain " +
        "AdaptiveIconDrawable, so the notification prompt does not crash on some EMUI devices.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        class Target(val type: String, val name: String, val parameters: String, val index: Int)
        val targets = mutableListOf<Target>()

        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                val list = implementation.instructions.toList()

                val adaptive = list.indexOfFirst {
                    it.opcode == Opcode.INSTANCE_OF && it is ReferenceInstruction &&
                        (it.reference as? TypeReference)?.type == ADAPTIVE_ICON
                }
                if (adaptive < 0) return@forEach

                val launcher = list.any {
                    (it.opcode == Opcode.CONST_HIGH16 &&
                        (it as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f100000) ||
                        (it is ReferenceInstruction && (it.reference as? FieldReference)?.let { field ->
                            field.definingClass == LAUNCHER_ICON && field.name == "a"
                        } == true)
                }
                if (!launcher) return@forEach

                // Right after the check is the branch to the "not an AdaptiveIconDrawable" path.
                val branch = list.getOrNull(adaptive + 1) ?: return@forEach
                if (branch.opcode != Opcode.IF_EQZ) return@forEach
                val branchOffset = (branch as? OffsetInstruction)?.codeOffset ?: return@forEach
                var address = 0
                val addresses = IntArray(list.size) { index -> address.also { address += list[index].codeUnits } }
                val targetAddress = addresses[adaptive + 1] + branchOffset
                val fallback = addresses.indexOfFirst { it == targetAddress }
                if (fallback < 0) return@forEach
                val dropped = list.getOrNull(fallback) ?: return@forEach
                val isDrop = when (dropped.opcode) {
                    Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16 -> true
                    Opcode.CONST_4 -> (dropped as? NarrowLiteralInstruction)?.narrowLiteral == 0
                    else -> false
                }
                if (!isDrop) return@forEach

                targets += Target(
                    classDef.type, method.name, method.parameterTypes.joinToString(""), fallback,
                )
            }
        }

        targets.forEach { target ->
            mutableClassDefBy(target.type).methods.first {
                it.name == target.name && it.parameterTypes.joinToString("") == target.parameters
            }.apply {
                // Leave the drawable in its register; the app's Drawable -> Bitmap code takes over.
                replaceInstructions(target.index, "nop")
            }
        }
        // Versions without this prompt are left alone; the patch is a compatibility fix, not a feature.
    }
}

package app.fakh.patches.muslimpro

import app.fakh.patches.muslimpro.shared.Constants.COMPATIBILITY_MUSLIMPRO
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The `ARewardsWidget` composable that puts the Alipay+ Rewards card in the Today feed. Compose's trace string names
 * it; the class and method names around it are R8-renamed. Returning at once emits nothing, so the card is not drawn.
 */
private object ARewardsWidgetFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("com.bitsmedia.android.alipay.compose.ARewardsWidget (ARewardsWidget.kt:19)"),
)

/** The rewards icon in the Today header (`GamificationIcon`, the cube with the Alipay+ points counter). */
private object GamificationIconFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("com.bitsmedia.android.timelinev2.presentation.components.header.GamificationIcon (TodayHeader.kt:216)"),
)

/** `TodayHeader`, which draws the cube icon inline as an `Image` of a vector (R8-renamed class, found by its trace string). */
private object TodayHeaderFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("com.bitsmedia.android.timelinev2.presentation.components.header.TodayHeader (TodayHeader.kt:77)"),
)

private const val DRAWABLE_HEADER_CUBE = 0x7f0806e8

@Suppress("unused")
val hideRewardsPatch = patch(
    name = "Hide Alipay+ Rewards",
    description = "Removes the Alipay+ Rewards card and the cube icon in the header.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MUSLIMPRO)
    category("Ads")

    execute {
        ARewardsWidgetFingerprint.method.addInstructions(0, "return-void")
        GamificationIconFingerprint.method.addInstructions(0, "return-void")

        // The header draws the cube inline in two branches: a painterResource of the vector, then Image(...).
        val header = TodayHeaderFingerprint.method
        val instructions = header.implementation!!.instructions.toList()
        val images = instructions.indices.filter {
            (instructions[it] as? NarrowLiteralInstruction)?.narrowLiteral == DRAWABLE_HEADER_CUBE
        }.map { literal ->
            (literal + 1 until instructions.size).first {
                ((instructions[it] as? ReferenceInstruction)?.reference as? MethodReference)?.name == "Image"
            }
        }
        if (images.size != 2) throw PatchException("Expected 2 header cube images, found ${images.size}")
        images.forEach { header.replaceInstruction(it, "nop") }
    }
}

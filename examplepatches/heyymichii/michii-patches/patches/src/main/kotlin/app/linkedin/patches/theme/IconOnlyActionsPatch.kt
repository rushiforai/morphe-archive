package app.linkedin.patches.theme

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/ActionBarStyle;"

/**
 * The measure policy of an SDUI button bar (ButtonBarKt.ButtonBarLayout): picks the bar's ButtonRenderMode from its
 * width and sets it with buttonRenderMode.setValue(mode).
 */
private object ButtonBarMeasureFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/infra/sdui/components/buttonbar/ButtonBarKt\$ButtonBarLayout\$1\$1;",
    name = "measure-3p2s80s",
)

@Suppress("unused")
val iconOnlyActionsPatch = bytecodePatch(
    name = "Icon-only post actions",
    description = "Adds a switch in Michii Patches to show the Like, Comment, Repost and Send buttons under posts " +
        "without their labels.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        ButtonBarMeasureFingerprint.method.apply {
            val setValue = implementation!!.instructions.indexOfFirst { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                instruction.opcode == Opcode.INVOKE_VIRTUAL && reference?.name == "setValue" &&
                    reference.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;")
            }
            if (setValue < 0) throw PatchException("Render mode setValue not found")
            val mode = getInstruction<FiveRegisterInstruction>(setValue).registerD
            // Later index first, so the method start insert does not shift it.
            addInstructions(
                setValue,
                """
                    invoke-static { v$mode }, $EXTENSION_CLASS->renderMode(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$mode
                """
            )
            addInstructions(0, "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onBarMeasure(Ljava/lang/Object;)V")
        }
        markIncluded("isIconOnlyActionsIncluded")
    }
}

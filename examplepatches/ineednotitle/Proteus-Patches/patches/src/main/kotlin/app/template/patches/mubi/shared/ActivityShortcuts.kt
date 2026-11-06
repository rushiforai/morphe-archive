package app.template.patches.mubi.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Makes [className] finish itself immediately after its onCreate() super call.
 *
 * Used for MUBI screens that exist only to nag or upsell (the upgrade screen and
 * the TV exit confirmation). The activity is still declared in the manifest, so
 * any internal `startActivity` succeeds; it simply closes before rendering.
 *
 * Returns false when the class, onCreate(Bundle) or the super call is missing, so
 * callers can leave the stock behavior in place.
 */
internal fun BytecodePatchContext.finishActivityOnCreate(className: String): Boolean {
    val classDef = mutableClassDefByOrNull(className) ?: return false

    val onCreate = classDef.methods.firstOrNull { method ->
        method.name == "onCreate" &&
            method.parameterTypes == listOf("Landroid/os/Bundle;") &&
            method.returnType == "V"
    } ?: return false

    val instructions = onCreate.implementation?.instructions?.toList() ?: return false

    val superCallIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_SUPER &&
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.name == "onCreate"
    }
    if (superCallIndex < 0) return false

    onCreate.addInstructions(
        superCallIndex + 1,
        """
            invoke-virtual {p0}, Landroid/app/Activity;->finish()V
            return-void
        """.trimIndent(),
    )
    return true
}

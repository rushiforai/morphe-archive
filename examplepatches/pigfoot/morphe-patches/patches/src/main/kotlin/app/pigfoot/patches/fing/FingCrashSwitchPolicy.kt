package app.pigfoot.patches.fing

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

internal const val FING_PRIVACY_ACTIVITY = "Lcom/overlook/android/fing/ui/settings/PrivacySettingsActivity;"

/** Reflect enforced collection policy without rewriting stored preferences or shared callbacks. */
internal fun applyFingCrashSwitchPolicy(method: MutableMethod) {
    require(method.definingClass == FING_PRIVACY_ACTIVITY && method.name == "onCreate" &&
        method.fingDescriptor() == "(Landroid/os/Bundle;)V") { "Unsupported Fing privacy UI target" }
    val instructions = requireNotNull(method.implementation).instructions.toList()
    fun ref(index: Int) = (instructions.getOrNull(index) as? ReferenceInstruction)?.reference?.toString()
    val reads = instructions.indices.filter {
        ref(it) == "Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z" &&
            ref(it - 1) == "crash_reporting_enabled"
    }
    val checkedCalls = instructions.indices.filter {
        ref(it) == "Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V"
    }
    require(reads.size == 1 && checkedCalls.size == 1) { "Missing or ambiguous Fing crash switch flow" }
    val read = reads.single()
    val checked = checkedCalls.single()
    val call = instructions[checked] as FiveRegisterInstruction
    require(call.registerCount == 2 && checked == read + 2 &&
        instructions[read + 1].opcode == Opcode.MOVE_RESULT &&
        (instructions[read + 1] as OneRegisterInstruction).registerA == call.registerD &&
        call.registerD in 0..15) { "Unsupported Fing crash switch register flow" }
    val view = call.registerC
    val value = call.registerD
    // Insert backwards so indices refer to the original validated method.
    method.addInstructions(checked + 1,
        "invoke-virtual {v$view, v$value}, Landroid/view/View;->setEnabled(Z)V")
    method.addInstructions(checked, "const/4 v$value, 0x0")
}

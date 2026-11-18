package app.template.patches.pizzabusiness

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** MicroG mode: stock GMS update UI cannot update the selected Games service. */
internal fun BytecodePatchContext.suppressPizzaPlayServicesUpdatePrompts() {
    val owner = "Lcom/google/android/gms/common/GoogleApiAvailability;"
    val result = "Lcom/google/android/gms/common/ConnectionResult;"
    val listener = "Landroid/content/DialogInterface\$OnCancelListener;"
    val activity = "Lcom/google/android/gms/common/api/GoogleApiActivity;"
    // Match transport/UI contracts, not R8 method names or lifecycle-interface names.
    fun discover(parameters: (List<String>) -> Boolean) = classDefBy(owner).methods.filter {
        it.returnType == "V" && parameters(it.parameterTypes.map(CharSequence::toString))
    }.let { matches ->
        requirePizza(matches.size == 1, "Play services UI role missing or ambiguous")
        val method = matches.single()
        pizzaMethod(owner, method.name, method.parameterTypes.map(CharSequence::toString), "V", static = false)
    }
    val notify = discover { it == listOf("Landroid/content/Context;", result) }
    val direct = discover { it == listOf(activity, "I", activity) }
    val lifecycle = discover { it.size == 4 && it[0] == "Landroid/app/Activity;" && it[2] == "I" && it[3] == listener }
    val original = notify.instructions.toList()
    val loadIndex = original.indexOfFirst {
        val field = (it as? ReferenceInstruction)?.reference as? FieldReference
        it.opcode == Opcode.IGET && field?.definingClass == result && field.type == "I"
    }
    requirePizza(loadIndex in 0..16 && notify.hasString("GMS core API Availability. ConnectionResult=") &&
        notify.calls("Landroid/app/NotificationManager;", "notify") &&
        notify.calls("Landroid/os/Handler;", "sendEmptyMessageDelayed"), "Play services notification flow changed")
    val errorRegister = (original[loadIndex] as TwoRegisterInstruction).registerA
    val firstBody = original[loadIndex + 1]
    val scratch = (firstBody as OneRegisterInstruction).registerA
    requirePizza(firstBody.opcode == Opcode.CONST_STRING && errorRegister != scratch &&
        errorRegister in 0..15 && scratch in 0..15, "Play services notification scratch register changed")
    listOf(direct, lifecycle).forEach { method ->
        val calls = method.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        requirePizza(method.hasString("GooglePlayServicesErrorDialog") &&
            calls.any { it.definingClass == owner && it.returnType == "Landroid/app/AlertDialog;" } &&
            calls.any { it.definingClass == owner && it.returnType == "V" && "Landroid/app/AlertDialog;" in it.parameterTypes } &&
            method.instructions.first().opcode == Opcode.CONST_STRING &&
            (method.instructions.first() as OneRegisterInstruction).registerA == 0 &&
            method.implementation!!.tryBlocks.isEmpty(), "Play services dialog flow changed")
    }

    // Keep real availability/error results. Only SERVICE_VERSION_UPDATE_REQUIRED
    // (2) and SERVICE_UPDATING (18) UI/retry scheduling is suppressed, in MicroG
    // mode only. In particular SIGN_IN_REQUIRED/RESOLUTION_REQUIRED is retained.
    notify.addInstructionsWithLabels(loadIndex + 1, """
        const/4 v$scratch, 0x2
        if-eq v$errorRegister, v$scratch, :dudeks_no_stock_update_notification
        const/16 v$scratch, 0x12
        if-ne v$errorRegister, v$scratch, :dudeks_original_notification
        :dudeks_no_stock_update_notification
        return-void
    """.trimIndent(), ExternalLabel("dudeks_original_notification", firstBody))

    listOf(Triple(direct, "p2", "p3"), Triple(lifecycle, "p3", "p4")).forEach { (method, error, cancel) ->
        val entry = method.instructions.first()
        method.addInstructionsWithLabels(0, """
            const/4 v0, 0x2
            if-eq $error, v0, :dudeks_cancel_stock_update
            const/16 v0, 0x12
            if-ne $error, v0, :dudeks_original_update_dialog
            :dudeks_cancel_stock_update
            if-eqz $cancel, :dudeks_update_dismissed
            const/4 v0, 0x0
            invoke-interface {$cancel, v0}, $listener->onCancel(Landroid/content/DialogInterface;)V
            :dudeks_update_dismissed
            return-void
        """.trimIndent(), ExternalLabel("dudeks_original_update_dialog", entry))
    }
}

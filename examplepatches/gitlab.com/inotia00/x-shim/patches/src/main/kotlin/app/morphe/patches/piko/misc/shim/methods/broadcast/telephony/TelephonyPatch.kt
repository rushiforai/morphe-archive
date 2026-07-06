package app.morphe.patches.piko.misc.shim.methods.broadcast.telephony

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.piko.misc.shim.methods.advancedModeEnabled
import app.morphe.patches.piko.misc.shim.methods.onReceiveFingerprint
import app.morphe.patches.piko.misc.shim.methods.patchModeCheckPatch
import app.morphe.patches.piko.util.cleanup
import app.morphe.patches.piko.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

val telephonyPatch = bytecodePatch(
    description = "Telephony",
) {
    dependsOn(patchModeCheckPatch)

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        val (helperField1, helperMethod, helperField2) =
            with(ConnectivityChangedListenerFingerprint) {
                Triple(
                    getReference<FieldReference>(0)!!,
                    getReference<MethodReference>(1)!!,
                    getReference<FieldReference>(2)!!
                )
            }

        val telephonyConstructorFingerprint = Fingerprint(
            definingClass = TELEPHONY_CLASS_PREFIX,
            name = "<init>",
            parameters = listOf(helperField1.definingClass),
            filters = listOf(
                fieldAccess(
                    opcode = Opcode.IPUT_OBJECT,
                    definingClass = "this",
                    type = TELEPHONY_CLASS_PREFIX
                )
            ),
            custom = { _, classDef ->
                classDef.methods.count() > 2
            }
        )

        val localField = telephonyConstructorFingerprint.getReference<FieldReference>()!!

        onReceiveFingerprint(localField.definingClass).method.apply {
            cleanup()
            addInstructions(
                0,
                """
                    iget-object p1, p0, $localField
                    iget-object p2, p1, $helperField1
                    invoke-virtual { p2 }, $helperMethod
                    move-result p2
                    iput-boolean p2, p1, $helperField2
                    return-void
                """
            )
        }
    }
}

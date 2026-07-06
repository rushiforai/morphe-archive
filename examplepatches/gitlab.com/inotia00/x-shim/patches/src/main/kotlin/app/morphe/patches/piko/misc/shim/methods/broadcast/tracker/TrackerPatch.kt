package app.morphe.patches.piko.misc.shim.methods.broadcast.tracker

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.piko.misc.shim.methods.advancedModeEnabled
import app.morphe.patches.piko.misc.shim.methods.kotlin.kotlinHelperPatch
import app.morphe.patches.piko.misc.shim.methods.kotlin.onReceiveParameterCheckInstruction
import app.morphe.patches.piko.misc.shim.methods.onReceiveFingerprint
import app.morphe.patches.piko.misc.shim.methods.patchModeCheckPatch
import app.morphe.patches.piko.util.cleanup
import app.morphe.patches.piko.util.findField
import app.morphe.patches.piko.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

val trackerPatch = bytecodePatch(
    description = "Tracker",
) {
    dependsOn(
        kotlinHelperPatch,
        patchModeCheckPatch
    )

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        val trackerClass = TrackerUnregisterReceiverFingerprint
            .getReference<FieldReference>(1)!!
            .type

        val localField = trackerClass.findField {
            type.startsWith(ANDROIDX_TRACKERS_CLASS_PREFIX)
        }

        val syntheticFingerprint = Fingerprint(
            definingClass = trackerClass,
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.SYNTHETIC),
            returnType = "V",
            filters = listOf(
                methodCall(
                    definingClass = localField.type,
                    parameters = listOf("Landroid/content/Intent;"),
                    returnType = "V"
                )
            )
        )

        val helperMethod = syntheticFingerprint.getReference<MethodReference>()!!

        onReceiveFingerprint(trackerClass).method.apply {
            cleanup()
            addInstructions(
                0,
                onReceiveParameterCheckInstruction + """
                    iget-object p1, p0, $localField
                    invoke-virtual { p1, p2 }, $helperMethod
                    return-void
                """
            )
        }
    }
}

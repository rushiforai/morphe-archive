package app.morphe.patches.piko.misc.shim.methods.broadcast.stuffing

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
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

val stuffingPatch = bytecodePatch(
    description = "Stuffing",
) {
    dependsOn(
        kotlinHelperPatch,
        patchModeCheckPatch
    )

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        val stuffingClass = StuffingFingerprint
            .getReference<TypeReference>(1)!!
            .type

        val localField = stuffingClass.findField()

        val helperMethodFingerprint = Fingerprint(
            definingClass = stuffingClass,
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.SYNTHETIC),
            returnType = "Z",
            filters = listOf(
                methodCall(
                    returnType = "Z"
                )
            )
        )

        val helperMethod = helperMethodFingerprint.getReference<MethodReference>()!!

        onReceiveFingerprint(stuffingClass).method.apply {
            cleanup()
            addInstructions(
                0,
                onReceiveParameterCheckInstruction + """
                    iget-object p1, p0, $localField
                    sget-object p2, Lkotlin/Unit;->a:Lkotlin/Unit;
                    invoke-virtual {p1, p2}, $helperMethod
                    return-void
                """
            )
        }
    }
}

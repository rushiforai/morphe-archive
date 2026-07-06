package app.morphe.patches.piko.misc.shim.methods.broadcast.bug

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
import app.morphe.patches.piko.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

val bugReporterPatch = bytecodePatch(
    description = "BugReporter",
) {
    dependsOn(
        kotlinHelperPatch,
        patchModeCheckPatch
    )

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        val bugReporterClass = BugReporterFingerprint
            .getReference<TypeReference>()!!
            .type

        val (helperField, helperMethod1) = with(BugReportMenuFingerprint) {
            Pair(
                getReference<FieldReference>()!!,
                getReference<MethodReference>(1)!!,
            )
        }

        val syntheticFingerprint = Fingerprint(
            definingClass = bugReporterClass,
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.SYNTHETIC),
            returnType = "V",
            filters = listOf(
                methodCall(
                    definingClass = BUG_REPORTER_CLASS_PREFIX,
                    parameters = listOf(),
                    returnType = "V"
                )
            )
        )

        val helperMethod2 = syntheticFingerprint.getReference<MethodReference>()!!

        onReceiveFingerprint(bugReporterClass).method.apply {
            cleanup()
            addInstructions(
                0,
                onReceiveParameterCheckInstruction + """
                    sget-object p1, $helperField
                    invoke-virtual { p1 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                    invoke-static { }, $helperMethod1
                    move-result-object p1
                    invoke-interface { p1 }, $helperMethod2
                    return-void
                """
            )
        }
    }
}

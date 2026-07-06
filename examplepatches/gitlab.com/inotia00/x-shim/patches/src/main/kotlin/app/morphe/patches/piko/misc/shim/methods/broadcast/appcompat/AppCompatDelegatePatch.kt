package app.morphe.patches.piko.misc.shim.methods.broadcast.appcompat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.piko.misc.shim.methods.advancedModeEnabled
import app.morphe.patches.piko.misc.shim.methods.onReceiveFingerprint
import app.morphe.patches.piko.misc.shim.methods.patchModeCheckPatch
import app.morphe.patches.piko.util.cleanup
import app.morphe.patches.piko.util.findField
import app.morphe.patches.piko.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

val appCompatDelegatePatch = bytecodePatch(
    description = "AppCompatDelegate",
) {
    dependsOn(patchModeCheckPatch)

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        val appCompatDelegateClass = AppCompatDelegateImplFingerprint
            .getReference<TypeReference>(1)!!
            .type

        val localField = appCompatDelegateClass.findField {
            type.startsWith(APP_COMPAT_DELEGATE_CLASS_PREFIX)
        }

        val helperMethodFingerprint = Fingerprint(
            definingClass = appCompatDelegateClass,
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.SYNTHETIC),
            parameters = listOf(localField.type),
            filters = listOf(
                methodCall(
                    definingClass = localField.type,
                    returnType = "V"
                )
            )
        )

        val helperMethod = helperMethodFingerprint.getReference<MethodReference>()!!

        onReceiveFingerprint(appCompatDelegateClass).method.apply {
            cleanup()
            addInstructions(
                0,
                """
                    iget-object p1, p0, $localField
                    invoke-virtual { p1 }, $helperMethod
                    return-void
                """
            )
        }
    }
}

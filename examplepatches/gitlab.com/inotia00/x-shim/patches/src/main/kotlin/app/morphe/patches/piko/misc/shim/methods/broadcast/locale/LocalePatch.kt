package app.morphe.patches.piko.misc.shim.methods.broadcast.locale

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

val localePatch = bytecodePatch(
    description = "Locale",
) {
    dependsOn(patchModeCheckPatch)

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        val localeClass = LocaleFingerprint
            .getReference<TypeReference>()!!
            .type

        val localField = localeClass.findField {
            type.startsWith(LOCALE_CLASS_PREFIX)
        }

        val syntheticFingerprint = Fingerprint(
            definingClass = localeClass,
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.SYNTHETIC),
            returnType = "V",
            filters = listOf(
                methodCall(
                    definingClass = LOCALE_CLASS_PREFIX,
                    returnType = "V"
                )
            )
        )

        val helperMethod = syntheticFingerprint
            .getReference<MethodReference>()!!

        onReceiveFingerprint(localeClass).method.apply {
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

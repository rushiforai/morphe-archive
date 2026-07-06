package app.morphe.patches.piko.misc.shim.methods.broadcast.media3

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.piko.misc.shim.methods.advancedModeEnabled
import app.morphe.patches.piko.misc.shim.methods.onReceiveFingerprint
import app.morphe.patches.piko.misc.shim.methods.patchModeCheckPatch
import app.morphe.patches.piko.util.cleanup
import app.morphe.patches.piko.util.findField
import app.morphe.patches.piko.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

val mediaUtilPatch = bytecodePatch(
    description = "MediaUtil",
) {
    dependsOn(patchModeCheckPatch)

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        val mediaUtilClass = RunnableFingerprint
            .getReference<TypeReference>(1)!!
            .type

        val methodUtilFingerprint = onReceiveFingerprint(mediaUtilClass)
        val localField = methodUtilFingerprint.findField {
            type.startsWith(MEDIA_UTIL_CLASS_PREFIX)
        }

        var helperMethod: MutableMethod? = null
        var requiredPackedSwitch = false

        try {
            helperMethod = ConnectivityManagerConstructorFingerprint.method
            requiredPackedSwitch = true
        } catch (_: Exception) {
        }

        if (helperMethod == null) {
            try {
                helperMethod = ConnectivityManagerConstructorLegacyFingerprint.method
            } catch (_: Exception) {
                throw PatchException("Failed to match the fingerprint: ConnectivityManagerConstructorFingerprint")
            }
        }

        val syntheticInstructions = if (requiredPackedSwitch) """
            const/4 v1, 0x0
            invoke-direct { v0, v1, p0, p1 }, $helperMethod
        """ else """
            invoke-direct { v0, p0, p1 }, $helperMethod
        """

        val executorField = localField.type.findField {
            type == "Ljava/util/concurrent/Executor;"
        }

        onReceiveFingerprint(mediaUtilClass).method.apply {
            cleanup()
            addInstructions(
                0,
                """
                    iget-object p2, p0, $localField
                    iget-object p2, p2, $executorField
                    new-instance v0, ${helperMethod.definingClass}
                """ + syntheticInstructions + """
                    invoke-interface { p2, v0 }, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
                    return-void
                """
            )
        }
    }
}

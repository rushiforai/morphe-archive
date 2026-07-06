package app.morphe.patches.piko.misc.shim.methods.async

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.piko.misc.shim.methods.advancedModeEnabled
import app.morphe.patches.piko.misc.shim.methods.patchModeCheckPatch
import app.morphe.patches.piko.util.cleanup
import app.morphe.patches.piko.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

val asyncTaskPatch = bytecodePatch(
    description = "ASyncTask",
) {
    dependsOn(patchModeCheckPatch)

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        mapOf(
            InteractiveMediaHelperFieldFingerprint to InteractiveMediaASyncTaskReferenceFingerprint,
            InternalAdsHelperFieldFingerprint to InternalAdsASyncTaskReferenceFingerprint,
        ).forEach { (helperFingerprint, referenceFingerprint) ->
            val smaliInstructions = with(helperFingerprint) {
                val classReference = getReference<FieldReference>()!!
                val jsonReference = getReference<FieldReference>(1)!!

                """
                    iget-object p1, p0, $classReference
                    const/4 v0, 0x0
                    iput-object v0, p1, $jsonReference
                    return-object v0
                """
            }

            val asyncTaskClass = referenceFingerprint
                .getReference<TypeReference>(5)!!
                .type

            val asyncTaskFingerprint = Fingerprint(
                definingClass = asyncTaskClass,
                name = "doInBackground",
                accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
                returnType = "Ljava/lang/Object;",
                parameters = listOf("[Ljava/lang/Object;")
            )

            asyncTaskFingerprint.method.apply {
                cleanup()
                addInstructions(0, smaliInstructions)
            }
        }
    }
}

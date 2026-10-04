package app.morphe.patches.googlephotos.misc.features

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.googlephotos.misc.extension.sharedExtensionPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val localCreationDownloaderPatch = bytecodePatch(
    name = "Local creation downloader",
    description = "Intercepts saving memory collages and creations, exporting them to the device Google Photos folder (DCIM/Google Photos) for quota-free backup instead of direct cloud library commits.",
    default = true,
) {
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)
    dependsOn(sharedExtensionPatch)

    execute {
        var patched = false

        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lapp/morphe/")) return@classDefForEach

            // Identify SaveCreationMixin: class containing string constant "SaveCreationMixin"
            val hasSaveCreationMixin = classDef.methods.any { method ->
                method.implementation?.instructions?.any { instruction ->
                    (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
                    ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == "SaveCreationMixin"
                } == true
            }

            if (hasSaveCreationMixin) {
                // Find save execution method returning boolean (Z) with SavePendingItemsOptimisticTask
                val saveMethod = classDef.methods.find { method ->
                    method.returnType == "Z" &&
                    method.parameterTypes.size == 2 &&
                    method.implementation?.instructions?.any { instruction ->
                        (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
                        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == "SavePendingItemsOptimisticTask"
                    } == true
                }

                if (saveMethod != null) {
                    val mutableClass = mutableClassDefBy(classDef)
                    val mutableMethod = mutableClass.findMutableMethodOf(saveMethod)

                    mutableMethod.addInstructions(
                        0,
                        """
                        invoke-static { p0, p1 }, Lapp/morphe/extension/shared/patches/LocalCreationDownloader;->onSaveRequested(Ljava/lang/Object;Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :cond_morphe_fallback
                        const/4 v0, 0x1
                        return v0
                        :cond_morphe_fallback
                        """.trimIndent(),
                    )

                    // Find isSaved check method returning boolean (Z) with 1 parameter (Lakxr->e(Lbwel;)Z)
                    val isSavedMethod = classDef.methods.find { method ->
                        method.returnType == "Z" && method.parameterTypes.size == 1
                    }
                    if (isSavedMethod != null) {
                        val mutableIsSavedMethod = mutableClass.findMutableMethodOf(isSavedMethod)
                        mutableIsSavedMethod.addInstructions(
                            0,
                            """
                            invoke-static { p1 }, Lapp/morphe/extension/shared/patches/LocalCreationDownloader;->isCreationSaved(Ljava/lang/Object;)Z
                            move-result v0
                            if-eqz v0, :cond_orig_is_saved
                            const/4 v0, 0x1
                            return v0
                            :cond_orig_is_saved
                            """.trimIndent(),
                        )
                    }

                    patched = true
                }
            }
        }

        if (!patched) {
            throw PatchException("Could not find SaveCreationMixin or its save execution method.")
        }
    }
}

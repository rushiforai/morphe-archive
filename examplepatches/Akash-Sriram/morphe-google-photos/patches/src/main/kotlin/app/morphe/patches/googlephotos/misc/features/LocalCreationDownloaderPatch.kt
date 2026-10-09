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
        var patchedSaveMixin = false
        var patchedMfyMixin = false

        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lapp/morphe/")) return@classDefForEach

            val stringConstants = buildSet {
                classDef.methods.forEach { method ->
                    method.implementation?.instructions?.forEach { instruction ->
                        if (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                            ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string?.let { add(it) }
                        }
                    }
                }
            }

            // 1. Identify SaveCreationMixin: class containing string constant "SaveCreationMixin"
            if ("SaveCreationMixin" in stringConstants) {
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

                    patchedSaveMixin = true
                }
            }

            // 2. Identify MFYCreationMixin: Made-For-You creations in Create tab
            if ("MFYCreationMixin" in stringConstants) {
                val mfySaveMethod = classDef.methods.find { method ->
                    method.returnType == "V" &&
                    method.parameterTypes.size == 3 &&
                    method.parameterTypes[1] == "Ljava/lang/String;" &&
                    method.parameterTypes[2] == "Z"
                }
                if (mfySaveMethod != null) {
                    val mutableClass = mutableClassDefBy(classDef)
                    val mutableMethod = mutableClass.findMutableMethodOf(mfySaveMethod)
                    mutableMethod.addInstructions(
                        0,
                        """
                        invoke-static/range { p0 .. p2 }, Lapp/morphe/extension/shared/patches/LocalCreationDownloader;->onMfySaveRequested(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Z
                        move-result v0
                        if-eqz v0, :cond_orig_mfy
                        return-void
                        :cond_orig_mfy
                        """.trimIndent(),
                    )
                    patchedMfyMixin = true
                }

                val bindMethod = classDef.methods.find { method ->
                    method.name == "gc" || (method.parameterTypes.size == 3 && method.parameterTypes[0] == "Landroid/content/Context;" && method.parameterTypes[2] == "Landroid/os/Bundle;")
                }
                if (bindMethod != null) {
                    val mutableClass = mutableClassDefBy(classDef)
                    val mutableBindMethod = mutableClass.findMutableMethodOf(bindMethod)
                    mutableBindMethod.addInstructions(
                        0,
                        """
                        invoke-static { p0 }, Lapp/morphe/extension/shared/patches/LocalCreationDownloader;->onMfyMixinBound(Ljava/lang/Object;)V
                        """.trimIndent(),
                    )
                }
            }

            // 3. Identify MFYSectionDelegate: Create tab hero card presenter
            if ("MFYSectionDelegate" in stringConstants) {
                val cardMethod = classDef.methods.find { method ->
                    method.parameterTypes.size == 2 &&
                    method.parameterTypes[0] == "Ljava/lang/String;" &&
                    method.returnType != "V" &&
                    method.returnType != "Z"
                }
                if (cardMethod != null) {
                    val mutableClass = mutableClassDefBy(classDef)
                    val mutableCardMethod = mutableClass.findMutableMethodOf(cardMethod)
                    mutableCardMethod.addInstructions(
                        0,
                        """
                        invoke-static/range { p0 .. p2 }, Lapp/morphe/extension/shared/patches/LocalCreationDownloader;->onCheckHeroCardSaved(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
                        """.trimIndent(),
                    )
                }

                val heroSaveMethod = classDef.methods.find { method ->
                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] != "Z" &&
                    method.parameterTypes[0] != "I" &&
                    method.parameterTypes[0] != "Ljava/lang/String;" &&
                    cardMethod != null && method.parameterTypes[0] != cardMethod.returnType &&
                    method.returnType == "V"
                }
                if (heroSaveMethod != null) {
                    val mutableClass = mutableClassDefBy(classDef)
                    val mutableHeroSaveMethod = mutableClass.findMutableMethodOf(heroSaveMethod)
                    mutableHeroSaveMethod.addInstructions(
                        0,
                        """
                        invoke-static/range { p0 .. p1 }, Lapp/morphe/extension/shared/patches/LocalCreationDownloader;->onCreateHeroSaveRequested(Ljava/lang/Object;Ljava/lang/Object;)V
                        """.trimIndent(),
                    )
                }
            }
        }

        if (!patchedSaveMixin) {
            throw PatchException("Could not find SaveCreationMixin or its save execution method.")
        }
        if (!patchedMfyMixin) {
            throw PatchException("Could not find MFYCreationMixin or its save method.")
        }
    }
}

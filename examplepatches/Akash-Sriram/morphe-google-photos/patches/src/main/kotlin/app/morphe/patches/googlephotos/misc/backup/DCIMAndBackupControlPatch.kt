package app.morphe.patches.googlephotos.misc.backup

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.googlephotos.misc.extension.sharedExtensionPatch
import app.morphe.patches.googlephotos.misc.features.MfyCreationMixinFingerprint
import app.morphe.patches.googlephotos.misc.features.MfySectionDelegateFingerprint
import app.morphe.patches.googlephotos.misc.features.SaveCreationMixinFingerprint
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.cloneMutable
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.indexOfFirstStringInstructionOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

@Suppress("unused")
val dcimAndBackupControlPatch = bytecodePatch(
    name = "DCIM & backup control",
    description = "Disables always on backup for the Camera and other DCIM folders, allowing individual folder control, " +
        "and exports memory collages and creations to DCIM/Google Photos for quota-free backup.",
    default = true,
) {
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)
    dependsOn(sharedExtensionPatch)

    execute {
        // =========================================================================
        // 1. DCIM Folders Backup Control
        // =========================================================================
        val method = InCameraFolderSetterFingerprint.methodOrNull
        if (method != null) {
            val classDef = mutableClassDefBy(method.definingClass)

            // Find the filepath field name and descriptor type
            var filepathFieldName: String? = null
            var filepathFieldType: String? = null

            classDef.methods.forEach { m ->
                if (m.implementation?.instructions?.any {
                        it.getReference<StringReference>()?.string == "Null filepath"
                    } == true) {
                    m.implementation!!.instructions.forEach { instr ->
                        if (instr.opcode == Opcode.IPUT_OBJECT) {
                            val fieldRef = instr.getReference<FieldReference>()!!
                            filepathFieldName = fieldRef.name
                            filepathFieldType = fieldRef.type
                        }
                    }
                }
            }

            if (filepathFieldName != null && filepathFieldType != null) {
                val N = method.implementation!!.registerCount
                val isOptional = filepathFieldType.contains("Optional")

                val patchInstructions = buildList {
                    add("iget-object v$N, p0, ${classDef.type}->$filepathFieldName:$filepathFieldType")
                    add("if-eqz v$N, :cond_skip")
                    if (isOptional) {
                        add("invoke-virtual {v$N}, $filepathFieldType->isPresent()Z")
                        add("move-result v${N+1}")
                        add("if-eqz v${N+1}, :cond_skip")
                        add("invoke-virtual {v$N}, $filepathFieldType->get()Ljava/lang/Object;")
                        add("move-result-object v$N")
                    }
                    add("check-cast v$N, Ljava/lang/String;")
                    add("sget-object v${N+1}, Ljava/util/Locale;->US:Ljava/util/Locale;")
                    add("invoke-virtual {v$N, v${N+1}}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;")
                    add("move-result-object v$N")
                    add("const-string v${N+1}, \"/dcim/\"")
                    add("invoke-virtual {v$N, v${N+1}}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z")
                    add("move-result v${N+1}")
                    add("if-eqz v${N+1}, :cond_skip")
                    add("const-string v${N+1}, \"/camera\"")
                    add("invoke-virtual {v$N, v${N+1}}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z")
                    add("move-result v${N+1}")
                    add("if-nez v${N+1}, :cond_skip")
                    add("const-string v${N+1}, \"/100\"")
                    add("invoke-virtual {v$N, v${N+1}}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z")
                    add("move-result v${N+1}")
                    add("if-nez v${N+1}, :cond_skip")
                    add("const-string v${N+1}, \"/dcim\"")
                    add("invoke-virtual {v$N, v${N+1}}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z")
                    add("move-result v$N")
                    add("if-nez v$N, :cond_skip")
                    add("const/4 p1, 0")
                    add(":cond_skip")
                }

                val clonedMethod = method.cloneMutable(
                    additionalRegisters = 5
                )

                clonedMethod.addInstructions(0, patchInstructions.joinToString("\n"))

                classDef.methods.apply {
                    remove(method)
                    add(clonedMethod)
                }
            } else {
                throw PatchException("Could not find filepath field in Modern InCameraFolder class.")
            }
        }

        // 2. Patch the legacy DCIM check method
        val legacyMethod = LegacyDCIMCheckFingerprint.methodOrNull
        if (legacyMethod != null) {
            val legacyClassDef = mutableClassDefBy(legacyMethod.definingClass)

            val isStatic = AccessFlags.STATIC.isSet(legacyMethod.accessFlags)
            val pathRegister = if (isStatic) "p0" else "p1"

            val legacyN = legacyMethod.implementation!!.registerCount
            val legacyPatchInstructions = buildList {
                add("if-eqz $pathRegister, :cond_skip")
                add("move-object v$legacyN, $pathRegister")
                add("sget-object v${legacyN+1}, Ljava/util/Locale;->US:Ljava/util/Locale;")
                add("invoke-virtual {v$legacyN, v${legacyN+1}}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;")
                add("move-result-object v$legacyN")
                add("const-string v${legacyN+1}, \"/dcim/\"")
                add("invoke-virtual {v$legacyN, v${legacyN+1}}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z")
                add("move-result v${legacyN+1}")
                add("if-eqz v${legacyN+1}, :cond_skip")
                add("const-string v${legacyN+1}, \"/camera\"")
                add("invoke-virtual {v$legacyN, v${legacyN+1}}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z")
                add("move-result v${legacyN+1}")
                add("if-nez v${legacyN+1}, :cond_skip")
                add("const-string v${legacyN+1}, \"/100\"")
                add("invoke-virtual {v$legacyN, v${legacyN+1}}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z")
                add("move-result v${legacyN+1}")
                add("if-nez v${legacyN+1}, :cond_skip")
                add("const-string v${legacyN+1}, \"/dcim\"")
                add("invoke-virtual {v$legacyN, v${legacyN+1}}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z")
                add("move-result v$legacyN")
                add("if-nez v$legacyN, :cond_skip")
                add("const/4 v$legacyN, 0")
                add("return v$legacyN")
                add(":cond_skip")
            }

            val clonedLegacyMethod = legacyMethod.cloneMutable(
                additionalRegisters = 4
            )

            clonedLegacyMethod.addInstructions(0, legacyPatchInstructions.joinToString("\n"))

            legacyClassDef.methods.apply {
                remove(legacyMethod)
                add(clonedLegacyMethod)
            }
        }

        // 3. Make BackupNotificationManager safe from null-pointer crashes during sync scheduling
        val backupNotificationClinit = BackupNotificationManagerFingerprint.methodOrNull
        if (backupNotificationClinit != null) {
            val classDef = mutableClassDefBy(backupNotificationClinit.definingClass)
            val methodB = classDef.methods.firstOrNull { it.name == "b" }
            if (methodB != null) {
                classDef.findMutableMethodOf(methodB).addInstructions(0, "return-void")
            }
        }

        // 4. Decouple backup query from in_camera_folder so Camera photos do not auto-upload by default
        val backupQueryMethod = BackupEligibilityQueryFingerprint.methodOrNull
        if (backupQueryMethod != null) {
            val queryClassDef = mutableClassDefBy(backupQueryMethod.definingClass)
            val mutableQueryMethod = queryClassDef.findMutableMethodOf(backupQueryMethod)

            val stringIndex = mutableQueryMethod.indexOfFirstStringInstructionOrThrow(" OR backup_folders.bucket_id IS NOT NULL ")
            val moveResultInstr = mutableQueryMethod.getInstruction(stringIndex - 1) as OneRegisterInstruction
            val folderCondRegister = moveResultInstr.registerA

            mutableQueryMethod.addInstruction(
                stringIndex,
                "const-string v$folderCondRegister, \"\""
            )
        }

        // 5. Fix overlay badge so un-backed camera photos display the cloud-off (not uploaded) badge
        val uploadStatusClassDef = UploadStatusModelViewModelFingerprint.methodOrNull?.let { mutableClassDefBy(it.definingClass) }
        if (uploadStatusClassDef != null) {
            val badgeMethod = uploadStatusClassDef.methods.firstOrNull {
                it.parameterTypes.size == 3 && it.parameterTypes[1] == "Z"
            }
            if (badgeMethod != null) {
                val mutableBadgeMethod = uploadStatusClassDef.findMutableMethodOf(badgeMethod)
                val instructions = badgeMethod.implementation?.instructions?.toList() ?: emptyList()

                // Find status enum reference with field "g" (photos_quantum_gm_ic_cloud_off_vd_theme_18)
                var statusGRef: FieldReference? = null
                for (idx in instructions.indices) {
                    val instr = instructions[idx]
                    if (instr.opcode == Opcode.SGET_OBJECT) {
                        val ref = (instr as? ReferenceInstruction)?.reference as? FieldReference
                        if (ref != null && ref.name == "g" && ref.type == ref.definingClass) {
                            statusGRef = ref
                            break
                        }
                    }
                }

                if (statusGRef != null) {
                    val statusSgetIndices = mutableListOf<Int>()
                    for (idx in instructions.indices) {
                        val instr = instructions[idx]
                        if (instr.opcode == Opcode.SGET_OBJECT) {
                            val ref = (instr as? ReferenceInstruction)?.reference as? FieldReference
                            if (ref != null && ref.type == statusGRef.type) {
                                statusSgetIndices.add(idx)
                            }
                        }
                    }

                    // The second-to-last SGET of the status enum is index 124 (stock loads NONE when account backup is enabled and status is NONE)
                    if (statusSgetIndices.size >= 2) {
                        val targetIdx = statusSgetIndices[statusSgetIndices.size - 2]
                        val targetInstr = instructions[targetIdx] as OneRegisterInstruction
                        val reg = targetInstr.registerA
                        mutableBadgeMethod.replaceInstruction(
                            targetIdx,
                            "sget-object v$reg, ${statusGRef.definingClass}->${statusGRef.name}:${statusGRef.type}"
                        )
                    }
                }
            }
        }

        // =========================================================================
        // 2. Local Creation Downloader
        // =========================================================================
        var patchedSaveMixin = false
        var patchedMfyMixin = false

        val saveMixinClassDef = SaveCreationMixinFingerprint.methodOrNull?.let { mutableClassDefBy(it.definingClass) }
        if (saveMixinClassDef != null) {
            val saveMethod = saveMixinClassDef.methods.find { m ->
                m.returnType == "Z" &&
                m.parameterTypes.size == 2 &&
                m.implementation?.instructions?.any { instruction ->
                    (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
                    ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == "SavePendingItemsOptimisticTask"
                } == true
            }

            if (saveMethod != null) {
                val mutableMethod = saveMixinClassDef.findMutableMethodOf(saveMethod)
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

                val isSavedMethod = saveMixinClassDef.methods.find { m ->
                    m.returnType == "Z" && m.parameterTypes.size == 1
                }
                if (isSavedMethod != null) {
                    val mutableIsSavedMethod = saveMixinClassDef.findMutableMethodOf(isSavedMethod)
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

        val mfyMixinClassDef = MfyCreationMixinFingerprint.methodOrNull?.let { mutableClassDefBy(it.definingClass) }
        if (mfyMixinClassDef != null) {
            val mfySaveMethod = mfyMixinClassDef.methods.find { m ->
                m.returnType == "V" &&
                m.parameterTypes.size == 3 &&
                m.parameterTypes[1] == "Ljava/lang/String;" &&
                m.parameterTypes[2] == "Z"
            }
            if (mfySaveMethod != null) {
                val mutableMethod = mfyMixinClassDef.findMutableMethodOf(mfySaveMethod)
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

            val bindMethod = mfyMixinClassDef.methods.find { m ->
                m.name == "gc" || (m.parameterTypes.size == 3 && m.parameterTypes[0] == "Landroid/content/Context;" && m.parameterTypes[2] == "Landroid/os/Bundle;")
            }
            if (bindMethod != null) {
                val mutableBindMethod = mfyMixinClassDef.findMutableMethodOf(bindMethod)
                mutableBindMethod.addInstructions(
                    0,
                    """
                    invoke-static { p0 }, Lapp/morphe/extension/shared/patches/LocalCreationDownloader;->onMfyMixinBound(Ljava/lang/Object;)V
                    """.trimIndent(),
                )
            }
        }

        val delegateClassDef = MfySectionDelegateFingerprint.methodOrNull?.let { mutableClassDefBy(it.definingClass) }
        if (delegateClassDef != null) {
            val cardMethod = delegateClassDef.methods.find { m ->
                m.parameterTypes.size == 2 &&
                m.parameterTypes[0] == "Ljava/lang/String;" &&
                m.returnType != "V" &&
                m.returnType != "Z"
            }
            if (cardMethod != null) {
                val mutableCardMethod = delegateClassDef.findMutableMethodOf(cardMethod)
                mutableCardMethod.addInstructions(
                    0,
                    """
                    invoke-static/range { p0 .. p2 }, Lapp/morphe/extension/shared/patches/LocalCreationDownloader;->onCheckHeroCardSaved(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
                    """.trimIndent(),
                )
            }

            // Prevent empty storefront / MFY creation sync from wiping out existing creations in proto
            val saveCreationsMethod = delegateClassDef.methods.find { m ->
                m.parameterTypes.size == 4 && m.parameterTypes[0] == "Ljava/util/List;"
            }
            if (saveCreationsMethod != null) {
                val mutableSaveCreationsMethod = delegateClassDef.findMutableMethodOf(saveCreationsMethod)
                val unitFieldRef = mutableSaveCreationsMethod.implementation?.instructions
                    ?.filterIsInstance<ReferenceInstruction>()
                    ?.mapNotNull { it.reference as? FieldReference }
                    ?.findLast { it.type == it.definingClass }
                if (unitFieldRef != null) {
                    val fieldStr = "${unitFieldRef.definingClass}->${unitFieldRef.name}:${unitFieldRef.type}"
                    mutableSaveCreationsMethod.addInstructions(
                        0,
                        """
                        if-eqz p1, :cond_empty
                        move-object/16 v0, p1
                        invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
                        move-result v0
                        if-nez v0, :cond_empty
                        goto :cond_proceed
                        :cond_empty
                        sget-object v0, $fieldStr
                        return-object v0
                        :cond_proceed
                        """.trimIndent(),
                    )
                }
            }
        }

        // 3. Fix Create tab save ClassCastException in koo.a
        val createItemMethod = CreateItemUpdateFingerprint.methodOrNull
        if (createItemMethod != null) {
            val createItemClassDef = mutableClassDefBy(createItemMethod.definingClass)
            val mutableMethod = createItemClassDef.findMutableMethodOf(createItemMethod)
            val instructions = createItemMethod.implementation?.instructions?.toList() ?: emptyList()

            // 1. Locate check-cast vX immediately preceding instance-of
            for (idx in 0 until instructions.size - 1) {
                val curr = instructions[idx]
                val next = instructions[idx + 1]
                if (curr.opcode == Opcode.CHECK_CAST && next.opcode == Opcode.INSTANCE_OF) {
                    val nextTypeRef = (next as? ReferenceInstruction)?.reference as? TypeReference
                    if (nextTypeRef?.type == "Lsll;" || nextTypeRef?.type == "Lsob;") {
                        mutableMethod.replaceInstruction(idx, "nop")
                        break
                    }
                }
            }

            // 2. Locate check-cast vY following Map.get(item.id) and preceding iget-object ..., skm/sna->f
            val updatedInstructions = mutableMethod.implementation!!.instructions.toList()
            for (idx in 0 until updatedInstructions.size - 1) {
                val curr = updatedInstructions[idx]
                val next = updatedInstructions[idx + 1]
                if (curr.opcode == Opcode.CHECK_CAST && next.opcode == Opcode.IGET_OBJECT) {
                    val fieldRef = (next as? ReferenceInstruction)?.reference as? FieldReference
                    if (fieldRef != null && fieldRef.name == "f" && (fieldRef.type.endsWith("slm;") || fieldRef.type.endsWith("soc;"))) {
                        val castInstr = curr as OneRegisterInstruction
                        val targetReg = castInstr.registerA
                        val nextInstr = next as TwoRegisterInstruction
                        val itemReg = nextInstr.registerB
                        mutableMethod.removeInstruction(idx)
                        mutableMethod.addInstructions(
                            idx,
                            """
                            invoke-static { v$targetReg, v$itemReg }, Lapp/morphe/extension/shared/patches/LocalCreationDownloader;->safeSlm(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                            move-result-object v$targetReg
                            """.trimIndent()
                        )
                        break
                    }
                }
            }
        }

        // =========================================================================
        // 4. Device Folders Camera Listing & Independent Toggle Control
        // =========================================================================

        // 6. Include Camera folder in "Back up device folders" screen by NOP'ing ztw.k(false) in amty.a
        val deviceFoldersSettingsQueryMethod = DeviceFoldersSettingsQueryFingerprint.methodOrNull
        if (deviceFoldersSettingsQueryMethod != null) {
            val amtyClassDef = mutableClassDefBy(deviceFoldersSettingsQueryMethod.definingClass)
            val mutableAmtyMethod = amtyClassDef.findMutableMethodOf(deviceFoldersSettingsQueryMethod)
            val instructions = deviceFoldersSettingsQueryMethod.implementation?.instructions?.toList() ?: emptyList()
            for (idx in instructions.indices) {
                val ins = instructions[idx]
                if (ins is ReferenceInstruction) {
                    val mr = ins.reference as? MethodReference
                    if (mr != null && mr.name == "k" && mr.parameterTypes.size == 1 && mr.parameterTypes[0] == "Z") {
                        mutableAmtyMethod.replaceInstruction(idx, "nop")
                        break
                    }
                }
            }
        }

        // 7. Make Camera folder feature independent and assignable to backup_folders
        val featureMethod = InCameraFolderFeatureFingerprint.methodOrNull
        if (featureMethod != null) {
            val featureClassDef = mutableClassDefBy(featureMethod.definingClass)

            // Patch <init>(Integer, Z)
            val ctorMethod = featureClassDef.methods.find {
                it.name == "<init>" && it.parameterTypes.size == 2 &&
                it.parameterTypes[0] == "Ljava/lang/Integer;" && it.parameterTypes[1] == "Z"
            }
            if (ctorMethod != null) {
                val mutableCtor = featureClassDef.findMutableMethodOf(ctorMethod)
                mutableCtor.addInstructions(
                    1,
                    """
                    invoke-static { p1 }, Lapp/morphe/extension/shared/patches/LocalCreationDownloader;->resolveBucketId(Ljava/lang/Integer;)Ljava/lang/Integer;
                    move-result-object p1
                    const/4 p2, 0
                    """.trimIndent()
                )
            }

            // Patch <init>(Parcel)
            val parcelCtorMethod = featureClassDef.methods.find {
                it.name == "<init>" && it.parameterTypes.size == 1 &&
                it.parameterTypes[0] == "Landroid/os/Parcel;"
            }
            if (parcelCtorMethod != null) {
                val mutableParcelCtor = featureClassDef.findMutableMethodOf(parcelCtorMethod)
                val instructions = parcelCtorMethod.implementation?.instructions?.toList() ?: emptyList()
                for (idx in instructions.indices) {
                    val ins = instructions[idx]
                    if (ins.opcode == Opcode.IPUT_BOOLEAN) {
                        val ref = (ins as? ReferenceInstruction)?.reference as? FieldReference
                        if (ref != null && ref.name == "a") {
                            val reg = (ins as OneRegisterInstruction).registerA
                            mutableParcelCtor.addInstruction(idx, "const/4 v$reg, 0")
                            break
                        }
                    }
                }
            }

            // Patch a()I to return resolveBucketIdInt(b) cleanly without branches
            val mutableMethodA = featureClassDef.findMutableMethodOf(featureMethod)
            val instrCount = mutableMethodA.implementation!!.instructions.toList().size
            for (i in (instrCount - 1) downTo 0) {
                mutableMethodA.removeInstruction(i)
            }
            mutableMethodA.addInstructions(
                0,
                """
                iget-object v0, p0, ${featureClassDef.type}->b:Ljava/lang/Integer;
                invoke-static { v0 }, Lapp/morphe/extension/shared/patches/LocalCreationDownloader;->resolveBucketIdInt(Ljava/lang/Integer;)I
                move-result v0
                return v0
                """.trimIndent()
            )
        }

        // 8. Prevent NoWhenBranchMatchedException (cthu) in Create tab button renderer
        val buttonTextMethod = CreateItemButtonTextFingerprint.methodOrNull
        if (buttonTextMethod != null) {
            val classDef = mutableClassDefBy(buttonTextMethod.definingClass)
            val mutableMethod = classDef.findMutableMethodOf(buttonTextMethod)
            val instructions = buttonTextMethod.implementation?.instructions?.toList() ?: emptyList()
            for (idx in instructions.indices) {
                val ins = instructions[idx]
                if (ins.opcode == Opcode.NEW_INSTANCE) {
                    val typeRef = (ins as? ReferenceInstruction)?.reference as? TypeReference
                    if (typeRef?.type?.endsWith("cthu;") == true || typeRef?.type?.endsWith("cttj;") == true) {
                        mutableMethod.replaceInstruction(idx, "nop")
                        if (idx + 1 < instructions.size) mutableMethod.replaceInstruction(idx + 1, "nop")
                        if (idx + 2 < instructions.size) mutableMethod.replaceInstruction(idx + 2, "nop")
                        break
                    }
                }
            }
        }

        // 9. Aura Tab Made For You Section Enablement
        val auraTabMethod = AuraTabViewModelFingerprint.methodOrNull
        if (auraTabMethod != null) {
            val auraTabClassDef = mutableClassDefBy(auraTabMethod.definingClass)
            val isMfyEnabledMethod = auraTabClassDef.methods.find {
                it.returnType == "Z" && it.parameterTypes.isEmpty()
            }
            if (isMfyEnabledMethod != null) {
                val mutableMethod = auraTabClassDef.findMutableMethodOf(isMfyEnabledMethod)
                val instrCount = mutableMethod.implementation!!.instructions.toList().size
                for (i in (instrCount - 1) downTo 0) {
                    mutableMethod.removeInstruction(i)
                }
                mutableMethod.addInstructions(
                    0,
                    """
                    const/4 v0, 0x1
                    return v0
                    """.trimIndent()
                )

                // Also patch <init> to unconditionally call shp.n()
                val ctor = auraTabClassDef.methods.find { it.name == "<init>" }
                if (ctor != null) {
                    val mutableCtor = auraTabClassDef.findMutableMethodOf(ctor)
                    val ctorInstructions = ctor.implementation?.instructions?.toList() ?: emptyList()
                    for (idx in ctorInstructions.indices) {
                        val ins = ctorInstructions[idx]
                        if (ins is ReferenceInstruction) {
                            val mr = ins.reference as? MethodReference
                            if (mr != null && mr.definingClass == auraTabClassDef.type && mr.name == isMfyEnabledMethod.name) {
                                if (idx + 2 < ctorInstructions.size && ctorInstructions[idx + 2].opcode == Opcode.IF_EQZ) {
                                    mutableCtor.replaceInstruction(idx + 2, "nop")
                                }
                                for (j in (idx + 3) until minOf(idx + 10, ctorInstructions.size)) {
                                    if (ctorInstructions[j].opcode == Opcode.IF_NEZ) {
                                        mutableCtor.replaceInstruction(j, "nop")
                                        break
                                    }
                                }
                                break
                            }
                        }
                    }
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

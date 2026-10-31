/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/googlephotos/misc/gms/GmsCoreSupportPatch.kt
 */
package app.morphe.patches.googlephotos.misc.gms

import app.morphe.patches.googlephotos.misc.extension.sharedExtensionPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.googlephotos.misc.gms.Constants.MORPHE_PHOTOS_PACKAGE_NAME
import app.morphe.patches.googlephotos.misc.gms.Constants.PHOTOS_PACKAGE_NAME
import app.morphe.patches.googlephotos.misc.gms.HomeActivityOnCreateFingerprint
import app.morphe.patches.shared.misc.gms.PackageNameConfig
import app.morphe.patches.shared.misc.gms.gmsCoreSupportPatch
import app.morphe.patches.shared.misc.settings.preference.BasePreferenceScreen
import app.morphe.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.util.asSequence
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getNode
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.googlephotos.misc.bento.BentoModelBuilderFingerprint
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import org.w3c.dom.Element

@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    fromPackageName = PHOTOS_PACKAGE_NAME,
    toPackageName = MORPHE_PHOTOS_PACKAGE_NAME,
    mainActivityOnCreateFingerprint = HomeActivityOnCreateFingerprint,
    extensionPatch = sharedExtensionPatch,
    gmsCoreSupportResourcePatchFactory = ::gmsCoreSupportResourcePatch,
    executeBlock = {
        // 1. Account Avatar initialization
        HomeActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
            invoke-static/range { p0 .. p0 }, Lapp/morphe/extension/shared/patches/GooglePhotosAccountAvatar;->install(Landroid/app/Activity;)V
            """.trimIndent(),
        )

        // 2. Google One Bento Badge
        val targetBentoMethod = BentoModelBuilderFingerprint.methodOrNull
        if (targetBentoMethod != null) {
            val bentoClass = mutableClassDefBy(targetBentoMethod.definingClass)
            val bentoMethod = bentoClass.findMutableMethodOf(targetBentoMethod)
            val instructions = targetBentoMethod.implementation?.instructions?.toList()
            if (instructions != null) {
                val fallbackIndex = instructions.indexOfFirst { inst ->
                    inst.opcode == Opcode.CONST_16 &&
                        (inst as? NarrowLiteralInstruction)?.narrowLiteral == 0 &&
                        instructions.getOrNull(instructions.indexOf(inst) + 1)?.let { nextInst ->
                            nextInst.opcode == Opcode.IF_EQZ &&
                                (nextInst as? OneRegisterInstruction)?.registerA == (inst as? OneRegisterInstruction)?.registerA
                        } == true
                }
                if (fallbackIndex != -1) {
                    val targetReg = (instructions[fallbackIndex] as OneRegisterInstruction).registerA
                    val valueOfIndex = (fallbackIndex - 1 downTo 0).firstOrNull { i ->
                        val inst = instructions[i]
                        inst.opcode == Opcode.INVOKE_STATIC &&
                            (inst as? ReferenceInstruction)?.reference?.toString()?.contains("Integer;->valueOf(I)Ljava/lang/Integer;") == true
                    }
                    if (valueOfIndex != null) {
                        val intReg = (instructions[valueOfIndex] as? FiveRegisterInstruction)?.registerC
                        val stringInitIndex = (valueOfIndex - 1 downTo 0).firstOrNull { i ->
                            val inst = instructions[i]
                            inst.opcode == Opcode.INVOKE_DIRECT &&
                                (inst as? ReferenceInstruction)?.reference?.toString()?.contains("<init>(Ljava/lang/String;)V") == true
                        }
                        if (stringInitIndex != null && intReg != null) {
                            val stringReg = (instructions[stringInitIndex] as? FiveRegisterInstruction)?.registerD
                            var entryIndex = -1
                            for (i in stringInitIndex - 1 downTo 0) {
                                if (instructions[i].opcode == Opcode.NEW_INSTANCE) {
                                    entryIndex = i
                                } else if (entryIndex != -1) {
                                    break
                                }
                            }
                            if (entryIndex != -1 && stringReg != null) {
                                var accountReg = 14
                                for (i in entryIndex - 1 downTo 0) {
                                    if (instructions[i].opcode == Opcode.IGET_BOOLEAN) {
                                        accountReg = (instructions[i] as TwoRegisterInstruction).registerB
                                        break
                                    }
                                }
                                bentoMethod.addInstructionsAtControlFlowLabel(
                                    fallbackIndex,
                                    """
                                    invoke-static { v$accountReg }, Lapp/morphe/extension/shared/patches/BentoDecorationPatch;->getBadgeText(Ljava/lang/Object;)Ljava/lang/String;
                                    move-result-object v$stringReg
                                    if-eqz v$stringReg, :no_badge
                                    const/4 v$intReg, 1
                                    goto :build_badge
                                    :no_badge
                                    const/16 v$targetReg, 0
                                    """.trimIndent(),
                                    ExternalLabel("build_badge", bentoMethod.getInstruction(entryIndex)),
                                )
                            }
                        }
                    }
                }
            }
        }

        // Places Map photo grid scroll jump
        PlacesMapScrollJumpFingerprint.methodOrNull?.let { method ->
            val mutableClass = mutableClassDefBy(method.definingClass)
            val mutableMethod = mutableClass.findMutableMethodOf(method)
            mutableMethod.addInstruction(
                0,
                "invoke-static {v2}, Lapp/morphe/extension/shared/patches/GmsCoreSupportPatch;->adjustScrollPosition(I)I",
            )
            mutableMethod.addInstruction(
                1,
                "move-result v2",
            )
            mutableMethod.addInstruction(
                2,
                "invoke-static {v2, v3}, Lapp/morphe/extension/shared/patches/GmsCoreSupportPatch;->adjustScrollOffset(II)I",
            )
            mutableMethod.addInstruction(
                3,
                "move-result v3",
            )
        }

        // Map Explore bottom sheet header photo count
        MapExploreDateRangeFingerprint.methodOrNull?.let { method ->
            val mutableClass = mutableClassDefBy(method.definingClass)
            val mutableMethod = mutableClass.findMutableMethodOf(method)
            val impl = method.implementation
            if (impl != null) {
                var aPIndex = -1
                var ifNezIndex = -1
                impl.instructions.forEachIndexed { idx, instr ->
                    if (aPIndex == -1) {
                        if (instr is ReferenceInstruction && instr.opcode.name.lowercase().startsWith("iget-boolean")) {
                            val ref = instr.reference as? FieldReference
                            if (ref != null && ref.name == "aP") {
                                aPIndex = idx
                            }
                        }
                    } else if (ifNezIndex == -1 && idx == aPIndex + 1 && instr.opcode.name.lowercase().startsWith("if-nez")) {
                        ifNezIndex = idx
                    }
                }
                if (ifNezIndex != -1) {
                    mutableMethod.replaceInstruction(ifNezIndex, "nop")
                }
            }
        }

        // MarsGridActivity.onCreate hook
        classDefByOrNull("Lcom/google/android/apps/photos/mars/grid/MarsGridActivity;")?.let { classDef ->
            classDef.methods.find { it.name == "onCreate" }?.let { method ->
                mutableClassDefBy(classDef).findMutableMethodOf(method).addInstruction(
                    0,
                    "invoke-static {p0}, Lapp/morphe/extension/shared/patches/toolkit/StorageScanner;->onMarsGridActivityCreated(Landroid/app/Activity;)V",
                )
            }
        }

        // Hook photos.killswitch_info_panel_map to prevent crash when MicroG lacks location
        KillswitchInfoPanelMapFingerprint.methodOrNull?.let { clinitMethod ->
            var foundDist = -1
            var targetField: FieldReference? = null
            clinitMethod.implementation?.instructions?.forEach { instr ->
                val ref = (instr as? ReferenceInstruction)?.reference
                if (ref is StringReference && ref.string == "photos.killswitch_info_panel_map") {
                    foundDist = 0
                } else if (foundDist in 0..15 && ref is FieldReference && instr.opcode.name.startsWith("sput", ignoreCase = true)) {
                    targetField = ref
                    foundDist = -1
                } else if (foundDist >= 0) {
                    foundDist++
                }
            }

            if (targetField != null) {
                val killswitchClassDef = classDefBy(clinitMethod.definingClass)
                val supplierClassTypes = mutableSetOf<String>()
                killswitchClassDef.methods.filter { it.name == "<init>" }.forEach { initMethod ->
                    initMethod.implementation?.instructions?.forEach { instr ->
                        val ref = (instr as? ReferenceInstruction)?.reference
                        if (ref is com.android.tools.smali.dexlib2.iface.reference.TypeReference) {
                            val type = ref.type
                            if (!type.startsWith("Landroid/") && !type.startsWith("Ljava/") && !type.contains("Context")) {
                                supplierClassTypes.add(type)
                            }
                        }
                    }
                }

                fun patchMethodIfMatches(cDef: ClassDef, method: Method): Boolean {
                    val impl = method.implementation ?: return false
                    val instructions = impl.instructions.toList()
                    var sgetDistance = -1
                    var patched = false
                    instructions.forEachIndexed { index, instruction ->
                        val ref = (instruction as? ReferenceInstruction)?.reference
                        if (ref is FieldReference && ref.definingClass == targetField.definingClass && ref.name == targetField.name && instruction.opcode.name.startsWith("sget", ignoreCase = true)) {
                            sgetDistance = 0
                        } else if (sgetDistance in 0..5 && ref is MethodReference && ref.returnType == "Z" && instruction.opcode.name.startsWith("invoke", ignoreCase = true)) {
                            sgetDistance = -1
                            val nextIndex = index + 1
                            if (nextIndex < instructions.size) {
                                val nextIns = instructions[nextIndex]
                                if (nextIns is OneRegisterInstruction && nextIns.opcode.name.startsWith("move-result", ignoreCase = true)) {
                                    val reg = nextIns.registerA
                                    val mutableMethod = mutableClassDefBy(cDef).findMutableMethodOf(method)
                                    mutableMethod.addInstruction(
                                        nextIndex + 1,
                                        "invoke-static {v$reg}, Lapp/morphe/extension/shared/patches/GmsCoreSupportPatch;->isInfoPanelMapKillswitched(Z)Z",
                                    )
                                    mutableMethod.addInstruction(
                                        nextIndex + 2,
                                        "move-result v$reg",
                                    )
                                    patched = true
                                }
                            }
                        } else if (sgetDistance >= 0) {
                            sgetDistance++
                        }
                    }
                    return patched
                }

                var didPatch = false
                for (supplierType in supplierClassTypes) {
                    classDefByOrNull(supplierType)?.let { sClass ->
                        sClass.methods.forEach { m ->
                            if (patchMethodIfMatches(sClass, m)) didPatch = true
                        }
                    }
                    if (didPatch) break
                }
            }
        }

        // Fast metadata scan: Google Play Services availability & signature check hooks
        classDefForEach { classDef ->
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            classDef.methods.forEach classLoop@{ method ->
                // Check A: Google Play Services availability check
                val isAvailabilityCheck = method.returnType == "I" &&
                    (
                        (method.parameterTypes.size == 2 && method.parameterTypes[0] == "Landroid/content/Context;" && method.parameterTypes[1] == "I") ||
                        (method.parameterTypes.size == 1 && method.parameterTypes[0] == "Landroid/content/Context;")
                    )
                if (isAvailabilityCheck) {
                    val impl = method.implementation
                    if (impl != null && impl.instructions.any { instr ->
                        val str = (instr.getReference<StringReference>())?.string
                        str?.contains("android.gms") == true || str?.contains("GooglePlayServices") == true
                    }) {
                        mutableClass.findMutableMethodOf(method).returnEarly(0)
                        return@classLoop
                    }
                }

                // Check B: PackageInfo signature verification
                val isSignatureCheck = method.returnType == "Z" &&
                    method.parameterTypes.size in 1..2 &&
                    method.parameterTypes[0] == "Landroid/content/pm/PackageInfo;"
                if (isSignatureCheck) {
                    mutableClass.findMutableMethodOf(method).returnEarly(true)
                    return@classLoop
                }
            }
        }

        // 2) Disable the AccountValidityMonitor check that runs on resume.
        val avmClass = mutableClassDefBy(AccountValidityMonitorFingerprint.method.definingClass)
        val checkAccountMethod = avmClass.methods.first {
            it.name == "d" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        checkAccountMethod.addInstruction(
            0,
            "return-void",
        )

        // 3) Keep the frictionless eligibility result intact, but prevent the
        //    MicroG failure path from clearing the selected account.
        val frictionlessClass = mutableClassDefBy(FrictionlessEligibilityTaskFingerprint.method.definingClass)
        val eligibilityMethod = frictionlessClass.methods.first {
            it.name == "f" && it.parameterTypes.isEmpty() && it.returnType == "Z"
        }
        eligibilityMethod.apply {
            val clearSelectedAccountIndex = indexOfFirstInstructionOrThrow {
                getReference<MethodReference>()?.let { ref ->
                    ref.name == "o" &&
                        ref.returnType == "V" &&
                        ref.parameterTypes.toList() == listOf("I")
                } == true
            }
            val accountHandlerClass = getInstruction(clearSelectedAccountIndex)
                .getReference<MethodReference>()!!
                .definingClass

            replaceInstruction(clearSelectedAccountIndex, "invoke-virtual {p0}, $accountHandlerClass->p()V")
        }

        // 4, 5, 6) Hook CurrentLocationMixin methods
        val currentLocationClass = mutableClassDefBy(CurrentLocationMixinOnViewCreatedFingerprint.method.definingClass)
        val currentLocationMethodA = currentLocationClass.methods.first {
            it.name == "a" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        currentLocationMethodA.apply {
            addInstruction(
                0,
                "invoke-static {p0}, Lapp/morphe/extension/shared/patches/GmsCoreSupportPatch;->handleCurrentLocation(Ljava/lang/Object;)V",
            )
            addInstruction(
                1,
                "return-void",
            )
        }

        CurrentLocationMixinOnViewCreatedFingerprint.method.addInstruction(
            0,
            "invoke-static {p0}, Lapp/morphe/extension/shared/patches/GmsCoreSupportPatch;->initMapLocation(Ljava/lang/Object;)V",
        )

        val currentLocationMethodB = currentLocationClass.methods.first {
            it.name == "b" && it.parameterTypes.toList() == listOf("Z") && it.returnType == "V"
        }
        currentLocationMethodB.addInstruction(
            0,
            "invoke-static {p0, p1}, Lapp/morphe/extension/shared/patches/GmsCoreSupportPatch;->onCurrentLocationMixinTintUpdated(Ljava/lang/Object;Z)V",
        )


        // 8) Bypass concurrent permission request crash guard (Cannot request permissions X when already requested Y)
        val permCoordMethod = PermissionCoordinatorRequestPermissionsFingerprint.methodOrNull
        if (permCoordMethod != null) {
            val mutableClass = mutableClassDefBy(permCoordMethod.definingClass)
            val mutableMethod = mutableClass.findMutableMethodOf(permCoordMethod)
            val instructions = permCoordMethod.implementation?.instructions?.toList()
            if (instructions != null) {
                val sizeIndex = instructions.indexOfFirst {
                    it.opcode == Opcode.INVOKE_VIRTUAL &&
                        (it as? ReferenceInstruction)?.reference?.toString()?.contains("SparseArray;->size()I") == true
                }
                if (sizeIndex != -1) {
                    val branchRel = instructions.drop(sizeIndex).indexOfFirst {
                        it.opcode.name.startsWith("if-")
                    }
                    if (branchRel != -1) {
                        val branchIndex = sizeIndex + branchRel
                        mutableMethod.replaceInstruction(branchIndex, "nop")
                    }
                }
            }
        }
    },
    finalizeBlock = {
        if (PackageNameConfig.isPackageNameChangeEnabled) {
            val targetPackageName = PackageNameConfig.effectivePackageName.ifEmpty { MORPHE_PHOTOS_PACKAGE_NAME }
            val marsPackagePrefixes = listOf(
                "$PHOTOS_PACKAGE_NAME.mars.",
                "content://$PHOTOS_PACKAGE_NAME.mars.",
            )
            val marsLibPrefixes = listOf(
                "com.google.android.libraries.photos.api.mars",
                "content://com.google.android.libraries.photos.api.mars",
            )

            classDefForEach { classDef ->
                val mutableClass by lazy { mutableClassDefBy(classDef) }
                classDef.methods.forEach classLoop@{ method ->
                    val implementation = method.implementation ?: return@classLoop
                    val mutableMethod by lazy { mutableClass.findMutableMethodOf(method) }

                    implementation.instructions.forEachIndexed { index, instruction ->
                        val ref = (instruction as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference
                        if (instruction is com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c && ref is StringReference) {
                            val original = ref.string
                            if (!original.endsWith("Activity") && !original.contains("Activity$") &&
                                !original.endsWith("Task") && !original.contains("Task$") &&
                                !original.endsWith("Service") && !original.contains("Service$")) {
                                val transformed = when {
                                    marsLibPrefixes.any { original.startsWith(it) } ->
                                        original.replace("com.google.android.libraries.photos.api.mars", "$targetPackageName.api.mars")
                                    marsPackagePrefixes.any { original.startsWith(it) } ->
                                        original.replace(PHOTOS_PACKAGE_NAME, targetPackageName)
                                    else -> null
                                }
                                if (transformed != null) {
                                    mutableMethod.replaceInstruction(
                                        index,
                                        com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c(
                                            com.android.tools.smali.dexlib2.Opcode.CONST_STRING,
                                            (instruction as OneRegisterInstruction).registerA,
                                            com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference(transformed),
                                        ),
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
    },
) {
    dependsOn(
        deviceComplianceCheckPatch,
    )

    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)
}

/**
 * Minimal preference screen used only to satisfy the shared GmsCore support
 * resource patch API. Google Photos does not currently expose a dedicated
 * Morphe settings UI, so the committed screen is intentionally a no-op.
 */
private object DummyPreferenceScreen : BasePreferenceScreen() {
    val SCREEN = Screen(
        key = "morphe_settings_googlephotos_screen_1_misc",
        summaryKey = null,
    )

    override fun commit(screen: PreferenceScreenPreference) {
        // No-op: Google Photos does not have a dedicated Morphe settings screen yet.
    }
}

private fun gmsCoreSupportResourcePatch() =
    app.morphe.patches.shared.misc.gms.gmsCoreSupportResourcePatch(
        fromPackageName = PHOTOS_PACKAGE_NAME,
        toPackageName = MORPHE_PHOTOS_PACKAGE_NAME,
        spoofedPackageSignature = "24bb24c05e47e0aefa68a58a766179d9b613a600",
        screen = DummyPreferenceScreen.SCREEN,
    ) {
        finalize {
            if (PackageNameConfig.isPackageNameChangeEnabled) {
                val targetPackageName = PackageNameConfig.effectivePackageName.ifEmpty { MORPHE_PHOTOS_PACKAGE_NAME }

                document("AndroidManifest.xml").use { document ->
                    val manifest = document.getNode("manifest") as Element
                    val originalPackageName = manifest.getAttribute("package")

                    manifest.setAttribute("package", targetPackageName)

                    val permissions = manifest.getElementsByTagName("permission").asSequence()
                    val usesPermissions = manifest.getElementsByTagName("uses-permission").asSequence()

                    (permissions + usesPermissions)
                        .map { it as Element }
                        .forEach { elem ->
                            val name = elem.getAttribute("android:name")
                            if (name.startsWith("$originalPackageName.")) {
                                elem.setAttribute("android:name", name.replace(originalPackageName, targetPackageName))
                            }
                        }

                    val components = (
                        manifest.getElementsByTagName("activity").asSequence() +
                        manifest.getElementsByTagName("service").asSequence() +
                        manifest.getElementsByTagName("provider").asSequence() +
                        manifest.getElementsByTagName("receiver").asSequence()
                    ).map { it as Element }

                    for (comp in components) {
                        val perm = comp.getAttribute("android:permission")
                        if (perm.startsWith("$originalPackageName.")) {
                            comp.setAttribute("android:permission", perm.replace(originalPackageName, targetPackageName))
                        }
                    }

                    val providers = manifest.getElementsByTagName("provider").asSequence()
                    for (node in providers) {
                        val provider = node as Element
                        val authorities = provider.getAttribute("android:authorities")
                        if (authorities.contains("api.mars")) {
                            provider.setAttribute("android:authorities", "$targetPackageName.api.mars")
                        } else if (authorities.startsWith("$originalPackageName.")) {
                            provider.setAttribute("android:authorities", authorities.replace(originalPackageName, targetPackageName))
                        }
                    }
                }
            }

            document("AndroidManifest.xml").use { document ->
                val manifest = document.getNode("manifest") as Element
                val existingPerms = manifest.getElementsByTagName("uses-permission").asSequence()
                    .map { (it as Element).getAttribute("android:name") }
                    .toSet()
                if ("android.permission.MANAGE_EXTERNAL_STORAGE" !in existingPerms) {
                    val permNode = document.createElement("uses-permission")
                    permNode.setAttribute("android:name", "android.permission.MANAGE_EXTERNAL_STORAGE")
                    manifest.appendChild(permNode)
                }
            }

            // Bundle official phenotype baseline assets into APK assets
            val phenotypeAssets = listOf(
                "com.google.android.apps.photos.phenotype.xml",
                "phenotype_account_file.xml",
            )
            for (name in phenotypeAssets) {
                val stream = object {}.javaClass.classLoader.getResourceAsStream("app/morphe/patches/googlephotos/phenotype/$name")
                if (stream != null) {
                    val target = this["assets/phenotype/$name", false]
                    target.parentFile?.mkdirs()
                    stream.use { input ->
                        target.outputStream().use { output ->
                            input.copyTo(output)
                        }
                    }
                }
            }

            // Bundle authentic Google Sans font assets into APK assets
            val fontAssets = listOf(
                "Google_Sans_Text-Bold.ttf",
                "Google_Sans_Text-Medium.ttf",
                "Google_Sans_Text-Regular.ttf",
            )
            for (name in fontAssets) {
                val stream = object {}.javaClass.classLoader.getResourceAsStream("app/morphe/patches/googlephotos/fonts/$name")
                if (stream != null) {
                    val target = this["assets/fonts/$name", false]
                    target.parentFile?.mkdirs()
                    stream.use { input ->
                        target.outputStream().use { output ->
                            input.copyTo(output)
                        }
                    }
                }
            }
        }
    }

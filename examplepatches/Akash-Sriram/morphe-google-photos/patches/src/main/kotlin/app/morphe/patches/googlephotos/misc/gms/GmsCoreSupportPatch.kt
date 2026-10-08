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
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

@Suppress("unused")
val gmsCoreSupportPatch = gmsCoreSupportPatch(
    fromPackageName = PHOTOS_PACKAGE_NAME,
    toPackageName = MORPHE_PHOTOS_PACKAGE_NAME,
    mainActivityOnCreateFingerprint = HomeActivityOnCreateFingerprint,
    extensionPatch = sharedExtensionPatch,
    gmsCoreSupportResourcePatchFactory = ::gmsCoreSupportResourcePatch,
    executeBlock = {
        // 1) Combined single pass over all classes:
        //    - Bundle Google Play Services availability & signature check hooks
        //    - Relax MDD and WorkManager network constraints from UNMETERED/NOT_ROAMING to CONNECTED
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
                        val str = (instr.getReference<com.android.tools.smali.dexlib2.iface.reference.StringReference>())?.string
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

                // Check C: WorkManager / MDD network constraints
                val implementation = method.implementation ?: return@classLoop
                implementation.instructions.forEachIndexed { index, instruction ->
                    val fieldRef = (instruction as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference
                        ?: return@forEachIndexed

                    if (fieldRef.definingClass == "Landroidx/work/NetworkType;" &&
                        (fieldRef.name == "UNMETERED" || fieldRef.name == "NOT_ROAMING")) {
                        val register = (instruction as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA
                        mutableClass.findMutableMethodOf(method).replaceInstruction(
                            index,
                            "sget-object v$register, Landroidx/work/NetworkType;->CONNECTED:Landroidx/work/NetworkType;",
                        )
                    }
                }
            }
        }

        // 2) Fix Locked Folder (Mars) cloud backup: translate Mars-related internal package-name
        //    strings in DEX bytecode from the official package name to the mod package name.
        //
        //    Background: patchManifest() in the shared GmsCore patch renames the ContentProvider
        //    authority *declarations* in AndroidManifest.xml, e.g.:
        //      "com.google.android.apps.photos.mars.contentprovider.local_locked_media"
        //    →  "app.morphe.android.apps.photos.mars.contentprovider.local_locked_media"
        //    However, the DEX bytecode constructs content:// URIs and Intent actions using the
        //    original package name, so the OS fails to resolve the provider and the entire
        //    Locked Folder pipeline (backup eligibility, auth handshake, data sync) breaks.
        //    This pass re-aligns those strings with the renamed authorities in the manifest.
        //    Only execute this transformation when package renaming is enabled.
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

                classDef.methods.forEach marsLoop@{ method ->
                    val implementation = method.implementation ?: return@marsLoop

                    val mutableMethod by lazy { mutableClass.findMutableMethodOf(method) }

                    implementation.instructions.forEachIndexed { index, instruction ->
                        val stringRef =
                            (instruction as? com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c)
                                ?.reference as? StringReference
                                ?: return@forEachIndexed

                        val original = stringRef.string
                        val transformed = when {
                            marsLibPrefixes.any { original.startsWith(it) } ->
                                original.replace("com.google.android.libraries.photos.api.mars", "$targetPackageName.api.mars")
                            marsPackagePrefixes.any { original.startsWith(it) } ->
                                original.replace(PHOTOS_PACKAGE_NAME, targetPackageName)
                            else -> null
                        } ?: return@forEachIndexed

                        mutableMethod.replaceInstruction(
                            index,
                            com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c(
                                com.android.tools.smali.dexlib2.Opcode.CONST_STRING,
                                (instruction as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA,
                                com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference(transformed),
                            ),
                        )
                    }
                }
            }
        }

        // 3) Disable the AccountValidityMonitor check that runs on resume.
        AccountValidityMonitorCheckFingerprint.method.addInstruction(
            0,
            "return-void",
        )

        // 4) Keep the frictionless eligibility result intact, but prevent the
        //    MicroG failure path from clearing the selected account.
        FrictionlessEligibilityFingerprint.method.apply {
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

        // 5) Hook CurrentLocationMixin.a() to immediately obtain device location and animate map camera.
        CurrentLocationMixinFingerprint.method.apply {
            addInstruction(
                0,
                "invoke-static {p0}, Lapp/morphe/extension/shared/patches/GmsCoreSupportPatch;->handleCurrentLocation(Ljava/lang/Object;)V",
            )
            addInstruction(
                1,
                "return-void",
            )
        }

        // 6) Hook CurrentLocationMixin.ar(View, Bundle) to eagerly wire location source to map on view creation.
        CurrentLocationMixinOnViewCreatedFingerprint.method.addInstruction(
            0,
            "invoke-static {p0}, Lapp/morphe/extension/shared/patches/GmsCoreSupportPatch;->initMapLocation(Ljava/lang/Object;)V",
        )

        // 7) Hook CurrentLocationMixin.b(boolean) to detect if toggle-off was triggered by onClick.
        CurrentLocationMixinUpdateTintFingerprint.method.addInstruction(
            0,
            "invoke-static {p0, p1}, Lapp/morphe/extension/shared/patches/GmsCoreSupportPatch;->onCurrentLocationMixinTintUpdated(Ljava/lang/Object;Z)V",
        )

        // 8) Fix Places Map photo grid scroll jump and clipped top photo:
        //    All programmatic scrolls to photos/dates in PhotosGridFragment go through Lahuf.h
        //    (LayoutManager.scrollToPositionWithOffset dispatcher).
        //    When scrolling to the top photo (pos <= 1), adjust position to 0 ("Today" header)
        //    and offset to 0 so the date header and top photo are cleanly displayed without clipping.
        classDefForEach { classDef ->
            val mutableClass by lazy { mutableClassDefBy(classDef) }
            classDef.methods.forEach { method ->
                if (AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.returnType == "V" && method.parameterTypes.size == 3 &&
                    method.parameterTypes[1] == "I" && method.parameterTypes[2] == "I" &&
                    !method.parameterTypes[0].contains("RecyclerView;")) {
                    val impl = method.implementation ?: return@forEach
                    val isLahufH = impl.instructions.any { instr ->
                        val ref = (instr as? ReferenceInstruction)?.reference?.toString()
                        ref?.contains("TwoWayLayoutManager") == true
                    } && impl.instructions.any { instr ->
                        val ref = (instr as? ReferenceInstruction)?.reference?.toString()
                        ref?.contains("LinearLayoutManager") == true
                    }
                    if (isLahufH) {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        // In static method with 4 registers: v0 is local, v1 is lm, v2 is pos, v3 is offset
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
                        println(">>> GmsCoreSupportPatch: Injected adjustScrollPosition/Offset into ${classDef.type}->${method.name}")
                    }
                }
            }
        }

        // 9) Ensure Map Explore bottom sheet header always displays the photo count:
        //    When the camera moves (e.g. Current Location FAB, pan/zoom), CoreCollectionCountLoadTask
        //    delivers the computed photo count to MapExploreBottomsheetController.h (Laita->h).
        //    In Photos, if Laitt.aP is true, Photos jumps over Laita->g() to clear the count (l("")).
        //    By NOPing the `if-nez` branch after `iget-boolean aP`, Laita->g() is always invoked,
        //    formatting and displaying the localized photo count (e.g. "682 photos") in the
        //    bottom sheet header, exactly matching official Google Photos behavior.
        classDefForEach { classDef ->
            val mutableClass by lazy { mutableClassDefBy(classDef) }
            classDef.methods.forEach { method ->
                val impl = method.implementation ?: return@forEach
                if (method.returnType == "V" && method.parameterTypes.size == 2 && method.parameterTypes[0] == "I") {
                    val hasDateRangeTask = impl.instructions.any { instr ->
                        (instr as? ReferenceInstruction)?.reference?.toString()?.contains("mapexplore.GetMediaCollectionDateRangeTask") == true
                    }
                    if (hasDateRangeTask) {
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
                            val mutableMethod = mutableClass.findMutableMethodOf(method)
                            mutableMethod.replaceInstruction(ifNezIndex, "nop")
                            println(">>> GmsCoreSupportPatch: Injected photo count fix (NOPed if-nez at index $ifNezIndex) in ${classDef.type}->${method.name}")
                        }
                    }
                }
            }
        }

        // 10) Discover and hook photos.killswitch_info_panel_map to prevent crash when MicroG lacks location.
        var killswitchFieldRef: FieldReference? = null
        classDefForEach { classDef ->
            if (killswitchFieldRef != null) return@classDefForEach
            classDef.methods.forEach { method ->
                if (killswitchFieldRef != null) return@forEach
                val impl = method.implementation ?: return@forEach
                var foundStringDistance = -1
                for (instruction in impl.instructions) {
                    val ref = (instruction as? ReferenceInstruction)?.reference
                    if (ref is StringReference && ref.string == "photos.killswitch_info_panel_map") {
                        foundStringDistance = 0
                    } else if (foundStringDistance in 0..15 && ref is FieldReference && instruction.opcode.name.startsWith("sput", ignoreCase = true)) {
                        killswitchFieldRef = ref
                        println(">>> GmsCoreSupportPatch: Discovered killswitch field: ${ref.definingClass}->${ref.name}")
                        break
                    } else if (foundStringDistance >= 0) {
                        foundStringDistance++
                    }
                }
            }
        }

        if (killswitchFieldRef != null) {
            val targetField = killswitchFieldRef!!
            classDefForEach { classDef ->
                val mutableClass by lazy { mutableClassDefBy(classDef) }
                classDef.methods.forEach { method ->
                    val impl = method.implementation ?: return@forEach
                    val instructions = impl.instructions.toList()
                    var sgetDistance = -1
                    instructions.forEachIndexed { index, instruction ->
                        val ref = (instruction as? ReferenceInstruction)?.reference
                        if (ref is FieldReference && ref.definingClass == targetField.definingClass && ref.name == targetField.name && instruction.opcode.name.startsWith("sget", ignoreCase = true)) {
                            sgetDistance = 0
                            println(">>> GmsCoreSupportPatch: SGET matched in ${classDef.type}->${method.name} at ins $index")
                        } else if (sgetDistance in 0..5 && ref is MethodReference && ref.returnType == "Z" && instruction.opcode.name.startsWith("invoke", ignoreCase = true)) {
                            sgetDistance = -1
                            val nextIndex = index + 1
                            if (nextIndex < instructions.size) {
                                val nextIns = instructions[nextIndex]
                                if (nextIns is OneRegisterInstruction && nextIns.opcode.name.startsWith("move-result", ignoreCase = true)) {
                                    val reg = nextIns.registerA
                                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                                    mutableMethod.addInstruction(
                                        nextIndex + 1,
                                        "invoke-static {v$reg}, Lapp/morphe/extension/shared/patches/GmsCoreSupportPatch;->isInfoPanelMapKillswitched(Z)Z",
                                    )
                                    mutableMethod.addInstruction(
                                        nextIndex + 2,
                                        "move-result v$reg",
                                    )
                                    println(">>> GmsCoreSupportPatch: Successfully injected isInfoPanelMapKillswitched into ${classDef.type}->${method.name} at ins ${nextIndex + 1}")
                                }
                            }
                        } else if (sgetDistance >= 0) {
                            sgetDistance++
                        }
                    }
                }
            }
        } else {
            println(">>> GmsCoreSupportPatch: WARNING - killswitchFieldRef was null!")
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
                    val receiverNotExported = "DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"

                    (permissions + usesPermissions)
                        .map { it as Element }
                        .filter { it.getAttribute("android:name") == "$originalPackageName.$receiverNotExported" }
                        .forEach { it.setAttribute("android:name", "$targetPackageName.$receiverNotExported") }

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

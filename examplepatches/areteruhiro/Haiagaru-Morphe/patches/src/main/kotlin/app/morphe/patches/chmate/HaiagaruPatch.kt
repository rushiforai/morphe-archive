package app.morphe.patches.chmate

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.findFreeRegister
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

private const val EXTENSION = "Lapp/morphe/extension/chmate/Haiagaru;"

private val compatibility = Compatibility(
    name = "ChMate",
    packageName = "jp.co.airfront.android.a2chMate",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x607D8B,
    signatures = setOf(
        "7dd84d97df4666fbc8188b8d6167ce59314636997f0edae82d685fffda4059d2"
    ),
    targets = listOf(
        AppTarget(
            version = "0.8.10.191 dev",
            minSdk = 21
        ),
        AppTarget(
            version = "0.8.10.241",
            minSdk = 23
        ),
        AppTarget(
            version = "0.8.10.242 dev",
            minSdk = 23
        ),
        AppTarget(
            version = "0.8.10.243 dev",
            minSdk = 24
        )
    )
)

private object SettingsOnResumeFingerprint : Fingerprint(
    definingClass = "Ljp/syoboi/a2chMate/activity/SettingActivity;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList()
)

private object SettingsOnCreateFingerprint : Fingerprint(
    definingClass = "Ljp/syoboi/a2chMate/activity/SettingActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

private object HiltSettingsOnCreateFingerprint : Fingerprint(
    definingClass = "Ljp/syoboi/a2chMate/activity/Hilt_SettingActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

private data class ChMateProfile(
    val providerClass: String,
    val providerStartupTrapClass: String?,
    val settingsViewModelClass: String?,
    val applicationClass: String,
    val homeFragmentClass: String,
    val cookieClearMethod: String,
    val signatureClass: String,
    val signatureMethod: String,
    val signatureDelegateField: String,
    val signatureDelegateType: String,
    val signatureDelegateMethod: String,
    val signatureSuperType: String,
    val patchSignatureWrapper: Boolean,
    val signatureDirectWrapperBypass: Boolean,
    val viewModelFactoryClass: String?,
    val viewModelDispatchField: String,
    val viewModelTrapKind: ViewModelTrapKind,
    val settingsWindowFeatureDivideTrap: Boolean,
    val hasHiltSettings: Boolean,
    val hasLevelPlayBanner: Boolean,
    val homeAdClass: String,
    val homeAdLoadMethod: String?,
)

private enum class ViewModelTrapKind {
    NONE,
    DIVIDE_BY_ZERO,
    FAILURE_BRANCH,
}

private fun profileFor(versionName: String) = when (versionName) {
    "0.8.10.191 dev" -> ChMateProfile(
        providerClass = "Lo/ndExternalSyntheticLambda7;",
        providerStartupTrapClass = "Lo/mc${'$'}5;",
        settingsViewModelClass = "Lo/onAppOpenAdLoadFailed;",
        applicationClass = "Lo/lo;",
        homeFragmentClass = "Lo/r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk;",
        cookieClearMethod = "b",
        signatureClass = "",
        signatureMethod = "",
        signatureDelegateField = "",
        signatureDelegateType = "",
        signatureDelegateMethod = "",
        signatureSuperType = "",
        patchSignatureWrapper = false,
        // The legacy settings Activity has the same normal fall-through/failure-branch
        // shape even though it predates the provider wrapper used by newer versions.
        signatureDirectWrapperBypass = true,
        viewModelFactoryClass = null,
        viewModelDispatchField = "",
        viewModelTrapKind = ViewModelTrapKind.NONE,
        settingsWindowFeatureDivideTrap = false,
        hasHiltSettings = false,
        hasLevelPlayBanner = false,
        homeAdClass = "Lo/qheCC;",
        homeAdLoadMethod = null,
    )
    "0.8.10.241" -> ChMateProfile(
        providerClass = "Lo/Kjv22;",
        providerStartupTrapClass = null,
        settingsViewModelClass = null,
        applicationClass = "Ljp/syoboi/a2chMate/RoidonApp;",
        homeFragmentClass = "Ljp/syoboi/a2chMate/ui/home/HomeFragment;",
        cookieClearMethod = "e",
        signatureClass = "Lo/getWebView${'$'}3;",
        signatureMethod = "a",
        signatureDelegateField = "a",
        signatureDelegateType = "Lo/getWebView${'$'}write;",
        signatureDelegateMethod = "a",
        signatureSuperType = "Lo/getWebView${'$'}IconCompatParcelizer;",
        patchSignatureWrapper = true,
        signatureDirectWrapperBypass = true,
        viewModelFactoryClass =
            "Lo/getBorderWidth${'$'}r8lambdavCwjfXDiSGcirCy4I008VOiJ_lw${'$'}RemoteActionCompatParcelizer;",
        viewModelDispatchField = "c",
        viewModelTrapKind = ViewModelTrapKind.FAILURE_BRANCH,
        settingsWindowFeatureDivideTrap = true,
        hasHiltSettings = true,
        hasLevelPlayBanner = true,
        homeAdClass = "Lo/setUseHandlerThreadForCallbacks;",
        homeAdLoadMethod = "e",
    )
    "0.8.10.242 dev" -> ChMateProfile(
        providerClass = "Lo/isConnected;",
        providerStartupTrapClass = null,
        settingsViewModelClass = null,
        applicationClass = "Ljp/syoboi/a2chMate/RoidonApp;",
        homeFragmentClass = "Ljp/syoboi/a2chMate/ui/home/HomeFragment;",
        cookieClearMethod = "e",
        signatureClass = "Lo/TTRewardExpressVideoActivity${'$'}5;",
        signatureMethod = "c",
        signatureDelegateField = "a",
        signatureDelegateType = "Lo/TTRewardExpressVideoActivity${'$'}read;",
        signatureDelegateMethod = "c",
        signatureSuperType =
            "Lo/TTRewardExpressVideoActivity${'$'}RemoteActionCompatParcelizer;",
        patchSignatureWrapper = true,
        signatureDirectWrapperBypass = true,
        viewModelFactoryClass =
            "Lo/onInterstitialDismissed${'$'}_init_lambda2${'$'}ComponentActivity;",
        viewModelDispatchField = "e",
        viewModelTrapKind = ViewModelTrapKind.FAILURE_BRANCH,
        settingsWindowFeatureDivideTrap = false,
        hasHiltSettings = true,
        hasLevelPlayBanner = true,
        homeAdClass = "Lo/zzbgb;",
        homeAdLoadMethod = "d",
    )
    "0.8.10.243 dev" -> ChMateProfile(
        providerClass = "Lo/zzbvh;",
        providerStartupTrapClass = null,
        settingsViewModelClass = null,
        applicationClass = "Ljp/syoboi/a2chMate/RoidonApp;",
        homeFragmentClass = "Ljp/syoboi/a2chMate/ui/home/HomeFragment;",
        cookieClearMethod = "a",
        signatureClass = "Lo/SafeParcelableReserved${'$'}4;",
        signatureMethod = "a",
        signatureDelegateField = "b",
        signatureDelegateType = "Lo/SafeParcelableReserved${'$'}RemoteActionCompatParcelizer;",
        signatureDelegateMethod = "a",
        signatureSuperType = "Lo/SafeParcelableReserved${'$'}IconCompatParcelizer;",
        patchSignatureWrapper = true,
        signatureDirectWrapperBypass = false,
        viewModelFactoryClass = "Lo/hasData${'$'}_init_lambda2${'$'}write;",
        viewModelDispatchField = "d",
        viewModelTrapKind = ViewModelTrapKind.DIVIDE_BY_ZERO,
        settingsWindowFeatureDivideTrap = false,
        hasHiltSettings = true,
        hasLevelPlayBanner = true,
        homeAdClass = "Lo/zzexb;",
        homeAdLoadMethod = "c",
    )
    else -> error("Unsupported ChMate version: $versionName")
}

@Suppress("unused")
val haiagaruPatch = bytecodePatch(
    name = "Haiagaru",
    description = "Ports the Haiagaru ChMate module, including its in-app settings.",
) {
    compatibleWith(compatibility)
    extendWith("extensions/chmate.mpe")

    execute {
        val profile = profileFor(packageMetadata.versionName)

        mutableClassDefBy(profile.providerClass).methods.single { method ->
            method.name == "onCreate"
                && method.returnType == "Z"
                && method.parameters.isEmpty()
        }.addInstruction(
            0,
            "invoke-static { }, $EXTENSION->installSignatureSpoof()V"
        )
        profile.providerStartupTrapClass?.let { startupTrapClass ->
            mutableClassDefBy(startupTrapClass).methods.single { method ->
                method.name == "a"
                    && method.returnType == "Ljava/lang/Object;"
                    && method.parameters.isEmpty()
            }.returnProviderStartupDelegate()
        }

        mutableClassDefBy(profile.applicationClass).methods.single { method ->
            method.name == "onCreate"
                && method.returnType == "V"
                && method.parameters.isEmpty()
        }.addBeforeEveryReturn(
            "invoke-static/range { p0 .. p0 }, $EXTENSION->onApplicationCreate(Landroid/app/Application;)V"
        )
        SettingsOnResumeFingerprint.method.addBeforeEveryReturn(
            "invoke-static/range { p0 .. p0 }, $EXTENSION->onSettingsResume(Landroid/app/Activity;)V"
        )
        if (packageMetadata.versionName == "0.8.10.191 dev") {
            patchLegacyFragmentBannerDiscovery()
            patchLegacyImageUploadTempName()
            patchLegacyImageUploadCall()
        } else {
            // ChMate 0.8.10.242 reuses the p1 register later in onViewCreated. Inject while
            // p1 is still guaranteed to contain the Fragment root; the extension posts its
            // scans to the view queue, so child views are inspected after construction.
            mutableClassDefBy(profile.homeFragmentClass).methods.single { method ->
                method.name == "onViewCreated"
                    && method.returnType == "V"
                    && method.parameters.map(CharSequence::toString) ==
                    listOf("Landroid/view/View;", "Landroid/os/Bundle;")
            }.addInstruction(
                0,
                "invoke-static/range { p1 .. p1 }, $EXTENSION->hideHomeBanner(Landroid/view/View;)V"
            )
        }
        mutableClassDefBy(
            "Lcom/franmontiel/persistentcookiejar/persistence/SharedPrefsCookiePersistor;"
        ).methods.single { method ->
            method.name == profile.cookieClearMethod
                && method.returnType == "V"
                && method.parameters.isEmpty()
        }.addBeforeEveryReturn(
            "invoke-static { }, $EXTENSION->removeMonaKey()V"
        )

        // ChMate performs initialization and a signature check from this provider before
        // Application.onCreate. Preserve the provider and all initialization, and convert only
        // the check's numeric RuntimeException rejection into the same delegate return used by
        // its successful path.
        if (profile.patchSignatureWrapper) {
            mutableClassDefBy(profile.signatureClass).methods.single { method ->
                method.name == profile.signatureMethod
                    && method.returnType == "Ljava/lang/Object;"
                    && method.parameters.isEmpty()
            }.ignoreSignatureRejection(profile)
            if (profile.signatureDirectWrapperBypass) {
                mutableClassDefBy(profile.signatureSuperType).methods.single { method ->
                    method.name == profile.signatureDelegateMethod
                        && method.returnType == "Ljava/lang/Object;"
                        && method.parameters.isEmpty()
                }.bypassSignatureFailureBranches()
            }
        }

        profile.viewModelFactoryClass?.let { viewModelFactoryClass ->
            mutableClassDefBy(viewModelFactoryClass).methods.single { method ->
                method.name == "get"
                    && method.returnType == "Ljava/lang/Object;"
                    && method.parameters.isEmpty()
            }.bypassTamperTrap(profile)
        }
        profile.settingsViewModelClass?.let { viewModelClass ->
            mutableClassDefBy(viewModelClass).methods.single { method ->
                method.name == "<init>"
                    && method.returnType == "V"
                    && method.parameters.map(CharSequence::toString) ==
                    listOf("Landroid/app/Application;")
            }.bypassLegacyViewModelTamperTrap()
        }
        if (profile.viewModelTrapKind != ViewModelTrapKind.NONE
            || profile.settingsViewModelClass != null
        ) {
            SettingsOnCreateFingerprint.method.bypassSettingsTamperTrap(profile)
            if (profile.hasHiltSettings) {
                HiltSettingsOnCreateFingerprint.method.bypassHiltSettingsTamperTrap(profile)
            }
        }
        patchDistributedIntegrityComparisons(
            includeAllObfuscatedClasses = packageMetadata.versionName == "0.8.10.191 dev"
        )

        buildList {
            add("Lcom/amazon/device/ads/DTBAdRequest;")
            if (profile.hasLevelPlayBanner) {
                add("Lcom/unity3d/mediation/banner/LevelPlayBannerAdView;")
            }
        }.forEach { classType ->
            mutableClassDefBy(classType).methods
                .filter { it.name == "loadAd" && it.returnType == "V" }
                .forEach { it.addHideAdsGuard() }
        }

        if (profile.hasLevelPlayBanner) {
            mutableClassDefBy("Lcom/unity3d/mediation/banner/LevelPlayBannerAdView;")
                .methods
                .filter { it.name == "<init>" }
                .forEach {
                    it.addBeforeEveryReturn(
                        "invoke-static/range { p0 .. p0 }, $EXTENSION->hideAdView(Landroid/view/View;)V"
                    )
                }
        }

        // The exact class is version-specific, but each target was matched by the same
        // FrameLayout/ad-placement/load-method structure instead of by its obfuscated name.
        mutableClassDefBy(profile.homeAdClass).methods.forEach { method ->
            when {
                method.name == "<init>" -> method.addBeforeEveryReturn(
                    "invoke-static/range { p0 .. p0 }, $EXTENSION->hideAdView(Landroid/view/View;)V"
                )
                profile.homeAdLoadMethod != null
                    && method.name == profile.homeAdLoadMethod
                    && method.returnType == "V"
                    && method.parameters.isEmpty() ->
                    method.addHideAdsViewGuard()
            }
        }

        if (packageMetadata.versionName == "0.8.10.191 dev") {
            patchLegacy5chIoCompatibility()
        } else {
            patchSetTextCalls()
        }
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyFragmentBannerDiscovery() {
    classDefForEach { classDef ->
        if (!classDef.type.startsWith("Ljp/syoboi/") && !classDef.type.startsWith("Lo/")) {
            return@classDefForEach
        }

        val candidates = classDef.methods.filter { method ->
            method.name == "onViewCreated"
                && method.returnType == "V"
                && method.parameters.map(CharSequence::toString) ==
                listOf("Landroid/view/View;", "Landroid/os/Bundle;")
                && method.implementation != null
        }
        if (candidates.isEmpty()) return@classDefForEach

        val mutableClass = mutableClassDefBy(classDef)
        candidates.forEach { method ->
            mutableClass.findMutableMethodOf(method).addInstruction(
                0,
                "invoke-static/range { p1 .. p1 }, $EXTENSION->hideLegacyBanner(Landroid/view/View;)V"
            )
        }
    }
}

private fun MutableMethod.returnProviderStartupDelegate() {
    addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, p0
            iget-object v0, v0, Lo/mc${'$'}5;->e:Lo/mc${'$'}read;
            invoke-virtual { v0 }, Lo/mc${'$'}read;->a()Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """
    )
}

private fun MutableMethod.bypassLegacyViewModelTamperTrap() {
    val instructions = implementation?.instructions
        ?: error("ChMate legacy settings ViewModel constructor has no implementation")
    val trapIndex = instructions.indices.firstOrNull { index ->
        index + 2 < instructions.size
            && instructions[index].opcode == Opcode.NEW_ARRAY
            && instructions[index + 1].opcode == Opcode.ADD_INT_LIT8
            && instructions[index + 2].opcode == Opcode.APUT
    } ?: error("ChMate legacy settings ViewModel array trap was not found")
    val failureBranchIndex = instructions.subList(0, trapIndex)
        .indexOfLast { it.opcode == Opcode.IF_NE }
        .takeIf { it >= 0 }
        ?: error("ChMate legacy settings ViewModel failure branch was not found")

    replaceInstruction(failureBranchIndex, "nop")

    // The constructor later derives the SharedPreferences mode from the same
    // certificate state. On a re-signed APK the decoy calculation makes its
    // divisor zero; the real value is Context.MODE_PRIVATE (0).
    val preferencesNameIndex = instructions.indices.firstOrNull { index ->
        ((instructions[index] as? ReferenceInstruction)?.reference as? StringReference)
            ?.string == "dispose_dialog"
    } ?: error("ChMate legacy settings preferences initialization was not found")
    val modeDivisionIndex = instructions.subList(maxOf(0, preferencesNameIndex - 80), preferencesNameIndex)
        .indexOfLast { it.opcode == Opcode.DIV_INT }
        .takeIf { it >= 0 }
        ?.plus(maxOf(0, preferencesNameIndex - 80))
        ?: error("ChMate legacy settings preferences mode trap was not found")
    val modeRegister = (instructions[modeDivisionIndex] as ThreeRegisterInstruction).registerA
    replaceInstruction(modeDivisionIndex, "const/4 v$modeRegister, 0x0")
}

private fun MutableMethod.bypassHiltSettingsTamperTrap(profile: ChMateProfile) {
    val instructions = implementation?.instructions
        ?: error("ChMate Hilt settings onCreate has no implementation")
    if (profile.signatureDirectWrapperBypass) {
        val failureBranchIndex = instructions.indexOfLast { it.opcode == Opcode.IF_NE }
            .takeIf { it >= 0 }
            ?: error("ChMate Hilt settings signature branch was not found")
        replaceInstruction(failureBranchIndex, "nop")
        return
    }

    val rejectionConstructorIndex = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@indexOfFirst false
        reference.definingClass == "Ljava/lang/RuntimeException;"
            && reference.name == "<init>"
            && reference.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;")
    }.takeIf { it >= 0 }
        ?: error("ChMate Hilt settings signature rejection was not found")
    val failureBranchIndex = instructions.subList(0, rejectionConstructorIndex)
        .indexOfLast { it.opcode == Opcode.IF_NE }
        .takeIf { it >= 0 }
        ?: error("ChMate Hilt settings signature branch was not found")

    replaceInstruction(failureBranchIndex, "nop")
}

private fun MutableMethod.bypassSettingsTamperTrap(profile: ChMateProfile) {
    val instructions = implementation?.instructions
        ?: error("ChMate settings onCreate has no implementation")
    if (profile.settingsWindowFeatureDivideTrap) {
        // 0.8.10.241 derives FEATURE_NO_TITLE through an integrity-dependent divisor.
        // Re-signing can make that divisor zero, so retain the normal value directly.
        val requestWindowFeatureIndex = instructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@indexOfFirst false
            reference.definingClass == "Landroid/app/Activity;"
                && reference.name == "requestWindowFeature"
                && reference.parameterTypes.map(CharSequence::toString) == listOf("I")
        }.takeIf { it >= 0 }
            ?: error("ChMate settings requestWindowFeature call was not found")
        val divideIndex = instructions.subList(0, requestWindowFeatureIndex)
            .indexOfLast { it.opcode == Opcode.DIV_INT_2ADDR }
            .takeIf { it >= 0 }
            ?: error("ChMate settings window feature divide trap was not found")
        val featureRegister = (instructions[divideIndex] as TwoRegisterInstruction).registerA
        replaceInstruction(
            divideIndex,
            "const/4 v$featureRegister, 0x1"
        )
    }

    val failureBranchIndex = if (profile.signatureDirectWrapperBypass) {
        instructions.indexOfLast { it.opcode == Opcode.IF_NE }
            .takeIf { it >= 0 }
            ?: error("ChMate settings tamper branch was not found")
    } else {
        val trapIndex = instructions.indices.firstOrNull { index ->
            index + 7 < instructions.size
                && instructions[index].opcode == Opcode.NEW_ARRAY
                && instructions[index + 1].opcode == Opcode.ADD_INT_LIT8
                && instructions[index + 2].opcode == Opcode.APUT
                && instructions[index + 3].opcode == Opcode.MUL_INT_2ADDR
                && instructions[index + 4].opcode == Opcode.CONST_4
                && instructions[index + 5].opcode == Opcode.REM_INT_2ADDR
                && instructions[index + 6].opcode == Opcode.SUB_INT_2ADDR
                && instructions[index + 7].opcode == Opcode.AGET
        } ?: error("ChMate settings tamper trap was not found")
        instructions.subList(0, trapIndex)
            .indexOfLast { it.opcode == Opcode.IF_NE }
            .takeIf { it >= 0 }
            ?: error("ChMate settings tamper branch was not found")
    }

    // Falling through this branch executes ChMate's complete normal initialization path,
    // including the Object[] state later consumed by the real settings setup.
    replaceInstruction(failureBranchIndex, "nop")

    // The final obfuscated calculation supplies only the fallback for the preferenceXml
    // intent extra. Re-signing turns its denominator into zero; an actual supplied extra
    // remains authoritative, while zero means no preselected settings page.
    val preferenceDefaultDivideIndex = instructions.indexOfLast {
        it.opcode == Opcode.DIV_INT_2ADDR
    }.takeIf { it >= 0 }
        ?: error("ChMate settings preferenceXml fallback was not found")
    val preferenceDefaultRegister =
        (instructions[preferenceDefaultDivideIndex] as TwoRegisterInstruction).registerA
    replaceInstruction(
        preferenceDefaultDivideIndex,
        "const/4 v$preferenceDefaultRegister, 0x0"
    )
}

private fun MutableMethod.bypassTamperTrap(profile: ChMateProfile) {
    val instructions = implementation?.instructions
        ?: error("ChMate ViewModel factory has no implementation")
    val dispatchIndex = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            ?: return@indexOfFirst false
        instruction.opcode == Opcode.IGET
            && reference.definingClass == profile.viewModelFactoryClass
            && reference.name == profile.viewModelDispatchField
            && reference.type == "I"
    }.takeIf { it > 0 }
        ?: error("ChMate ViewModel factory dispatch was not found")

    when (profile.viewModelTrapKind) {
        ViewModelTrapKind.NONE -> Unit
        ViewModelTrapKind.DIVIDE_BY_ZERO -> {
            val divideIndex = instructions.subList(0, dispatchIndex)
                .indexOfLast { it.opcode == Opcode.DIV_INT_2ADDR }
                .takeIf { it >= 0 }
                ?: error("ChMate ViewModel factory divide trap was not found")
            addInstructionsWithLabels(
                divideIndex,
                "goto/32 :haiagaru_dispatch",
                ExternalLabel("haiagaru_dispatch", instructions[dispatchIndex])
            )
        }
        ViewModelTrapKind.FAILURE_BRANCH -> {
            val failureBranchIndex = instructions.subList(0, dispatchIndex)
                // 0.8.10.242 compares two values produced by its integrity state and
                // sends inequality to the RuntimeException(String) block. The normal
                // fall-through immediately loads the factory discriminator and switches.
                .indexOfLast { it.opcode == Opcode.IF_NE }
                .takeIf { it >= 0 }
                ?: error("ChMate ViewModel factory failure branch was not found")
            replaceInstruction(failureBranchIndex, "nop")
        }
    }
}

private fun MutableMethod.ignoreSignatureRejection(profile: ChMateProfile) {
    if (profile.signatureDirectWrapperBypass) {
        // 0.8.10.242 encodes rejection as IF_NE -> null throw in both wrapper layers.
        // Keep their complete initialization and delegate calls, but force the normal path.
        bypassSignatureFailureBranches()
        return
    }

    val instructions = implementation?.instructions
        ?: error("ChMate signature check has no implementation")
    val rejectionConstructorIndex = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@indexOfFirst false
        reference.definingClass == "Ljava/lang/RuntimeException;"
            && reference.name == "<init>"
            && reference.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;")
    }.takeIf { it >= 0 }
        ?: error("ChMate signature rejection constructor was not found")
    val throwOffset = instructions.drop(rejectionConstructorIndex)
        .indexOfFirst { it.opcode == Opcode.THROW }
        .takeIf { it >= 0 }
        ?: error("ChMate signature rejection throw was not found")
    val rejectionThrowIndex = rejectionConstructorIndex + throwOffset

    addInstructionsWithLabels(
        rejectionThrowIndex,
        """
            move-object/from16 v0, p0
            iget-object v0, v0, ${profile.signatureClass}->${profile.signatureDelegateField}:${profile.signatureDelegateType}
            invoke-virtual { v0 }, ${profile.signatureDelegateType}->${profile.signatureDelegateMethod}()Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """
    )
}

private fun MutableMethod.bypassSignatureFailureBranches() {
    val branchIndexes = implementation?.instructions
        ?.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.IF_NE) index else null
        }
        .orEmpty()
    if (branchIndexes.isEmpty()) {
        error("ChMate signature failure branches were not found")
    }
    branchIndexes.asReversed().forEach { replaceInstruction(it, "nop") }
}

private fun MutableMethod.addHideAdsViewGuard() {
    val freeRegister = findFreeRegister(0)
    addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->hideAdView(Landroid/view/View;)V
            invoke-static { }, $EXTENSION->shouldHideAds()Z
            move-result v$freeRegister
            if-eqz v$freeRegister, :show_ads
            return-void
            :show_ads
            nop
        """
    )
}

private fun MutableMethod.addHideAdsGuard() {
    val freeRegister = findFreeRegister(0)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $EXTENSION->shouldHideAds()Z
            move-result v$freeRegister
            if-eqz v$freeRegister, :show_ads
            return-void
            :show_ads
            nop
        """
    )
}

private fun MutableMethod.addBeforeEveryReturn(instruction: String) {
    implementation?.instructions
        ?.mapIndexedNotNull { index, value ->
            if (value.opcode == Opcode.RETURN_VOID) index else null
        }
        ?.asReversed()
        ?.forEach { addInstruction(it, instruction) }
}

/**
 * ChMate repeats its certificate-derived comparison inside many screen ViewModel
 * constructors. The names and surrounding arithmetic change between builds, but the
 * comparison is structurally stable: two int values are read from the obfuscator's
 * Object[] state and IF_NE jumps to a decoy exception block. Keep the real constructor
 * body by forcing the equality fall-through.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchDistributedIntegrityComparisons(
    includeAllObfuscatedClasses: Boolean = false,
) {
    classDefForEach { classDef ->
        if (!classDef.type.startsWith("Ljp/syoboi/")
            && classDef.type != "Lo/getLabel;"
            && !(includeAllObfuscatedClasses && classDef.type.startsWith("Lo/"))
        ) {
            return@classDefForEach
        }

        val mutableClass by lazy { mutableClassDefBy(classDef) }
        classDef.methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            val preserveLegacyImageArithmetic = classDef.type == "Lo/nq;"
                && method.name == "e"
                && method.returnType == "Lo/r0ExternalSyntheticLambda13;"
                && method.parameters.isEmpty()
            val matches = instructions.indices.filter { index ->
                if (instructions[index].opcode != Opcode.IF_NE) return@filter false
                val window = instructions.subList(maxOf(0, index - 12), index)
                window.count { it.opcode == Opcode.AGET_OBJECT } >= 2
                    && window.count { it.opcode == Opcode.CHECK_CAST } >= 2
                    && window.count { it.opcode == Opcode.AGET } >= 2
            }
            val literalZeroDivides = if (includeAllObfuscatedClasses
                && !preserveLegacyImageArithmetic
            ) {
                instructions.indices.filter { index ->
                    val instruction = instructions[index]
                    (instruction.opcode == Opcode.DIV_INT_LIT8
                        || instruction.opcode == Opcode.DIV_INT_LIT16)
                        && (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0
                }
            } else {
                emptyList()
            }

            val provableZeroDivides = if (includeAllObfuscatedClasses
                && !preserveLegacyImageArithmetic
            ) {
                instructions.indices.filter { index ->
                    val instruction = instructions[index]
                    if (instruction.opcode != Opcode.DIV_INT
                        && instruction.opcode != Opcode.DIV_INT_2ADDR
                    ) {
                        return@filter false
                    }
                    fun wasSetToZero(register: Int): Boolean {
                        return instructions.subList(maxOf(0, index - 5), index)
                            .indexOfLast { previous ->
                                (previous as? OneRegisterInstruction)?.registerA == register
                                    && (previous as? NarrowLiteralInstruction)?.narrowLiteral == 0
                            } >= 0
                    }
                    when (instruction) {
                        is ThreeRegisterInstruction ->
                            wasSetToZero(instruction.registerB)
                                || wasSetToZero(instruction.registerC)
                        is TwoRegisterInstruction ->
                            wasSetToZero(instruction.registerA)
                                || wasSetToZero(instruction.registerB)
                        else -> false
                    }
                }
            } else {
                emptyList()
            }

            // nq.e is the legacy image upload pipeline. Its divisions are decoder and
            // payload arithmetic, not rejection traps; rewriting them can inflate an
            // ordinary image into a near-gigabyte allocation.
            val derivedValueDivides = if (matches.isNotEmpty()
                && !preserveLegacyImageArithmetic
            ) {
                instructions.indices.filter { index ->
                    val instruction = instructions[index]
                    if (instruction.opcode != Opcode.DIV_INT
                        && instruction.opcode != Opcode.DIV_INT_2ADDR
                    ) {
                        return@filter false
                    }
                    val nextInstructions = instructions.subList(
                        index + 1,
                        minOf(index + 16, instructions.size)
                    )
                    val discardedBeforeFlagDecode = instruction.opcode == Opcode.DIV_INT
                        && nextInstructions.firstOrNull()?.opcode == Opcode.AND_INT_LIT8
                    val suppliesFrameworkIndex = nextInstructions.any { next ->
                        val reference = (next as? ReferenceInstruction)?.reference
                            as? MethodReference ?: return@any false
                        (reference.definingClass == "Ljava/lang/String;"
                            && reference.name == "substring"
                            && reference.parameterTypes.map(CharSequence::toString) == listOf("I"))
                            || (reference.definingClass == "Landroid/content/Context;"
                                && reference.name == "getSharedPreferences"
                                && reference.parameterTypes.map(CharSequence::toString) ==
                                listOf("Ljava/lang/String;", "I"))
                    }
                    discardedBeforeFlagDecode || suppliesFrameworkIndex
                }
            } else {
                emptyList()
            }

            if (matches.isEmpty() && literalZeroDivides.isEmpty()
                && provableZeroDivides.isEmpty()
                && derivedValueDivides.isEmpty()
            ) return@forEach

            val mutableMethod = mutableClass.findMutableMethodOf(method)
            matches.asReversed().forEach { mutableMethod.replaceInstruction(it, "nop") }
            (literalZeroDivides + provableZeroDivides + derivedValueDivides)
                .distinct()
                .sortedDescending()
                .forEach { index ->
                    val register = when (val instruction = instructions[index]) {
                        is ThreeRegisterInstruction -> instruction.registerA
                        is TwoRegisterInstruction -> instruction.registerA
                        else -> error("ChMate integrity divide destination was not found")
                    }
                    mutableMethod.replaceInstruction(index, "const/16 v$register, 0x0")
                }
        }
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyImageUploadTempName() {
    val method = mutableClassDefBy("Lo/nq;").methods.single { method ->
        method.name == "e"
            && method.returnType == "Lo/r0ExternalSyntheticLambda13;"
            && method.parameters.isEmpty()
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate legacy image upload method has no implementation")
    val encodedNameIndex = instructions.indexOfFirst { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string ==
            "22|3|22|9|18|uploading"
    }.takeIf { it >= 0 }
        ?: error("ChMate legacy image upload filename was not found")
    val substringIndex = (encodedNameIndex until instructions.size).firstOrNull { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@firstOrNull false
        reference.definingClass == "Ljava/lang/String;"
            && reference.name == "substring"
            && reference.returnType == "Ljava/lang/String;"
            && reference.parameterTypes.map(CharSequence::toString) == listOf("I")
    } ?: error("ChMate legacy image upload filename decoder was not found")
    val substringInstruction = instructions[substringIndex]
    val indexRegister = when (substringInstruction) {
        is FiveRegisterInstruction -> substringInstruction.registerD
        is RegisterRangeInstruction -> substringInstruction.startRegister + 1
        else -> error("ChMate legacy image upload filename register was not found")
    }
    val divideIndex = (encodedNameIndex until substringIndex).lastOrNull { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.DIV_INT_2ADDR
            && (instruction as? TwoRegisterInstruction)?.registerA == indexRegister
    } ?: error("ChMate legacy image upload filename division was not found")

    // The decoded suffix begins at character 13. Avoid the signature-derived divisor
    // while leaving file copying, image decoding, resizing, and uploading untouched.
    method.replaceInstruction(divideIndex, "const/16 v$indexRegister, 0xd")
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyImageUploadCall() {
    val method = mutableClassDefBy("Lo/nq;").methods.single { method ->
        method.name == "e"
            && method.returnType == "Lo/r0ExternalSyntheticLambda13;"
            && method.parameters.isEmpty()
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate legacy image upload method has no implementation")
    val invokeIndex = instructions.indices.single { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@single false
        reference.definingClass == "Ljava/lang/reflect/Method;"
            && reference.name == "invoke"
            && reference.returnType == "Ljava/lang/Object;"
            && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
            && ((instructions.getOrNull(index + 2) as? ReferenceInstruction)?.reference
                as? TypeReference)?.type == "Lo/r0ExternalSyntheticLambda13;"
    }
    val argumentArrayRegister = when (val invocation = instructions[invokeIndex]) {
        is FiveRegisterInstruction -> invocation.registerE
        is RegisterRangeInstruction -> invocation.startRegister + 2
        else -> error("ChMate legacy image upload invocation arguments were not found")
    }
    method.replaceInstruction(
        invokeIndex,
        "invoke-static/range { v$argumentArrayRegister .. v$argumentArrayRegister }, " +
            "$EXTENSION->uploadLegacyImage([Ljava/lang/Object;)Ljava/lang/Object;"
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchSetTextCalls() {
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/chmate/")) {
            return@classDefForEach
        }

        val mutableClass by lazy { mutableClassDefBy(classDef) }
        classDef.methods.forEach { method ->
            val matches = method.implementation?.instructions
                ?.mapIndexedNotNull { index, instruction ->
                    val reference = (instruction as? ReferenceInstruction)
                        ?.reference as? MethodReference
                        ?: return@mapIndexedNotNull null
                    if (reference.name != "setText"
                        || reference.parameterTypes.firstOrNull() != "Ljava/lang/CharSequence;"
                    ) {
                        return@mapIndexedNotNull null
                    }

                    val argumentRegister = when (instruction) {
                        is FiveRegisterInstruction -> instruction.registerD
                        is RegisterRangeInstruction -> instruction.startRegister + 1
                        else -> return@mapIndexedNotNull null
                    }
                    index to argumentRegister
                }
                ?.toList()
                .orEmpty()

            if (matches.isEmpty()) return@forEach
            val mutableMethod = mutableClass.findMutableMethodOf(method)
            matches.asReversed().forEach { (index, register) ->
                mutableMethod.addInstructionsWithLabels(
                    index,
                    """
                        invoke-static/range { v$register .. v$register }, $EXTENSION->replace5chDomain(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
                        move-result-object v$register
                    """
                )
            }
        }
    }
}

/**
 * Restores the current 5ch.io transport contract in the last pre-io ChMate build.
 * The legacy URL model and posting engine are retained; only their domain, clock,
 * and confirmation semantics are adapted.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacy5chIoCompatibility() {
    val urlInfoClass = mutableClassDefBy("Ljp/syoboi/a2chMate/client/BBSUrlInfo;")
    val legacyLinkParserType =
        "Ljp/syoboi/utils/NativeUtils\$RemoteActionCompatParcelizer;"

    // The 191 native text parser predates img.5ch.io. Feed only sssp BE tokens
    // through its known host form so it selects the emoticon-span branch. The
    // drawable constructor below changes the extracted fetch URL back to .io.
    val legacyTextParserMethod = mutableClassDefBy("Lo/ocd;").methods.single { method ->
        method.name == "e"
            && method.returnType == "V"
            && method.parameters.map(CharSequence::toString) == listOf(
                legacyLinkParserType,
                "Lo/o8;",
                "Ljava/lang/String;",
                "Lo/r8lambda0m18vyepBPbBImKp0mAya80YXc8;",
                "Z"
            )
    }
    legacyTextParserMethod.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p2 .. p2 }, $EXTENSION->prepareLegacyBeParsing(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p2
        """
    )

    // Some current responses expose the BE image as a regular or protocol-relative
    // URL. Correct the native parser's result buffer directly so the existing 191
    // emoticon branch is selected regardless of the input URL spelling.
    val legacyTextParserInstructions = legacyTextParserMethod.implementation?.instructions
        ?: error("ChMate legacy text parser has no implementation")
    val linkScanIndex = legacyTextParserInstructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@mapIndexedNotNull null
        if (reference.definingClass == legacyLinkParserType
            && reference.name == "a"
            && reference.returnType == "Z"
            && reference.parameterTypes.isEmpty()
        ) index else null
    }.single()
    val linkFoundRegister = (legacyTextParserInstructions.getOrNull(linkScanIndex + 1)
        ?.takeIf { it.opcode == Opcode.MOVE_RESULT }
        as? OneRegisterInstruction)?.registerA
        ?: error("ChMate legacy link parser result was not found")
    legacyTextParserMethod.addInstructionsWithLabels(
        linkScanIndex + 2,
        """
            move-object/from16 v6, p2
            move-object/from16 v7, p0
            iget-object v7, v7, $legacyLinkParserType->e:[I
            invoke-static { v6, v7, v$linkFoundRegister }, $EXTENSION->classifyLegacyBeIcon(Ljava/lang/String;[IZ)Z
            move-result v$linkFoundRegister
        """
    )

    // Current ChMate normalizes legacy BE icon hosts before its dedicated
    // DynamicDrawableSpan fetches them. Port that narrow behavior to 191.
    mutableClassDefBy("Lo/oa;").methods.single { method ->
        method.name == "<init>"
            && method.returnType == "V"
            && method.parameters.map(CharSequence::toString) ==
            listOf("Landroid/content/Context;", "Ljava/lang/String;")
    }.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p2 .. p2 }, $EXTENSION->normalizeBeIconUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p2
        """
    )

    urlInfoClass.methods.single { method ->
        method.name == "b"
            && method.returnType == "Ljp/syoboi/a2chMate/client/BBSUrlInfo;"
            && method.parameters.map(CharSequence::toString) == listOf("Ljava/lang/String;")
    }.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->rewrite5chUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
        """
    )

    urlInfoClass.methods.single { method ->
        method.name == "e"
            && method.returnType == "I"
            && method.parameters.map(CharSequence::toString) == listOf("Ljava/lang/String;")
    }.let { classifyHostMethod ->
        val firstInstruction = classifyHostMethod.implementation?.instructions?.firstOrNull()
            ?: error("ChMate legacy host classifier has no implementation")
        classifyHostMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p0 .. p0 }, $EXTENSION->is5chHost(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :haiagaru_original_host_classifier
                const/4 v0, 0x1
                return v0
            """,
            ExternalLabel("haiagaru_original_host_classifier", firstInstruction)
        )
    }

    // Rewrite every URL-like String emitted by the URL model. Non-5ch values are
    // returned unchanged, so board types and other BBS implementations stay intact.
    urlInfoClass.methods.filter { it.returnType == "Ljava/lang/String;" }.forEach { method ->
        val returnIndexes = method.implementation?.instructions
            ?.mapIndexedNotNull { index, instruction ->
                if (instruction.opcode == Opcode.RETURN_OBJECT) index else null
            }
            .orEmpty()
        returnIndexes.asReversed().forEach { index ->
            val register = (method.implementation!!.instructions[index] as OneRegisterInstruction)
                .registerA
            method.addInstructionsWithLabels(
                index,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION->rewrite5chUrl(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$register
                """
            )
        }
    }

    val confirmationDetector = mutableClassDefBy("Lo/getJsonData;").methods.single { method ->
        method.name == "a"
            && method.returnType == "Z"
            && method.parameters.map(CharSequence::toString) == listOf("Ljava/lang/String;")
    }
    val detectorStart = confirmationDetector.implementation?.instructions?.firstOrNull()
        ?: error("ChMate legacy confirmation detector has no implementation")
    confirmationDetector.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->isCurrentPostConfirmation(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :haiagaru_original_confirmation_detector
            const/4 v0, 0x1
            return v0
        """,
        ExternalLabel("haiagaru_original_confirmation_detector", detectorStart)
    )

    // Update fixed service hosts and domain filters used by menus, search-result
    // acceptance, cookies, and auxiliary 5ch endpoints.
    classDefForEach { classDef ->
        if (!classDef.type.startsWith("Ljp/syoboi/") && !classDef.type.startsWith("Lo/")) {
            return@classDefForEach
        }
        val mutableClass by lazy { mutableClassDefBy(classDef) }
        classDef.methods.forEach { method ->
            val replacements = method.implementation?.instructions
                ?.mapIndexedNotNull { index, instruction ->
                    val string = ((instruction as? ReferenceInstruction)?.reference
                        as? StringReference)?.string ?: return@mapIndexedNotNull null
                    if (string.any { it.code !in 0x20..0x7e }) {
                        return@mapIndexedNotNull null
                    }
                    val rewritten = string
                        .replace("[25]ch\\.net", "(?:2ch\\.net|5ch\\.io)")
                        .replace("5ch\\.net", "5ch\\.io")
                        .replace("5ch.net", "5ch.io")
                    if (rewritten == string) null else Triple(index, instruction, rewritten)
                }
                ?.toList()
                .orEmpty()
            if (replacements.isEmpty()) return@forEach

            val mutableMethod = mutableClass.findMutableMethodOf(method)
            replacements.asReversed().forEach { (index, instruction, rewritten) ->
                val register = (instruction as OneRegisterInstruction).registerA
                val escaped = rewritten
                    .replace("\\", "\\\\")
                    .replace("\"", "\\\"")
                mutableMethod.replaceInstruction(index, "const-string v$register, \"$escaped\"")
            }
        }
    }

    val networkClass = mutableClassDefBy("Lo/getLabel;")
    networkClass.methods.forEach { method ->
        val instructions = method.implementation?.instructions ?: return@forEach

        val oldClockIndexes = instructions.mapIndexedNotNull { index, instruction ->
            if ((instruction as? WideLiteralInstruction)?.wideLiteral == 900L) index else null
        }
        oldClockIndexes.asReversed().forEach { index ->
            val register = (instructions[index] as OneRegisterInstruction).registerA
            method.replaceInstruction(index, "const-wide/16 v$register, 0x3c")
        }

        val confirmationHeaderIndexes = instructions.mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@mapIndexedNotNull null
            if (reference.definingClass != "Lokhttp3/Headers;"
                || reference.name != "get"
                || reference.returnType != "Ljava/lang/String;"
            ) {
                return@mapIndexedNotNull null
            }
            val hasConfirmationHeader = instructions.subList(maxOf(0, index - 8), index)
                .any { previous ->
                    ((previous as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                        "X-Chx-Error"
                }
            if (hasConfirmationHeader) index else null
        }

        if (confirmationHeaderIndexes.isNotEmpty()) {
            // The legacy 5ch path calls a dynamically restored request signer before
            // every POST. That signer is the source of RuntimeException("39") on the
            // current endpoint, and the headers it adds are no longer part of the
            // posting contract. Match the call by its three stable argument types and
            // leave the already-built request/form untouched.
            val legacySignerIndexes = instructions.mapIndexedNotNull { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                    as? MethodReference ?: return@mapIndexedNotNull null
                if (reference.definingClass != "Ljava/lang/reflect/Method;"
                    || reference.name != "invoke"
                    || reference.returnType != "Ljava/lang/Object;"
                    || instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
                ) {
                    return@mapIndexedNotNull null
                }
                val argumentTypes = instructions.subList(maxOf(0, index - 80), index)
                    .mapNotNull { previous ->
                        ((previous as? ReferenceInstruction)?.reference as? TypeReference)?.type
                    }
                    .toSet()
                val isLegacySigner = argumentTypes.containsAll(
                    setOf(
                        "Lo/r8lambda17vlhACr7B0IDgCdn1Q67LKhir8\$setContentView;",
                        "Lo/getCredentials\$write;",
                        "Ljava/lang/String;"
                    )
                )
                if (isLegacySigner) index else null
            }
            if (legacySignerIndexes.size != 1) {
                error("Expected one ChMate legacy request signer, found ${legacySignerIndexes.size}")
            }
            method.replaceInstruction(legacySignerIndexes.single(), "nop")

            val confirmationMergeIndexes = instructions.mapIndexedNotNull { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                    as? MethodReference ?: return@mapIndexedNotNull null
                if (reference.definingClass != "Landroid/text/TextUtils;"
                    || reference.name != "equals"
                    || reference.returnType != "Z"
                    || reference.parameterTypes.map(CharSequence::toString) !=
                    listOf("Ljava/lang/CharSequence;", "Ljava/lang/CharSequence;")
                ) {
                    return@mapIndexedNotNull null
                }
                val comparesExclusionArray = instructions.subList(maxOf(0, index - 4), index)
                    .any { it.opcode == Opcode.AGET_OBJECT }
                if (comparesExclusionArray) index else null
            }
            if (confirmationMergeIndexes.isEmpty()) {
                error("ChMate legacy confirmation merge was not found")
            }
            confirmationMergeIndexes.asReversed().forEach { index ->
                val invocation = instructions[index]
                val firstRegister: Int
                val secondRegister: Int
                when (invocation) {
                    is FiveRegisterInstruction -> {
                        firstRegister = invocation.registerC
                        secondRegister = invocation.registerD
                    }
                    is RegisterRangeInstruction -> {
                        firstRegister = invocation.startRegister
                        secondRegister = invocation.startRegister + 1
                    }
                    else -> error("ChMate legacy confirmation merge arguments were not found")
                }
                method.replaceInstruction(
                    index,
                    "invoke-static { v$firstRegister, v$secondRegister }, " +
                        "$EXTENSION->preserveServerPostForm(" +
                        "Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z"
                )
            }

            // The old implementation parses and merges the confirmation form but
            // then restores its form parameter before retrying. Store the parsed
            // server form in that existing parameter immediately while its type is
            // known, so the original retry edge naturally sends it unchanged.
            val confirmationParserIndexes = instructions.mapIndexedNotNull { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                    as? MethodReference ?: return@mapIndexedNotNull null
                if (reference.definingClass == "Lo/getCredentials;"
                    && reference.name == "c"
                    && reference.returnType == "Lo/getCredentials\$write;"
                    && reference.parameterTypes.map(CharSequence::toString) ==
                    listOf("Ljava/lang/String;")
                ) index else null
            }
            if (confirmationParserIndexes.size != 1) {
                error("Expected one ChMate legacy confirmation parser, found ${confirmationParserIndexes.size}")
            }
            val parserIndex = confirmationParserIndexes.single()
            val parsedFormRegister = (instructions.getOrNull(parserIndex + 1)
                ?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT }
                as? OneRegisterInstruction)?.registerA
                ?: error("ChMate legacy parsed confirmation form was not found")
            method.addInstruction(
                parserIndex + 2,
                "move-object/from16 p4, v$parsedFormRegister"
            )
        }

        confirmationHeaderIndexes.asReversed().forEach { index ->
            val resultInstruction = instructions.getOrNull(index + 1)
                ?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT }
                as? OneRegisterInstruction
                ?: error("ChMate legacy X-Chx-Error result was not found")
            val register = resultInstruction.registerA
            method.addInstructionsWithLabels(
                index + 2,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION->normalizePostError(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$register
                """
            )
        }

    }
}

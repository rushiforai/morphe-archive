package app.morphe.patches.chmate

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
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
import org.w3c.dom.Element

private const val EXTENSION = "Lapp/morphe/extension/chmate/Haiagaru;"

internal val chMateCompatibility = Compatibility(
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
            version = "0.8.10.226 dev",
            minSdk = 23
        ),
        AppTarget(
            version = "0.8.10.241",
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
    val providerStartupDelegateField: String,
    val providerStartupDelegateType: String,
    val providerStartupDelegateMethod: String,
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
    val legacyPlusDisplayStateClass: String? = null,
    val legacyPlusDisplayStateMethod: String? = null,
    val bypassLegacySingleIdEntitlement: Boolean = false,
    val legacyPlusFilterClass: String? = null,
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
        providerStartupDelegateField = "e",
        providerStartupDelegateType = "Lo/mc${'$'}read;",
        providerStartupDelegateMethod = "a",
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
        legacyPlusDisplayStateClass = "Lo/lrb${'$'}RemoteActionCompatParcelizer;",
        legacyPlusDisplayStateMethod = "d",
        bypassLegacySingleIdEntitlement = true,
        legacyPlusFilterClass = "Lo/m9ExternalSyntheticLambda1;",
    )
    "0.8.10.226 dev" -> ChMateProfile(
        providerClass = "Lo/setDither;",
        providerStartupTrapClass = "Lo/setSourceokhttp\$1;",
        providerStartupDelegateField = "e",
        providerStartupDelegateType = "Lo/setSourceokhttp\$ComponentActivity;",
        providerStartupDelegateMethod = "c",
        settingsViewModelClass = null,
        applicationClass = "Ljp/syoboi/a2chMate/RoidonApp;",
        homeFragmentClass = "Ljp/syoboi/a2chMate/fragment/HomeFragment;",
        cookieClearMethod = "a",
        signatureClass = "",
        signatureMethod = "",
        signatureDelegateField = "",
        signatureDelegateType = "",
        signatureDelegateMethod = "",
        signatureSuperType = "",
        patchSignatureWrapper = false,
        signatureDirectWrapperBypass = true,
        viewModelFactoryClass = "Lo/isEligibleokhttp\$CheckResult\$write;",
        viewModelDispatchField = "c",
        viewModelTrapKind = ViewModelTrapKind.FAILURE_BRANCH,
        settingsWindowFeatureDivideTrap = false,
        hasHiltSettings = true,
        hasLevelPlayBanner = true,
        homeAdClass = "Lo/readByteArray\$RemoteActionCompatParcelizer;",
        homeAdLoadMethod = null,
    )
    "0.8.10.241" -> ChMateProfile(
        providerClass = "Lo/Kjv22;",
        providerStartupTrapClass = null,
        providerStartupDelegateField = "",
        providerStartupDelegateType = "",
        providerStartupDelegateMethod = "",
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
    "0.8.10.243 dev" -> ChMateProfile(
        providerClass = "Lo/zzbvh;",
        providerStartupTrapClass = null,
        providerStartupDelegateField = "",
        providerStartupDelegateType = "",
        providerStartupDelegateMethod = "",
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

private val haiagaruBytecodePatch = bytecodePatch {
    compatibleWith(chMateCompatibility)
    extendWith("extensions/chmate.mpe")

    execute {
        val profile = profileFor(packageMetadata.versionName)

        mutableClassDefBy(profile.providerClass).methods.single { method ->
            method.name == "onCreate"
                && method.returnType == "Z"
                && method.parameters.isEmpty()
        }.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p0 .. p0 }, $EXTENSION->onProviderCreate(Landroid/content/ContentProvider;)V
                invoke-static { }, $EXTENSION->installSignatureSpoof()V
            """
        )
        profile.providerStartupTrapClass?.let { startupTrapClass ->
            mutableClassDefBy(startupTrapClass).methods.single { method ->
                method.returnType == "Ljava/lang/Object;"
                    && method.parameters.isEmpty()
            }.returnProviderStartupDelegate(profile)
        }

        val applicationOnCreate = mutableClassDefBy(profile.applicationClass).methods.single { method ->
            method.name == "onCreate"
                && method.returnType == "V"
                && method.parameters.isEmpty()
        }
        applicationOnCreate.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, " +
                "$EXTENSION->onApplicationPreCreate(Landroid/app/Application;)V"
        )
        applicationOnCreate.addBeforeEveryReturn(
            "invoke-static/range { p0 .. p0 }, $EXTENSION->onApplicationCreate(Landroid/app/Application;)V"
        )
        // The URL/DAT recovery entry exists in all supported generations, but
        // 0.8.10.241 and 0.8.10.243 route lifecycle creation through the Hilt
        // activity base class while 0.8.10.191 keeps it on the concrete activity.
        patchLegacyThreadUrlEntry(profile)
        patchFinishedLegacyThreadLaunchGuard()
        if (packageMetadata.versionName in setOf(
                "0.8.10.191 dev",
                "0.8.10.226 dev",
                "0.8.10.243 dev",
            )
        ) {
            patchLegacyTabletThreadUrlEntry(packageMetadata.versionName)
        }
        patchLegacyPlusFeatureActivation(profile)
        if (packageMetadata.versionName == "0.8.10.243 dev") {
            patchImageSelectionResult()
            patchImageSelectionReflectionTrap()
            patchImageUploadIntegrityComparison()
        }
        SettingsOnResumeFingerprint.method.addBeforeEveryReturn(
            "invoke-static/range { p0 .. p0 }, $EXTENSION->onSettingsResume(Landroid/app/Activity;)V"
        )
        if (packageMetadata.versionName == "0.8.10.191 dev") {
            patchLegacyFragmentBannerDiscovery()
            patchLegacyThreadListAd("Lo/m9ExternalSyntheticLambda1;")
            patchLegacyImageUploadTempName()
            patchLegacyImageUploadCall()
        } else {
            // Inject while p1 is still guaranteed to contain the Fragment root; the
            // extension posts its scans to the view queue, so child views are inspected
            // after construction.
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
        patchCommonAdSdkInitialization()

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
            patchLevelPlayTrackerInitialization()

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

        when (packageMetadata.versionName) {
            "0.8.10.191 dev" -> {
                patchLegacy5chIoCompatibility()
                patchLegacyTalkDatLoading()
                patchLegacyTalkAuthIntegrity()
            }
            "0.8.10.226 dev" -> {
                patchThreadBannerAdWrapper("Lo/TTVideoLandingPageLink2Activity1;")
                patchLegacyThreadListAd("Lo/listener;")
                patchPreIoTalkDatLoading()
                patchPreIoTalkPostIntegrity()
                patchPreIoImageUploadIntegrityTrap("Lo/fWG1;")
                patchPreIoImageSettingsIntegrityTrap("Lo/setMaintainOriginalImageBounds;")
                patchPreIoSettingsConstructorIntegrityTrap("Lo/setImageAssetsFolder;")
                patchBeAttachmentCompatibility("Lo/BouncyCastleSocketAdapterCompanion;")
                patchPreIoBeRendering(
                    parserClass = "Lo/getMaxLine;",
                    drawableClass = "Lo/getFlexDirection;",
                )
                patchPreIoUrlSpanAlignment("Lo/getMaxLine;")
                patchPreIoDomainCompatibility(
                    parseMethodName = "c",
                )
            }
            "0.8.10.243 dev" -> {
                patchSetTextCalls()
                patchModernTalkDatLoading()
            }
            else -> patchSetTextCalls()
        }
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchModernTalkDatLoading() {
    // Keep Talk's URL, board identity and posting transport. Its DAT reader is
    // already the normal MS932 reader. Supply the live response inside the
    // existing per-thread download lock, before the dynamic Talk auth builder.
    val loader = mutableClassDefBy("Lo/zzaam;").methods.single { method ->
        method.name == "a" && method.returnType == "Lo/zzaai\$write;"
            && method.parameters.map(CharSequence::toString) == listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;", "Z", "Lo/zzbly;"
            )
    }
    val instructions = loader.implementation!!.instructions.toList()
    val cacheCall = instructions.indexOfFirst {
        val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == "Lo/zzadb;" && reference.returnType == "Ljava/io/File;"
            && reference.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;"
            )
    }.takeIf { it >= 0 } ?: error("ChMate 243 thread cache builder was not found")
    check((instructions[cacheCall + 1] as OneRegisterInstruction).registerA == 5)
    // v0 holds BBSUrlInfo and v5 the cache File. v1 is overwritten immediately
    // afterward by the original preference read, and is free at this boundary.
    loader.addInstructionsWithLabels(cacheCall + 2, """
        invoke-virtual {v0}, Ljp/syoboi/a2chMate/client/BBSUrlInfo;->H()Ljava/lang/String;
        move-result-object v1
        invoke-static {v1, v5}, $EXTENSION->loadLiveTalkDat(Ljava/lang/String;Ljava/io/File;)Z
        move-result v1
        if-eqz v1, :haiagaru_normal_download
        new-instance v1, Lo/zzaai${'$'}write;
        invoke-direct {v1, v5, v0}, Lo/zzaai${'$'}write;-><init>(Ljava/io/File;Ljp/syoboi/a2chMate/client/BBSUrlInfo;)V
        return-object v1
        :haiagaru_normal_download
        nop
    """.trimIndent())
}

/**
 * 226 has the same native Talk type-4 URL model as 243, but its downloader uses
 * the pre-io class layout. Publish the current Talk JSON as a normal DAT as soon
 * as ChMate resolves the destination file, before its obsolete transport runs.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoTalkDatLoading() {
    val loader = mutableClassDefBy("Lo/OpenJSSEPlatformCompanion;").methods.single { method ->
        method.name == "c"
            && method.returnType == "Lo/OpenJSSEPlatformCompanion${'$'}write;"
            && method.parameters.map(CharSequence::toString) == listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
                "Z",
                "Lo/KjvkU;",
            )
    }
    val instructions = loader.implementation?.instructions?.toList()
        ?: error("ChMate 226 thread loader has no implementation")
    val cacheCall = instructions.indices.single { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@single false
        reference.returnType == "Ljava/io/File;"
            && reference.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
            )
            && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
    }
    val invocation = instructions[cacheCall] as FiveRegisterInstruction
    val urlInfoRegister = invocation.registerD
    val cacheFileRegister =
        (instructions[cacheCall + 1] as OneRegisterInstruction).registerA
    val scratchRegister = loader.findFreeRegister(cacheCall + 2)

    loader.addInstructionsWithLabels(
        cacheCall + 2,
        """
            invoke-virtual {v$urlInfoRegister}, Ljp/syoboi/a2chMate/client/BBSUrlInfo;->G()Ljava/lang/String;
            move-result-object v$scratchRegister
            invoke-static {v$scratchRegister, v$cacheFileRegister}, $EXTENSION->loadLiveTalkDat(Ljava/lang/String;Ljava/io/File;)Z
            move-result v$scratchRegister
            if-eqz v$scratchRegister, :haiagaru_226_normal_download
            new-instance v$scratchRegister, Lo/OpenJSSEPlatformCompanion${'$'}write;
            invoke-direct {v$scratchRegister, v$cacheFileRegister, v$urlInfoRegister}, Lo/OpenJSSEPlatformCompanion${'$'}write;-><init>(Ljava/io/File;Ljp/syoboi/a2chMate/client/BBSUrlInfo;)V
            return-object v$scratchRegister
            :haiagaru_226_normal_download
            nop
        """.trimIndent(),
    )
}

/**
 * 226 restores its Talk request builder into an InMemoryDexClassLoader. The
 * generated poster compares two certificate-derived values and throws null when
 * they differ after re-signing. Route only that reflected posting call through
 * the extension so the generated request construction itself remains unchanged.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoTalkPostIntegrity() {
    val networkClass = mutableClassDefBy("Lo/OpenJSSEPlatformCompanion;")
    val candidates = networkClass.methods.flatMap { method ->
        val instructions = method.implementation?.instructions ?: return@flatMap emptyList()
        instructions.mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@mapIndexedNotNull null
            if (reference.definingClass != "Ljava/lang/reflect/Method;"
                || reference.name != "invoke"
                || reference.returnType != "Ljava/lang/Object;"
                || instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
                || reference.parameterTypes.map(CharSequence::toString) != listOf(
                    "Ljava/lang/Object;",
                    "[Ljava/lang/Object;",
                )
            ) {
                return@mapIndexedNotNull null
            }
            val isTalkPost = instructions.subList(maxOf(0, index - 180), index)
                .any { previous ->
                    ((previous as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                        "https://api.talk-platform.com/v1/bbs.cgi"
                }
            if (isTalkPost) method to index else null
        }
    }
    check(candidates.size == 1) {
        "Expected one ChMate 226 Talk posting invocation, found ${candidates.size}"
    }
    val (method, index) = candidates.single()
    when (val invocation = method.implementation!!.instructions[index]) {
        is FiveRegisterInstruction -> method.replaceInstruction(
            index,
            "invoke-static {v${invocation.registerC}, v${invocation.registerD}, " +
                "v${invocation.registerE}}, $EXTENSION->invokePreIoTalkPoster(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        is RegisterRangeInstruction -> method.replaceInstruction(
            index,
            "invoke-static/range {v${invocation.startRegister} .. " +
                "v${invocation.startRegister + 2}}, " +
                "$EXTENSION->invokePreIoTalkPoster(Ljava/lang/reflect/Method;" +
                "Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;",
        )
        else -> error("ChMate 226 Talk posting invocation registers were not found")
    }
}

/**
 * ChMate 0.8.10.191 builds every Talk request through a dynamically restored
 * authentication class. Re-signing makes that class enter its decoy arithmetic
 * branch before the already-imported DAT can be read. Haiagaru imports the current
 * Talk API response into ChMate's cache first, so route only this Talk request
 * branch through the ordinary DAT builder and leave every other network path intact.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyTalkDatLoading() {
    val method = mutableClassDefBy("Lo/getLabel;").methods.single { method ->
        method.name == "b"
            && method.parameters.size == 4
            && method.parameters[0].toString() ==
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;"
            && method.parameters[1].toString() == "Z"
            && method.parameters[2].toString() == "Z"
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate legacy thread loader has no implementation")
    val cachePathIndex = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@indexOfFirst false
        reference.returnType == "Ljava/io/File;"
            && reference.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;"
            )
    }.takeIf { it >= 0 }
        ?: error("ChMate legacy Talk cache path builder was not found")
    // v0 is the requested BBSUrlInfo and v11 is ChMate's exact DAT cache file.
    // Import the current Talk JSON response there and return it immediately.
    // Continuing into 191's normal downloader would request the obsolete
    // talk.jp/<board>/dat/<thread>.dat endpoint and replace a valid import with
    // a false DAT落ち result.
    method.addInstructionsWithLabels(
        cachePathIndex + 2,
        """
            invoke-virtual {v0}, Ljp/syoboi/a2chMate/client/BBSUrlInfo;->o()Ljava/lang/String;
            move-result-object v14
            invoke-static {v14, v11}, $EXTENSION->loadLiveTalkDat(Ljava/lang/String;Ljava/io/File;)Z
            move-result v14
            if-eqz v14, :haiagaru_normal_download
            new-instance v14, Lo/getLabel${'$'}IconCompatParcelizer;
            const/4 v1, 0x0
            invoke-direct {v14, v11, v1, v0, v1}, Lo/getLabel${'$'}IconCompatParcelizer;-><init>(Ljava/io/File;ILjp/syoboi/a2chMate/client/BBSUrlInfo;I)V
            return-object v14
            :haiagaru_normal_download
            nop
        """.trimIndent(),
    )
}

/**
 * The 191 Talk client is restored into an InMemoryDexClassLoader. Its generated
 * request signer compares two certificate-derived integers and enters a deliberate
 * divide-by-zero branch after Morphe re-signs the APK. Normalize that generated
 * state immediately after the Talk client instance is constructed, before its
 * authentication method is invoked.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyTalkAuthIntegrity() {
    val method = mutableClassDefBy("Lo/setAdLoadFailureInfo;").methods.single { method ->
        method.name == "c"
            && method.returnType == "Ljava/lang/String;"
            && method.parameters.map(CharSequence::toString) == listOf("Lo/getLabel;")
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate legacy Talk authentication method has no implementation")
    val newInstanceIndex = instructions.indices.single { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@single false
        reference.definingClass == "Ljava/lang/reflect/Constructor;"
            && reference.name == "newInstance"
            && reference.returnType == "Ljava/lang/Object;"
            && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
    }
    val authClientRegister =
        (instructions[newInstanceIndex + 1] as OneRegisterInstruction).registerA
    method.addInstruction(
        newInstanceIndex + 2,
        "invoke-static {v$authClientRegister}, " +
            "$EXTENSION->normalizeLegacyTalkAuthIntegrity(Ljava/lang/Object;)V",
    )
}

@Suppress("unused")
val haiagaruPatch = resourcePatch(
    name = "Haiagaru",
    description = "Ports the Haiagaru ChMate module, including its in-app settings.",
) {
    compatibleWith(chMateCompatibility)
    dependsOn(haiagaruBytecodePatch)

    execute {
        document("AndroidManifest.xml").use { document ->
            val additions = buildList {
                val dataElements = document.getElementsByTagName("data")
                for (index in 0 until dataElements.length) {
                    val data = dataElements.item(index) as? Element ?: continue
                    val ioHost = when (data.getAttribute("android:host")) {
                        "*.5ch.net" -> "*.5ch.io"
                        "itest.5ch.net" -> "itest.5ch.io"
                        else -> continue
                    }
                    val intentFilter = data.parentNode
                    val alreadyPresent = (0 until intentFilter.childNodes.length).any { childIndex ->
                        val sibling = intentFilter.childNodes.item(childIndex) as? Element
                        sibling?.tagName == "data" &&
                            sibling.getAttribute("android:host") == ioHost
                    }
                    if (!alreadyPresent) add(data to ioHost)
                }
            }

            additions.forEach { (source, ioHost) ->
                val clone = source.cloneNode(true) as Element
                clone.setAttribute("android:host", ioHost)
                source.parentNode.insertBefore(clone, source.nextSibling)
            }

            // ChMate's legacy itest filter uses `/*./...`, which only accepts a
            // single character before `/test/read.cgi`. Correct the simple-glob
            // pattern so server-prefixed URLs such as `/egg/test/read.cgi/...`
            // resolve to ResListActivity on every supported ChMate generation.
            val refreshedDataElements = document.getElementsByTagName("data")
            for (index in 0 until refreshedDataElements.length) {
                val data = refreshedDataElements.item(index) as? Element ?: continue
                val host = data.getAttribute("android:host")
                if (host !in setOf("itest.2ch.net", "itest.5ch.net", "itest.5ch.io")) continue
                if (data.getAttribute("android:pathPattern") == "/*./test/read.cgi/.*/.*") {
                    data.setAttribute("android:pathPattern", "/.*/test/read.cgi/.*/.*")
                }
            }

            // Newer manifests dropped the dedicated itest host and only keep
            // the ordinary `*.5ch.io` + `/test/read.cgi` filter. Add the itest
            // server-prefix form to that same thread filter so Android can
            // dispatch it before the extension normalizes the URL.
            val intentFilters = document.getElementsByTagName("intent-filter")
            for (index in 0 until intentFilters.length) {
                val intentFilter = intentFilters.item(index) as? Element ?: continue
                val dataChildren = (0 until intentFilter.childNodes.length)
                    .mapNotNull { childIndex ->
                        (intentFilter.childNodes.item(childIndex) as? Element)
                            ?.takeIf { it.tagName == "data" }
                    }
                val hasFiveChIoHost = dataChildren.any { data ->
                    data.getAttribute("android:host") in setOf("*.5ch.io", "itest.5ch.io")
                }
                val handlesThreads = dataChildren.any { data ->
                    data.getAttribute("android:pathPrefix").startsWith("/test/read.cgi") ||
                        data.getAttribute("android:pathPattern").contains("test/read.cgi")
                }
                if (!hasFiveChIoHost || !handlesThreads) continue

                if (dataChildren.none { it.getAttribute("android:host") == "itest.5ch.io" }) {
                    val hostData = document.createElement("data")
                    hostData.setAttribute("android:host", "itest.5ch.io")
                    intentFilter.appendChild(hostData)
                }
                if (dataChildren.none {
                        it.getAttribute("android:pathPattern") == "/.*/test/read.cgi/.*/.*"
                    }) {
                    val pathData = document.createElement("data")
                    pathData.setAttribute(
                        "android:pathPattern",
                        "/.*/test/read.cgi/.*/.*",
                    )
                    intentFilter.appendChild(pathData)
                }
            }
        }
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchThreadBannerAdWrapper(
    wrapperClass: String,
) {
    mutableClassDefBy(wrapperClass).methods.forEach { method ->
        when {
            method.name == "<init>" -> method.addBeforeEveryReturn(
                "invoke-static/range { p0 .. p0 }, $EXTENSION->hideAdView(Landroid/view/View;)V",
            )
            method.name != "<clinit>"
                && method.returnType == "V"
                && method.parameters.isEmpty() ->
                method.addHideAdsViewGuard()
        }
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoImageUploadIntegrityTrap(
    uploadTaskClass: String,
) {
    val uploadClass = mutableClassDefBy(uploadTaskClass)
    val method = uploadClass.methods.single { candidate ->
        candidate.name == "c"
            && candidate.returnType == "Ljava/lang/Object;"
            && candidate.parameters.isEmpty()
    }
    val instructions = method.implementation?.instructions
        ?: error("ChMate pre-io image upload task has no implementation")
    val divideIndex = instructions.indices.single { index ->
        val divide = instructions[index]
        if (divide.opcode != Opcode.DIV_INT_2ADDR) return@single false
        instructions.subList(index + 1, minOf(index + 5, instructions.size)).any { next ->
            val reference = (next as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@any false
            reference.definingClass == "Landroid/widget/Toast;"
                && reference.name == "makeText"
        }
    }
    val resultIndex = (divideIndex + 1 until instructions.size).first { index ->
        instructions[index].opcode == Opcode.NEW_ARRAY
    }

    // The divisor is `(n - 1) * n % 2`, which is always zero. The quotient is
    // used only by a decoy Toast and never by the image result. Skip that whole
    // block and resume at the original result-array construction.
    method.addInstructionsWithLabels(
        divideIndex,
        "goto/32 :haiagaru_image_upload_result",
        ExternalLabel("haiagaru_image_upload_result", instructions[resultIndex]),
    )

    val uploaderMethod = uploadClass.methods.single { candidate ->
        candidate.name == "g"
            && candidate.returnType == "Lo/Ad;"
            && candidate.parameters.isEmpty()
    }
    val uploaderInstructions = uploaderMethod.implementation?.instructions
        ?: error("ChMate pre-io image uploader has no implementation")
    val dynamicInvokeIndex = uploaderInstructions.indices.singleOrNull { index ->
        val reference = (uploaderInstructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@singleOrNull false
        reference.definingClass == "Ljava/lang/reflect/Method;"
            && reference.name == "invoke"
            && reference.returnType == "Ljava/lang/Object;"
            && uploaderInstructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
            && ((uploaderInstructions.getOrNull(index + 2) as? ReferenceInstruction)?.reference
                as? TypeReference)?.type == "Lo/Ad;"
    } ?: error("ChMate pre-io dynamic image uploader invocation was not found")

    // The uploader is loaded from an InMemoryDexClassLoader. Its cached integrity
    // state compares int arrays at indexes 1 and 3, and a mismatch enters a
    // deliberate `throw null` block before the HTTP request is built. Synchronize
    // only those cached values and invoke the original uploader unchanged.
    when (val invocation = uploaderInstructions[dynamicInvokeIndex]) {
        is FiveRegisterInstruction -> uploaderMethod.replaceInstruction(
            dynamicInvokeIndex,
            "invoke-static { v${invocation.registerC}, v${invocation.registerD}, " +
                "v${invocation.registerE} }, $EXTENSION->invokePreIoImageUploader(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )

        is RegisterRangeInstruction -> uploaderMethod.replaceInstruction(
            dynamicInvokeIndex,
            "invoke-static/range { v${invocation.startRegister} .. " +
                "v${invocation.startRegister + 2} }, " +
                "$EXTENSION->invokePreIoImageUploader(Ljava/lang/reflect/Method;" +
                "Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;",
        )

        else -> error("ChMate pre-io dynamic uploader registers were not found")
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoImageSettingsIntegrityTrap(
    viewModelClass: String,
) {
    val constructor = mutableClassDefBy(viewModelClass).methods.single { candidate ->
        candidate.name == "<init>"
            && candidate.returnType == "V"
            && candidate.parameters.map(CharSequence::toString) ==
            listOf("Landroid/app/Application;")
    }
    val instructions = constructor.implementation?.instructions
        ?: error("ChMate pre-io image settings constructor has no implementation")
    val rejectionBranch = instructions.indices.single { index ->
        if (instructions[index].opcode != Opcode.IF_NE) return@single false
        val window = instructions.subList(maxOf(0, index - 14), index)
        window.count { it.opcode == Opcode.AGET_OBJECT } >= 2
            && window.count { it.opcode == Opcode.CHECK_CAST } >= 2
            && window.count { it.opcode == Opcode.AGET } >= 2
    }
    val deleteRateKeyIndex = instructions.indices.single { index ->
        ((instructions[index] as? ReferenceInstruction)?.reference
            as? StringReference)?.string == "deleteRate0"
    }
    val defaultDivideIndex = (0 until deleteRateKeyIndex).last { index ->
        instructions[index].opcode == Opcode.DIV_INT_2ADDR
    }
    val defaultRegister = (instructions[defaultDivideIndex] as TwoRegisterInstruction).registerA

    // Re-signing changes the two certificate-derived comparison values. Their
    // inequality branch ends in `throw null`; equality continues through the
    // complete preference/LiveData initialization and the normal return.
    constructor.replaceInstruction(rejectionBranch, "nop")
    // The certificate-derived arithmetic used to produce the Boolean default can
    // yield a zero divisor after re-signing. Keep getBoolean() and any stored value,
    // while supplying its ordinary false default directly.
    constructor.replaceInstruction(defaultDivideIndex, "const/4 v$defaultRegister, 0x0")
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoSettingsConstructorIntegrityTrap(
    viewModelClass: String,
) {
    val constructor = mutableClassDefBy(viewModelClass).methods.single { candidate ->
        candidate.name == "<init>"
            && candidate.returnType == "V"
            && candidate.parameters.isEmpty()
    }
    val instructions = constructor.implementation?.instructions
        ?: error("ChMate pre-io settings constructor has no implementation")
    val rejectionBranch = instructions.indices.single { index ->
        if (instructions[index].opcode != Opcode.IF_NE) return@single false
        val window = instructions.subList(maxOf(0, index - 24), index)
        window.count { it.opcode == Opcode.AGET_OBJECT } >= 2
            && window.count { it.opcode == Opcode.CHECK_CAST } >= 2
            && window.count { it.opcode == Opcode.AGET } >= 2
            && instructions.subList(index + 1, minOf(index + 14, instructions.size))
                .any { it.opcode == Opcode.NEW_ARRAY }
    }

    // The mismatch path is certificate-sensitive dead code. Re-signing can send
    // the settings ViewModel constructor through a zero-divisor Toast decoy while
    // the normal path continues with the same state-array shape.
    constructor.replaceInstruction(rejectionBranch, "nop")

    val coroutineStartIndex = instructions.indices.single { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@single false
        reference.definingClass == "Lo/RequestConfigurationTagForChildDirectedTreatment;"
            && reference.name == "c"
            && reference.returnType == "Lo/getImageOrientation;"
    }
    val defaultMaskDivideIndex = instructions.subList(0, coroutineStartIndex)
        .indexOfLast { it.opcode == Opcode.DIV_INT }
        .takeIf { it >= 0 }
        ?.plus(0)
        ?: error("ChMate pre-io settings constructor coroutine mask divide was not found")
    val defaultMaskRegister = (instructions[defaultMaskDivideIndex] as ThreeRegisterInstruction).registerA

    // The value is the synthetic default-argument mask for the coroutine launch;
    // it is not app state. Keep the ordinary two-null-default mask directly.
    constructor.replaceInstruction(defaultMaskDivideIndex, "const/4 v$defaultMaskRegister, 0x3")
}

@Suppress("unused")
val saveChMateCrashLogsPatch = bytecodePatch(
    name = "Save ChMate crash logs",
    description = "Save uncaught ChMate crash logs to Download/Haiagaru.",
    default = false,
) {
    compatibleWith(chMateCompatibility)
    dependsOn(haiagaruBytecodePatch)

    execute {
        val profile = profileFor(packageMetadata.versionName)
        mutableClassDefBy(profile.providerClass).methods.single { method ->
            method.name == "onCreate"
                && method.returnType == "Z"
                && method.parameters.isEmpty()
        }.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, " +
                "$EXTENSION->installCrashLogger(Landroid/content/ContentProvider;)V",
        )
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyPlusFeatureActivation(
    profile: ChMateProfile,
) {
    if (!profile.bypassLegacySingleIdEntitlement) return

    val classType = profile.legacyPlusDisplayStateClass
        ?: error("ChMate legacy plus display state class is not configured")
    val methodName = profile.legacyPlusDisplayStateMethod
        ?: error("ChMate legacy plus display state method is not configured")
    mutableClassDefBy(classType).methods.single { candidate ->
        candidate.name == methodName
            && candidate.returnType == "V"
            && candidate.parameters.isEmpty()
    }.bypassLegacySingleIdEntitlement(classType)

    profile.legacyPlusFilterClass?.let { filterClass ->
        val method = mutableClassDefBy(filterClass).methods.single {
            it.name == "c" && it.returnType == "V"
                && it.parameters.map(CharSequence::toString) == listOf("Z")
        }
        val instructions = method.implementation!!.instructions
        // Both filters have an entitlement branch immediately before their
        // preference read. Preserve the preference branches and stock detectors.
        val gates = listOf("b", "A").map { fieldName ->
            val preferenceIndex = instructions.indices.single { index ->
                val ref = (instructions[index] as? ReferenceInstruction)?.reference
                    as? FieldReference
                instructions[index].opcode == Opcode.SGET_OBJECT
                    && ref?.definingClass == "Ljp/syoboi/a2chMate/Prefs;"
                    && ref.name == fieldName && ref.type == "Lo/m1b\$read;"
            }
            val gate = preferenceIndex - 1
            check(gate >= 0 && instructions[gate].opcode == Opcode.IF_EQZ) {
                "ChMate legacy $fieldName filter entitlement branch was not found"
            }
            gate
        }
        check(gates.map { (instructions[it] as OneRegisterInstruction).registerA }
            .distinct().size == 1) { "ChMate legacy filter entitlement registers differ" }
        gates.forEach { method.replaceInstruction(it, "nop") }
    }
}

private fun MutableMethod.bypassLegacySingleIdEntitlement(ownerType: String) {
    val instructions = implementation?.instructions
        ?: error("ChMate legacy plus display state method has no implementation")
    val getBooleanIndex = instructions.indices.firstOrNull { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@firstOrNull false
        reference.definingClass == "Landroid/content/SharedPreferences;"
            && reference.name == "getBoolean"
            && reference.returnType == "Z"
            && reference.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;", "Z")
            && instructions.subList(maxOf(0, index - 6), index).any { previous ->
                ((previous as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                    "abbrevSingleId"
            }
    } ?: error("ChMate legacy abbrevSingleId preference read was not found")
    val falseBranchIndex = (getBooleanIndex + 1 until minOf(getBooleanIndex + 8, instructions.size))
        .firstOrNull { index ->
            val opcode = instructions[index].opcode
            opcode == Opcode.IF_EQZ || opcode == Opcode.IF_EQ
        } ?: error("ChMate legacy abbrevSingleId false branch was not found")
    val enabledStoreIndex = (falseBranchIndex + 1 until instructions.size).firstOrNull { index ->
        val instruction = instructions[index]
        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            ?: return@firstOrNull false
        instruction.opcode == Opcode.IPUT_BOOLEAN
            && reference.definingClass == ownerType
            && reference.type == "Z"
    } ?: error("ChMate legacy abbrevSingleId enabled store was not found")

    addInstructionsWithLabels(
        falseBranchIndex + 1,
        "goto/32 :haiagaru_legacy_single_id_enabled",
        ExternalLabel("haiagaru_legacy_single_id_enabled", instructions[enabledStoreIndex]),
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchImageSelectionResult() {
    val method = mutableClassDefBy(
        "Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;"
    ).methods.single { candidate ->
        candidate.name == "d"
            && candidate.returnType == "V"
            && candidate.parameters.map(CharSequence::toString) ==
            listOf(
                "Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;",
                "Ljava/util/List;",
            )
    }
    val firstInstruction = method.implementation?.instructions?.firstOrNull()
        ?: error("ChMate image selection callback has no implementation")

    // The stock callback probes the selected URI synchronously to detect the
    // special 500x250 drawing format. On recent Android photo pickers that
    // probe can reach a provider with a null result bundle and fail while the
    // ActivityResult is being delivered. Normal attachments do not need this
    // probe, so route them directly through the existing upload-setting path.
    method.addInstructionsWithLabels(
        0,
        "if-eqz p1, :haiagaru_image_result_original\n"
            + "const/4 v0, 0x0\n"
            + "invoke-virtual {p0, p1, v0}, "
            + "Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;->b(Ljava/util/List;Z)V\n"
            + "return-void",
        ExternalLabel("haiagaru_image_result_original", firstInstruction),
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchImageSelectionReflectionTrap() {
    val method = mutableClassDefBy(
        "Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;"
    ).methods.single { candidate ->
        candidate.name == "b"
            && candidate.returnType == "V"
            && candidate.parameters.map(CharSequence::toString) ==
            listOf("Ljava/util/List;", "Z")
    }
    val instructions = method.implementation?.instructions
        ?: error("ChMate image selection method has no implementation")

    val uploadPathIndex = instructions.indexOfLast { instruction ->
        if (instruction.opcode != Opcode.CHECK_CAST) return@indexOfLast false
        val reference = (instruction as? ReferenceInstruction)?.reference as? TypeReference
            ?: return@indexOfLast false
        reference.type == "Ljava/util/Collection;"
    }.takeIf { it >= 0 }
        ?: error("ChMate image upload array conversion was not found")

    val uploadArrayInstruction = instructions.getOrNull(uploadPathIndex + 1)
        ?.takeIf { instruction -> instruction.opcode == Opcode.NEW_ARRAY }
        as? TwoRegisterInstruction
        ?: error("ChMate image upload Uri array creation was not found")
    val uploadArraySizeRegister = uploadArrayInstruction.registerB
    val zeroArraySizeIndex = (0 until uploadPathIndex).lastOrNull { index ->
        val instruction = instructions[index]
        (instruction as? OneRegisterInstruction)?.registerA == uploadArraySizeRegister
            && (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0
    } ?: error("ChMate image upload zero-length array initializer was not found")

    // URI MIME/size probing and the reflected image check both run while the
    // ActivityResult callback is being delivered. The Android photo picker can
    // return a provider result whose extras bundle is null, which makes that
    // synchronous validation fail with a NullPointerException. Keep the original
    // Fragment/context guards and the zero-length Uri[] initializer, then skip only
    // the validation loop. This also preserves the verifier types expected by the
    // existing List -> Collection -> Uri[] conversion below.
    method.addInstructionsWithLabels(
        zeroArraySizeIndex + 1,
        "goto/32 :haiagaru_image_upload_path",
        ExternalLabel("haiagaru_image_upload_path", instructions[uploadPathIndex])
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchImageUploadIntegrityComparison() {
    val method = mutableClassDefBy("Lo/zzbwa;").methods.single { candidate ->
        candidate.name == "d"
            && candidate.returnType == "Lo/zzfqa;"
            && candidate.parameters.isEmpty()
    }
    val instructions = method.implementation?.instructions
        ?: error("ChMate image upload task has no implementation")

    val rejectionBranches = instructions.indices.filter { index ->
        if (instructions[index].opcode != Opcode.IF_NE) return@filter false
        val window = instructions.subList(maxOf(0, index - 8), index)
        window.count { it.opcode == Opcode.AGET_OBJECT } >= 2
            && window.count { it.opcode == Opcode.CHECK_CAST } >= 2
            && window.count { it.opcode == Opcode.AGET } >= 2
    }
    check(rejectionBranches.size == 1) {
        "Expected one ChMate image upload integrity rejection branch, found " +
            rejectionBranches.size
    }

    // The mismatch branch enters a decoy block that eventually executes `throw null`.
    // Re-signing changes the compared certificate-derived state, so retain the real
    // upload path by forcing the equality fall-through without changing image math.
    method.replaceInstruction(rejectionBranches.single(), "nop")

    val tempNameSubstringIndex = instructions.indices.singleOrNull { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@singleOrNull false
        if (reference.definingClass != "Ljava/lang/String;"
            || reference.name != "substring"
            || reference.returnType != "Ljava/lang/String;"
            || reference.parameterTypes.map(CharSequence::toString) != listOf("I")
            || instructions.getOrNull(index - 1)?.opcode != Opcode.DIV_INT_2ADDR
        ) {
            return@singleOrNull false
        }
        instructions.subList(index + 1, minOf(index + 7, instructions.size)).any { next ->
            val nextReference = (next as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@any false
            nextReference.definingClass == "Ljava/io/File;"
                && nextReference.name == "<init>"
                && nextReference.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/io/File;", "Ljava/lang/String;")
        }
    } ?: error("ChMate image upload temporary filename decoder was not found")
    val tempNameResultRegister = (instructions.getOrNull(tempNameSubstringIndex + 1)
        as? OneRegisterInstruction)?.registerA
        ?: error("ChMate image upload temporary filename result was not found")

    // The temporary name is encoded as a control-character prefix followed by
    // "uploading". Its substring index is derived through certificate-sensitive
    // arithmetic and becomes a zero divisor after re-signing. Keep the actual file
    // name directly and leave all later image decoding and payload arithmetic intact.
    method.replaceInstruction(tempNameSubstringIndex - 1, "nop")
    method.replaceInstruction(
        tempNameSubstringIndex,
        "const-string v$tempNameResultRegister, \"uploading\"",
    )
    method.replaceInstruction(tempNameSubstringIndex + 1, "nop")

    val dynamicUploaderInvokeIndex = instructions.indices.singleOrNull { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@singleOrNull false
        reference.definingClass == "Ljava/lang/reflect/Method;"
            && reference.name == "invoke"
            && reference.returnType == "Ljava/lang/Object;"
            && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
            && ((instructions.getOrNull(index + 2) as? ReferenceInstruction)?.reference
                as? TypeReference)?.type == "Lo/zzfqa;"
    } ?: error("ChMate dynamic image uploader invocation was not found")

    // The actual uploader is decrypted into an InMemoryDexClassLoader, so it cannot
    // be edited by the normal APK bytecode patch. Route only this reflected call
    // through the extension, which repairs the uploader's two cached comparison
    // values and then invokes the original method unchanged.
    when (val invocation = instructions[dynamicUploaderInvokeIndex]) {
        is FiveRegisterInstruction -> method.replaceInstruction(
            dynamicUploaderInvokeIndex,
            "invoke-static { v${invocation.registerC}, v${invocation.registerD}, " +
                "v${invocation.registerE} }, $EXTENSION->invokeCurrentImageUploader(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )

        is RegisterRangeInstruction -> method.replaceInstruction(
            dynamicUploaderInvokeIndex,
            "invoke-static/range { v${invocation.startRegister} .. " +
                "v${invocation.startRegister + 2} }, " +
                "$EXTENSION->invokeCurrentImageUploader(Ljava/lang/reflect/Method;" +
                "Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;",
        )

        else -> error("ChMate dynamic image uploader registers were not found")
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyThreadUrlEntry(
    profile: ChMateProfile,
) {
    val activityClass = if (profile.hasHiltSettings) {
        "Ljp/syoboi/a2chMate/activity/Hilt_ResListActivity;"
    } else {
        "Ljp/syoboi/a2chMate/activity/ResListActivity;"
    }
    mutableClassDefBy(activityClass).methods.single { method ->
        method.name == "onCreate"
            && method.returnType == "V"
            && method.parameters.map(CharSequence::toString) == listOf("Landroid/os/Bundle;")
    }.addInstruction(
        0,
        "invoke-static/range { p0 .. p0 }, " +
            "$EXTENSION->rewriteLegacyThreadIntent(Landroid/app/Activity;)V",
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext
    .patchFinishedLegacyThreadLaunchGuard() {
    val method = mutableClassDefBy("Ljp/syoboi/a2chMate/activity/ResListActivity;")
        .methods
        .single { candidate ->
            candidate.name == "onCreate"
                && candidate.returnType == "V"
                && candidate.parameters.map(CharSequence::toString) ==
                listOf("Landroid/os/Bundle;")
        }
    val instructions = method.implementation?.instructions
        ?: error("ChMate ResListActivity onCreate has no implementation")
    val superOnCreateIndex = instructions.indices.firstOrNull { index ->
        if (instructions[index].opcode != Opcode.INVOKE_SUPER) return@firstOrNull false
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@firstOrNull false
        reference.name == "onCreate"
            && reference.returnType == "V"
            && reference.parameterTypes.map(CharSequence::toString) ==
            listOf("Landroid/os/Bundle;")
    } ?: error("ChMate ResListActivity super.onCreate call was not found")
    val freeRegister = method.findFreeRegister(superOnCreateIndex + 1)

    // Automatic DAT import finishes the first Activity and opens a retry Activity
    // after publishing its local cache. Some Android versions still continue the
    // concrete onCreate method after finish(), where ChMate assumes its content
    // views exist and calls View.getTag() on null. Stop only that finished instance.
    method.addInstructionsWithLabels(
        superOnCreateIndex + 1,
        """
            invoke-virtual { p0 }, Landroid/app/Activity;->isFinishing()Z
            move-result v$freeRegister
            if-eqz v$freeRegister, :haiagaru_continue_reslist_create
            return-void
            :haiagaru_continue_reslist_create
            nop
        """,
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyTabletThreadUrlEntry(
    versionName: String,
) {
    val (methodName, fragmentType) = when (versionName) {
        "0.8.10.191 dev" -> "Sq_" to "Lo/r8lambdahIGIGCNpKpFqE0lgDli724UCuDM;"
        "0.8.10.226 dev" -> "d" to "Landroidx/fragment/app/Fragment;"
        "0.8.10.243 dev" -> "c" to "Landroidx/fragment/app/Fragment;"
        else -> error("Unsupported tablet thread entry version: $versionName")
    }
    val method = mutableClassDefBy("Ljp/syoboi/a2chMate/activity/TabletHomeActivity;")
        .methods
        .single { candidate ->
            candidate.name == methodName
                && candidate.returnType == "V"
                && candidate.parameters.map(CharSequence::toString) == listOf(
                fragmentType,
                "I",
                "Landroid/os/Bundle;",
            )
        }
    val freeRegister = method.findFreeRegister(0)
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static { p0, p3 }, $EXTENSION->rewriteLegacyTabletThreadBundle(Landroid/app/Activity;Landroid/os/Bundle;)Z
            move-result v$freeRegister
            if-eqz v$freeRegister, :haiagaru_continue_tablet_thread
            return-void
            :haiagaru_continue_tablet_thread
            nop
        """,
    )
}

/**
 * ChMate initializes both LevelPlay and IronSource Ad Quality while constructing its
 * banner wrapper, before LevelPlayBannerAdView.loadAd() is reached. Guarding loadAd()
 * alone therefore still lets the SDK contact i-sdk.mediation.unity3d.com and
 * i-adq.mediation.unity3d.com. Stop both public initialization paths while ad hiding
 * is enabled, without tying this patch to the SDK's non-ASCII implementation name.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLevelPlayTrackerInitialization() {
    val levelPlayInitMethods = mutableClassDefBy("Lcom/unity3d/mediation/LevelPlay;")
        .methods
        .filter { method ->
            method.name == "init"
                && method.returnType == "V"
                && method.parameters.firstOrNull()?.toString() == "Landroid/content/Context;"
        }
    check(levelPlayInitMethods.isNotEmpty()) {
        "LevelPlay initialization entry point was not found"
    }
    levelPlayInitMethods.forEach { it.addHideAdsGuard() }

    var adQualityInitMethodCount = 0
    classDefForEach { classDef ->
        if (classDef.superclass != "Lcom/ironsource/adqualitysdk/sdk/IronSourceAdQuality;") {
            return@classDefForEach
        }

        val mutableClass = mutableClassDefBy(classDef)
        classDef.methods
            .filter { method ->
                method.name == "initialize"
                    && method.returnType == "V"
                    && method.parameters.take(2).map(CharSequence::toString) == listOf(
                        "Landroid/content/Context;",
                        "Ljava/lang/String;",
                    )
            }
            .forEach { method ->
                mutableClass.findMutableMethodOf(method).addHideAdsGuard()
                adQualityInitMethodCount++
            }
    }
    check(adQualityInitMethodCount > 0) {
        "IronSource Ad Quality initialization implementation was not found"
    }

    // Unity Ads generations before 4.16 do not contain AdsSdkInitializer.
    // Guard the entry point when present while retaining the LevelPlay and Ad
    // Quality guards above for older ChMate targets such as 0.8.10.226 dev.
    classDefForEach { classDef ->
        if (classDef.type != "Lcom/unity3d/services/core/configuration/AdsSdkInitializer;") {
            return@classDefForEach
        }
        val mutableClass = mutableClassDefBy(classDef)
        classDef.methods.filter { method ->
            method.name == "create"
                && method.returnType == "V"
                && method.parameters.map(CharSequence::toString) ==
                listOf("Landroid/content/Context;")
        }.forEach { method ->
            mutableClass.findMutableMethodOf(method).addHideAdsContextGuard("p1")
        }
    }

    listOf(
        "Lcom/ironsource/lifecycle/IronsourceLifecycleProvider;",
        "Lcom/ironsource/lifecycle/LevelPlayActivityLifecycleProvider;",
    ).forEach { providerType ->
        mutableClassDefBy(providerType).methods
            .single { method ->
                method.name == "onCreate"
                    && method.returnType == "Z"
                    && method.parameters.isEmpty()
            }
            .addHideAdsContentProviderGuard()
    }
}

/**
 * AppLovin and Google Mobile Ads register manifest ContentProviders in every supported
 * ChMate build, so they can initialize before any banner load method is called. Keep
 * the providers inert when ad hiding is enabled while preserving their original path
 * when the setting is disabled.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchCommonAdSdkInitialization() {
    mutableClassDefBy("Lcom/applovin/sdk/AppLovinInitProvider;").methods
        .single { method ->
            method.name == "onCreate"
                && method.returnType == "Z"
                && method.parameters.isEmpty()
        }
        .addHideAdsContentProviderGuard()

    mutableClassDefBy("Lcom/google/android/gms/ads/MobileAdsInitProvider;").methods
        .single { method ->
            method.name == "attachInfo"
                && method.returnType == "V"
                && method.parameters.map(CharSequence::toString) == listOf(
                    "Landroid/content/Context;",
                    "Landroid/content/pm/ProviderInfo;",
                )
        }
        .addHideAdsContextGuard("p1")
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

/**
 * ChMate 191 represents the banner between responses as adapter view type 5.
 * Collapse that returned row while preserving every normal response row.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyThreadListAd(
    adapterClass: String,
) {
    val method = mutableClassDefBy(adapterClass).methods.single { method ->
        method.name == "getView"
            && method.returnType == "Landroid/view/View;"
            && method.parameters.map(CharSequence::toString) == listOf(
                "I",
                "Landroid/view/View;",
                "Landroid/view/ViewGroup;",
            )
    }
    val instructions = method.implementation?.instructions
        ?: error("ChMate 191 response adapter has no implementation")
    val bindIndex = instructions.indices.single { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@single false
        val resultTail = instructions.drop(index + 1).take(4).map { it.opcode }
        reference.returnType == "Landroid/view/View;"
            && resultTail.firstOrNull() == Opcode.MOVE_RESULT_OBJECT
            && resultTail.contains(Opcode.RETURN_OBJECT)
    }

    // Keep p1 as the original adapter position and move the returned row to p2;
    // the parent argument is no longer needed after the bind call.
    method.replaceInstruction(bindIndex + 1, "move-result-object p2")
    val returnIndex = (bindIndex + 2 until minOf(bindIndex + 5, instructions.size))
        .single { instructions[it].opcode == Opcode.RETURN_OBJECT }
    if (returnIndex != bindIndex + 2) {
        // 226 inserts Kotlin's non-null assertion between the bind and return.
        method.replaceInstruction(
            bindIndex + 2,
            "invoke-static {p2, v0}, Lo/fsYhp;->e(Ljava/lang/Object;Ljava/lang/String;)V",
        )
    }
    method.replaceInstruction(returnIndex, "return-object p2")
    method.addInstruction(
        returnIndex,
        "invoke-static {p2, p0, p1}, " +
            "$EXTENSION->hideLegacyThreadListAd(Landroid/view/View;Landroid/widget/BaseAdapter;I)V",
    )
}

private fun MutableMethod.returnProviderStartupDelegate(profile: ChMateProfile) {
    addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, p0
            iget-object v0, v0, ${profile.providerStartupTrapClass}->${profile.providerStartupDelegateField}:${profile.providerStartupDelegateType}
            invoke-virtual { v0 }, ${profile.providerStartupDelegateType}->${profile.providerStartupDelegateMethod}()Ljava/lang/Object;
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
                // The integrity state sends inequality to the RuntimeException(String)
                // block. The normal fall-through immediately loads the factory
                // discriminator and switches.
                .indexOfLast { it.opcode == Opcode.IF_NE }
                .takeIf { it >= 0 }
                ?: error("ChMate ViewModel factory failure branch was not found")
            replaceInstruction(failureBranchIndex, "nop")
        }
    }
}

private fun MutableMethod.ignoreSignatureRejection(profile: ChMateProfile) {
    if (profile.signatureDirectWrapperBypass) {
        // Rejection is encoded as IF_NE -> null throw in both wrapper layers. Keep
        // their complete initialization and delegate calls, but force the normal path.
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

private fun MutableMethod.addHideAdsContextGuard(contextRegister: String) {
    val freeRegister = findFreeRegister(0)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { $contextRegister }, $EXTENSION->shouldHideAds(Landroid/content/Context;)Z
            move-result v$freeRegister
            if-eqz v$freeRegister, :show_ads
            return-void
            :show_ads
            nop
        """
    )
}

private fun MutableMethod.addHideAdsContentProviderGuard() {
    val freeRegister = findFreeRegister(0)
    addInstructionsWithLabels(
        0,
        """
            invoke-virtual { p0 }, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;
            move-result-object v$freeRegister
            invoke-static { v$freeRegister }, $EXTENSION->shouldHideAds(Landroid/content/Context;)Z
            move-result v$freeRegister
            if-eqz v$freeRegister, :show_ads
            const/4 v$freeRegister, 0x1
            return v$freeRegister
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
 * Filters BE icon tokens from the response model's attachment projections while
 * retaining the target generation's native inline icon renderer. The class is
 * selected by the same field and method shapes used by the 191 response model.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchBeAttachmentCompatibility(
    responseModelClass: String,
) {
    val responseClass = mutableClassDefBy(responseModelClass)

    responseClass.methods.single { method ->
        method.returnType == "Ljava/lang/String;"
            && method.parameters.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;", "Z", "Z")
    }.addInstructionsWithLabels(
        0,
        """
            invoke-static { p0, p1, p2 }, $EXTENSION->filterBeIconText(Ljava/lang/String;ZZ)Ljava/lang/String;
            move-result-object p0
        """,
    )

    val instanceExtractor = responseClass.methods.single { method ->
        method.returnType == "[Ljava/lang/String;"
            && method.parameters.isEmpty()
    }
    instanceExtractor.filterBeAttachmentArrayReturns()

    val staticExtractor = responseClass.methods.single { method ->
        method.returnType == "[Ljava/lang/String;"
            && method.parameters.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;", "Z")
    }
    staticExtractor.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->stripLegacyBeAttachmentTokens(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
        """,
    )
    staticExtractor.filterBeAttachmentArrayReturns()

    responseClass.methods.single { method ->
        method.returnType == "[Ljava/lang/CharSequence;"
            && method.parameters.map(CharSequence::toString) == listOf("[Ljava/lang/String;")
    }.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->filterLegacyBeAttachments([Ljava/lang/String;)[Ljava/lang/String;
            move-result-object p0
        """,
    )
}

private fun MutableMethod.filterBeAttachmentArrayReturns() {
    val returnIndexes = implementation?.instructions
        ?.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT) index else null
        }
        .orEmpty()
    returnIndexes.asReversed().forEach { index ->
        val returnRegister = (implementation!!.instructions[index] as OneRegisterInstruction).registerA
        addInstructionsWithLabels(
            index,
            """
                invoke-static/range { v$returnRegister .. v$returnRegister }, $EXTENSION->filterLegacyBeAttachments([Ljava/lang/String;)[Ljava/lang/String;
                move-result-object v$returnRegister
            """,
        )
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoBeRendering(
    parserClass: String,
    drawableClass: String,
) {
    val parserMethod = mutableClassDefBy(parserClass).methods.single { method ->
        method.returnType == "V"
            && method.parameters.size == 5
            && method.parameters[2].toString() == "Ljava/lang/String;"
            && method.parameters[4].toString() == "Z"
    }
    parserMethod.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p2 .. p2 }, $EXTENSION->prepareLegacyBeParsing(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p2
        """,
    )

    val linkParserType = parserMethod.parameters[0].toString()
    val linkInfoField = mutableClassDefBy(linkParserType).fields.single { field ->
        field.type == "[I"
    }.name
    val parserInstructions = parserMethod.implementation?.instructions
        ?: error("ChMate pre-io text parser has no implementation")
    val scanIndex = parserInstructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@mapIndexedNotNull null
        if (reference.definingClass == linkParserType
            && reference.returnType == "Z"
            && reference.parameterTypes.isEmpty()
        ) index else null
    }.single()
    (parserInstructions.getOrNull(scanIndex + 1)
        ?.takeIf { it.opcode == Opcode.MOVE_RESULT }
        as? OneRegisterInstruction)?.registerA
        ?: error("ChMate pre-io text parser result was not found")
    val linkInfoIndex = parserInstructions.mapIndexedNotNull { index, instruction ->
        if (index <= scanIndex) return@mapIndexedNotNull null
        val reference = (instruction as? ReferenceInstruction)?.reference
            as? FieldReference ?: return@mapIndexedNotNull null
        if (reference.definingClass == linkParserType
            && reference.name == linkInfoField
            && reference.type == "[I"
        ) index else null
    }.first()
    val linkInfoRegister = (parserInstructions[linkInfoIndex] as TwoRegisterInstruction).registerA
    val textRegister = linkInfoRegister + 1
    val resultRegister = linkInfoRegister + 2
    parserMethod.addInstructionsWithLabels(
        linkInfoIndex + 1,
        """
            move-object/from16 v$textRegister, p2
            const/4 v$resultRegister, 0x1
            invoke-static { v$textRegister, v$linkInfoRegister, v$resultRegister }, $EXTENSION->classifyLegacyBeIcon(Ljava/lang/String;[IZ)Z
            move-result v$resultRegister
        """,
    )

    mutableClassDefBy(drawableClass).methods.single { method ->
        method.name == "<init>"
            && method.returnType == "V"
            && method.parameters.map(CharSequence::toString) ==
            listOf("Landroid/content/Context;", "Ljava/lang/String;")
    }.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p2 .. p2 }, $EXTENSION->normalizeBeIconUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p2
        """,
    )
}

/**
 * Ports the 191 URL-range repair to the corresponding pre-io text renderer.
 * Both renderers can remove display characters before link spans are attached,
 * so the native parser's original offsets may leave the first character plain
 * or discard a URL at the end of a response.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoUrlSpanAlignment(
    parserClass: String,
) {
    val parserMethod = mutableClassDefBy(parserClass).methods.single { method ->
        method.returnType == "V"
            && method.parameters.size == 5
            && method.parameters[2].toString() == "Ljava/lang/String;"
            && method.parameters[4].toString() == "Z"
    }
    val builderType = parserMethod.parameters[1].toString()
    val builderTextField = mutableClassDefBy(builderType).fields.single { field ->
        field.type == "Ljava/lang/StringBuilder;"
    }.name
    val linkSpanType = parserClass.removeSuffix(";") + "\$read;"
    val linkUrlGetter = mutableClassDefBy(linkSpanType).methods.single { method ->
        method.returnType == "Ljava/lang/String;" && method.parameters.isEmpty()
    }.name

    data class LinkSpanInsertion(
        val index: Int,
        val builderRegister: Int,
        val spanRegister: Int,
        val startRegister: Int,
        val endRegister: Int,
    )

    val instructions = parserMethod.implementation?.instructions
        ?: error("ChMate pre-io text parser has no implementation")
    val insertions = instructions.mapIndexedNotNull { index, instruction ->
        val invocation = instruction as? FiveRegisterInstruction
            ?: return@mapIndexedNotNull null
        val reference = (instruction as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@mapIndexedNotNull null
        if (reference.definingClass != builderType
            || reference.returnType != builderType
            || reference.parameterTypes.map(CharSequence::toString) !=
            listOf("Ljava/lang/Object;", "I", "I")
        ) return@mapIndexedNotNull null

        val spanRegister = invocation.registerD
        val constructsLinkSpan = instructions
            .subList(maxOf(0, index - 40), index)
            .any { preceding ->
                val precedingInvocation = preceding as? FiveRegisterInstruction
                    ?: return@any false
                val precedingReference = (preceding as? ReferenceInstruction)?.reference
                    as? MethodReference ?: return@any false
                preceding.opcode == Opcode.INVOKE_DIRECT
                    && precedingInvocation.registerC == spanRegister
                    && precedingReference.definingClass == linkSpanType
                    && precedingReference.name == "<init>"
            }
        if (!constructsLinkSpan) return@mapIndexedNotNull null

        LinkSpanInsertion(
            index = index,
            builderRegister = invocation.registerC,
            spanRegister = spanRegister,
            startRegister = invocation.registerE,
            endRegister = invocation.registerF,
        )
    }
    check(insertions.isNotEmpty()) {
        "ChMate pre-io URL span insertion sites were not found"
    }

    insertions.asReversed().forEach { insertion ->
        parserMethod.addInstructionsWithLabels(
            insertion.index,
            """
                iget-object v12, v${insertion.builderRegister}, $builderType->$builderTextField:Ljava/lang/StringBuilder;
                invoke-virtual { v${insertion.spanRegister} }, $linkSpanType->$linkUrlGetter()Ljava/lang/String;
                move-result-object v13
                invoke-static { v12, v13, v${insertion.startRegister}, v${insertion.endRegister} }, $EXTENSION->alignLegacyLinkRange(Ljava/lang/CharSequence;Ljava/lang/String;II)J
                move-result-wide v14
                long-to-int v${insertion.startRegister}, v14
                const/16 v13, 0x20
                ushr-long v14, v14, v13
                long-to-int v${insertion.endRegister}, v14
            """,
        )
    }
}

/**
 * Ports the URL-model and fixed endpoint handling used by the legacy 191 route
 * to later pre-5ch.io builds whose parser implementation has different names.
 * BE rendering and image upload stay on the target's own newer implementations.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoDomainCompatibility(
    parseMethodName: String,
) {
    val urlInfoClass = mutableClassDefBy("Ljp/syoboi/a2chMate/client/BBSUrlInfo;")

    urlInfoClass.methods.single { method ->
        method.name == parseMethodName
            && method.returnType == "Ljp/syoboi/a2chMate/client/BBSUrlInfo;"
            && method.parameters.map(CharSequence::toString) == listOf("Ljava/lang/String;")
    }.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->rewrite5chUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
        """
    )

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
                """,
            )
        }
    }

    // Update constants used outside BBSUrlInfo as well: board menus, search,
    // posting, cookies, UPLIFT/BE, and auxiliary 5ch endpoints.
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
}

/**
 * Restores the current 5ch.io transport contract in the last pre-io ChMate build.
 * The legacy URL model and posting engine are retained; only their domain, clock,
 * and confirmation semantics are adapted.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacy5chIoCompatibility() {
    // The 191 Talk menu adapter converts classic.talk-platform.com entries to
    // talk.jp/boards/<board>. Its legacy BBSUrlInfo parser only accepts the
    // root form talk.jp/<board>, so every parsed board is otherwise discarded.
    val talkMenuAdapter = mutableClassDefBy("Lo/setRequestLatencyMillis;")
    val talkBoardPrefixSites = talkMenuAdapter.methods.flatMap { method ->
        method.implementation?.instructions.orEmpty().mapIndexedNotNull { index, instruction ->
            val value = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
            val register = (instruction as? OneRegisterInstruction)?.registerA
            if (value == "https://talk.jp/boards/" && register != null) {
                Triple(method, index, register)
            } else {
                null
            }
        }
    }
    check(talkBoardPrefixSites.size == 1) {
        "ChMate 191 Talk board URL prefix site was not uniquely identified"
    }
    talkBoardPrefixSites.single().let { (method, index, register) ->
        method.replaceInstruction(index, "const-string v$register, \"https://talk.jp/\"")
    }

    val urlInfoClass = mutableClassDefBy("Ljp/syoboi/a2chMate/client/BBSUrlInfo;")
    val legacyLinkParserType =
        "Ljp/syoboi/utils/NativeUtils\$RemoteActionCompatParcelizer;"

    // The first boolean is ChMate's derived hideBeIcon flag (!showBeIcon).
    // Filter only the transient display copy when that flag is true. This
    // covers .io URLs that bypass the native parser's BE span classification.
    mutableClassDefBy("Lo/processAdDisplayErrorPostbackForUserError;").methods.single { method ->
        method.name == "c"
            && method.returnType == "Ljava/lang/String;"
            && method.parameters.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;", "Z", "Z")
    }.addInstructionsWithLabels(
        0,
        """
            invoke-static { p0, p1, p2 }, $EXTENSION->filterBeIconText(Ljava/lang/String;ZZ)Ljava/lang/String;
            move-result-object p0
        """
    )

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

    // The 191 renderer may remove one display character before this parser runs.
    // Realign custom URL spans against the actual StringBuilder content. Without
    // this, the leading "h" stays plain and a URL at end-of-text is discarded by
    // o8.Vq_() because its end offset exceeds the SpannableString length.
    val legacyLinkSpanType = "Lo/ocd\$setContentView;"
    data class LinkSpanInsertion(
        val index: Int,
        val builderRegister: Int,
        val spanRegister: Int,
        val startRegister: Int,
        val endRegister: Int
    )
    val linkSpanInsertions = legacyTextParserMethod.implementation!!.instructions
        .mapIndexedNotNull { index, instruction ->
            val invocation = instruction as? FiveRegisterInstruction
                ?: return@mapIndexedNotNull null
            val reference = (instruction as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@mapIndexedNotNull null
            if (reference.definingClass != "Lo/o8;"
                || reference.name != "c"
                || reference.returnType != "Lo/o8;"
                || reference.parameterTypes.map(CharSequence::toString) !=
                listOf("Ljava/lang/Object;", "I", "I")
            ) return@mapIndexedNotNull null

            val spanRegister = invocation.registerD
            val constructsLinkSpan = legacyTextParserMethod.implementation!!.instructions
                .subList(maxOf(0, index - 40), index)
                .any { preceding ->
                    val precedingInvocation = preceding as? FiveRegisterInstruction
                        ?: return@any false
                    val precedingReference = (preceding as? ReferenceInstruction)?.reference
                        as? MethodReference ?: return@any false
                    preceding.opcode == Opcode.INVOKE_DIRECT
                        && precedingInvocation.registerC == spanRegister
                        && precedingReference.definingClass == legacyLinkSpanType
                        && precedingReference.name == "<init>"
                }
            if (!constructsLinkSpan) return@mapIndexedNotNull null

            LinkSpanInsertion(
                index = index,
                builderRegister = invocation.registerC,
                spanRegister = spanRegister,
                startRegister = invocation.registerE,
                endRegister = invocation.registerF
            )
        }

    check(linkSpanInsertions.isNotEmpty()) {
        "ChMate 191 URL span insertion sites were not found"
    }
    linkSpanInsertions.asReversed().forEach { insertion ->
        legacyTextParserMethod.addInstructionsWithLabels(
            insertion.index,
            """
                iget-object v12, v${insertion.builderRegister}, Lo/o8;->e:Ljava/lang/StringBuilder;
                invoke-virtual { v${insertion.spanRegister} }, $legacyLinkSpanType->c()Ljava/lang/String;
                move-result-object v13
                invoke-static { v12, v13, v${insertion.startRegister}, v${insertion.endRegister} }, $EXTENSION->alignLegacyLinkRange(Ljava/lang/CharSequence;Ljava/lang/String;II)J
                move-result-wide v14
                long-to-int v${insertion.startRegister}, v14
                const/16 v13, 0x20
                ushr-long v14, v14, v13
                long-to-int v${insertion.endRegister}, v14
            """
        )
    }

    // The response model scans the raw body again when it builds the attachment
    // list. Remove BE tokens only from this private copy. The original response
    // remains untouched for the inline emoticon renderer above.
    val legacyAttachmentMethod =
        mutableClassDefBy("Lo/processAdDisplayErrorPostbackForUserError;").methods.single { method ->
            method.name == "d"
                && method.returnType == "[Ljava/lang/String;"
                && method.parameters.isEmpty()
        }
    val legacyAttachmentInstructions = legacyAttachmentMethod.implementation?.instructions
        ?: error("ChMate legacy attachment extractor has no implementation")
    val parserTextAssignmentIndex = legacyAttachmentInstructions.indices.single { index ->
        val instruction = legacyAttachmentInstructions[index]
        val reference = (instruction as? ReferenceInstruction)?.reference
            as? FieldReference ?: return@single false
        instruction.opcode == Opcode.IPUT_OBJECT
            && reference.definingClass == legacyLinkParserType
            && reference.name == "d"
            && reference.type == "Ljava/lang/String;"
    }
    val attachmentTextRegister =
        (legacyAttachmentInstructions[parserTextAssignmentIndex] as TwoRegisterInstruction).registerA
    legacyAttachmentMethod.addInstructionsWithLabels(
        parserTextAssignmentIndex,
        """
            invoke-static/range { v$attachmentTextRegister .. v$attachmentTextRegister }, $EXTENSION->stripLegacyBeAttachmentTokens(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$attachmentTextRegister
        """
    )

    // The old native parser can still report current plain/protocol-relative
    // img.5ch.io icon URLs as ordinary images. Filter the extractor's final
    // result as the authoritative guard so those URLs never reach thumbnails.
    val attachmentReturnIndexes = legacyAttachmentMethod.implementation?.instructions
        ?.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT) index else null
        }
        .orEmpty()
    attachmentReturnIndexes.asReversed().forEach { index ->
        val returnRegister =
            (legacyAttachmentMethod.implementation!!.instructions[index] as OneRegisterInstruction)
                .registerA
        legacyAttachmentMethod.addInstructionsWithLabels(
            index,
            """
                invoke-static/range { v$returnRegister .. v$returnRegister }, $EXTENSION->filterLegacyBeAttachments([Ljava/lang/String;)[Ljava/lang/String;
                move-result-object v$returnRegister
            """
        )
    }

    // ChMate 191 also has a static extractor used by the thread-wide image
    // collector. It bypasses the per-response d() method above, so filter its
    // final URL array as well.
    val legacyStaticAttachmentMethod =
        mutableClassDefBy("Lo/processAdDisplayErrorPostbackForUserError;").methods.single { method ->
            method.name == "e"
                && method.returnType == "[Ljava/lang/String;"
                && method.parameters.map(CharSequence::toString) ==
                listOf("Ljava/lang/String;", "Z")
        }
    legacyStaticAttachmentMethod.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->stripLegacyBeAttachmentTokens(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
        """
    )
    val staticAttachmentReturnIndexes = legacyStaticAttachmentMethod.implementation?.instructions
        ?.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT) index else null
        }
        .orEmpty()
    staticAttachmentReturnIndexes.asReversed().forEach { index ->
        val returnRegister =
            (legacyStaticAttachmentMethod.implementation!!.instructions[index] as OneRegisterInstruction)
                .registerA
        legacyStaticAttachmentMethod.addInstructionsWithLabels(
            index,
            """
                invoke-static/range { v$returnRegister .. v$returnRegister }, $EXTENSION->filterLegacyBeAttachments([Ljava/lang/String;)[Ljava/lang/String;
                move-result-object v$returnRegister
            """
        )
    }

    // Finally guard the String[] -> display-item conversion. This covers cached
    // arrays and any other caller that populated the attachment list before the
    // two extractors above were reached.
    val legacyAttachmentDisplayMethod =
        mutableClassDefBy("Lo/processAdDisplayErrorPostbackForUserError;").methods.single { method ->
            method.name == "c"
                && method.returnType == "[Ljava/lang/CharSequence;"
                && method.parameters.map(CharSequence::toString) ==
                listOf("[Ljava/lang/String;")
        }
    legacyAttachmentDisplayMethod.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->filterLegacyBeAttachments([Ljava/lang/String;)[Ljava/lang/String;
            move-result-object p0
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

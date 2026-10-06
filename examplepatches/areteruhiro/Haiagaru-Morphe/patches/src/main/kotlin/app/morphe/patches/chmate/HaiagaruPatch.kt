package app.morphe.patches.chmate

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.PublicXmlManager
import app.morphe.patcher.patch.stringOption
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
import org.w3c.dom.Document
import java.net.URI
import java.io.File
import java.security.MessageDigest
import java.util.Locale

private const val EXTENSION = "Lapp/morphe/extension/chmate/Haiagaru;"

private object EmojiFontResourceMarker

/**
 * ChMate stores ordinary NG entries and shared NG-ID entries with separate
 * counters.  All supported builds used the same hard-coded 300-entry cap in
 * the NGWord save routine.  Replace those two literals with the Haiagaru
 * setting while keeping the surrounding retention and timestamp logic intact.
 */
private fun BytecodePatchContext.patchNgRegistrationLimit() {
    val ngWord = mutableClassDefBy("Ljp/syoboi/a2chMate/ng/NGWord;")
    val candidates = ngWord.methods.filter { method ->
        method.returnType == "V"
            && method.parameters.map(CharSequence::toString).singleOrNull() ==
                "Ljava/util/ArrayList;"
            && method.implementation?.instructions?.count { instruction ->
                instruction.opcode == Opcode.CONST_16
                    && (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 300
            } == 1
    }
    check(candidates.size == 1) {
        "Unable to identify ChMate NGWord save routine (found ${candidates.size})"
    }
    val saveMethod = candidates.single()
    val limitConstants = saveMethod.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode == Opcode.CONST_16
            && (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 300) {
            index to (instruction as OneRegisterInstruction).registerA
        } else {
            null
        }
    }
    check(limitConstants.size == 1) { "ChMate NGWord save limit anchor changed" }
    limitConstants.asReversed().forEach { (index, register) ->
        saveMethod.replaceInstruction(
            index,
            "invoke-static {}, $EXTENSION->getNgRegistrationLimit()I"
        )
        saveMethod.addInstructionsWithLabels(index + 1, "move-result v$register")
    }
}

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

/** Board-list URL producer used by the Edge live board. */
private object EdgeSubjectUrlFingerprint : Fingerprint(
    definingClass = "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
    name = "z",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("/subject.txt")
)

private object EdgeSubjectUrl191Fingerprint : Fingerprint(
    definingClass = "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
    name = "l",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("/subject.txt")
)

private object EdgeSubjectUrl226Fingerprint : Fingerprint(
    definingClass = "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
    name = "B",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("/subject.txt")
)

private object EdgeThreadMenu226Fingerprint : Fingerprint(
    definingClass = "Lo/TTInterstitialActivity;",
    name = "<init>",
    strings = listOf("threadTitle", "bookmarkId", "threadUrl")
)

private object EdgeThreadMenu191Fingerprint : Fingerprint(
    definingClass = "Lo/q8;",
    name = "<init>",
    strings = listOf("threadTitle", "bookmarkId", "threadUrl")
)

private object EdgeSubjectUrl241Fingerprint : Fingerprint(
    definingClass = "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
    name = "B",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("/subject.txt")
)

private object EdgeSubjectUrl242Fingerprint : Fingerprint(
    definingClass = "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
    name = "C",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("/subject.txt")
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
    "0.8.10.242 dev" -> ChMateProfile(
        providerClass = "Lo/isConnected;",
        providerStartupTrapClass = null,
        providerStartupDelegateField = "",
        providerStartupDelegateType = "",
        providerStartupDelegateMethod = "",
        settingsViewModelClass = null,
        applicationClass = "Ljp/syoboi/a2chMate/RoidonApp;",
        homeFragmentClass = "Ljp/syoboi/a2chMate/ui/home/HomeFragment;",
        cookieClearMethod = "e",
        signatureClass = "Lo/TTRewardExpressVideoActivity${'$'}5;",
        signatureMethod = "c",
        signatureDelegateField = "a",
        signatureDelegateType = "Lo/TTRewardExpressVideoActivity${'$'}read;",
        signatureDelegateMethod = "c",
        signatureSuperType = "Lo/TTRewardExpressVideoActivity${'$'}RemoteActionCompatParcelizer;",
        patchSignatureWrapper = true,
        signatureDirectWrapperBypass = true,
        viewModelFactoryClass = "Lo/onInterstitialDismissed${'$'}_init_lambda2${'$'}ComponentActivity;",
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

private fun BytecodePatchContext.patchEdgeArchiveToolbar(
    profile: ChMateProfile,
    versionName: String,
) {
    val legacyToolbar = versionName == "0.8.10.191 dev"
    val toolbarModelType = if (versionName == "0.8.10.191 dev") {
        "Lo/r8lambdaElkXfNt4VbdvffL9Z700R6oMDo;"
    } else {
        "Ljp/syoboi/a2chMate/feature/toolbar/ToolbarDefault;"
    }

    fun MutableMethod.wrapModelReturns(includeMarkAllRead: Boolean = false) {
        val indexes = implementation?.instructions
            ?.withIndex()
            ?.filter { it.value.opcode == Opcode.RETURN_OBJECT }
            ?.map { it.index }
            .orEmpty()
        for (index in indexes.asReversed()) {
            val register = (implementation!!.instructions[index] as OneRegisterInstruction).registerA
            val markAllRead = if (includeMarkAllRead) """
                invoke-static/range { v$register .. v$register }, $EXTENSION->addMarkAllReadToolbarChoice(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$register
            """.trimIndent() else ""
            addInstructionsWithLabels(
                index,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION->addEdgeArchiveToolbarChoice(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$register
                    $markAllRead
                check-cast v$register, $toolbarModelType
                """.trimIndent(),
            )
        }
    }

    val homeToolbarMethods = mutableClassDefBy(profile.homeFragmentClass).methods.filter { method ->
        method.returnType == toolbarModelType && method.implementation != null
    }
    if (homeToolbarMethods.isEmpty()) {
        throw PatchException("ホームツールバーの生成メソッドを特定できません: $versionName")
    }
    homeToolbarMethods.forEach { method ->
        mutableClassDefBy(profile.homeFragmentClass).findMutableMethodOf(method).wrapModelReturns(includeMarkAllRead = true)
    }

    // A board's thread list owns a separate toolbar model.  Patching the
    // home model alone makes the choice disappear as soon as a board opens.
    val threadListClass = when (versionName) {
        "0.8.10.191 dev" -> "Lo/r8lambdaGCnF6WpW_bFarRe7yCX2B6KzQ;"
        "0.8.10.226 dev" -> "Lo/Yhp5;"
        else -> "Ljp/syoboi/a2chMate/ui/threadlist/ThreadListFragment;"
    }
    val threadToolbarMethods = mutableClassDefBy(threadListClass).methods.filter { method ->
        method.returnType == toolbarModelType && method.implementation != null &&
            (if (legacyToolbar || versionName == "0.8.10.226 dev") method.parameters.isEmpty() else
                method.parameters.map { it.type } == listOf(threadListClass))
    }
    if (threadToolbarMethods.isEmpty()) {
        throw PatchException("板のスレ一覧ツールバーを特定できません: $versionName")
    }
    threadToolbarMethods.forEach { method ->
        mutableClassDefBy(threadListClass).findMutableMethodOf(method).wrapModelReturns(includeMarkAllRead = true)
    }

    // BoardList2Activity displays board categories through its own fragment.
    // Its toolbar catalog is distinct from both the home and thread-list catalogs.
    val boardCategoryClass = when (versionName) {
        "0.8.10.191 dev" -> "Lo/AdControlButtona;"
        "0.8.10.226 dev" -> "Lo/setDeployments;"
        "0.8.10.241" -> "Lo/bea4;"
        "0.8.10.242 dev" -> "Lo/clearDefaultAccountAndReconnect;"
        else -> "Lo/zzbya;"
    }
    val boardCategoryMethods = mutableClassDefBy(boardCategoryClass).methods.filter { method ->
        method.returnType == toolbarModelType && method.implementation != null &&
            (if (legacyToolbar || versionName == "0.8.10.226 dev") method.parameters.isEmpty() else
                method.parameters.map { it.type } == listOf(boardCategoryClass))
    }
    if (boardCategoryMethods.isEmpty()) {
        throw PatchException("板カテゴリ一覧のツールバーを特定できません: $versionName")
    }
    boardCategoryMethods.forEach { method ->
        mutableClassDefBy(boardCategoryClass).findMutableMethodOf(method).wrapModelReturns()
    }

    // In 0.8.10.191 this separate model catalog powers the toolbar customization
    // screen; patch it as well as the default home model so the new choice is
    // available for users to enable without changing the current toolbar.
    if (versionName == "0.8.10.191 dev") {
        val catalogDescriptor = "Lo/r8lambdafLXKIgI8H4VR9SponZBKnK7_9gE;"
        val catalogMethods = mutableClassDefBy(catalogDescriptor).methods.filter { method ->
            method.returnType == toolbarModelType && method.implementation != null
        }
        if (catalogMethods.isEmpty()) {
            throw PatchException("ツールバー項目一覧の生成メソッドを特定できません: $versionName")
        }
        catalogMethods.forEach { method ->
            mutableClassDefBy(catalogDescriptor).findMutableMethodOf(method).wrapModelReturns(includeMarkAllRead = true)
        }
    }

    val dispatcherClass = if (versionName == "0.8.10.191 dev") {
        "Lo/r8lambdahIGIGCNpKpFqE0lgDli724UCuDM;"
    } else {
        profile.homeFragmentClass
    }
    val clickMethods = mutableClassDefBy(dispatcherClass).methods.filter { method ->
        method.returnType == "Z" && method.implementation != null &&
            method.implementation!!.instructions.isNotEmpty() &&
            method.parameters.map { it.type } == listOf("I", "Ljava/lang/Object;")
    }
    if (clickMethods.isEmpty()) {
        val candidates = mutableClassDefBy(dispatcherClass).methods
            .filter { it.returnType == "Z" && it.parameters.map { parameter -> parameter.type } ==
                listOf("I", "Ljava/lang/Object;") }
        throw PatchException(
            "ホームツールバーのクリック処理を特定できません: $versionName; candidates=$candidates",
        )
    }
    clickMethods.forEach { method ->
        val mutableMethod = mutableClassDefBy(dispatcherClass).findMutableMethodOf(method)
        val resultRegister = mutableMethod.findFreeRegister(0)
        val originalFirstInstruction = mutableMethod.implementation!!.instructions.first()
        mutableMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1 }, $EXTENSION->handleEdgeArchiveToolbarClick(Ljava/lang/Object;I)Z
                move-result v$resultRegister
                if-eqz v$resultRegister, :haiagaru_edge_toolbar_continue
                const/4 v$resultRegister, 0x1
                return v$resultRegister
            """.trimIndent(),
            ExternalLabel("haiagaru_edge_toolbar_continue", originalFirstInstruction),
        )
    }

    val threadClickMethods = mutableClassDefBy(threadListClass).methods.filter { method ->
        method.returnType == "Z" && method.implementation?.instructions?.isNotEmpty() == true &&
            method.parameters.map { it.type } == listOf("I", "Ljava/lang/Object;")
    }
    if (threadClickMethods.isEmpty()) {
        throw PatchException("板のスレ一覧ツールバー操作を特定できません: $versionName")
    }
    threadClickMethods.forEach { method ->
        val mutableMethod = mutableClassDefBy(threadListClass).findMutableMethodOf(method)
        val resultRegister = mutableMethod.findFreeRegister(0)
        val originalFirstInstruction = mutableMethod.implementation!!.instructions.first()
        mutableMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1 }, $EXTENSION->handleEdgeArchiveToolbarClick(Ljava/lang/Object;I)Z
                move-result v$resultRegister
                if-eqz v$resultRegister, :haiagaru_edge_thread_toolbar_continue
                const/4 v$resultRegister, 0x1
                return v$resultRegister
            """.trimIndent(),
            ExternalLabel("haiagaru_edge_thread_toolbar_continue", originalFirstInstruction),
        )
    }

    val boardCategoryClickMethods = mutableClassDefBy(boardCategoryClass).methods.filter { method ->
        method.returnType == "Z" && method.implementation?.instructions?.isNotEmpty() == true &&
            method.parameters.map { it.type } == listOf("I", "Ljava/lang/Object;")
    }
    if (boardCategoryClickMethods.isEmpty()) {
        throw PatchException("板カテゴリ一覧のツールバー操作を特定できません: $versionName")
    }
    boardCategoryClickMethods.forEach { method ->
        val mutableMethod = mutableClassDefBy(boardCategoryClass).findMutableMethodOf(method)
        val resultRegister = mutableMethod.findFreeRegister(0)
        val originalFirstInstruction = mutableMethod.implementation!!.instructions.first()
        mutableMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1 }, $EXTENSION->handleEdgeArchiveToolbarClick(Ljava/lang/Object;I)Z
                move-result v$resultRegister
                if-eqz v$resultRegister, :haiagaru_edge_board_category_toolbar_continue
                const/4 v$resultRegister, 0x1
                return v$resultRegister
            """.trimIndent(),
            ExternalLabel("haiagaru_edge_board_category_toolbar_continue", originalFirstInstruction),
        )
    }
}

private fun BytecodePatchContext.patchQuickFilterToolbar(version: String) {
    if (version == "0.8.10.191 dev") {
        val toolbarModelType = "Lo/r8lambdaElkXfNt4VbdvffL9Z700R6oMDo;"
        val builder = mutableClassDefBy("Lo/pa;").methods.single {
            it.name == "j" && it.returnType == toolbarModelType && it.parameters.isEmpty()
        }
        val returnSites = builder.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }
        check(returnSites.isNotEmpty()) { "191 response toolbar return sites missing" }
        returnSites.asReversed().forEach { (index, instruction) ->
            val register = (instruction as OneRegisterInstruction).registerA
            builder.addInstructionsWithLabels(index, """
                invoke-static/range {v$register .. v$register}, $EXTENSION->addQuickFilterToolbarChoice(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$register
                check-cast v$register, $toolbarModelType
            """.trimIndent())
        }
        val dispatcherClass = "Lo/r8lambdahIGIGCNpKpFqE0lgDli724UCuDM;"
        val dispatchers = mutableClassDefBy(dispatcherClass).methods.filter {
            it.returnType == "Z" && it.parameters.map(CharSequence::toString) ==
                listOf("I", "Ljava/lang/Object;") && it.implementation?.instructions?.isNotEmpty() == true
        }
        check(dispatchers.isNotEmpty()) { "191 response toolbar dispatcher missing" }
        dispatchers.forEach { method ->
            val mutable = mutableClassDefBy(dispatcherClass).findMutableMethodOf(method)
            val first = mutable.implementation!!.instructions.first()
            val result = mutable.findFreeRegister(0)
            mutable.addInstructionsWithLabels(0, """
                invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/QuickFilterToolbar;->clickLegacy(Ljava/lang/Object;I)Z
                move-result v$result
                if-eqz v$result, :legacy_filter_dispatch
                const/4 v$result, 0x1
                return v$result
            """.trimIndent(), ExternalLabel("legacy_filter_dispatch", first))
        }
        val filterBinding = mutableClassDefBy("Lo/j4;").methods.single {
            it.name == "<init>" && it.parameters.map(CharSequence::toString) ==
                listOf("Lo/executeOnMainThread;", "Landroid/view/View;")
        }
        val constructorReturn = filterBinding.implementation!!.instructions.indexOfLast {
            it.opcode == Opcode.RETURN_VOID
        }
        check(constructorReturn >= 0) { "191 filter binding constructor return missing" }
        filterBinding.addInstructionsWithLabels(constructorReturn, """
            invoke-static/range {p0 .. p0}, Lapp/morphe/extension/chmate/QuickFilterToolbar;->hideLegacyFilterRow(Ljava/lang/Object;)V
        """.trimIndent())
        val rows = mutableClassDefBy("Lo/m9ExternalSyntheticLambda1;").methods.single {
            it.name == "getView" && it.returnType == "Landroid/view/View;"
        }
        rows.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }.asReversed().forEach { (index, instruction) ->
                val register = (instruction as OneRegisterInstruction).registerA
                rows.addInstructionsWithLabels(index, """
                    invoke-static/range {v$register .. v$register}, Lapp/morphe/extension/chmate/QuickFilterToolbar;->prepareLegacyFilterRow(Landroid/view/View;)V
                """.trimIndent())
            }
        return
    }
    if (version !in setOf("0.8.10.226 dev", "0.8.10.241", "0.8.10.242 dev", "0.8.10.243 dev")) return
    val fragment = "Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;"
    val model = "Ljp/syoboi/a2chMate/feature/toolbar/ToolbarDefault;"
    val catalog = when (version) {
        "0.8.10.226 dev" -> "Lo/AdSlot;"
        "0.8.10.241" -> "Lo/PackageSignatureVerifier;"
        "0.8.10.242 dev" -> "Lo/zzaB;"
        else -> "Lo/zzdow;"
    }
    // These small catalogs provide both the default and tablet response toolbars.
    val builders = mutableClassDefBy(catalog).methods.filter {
        it.returnType == model && it.implementation != null
    }
    check(builders.isNotEmpty()) { "242 response toolbar catalog missing" }
    builders.forEach { builder ->
    val returns = builder.implementation!!.instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN_OBJECT }.toList().asReversed()
    returns.forEach { (index, instruction) ->
        val register = (instruction as OneRegisterInstruction).registerA
        builder.addInstructionsWithLabels(index, """
            invoke-static/range {v$register .. v$register}, $EXTENSION->addQuickFilterToolbarChoice(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$register
            check-cast v$register, $model
        """.trimIndent())
    }
    }
    val dispatchers = mutableClassDefBy(fragment).methods.filter {
        it.returnType == "Z" && it.parameters.map(CharSequence::toString) ==
            listOf("I", "Ljava/lang/Object;") && it.implementation?.instructions?.isNotEmpty() == true
    }
    check(dispatchers.size == 1) { "$version response-toolbar dispatcher count=${dispatchers.size}" }
    val dispatcher = dispatchers.single()
    val first = dispatcher.implementation!!.instructions.first()
    dispatcher.addInstructionsWithLabels(0, """
        invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/QuickFilterToolbar;->click(Ljava/lang/Object;I)Z
        move-result v0
        if-eqz v0, :original_filter_dispatch
        return v0
    """.trimIndent(), ExternalLabel("original_filter_dispatch", first))
    val filterContainer = when (version) {
        "0.8.10.226 dev" -> "Lo/listener\$setContentView;" to "Lo/m2a;"
        "0.8.10.241" -> "Lo/getRemoteResource;" to "Lo/getBCode;"
        "0.8.10.242 dev" -> "Lo/zzacr;" to "Lo/r7ExternalSyntheticLambda0;"
        else -> null
    }
    if (filterContainer != null) {
        val (adapterType, viewType) = filterContainer
        var hooks = 0
        mutableClassDefBy(adapterType).methods.forEach { method ->
            val sites = method.implementation?.instructions?.withIndex()?.filter {
                val ref = (it.value as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == viewType && ref.name == "setContent" && ref.returnType == "V"
            }.orEmpty()
            sites.asReversed().forEach { (index, instruction) ->
                val receiver = when (instruction) {
                    is FiveRegisterInstruction -> instruction.registerC
                    is RegisterRangeInstruction -> instruction.startRegister
                    else -> error("Unsupported filter setContent invocation: $version")
                }
                method.addInstructionsWithLabels(index + 1, """
                    invoke-static/range {v$receiver .. v$receiver}, Lapp/morphe/extension/chmate/QuickFilterToolbar;->prepareFilterRow(Landroid/view/View;)V
                """.trimIndent())
                hooks++
            }
        }
        check(hooks == 1) { "$version filter container anchor count=$hooks" }
        // Keep Compose initialization and state subscriptions active. Only the
        // dedicated row's measured height changes, with its original height restored on OFF.
        return
    }
    val quickFilterComposeRow = when (version) {
        "0.8.10.226 dev" -> "Lo/writeWindowUpdateLaterokhttp;" to "Lo/Ff11;"
        "0.8.10.241" -> "Lo/getRewardItem;" to "Lo/zzagp;"
        "0.8.10.242 dev" -> "Lo/isAtLeastS;" to "Lo/zzbwq;"
        "0.8.10.243 dev" -> "Lo/zzdhn;" to "Lo/zzftg;"
        else -> null
    }
    if (quickFilterComposeRow != null) {
        val (rowType, unitType) = quickFilterComposeRow
        val unitField = mutableClassDefBy(unitType).fields.single { field ->
            field.type == unitType && field.accessFlags and 8 != 0
        }
        val header = mutableClassDefBy(rowType).methods.single {
            it.name == "invoke" && it.parameters.size == 2 && it.returnType == "Ljava/lang/Object;"
        }
        val original = header.implementation!!.instructions.first()
        header.addInstructionsWithLabels(0, """
            invoke-static {}, $EXTENSION->compactQuickFilters()Z
            move-result v0
            if-eqz v0, :original_quick_filter_header
            sget-object v0, $unitType->${unitField.name}:$unitType
            return-object v0
        """.trimIndent(), ExternalLabel("original_quick_filter_header", original))
    }
    // Keep the original filter state and handlers; only omit each version's
    // Compose row while the compact toolbar option is enabled.
}

/** Board display settings and the post-bookmark thread list are separate flows. */
private fun BytecodePatchContext.patchReadThreadsFirst(version: String) {
    if (version == "0.8.10.191 dev" || version == "0.8.10.226 dev") {
        val adapterType = if (version == "0.8.10.191 dev") "Lo/m8a;" else "Lo/getWriteBytesTotal;"
        val adapterMethod = if (version == "0.8.10.191 dev") "e" else "b"
        val adapter = mutableClassDefBy(adapterType).methods.single { method ->
            method.name == adapterMethod && method.returnType == "V" &&
                method.parameters.size == 7 && method.parameters[0].toString() == "Ljava/util/ArrayList;"
        }
        val notifyIndex = adapter.implementation!!.instructions.indexOfLast { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "notifyDataSetChanged" && ref.parameterTypes.isEmpty()
        }
        check(notifyIndex >= 0) { "$version legacy board adapter has no final notify" }
        adapter.addInstructionsWithLabels(notifyIndex,
            "invoke-static/range {p0 .. p0}, " +
                "Lapp/morphe/extension/chmate/ReadThreadsFirst;->reorderLegacyAdapter(Ljava/lang/Object;)V")
        val rebuild = mutableClassDefBy(adapterType).methods.single { method ->
            method.name == "d" && method.returnType == "V" && method.parameters.isEmpty()
        }
        val rebuildNotifyIndex = rebuild.implementation!!.instructions.indexOfLast { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "notifyDataSetChanged" && ref.parameterTypes.isEmpty()
        }
        check(rebuildNotifyIndex >= 0) { "$version legacy board rebuild has no final notify" }
        rebuild.addInstructionsWithLabels(rebuildNotifyIndex,
            "invoke-static/range {p0 .. p0}, " +
                "Lapp/morphe/extension/chmate/ReadThreadsFirst;->reorderLegacyAdapter(Ljava/lang/Object;)V")
        if (version == "0.8.10.191 dev") {
            val dialog = mutableClassDefBy("Lo/onRewardedAdDisplayFailed;")
                .methods.single { it.name == "onViewCreated" && it.parameters.size == 2 }
            val returnIndex = dialog.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            check(returnIndex >= 0) { "191 display dialog has no return" }
            dialog.addInstructionsWithLabels(returnIndex,
                "invoke-static/range {p0 .. p0}, Lapp/morphe/extension/chmate/ReadThreadsFirst;->attachLegacyDialog(Ljava/lang/Object;)V")
        } else {
            val settingsContent = mutableClassDefBy("Lo/enB54;").methods.single { method ->
                method.implementation?.instructions?.any { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == "Lo/setUserAgentString;" && ref.name == "b" &&
                        ref.parameterTypes.size == 9
                } == true
            }
            // Each board-type branch closes its inner Compose scope after its
            // last checkbox. Insert before that close so the row appears last
            // in both branches (and is not bypassed by a branch target).
            val instructions = settingsContent.implementation!!.instructions
            val checkboxes = instructions.withIndex().filter { (_, instruction) ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lo/setUserAgentString;" && ref.name == "b" &&
                    ref.parameterTypes.size == 9
            }
            check(checkboxes.size == 8) { "226 display-setting checkbox layout changed: ${checkboxes.size}" }
            for (lastCheckbox in listOf(checkboxes[5], checkboxes[7]).asReversed()) {
                val call = lastCheckbox.value as? RegisterRangeInstruction
                    ?: error("226 display checkbox invocation is not a range")
                val composerRegister = call.startRegister + 6
                val close = (lastCheckbox.index + 1 until instructions.size).firstOrNull { index ->
                    val ref = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == "Lo/getValue;" && ref.name == "i" &&
                        ref.returnType == "V" && ref.parameterTypes.isEmpty()
                } ?: error("226 board-type Compose scope close missing")
                settingsContent.addInstructionsWithLabels(close,
                    "invoke-static/range {v$composerRegister .. v$composerRegister}, " +
                        "Lapp/morphe/extension/chmate/ReadThreadsFirst;->render226(Ljava/lang/Object;)V")
            }
        }
        return
    }
    if (version == "0.8.10.241") {
    val checkboxOwner = mutableClassDefBy("Lo/zaaj;")
    val compose = checkboxOwner.methods.single { method ->
        method.name == "invoke" && method.parameters.size == 3 && method.implementation != null
    }
    val instructions = compose.implementation!!.instructions
    val starLabel = instructions.indexOfFirst { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lo/SignInConnectionListener;" && ref.name == "l" && ref.parameterTypes.isEmpty()
    }
    check(starLabel >= 0) { "241 board display-settings star label missing" }
    val checkboxIndex = (starLabel + 1 until instructions.size).lastOrNull { index ->
        val ref = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lo/zaak;" && ref.name == "e" && ref.parameterTypes.size == 5
    } ?: error("241 board display-settings checkbox missing")
    val checkboxCall = instructions[checkboxIndex] as? FiveRegisterInstruction
        ?: error("241 board display-settings checkbox register format changed")
    val composerRegister = checkboxCall.registerF
    compose.addInstructionsWithLabels(
        checkboxIndex + 1,
        "invoke-static/range {v$composerRegister .. v$composerRegister}, " +
            "Lapp/morphe/extension/chmate/ReadThreadsFirst;->render(Ljava/lang/Object;)V",
    )
    } else if (version == "0.8.10.242 dev" || version == "0.8.10.243 dev") {
        if (version == "0.8.10.242 dev") {
            val checkItem = mutableClassDefBy("Lo/zzaxj;").methods.single { method ->
                method.name == "b" && method.returnType == "V" &&
                    method.parameters.size == 3 && method.implementation != null
            }
            val composeScope = checkItem.implementation!!.instructions.indexOfFirst { instruction ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lo/Y;" && ref.name == "a" &&
                    ref.returnType == "Lo/Y;"
            }
            check(composeScope >= 0) { "242 setting Compose scope missing" }
            checkItem.addInstructionsWithLabels(composeScope + 2,
                "invoke-static {p0}, " +
                    "Lapp/morphe/extension/chmate/ReadThreadsFirst;->syncCompose242CheckItem(Ljava/lang/Object;)V")
            val checkbox = mutableClassDefBy("Lo/zzaxz;").methods.single { method ->
                method.name == "a" && method.returnType == "V" &&
                    method.parameters.map(CharSequence::toString) == listOf(
                        "Lo/zzajk;", "Z", "I", "Lo/zzcbx;", "Lo/Y;", "I")
            }
            val checkboxScope = checkbox.implementation!!.instructions.indexOfFirst { instruction ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lo/Y;" && ref.name == "a" &&
                    ref.returnType == "Lo/Y;"
            }
            check(checkboxScope >= 0) { "242 checkbox Compose scope missing" }
            checkbox.addInstructionsWithLabels(checkboxScope + 2,
                "invoke-static {p2, p1}, " +
                    "Lapp/morphe/extension/chmate/ReadThreadsFirst;->compose242CheckedForLabel(IZ)Z\n" +
                    "move-result p1")
        }
        val builderType = if (version == "0.8.10.242 dev") "Lo/zzaxz;" else "Lo/zzenf;"
        val builderName = if (version == "0.8.10.242 dev") "a" else "b"
        val builder = mutableClassDefBy(builderType).methods.single { method ->
            method.name == builderName && method.returnType == "Ljava/util/List;" &&
                method.parameters.size == 4 &&
                method.parameters[2].toString() ==
                    "Ljp/syoboi/a2chMate/fragment/dialog/ThreadListSettingDialogViewModel;"
        }
        val returns = builder.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }.asReversed()
        check(returns.isNotEmpty()) { "$version display-setting builder has no return" }
        for ((index, instruction) in returns) {
            val register = (instruction as OneRegisterInstruction).registerA
            builder.addInstructionsWithLabels(index,
                "invoke-static/range {v$register .. v$register}, " +
                    "Lapp/morphe/extension/chmate/ReadThreadsFirst;->appendComposeSetting(Ljava/util/List;)V")
        }
    }

    val viewModel = mutableClassDefBy("Ljp/syoboi/a2chMate/ui/threadlist/ThreadListViewModel;")
    val mappingNames = when (version) {
        "0.8.10.241" -> listOf("a", "c")
        "0.8.10.242 dev" -> listOf("b", "d")
        "0.8.10.243 dev" -> listOf("c", "e")
        else -> error("Unsupported thread-list mapping: $version")
    }
    for (name in mappingNames) {
        val applyBookmarks = viewModel.methods.single { method ->
            method.name == name && method.returnType == "Ljava/util/List;" &&
                method.parameters.map(CharSequence::toString) == listOf(
                    "Ljp/syoboi/a2chMate/ui/threadlist/ThreadListViewModel;",
                    "Ljava/util/List;", "Ljava/util/Map;",
                )
        }
        val returns = applyBookmarks.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }.asReversed()
        check(returns.isNotEmpty()) { "$version bookmark mapping $name has no return" }
        for ((index, instruction) in returns) {
            val register = (instruction as OneRegisterInstruction).registerA
            applyBookmarks.addInstructionsWithLabels(
                index,
                "invoke-static/range {v$register .. v$register}, " +
                "Lapp/morphe/extension/chmate/ReadThreadsFirst;->reorderMapped(Ljava/util/List;)V",
            )
        }
    }
}

private val haiagaruBytecodePatch = bytecodePatch {
    compatibleWith(chMateCompatibility)
    extendWith("extensions/chmate.mpe")

    execute {
        val profile = profileFor(packageMetadata.versionName)

        val readManager = when (packageMetadata.versionName) {
            "0.8.10.241" -> "Lo/hLn11;"
            "0.8.10.242 dev" -> "Lo/VN21;"
            else -> null
        }
        readManager?.let { type ->
            mutableClassDefBy(type).methods.single {
                it.name == "<init>" && it.parameters.isEmpty()
            }.addBeforeEveryReturn(
                "invoke-static/range { p0 .. p0 }, $EXTENSION->captureReadCountManager(Ljava/lang/Object;)V"
            )
        }

        patchEdgeArchiveToolbar(profile, packageMetadata.versionName)
        patchQuickFilterToolbar(packageMetadata.versionName)
        if (packageMetadata.versionName in listOf("0.8.10.191 dev", "0.8.10.226 dev", "0.8.10.241", "0.8.10.242 dev")) {
            patchReadThreadsFirst(packageMetadata.versionName)
        }

        patchNgRegistrationLimit()

        // ChMate 226/241 remove the device-info footer with a greedy regular
        // expression before deciding whether the user wrote any other text.
        // Text appended after the footer is swallowed as well, so a non-empty
        // post can be rejected as "device information only".  Let the posting
        // endpoint perform the authoritative body validation instead.
        patchPostPreflightValidation(packageMetadata.versionName)
        if (packageMetadata.versionName == "0.8.10.191 dev") {
            patchLegacyExternalEmojiPostBody()
        } else {
            patchExternalEmojiPostCopy(packageMetadata.versionName)
        }

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
                "0.8.10.242 dev",
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
            val signatureMethod = mutableClassDefBy(profile.signatureClass).methods.single { method ->
                method.name == profile.signatureMethod
                    && method.returnType == "Ljava/lang/Object;"
                    && method.parameters.isEmpty()
            }
            if (packageMetadata.versionName == "0.8.10.243 dev") {
                signatureMethod.returnSignatureDelegate(profile)
            } else {
                signatureMethod.ignoreSignatureRejection(profile)
            }
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
                patchLegacyBeResponseBody(
                    "Lo/processAdDisplayErrorPostbackForUserError;", "c")
                patchProgrammableNg191()
                patchPreIoHissiMenu(
                    "Lo/setExtraParameter;", "d",
                    "Lo/processAdDisplayErrorPostbackForUserError;",
                    "Lo/setExtraParameter\$RemoteActionCompatParcelizer;",
                )
                patchBbsMenuUrl("a", "Lo/a7a\$read;")
                patchLegacy5chIoCompatibility()
                patchLegacyBeSpanBoundary("Lo/o8;")
                patchLegacyTalkDatLoading()
                patchLegacyTalkAuthIntegrity()
                patchLegacyCellularNetworkSelection()
                patchLegacyCellularSocketRefresh()
            }
            "0.8.10.226 dev" -> {
                patchUpliftIntegrityComparison("Lo/OpenJSSEPlatformCompanion;", "d", "Lo/OpenJSSEPlatformCompanion\$IconCompatParcelizer;")
                patchUpliftIntegrityComparison("Lo/OpenJSSEPlatformCompanion;", "j", "[Ljava/lang/Object;", returnType = "Ljava/lang/Object;")
                patchLiteralDiagnosticSubstring242(
                    "Lo/OpenJSSEPlatformCompanion;",
                    "1,30,null cannot be cast to non-null type " +
                        "jp.syoboi.a2chMate.bbs.a5ch.UpliftClient.LoginResult.Success",
                    5,
                )
                patchUpliftTokenExpiryArithmetic(
                    "Lo/OpenJSSEPlatformCompanion;", "d",
                    "Lo/OpenJSSEPlatformCompanion\$IconCompatParcelizer;", 653820,
                )
                patchAboutLogoThemeColor226()
                patchPreIoS2mSettingActivityIntegrityTrap()
                patchLegacyBeResponseBody("Lo/BouncyCastleSocketAdapterCompanion;", "d")
                patchProgrammableNg226()
                patchPreIoHissiMenu()
                patchBbsMenuUrl("a", "Lo/isInlineAdaptiveAdView\$read;")
                patchPreIoCellularNetworkSelection()
                patchPreIoCellularSocketRefresh()
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
                patchLegacyBeSpanBoundary("Lo/getFlexLinesInternal;")
                patchPreIoUrlSpanAlignment("Lo/getMaxLine;")
                patchPreIoDomainCompatibility(
                    parseMethodName = "c",
                )
            }
            "0.8.10.243 dev" -> {
                patchUpliftIntegrityComparison("Lo/zzaai;", "e", "Lo/zzaai\$ComponentActivity;")
                patchUpliftIntegrityComparison("Lo/zzaah;", "d", "Lo/zzaai\$ComponentActivity;", "Lo/zzbus;", "J")
                patchLiteralDiagnosticSubstring242(
                    "Lo/zzaah;",
                    "30/22/1/null cannot be cast to non-null type " +
                        "jp.syoboi.a2chMate.bbs.a5ch.UpliftClient.LoginResult.Success",
                    8,
                )
                patchLegacyBeResponseBody("Lo/zzabv;", "j")
                patchProgrammableNgModern("Lo/zzdic;", "a", "c")
                patchPreIoHissiMenu("Lo/zzacz;", "c", "Lo/zzabv;", "Lo/zzacz\$write;")
                patchSetTextCalls()
                patchBbsMenuUrl("b", "Lo/StandardAndroidSocketAdapterCompanion\$RemoteActionCompatParcelizer;")
                patchModernThreadListAd()
                patchModernTalkDatLoading()
                patchModernTalkPostIntegrity()
                patchModernTalkIntegrityPrimitives()
            }
            "0.8.10.241" -> {
                patchLegacyBeResponseBody("Lo/setDislikeWidth;", "g")
                patchPreIoHissiMenu("Lo/lhA1;", "d", "Lo/setDislikeWidth;", "Lo/lhA1\$write;")
                patchSetTextCalls()
                patchBbsMenuUrl("c", "Lo/TaskRunnerCompanion\$ComponentActivity;")
                patchIoTalkDatLoading()
                patchIoTalkPostIntegrity()
                patchIoUpliftLoginCastMessage()
                patchIoUpliftTokenExpiryArithmetic()
                patchIoThreadRefreshCache()
            }
            "0.8.10.242 dev" -> {
                patchLegacyBeResponseBody("Lo/KeJ11;", "h")
                patchProgrammableNgModern("Lo/emptyToNull;", "c", "c")
                patchPreIoHissiMenu("Lo/kUGNk2;", "c", "Lo/KeJ11;", "Lo/kUGNk2\$ComponentActivity;")
                patchSetTextCalls()
                patchBbsMenuUrl("c", "Lo/getPlayProviderFactory\$ComponentActivity;")
                patchModernTalkDatLoading242()
                patchModernTalkPostIntegrity("Lo/getTopCountDown;")
                patchUpliftPostingIntegrity242()
                patchUpliftLoginIntegrity242()
                patchImageUploadIntegrity242()
                patchLiteralDiagnosticSubstring242(
                    "Lo/getAdLogo;",
                    "3|18|null cannot be cast to non-null type " +
                        "jp.syoboi.a2chMate.bbs.a5ch.UpliftClient.LoginResult.Success",
                    5,
                )
                patchLiteralDiagnosticSubstring242(
                    "Ljp/syoboi/a2chMate/fragment/dialog/ThreadListSettingDialogViewModel;",
                    "20|21|31|22|6|threadQuickFilterManager",
                    14,
                )
            }
            else -> patchSetTextCalls()
        }
        if (packageMetadata.versionName == "0.8.10.241") {
            patchProgrammableNgModern("Lo/RewardedInterstitialAdLoadCallback;", "a", "a")
        }
        patchTabletThreadHeaderAdSpace(packageMetadata.versionName)
        patchStringReplacement()
        patchShortThreadTopAlignment(packageMetadata.versionName)
        when (packageMetadata.versionName) {
            "0.8.10.191 dev" -> {
                EdgeSubjectUrl191Fingerprint.method.rewriteEdgeSubjectUrl()
                EdgeThreadMenu191Fingerprint.method.preserveEdgeReporterTitle("Lo/isReady;", "k")
                patchLegacyNextThreadTitleMatch191()
            }
            "0.8.10.226 dev" -> {
                EdgeSubjectUrl226Fingerprint.method.rewriteEdgeSubjectUrl()
                EdgeThreadMenu226Fingerprint.method.preserveEdgeReporterTitle("Lo/MessageInflater;", "m")
            }
            "0.8.10.241" -> EdgeSubjectUrl241Fingerprint.method.rewriteEdgeSubjectUrl()
            "0.8.10.242 dev" -> EdgeSubjectUrl242Fingerprint.method.rewriteEdgeSubjectUrl()
            "0.8.10.243 dev" -> EdgeSubjectUrlFingerprint.method.rewriteEdgeSubjectUrl()
        }
        patchEdgeReporterHistory(packageMetadata.versionName)
        patchEdgeReporterTitleCopy(packageMetadata.versionName)
        patchWacchoiLongPressMenu(packageMetadata.versionName)
        patchHissiExternalIntentBoundaries()
        patchHttpsTransport()
    }
}

/**
 * The 226 About screen renders its large ChMate wordmark with an explicit
 * zero color. Its copyright label already asks the active Compose theme for
 * foreground text color; use the same source for the wordmark so 夜 stays legible.
 */
private fun BytecodePatchContext.patchAboutLogoThemeColor226() {
    val about = mutableClassDefBy("Lo/getAdShowTime;")
    val method = about.methods.single { candidate ->
        candidate.name == "d"
            && candidate.returnType == "Lo/Ff11;"
            && candidate.implementation?.instructions?.any { instruction ->
                (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f100048
            } == true
    }
    val calls = method.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (reference?.definingClass == "Lo/DtbSharedPreferences;"
            && reference.name == "d"
            && reference.returnType == "V"
        ) index else null
    }
    check(calls.size == 1) { "ChMate 226 About wordmark text call changed" }
    method.addInstructionsWithLabels(calls.single(), """
        invoke-static/range { p1 .. p1 }, Lo/setUrl;->c(Lo/getValue;)Lo/getLocation;
        move-result-object v2
        invoke-virtual { v2 }, Lo/getLocation;->P()J
        move-result-wide v2
    """.trimIndent())
}

/**
 * 226's paid-option sync screen contains a certificate-dependent arithmetic
 * decoy in S2MSettingActivity's generated dispatch method.  After Morphe
 * re-signing, its divisor becomes zero immediately before the first sync
 * listener is created, so the user is returned to Home instead of reaching
 * the key-registration screen.  Match the stable divide/allocation boundary
 * rather than generated callback class names.
 */
private fun BytecodePatchContext.patchPreIoS2mSettingActivityIntegrityTrap() {
    val activity = mutableClassDefBy(
        "Ljp/syoboi/chmate2/ui/s2msetting/S2MSettingActivity;",
    )
    val method = activity.methods.single { candidate ->
        candidate.name == "e"
            && candidate.returnType == "Ljava/lang/Object;"
            && candidate.parameters.map(CharSequence::toString) ==
            listOf("[Ljava/lang/Object;")
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate 226 S2MSettingActivity dispatch method has no implementation")
    // The integrity block ends with the calculated divisor immediately before
    // the first callback object is allocated.  Matching that stable instruction
    // boundary is more reliable than matching Yhp19/setTextClassifier, whose
    // generated names and constructor references are rewritten between APK
    // builds.  Keep a small window for dex writers that insert a move or nop.
    val divideIndex = instructions.indices.lastOrNull { index ->
        val opcode = instructions[index].opcode.name
        if (!opcode.startsWith("div-int")) {
            return@lastOrNull false
        }
        instructions.subList(index + 1, minOf(index + 4, instructions.size))
            .any { it.opcode.name == "new-instance" }
    } ?: error("ChMate 226 S2MSettingActivity sync divide trap was not found")

    val resultRegister = (instructions[divideIndex] as? ThreeRegisterInstruction)?.registerA
        ?: error("ChMate 226 S2MSettingActivity divide registers were not found")
    method.replaceInstruction(divideIndex, "const/4 v$resultRegister, 0x0")
}

/** Rewrites only the temporary PostData copy passed to the posting engine. */
private fun BytecodePatchContext.patchExternalEmojiPostCopy(version: String) {
    val postType = if (version == "0.8.10.226 dev")
        "Lo/setBorderWidth;" else "Ljp/syoboi/a2chMate/postdata/PostData;"
    val copyName = when (version) {
        "0.8.10.226 dev" -> "a"
        "0.8.10.242 dev" -> "d"
        else -> "e"
    }
    val editor = mutableClassDefBy("Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;")
    var patched = 0
    editor.methods.forEach { method ->
        val instructions = method.implementation?.instructions?.toList() ?: return@forEach
        val matches = instructions.indices.filter { index ->
            val reference = (instructions[index] as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@filter false
            reference.definingClass == postType && reference.name == copyName
                && reference.returnType == postType
                && reference.parameterTypes.firstOrNull() == postType
                && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
        }
        matches.asReversed().forEach { index ->
            val register = (instructions[index + 1] as OneRegisterInstruction).registerA
            method.addInstructionsWithLabels(index + 2, """
                invoke-static/range { v$register .. v$register }, $EXTENSION->prepareExternalEmojiPost(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$register
                check-cast v$register, $postType
            """.trimIndent())
            patched++
        }
    }
    check(patched == 1) { "Expected one external post-copy boundary for $version, found $patched" }
}

/** 191 passes the URL and body as the first and fifth n7a constructor values. */
private fun BytecodePatchContext.patchLegacyExternalEmojiPostBody() {
    val editor = mutableClassDefBy("Lo/p9ExternalSyntheticLambda6;")
    var patched = 0
    editor.methods.forEach { method ->
        val instructions = method.implementation?.instructions?.toList() ?: return@forEach
        val matches = instructions.indices.filter { index ->
            val reference = (instructions[index] as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@filter false
            reference.definingClass == "Lo/n7a;" && reference.name == "<init>"
                && reference.parameterTypes == List(9) { "Ljava/lang/String;" }
        }
        matches.asReversed().forEach { index ->
            val invocation = instructions[index] as? RegisterRangeInstruction
                ?: error("191 external post constructor did not use a register range")
            val bodyRegister = invocation.startRegister + 5
            // The source registers can exceed v15, so pass the existing adjacent
            // constructor arguments with invoke-static/range instead of the
            // four-bit non-range form.
            method.addInstructionsWithLabels(index, """
                invoke-static/range { v${invocation.startRegister + 1} .. v${invocation.startRegister + 9} }, $EXTENSION->prepareExternalEmojiBodyFromPostFields(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$bodyRegister
            """.trimIndent())
            patched++
        }
    }
    check(patched == 1) { "Expected one 191 external post constructor, found $patched" }
}

/**
 * ChMate 226 normally reuses the first cellular [android.net.Network] returned by
 * ConnectivityManager.getAllNetworks().  Android can leave a just-lost network in
 * that snapshot briefly; the SocketFactory created from it then fails with
 * "Binding socket to network N failed: EPERM".  A thread refresh happens to avoid
 * the race by rebuilding the client, which is why posting succeeds afterwards.
 *
 * Make the existing code take its requestNetwork() branch for every cellular post.
 * That branch waits for onAvailable and retains the NetworkCallback until the HTTP
 * operation finishes, so the selected network remains current and requested for
 * the lifetime of the post.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoCellularNetworkSelection() {
    val selector = mutableClassDefBy("Lo/accessisAvailablecp;").methods.single { method ->
        method.name == "d"
            && method.returnType == "Lo/zzdE;"
            && method.parameterTypes.map(CharSequence::toString) == listOf("Lo/zzdE;")
    }
    val instructions = selector.implementation?.instructions
        ?: error("ChMate 226 cellular network selector has no implementation")
    val snapshotCalls = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (reference.definingClass == "Landroid/net/ConnectivityManager;"
            && reference.name == "getAllNetworks"
            && reference.returnType == "[Landroid/net/Network;"
            && reference.parameterTypes.isEmpty()
            && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
        ) index else null
    }
    check(snapshotCalls.size == 1) {
        "Expected one ChMate 226 cellular network snapshot, found ${snapshotCalls.size}"
    }
    val resultRegister = (instructions[snapshotCalls.single() + 1] as OneRegisterInstruction).registerA
    val sizeRegister = selector.findFreeRegister(snapshotCalls.single() + 2)
    selector.addInstructionsWithLabels(
        snapshotCalls.single() + 2,
        """
            invoke-static {}, $EXTENSION->isCellularNetworkRefreshEnabled()Z
            move-result v$sizeRegister
            if-eqz v$sizeRegister, :haiagaru_keep_226_networks
            const/4 v$sizeRegister, 0x0
            new-array v$resultRegister, v$sizeRegister, [Landroid/net/Network;
            :haiagaru_keep_226_networks
            nop
        """.trimIndent(),
    )
}

/**
 * 191 has the same stale getAllNetworks() preference, but in the older
 * createDefault network builder. Keep the workaround runtime-toggleable so
 * disabling it restores the stock path without requiring a new patch.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyCellularNetworkSelection() {
    val selector = mutableClassDefBy("Lo/createDefault;").methods.single { method ->
        method.name == "b"
            && method.returnType == "Lo/r8lambdaz0gPFulMuhJ_LGn4qb5HDvuDsis;"
            && method.parameterTypes.map(CharSequence::toString) == listOf(
                "Lo/r8lambdaz0gPFulMuhJ_LGn4qb5HDvuDsis;"
            )
    }
    val instructions = selector.implementation?.instructions
        ?: error("ChMate 191 cellular network selector has no implementation")
    val snapshotCalls = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (reference.definingClass == "Landroid/net/ConnectivityManager;"
            && reference.name == "getAllNetworks"
            && reference.returnType == "[Landroid/net/Network;"
            && reference.parameterTypes.isEmpty()
            && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
        ) index else null
    }
    check(snapshotCalls.size == 1) {
        "Expected one ChMate 191 cellular network snapshot, found ${snapshotCalls.size}"
    }
    val snapshotIndex = snapshotCalls.single()
    val resultRegister = (instructions[snapshotIndex + 1] as OneRegisterInstruction).registerA
    val scratchRegister = selector.findFreeRegister(snapshotIndex + 2)
    selector.addInstructionsWithLabels(
        snapshotIndex + 2,
        """
            invoke-static {}, $EXTENSION->isCellularNetworkRefreshEnabled()Z
            move-result v$scratchRegister
            if-eqz v$scratchRegister, :haiagaru_keep_191_networks
            const/4 v$scratchRegister, 0x0
            new-array v$resultRegister, v$scratchRegister, [Landroid/net/Network;
            :haiagaru_keep_191_networks
            nop
        """.trimIndent(),
    )
}

/**
 * The selector fix above still leaves the returned Network.SocketFactory fixed
 * for the complete request. Refresh that factory at each socket creation too;
 * Android 16 may invalidate the selected cellular Network between those points.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoCellularSocketRefresh() {
    val factory = mutableClassDefBy(
        "Lo/accessisAvailablecp\$RemoteActionCompatParcelizer;"
    )
    val methods = factory.methods.filter { method ->
        method.name == "createSocket" && method.returnType == "Ljava/net/Socket;"
    }
    check(methods.size == 5) {
        "Expected five ChMate 226 cellular socket methods, found ${methods.size}"
    }
    methods.single { method ->
        method.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;", "I")
    }.addInstructionsWithLabels(0, """
        iget-object v0, p0, Lo/accessisAvailablecp${'$'}RemoteActionCompatParcelizer;->d:Ljavax/net/SocketFactory;
        invoke-static {v0, p1, p2}, $EXTENSION->createCellularSocket(
            Ljavax/net/SocketFactory;Ljava/lang/String;I)Ljava/net/Socket;
        move-result-object p1
        return-object p1
    """.trimIndent())
    methods.single { method ->
        method.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;", "I", "Ljava/net/InetAddress;", "I")
    }.addInstructionsWithLabels(0, """
        iget-object v0, p0, Lo/accessisAvailablecp${'$'}RemoteActionCompatParcelizer;->d:Ljavax/net/SocketFactory;
        invoke-static {v0, p1, p2, p3, p4}, $EXTENSION->createCellularSocket(
            Ljavax/net/SocketFactory;Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;
        move-result-object p1
        return-object p1
    """.trimIndent())
    methods.single { method ->
        method.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/net/InetAddress;", "I")
    }.addInstructionsWithLabels(0, """
        iget-object v0, p0, Lo/accessisAvailablecp${'$'}RemoteActionCompatParcelizer;->d:Ljavax/net/SocketFactory;
        invoke-static {v0, p1, p2}, $EXTENSION->createCellularSocket(
            Ljavax/net/SocketFactory;Ljava/net/InetAddress;I)Ljava/net/Socket;
        move-result-object p1
        return-object p1
    """.trimIndent())
    methods.single { method ->
        method.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/net/InetAddress;", "I", "Ljava/net/InetAddress;", "I")
    }.addInstructionsWithLabels(0, """
        iget-object v0, p0, Lo/accessisAvailablecp${'$'}RemoteActionCompatParcelizer;->d:Ljavax/net/SocketFactory;
        invoke-static {v0, p1, p2, p3, p4}, $EXTENSION->createCellularSocket(
            Ljavax/net/SocketFactory;Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;
        move-result-object p1
        return-object p1
    """.trimIndent())
    methods.single { method ->
        method.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/net/Socket;", "Ljava/lang/String;", "I", "Z")
    }.addInstructionsWithLabels(0, """
        iget-object p1, p0, Lo/accessisAvailablecp${'$'}RemoteActionCompatParcelizer;->c:Ljavax/net/ssl/SSLSocketFactory;
        iget-object v0, p0, Lo/accessisAvailablecp${'$'}RemoteActionCompatParcelizer;->d:Ljavax/net/SocketFactory;
        invoke-static {v0, p2, p3}, $EXTENSION->createCellularSocket(
            Ljavax/net/SocketFactory;Ljava/lang/String;I)Ljava/net/Socket;
        move-result-object v0
        invoke-virtual {p1, v0, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(
            Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
        move-result-object p1
        return-object p1
    """.trimIndent())
}

/** Refresh the five cellular socket overloads in 191's older wrapper. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyCellularSocketRefresh() {
    val factory = mutableClassDefBy("Lo/createDefault\$setContentView;")
    val methods = factory.methods.filter { method ->
        method.name == "createSocket" && method.returnType == "Ljava/net/Socket;"
    }
    check(methods.size == 5) {
        "Expected five ChMate 191 cellular socket methods, found ${methods.size}"
    }
    methods.single { it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I") }
        .addInstructionsWithLabels(0, """
            iget-object v0, p0, Lo/createDefault${'$'}setContentView;->e:Ljavax/net/SocketFactory;
            invoke-static {v0, p1, p2}, $EXTENSION->createCellularSocket(
                Ljavax/net/SocketFactory;Ljava/lang/String;I)Ljava/net/Socket;
            move-result-object p1
            return-object p1
        """.trimIndent())
    methods.single { it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I", "Ljava/net/InetAddress;", "I") }
        .addInstructionsWithLabels(0, """
            iget-object v0, p0, Lo/createDefault${'$'}setContentView;->e:Ljavax/net/SocketFactory;
            invoke-static {v0, p1, p2, p3, p4}, $EXTENSION->createCellularSocket(
                Ljavax/net/SocketFactory;Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;
            move-result-object p1
            return-object p1
        """.trimIndent())
    methods.single { it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/net/InetAddress;", "I") }
        .addInstructionsWithLabels(0, """
            iget-object v0, p0, Lo/createDefault${'$'}setContentView;->e:Ljavax/net/SocketFactory;
            invoke-static {v0, p1, p2}, $EXTENSION->createCellularSocket(
                Ljavax/net/SocketFactory;Ljava/net/InetAddress;I)Ljava/net/Socket;
            move-result-object p1
            return-object p1
        """.trimIndent())
    methods.single { it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/net/InetAddress;", "I", "Ljava/net/InetAddress;", "I") }
        .addInstructionsWithLabels(0, """
            iget-object v0, p0, Lo/createDefault${'$'}setContentView;->e:Ljavax/net/SocketFactory;
            invoke-static {v0, p1, p2, p3, p4}, $EXTENSION->createCellularSocket(
                Ljavax/net/SocketFactory;Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;
            move-result-object p1
            return-object p1
        """.trimIndent())
    methods.single { it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/net/Socket;", "Ljava/lang/String;", "I", "Z") }
        .addInstructionsWithLabels(0, """
            iget-object p1, p0, Lo/createDefault${'$'}setContentView;->a:Ljavax/net/ssl/SSLSocketFactory;
            iget-object v0, p0, Lo/createDefault${'$'}setContentView;->e:Ljavax/net/SocketFactory;
            invoke-static {v0, p2, p3}, $EXTENSION->createCellularSocket(
                Ljavax/net/SocketFactory;Ljava/lang/String;I)Ljava/net/Socket;
            move-result-object v0
            invoke-virtual {p1, v0, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(
                Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
            move-result-object p1
            return-object p1
        """.trimIndent())
}

/** Rewrite at expansion time so existing user menu settings are repaired as well. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoHissiMenu(
    owner: String = "Lo/PublicSuffixDatabaseCompanion;",
    methodName: String = "a",
    responseType: String = "Lo/BouncyCastleSocketAdapterCompanion;",
    expansionStateType: String = "Lo/PublicSuffixDatabaseCompanion\$IconCompatParcelizer;",
) {
    mutableClassDefBy(owner).methods.single { method ->
        method.name == methodName
            && method.returnType == "Ljava/lang/String;"
            && method.parameters.map(CharSequence::toString) == listOf(
                "Ljava/lang/String;",
                responseType,
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
                "Ljava/lang/String;",
                expansionStateType,
            )
    }.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, Lapp/morphe/extension/chmate/HissiMenuCompatibility;->rewriteTemplate(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
        """,
    )
}

/** Install the Wacchoi item alongside ChMate's custom response-menu actions. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchWacchoiLongPressMenu(
    versionName: String,
) {
    if (versionName == "0.8.10.242 dev") {
        val owner = "Ljp/syoboi/a2chMate/ui/reslist/ResListFragmentViewModel;"
        val method = mutableClassDefBy(owner).methods.single { method ->
            method.returnType == "V" && method.parameters.map(CharSequence::toString) == listOf(
                owner, "Lo/isDataValid;", "Ljp/syoboi/a2chMate/client/BoardID;", "Ljava/lang/String;",
            ) && method.implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "NGName"
            } == true
        }
        mutableClassDefBy(owner).findMutableMethodOf(method).addInstructionsWithLabels(0, """
            invoke-static/range {p0 .. p3}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->appendNameSheet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
        """.trimIndent())
        println("Wacchoi name-sheet hook: ${method.name}")
        return
    }
    if (versionName == "0.8.10.191 dev") {
        patchLegacyWacchoiLongPressMenu()
        return
    }

    val owner = "Ljp/syoboi/a2chMate/fragment/ResMenuDialogFragment;"
    val candidates = mutableClassDefBy(owner).methods.filter { method ->
        method.parameters.isEmpty()
            && method.returnType != "V"
            && method.implementation?.instructions?.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.name == "findItem"
                    && reference.parameterTypes.map(CharSequence::toString) == listOf("I")
            } == true
            && method.implementation?.instructions?.any { instruction ->
                (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 70
            } == true
            && method.implementation?.instructions?.any { instruction ->
                val literal = (instruction as? NarrowLiteralInstruction)?.narrowLiteral
                literal == 74 || literal == 75
            } == true
            && method.implementation?.instructions?.any { it.opcode == Opcode.RETURN_OBJECT } == true
    }
    check(candidates.size == 1) {
        "Expected one ${versionName} response context-menu builder, found ${candidates.size}"
    }
    val builder = candidates.single()
    val builderInstructions = builder.implementation!!.instructions.toList()
    val returns = builderInstructions.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode == Opcode.RETURN_OBJECT) {
            index to (instruction as OneRegisterInstruction).registerA
        } else null
    }.asReversed()
    val mutableBuilder = mutableClassDefBy(owner).findMutableMethodOf(builder)
    returns.forEach { (index, register) ->
        mutableBuilder.addInstructionsWithLabels(index, """
            invoke-static/range {v$register .. v$register}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->appendForCurrentDialog(Ljava/lang/Object;)V
        """.trimIndent())
    }
    mutableBuilder.addInstructionsWithLabels(0, """
        invoke-static/range {p0 .. p0}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->captureDialog(Ljava/lang/Object;)V
    """.trimIndent())

    var dispatcherCount = 0
    classDefForEach { classDef ->
        classDef.methods.forEach methodLoop@ { method ->
            if (method.returnType != "Z") return@methodLoop
            val instructions = method.implementation?.instructions?.toList()
                ?: return@methodLoop
            if (instructions.none { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.definingClass == "Landroid/view/MenuItem;"
                        && reference.name == "getItemId"
                        && reference.returnType == "I"
                        && reference.parameterTypes.isEmpty()
                }) return@methodLoop

            val upperBounds = instructions.mapIndexedNotNull { index, instruction ->
                val literal = (instruction as? NarrowLiteralInstruction)?.narrowLiteral
                if (literal != 74 && literal != 75) return@mapIndexedNotNull null
                val prior = instructions.subList(maxOf(0, index - 12), index)
                if (prior.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == 70 }) {
                    index to literal
                } else null
            }
            if (upperBounds.isEmpty()) return@methodLoop
            val mutableMethod = mutableClassDefBy(classDef).findMutableMethodOf(method)
            upperBounds.forEach { (index, literal) ->
                val register = (instructions[index] as OneRegisterInstruction).registerA
                val expandedBoundary = if (literal == 74) 75 else 76
                mutableMethod.replaceInstruction(index,
                    "const/16 v$register, 0x${expandedBoundary.toString(16)}")
                dispatcherCount++
            }
        }
    }
    check(dispatcherCount == 1) {
        "Expected one ${versionName} custom response-menu dispatcher, patched $dispatcherCount"
    }
    println("Wacchoi response-menu hook: builder=${builder.name}, dispatcher=$dispatcherCount")
}

/**
 * ChMate 191 builds the response popup in pa.Wx_. Inject immediately before
 * the selected response's menu is measured; its normal click handler already
 * dispatches MenuItems carrying an Intent.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyWacchoiLongPressMenu() {
    val owner = "Lo/pa;"
    // Name/SLIP long presses use c(Response, boolean, boolean), independently
    // of the response-body popup in Wx_. Preserve the exact selected response.
    val nameMenu = mutableClassDefBy(owner).methods.single {
        it.name == "c" && it.returnType == "V" &&
            it.parameters.map(CharSequence::toString) == listOf(
                "Lo/processAdDisplayErrorPostbackForUserError;", "Z", "Z",
            )
    }
    val nameAnchors = nameMenu.implementation!!.instructions.withIndex().filter {
        val reference = (it.value as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == "Lo/setExtraParameter;" && reference.name == "Td_"
    }
    check(nameAnchors.size == 1) { "191 name/SLIP menu anchor changed" }
    val nameAnchor = nameAnchors.single()
    val nameMenuRegister = (nameAnchor.value as FiveRegisterInstruction).registerC
    nameMenu.addInstructionsWithLabels(nameAnchor.index, """
        invoke-static {p0, v$nameMenuRegister, p1}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->appendLegacyForResponse(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    """.trimIndent())
    val callback = mutableClassDefBy(owner).methods.single { method ->
        method.name == "Wx_"
            && method.returnType == "V"
            && method.parameters.map(CharSequence::toString) == listOf(
                "Landroid/widget/ListView;", "Landroid/view/View;", "I", "J",
            )
    }
    val instructions = callback.implementation?.instructions?.toList()
        ?: error("ChMate 191 response long-press method has no implementation")
    val menuSizes = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (reference?.definingClass == "Lo/m6fExternalSyntheticLambda0;"
            && reference.name == "size" && reference.returnType == "I"
        ) index to (instruction as? FiveRegisterInstruction)?.registerC else null
    }
    check(menuSizes.size == 1 && menuSizes.single().second != null) {
        "ChMate 191 selected-response menu anchor changed"
    }
    val (menuIndex, menuRegister) = menuSizes.single()
    val responseCalls = instructions.take(menuIndex).mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (reference?.definingClass == owner && reference.name == "c"
            && reference.parameterTypes.map(CharSequence::toString) ==
                listOf("Lo/processAdDisplayErrorPostbackForUserError;")
            && reference.returnType == "Ljava/lang/String;"
        ) index to (instruction as? FiveRegisterInstruction)?.registerD else null
    }
    check(responseCalls.size == 1 && responseCalls.single().second != null) {
        "ChMate 191 selected response register changed"
    }
    val responseRegister = responseCalls.single().second!!
    check(menuRegister!! < 16 && responseRegister < 16) {
        "ChMate 191 response menu registers cannot use invoke-static"
    }
    mutableClassDefBy(owner).findMutableMethodOf(callback).addInstructionsWithLabels(
        menuIndex,
        """
            invoke-static {p0, v$menuRegister, v$responseRegister}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->appendLegacyForResponse(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
        """.trimIndent(),
    )
    println("Wacchoi response-menu hook: selected ChMate 191 response")
}

/**
 * The response long-press route may skip the menu-template expander. Intercept
 * the external activity launch itself and make only Hissi checker intents
 * explicit to this patched app. This also avoids an Android resolver chooser
 * when several ChMate test builds are installed.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchHissiExternalIntentBoundaries() {
    var patched = 0
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")
            || (!classDef.type.startsWith("Ljp/syoboi/")
                && !classDef.type.startsWith("Lo/"))) return@classDefForEach
        val mutableClass = mutableClassDefBy(classDef)
        classDef.methods.forEach methodLoop@ { method ->
            val instructions = method.implementation?.instructions?.toList()
                ?: return@methodLoop
            instructions.mapIndexedNotNull { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                    as? MethodReference ?: return@mapIndexedNotNull null
                if (reference.name != "startActivity"
                    || reference.returnType != "V"
                    || reference.parameterTypes.map(CharSequence::toString) !=
                        listOf("Landroid/content/Intent;")
                    || reference.definingClass !in setOf(
                        "Landroid/content/Context;", "Landroid/app/Activity;",
                        "Landroidx/fragment/app/Fragment;",
                    )
                ) return@mapIndexedNotNull null
                val register = when (instruction) {
                    is FiveRegisterInstruction -> instruction.registerD
                    is RegisterRangeInstruction -> {
                        if (instruction.registerCount != 2) return@mapIndexedNotNull null
                        instruction.startRegister + 1
                    }
                    else -> return@mapIndexedNotNull null
                }
                index to register
            }.asReversed().forEach { (index, register) ->
                mutableClass.findMutableMethodOf(method).addInstructionsWithLabels(
                    index,
                    "invoke-static/range {v$register .. v$register}, " +
                        "Lapp/morphe/extension/chmate/HissiMenuCompatibility;->prepareExternalIntent(" +
                        "Landroid/content/Intent;)V",
                )
                patched++
            }
        }
    }
    check(patched > 0) { "ChMate external activity launch boundary was not found" }
    println("Hissi external intent boundaries: $patched")
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

private fun app.morphe.patcher.patch.BytecodePatchContext.patchModernTalkDatLoading242() {
    val loader = mutableClassDefBy("Lo/getHostAppName;").methods.single { method ->
        method.name == "e" && method.returnType == "Lo/getBackImage\$read;"
            && method.parameters.map(CharSequence::toString) == listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;", "Z", "Lo/onTooManyRedirects;"
            )
    }
    val instructions = loader.implementation!!.instructions.toList()
    val cacheCall = instructions.indexOfFirst {
        val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
        reference?.returnType == "Ljava/io/File;"
            && reference.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljp/syoboi/a2chMate/client/BBSUrlInfo;")
    }.takeIf { it >= 0 } ?: error("ChMate 242 thread cache builder was not found")
    val urlRegister = (instructions[cacheCall] as FiveRegisterInstruction).registerD
    val cacheRegister = (instructions[cacheCall + 1] as OneRegisterInstruction).registerA
    val scratch = loader.findFreeRegister(cacheCall + 2)
    loader.addInstructionsWithLabels(cacheCall + 2, """
        invoke-virtual {v$urlRegister}, Ljp/syoboi/a2chMate/client/BBSUrlInfo;->A()Ljava/lang/String;
        move-result-object v$scratch
        invoke-static {v$scratch, v$cacheRegister}, $EXTENSION->loadLiveTalkDat(Ljava/lang/String;Ljava/io/File;)Z
        move-result v$scratch
        if-eqz v$scratch, :haiagaru_242_normal_download
        new-instance v$scratch, Lo/getBackImage${'$'}read;
        invoke-direct {v$scratch, v$cacheRegister, v$urlRegister}, Lo/getBackImage${'$'}read;-><init>(Ljava/io/File;Ljp/syoboi/a2chMate/client/BBSUrlInfo;)V
        return-object v$scratch
        :haiagaru_242_normal_download
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
            invoke-static {v$urlInfoRegister}, $EXTENSION->normalizeLegacyTalkTransport(Ljava/lang/Object;)V
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
/** 243's generated token builder keeps its integrity cache in o.setExtras. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchModernTalkPostIntegrity(
    networkOwner: String = "Lo/zzaat;",
) {
    val networkClass = mutableClassDefBy(networkOwner)
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
        "Expected one ChMate 243 Talk posting invocation, found ${candidates.size}"
    }
    val (method, index) = candidates.single()
    when (val invocation = method.implementation!!.instructions[index]) {
        is FiveRegisterInstruction -> method.replaceInstruction(
            index,
            "invoke-static {v${invocation.registerC}, v${invocation.registerD}, " +
                "v${invocation.registerE}}, Lapp/morphe/extension/chmate/TalkPostCompatibility;->invoke(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        is RegisterRangeInstruction -> method.replaceInstruction(
            index,
            "invoke-static/range {v${invocation.startRegister} .. " +
                "v${invocation.startRegister + 2}}, " +
                "Lapp/morphe/extension/chmate/TalkPostCompatibility;->invoke(Ljava/lang/reflect/Method;" +
                "Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;",
        )
        else -> error("ChMate 243 Talk posting invocation registers were not found")
    }
}

/**
 * Tablet mode adds a 50dp Compose Spacer above the response-filter buttons to reserve
 * a banner slot. The banner View itself is already hidden elsewhere, so suppress the
 * captured boolean that emits only this spacer while retaining the filter controls.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchTabletThreadHeaderAdSpace(
    version: String,
) {
    val owner = when (version) {
        // 191 uses top padding on its legacy row; hideLegacyThreadListAd removes it.
        "0.8.10.191 dev" -> return
        "0.8.10.226 dev" -> "Lo/writeWindowUpdateLaterokhttp;"
        "0.8.10.241" -> "Lo/getRewardItem;"
        "0.8.10.242 dev" -> "Lo/isAtLeastS;"
        "0.8.10.243 dev" -> "Lo/zzdhn;"
        else -> return
    }
    val mutableClass = mutableClassDefBy(owner)
    mutableClass.fields.single { field ->
        field.type == "Z" && field.accessFlags and 8 == 0
    }
    val method = mutableClass.methods.single { candidate ->
        candidate.name == "invoke"
            && candidate.returnType == "Ljava/lang/Object;"
            && candidate.parameters.map(CharSequence::toString) == listOf(
                "Ljava/lang/Object;",
                "Ljava/lang/Object;",
            )
    }
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->suppressTabletThreadHeaderAdSpace(Ljava/lang/Object;)V
        """.trimIndent(),
    )
}

/** Preserve ChMate's default layout unless the user enables top-aligned short threads. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchShortThreadTopAlignment(
    version: String,
) {
    val layout = when (version) {
        "0.8.10.241" -> "b"
        "0.8.10.242 dev", "0.8.10.243 dev" -> "c"
        else -> return
    }
    val method = mutableClassDefBy("Landroidx/recyclerview/widget/LinearLayoutManager;")
        .methods.single { candidate ->
            candidate.name == layout && candidate.returnType == "V"
                && candidate.parameters.size == 2
                && candidate.parameters.all { it.type.startsWith("Landroidx/recyclerview/widget/RecyclerView${'$'}") }
        }
    method.implementation!!.instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed()
        .forEach { index ->
            method.addInstructionsWithLabels(index, """
                invoke-static/range {p0 .. p0}, $EXTENSION->alignShortThreadAfterLayout(Ljava/lang/Object;)V
            """.trimIndent())
        }
}

/**
 * Normalizes the result of 243's certificate-derived helper before the generated Talk
 * token builder consumes it. The generated wrapper itself is loaded from an in-memory
 * DEX, while this helper and SafeParcelableReserved$4 are regular APK classes.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchModernTalkIntegrityPrimitives() {
    val integrityMethod = mutableClassDefBy("Lo/zzeyn${'$'}read;").methods.single { method ->
        method.name == "d"
            && method.returnType == "[Ljava/lang/Object;"
            && method.parameters.map(CharSequence::toString) == listOf(
                "Landroid/content/Context;",
                "[Ljava/lang/String;",
                "I",
                "I",
                "I",
            )
    }
    val returnSites = integrityMethod.implementation!!.instructions
        .mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT) {
                index to (instruction as OneRegisterInstruction).registerA
            } else {
                null
            }
        }
    check(returnSites.isNotEmpty()) { "ChMate 243 integrity helper return was not found" }
    returnSites.asReversed().forEach { (index, register) ->
        integrityMethod.addInstructionsWithLabels(
            index,
            """
                invoke-static {v$register}, Lapp/morphe/extension/chmate/TalkPostCompatibility;->normalizeIntegrityState([Ljava/lang/Object;)[Ljava/lang/Object;
                move-result-object v$register
            """.trimIndent(),
        )
    }
}


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

    val sessionMethod = mutableClassDefBy("Lo/getSelectedProtocol;").methods.single { candidate ->
        candidate.name == "d"
            && candidate.returnType == "Ljava/lang/String;"
            && candidate.parameterTypes.map(CharSequence::toString) ==
                listOf("Lo/OpenJSSEPlatformCompanion;")
    }
    val sessionInstructions = sessionMethod.implementation?.instructions
        ?: error("ChMate 226 Talk session method has no implementation")
    val sessionInvocations = sessionInstructions.indices.filter { sessionIndex ->
        val reference = (sessionInstructions[sessionIndex] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@filter false
        if (reference.definingClass != "Ljava/lang/reflect/Method;"
            || reference.name != "invoke"
            || reference.returnType != "Ljava/lang/Object;"
            || reference.parameterTypes.map(CharSequence::toString) != listOf(
                "Ljava/lang/Object;", "[Ljava/lang/Object;"
            )
            || sessionInstructions.getOrNull(sessionIndex + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT
        ) return@filter false
        val cast = sessionInstructions.getOrNull(sessionIndex + 2) as? ReferenceInstruction
            ?: return@filter false
        cast.opcode == Opcode.CHECK_CAST && cast.reference.toString() == "Ljava/lang/String;"
    }
    check(sessionInvocations.size == 1) {
        "Expected one ChMate 226 Talk session invocation, found ${sessionInvocations.size}"
    }
    val sessionIndex = sessionInvocations.single()
    when (val invocation = sessionInstructions[sessionIndex]) {
        is FiveRegisterInstruction -> sessionMethod.replaceInstruction(
            sessionIndex,
            "invoke-static {v${invocation.registerC}, v${invocation.registerD}, " +
                "v${invocation.registerE}}, $EXTENSION->invokePreIoTalkAuthenticator(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        is RegisterRangeInstruction -> sessionMethod.replaceInstruction(
            sessionIndex,
            "invoke-static/range {v${invocation.startRegister} .. " +
                "v${invocation.startRegister + 2}}, " +
                "$EXTENSION->invokePreIoTalkAuthenticator(Ljava/lang/reflect/Method;" +
                "Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;",
        )
        else -> error("ChMate 226 Talk session invocation registers were not found")
    }

    // Unlike 191, 226 resolves its generated write key before the reflected
    // poster is invoked. Removing talk_write_key at method entry makes that
    // resolver throw NullPointerException before the integrity wrapper can run.
    // Keep 226's persisted session intact and repair only o.head at the exact
    // reflected invocation boundary, which is the proven 1.3.0 behavior.
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
    // The URL classifier is not the only constructor used by 191.  Normalize
    // the transport immediately before the downloader reads BBSUrlInfo so a
    // Talk request cannot fall through to the re-signed type-4 authenticator.
    // p1 lives above v15 in this large method. The non-range invoke cannot
    // encode it, so keep the existing parameter register via invoke-range.
    method.addInstruction(
        0,
        "invoke-static/range {p1 .. p1}, $EXTENSION->normalizeLegacyTalkTransport(Ljava/lang/Object;)V",
    )
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
    // The generated client may refresh its static integrity cache after construction.
    // Route the reflected authenticator through a one-shot recovery wrapper so that
    // the cache is normalized at the actual invocation boundary as well.
    val invokes = method.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (reference.definingClass == "Ljava/lang/reflect/Method;"
            && reference.name == "invoke"
            && reference.returnType == "Ljava/lang/Object;"
            && reference.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljava/lang/Object;", "[Ljava/lang/Object;"
            )
        ) index else null
    }
    check(invokes.isNotEmpty()) { "ChMate legacy Talk authenticator invocation was not found" }
    invokes.asReversed().forEach { index ->
        when (val invocation = method.implementation!!.instructions[index]) {
            is FiveRegisterInstruction -> method.replaceInstruction(
                index,
                "invoke-static {v${invocation.registerC}, v${invocation.registerD}, " +
                    "v${invocation.registerE}}, $EXTENSION->invokeLegacyTalkAuthenticator(" +
                    "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                    "Ljava/lang/Object;",
            )
            is RegisterRangeInstruction -> method.replaceInstruction(
                index,
                "invoke-static/range {v${invocation.startRegister} .. " +
                    "v${invocation.startRegister + 2}}, $EXTENSION->invokeLegacyTalkAuthenticator(" +
                    "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                    "Ljava/lang/Object;",
            )
            else -> error("ChMate legacy Talk authenticator registers were not found")
        }
    }

    val postMethod = mutableClassDefBy("Lo/getLabel;").methods.single { candidate ->
        candidate.name == "b"
            && candidate.returnType == "Lo/getMediatedNetwork;"
            && candidate.parameterTypes.map(CharSequence::toString) == listOf(
                "Lo/r8lambdaz0gPFulMuhJ_LGn4qb5HDvuDsis;",
                "Lo/getCredentials\$write;",
                "Lo/getLabel\$read;",
            )
    }
    postMethod.addInstruction(
        0,
        "invoke-static {}, $EXTENSION->prepareLegacyTalkPostSession()V",
    )

    // The 401 confirmation flow persists x-write-key before asking the user.
    // Cancelling drops the matching one-shot extend token, so discard only the
    // renewable Talk write session before the original error path continues.
    val postInstructions = postMethod.implementation?.instructions?.toList()
        ?: error("ChMate legacy Talk post method has no implementation")
    val confirmationCallbacks = postInstructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (reference.definingClass == "Lo/getLabel\$read;"
            && reference.name == "e"
            && reference.returnType == "Z"
            && reference.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
            && postInstructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT
        ) index else null
    }
    check(confirmationCallbacks.size == 1) {
        "Expected one ChMate legacy Talk confirmation callback, found ${confirmationCallbacks.size}"
    }
    val callbackIndex = confirmationCallbacks.single()
    val acceptedRegister = (postInstructions[callbackIndex + 1] as OneRegisterInstruction).registerA
    postMethod.addInstructionsWithLabels(
        callbackIndex + 2,
        """
            if-nez v$acceptedRegister, :haiagaru_talk_confirmation_accepted
            invoke-static {}, $EXTENSION->resetLegacyTalkPostSession()V
            :haiagaru_talk_confirmation_accepted
            nop
        """.trimIndent(),
    )
}

/** Bypass 241's generated signature gate by publishing the Talk JSON as DAT. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchIoTalkDatLoading() {
    val networkClass = mutableClassDefBy("Lo/VLj;")
    val method = networkClass.methods.singleOrNull { candidate ->
        candidate.name == "e"
            && candidate.returnType == "Lo/VLj\$RemoteActionCompatParcelizer;"
            && candidate.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
                "Z",
                "Lo/GNk17;",
            )
    } ?: error("ChMate 241 Talk DAT request method was not found")
    val instructions = method.implementation?.instructions
        ?: error("ChMate 241 Talk DAT request method has no implementation")
    val candidates = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (reference.returnType != "Ljava/io/File;"
            || reference.parameterTypes.map(CharSequence::toString) != listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
            )
            || instructions.getOrNull(index + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT
        ) return@mapIndexedNotNull null
        index
    }
    check(candidates.size == 1) {
        "Expected one ChMate 241 Talk cache invocation, found ${candidates.size}"
    }
    val cacheCall = candidates.single()
    val invocation = instructions[cacheCall] as FiveRegisterInstruction
    val urlInfoRegister = invocation.registerD
    val cacheFileRegister = (instructions[cacheCall + 1] as OneRegisterInstruction).registerA
    val scratchRegister = method.findFreeRegister(cacheCall + 2)
    method.addInstructionsWithLabels(
        cacheCall + 2,
        """
            invoke-virtual {v$urlInfoRegister}, Ljp/syoboi/a2chMate/client/BBSUrlInfo;->D()Ljava/lang/String;
            move-result-object v$scratchRegister
            invoke-static {v$scratchRegister, v$cacheFileRegister}, $EXTENSION->loadLiveTalkDat(Ljava/lang/String;Ljava/io/File;)Z
            move-result v$scratchRegister
            if-eqz v$scratchRegister, :haiagaru_241_normal_download
            new-instance v$scratchRegister, Lo/VLj${'$'}RemoteActionCompatParcelizer;
            invoke-direct {v$scratchRegister, v$cacheFileRegister, v$urlInfoRegister}, Lo/VLj${'$'}RemoteActionCompatParcelizer;-><init>(Ljava/io/File;Ljp/syoboi/a2chMate/client/BBSUrlInfo;)V
            return-object v$scratchRegister
            :haiagaru_241_normal_download
            nop
        """.trimIndent(),
    )
}

/**
 * 241 computes the start of an UPLIFT success-cast diagnostic through an
 * obfuscated, signature-dependent division. On repackaged APKs it can become
 * -1 (or divide by zero) before the successful login result is stored.
 * Keep the login result handling intact and restore the diagnostic's literal
 * prefix length. The string starts with "2," and should be sliced after it.
 */
private fun BytecodePatchContext.patchIoUpliftLoginCastMessage() {
    val message = "2,null cannot be cast to non-null type " +
        "jp.syoboi.a2chMate.bbs.a5ch.UpliftClient.LoginResult.Success"
    val owner = mutableClassDefBy("Lo/VLj;")
    val candidates = owner.methods.mapNotNull { method ->
        val instructions = method.implementation?.instructions?.toList() ?: return@mapNotNull null
        val messageIndex = instructions.indexOfFirst { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == message
        }
        if (messageIndex < 0) return@mapNotNull null
        val substringIndex = (messageIndex + 1 until minOf(messageIndex + 5, instructions.size))
            .firstOrNull { index ->
                val reference = (instructions[index] as? ReferenceInstruction)?.reference
                    as? MethodReference
                reference?.definingClass == "Ljava/lang/String;"
                    && reference.name == "substring"
                    && reference.parameterTypes.map(CharSequence::toString) == listOf("I")
            } ?: return@mapNotNull null
        method to substringIndex
    }
    check(candidates.size == 1) { "Expected one ChMate 241 UPLIFT cast message, found ${candidates.size}" }
    val (method, substringIndex) = candidates.single()
    val indexRegister = when (val call = method.implementation!!.instructions[substringIndex]) {
        is FiveRegisterInstruction -> call.registerD
        is RegisterRangeInstruction -> call.startRegister + 1
        else -> error("ChMate 241 UPLIFT substring index register changed")
    }
    method.addInstructionsWithLabels(substringIndex, "const/4 v$indexRegister, 0x2")
}

/** 241's cached UPLIFT token expiry adds a signature-derived quotient to a
 * roughly one-day TTL. The divisor can be zero after repackaging; the quotient
 * is not needed to decide whether the cached token is still valid. */
private fun BytecodePatchContext.patchIoUpliftTokenExpiryArithmetic() =
    patchUpliftTokenExpiryArithmetic("Lo/VLj;", "c", "Lo/VLj\$ComponentActivity;", 1284195)

private fun BytecodePatchContext.patchUpliftTokenExpiryArithmetic(
    ownerType: String, methodName: String, parameterType: String, numerator: Int,
) {
    val method = mutableClassDefBy(ownerType).methods.single { candidate ->
        candidate.name == methodName && candidate.returnType == "Ljava/lang/String;" &&
            candidate.parameters.map(CharSequence::toString) == listOf(parameterType)
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("UPLIFT token expiry method missing: $ownerType.$methodName")
    val expiryConstant = instructions.indices.singleOrNull { index ->
        (instructions[index] as? NarrowLiteralInstruction)?.narrowLiteral == numerator
    } ?: error("UPLIFT token expiry constant missing: $ownerType.$methodName")
    val divides = (expiryConstant + 1 until minOf(expiryConstant + 12, instructions.size))
        .filter { index -> instructions[index].opcode == Opcode.DIV_INT ||
            instructions[index].opcode == Opcode.DIV_INT_2ADDR }
    check(divides.size == 1) {
        "UPLIFT token expiry divide changed in $ownerType.$methodName: ${divides.size} " +
            instructions.subList(expiryConstant, minOf(expiryConstant + 12, instructions.size))
                .map { it.opcode }
    }
    val index = divides.single()
    val result = when (val divide = instructions[index]) {
        is ThreeRegisterInstruction -> divide.registerA
        is TwoRegisterInstruction -> divide.registerA
        else -> error("UPLIFT token expiry destination changed in $ownerType.$methodName")
    }
    method.replaceInstruction(index, "const/4 v$result, 0x0")
}

/** 241 uses the same generated Talk authenticator behind a differently obfuscated caller. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchIoTalkPostIntegrity() {
    patchIoTalkAuthentication()
    val networkClass = mutableClassDefBy("Lo/VLj;")
    val candidates = networkClass.methods.flatMap { method ->
        val instructions = method.implementation?.instructions ?: return@flatMap emptyList()
        instructions.mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@mapIndexedNotNull null
            if (reference.definingClass != "Ljava/lang/reflect/Method;"
                || reference.name != "invoke"
                || reference.returnType != "Ljava/lang/Object;"
                // The first reflection call reads a String used as a request field.
                // The generated Talk poster is the subsequent void-style invocation.
                || instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
                || reference.parameterTypes.map(CharSequence::toString) != listOf(
                    "Ljava/lang/Object;",
                    "[Ljava/lang/Object;",
                )
            ) return@mapIndexedNotNull null
            val isTalkPost = instructions.subList(maxOf(0, index - 260), index).any { previous ->
                ((previous as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                    "https://api.talk-platform.com/v1/bbs.cgi"
            }
            if (isTalkPost) method to index else null
        }
    }
    check(candidates.size == 1) {
        "Expected one ChMate 241 Talk posting invocation, found ${candidates.size}"
    }
    val (method, index) = candidates.single()
    when (val invocation = method.implementation!!.instructions[index]) {
        is FiveRegisterInstruction -> method.replaceInstruction(
            index,
            "invoke-static {v${invocation.registerC}, v${invocation.registerD}, " +
                "v${invocation.registerE}}, $EXTENSION->invokeIoTalkPoster(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        is RegisterRangeInstruction -> method.replaceInstruction(
            index,
            "invoke-static/range {v${invocation.startRegister} .. " +
                "v${invocation.startRegister + 2}}, $EXTENSION->invokeIoTalkPoster(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        else -> error("ChMate 241 Talk posting invocation registers were not found")
    }

    // 241 resolves the renewable Talk key through another generated method
    // immediately before the poster. The reflected call returns a small holder
    // whose `c` field contains the key, rather than returning String directly.
    // Protect that invocation as well; otherwise stale/signature-derived state
    // can fail before the already-wrapped header builder is reached.
    val currentInstructions = method.implementation!!.instructions
    val keyInvocations = currentInstructions.indices.filter { keyIndex ->
        if (keyIndex >= index) return@filter false
        val reference = (currentInstructions[keyIndex] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@filter false
        if (reference.definingClass != "Ljava/lang/reflect/Method;"
            || reference.name != "invoke"
            || reference.returnType != "Ljava/lang/Object;"
            || reference.parameterTypes.map(CharSequence::toString) != listOf(
                "Ljava/lang/Object;", "[Ljava/lang/Object;"
            )
            || currentInstructions.getOrNull(keyIndex + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT
        ) return@filter false
        val cast = currentInstructions.getOrNull(keyIndex + 2) as? ReferenceInstruction
            ?: return@filter false
        cast.opcode == Opcode.CHECK_CAST
            && cast.reference.toString() == "Lo/setTimeUpdate\$RemoteActionCompatParcelizer;"
    }
    check(keyInvocations.size == 1) {
        "Expected one ChMate 241 Talk key invocation, found ${keyInvocations.size}"
    }
    val keyIndex = keyInvocations.single()
    when (val invocation = currentInstructions[keyIndex]) {
        is FiveRegisterInstruction -> method.replaceInstruction(
            keyIndex,
            "invoke-static {v${invocation.registerC}, v${invocation.registerD}, " +
                "v${invocation.registerE}}, $EXTENSION->invokeIoTalkPoster(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        is RegisterRangeInstruction -> method.replaceInstruction(
            keyIndex,
            "invoke-static/range {v${invocation.startRegister} .. " +
                "v${invocation.startRegister + 2}}, $EXTENSION->invokeIoTalkPoster(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        else -> error("ChMate 241 Talk key invocation registers were not found")
    }
}

/** Replaces 241's generated Talk login digest invocation with the stable extension path. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchIoTalkAuthentication() {
    val authClass = mutableClassDefBy("Lo/updateRenderInfoForVideo;")
    val authMethod = authClass.methods.singleOrNull { method ->
        method.name == "d"
            && method.parameterTypes.map(CharSequence::toString) == listOf("Lo/VLj;")
            && method.returnType == "Ljava/lang/String;"
    } ?: error("ChMate 241 Talk authentication method was not found")
    val instructions = authMethod.implementation?.instructions
        ?: error("ChMate 241 Talk authentication implementation was not found")
    val candidates = instructions.indices.filter { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@filter false
        if (reference.definingClass != "Ljava/lang/reflect/Method;"
            || reference.name != "invoke"
            || reference.returnType != "Ljava/lang/Object;"
            || reference.parameterTypes.map(CharSequence::toString) != listOf(
                "Ljava/lang/Object;", "[Ljava/lang/Object;"
            )
        ) return@filter false
        instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
            && (instructions.getOrNull(index + 2) as? ReferenceInstruction)
                ?.reference?.toString() == "Ljava/lang/String;"
    }
    check(candidates.size == 1) {
        "Expected one ChMate 241 Talk authentication invocation, found ${candidates.size}"
    }
    val index = candidates.single()
    when (val invocation = instructions[index]) {
        is FiveRegisterInstruction -> authMethod.replaceInstruction(
            index,
            "invoke-static {v${invocation.registerC}, v${invocation.registerD}, " +
                "v${invocation.registerE}}, $EXTENSION->invokeIoTalkAuth(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        is RegisterRangeInstruction -> authMethod.replaceInstruction(
            index,
            "invoke-static/range {v${invocation.startRegister} .. " +
                "v${invocation.startRegister + 2}}, $EXTENSION->invokeIoTalkAuth(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        else -> error("ChMate 241 Talk authentication invocation registers were not found")
    }
}

/**
 * 241 sends the cached DAT ETag on every normal thread refresh.  Immediately
 * after a successful post the server can still expose the preceding ETag, so
 * the refresh returns 304 and ChMate reports "no update" while the local post
 * is not rendered.  Skip only this conditional header in 241's downloader;
 * the normal response and local index handling remain unchanged.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchIoThreadRefreshCache() {
    val networkClass = mutableClassDefBy("Lo/VLj;")
    val downloader = networkClass.methods.singleOrNull { method ->
        method.name == "e"
            && method.returnType == "Lo/VLj\$RemoteActionCompatParcelizer;"
            && method.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
                "Z",
                "Lo/GNk17;",
            )
    } ?: error("ChMate 241 thread downloader was not found")
    val instructions = downloader.implementation?.instructions
        ?: error("ChMate 241 thread downloader has no implementation")
    val etagNames = instructions.indices.filter { index ->
        ((instructions[index] as? ReferenceInstruction)?.reference as? StringReference)
            ?.string == "If-None-Match"
    }
    check(etagNames.size == 1) {
        "Expected one ChMate 241 If-None-Match header, found ${etagNames.size}"
    }
    val nameIndex = etagNames.single()
    val headerCall = instructions.indices.firstOrNull { index ->
        index > nameIndex
            && ((instructions[index] as? ReferenceInstruction)?.reference as? MethodReference)
                ?.let { reference ->
                    reference.definingClass == "Lokhttp3/Headers\$ComponentActivity;"
                        && reference.name == "c"
                        && reference.parameterTypes.map(CharSequence::toString) ==
                            listOf("Ljava/lang/String;", "Ljava/lang/String;")
                } == true
    } ?: error("ChMate 241 If-None-Match header call was not found")
    val resume = instructions.getOrNull(headerCall + 1)
        ?: error("ChMate 241 If-None-Match header has no continuation")
    downloader.addInstructionsWithLabels(
        headerCall,
        "goto :haiagaru_241_skip_etag",
        ExternalLabel("haiagaru_241_skip_etag", resume),
    )
}

private const val ANDROID_XML_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val OPEN_URL_ACTIVITY = "app.morphe.extension.chmate.OpenUrlActivity"
private const val HISSI_MENU_ACTIVITY = "app.morphe.extension.chmate.HissiMenuActivity"

private data class OpenUrlPattern(
    val scheme: String,
    val host: String,
    val port: Int?,
    val path: String?,
    val prefix: Boolean,
)

private fun parseAdditionalOpenUrls(value: String): List<OpenUrlPattern> {
    val entries = value.split(Regex("[,\\r\\n]+"))
        .map(String::trim)
        .filter(String::isNotEmpty)
    if (entries.size > 32) {
        throw PatchException("追加できるURLは32件までです。")
    }
    return entries.map { entry ->
        val prefix = entry.endsWith("/*")
        val url = if (prefix) entry.dropLast(1) else entry
        val uri = try {
            URI(url)
        } catch (_: Exception) {
            throw PatchException("URLの形式が正しくありません: $entry")
        }
        val scheme = uri.scheme?.lowercase(Locale.ROOT)
        val host = uri.host?.lowercase(Locale.ROOT)
        if (scheme !in setOf("http", "https") || host.isNullOrBlank()
            || uri.userInfo != null || uri.query != null || uri.fragment != null
            || uri.port == 0 || uri.port > 65535 || uri.path?.contains('*') == true
        ) {
            throw PatchException("http(s)のURLを指定してください（クエリ・#・途中の*は不可）: $entry")
        }
        OpenUrlPattern(
            scheme = requireNotNull(scheme),
            host = host,
            port = uri.port.takeIf { it >= 0 },
            path = uri.path?.takeIf(String::isNotEmpty),
            prefix = prefix,
        )
    }.distinct()
}

private fun Document.addOpenUrlFilter(
    activity: Element,
    schemes: List<String>,
    host: String,
    port: Int? = null,
    path: String? = null,
    pathAttribute: String = "android:path",
) {
    val filter = createElement("intent-filter")
    filter.appendChild(createElement("action").apply {
        setAttributeNS(ANDROID_XML_NAMESPACE, "android:name", "android.intent.action.VIEW")
    })
    listOf("android.intent.category.DEFAULT", "android.intent.category.BROWSABLE")
        .forEach { categoryName ->
            filter.appendChild(createElement("category").apply {
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:name", categoryName)
            })
        }
    schemes.forEach { scheme ->
        filter.appendChild(createElement("data").apply {
            setAttributeNS(ANDROID_XML_NAMESPACE, "android:scheme", scheme)
        })
    }
    filter.appendChild(createElement("data").apply {
        setAttributeNS(ANDROID_XML_NAMESPACE, "android:host", host)
        port?.let { setAttributeNS(ANDROID_XML_NAMESPACE, "android:port", it.toString()) }
        path?.let { setAttributeNS(ANDROID_XML_NAMESPACE, pathAttribute, it) }
    })
    activity.appendChild(filter)
}

@Suppress("unused")
val haiagaruPatch = resourcePatch(
    name = "Haiagaru",
    description = "Haiagaruの機能とアプリ内設定を追加します。ChMate 0.8.10.243 devは一部機能が未実装のため非推奨です（パッチ適用は可能）。",
) {
    compatibleWith(chMateCompatibility)
    dependsOn(haiagaruBytecodePatch)

    val additionalOpenUrls = stringOption(
        key = "additionalOpenUrls",
        default = "",
        title = "アプリで開くURLを追加",
        description = "http(s)://から始まるURLをカンマ区切りで指定。末尾/*は配下も対象です。ChMateが解析できる板・スレURLに使用してください。",
    )

    val emojiMode = stringOption(
        key = "emojiMode",
        default = "missing",
        title = "絵文字フォントの適用範囲",
        description = "missing=端末にない絵文字だけ（推奨）、all=全絵文字、off=無効。",
    )

    val emojiFontPath = stringOption(
        key = "emojiFontPath",
        default = "",
        title = "任意の絵文字フォント（任意）",
        description = "パッチ実行PC上のTTF/OTFファイルの絶対パス。空欄なら内蔵Noto Color Emojiを使用します。",
    )

    val dedicatedCheckerViewer = stringOption(
        key = "dedicatedCheckerViewer",
        default = "true",
        title = "必死チェッカー専用ビュワー",
        description = "true=ChMate内の専用ビュワーを有効化、false=ChMate本来の外部ブラウザ動作。",
    )

    val edgeArchiveToolbarIconPath = stringOption(
        key = "edgeArchiveToolbarIconPath",
        default = "",
        title = "エッジ過去ログのツールバー画像（任意）",
        description = "パッチ実行端末上のPNG/WebP画像の絶対パス。空欄なら内蔵アイコンを使用します。",
    )

    val imageNgTfliteFix = stringOption(
        key = "imageNgTfliteFix",
        default = "true",
        title = "191の自動NG画像判定クラッシュを修正",
        description = "true=修正版TFLiteを適用（推奨）、false=元のライブラリを維持。191 devのみ対象です。",
    )

    execute {
        val replaceImageNgTflite = when (imageNgTfliteFix.value.orEmpty().trim().lowercase(Locale.ROOT)) {
            "true", "1", "yes", "on" -> true
            "false", "0", "no", "off" -> false
            else -> throw PatchException("imageNgTfliteFixは true / false を指定してください")
        }
        if (replaceImageNgTflite && packageMetadata.versionName == "0.8.10.191 dev") {
            // 191's bundled TFLite JNI crashes in NativeInterpreterWrapper_run
            // during automatic image NG classification. Keep the model and Java
            // classifier intact; replace only the affected native runtime with
            // the ABI-matched runtime verified from ChMate 226 dev.
            val tfliteLibraries = mapOf(
                "arm64-v8a" to "430a5cc57c285e9f7a8dede904eb998ad50c634e592baf7f06f8a896b2dea557",
                "armeabi-v7a" to "ba8c1f290d797820695231f86a8de16c74d1fa10595ea33d9397791f0f93d52b",
                "x86" to "1a8bad7f404050f259b9224e572106beb1326bc1c66c9856b4ecc58f5358df74",
                "x86_64" to "a7597671e6685259cd27959040959786c2c5e8f5dfd8303746554b3644315f5b",
            )
            tfliteLibraries.forEach { (abi, expectedHash) ->
                val resource = "/chmate/tflite-226/$abi/libtensorflowlite_jni.so"
                val bytes = checkNotNull(EmojiFontResourceMarker::class.java.getResourceAsStream(resource)) {
                    "Bundled TFLite library is missing: $resource"
                }.use { it.readBytes() }
                val actualHash = MessageDigest.getInstance("SHA-256").digest(bytes)
                    .joinToString("") { "%02x".format(it) }
                check(actualHash == expectedHash) { "Bundled TFLite library hash mismatch: $abi" }
                get("lib").resolve("$abi/libtensorflowlite_jni.so").apply {
                    parentFile.mkdirs()
                    writeBytes(bytes)
                }
            }
        }
        document("res/values/strings.xml").use { strings ->
            val entry = strings.createElement("string")
            entry.setAttribute("name", "haiagaru_edge_archive")
            entry.textContent = "エッジ過去ログ"
            strings.documentElement.appendChild(entry)
            val markRead = strings.createElement("string")
            markRead.setAttribute("name", "haiagaru_mark_all_read")
            markRead.textContent = "未読をすべて0にする"
            strings.documentElement.appendChild(markRead)
            val readFirst = strings.createElement("string")
            readFirst.setAttribute("name", "haiagaru_read_threads_first")
            readFirst.textContent = "既読スレを上に"
            strings.documentElement.appendChild(readFirst)
        }
        document("res/values-en/strings.xml").use { strings ->
            val entry = strings.createElement("string")
            entry.setAttribute("name", "haiagaru_edge_archive")
            entry.textContent = "Edge archive"
            strings.documentElement.appendChild(entry)
            val markRead = strings.createElement("string")
            markRead.setAttribute("name", "haiagaru_mark_all_read")
            markRead.textContent = "Mark all threads read"
            strings.documentElement.appendChild(markRead)
            val readFirst = strings.createElement("string")
            readFirst.setAttribute("name", "haiagaru_read_threads_first")
            readFirst.textContent = "Show read threads first"
            strings.documentElement.appendChild(readFirst)
        }
        PublicXmlManager(get("res/values/public.xml")).use { publicResources ->
            publicResources.createPublicId("string", "haiagaru_edge_archive")
            publicResources.createPublicId("drawable", "haiagaru_edge_archive")
            publicResources.createPublicId("string", "haiagaru_mark_all_read")
            publicResources.createPublicId("string", "haiagaru_read_threads_first")
            publicResources.createPublicId("drawable", "haiagaru_mark_all_read")
        }
        get("res").resolve("drawable/haiagaru_mark_all_read.xml").writeText("""
            <vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
                <path android:fillColor="#FFFFFFFF" android:pathData="M3,5h12v2H3zM3,10h9v2H3zM3,15h8v2H3zM14,16l2.5,2.5L21,13l1.5,1.5-6,7L12.5,17.5z"/>
            </vector>
        """.trimIndent())
        document("res/values/strings.xml").use { strings ->
            val entry = strings.createElement("string")
            entry.setAttribute("name", "haiagaru_quick_filter")
            entry.textContent = "フィルタ"
            strings.documentElement.appendChild(entry)
        }
        PublicXmlManager(get("res/values/public.xml")).use {
            it.createPublicId("string", "haiagaru_quick_filter")
            it.createPublicId("drawable", "haiagaru_quick_filter")
        }
        get("res").resolve("drawable/haiagaru_quick_filter.xml").writeText("""
            <vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
                <path android:fillColor="#FFFFFFFF" android:pathData="M3,4h18l-7,8v7l-4,2V12z"/>
            </vector>
        """.trimIndent())
        val iconSourcePath = edgeArchiveToolbarIconPath.value.orEmpty().trim()
        if (iconSourcePath.isEmpty()) {
            val iconTarget = get("res").resolve("drawable/haiagaru_edge_archive.xml")
            iconTarget.parentFile.mkdirs()
            checkNotNull(EmojiFontResourceMarker::class.java.getResourceAsStream(
                "/chmate/drawable/haiagaru_edge_archive.xml",
            )) { "Bundled Edge archive toolbar icon is missing" }.use { source ->
                iconTarget.outputStream().use(source::copyTo)
            }
        } else {
            val iconSource = File(iconSourcePath)
            if (!iconSource.isFile || !iconSource.canRead() ||
                iconSource.extension.lowercase(Locale.ROOT) !in setOf("png", "webp")) {
                throw PatchException("edgeArchiveToolbarIconPathは読み込み可能なPNG/WebP画像を指定してください")
            }
            val iconTarget = get("res").resolve(
                "drawable-nodpi/haiagaru_edge_archive.${iconSource.extension.lowercase(Locale.ROOT)}",
            )
            iconTarget.parentFile.mkdirs()
            iconSource.copyTo(iconTarget, overwrite = true)
        }
        // Mega constructs Ktor's default client before we can replace it.
        // Preserve the ServiceLoader entry in the host APK so initialization
        // can select the bundled OkHttp engine on Android.
        val ktorEngineService = get("META-INF").resolve(
            "services/io.ktor.client.HttpClientEngineContainer",
        )
        ktorEngineService.parentFile.mkdirs()
        ktorEngineService.writeText(
            "io.ktor.client.engine.okhttp.OkHttpEngineContainer\n",
            Charsets.UTF_8,
        )
        val cryptoProviderService = get("META-INF").resolve(
            "services/dev.whyoleg.cryptography.CryptographyProviderContainer",
        )
        cryptoProviderService.parentFile.mkdirs()
        cryptoProviderService.writeText(
            "dev.whyoleg.cryptography.providers.jdk.JdkCryptographyProviderContainer\n",
            Charsets.UTF_8,
        )
        val bundledEmojiFont = get("assets").resolve("haiagaru/NotoColorEmoji.ttf")
        bundledEmojiFont.parentFile.mkdirs()
        val requestedEmojiMode = emojiMode.value.orEmpty().trim().lowercase(Locale.ROOT)
        if (requestedEmojiMode !in setOf("missing", "all", "off")) {
            throw PatchException("emojiModeは missing / all / off のいずれかを指定してください: $requestedEmojiMode")
        }
        val requestedFontPath = emojiFontPath.value.orEmpty().trim()
        val dedicatedViewerEnabled = when (dedicatedCheckerViewer.value.orEmpty().trim().lowercase(Locale.ROOT)) {
            "true", "1", "yes", "on" -> true
            "false", "0", "no", "off" -> false
            else -> throw PatchException(
                "dedicatedCheckerViewerは true / false のいずれかを指定してください: "
                    + dedicatedCheckerViewer.value
            )
        }
        if (requestedFontPath.isBlank()) {
            checkNotNull(EmojiFontResourceMarker::class.java.getResourceAsStream(
                "/chmate/emoji/NotoColorEmoji.ttf",
            )) {
                "Bundled Noto Color Emoji font is missing from the Haiagaru patch bundle"
            }.use { source ->
                bundledEmojiFont.outputStream().use(source::copyTo)
            }
        } else {
            val customFont = File(requestedFontPath)
            if (!customFont.isFile || !customFont.canRead()) {
                throw PatchException("emojiFontPathのフォントファイルを読み込めません: $requestedFontPath")
            }
            customFont.inputStream().use { source ->
                bundledEmojiFont.outputStream().use(source::copyTo)
            }
        }
        bundledEmojiFont.parentFile.resolve("emoji.properties").writeText(
            "mode=$requestedEmojiMode\n",
            Charsets.UTF_8,
        )
        if (dedicatedViewerEnabled) {
            val monaFont = get("assets").resolve("haiagaru/MonaLite.ttf")
            checkNotNull(EmojiFontResourceMarker::class.java.getResourceAsStream(
                "/chmate/fonts/MonaLite.ttf",
            )) {
                "MonaLite font is missing from the Haiagaru Android patch bundle"
            }.use { source ->
                monaFont.outputStream().use(source::copyTo)
            }
        }

        val customUrls = parseAdditionalOpenUrls(additionalOpenUrls.value.orEmpty())
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

            val application = document.getElementsByTagName("application").item(0) as Element
            val openUrlActivity = document.createElement("activity").apply {
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:name", OPEN_URL_ACTIVITY)
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:exported", "true")
                setAttributeNS(
                    ANDROID_XML_NAMESPACE,
                    "android:theme",
                    "@android:style/Theme.Translucent.NoTitleBar",
                )
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:excludeFromRecents", "true")
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:noHistory", "true")
            }

            // One routing Activity avoids competing board/thread Activity matches.
            // Separate filters keep custom hosts and paths from being combined.
            document.addOpenUrlFilter(
                openUrlActivity, listOf("http", "https"), "talk.jp",
                path = "/boards/", pathAttribute = "android:pathPrefix",
            )
            document.addOpenUrlFilter(
                openUrlActivity, listOf("http", "https"), "talk.jp",
                path = "/test/read.cgi/", pathAttribute = "android:pathPrefix",
            )
            document.addOpenUrlFilter(
                openUrlActivity, listOf("http", "https"), "talk.jp",
                path = "/.*/", pathAttribute = "android:pathPattern",
            )
            customUrls.forEach { url ->
                document.addOpenUrlFilter(
                    activity = openUrlActivity,
                    schemes = listOf(url.scheme),
                    host = url.host,
                    port = url.port,
                    path = url.path,
                    pathAttribute = if (url.prefix) "android:pathPrefix" else "android:path",
                )
            }
            application.appendChild(openUrlActivity)

            application.appendChild(document.createElement("activity").apply {
                setAttributeNS(
                    ANDROID_XML_NAMESPACE,
                    "android:name",
                    "app.morphe.extension.chmate.HaiagaruLocalBackupActivity",
                )
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:exported", "false")
                setAttributeNS(
                    ANDROID_XML_NAMESPACE,
                    "android:theme",
                    "@android:style/Theme.Material.Light.NoActionBar",
                )
            })
            if (packageMetadata.versionName != "0.8.10.243 dev") {
                application.appendChild(document.createElement("activity").apply {
                    setAttributeNS(ANDROID_XML_NAMESPACE, "android:name",
                        "app.morphe.extension.chmate.ReplacementSettingsActivity")
                    setAttributeNS(ANDROID_XML_NAMESPACE, "android:exported", "false")
                    setAttributeNS(ANDROID_XML_NAMESPACE, "android:theme",
                        "@android:style/Theme.Material.Light.NoActionBar")
                })
            }

            // Keep the archive page in the same lightweight WebView activity as
            // the checker.  It is declared even when the optional Hissi viewer
            // is disabled, because Edge archives are an independent feature.
            val hissiActivity = document.createElement("activity").apply {
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:name", HISSI_MENU_ACTIVITY)
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:exported", "true")
                setAttributeNS(
                    ANDROID_XML_NAMESPACE,
                    "android:theme",
                    "@android:style/Theme.Material.Light.NoActionBar",
                )
            }
            document.addOpenUrlFilter(
                hissiActivity,
                listOf("haiagaru-eddi", "http", "https"),
                "eddiarchive3rd.boy.jp",
                path = "/",
                pathAttribute = "android:pathPrefix",
            )
            if (dedicatedViewerEnabled) {
                document.addOpenUrlFilter(
                    hissiActivity,
                    listOf("haiagaru-hissi", "haiagaru-hissis"),
                    "hissi.org",
                    path = "/read.php/",
                    pathAttribute = "android:pathPrefix",
                )
                // The long-press action in older ChMate builds bypasses the
                // configurable menu template and emits a normal http(s)
                // Hissi URL. Route that form to the same dedicated viewer so
                // both entry points behave identically.
                document.addOpenUrlFilter(
                    hissiActivity,
                    listOf("http", "https"),
                    "hissi.org",
                    path = "/read.php/",
                    pathAttribute = "android:pathPrefix",
                )
                application.appendChild(hissiActivity)
                application.setAttributeNS(
                    ANDROID_XML_NAMESPACE,
                    "android:usesCleartextTraffic",
                    "true",
                )
            } else {
                application.appendChild(hissiActivity)
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
    default = true,
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

/** Prefer the real UPLIFT branch over the re-signing-sensitive decoy. */
private fun BytecodePatchContext.patchUpliftIntegrityComparison(
    ownerType: String,
    methodName: String,
    vararg parameters: String,
    returnType: String = "Ljava/lang/String;",
) {
    val method = mutableClassDefBy(ownerType).methods.single { candidate ->
        candidate.name == methodName && candidate.returnType == returnType
            && candidate.parameterTypes.map(CharSequence::toString) == parameters.toList()
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("UPLIFT integrity method missing: $ownerType.$methodName")
    val guards = instructions.indices.filter { index ->
        instructions[index].opcode == Opcode.IF_NE
            && instructions.subList(maxOf(0, index - 8), index).count { it.opcode == Opcode.AGET } >= 2
    }
    check(guards.size == 1) {
        "Expected one UPLIFT integrity comparison in $ownerType.$methodName, found ${guards.size}"
    }
    method.replaceInstruction(guards.single(), "nop")
}

/** Skip the certificate-dependent decoy that throws a numeric error before UPLIFT posting. */
private fun BytecodePatchContext.patchUpliftPostingIntegrity242() {
    val method = mutableClassDefBy("Lo/getBackImage;").methods.single { candidate ->
        candidate.name == "c"
            && candidate.returnType == "Ljava/lang/String;"
            && candidate.parameterTypes.map(CharSequence::toString) ==
                listOf("Lo/getBackImage\$ComponentActivity;")
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate 242 UPLIFT posting method missing")
    val runtimeError = instructions.indexOfLast { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Ljava/lang/RuntimeException;"
            && ref.name == "<init>"
            && ref.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
    }
    check(runtimeError >= 0 && instructions.getOrNull(runtimeError + 1)?.opcode == Opcode.THROW) {
        "ChMate 242 numeric UPLIFT integrity error changed"
    }
    val normalPath = instructions.indexOfFirst { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lo/zzbvt;" && ref.name == "getValue"
    }
    check(normalPath > 0 && normalPath < runtimeError) { "ChMate 242 UPLIFT client path missing" }
    val methodStart = instructions.indexOfFirst { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Ljava/lang/reflect/Field;" && ref.name == "getLong"
    }
    check(methodStart > 0 && methodStart < runtimeError) {
        "ChMate 242 UPLIFT integrity entry changed"
    }
    // Preserve the method prologue/register setup. The target path initializes
    // its own client and token variables and returns either the cached token or
    // the result of the normal UPLIFT login call.
    method.addInstructionsWithLabels(
        methodStart,
        "const-string v12, \"\"\ngoto/32 :haiagaru_uplift_client_242",
        ExternalLabel("haiagaru_uplift_client_242", instructions[normalPath - 1]),
    )
}

/** Keep 242's real UPLIFT login branch reachable after re-signing the APK. */
private fun BytecodePatchContext.patchUpliftLoginIntegrity242() {
    val method = mutableClassDefBy("Lo/getAdLogo;").methods.single { candidate ->
        candidate.name == "e" && candidate.returnType == "Ljava/lang/String;"
            && candidate.parameterTypes.map(CharSequence::toString) == listOf(
                "Lo/getBackImage\$ComponentActivity;", "Lo/ApiAnyClient;", "J",
            )
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate 242 UPLIFT login implementation missing")
    val successResult = instructions.indexOfFirst { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lo/TTVideoLandingPageActivity2;" && ref.name == "c"
            && ref.returnType == "Lo/TTVideoLandingPageActivity2\$ComponentActivity;"
    }
    // The final certificate comparison jumps to a deliberate null throw.
    // Keep the normal result handling immediately after that guard.
    val integrityGuards = instructions.indices.filter { index ->
        index < successResult && instructions[index].opcode == Opcode.IF_NE
            && instructions.subList(maxOf(0, index - 8), index).count { it.opcode == Opcode.AGET } >= 2
    }
    check(integrityGuards.size == 1) {
        "Expected one ChMate 242 UPLIFT integrity comparison, found ${integrityGuards.size}"
    }
    method.replaceInstruction(integrityGuards.single(), "nop")
}

/** Restore the literal prefix length used only to form a Kotlin diagnostic. */
private fun BytecodePatchContext.patchLiteralDiagnosticSubstring242(
    ownerType: String,
    diagnostic: String,
    prefixLength: Int,
) {
    val candidates = mutableClassDefBy(ownerType).methods.mapNotNull { method ->
        val instructions = method.implementation?.instructions?.toList() ?: return@mapNotNull null
        val textIndex = instructions.indexOfFirst { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == diagnostic
        }
        if (textIndex < 0) return@mapNotNull null
        val substringIndex = (textIndex + 1 until minOf(textIndex + 5, instructions.size))
            .firstOrNull { index ->
                val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Ljava/lang/String;"
                    && reference.name == "substring"
                    && reference.parameterTypes.map(CharSequence::toString) == listOf("I")
            } ?: return@mapNotNull null
        method to substringIndex
    }
    check(candidates.size == 1) { "Expected one $ownerType diagnostic substring, found ${candidates.size}" }
    val (method, substringIndex) = candidates.single()
    val indexRegister = when (val call = method.implementation!!.instructions[substringIndex]) {
        is FiveRegisterInstruction -> call.registerD
        is RegisterRangeInstruction -> call.startRegister + 1
        else -> error("$ownerType diagnostic substring register changed")
    }
    val opcode = if (prefixLength < 8) "const/4" else "const/16"
    method.addInstructionsWithLabels(substringIndex, "$opcode v$indexRegister, 0x${prefixLength.toString(16)}")
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchImageUploadIntegrity242() {
    val method = mutableClassDefBy("Lo/ApiMetadataBuilder;").methods.single {
        it.name == "c" && it.parameters.isEmpty() && it.returnType == "Lo/zzbtj;"
    }
    val instructions = method.implementation?.instructions
        ?: error("ChMate 242 image upload implementation missing")
    val comparison = instructions.indices.single { index ->
        if (instructions[index].opcode != Opcode.IF_NE || index < 6) return@single false
        val window = instructions.subList(index - 6, index)
        window.map { it.opcode } == listOf(
            Opcode.AGET_OBJECT, Opcode.CHECK_CAST, Opcode.AGET,
            Opcode.AGET_OBJECT, Opcode.CHECK_CAST, Opcode.AGET,
        )
    }
    val first = instructions[comparison - 6] as ThreeRegisterInstruction
    val second = instructions[comparison - 3] as ThreeRegisterInstruction
    check(first.registerB == second.registerB) { "ChMate 242 integrity arrays differ" }
    // Normalize at the comparison, after either cached or freshly generated state
    // has been selected. Unlike the diagnostic hook this requires no clock/cache
    // manipulation and also works on the first upload after a process restart.
    val register = first.registerB
    method.addInstruction(
        comparison - 6,
        "invoke-static/range { v$register .. v$register }, " +
            "$EXTENSION->normalizeImageUploadIntegrity242([Ljava/lang/Object;)V",
    )

    // The successful path still computes "uploading" from "8/22/uploading"
    // through an obfuscated integer expression. On 242 this expression can
    // divide by zero before the image bytes are copied. The intended index is
    // the constant prefix length (5), so replace only its final division.
    val filenameStart = instructions.indices.single { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
        reference is StringReference && reference.string == "8/22/uploading"
    }
    val substring = (filenameStart + 1 until instructions.size).first { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
        reference is MethodReference && reference.definingClass == "Ljava/lang/String;"
            && reference.name == "substring" && reference.parameterTypes.size == 1
    }
    val filenameDivision = (filenameStart + 1 until substring).last { index ->
        instructions[index].opcode == Opcode.DIV_INT_2ADDR
    }
    val division = instructions[filenameDivision] as TwoRegisterInstruction
    check(division.registerA == 13 && division.registerB == 0) {
        "ChMate 242 image upload filename calculation changed"
    }
    method.replaceInstruction(filenameDivision, "const/4 v13, 0x5")
}

/** Strip only Edge's reporter suffix before 191 compares successor titles. */
private fun BytecodePatchContext.patchLegacyNextThreadTitleMatch191() {
    val method = mutableClassDefBy("Lo/o2;").methods.single { candidate ->
        candidate.name == "b" && candidate.returnType == "Lo/o2\$setContentView;"
            && candidate.parameterTypes.map(CharSequence::toString) == listOf(
                "Landroid/content/Context;", "Lo/getLabel;",
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;", "Z",
                "Lo/r8lambdamHWy7omJVz7G9M7u2KSo5IaRp90;",
            )
    }
    val instructions = method.implementation?.instructions
        ?: error("ChMate 191 next-thread worker missing")
    val normalizationCalls = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (reference?.definingClass == "Lo/ocd;" && reference.name == "b"
            && reference.parameterTypes.map(CharSequence::toString) ==
            listOf("Lo/getAmount;", "Ljava/lang/String;")) index else null
    }
    check(normalizationCalls.size == 3) {
        "ChMate 191 next-thread title normalization changed"
    }
    // The third call normalizes the current favorite's title. The first two
    // normalize candidate/new titles. All three must ignore only the Edge ID.
    normalizationCalls.asReversed().forEach { index ->
        val call = instructions[index] as FiveRegisterInstruction
        val titleRegister = call.registerD
        method.addInstructionsWithLabels(index, """
            invoke-static { v$titleRegister }, Lapp/morphe/extension/chmate/EdgeReporterId;->titleForNextThreadMatch(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$titleRegister
        """.trimIndent())
    }
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
    val method = mutableClassDefBy(activityClass).methods.single { method ->
        method.name == "onCreate"
            && method.returnType == "V"
            && method.parameters.map(CharSequence::toString) == listOf("Landroid/os/Bundle;")
    }
    method.addInstruction(
        0,
        "invoke-static/range { p0 .. p0 }, " +
            "$EXTENSION->rewriteLegacyThreadIntent(Landroid/app/Activity;)V",
    )
    method.addBeforeEveryReturn(
        "invoke-static/range { p0 .. p0 }, " +
            "$EXTENSION->hideTalkThreadBlankRows(Landroid/app/Activity;)V",
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
        "0.8.10.242 dev", "0.8.10.243 dev" -> "c" to "Landroidx/fragment/app/Fragment;"
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
    // QuickFilterToolbar may already have inserted a call before the return.
    // Never infer a Kotlin assertion from the number of tail instructions.
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate response adapter has no implementation")
    val bindIndex = instructions.indices.single { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@single false
        val resultTail = instructions.drop(index + 1).take(4).map { it.opcode }
        reference.returnType == "Landroid/view/View;"
            && resultTail.firstOrNull() == Opcode.MOVE_RESULT_OBJECT
            && resultTail.contains(Opcode.RETURN_OBJECT)
    }

    val resultRegister = (instructions[bindIndex + 1] as OneRegisterInstruction).registerA
    // Intercept the View while p1 still holds the adapter position, then restore
    // the original destination. Preserve both the 191 filter hook and 226
    // assertion, including their argument registers.
    method.replaceInstruction(bindIndex + 1, "move-result-object p2")
    method.addInstructionsWithLabels(
        bindIndex + 2,
        """
            invoke-static {p2, p0, p1}, $EXTENSION->hideLegacyThreadListAd(Landroid/view/View;Landroid/widget/BaseAdapter;I)V
            move-object/from16 v$resultRegister, p2
        """.trimIndent(),
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
        // 0.8.10.241 also has a certificate-dependent settings decoy before
        // the real Activity setup.  Its `(n - 1) * n % 2` expression is
        // unconditionally zero, and the resulting remainder is only used to
        // select a Toast resource.  The previous patch covered the later
        // DIV_INT traps but not this REM_INT trap, so Android 17 reached this
        // block while opening Settings and crashed at the reported line 312.
        val toastRemainderIndex = instructions.indices.singleOrNull { index ->
            if (instructions[index].opcode != Opcode.REM_INT_2ADDR) return@singleOrNull false
            instructions.subList(index + 1, minOf(index + 6, instructions.size)).any { next ->
                val reference = (next as? ReferenceInstruction)?.reference
                    as? MethodReference ?: return@any false
                reference.definingClass == "Landroid/widget/Toast;"
                    && reference.name == "makeText"
            }
        } ?: error("ChMate settings Toast remainder trap was not found")
        val realSetupIndex = (toastRemainderIndex + 1 until instructions.size).firstOrNull { index ->
            instructions[index].opcode == Opcode.NEW_ARRAY
        } ?: error("ChMate settings setup after Toast remainder trap was not found")
        addInstructionsWithLabels(
            toastRemainderIndex,
            "goto/32 :haiagaru_settings_after_toast_trap",
            ExternalLabel("haiagaru_settings_after_toast_trap", instructions[realSetupIndex]),
        )

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

/**
 * ChMate 243 moved the in-thread banner from the legacy ListView adapter to
 * ResListRecyclerAdapter. Its INLINE_AD item (view type 5) always creates this
 * dedicated ViewHolder, so collapse its root view without affecting response rows.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchModernThreadListAd() {
    mutableClassDefBy("Lo/zzdpc\$IconCompatParcelizer;").methods
        .single { method ->
            method.name == "<init>"
                && method.returnType == "V"
                && method.parameters.map(CharSequence::toString) ==
                listOf("Landroid/view/View;")
        }
        .addBeforeEveryReturn(
            "invoke-static/range { p1 .. p1 }, " +
                "$EXTENSION->hideModernThreadListAd(Landroid/view/View;)V",
        )
}

/** Execute the wrapped callable directly, without the certificate-derived decoy path. */
private fun MutableMethod.returnSignatureDelegate(profile: ChMateProfile) {
    addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, p0
            iget-object v0, v0, ${profile.signatureClass}->${profile.signatureDelegateField}:${profile.signatureDelegateType}
            invoke-virtual {v0}, ${profile.signatureDelegateType}->${profile.signatureDelegateMethod}()Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """.trimIndent(),
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

/** Keeps selected reporter metadata while retaining the normal history fallback. */
private fun MutableMethod.preserveEdgeReporterTitle(historyClass: String, titleField: String) {
    val instructions = implementation!!.instructions.toList()
    // The history title is read once for isEmpty, then to overwrite the selected
    // title. Replace only that final move, preserving all original branches.
    val index = instructions.indices.single { i ->
        val field = (instructions[i] as? ReferenceInstruction)?.reference as? FieldReference
        instructions[i].opcode == Opcode.IGET_OBJECT &&
            field?.definingClass == historyClass && field.name == titleField &&
            field.type == "Ljava/lang/String;" &&
            instructions.getOrNull(i + 1)?.opcode == Opcode.MOVE_OBJECT
    }
    val read = instructions[index] as TwoRegisterInstruction
    val move = instructions[index + 1] as TwoRegisterInstruction
    check(move.registerB == read.registerA && move.registerA != move.registerB)
    check(move.registerA < 16 && move.registerB < 16)
    replaceInstruction(index + 1,
        "invoke-static {v${move.registerA}, v${move.registerB}}, " +
            "Lapp/morphe/extension/chmate/EdgeReporterTitle;->preserve(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;")
    addInstruction(index + 2, "move-result-object v${move.registerA}")
}

/** Rewrites Edge's live-board subject feed before ChMate starts the request. */
private fun MutableMethod.rewriteEdgeSubjectUrl() {
    val returns = implementation?.instructions
        ?.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT)
                index to (instruction as OneRegisterInstruction).registerA else null
        }
        .orEmpty()
    check(returns.isNotEmpty()) { "Edge subject URL return was not found" }
    returns.asReversed().forEach { (index, register) ->
        addInstructionsWithLabels(index, """
            invoke-static/range { v$register .. v$register }, $EXTENSION->rewriteSubjectUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$register
        """)
    }
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
        // setText is only patched in ChMate's own obfuscated/application
        // classes. Walking every bundled AndroidX/ad-SDK class made 226/241/
        // 243 patching needlessly expensive and touched unrelated widgets.
        if (classDef.type.startsWith("Lapp/morphe/extension/chmate/")
            || (!classDef.type.startsWith("Ljp/syoboi/")
                && !classDef.type.startsWith("Lo/"))) {
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
                        invoke-static/range { v$register .. v$register }, $EXTENSION->processEmojiText(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
                        move-result-object v$register
                    """
                )
            }
        }
    }
}

/**
 * Older DAT rows contain sssp://img.5ch.net/premium/... while current rows
 * contain the same BE token on img.5ch.io. Normalize the stored response body
 * as it is constructed, before both the inline renderer and the copy-paste/NG
 * and attachment projections read it. The exact token keeps ordinary URLs intact.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyBeResponseBody(
    responseModelClass: String,
    bodyField: String,
) {
    val responseClass = mutableClassDefBy(responseModelClass)
    var assignments = 0
    responseClass.methods.filter { it.name == "<init>" }.forEach { constructor ->
        val sites = constructor.implementation?.instructions
            ?.mapIndexedNotNull { index, instruction ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    ?: return@mapIndexedNotNull null
                if (instruction.opcode != Opcode.IPUT_OBJECT
                    || field.definingClass != responseModelClass
                    || field.name != bodyField
                    || field.type != "Ljava/lang/String;"
                ) return@mapIndexedNotNull null
                index to (instruction as TwoRegisterInstruction).registerA
            }.orEmpty()
        sites.asReversed().forEach { (index, register) ->
            constructor.addInstructionsWithLabels(
                index,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION->normalizeLegacyBeBody(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$register
                """,
            )
            assignments++
        }
    }
    check(assignments > 0) { "BE response body assignment missing: $responseModelClass" }
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

/** Keep a legacy BE image span on the DAT-token line, not across the next newline. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyBeSpanBoundary(
    bufferClass: String,
) {
    val spanBuilder = mutableClassDefBy(bufferClass).methods.single { method ->
        method.returnType == "Landroid/text/SpannableString;"
            && method.parameters.isEmpty()
    }
    val spanSite = spanBuilder.implementation?.instructions
        ?.mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@mapIndexedNotNull null
            if (reference.definingClass == "Landroid/text/SpannableString;"
                && reference.name == "setSpan"
                && reference.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/lang/Object;", "I", "I", "I")
            ) index to (instruction as FiveRegisterInstruction) else null
        }?.singleOrNull() ?: error("BE span builder was not found: $bufferClass")
    val (index, invocation) = spanSite
    spanBuilder.addInstructionsWithLabels(
        index,
        """
            invoke-static { v${invocation.registerC}, v${invocation.registerD}, v${invocation.registerE}, v${invocation.registerF} }, $EXTENSION->correctLegacyBeSpanEnd(Ljava/lang/CharSequence;Ljava/lang/Object;II)I
            move-result v${invocation.registerF}
        """,
    )
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
            invoke-static/range { p1 .. p2 }, $EXTENSION->prepareLegacyBeParsing(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
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
 * Rewrite the board-menu endpoint at the point where ChMate starts its menu
 * download.  The URL is persisted in ChMate preferences, so replacing only
 * string constants does not repair installations that still store
 * menu.5ch.net.  The method signatures differ across the supported builds;
 * callers provide the stable return type for the corresponding worker.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchBbsMenuUrl(
    methodName: String,
    returnType: String,
) {
    val worker = mutableClassDefBy("Ljp/syoboi/a2chMate/bbs/BBSMenuUpdateWork;")
    val fetch = worker.methods.singleOrNull { method ->
        method.name == methodName
            && method.returnType == returnType
            && method.parameters.map(CharSequence::toString) == listOf("Ljava/lang/String;")
    } ?: error("ChMate BBS menu download method was not found: $methodName $returnType")
    fetch.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p1 .. p1 }, $EXTENSION->rewriteBbsMenuUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p1
        """,
    )

    // ChMate leaves URL 1 empty on a fresh install. The worker above can only
    // migrate a URL that already exists, so give its first menu preference a
    // default without changing any explicitly saved user value.
    val menuDefaults = mutableListOf<Pair<MutableMethod, Int>>()
    classDefForEach { classDef ->
        if (!classDef.type.startsWith("Ljp/syoboi/") && !classDef.type.startsWith("Lo/")) {
            return@classDefForEach
        }
        classDef.methods.filter { it.name == "<clinit>" }.forEach { method ->
            val index = method.implementation?.instructions?.indexOfFirst { instruction ->
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                    "bbsMenuUrl"
            } ?: -1
            if (index >= 0) {
                menuDefaults += mutableClassDefBy(classDef).findMutableMethodOf(method) to index
            }
        }
    }
    check(menuDefaults.size <= 1) { "ChMate has multiple first BBS menu preferences" }
    if (menuDefaults.isEmpty()) return
    val (initializer, menuKeyIndex) = menuDefaults.single()
    val instructions = initializer.implementation!!.instructions
    val constructorIndex = (menuKeyIndex + 1 until minOf(menuKeyIndex + 5, instructions.size))
        .firstOrNull { index ->
            val instruction = instructions[index]
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_DIRECT
                && instruction is FiveRegisterInstruction
                && instruction.registerCount == 3
                && reference?.name == "<init>"
                && reference.parameterTypes.map(CharSequence::toString) ==
                    listOf("Ljava/lang/String;", "Ljava/lang/String;")
        } ?: error("ChMate's first BBS menu default constructor was not found")
    val defaultRegister = (instructions[constructorIndex] as FiveRegisterInstruction).registerE
    initializer.addInstructionsWithLabels(
        constructorIndex + 1,
        "const-string v$defaultRegister, \"\"",
    )
    initializer.addInstructionsWithLabels(
        constructorIndex,
        "const-string v$defaultRegister, \"https://menu.5ch.io/bbsmenu.html\"",
    )
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
    // talk.jp/boards/<board>. Keep that form: the legacy BBSUrlInfo parser
    // recognizes /boards/<board> as Talk type 4, while talk.jp/<board> returns
    // null and causes BBSMenuUpdateWork to reject an otherwise valid menu as
    // containing zero boards. Validate the structural site so a future target
    // change fails during patching instead of silently disabling Talk menus.
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
    talkBoardPrefixSites.single()

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
            invoke-static/range { p1 .. p2 }, $EXTENSION->prepareLegacyBeParsing(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
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

    // When the optional 5ch thread-date display is enabled, ChMate replaces
    // the matched URL with "board/date" before creating the link span. A BE
    // icon earlier in the response can shift the native parser's coordinates
    // by one character. Fix the deletion position while the original URL is
    // still present; correcting only the later span leaves its first "h" in
    // the displayed text ("hニュー速(嫌儲)/2026-...").
    val legacyDateReplacementIndex = legacyTextParserMethod.implementation!!.instructions
        .mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@mapIndexedNotNull null
            if (reference.definingClass == "Ljava/lang/StringBuilder;"
                && reference.name == "delete"
                && reference.parameterTypes.map(CharSequence::toString) == listOf("I", "I")
                && reference.returnType == "Ljava/lang/StringBuilder;"
            ) index else null
        }.singleOrNull() ?: error("ChMate 191 thread-date URL replacement was not found")
    legacyTextParserMethod.addInstructionsWithLabels(
        legacyDateReplacementIndex,
        """
            move v13, v8
            invoke-static { v12, v5, v8, v11 }, $EXTENSION->alignLegacyLinkRange(Ljava/lang/CharSequence;Ljava/lang/String;II)J
            move-result-wide v14
            long-to-int v8, v14
            sub-int v13, v8, v13
            add-int/2addr v11, v13
            add-int/2addr v4, v13
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
            // then restores its form parameter before retrying. Keep the original
            // form in p4 throughout the merge: replacing it with the parsed form
            // before the iterator runs loses MESSAGE and can modify the collection
            // being iterated. Only assign the merged form after that loop finishes.
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
            val confirmationMergeEndIndex = instructions.mapIndexedNotNull { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                    as? MethodReference ?: return@mapIndexedNotNull null
                if (index > parserIndex
                    && reference.definingClass == "Lo/getJsonData;"
                    && reference.name == "e"
                    && reference.returnType == "Z"
                    && reference.parameterTypes.map(CharSequence::toString) ==
                    listOf("Ljava/lang/String;")
                ) index else null
            }.singleOrNull() ?: error("ChMate legacy confirmation merge end was not found")
            method.addInstruction(
                confirmationMergeEndIndex,
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

/**
 * Disable only the stock editor's local body gate.
 *
 * The affected implementations are found by their device-information removal
 * expression instead of their obfuscated method name.  191 and 243 do not ship
 * this gate, while 226 and 241 each contain exactly one copy.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchPostPreflightValidation(
    version: String,
) {
    var patched = 0
    if (version == "0.8.10.191 dev") {
        patchLegacy191PostPreflightValidation()
        patched++
    }
    classDefForEach { classDef ->
        if (!classDef.type.contains("/feature/resedit/ResEditFragment;")) {
            return@classDefForEach
        }
        classDef.methods.forEach { method ->
            if (method.returnType != "Z" || method.parameterTypes.isNotEmpty()) {
                return@forEach
            }
            val instructions = method.implementation?.instructions ?: return@forEach
            val hasDeviceInfoGate = instructions.any { instruction ->
                val text = ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string ?: return@any false
                text.startsWith("[ \t\n]|2chMate ") && text.contains("(/[^/]+)+")
            }
            if (!hasDeviceInfoGate) {
                return@forEach
            }

            val mutableMethod = mutableClassDefBy(classDef).findMutableMethodOf(method)
            val resultRegister = mutableMethod.findFreeRegister(0)
            val originalStart = mutableMethod.implementation?.instructions?.firstOrNull()
                ?: error("ChMate post preflight gate has no implementation")
            mutableMethod.addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION->bypassPostPreflightValidation()Z
                    move-result v$resultRegister
                    if-eqz v$resultRegister, :haiagaru_stock_post_preflight
                    const/4 v$resultRegister, 0x1
                    return v$resultRegister
                """,
                ExternalLabel("haiagaru_stock_post_preflight", originalStart)
            )
            patched++
        }
    }

    val expected = when (version) {
        "0.8.10.191 dev", "0.8.10.226 dev", "0.8.10.241", "0.8.10.242 dev" -> 1
        "0.8.10.243 dev" -> 0
        else -> error("Unsupported ChMate version: $version")
    }
    check(patched == expected) {
        "Unexpected ChMate post preflight gates for $version: $patched (expected $expected)"
    }
}

/**
 * ChMate 191 keeps the editor gate in its obfuscated Fragment rather than in
 * the newer feature/resedit package.  It also removes the device-information
 * footer with a version-specific regular expression, so the generic matcher
 * above cannot identify it.  Bypass this method at the same point as the
 * newer versions, while retaining the stock behavior when the setting is OFF.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacy191PostPreflightValidation() {
    val method = mutableClassDefBy("Lo/p9ExternalSyntheticLambda6;").methods.single { candidate ->
        candidate.name == "d"
            && candidate.returnType == "Z"
            && candidate.parameterTypes.isEmpty()
    }
    val firstInstruction = method.implementation?.instructions?.firstOrNull()
        ?: error("ChMate 191 post preflight gate has no implementation")
    val resultRegister = method.findFreeRegister(0)
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $EXTENSION->bypassPostPreflightValidation()Z
            move-result v$resultRegister
            if-eqz v$resultRegister, :haiagaru_stock_191_post_preflight
            const/4 v$resultRegister, 0x1
            return v$resultRegister
        """.trimIndent(),
        ExternalLabel("haiagaru_stock_191_post_preflight", firstInstruction),
    )
}

/** Hooks use stable parameter types; obfuscated owners are validated for each supported APK. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchEdgeReporterHistory(version: String) {
    val runtime = "Lapp/morphe/extension/chmate/EdgeReporterHistory;"
    val board = if (version == "0.8.10.191 dev")
        "Ljp/syoboi/a2chMate/client/BBSUrlInfo\$BoardID;" else "Ljp/syoboi/a2chMate/client/BoardID;"
    val owners = when (version) {
        "0.8.10.191 dev" -> listOf("Lo/r8lambdaEBvvDaQDWIaS7WUoordU_4sxR3Y;", "Lo/isReady;", "Lo/getLabel;")
        "0.8.10.226 dev" -> listOf("Lo/TrustRootIndex;", "Lo/MessageInflater;", "Lo/OpenJSSEPlatformCompanion;")
        "0.8.10.241" -> listOf("Lo/tul11;", "Lo/changeVideoState;", "Lo/VLj;")
        "0.8.10.242 dev" -> listOf("Lo/initView;", "Lo/TopLayoutDislike22;", "Lo/getImageView;")
        else -> listOf("Lo/zzaA;", "Lo/zzaC;", "Lo/zzaaq;")
    }
    val writes = mutableClassDefBy(owners[0]).methods.filter {
        it.accessFlags and 8 == 0 && it.parameterTypes.take(3) == listOf(board, "J", "Ljava/lang/String;")
    }
    check(writes.size == 2) { "Reporter history writers changed: $version (${writes.size})" }
    writes.forEach { it.addInstructionsWithLabels(0, """
        invoke-static/range {p1 .. p4}, $runtime->title(Ljava/lang/Object;JLjava/lang/String;)Ljava/lang/String;
        move-result-object p4
    """) }
    val history = mutableClassDefBy(owners[1]).methods.single { it.name == "<init>" }
    // History constructor: bookmark id, thread key, board id, title, ...
    // p3/p4 hold the thread key, p5 board, p6 title. Use a reordered bridge to retain wide registers.
    history.addInstructionsWithLabels(0, """
        invoke-static/range {p3 .. p6}, $runtime->historyTitle(JLjava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
        move-result-object p6
    """)
    var captures = 0
    mutableClassDefBy(owners[2]).methods.toList().forEach { method ->
        val urlIndex = method.parameterTypes.indexOf("Ljp/syoboi/a2chMate/client/BBSUrlInfo;")
            .takeIf { it >= 0 } ?: method.parameterTypes.indexOf("[Ljava/lang/Object;")
        if (urlIndex < 0) return@forEach
        var offset = if (method.accessFlags and 8 == 0) 1 else 0
        method.parameterTypes.take(urlIndex).forEach { offset += if (it == "J" || it == "D") 2 else 1 }
        val instructions = method.implementation?.instructions?.toList() ?: return@forEach
        val sites = instructions.indices.filter { index ->
            val ref = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref != null && (ref.definingClass == "Ljp/syoboi/a2chMate/data/BBSThreadList;"
                    || ref.definingClass == "Lo/zzadh;"
                    || ref.definingClass == "Lo/setSkipEnable;") && ref.parameterTypes.firstOrNull() == "Ljava/io/InputStream;"
                    && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
        }
        sites.asReversed().forEach { index ->
            val list = (instructions[index + 1] as OneRegisterInstruction).registerA
            val urlRegister = method.implementation!!.registerCount -
                (if (method.accessFlags and 8 == 0) 1 else 0) -
                method.parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 } + offset
            method.addInstructionsWithLabels(index + 2, """
                invoke-static/range {v$list .. v$list}, $runtime->pending(Ljava/lang/Object;)V
                invoke-static/range {v$urlRegister .. v$urlRegister}, $runtime->capturePending(Ljava/lang/Object;)V
                ${if (version == "0.8.10.191 dev") "" else """
                invoke-static/range {v$list .. v$list}, Lapp/morphe/extension/chmate/ProgrammableNgController;->pendingSubjectList(Ljava/lang/Object;)V
                invoke-static/range {v$urlRegister .. v$urlRegister}, Lapp/morphe/extension/chmate/ProgrammableNgController;->filterPendingSubjectList(Ljava/lang/Object;)V
                """}
            """)
            captures++
        }
    }
    check(captures > 0) { "Subject metadata capture missing: $version" }
    if (version == "0.8.10.191 dev") {
        // 1.3.4 moved the legacy editor bridge to a fragment-only API so it can
        // resolve the current view after recreation, but accidentally removed
        // the bytecode call site at the same time.  Without this hook, captured
        // reporter IDs still reach history while the NG editor never exposes
        // the reporter-ID choices.  Invoke it after onViewCreated has completed;
        // EdgeReporterHistory resolves getView() and preserves the stock editor.
        mutableClassDefBy("Lo/MaxFullscreenAdImplExternalSyntheticLambda4;").methods.single {
            it.name == "onViewCreated"
                && it.returnType == "V"
                && it.parameters.map(CharSequence::toString) ==
                listOf("Landroid/view/View;", "Landroid/os/Bundle;")
        }.addBeforeEveryReturn(
            "invoke-static/range {p0 .. p0}, $runtime->addLegacyButton(Ljava/lang/Object;)V"
        )
    } else {
        val owner = when (version) {
            "0.8.10.226 dev" -> "Lo/getSegmentsokio;"
            "0.8.10.241" -> "Lo/TTRewardVideoActivity2;"
            "0.8.10.242 dev" -> "Lo/getLandscapeInlineAdaptiveBannerAdSize;"
            else -> "Lo/zzawg;"
        }
        val entry = mutableClassDefBy(owner).methods.single {
            it.name == "e" && it.parameterTypes.firstOrNull() == "Landroidx/fragment/app/FragmentActivity;"
        }
        val free = entry.findFreeRegister(0)
        entry.addInstructionsWithLabels(0, """
            invoke-static/range {p0 .. p3}, $runtime->choose(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v$free
            if-eqz v$free, :reporter_stock_editor
            return-void
            :reporter_stock_editor
            nop
        """)
    }
}

/** Remove the cached Edge reporter suffix only when a title reaches the clipboard. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchEdgeReporterTitleCopy(version: String) {
    val owner = when (version) {
        "0.8.10.191 dev" -> "Lo/o8ExternalSyntheticLambda0;"
        "0.8.10.226 dev" -> "Lo/getFlexItemCount;"
        "0.8.10.241" -> "Lo/RDh41;"
        "0.8.10.242 dev" -> "Lo/setDataOwnerProductId;"
        "0.8.10.243 dev" -> "Lo/zzbwr;"
        else -> error("Unsupported clipboard title path: $version")
    }
    val method = mutableClassDefBy(owner).methods.single { candidate ->
        candidate.returnType == "V"
            && candidate.parameterTypes.map(CharSequence::toString) ==
            listOf("Landroid/content/Context;", "Ljava/lang/String;", "Z")
            && candidate.implementation?.instructions?.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Landroid/content/ClipData;"
                    && reference.name == "newPlainText"
            } == true
    }
    method.addInstructionsWithLabels(0, """
        invoke-static/range { p1 .. p1 }, Lapp/morphe/extension/chmate/EdgeReporterHistory;->copyTitle(Ljava/lang/String;)Ljava/lang/String;
        move-result-object p1
    """)
}

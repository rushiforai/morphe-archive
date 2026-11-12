package dev.utaa.linimal.patches.features.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import dev.utaa.linimal.patches.features.premium.premiumUnsendPromotionPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.exceptionHandlerAddresses
import dev.utaa.linimal.patches.util.instructionWritesRegister
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex

private const val LIST = "Ljava/util/List;"
private const val ENUM = "Ljava/lang/Enum;"
private const val INTEGER = "Ljava/lang/Integer;"
private const val INTENT = "Landroid/content/Intent;"
private const val LINKED_HASH_MAP = "Ljava/util/LinkedHashMap;"
private const val MAIN_TAB_HOOKS = "Ldev/utaa/linimal/extension/features/MainTabHooks;"

/** MainActivityTabManager の constructor が、保存した位置を読む Bundle key。 */
private const val POSITION_BUNDLE_KEY = "MainActivityTabManager.currentPosition"

/** 注入先の数。下部ボタンの位置、ウォレット tooltip、復元する位置、他画面から開くタブの 4 か所です。 */
private const val TARGET_COUNT = 7

/** 非 range の `invoke` に渡せる register の上限（v15）。 */
private const val MAX_NON_RANGE_REGISTER = 15

private val mainTabPatchIds = listOf(
    PatchId.MAIN_TAB_NEWS,
    PatchId.MAIN_TAB_WALLET,
    PatchId.MAIN_TAB_SHOPPING,
    PatchId.MAIN_TAB_MINI,
)

private val VISIBLE_BUTTON_POSITION_HOOK = ImmutableMethodReference(
    MAIN_TAB_HOOKS,
    "visibleButtonPosition",
    listOf(ENUM, INTEGER),
    INTEGER,
)
private val KEEPS_WALLET_TOOLTIP_HOOK = ImmutableMethodReference(
    MAIN_TAB_HOOKS,
    "keepsWalletTooltip",
    listOf("Z"),
    "Z",
)
private val VISIBLE_TAB_POSITION_HOOK = ImmutableMethodReference(
    MAIN_TAB_HOOKS,
    "visibleTabPosition",
    listOf(LIST, "I"),
    "I",
)
private val VISIBLE_TAB_HOOK = ImmutableMethodReference(
    MAIN_TAB_HOOKS,
    "visibleTab",
    listOf(ENUM, ENUM),
    ENUM,
)

/**
 * 下部ボタンの descriptor enum（26.16.0 では `ng8.e`）。
 *
 * <p>難読化された class 名には依存せず、`<clinit>` が読む enum 要素の名前と、各ボタンの resource ID
 * （`bnb_timeline` など）の並びで特定します。</p>
 */
private val mainTabDescriptorFingerprint = Fingerprint(
    name = "<clinit>",
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    strings = listOf("TIMELINE", "NEWS", "NEWS_ROW", "WALLET", "MINI", "COMMERCE", "COMMERCE_TW"),
    filters = listOf(
        fieldAccess(name = "VOOM", opcode = Opcode.SGET_OBJECT),
        literal(0x7f0b03cf), // id/bnb_timeline
        fieldAccess(name = "NEWS", opcode = Opcode.SGET_OBJECT),
        literal(0x7f0b03c9), // id/bnb_news
        fieldAccess(name = "NEWS_ROW", opcode = Opcode.SGET_OBJECT),
        literal(0x7f0b03ca), // id/bnb_news_row
        fieldAccess(name = "WALLET", opcode = Opcode.SGET_OBJECT),
        literal(0x7f0b03d1), // id/bnb_wallet
        fieldAccess(name = "MINI", opcode = Opcode.SGET_OBJECT),
        literal(0x7f0b03c7), // id/bnb_mini
        fieldAccess(name = "COMMERCE", opcode = Opcode.SGET_OBJECT),
        literal(0x7f0b03bd), // id/bnb_commerce
        fieldAccess(name = "COMMERCE_TW", opcode = Opcode.SGET_OBJECT),
        literal(0x7f0b03bf), // id/bnb_commerce_tw
    ),
    custom = { _, classDef -> classDef.superclass == ENUM },
)

private fun buttonControllerFingerprint(descriptorType: String) = Fingerprint(
    name = "<init>",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf(
        "L",
        "Ljp/naver/line/android/activity/main/MainBottomNavigationStateViewModel;",
        "L",
        "Landroid/view/View;",
        "L",
        LIST,
        "L",
        "L",
    ),
    filters = listOf(
        fieldAccess(definingClass = "this", type = LIST, opcode = Opcode.IPUT_OBJECT),
        methodCall(
            definingClass = descriptorType,
            name = "values",
            returnType = "[L",
            opcode = Opcode.INVOKE_STATIC,
        ),
    ),
)

/** タブ管理（26.16.0 では `MainActivityTabManager`）の constructor。保存した位置の Bundle key で特定します。 */
private val tabManagerConstructorFingerprint = Fingerprint(
    name = "<init>",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    strings = listOf(POSITION_BUNDLE_KEY),
)

/** 他の画面から指定したタブを開く、タブ管理の method。intent の extra 名で特定します。 */
private fun tabRequestFingerprint(tabManagerType: String) = Fingerprint(
    returnType = "V",
    parameters = listOf("L", INTENT),
    strings = listOf("intentNavigateParam", "WALLET_MODULE_RECEIVED_SCHEME", "TIMELINE_NAVIGATION"),
    custom = { method, _ -> method.definingClass == tabManagerType },
)

private fun Instruction.fieldReference(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.methodReference(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun registerWidth(type: String): Int = if (type == "J" || type == "D") 2 else 1

/** 下部ボタンの constructor で、ボタンごとの位置を取り出す `check-cast` の直後。 */
internal data class ButtonPositionSite(
    val insertIndex: Int,
    val buttonRegister: Int,
    val positionRegister: Int,
)

/**
 * `descriptor.values()` の各要素 `vE` に対し、`own.map.get(vE)` の結果を `Integer` へ cast する箇所の直後を返します。
 *
 * <p>`vE` を取り出す `aget-object` の配列は、直前の定義が `descriptor.values()` の結果であることを
 * 確かめます。注入位置が分岐先や例外 handler の先頭だと、その経路だけが hook を飛ばすため拒否します。</p>
 */
internal fun buttonPositionSite(
    instructions: List<Instruction>,
    descriptorType: String,
    ownType: String,
    handlerAddresses: Set<Int> = emptySet(),
): ButtonPositionSite? {
    val sites = (0..instructions.size - 5).mapNotNull { index ->
        val element = instructions[index] as? ThreeRegisterInstruction ?: return@mapNotNull null
        val mapLoad = instructions[index + 1] as? TwoRegisterInstruction ?: return@mapNotNull null
        val lookup = instructions[index + 2] as? FiveRegisterInstruction ?: return@mapNotNull null
        val lookupResult = instructions[index + 3] as? OneRegisterInstruction ?: return@mapNotNull null
        val cast = instructions[index + 4] as? OneRegisterInstruction ?: return@mapNotNull null
        val mapField = mapLoad.fieldReference()
        val lookupMethod = lookup.methodReference()
        val castType = (cast as? ReferenceInstruction)?.reference as? TypeReference

        val matches = element.opcode == Opcode.AGET_OBJECT &&
            mapLoad.opcode == Opcode.IGET_OBJECT &&
            mapField?.definingClass == ownType &&
            mapField.type == LINKED_HASH_MAP &&
            lookup.opcode == Opcode.INVOKE_VIRTUAL &&
            lookup.registerCount == 2 &&
            lookup.registerC == mapLoad.registerA &&
            lookup.registerD == element.registerA &&
            lookupMethod?.name == "get" &&
            lookupMethod.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;") &&
            lookupMethod.returnType == "Ljava/lang/Object;" &&
            lookupResult.opcode == Opcode.MOVE_RESULT_OBJECT &&
            cast.opcode == Opcode.CHECK_CAST &&
            castType?.type == INTEGER &&
            cast.registerA == lookupResult.registerA &&
            element.registerA != cast.registerA &&
            element.registerA <= MAX_NON_RANGE_REGISTER &&
            cast.registerA <= MAX_NON_RANGE_REGISTER &&
            isDescriptorValuesArray(instructions, index, element.registerB, descriptorType) &&
            !isDivertedInjectionIndex(instructions, index + 5, handlerAddresses)
        if (matches) ButtonPositionSite(index + 5, element.registerA, cast.registerA) else null
    }
    return sites.singleOrNull()
}

/** [index] より前で [arrayRegister] を最後に書いたのが `descriptor.values()` の結果かどうか。 */
private fun isDescriptorValuesArray(
    instructions: List<Instruction>,
    index: Int,
    arrayRegister: Int,
    descriptorType: String,
): Boolean {
    val writer = (index - 1 downTo 0).firstOrNull { instructionWritesRegister(instructions[it], arrayRegister) }
        ?: return false
    if (instructions[writer].opcode != Opcode.MOVE_RESULT_OBJECT || writer == 0) {
        return false
    }
    val call = instructions[writer - 1]
    val method = call.methodReference()
    return call.opcode == Opcode.INVOKE_STATIC &&
        method?.definingClass == descriptorType &&
        method.name == "values" &&
        method.parameterTypes.isEmpty()
}

/** ウォレットボタンに紐づく tooltip を作るかどうかを決める `if-eqz` の直前。 */
internal data class WalletTooltipSite(
    val insertIndex: Int,
    val resultRegister: Int,
)

/**
 * `this.<tabs>.contains(WALLET)` の結果を分岐する `if-eqz` を返します。
 *
 * <p>`WALLET` は下部タブ enum（descriptor とは別の型）の定数で、定義 class と同じ型の field です。</p>
 */
internal fun walletTooltipSite(
    instructions: List<Instruction>,
    descriptorType: String,
    ownType: String,
    handlerAddresses: Set<Int> = emptySet(),
): WalletTooltipSite? {
    val sites = (0..instructions.size - 5).mapNotNull { index ->
        val tabsLoad = instructions[index] as? TwoRegisterInstruction ?: return@mapNotNull null
        val walletInstruction = instructions[index + 1]
        val walletLoad = walletInstruction as? OneRegisterInstruction ?: return@mapNotNull null
        val contains = instructions[index + 2] as? FiveRegisterInstruction ?: return@mapNotNull null
        val containsResult = instructions[index + 3] as? OneRegisterInstruction ?: return@mapNotNull null
        val branch = instructions[index + 4] as? OneRegisterInstruction ?: return@mapNotNull null
        val tabsField = tabsLoad.fieldReference()
        val walletField = walletInstruction.fieldReference()
        val containsMethod = contains.methodReference()

        val matches = tabsLoad.opcode == Opcode.IGET_OBJECT &&
            tabsField?.definingClass == ownType &&
            tabsField.type == LIST &&
            walletLoad.opcode == Opcode.SGET_OBJECT &&
            walletField?.name == "WALLET" &&
            walletField.definingClass != descriptorType &&
            walletField.type == walletField.definingClass &&
            contains.opcode == Opcode.INVOKE_INTERFACE &&
            contains.registerCount == 2 &&
            contains.registerC == tabsLoad.registerA &&
            contains.registerD == walletLoad.registerA &&
            containsMethod?.definingClass == LIST &&
            containsMethod.name == "contains" &&
            containsMethod.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;") &&
            containsMethod.returnType == "Z" &&
            containsResult.opcode == Opcode.MOVE_RESULT &&
            branch.opcode == Opcode.IF_EQZ &&
            branch.registerA == containsResult.registerA &&
            containsResult.registerA <= MAX_NON_RANGE_REGISTER &&
            !isDivertedInjectionIndex(instructions, index + 4, handlerAddresses)
        if (matches) WalletTooltipSite(index + 4, containsResult.registerA) else null
    }
    return sites.singleOrNull()
}

/** タブ管理の constructor で、復元した位置を `this` の field へ保存する `iput`。 */
internal data class RestoredPositionSite(
    val storeIndex: Int,
    val tabsRegister: Int,
    val positionRegister: Int,
    val thisRegister: Int,
    val positionField: FieldReference,
    /** `store` の直後に呼ばれる、位置からタブを返す method（26.16.0 では `mg8.d.e(int)`）。 */
    val tabAtPosition: MethodReference,
)

/**
 * 保存した位置（または指定タブの位置）を `this` へ保存する `iput` を返します。
 *
 * <p>一覧は、下部ボタンの constructor へ渡す List と同じ register から読みます。`iput` は分岐の合流先なので、
 * 手前へ挿入せず、`iput` 自体を hook の呼び出しへ置き換えます。</p>
 */
internal fun restoredPositionSite(
    instructions: List<Instruction>,
    ownType: String,
    buttonControllerType: String,
): RestoredPositionSite? {
    val buttonControllerCall = instructions.withIndex().filter { (_, instruction) ->
        val method = instruction.methodReference()
        instruction.opcode == Opcode.INVOKE_DIRECT_RANGE &&
            method?.definingClass == buttonControllerType &&
            method.name == "<init>"
    }.singleOrNull() ?: return null
    val callIndex = buttonControllerCall.index
    val callMethod = buttonControllerCall.value.methodReference() ?: return null
    val callParameters = callMethod.parameterTypes.map { it.toString() }
    val listParameter = callParameters.withIndex().filter { it.value == LIST }.singleOrNull() ?: return null
    val range = buttonControllerCall.value as? RegisterRangeInstruction ?: return null
    val tabsRegister = range.startRegister + 1 + callParameters.take(listParameter.index).sumOf(::registerWidth)

    val keyIndex = instructions.withIndex().filter { (index, instruction) ->
        index > callIndex &&
            instruction.opcode == Opcode.CONST_STRING &&
            ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == POSITION_BUNDLE_KEY
    }.singleOrNull()?.index ?: return null

    val storeIndex = (keyIndex + 1 until instructions.size).firstOrNull { instructions[it].opcode == Opcode.IPUT }
        ?: return null
    val store = instructions[storeIndex] as? TwoRegisterInstruction ?: return null
    val positionField = store.fieldReference() ?: return null
    val lookup = instructions.getOrNull(storeIndex + 1) as? FiveRegisterInstruction ?: return null
    val lookupMethod = lookup.methodReference() ?: return null

    val matches = positionField.definingClass == ownType &&
        positionField.type == "I" &&
        lookup.opcode == Opcode.INVOKE_VIRTUAL &&
        lookup.registerCount == 2 &&
        lookup.registerD == store.registerA &&
        lookupMethod.parameterTypes.map { it.toString() } == listOf("I") &&
        lookupMethod.returnType.startsWith("L") &&
        tabsRegister in 0..MAX_NON_RANGE_REGISTER &&
        store.registerA in 0..MAX_NON_RANGE_REGISTER &&
        (callIndex + 1 until storeIndex).none { instructionWritesRegister(instructions[it], tabsRegister) }
    return if (matches) {
        RestoredPositionSite(
            storeIndex = storeIndex,
            tabsRegister = tabsRegister,
            positionRegister = store.registerA,
            thisRegister = store.registerB,
            positionField = positionField,
            tabAtPosition = lookupMethod,
        )
    } else {
        null
    }
}

/** タブを開く method の先頭。 */
internal data class TabRequestSite(
    val thisRegister: Int,
    val tabRegister: Int,
    val tabsProviderField: FieldReference,
    val tabType: String,
)

/**
 * 開こうとするタブ（引数）が、元の一覧の位置へ変換される method の先頭を返します。
 *
 * <p>先頭では引数以外の register がまだ何も持っていないため、v0 と v1 を一時領域に使えます。</p>
 *
 * @param parameterTypes `this` を除く引数の型。先頭はタブ enum です。
 * @param tabAtPosition `restoredPositionSite` が見つけた、位置からタブを返す method
 */
internal fun tabRequestSite(
    instructions: List<Instruction>,
    registerCount: Int,
    parameterTypes: List<String>,
    ownType: String,
    tabAtPosition: MethodReference,
    handlerAddresses: Set<Int> = emptySet(),
): TabRequestSite? {
    val tabType = parameterTypes.firstOrNull() ?: return null
    val thisRegister = registerCount - (1 + parameterTypes.sumOf(::registerWidth))
    val tabRegister = thisRegister + 1
    if (
        parameterTypes.size != 2 ||
        thisRegister < 2 ||
        tabRegister > MAX_NON_RANGE_REGISTER ||
        tabAtPosition.returnType != tabType ||
        isDivertedInjectionIndex(instructions, 0, handlerAddresses)
    ) {
        return null
    }

    val positionLookups = instructions.withIndex().filter { (index, instruction) ->
        val method = instruction.methodReference()
        val lookup = instruction as? FiveRegisterInstruction
        val providerLoad = instructions.getOrNull(index - 1) as? TwoRegisterInstruction
        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            lookup?.registerCount == 2 &&
            lookup.registerD == tabRegister &&
            method?.definingClass == tabAtPosition.definingClass &&
            method.parameterTypes.map { it.toString() } == listOf(tabType) &&
            method.returnType == "I" &&
            providerLoad?.opcode == Opcode.IGET_OBJECT &&
            providerLoad.registerA == lookup.registerC &&
            providerLoad.registerB == thisRegister &&
            providerLoad.fieldReference()?.definingClass == ownType &&
            providerLoad.fieldReference()?.type == tabAtPosition.definingClass
    }
    val providerField = positionLookups.singleOrNull()
        ?.let { (instructions[it.index - 1] as TwoRegisterInstruction).fieldReference() }
        ?: return null
    return TabRequestSite(thisRegister, tabRegister, providerField, tabType)
}

/**
 * ボタンの位置を取り出した直後へ、`positionRegister = hook(button, positionRegister)` を挿入します。
 */
internal fun hideButtonAtPosition(implementation: MutableMethodImplementation, site: ButtonPositionSite) {
    implementation.addInstruction(
        site.insertIndex,
        BuilderInstruction35c(
            Opcode.INVOKE_STATIC, 2, site.buttonRegister, site.positionRegister, 0, 0, 0,
            VISIBLE_BUTTON_POSITION_HOOK,
        ),
    )
    implementation.addInstruction(
        site.insertIndex + 1,
        BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, site.positionRegister),
    )
}

/** `contains(WALLET)` の結果を、`if-eqz` の前に hook へ通します。 */
internal fun gateWalletTooltip(implementation: MutableMethodImplementation, site: WalletTooltipSite) {
    implementation.addInstruction(
        site.insertIndex,
        BuilderInstruction35c(
            Opcode.INVOKE_STATIC, 1, site.resultRegister, 0, 0, 0, 0, KEEPS_WALLET_TOOLTIP_HOOK,
        ),
    )
    implementation.addInstruction(site.insertIndex + 1, BuilderInstruction11x(Opcode.MOVE_RESULT, site.resultRegister))
}

/**
 * 位置の `iput` を `position = hook(tabs, position)` と、同じ field への `iput` に置き換えます。
 *
 * <p>`iput` は分岐の合流先です。手前へ挿入すると分岐した経路だけが hook を飛び越すため、同じ位置の命令を
 * 置き換えて、分岐先の label が hook を指すようにします。</p>
 */
internal fun redirectRestoredPosition(implementation: MutableMethodImplementation, site: RestoredPositionSite) {
    implementation.replaceInstruction(
        site.storeIndex,
        BuilderInstruction35c(
            Opcode.INVOKE_STATIC, 2, site.tabsRegister, site.positionRegister, 0, 0, 0, VISIBLE_TAB_POSITION_HOOK,
        ),
    )
    implementation.addInstruction(
        site.storeIndex + 1,
        BuilderInstruction11x(Opcode.MOVE_RESULT, site.positionRegister),
    )
    implementation.addInstruction(
        site.storeIndex + 2,
        BuilderInstruction22c(Opcode.IPUT, site.positionRegister, site.thisRegister, site.positionField),
    )
}

/**
 * method の先頭で `tab = hook(tab, tabAtPosition(0))` を実行し、`tab` を元の型へ戻します。
 *
 * <p>隠すタブなら、元の一覧の先頭（ホーム）を開く要求になります。以降の処理（intent の extra、遷移後の
 * イベント）もすべてホームの要求として進むため、隠したタブ向けの副作用が残りません。</p>
 */
internal fun redirectRequestedTab(
    implementation: MutableMethodImplementation,
    site: TabRequestSite,
    tabAtPosition: MethodReference,
) {
    val instructions = listOf(
        BuilderInstruction22c(Opcode.IGET_OBJECT, 0, site.thisRegister, site.tabsProviderField),
        BuilderInstruction11n(Opcode.CONST_4, 1, 0),
        BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 0, 1, 0, 0, 0, tabAtPosition),
        BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
        BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, site.tabRegister, 0, 0, 0, 0, VISIBLE_TAB_HOOK),
        BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, site.tabRegister),
        BuilderInstruction21c(Opcode.CHECK_CAST, site.tabRegister, ImmutableTypeReference(site.tabType)),
    )
    instructions.forEachIndexed { index, instruction -> implementation.addInstruction(index, instruction) }
}

/**
 * 同じ method への挿入を、注入前の index が大きいものから順に適用します。後ろの挿入は前の index を
 * ずらさないため、各 site が持つ注入前の index をそのまま使えます。
 */
internal fun applyEditsFromLast(vararg edits: Pair<Int, () -> Unit>) {
    edits.sortedByDescending { (index, _) -> index }.forEach { (_, edit) -> edit() }
}

val mainTabsPatch = bytecodePatch(
    name = "Bottom tabs",
    description = "下部タブから VOOM を取り除き、ショッピング・ニュース・ウォレット・アプリも実行時設定で個別に取り除けるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(premiumUnsendPromotionPatch)

    execute {
        val descriptorMatches = mainTabDescriptorFingerprint.matchAllOrNull().orEmpty()
        if (descriptorMatches.size != 1) {
            recordUnappliedFeatureStatus(
                mainTabPatchIds, TARGET_COUNT, descriptorMatches.size, "MainTabDescriptorNotUnique",
            )
            return@execute
        }
        val descriptorType = descriptorMatches.single().originalClassDef.type

        val buttonMatches = buttonControllerFingerprint(descriptorType).matchAllOrNull().orEmpty()
        if (buttonMatches.size != 1) {
            recordUnappliedFeatureStatus(
                mainTabPatchIds, TARGET_COUNT, buttonMatches.size, "MainTabButtonConstructorNotUnique",
            )
            return@execute
        }
        val buttonMethod = buttonMatches.single().method

        val managerMatches = tabManagerConstructorFingerprint.matchAllOrNull().orEmpty()
        if (managerMatches.size != 1) {
            recordUnappliedFeatureStatus(
                mainTabPatchIds, TARGET_COUNT, managerMatches.size, "MainTabManagerConstructorNotUnique",
            )
            return@execute
        }
        val managerMethod = managerMatches.single().method
        val managerType = managerMethod.definingClass

        val requestMatches = tabRequestFingerprint(managerType).matchAllOrNull().orEmpty()
        if (requestMatches.size != 1) {
            recordUnappliedFeatureStatus(
                mainTabPatchIds, TARGET_COUNT, requestMatches.size, "MainTabRequestMethodNotUnique",
            )
            return@execute
        }
        val requestMethod = requestMatches.single().method

        val pageFactoryMatches = tabPageFactoryFingerprint.matchAllOrNull().orEmpty()
        if (pageFactoryMatches.size != 1) {
            recordUnappliedFeatureStatus(
                mainTabPatchIds, TARGET_COUNT, pageFactoryMatches.size, "MainTabPageFactoryNotUnique",
            )
            return@execute
        }
        val pageFactoryMethod = pageFactoryMatches.single().method
        val pageIdMatches = tabPageIdFingerprint(pageFactoryMethod.definingClass).matchAllOrNull().orEmpty()
        if (pageIdMatches.size != 1) {
            recordUnappliedFeatureStatus(
                mainTabPatchIds, TARGET_COUNT, pageIdMatches.size, "MainTabPageIdNotUnique",
            )
            return@execute
        }
        val pageIdMethod = pageIdMatches.single().method
        val pageMatches = pageSelectedFingerprint(managerType).matchAllOrNull().orEmpty()
        if (pageMatches.size != 1) {
            recordUnappliedFeatureStatus(
                mainTabPatchIds, TARGET_COUNT, pageMatches.size, "MainTabPageSelectedNotUnique",
            )
            return@execute
        }
        val pageMethod = pageMatches.single().method

        val buttonImplementation = buttonMethod.implementation
        val managerImplementation = managerMethod.implementation
        val requestImplementation = requestMethod.implementation
        val buttonInstructions = buttonImplementation?.instructions?.toList().orEmpty()
        val buttonHandlers = buttonImplementation?.let(::exceptionHandlerAddresses).orEmpty()

        val buttonSite = buttonPositionSite(buttonInstructions, descriptorType, buttonMethod.definingClass, buttonHandlers)
        val walletSite = walletTooltipSite(buttonInstructions, descriptorType, buttonMethod.definingClass, buttonHandlers)
        val positionSite = managerImplementation?.let {
            restoredPositionSite(it.instructions.toList(), managerType, buttonMethod.definingClass)
        }
        val requestSite = if (requestImplementation != null && positionSite != null) {
            tabRequestSite(
                requestImplementation.instructions.toList(),
                requestImplementation.registerCount,
                requestMethod.parameterTypes.map { it.toString() },
                managerType,
                positionSite.tabAtPosition,
                exceptionHandlerAddresses(requestImplementation),
            )
        } else {
            null
        }

        val pageFactoryImplementation = pageFactoryMethod.implementation
        val pageIdImplementation = pageIdMethod.implementation
        val pageFactorySite = pageFactoryImplementation?.let {
            tabPageFactorySite(
                it.instructions.toList(),
                it.registerCount,
                pageFactoryMethod.parameterTypes.map { type -> type.toString() },
                pageFactoryMethod.returnType,
                pageFactoryMethod.definingClass,
                exceptionHandlerAddresses(it),
            )
        }
        val pageIdSite = if (pageIdImplementation != null && pageFactorySite != null) {
            tabPageIdSite(
                pageIdImplementation.instructions.toList(),
                pageIdImplementation.registerCount,
                pageIdMethod.parameterTypes.map { it.toString() },
                pageFactoryMethod.definingClass,
                pageFactorySite.tabsField,
            )
        } else {
            null
        }
        val placeholderConstructible = pageFactorySite != null &&
            isInstantiablePlaceholder(classDefByOrNull(pageFactorySite.fragmentType))
        val pageImplementation = pageMethod.implementation
        val pageSite = if (pageImplementation != null && positionSite != null && requestSite != null) {
            restoredPageSite(
                pageImplementation.instructions.toList(),
                pageImplementation.registerCount,
                pageMethod.parameterTypes.map { it.toString() },
                viewPagerAccess(
                    managerMatches.single().originalClassDef.methods
                        .flatMap { method -> method.implementation?.instructions?.toList().orEmpty() },
                    managerType,
                ),
                requestSite.tabsProviderField,
                positionSite.tabAtPosition,
                exceptionHandlerAddresses(pageImplementation),
            )
        } else {
            null
        }

        // 一か所でも形が合わなければ、何も書き換えません。
        if (
            buttonImplementation == null || managerImplementation == null || requestImplementation == null ||
            buttonSite == null || walletSite == null || positionSite == null || requestSite == null ||
            pageFactoryImplementation == null || pageIdImplementation == null ||
            pageFactorySite == null || pageIdSite == null || !placeholderConstructible ||
            pageImplementation == null || pageSite == null ||
            walletSite.insertIndex == buttonSite.insertIndex
        ) {
            recordUnsafeFeatureStatus(mainTabPatchIds, TARGET_COUNT, TARGET_COUNT, "MainTabInjectionShapeMismatch")
            return@execute
        }

        // 同じ method では後ろの位置から書き換え、前の index がずれないようにします。
        // wallet と button の前後関係は仮定せず、実際の index から順序を決めます。
        applyEditsFromLast(
            walletSite.insertIndex to { gateWalletTooltip(buttonImplementation, walletSite) },
            buttonSite.insertIndex to { hideButtonAtPosition(buttonImplementation, buttonSite) },
        )
        redirectRestoredPosition(managerImplementation, positionSite)
        redirectRequestedTab(requestImplementation, requestSite, positionSite.tabAtPosition)
        placeholderForHiddenPage(pageFactoryImplementation, pageFactorySite)
        separateHiddenPageId(pageIdImplementation, pageIdSite)
        resetHiddenPage(pageImplementation, pageSite)
        recordFeatureStatus(mainTabPatchIds, TARGET_COUNT, TARGET_COUNT, "MainTabButtonsHiddenAndRequestsRedirected")
    }
}

package dev.utaa.linimal.patches.features.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex

private const val LIST = "Ljava/util/List;"
private const val ENUM = "Ljava/lang/Enum;"
private const val MAIN_TAB_HOOKS = "Ldev/utaa/linimal/extension/features/MainTabHooks;"
private const val MAX_NON_RANGE_REGISTER = 15

/** ViewPager の page を作る method と page の id を返す method の 2 件。 */
internal const val MAIN_TAB_PAGE_TARGET_COUNT = 2

private val HIDES_PAGE_HOOK = ImmutableMethodReference(MAIN_TAB_HOOKS, "hidesPage", listOf(LIST, "I"), "Z")
private val PAGE_ITEM_ORDINAL_HOOK = ImmutableMethodReference(MAIN_TAB_HOOKS, "pageItemOrdinal", listOf(ENUM), "I")

/**
 * ViewPager の adapter（26.16.0 では `mg8.p0`）で、位置から page（Fragment）を作る method。
 *
 * <p>難読化された名前には依存せず、ウォレットとアプリの page が共有する引数名 `isMiniTabMode` と、
 * `int` を取って Fragment 型を返す形で特定します。</p>
 */
internal val tabPageFactoryFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = listOf("I"),
    strings = listOf("isMiniTabMode"),
    filters = listOf(
        methodCall(definingClass = LIST, name = "get", opcode = Opcode.INVOKE_INTERFACE),
    ),
)

/** [tabPageFactoryFingerprint] と同じ adapter で、位置から page の id（tag の一部）を返す method。 */
internal fun tabPageIdFingerprint(adapterType: String) = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "J",
    parameters = listOf("I"),
    filters = listOf(
        methodCall(definingClass = ENUM, name = "ordinal", returnType = "I", opcode = Opcode.INVOKE_VIRTUAL),
    ),
    custom = { method, _ -> method.definingClass == adapterType },
)

private fun Instruction.fieldReference(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.methodReference(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun isListGet(instruction: Instruction?, listRegister: Int, positionRegister: Int): Boolean {
    val call = instruction as? FiveRegisterInstruction ?: return false
    val method = call.methodReference()
    return call.opcode == Opcode.INVOKE_INTERFACE &&
        call.registerCount == 2 &&
        call.registerC == listRegister &&
        call.registerD == positionRegister &&
        method?.definingClass == LIST &&
        method.name == "get" &&
        method.parameterTypes.map { it.toString() } == listOf("I") &&
        method.returnType == "Ljava/lang/Object;"
}

/** page を作る method の先頭。 */
internal data class TabPageFactorySite(
    val thisRegister: Int,
    val positionRegister: Int,
    val scratchRegister: Int,
    val tabsField: FieldReference,
    val fragmentType: String,
)

/**
 * page を作る method の先頭を返します。先頭は `this.tabs.get(position)` で、引数以外の register は
 * まだ何も持っていないため、v0 を一時領域に使えます。
 *
 * @param parameterTypes `this` を除く引数の型。`int` 1 つだけを取ります。
 * @param returnType Fragment 基底型。隠す page では、この型そのものを `new-instance` で返します。
 */
internal fun tabPageFactorySite(
    instructions: List<Instruction>,
    registerCount: Int,
    parameterTypes: List<String>,
    returnType: String,
    ownType: String,
    handlerAddresses: Set<Int> = emptySet(),
): TabPageFactorySite? {
    val thisRegister = registerCount - 2
    val positionRegister = thisRegister + 1
    val tabsLoad = instructions.getOrNull(0) as? TwoRegisterInstruction ?: return null
    val tabsField = tabsLoad.fieldReference()
    if (
        parameterTypes != listOf("I") ||
        !returnType.startsWith("L") || !returnType.endsWith(";") ||
        thisRegister < 1 ||
        positionRegister > MAX_NON_RANGE_REGISTER ||
        tabsLoad.opcode != Opcode.IGET_OBJECT ||
        tabsLoad.registerB != thisRegister ||
        tabsField?.definingClass != ownType ||
        tabsField.type != LIST ||
        !isListGet(instructions.getOrNull(1), tabsLoad.registerA, positionRegister) ||
        isDivertedInjectionIndex(instructions, 0, handlerAddresses)
    ) {
        return null
    }
    return TabPageFactorySite(thisRegister, positionRegister, 0, tabsField, returnType)
}

/** Fragment 基底型を、引数なしの constructor で作れるかどうか。abstract や interface なら作れません。 */
internal fun isInstantiablePlaceholder(classDef: ClassDef?): Boolean {
    if (classDef == null) {
        return false
    }
    val flags = classDef.accessFlags
    if (flags and (AccessFlags.ABSTRACT.value or AccessFlags.INTERFACE.value) != 0) {
        return false
    }
    return classDef.methods.any { method ->
        method.name == "<init>" &&
            method.parameterTypes.isEmpty() &&
            method.returnType == "V" &&
            method.accessFlags and AccessFlags.PUBLIC.value != 0
    }
}

/** page の id を作る `Enum.ordinal()` の呼び出し。 */
internal data class TabPageIdSite(
    val ordinalIndex: Int,
    val tabRegister: Int,
)

/**
 * `this.tabs.get(position)` を cast して `ordinal()` を呼ぶ箇所を返します。一覧は `this` から読み、`get` には
 * position 引数を渡していなければなりません。[tabsField] は
 * [tabPageFactorySite] が見つけた、page を作る method と同じ一覧でなければなりません。
 */
internal fun tabPageIdSite(
    instructions: List<Instruction>,
    registerCount: Int,
    parameterTypes: List<String>,
    ownType: String,
    tabsField: FieldReference,
): TabPageIdSite? {
    val thisRegister = registerCount - 2
    val positionRegister = thisRegister + 1
    if (parameterTypes != listOf("I") || thisRegister < 0 || positionRegister > MAX_NON_RANGE_REGISTER) {
        return null
    }
    val sites = instructions.indices.mapNotNull { index ->
        val ordinal = instructions[index] as? FiveRegisterInstruction ?: return@mapNotNull null
        val method = ordinal.methodReference()
        val result = instructions.getOrNull(index + 1) as? OneRegisterInstruction
        val cast = instructions.getOrNull(index - 1) as? OneRegisterInstruction
        val castType = (cast as? ReferenceInstruction)?.reference as? TypeReference
        val element = instructions.getOrNull(index - 2) as? OneRegisterInstruction
        val get = instructions.getOrNull(index - 3)
        val tabsLoad = instructions.getOrNull(index - 4) as? TwoRegisterInstruction
        val matches = ordinal.opcode == Opcode.INVOKE_VIRTUAL &&
            ordinal.registerCount == 1 &&
            method?.definingClass == ENUM &&
            method.name == "ordinal" &&
            method.parameterTypes.isEmpty() &&
            method.returnType == "I" &&
            result?.opcode == Opcode.MOVE_RESULT &&
            cast?.opcode == Opcode.CHECK_CAST &&
            castType != null &&
            cast.registerA == ordinal.registerC &&
            element?.opcode == Opcode.MOVE_RESULT_OBJECT &&
            element.registerA == cast.registerA &&
            ordinal.registerC <= MAX_NON_RANGE_REGISTER &&
            tabsLoad?.opcode == Opcode.IGET_OBJECT &&
            tabsLoad.registerB == thisRegister &&
            tabsLoad.fieldReference()?.definingClass == ownType &&
            tabsLoad.fieldReference()?.name == tabsField.name &&
            tabsLoad.fieldReference()?.type == LIST &&
            isListGet(get, tabsLoad.registerA, positionRegister)
        if (matches) TabPageIdSite(index, ordinal.registerC) else null
    }
    return sites.singleOrNull()
}

/**
 * method の先頭へ `if (hidesPage(tabs, position)) return new Fragment();` を挿入します。
 *
 * <p>隠すタブの page は、中身のない Fragment（view を持たず、通信もしない）になります。以降の処理は
 * 元の method のままです。</p>
 */
internal fun placeholderForHiddenPage(implementation: MutableMethodImplementation, site: TabPageFactorySite) {
    val scratch = site.scratchRegister
    implementation.addInstruction(0, BuilderInstruction22c(Opcode.IGET_OBJECT, scratch, site.thisRegister, site.tabsField))
    implementation.addInstruction(
        1,
        BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, scratch, site.positionRegister, 0, 0, 0, HIDES_PAGE_HOOK),
    )
    implementation.addInstruction(2, BuilderInstruction11x(Opcode.MOVE_RESULT, scratch))
    implementation.addInstruction(
        3,
        BuilderInstruction21c(Opcode.NEW_INSTANCE, scratch, ImmutableTypeReference(site.fragmentType)),
    )
    implementation.addInstruction(
        4,
        BuilderInstruction35c(
            Opcode.INVOKE_DIRECT, 1, scratch, 0, 0, 0, 0,
            ImmutableMethodReference(site.fragmentType, "<init>", emptyList(), "V"),
        ),
    )
    implementation.addInstruction(5, BuilderInstruction11x(Opcode.RETURN_OBJECT, scratch))
    // 6 番目が元の先頭の命令。隠さないときはここへ進みます。
    val original = implementation.newLabelForIndex(6)
    implementation.addInstruction(3, BuilderInstruction21t(Opcode.IF_EQZ, scratch, original))
}

/** `tab.ordinal()` を、隠す page だけ別の値を返す hook に置き換えます。 */
internal fun separateHiddenPageId(implementation: MutableMethodImplementation, site: TabPageIdSite) {
    implementation.replaceInstruction(
        site.ordinalIndex,
        BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, site.tabRegister, 0, 0, 0, 0, PAGE_ITEM_ORDINAL_HOOK),
    )
}

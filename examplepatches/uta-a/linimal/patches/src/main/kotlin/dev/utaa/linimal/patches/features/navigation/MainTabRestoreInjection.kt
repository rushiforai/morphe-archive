package dev.utaa.linimal.patches.features.navigation

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex

private const val ENUM_TYPE = "Ljava/lang/Enum;"
private const val VIEW_PAGER = "Landroidx/viewpager/widget/ViewPager;"
private const val RESTORE_HOOKS = "Ldev/utaa/linimal/extension/features/MainTabHooks;"

/** 非 range の `invoke` に渡せる register の上限（v15）。 */
private const val MAX_RESTORE_REGISTER = 15

private val RESETS_HIDDEN_PAGE_HOOK = ImmutableMethodReference(
    RESTORE_HOOKS,
    "resetsHiddenPage",
    listOf(ENUM_TYPE, "I"),
    "Z",
)

/**
 * ページが選ばれたときの通知（`ViewPager.OnPageChangeListener.onPageSelected`、26.16.0 では
 * `MainActivityTabManager.I(int)`）。ViewPager 自身が復元した位置は LINE のコードを通らないため、
 * 隠したページはこの通知で初めて分かります。`Button does not exist at position` の文字列で特定します。
 */
internal fun pageSelectedFingerprint(managerType: String) = Fingerprint(
    returnType = "V",
    parameters = listOf("I"),
    strings = listOf("Button does not exist at position"),
    custom = { method, _ -> method.definingClass == managerType },
)

/** 隠したページが選ばれたとき、ページ 0 へ戻す注入先。 */
internal data class RestoredPageSite(
    val thisRegister: Int,
    val positionRegister: Int,
    val viewPagerField: FieldReference,
    val tabsProviderField: FieldReference,
    val tabAtPosition: MethodReference,
    /** `ViewPager.setCurrentItem(int, boolean)` に当たる、難読化された method（26.16.0 では `w`）。 */
    val setCurrentItem: MethodReference,
)

/**
 * タブ管理 class 全体の命令列から、ViewPager の field と `setCurrentItem(int, boolean)` を、それぞれ一意に
 * 見つけます。型は androidx の `ViewPager` で固定し、難読化された名前には頼りません。
 */
internal fun viewPagerAccess(
    classInstructions: List<Instruction>,
    ownType: String,
): Pair<FieldReference, MethodReference>? {
    val fields = classInstructions.filter { it.opcode == Opcode.IGET_OBJECT }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
        .filter { it.definingClass == ownType && it.type == VIEW_PAGER }
    val field = fields.firstOrNull()?.takeIf { first -> fields.all { it.name == first.name } } ?: return null
    val setters = classInstructions.filter { it.opcode == Opcode.INVOKE_VIRTUAL }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .filter {
            it.definingClass == VIEW_PAGER &&
                it.parameterTypes.map(CharSequence::toString) == listOf("I", "Z") &&
                it.returnType == "V"
        }
    val setter = setters.firstOrNull()?.takeIf { first -> setters.all { it.name == first.name } } ?: return null
    return field to setter
}

/**
 * ページ選択通知の先頭を検証します。先頭ではまだ locals を何も使っておらず、`v0` と `v1` を一時領域に
 * 使えます。`this` と position は非 range の `invoke` で渡すため、v15 以下であることも確かめます。
 */
internal fun restoredPageSite(
    instructions: List<Instruction>,
    registerCount: Int,
    parameterTypes: List<String>,
    viewPagerAccess: Pair<FieldReference, MethodReference>?,
    tabsProviderField: FieldReference?,
    tabAtPosition: MethodReference?,
    handlerAddresses: Set<Int> = emptySet(),
): RestoredPageSite? {
    if (parameterTypes != listOf("I") || viewPagerAccess == null || tabsProviderField == null || tabAtPosition == null) {
        return null
    }
    val thisRegister = registerCount - 2
    val positionRegister = thisRegister + 1
    if (
        thisRegister < 2 ||
        positionRegister > MAX_RESTORE_REGISTER ||
        tabAtPosition.parameterTypes.map(CharSequence::toString) != listOf("I") ||
        tabAtPosition.definingClass != tabsProviderField.type ||
        isDivertedInjectionIndex(instructions, 0, handlerAddresses)
    ) {
        return null
    }
    return RestoredPageSite(
        thisRegister = thisRegister,
        positionRegister = positionRegister,
        viewPagerField = viewPagerAccess.first,
        tabsProviderField = tabsProviderField,
        tabAtPosition = tabAtPosition,
        setCurrentItem = viewPagerAccess.second,
    )
}

/**
 * method の先頭で、選ばれたページのタブが隠すものなら ViewPager をページ 0 へ戻し、元の処理は実行せず戻ります。
 *
 * <p>`setCurrentItem(0, false)` は同じ通知を入れ子で呼び（ページ 0 は隠さない）、ボタンの選択や遷移イベントは
 * そちらが公式どおり処理します。元の処理まで進めると、隠したページを現在位置として記録してしまいます。
 * 隠さないページでは分岐で元の処理へ進み、何も変わりません。</p>
 */
internal fun resetHiddenPage(implementation: MutableMethodImplementation, site: RestoredPageSite) {
    val prologue = listOf(
        BuilderInstruction22c(Opcode.IGET_OBJECT, 0, site.thisRegister, site.tabsProviderField),
        BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 0, site.positionRegister, 0, 0, 0, site.tabAtPosition),
        BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
        BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 0, site.positionRegister, 0, 0, 0, RESETS_HIDDEN_PAGE_HOOK),
        BuilderInstruction11x(Opcode.MOVE_RESULT, 0),
    )
    // 分岐命令は prologue の直後に入れるため、先にそれ以外を並べて元の先頭命令の label を作ります。
    val reset = listOf(
        BuilderInstruction22c(Opcode.IGET_OBJECT, 1, site.thisRegister, site.viewPagerField),
        BuilderInstruction11n(Opcode.CONST_4, 0, 0),
        BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 3, 1, 0, 0, 0, 0, site.setCurrentItem),
        BuilderInstruction10x(Opcode.RETURN_VOID),
    )
    (prologue + reset).forEachIndexed { index, instruction -> implementation.addInstruction(index, instruction) }
    val original = implementation.newLabelForIndex(prologue.size + reset.size)
    implementation.addInstruction(prologue.size, BuilderInstruction21t(Opcode.IF_EQZ, 0, original))
}

package dev.utaa.linimal.patches.features.readwithoutreceipt

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.BOOLEAN
import dev.utaa.linimal.patches.util.INT
import dev.utaa.linimal.patches.util.OBJECT
import dev.utaa.linimal.patches.util.STRING
import dev.utaa.linimal.patches.util.VOID
import dev.utaa.linimal.patches.util.exceptionHandlerAddresses
import dev.utaa.linimal.patches.util.fallsThrough
import dev.utaa.linimal.patches.util.instructionWritesRegister
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex
import dev.utaa.linimal.patches.util.registerSurvivesBetween

private const val PREVIEW_EXTENSION_PACKAGE = "Ldev/utaa/linimal/extension/features/readwithoutreceipt"
private const val PREVIEW_ACTION_TYPE = "$PREVIEW_EXTENSION_PACKAGE/ReadWithoutReceiptAction;"
private const val PREVIEW_DISMISS_TYPE = "$PREVIEW_EXTENSION_PACKAGE/ReadWithoutReceiptPreviewDismiss;"
private const val PREVIEW_LABEL_TYPE = "$PREVIEW_EXTENSION_PACKAGE/ReadWithoutReceiptPreviewMenuLabel;"
private const val PREVIEW_ROW_TYPE = "$PREVIEW_EXTENSION_PACKAGE/ReadWithoutReceiptPreviewMenuRow;"
private const val PREVIEW_HOOKS_TYPE = "$PREVIEW_EXTENSION_PACKAGE/ChatListMenuHooks;"

private const val PREVIEW_SHOULD_SHOW_ROW = "$PREVIEW_HOOKS_TYPE->shouldShowRow($STRING)$BOOLEAN"
private const val PREVIEW_MENU_LABEL = "$PREVIEW_HOOKS_TYPE->menuLabel()$STRING"
private const val PREVIEW_ACTION_CONSTRUCTOR = "$PREVIEW_ACTION_TYPE-><init>($STRING$OBJECT)$VOID"
private const val PREVIEW_DISMISS_CONSTRUCTOR = "$PREVIEW_DISMISS_TYPE-><init>()$VOID"
private const val PREVIEW_LABEL_CONSTRUCTOR = "$PREVIEW_LABEL_TYPE-><init>()$VOID"

private const val PREVIEW_RENDER_METHOD_NAME = "render"
private const val PREVIEW_LABEL_METHOD_NAME = "invoke"

/** プレビューのメニュー model。toString の文字列は難読化されません。 */
private const val PREVIEW_MENU_ITEMS_TO_STRING = "ChatPreviewMenuItems(items="

/** プレビューの Premium 誘導行の model。toString の文字列は難読化されません。 */
private const val PREVIEW_PROMOTION_TO_STRING = "ChatPreviewPromotionMenuItem(withGreenDot="

/**
 * Compose の group key。親 group 内での slot 識別にだけ使われるため、値そのものに意味はありません。
 * 長押しメニュー側の行と衝突しないよう別の値を使います。
 */
private const val PREVIEW_GROUP_KEY_SHOWN = 0x4C494E41
private const val PREVIEW_GROUP_KEY_LAMBDA = 0x4C494E42
private const val PREVIEW_GROUP_KEY_HIDDEN = 0x4C494E43

/** プレビューの各メニュー行が行 composable へ渡す `$$changed`。実測値です。 */
private const val PREVIEW_ROW_CHANGED = 0x30

/** 行描画メソッドの register 数。v0〜v5 を作業用、v6 を項目、v7 を Composer に充てます。 */
private const val PREVIEW_RENDER_REGISTER_COUNT = 8

/** ラベル lambda の register 数。v0〜v3 を作業用、v4 を this、v5・v6 を引数に充てます。 */
private const val PREVIEW_LABEL_REGISTER_COUNT = 7

private val previewMenuItemsFingerprint = Fingerprint(
    name = "toString",
    returnType = STRING,
    parameters = emptyList(),
    strings = listOf(PREVIEW_MENU_ITEMS_TO_STRING),
)

private val previewPromotionItemFingerprint = Fingerprint(
    name = "toString",
    returnType = STRING,
    parameters = emptyList(),
    strings = listOf(PREVIEW_PROMOTION_TO_STRING),
)

/** プレビューのメニュー行を描く composable。第 1 引数が行一覧、第 2 引数が Premium 誘導行です。 */
private fun previewMenuFingerprint(menuItemsType: String, promotionType: String) = Fingerprint(
    returnType = VOID,
    custom = { method, _ -> looksLikePreviewMenu(method, menuItemsType, promotionType) },
)

/** プレビューのメニューを Column の中で呼ぶ composable。メニュー composable を 1 回だけ呼びます。 */
private fun previewMenuCallerFingerprint(menu: MethodReference) = Fingerprint(
    returnType = VOID,
    custom = { method, _ -> callsExactlyOnce(method, menu) },
)

internal fun looksLikePreviewMenu(method: Method, menuItemsType: String, promotionType: String): Boolean {
    val parameters = method.parameterTypes.map(CharSequence::toString)
    return AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.returnType == VOID &&
        parameters.size == 6 &&
        parameters[0] == menuItemsType &&
        parameters[1] == promotionType &&
        parameters[5] == INT
}

internal fun callsExactlyOnce(method: Method, target: MethodReference): Boolean {
    if (!AccessFlags.STATIC.isSet(method.accessFlags)) {
        return false
    }
    val instructions = method.implementation?.instructions ?: return false
    return instructions.count { instruction ->
        (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE) &&
            previewMethodReference(instruction)?.let { sameMethod(it, target) } == true
    } == 1
}

/** 呼び出し側（Column の中）から取り出した注入位置と register。 */
internal data class PreviewMenuCallerShape(
    val insertionIndex: Int,
    val itemType: String,
    val itemRegister: Int,
    val composerType: String,
    val composerRegister: Int,
)

/** メニュー composable から取り出した、行を描くための参照一式。 */
internal data class PreviewMenuShape(
    val composerInterface: String,
    val row: MethodReference,
    val rememberLambda: MethodReference,
    val startGroup: MethodReference,
    val endGroup: MethodReference,
    val labelDonorTypes: List<String>,
)

/** ラベル lambda の複製元から取り出した参照。 */
internal data class PreviewLabelShape(
    val interfaces: List<String>,
    val shouldExecute: MethodReference,
    val skipToGroupEnd: MethodReference,
    val text: MethodReference,
    val unitField: FieldReference,
)

/**
 * スクロールプレビュー画面のメニューへ「既読をつけずに読む」の行を追加します。
 *
 * <h2>なぜ必要か</h2>
 * <p>LINE 26.16.0 では、スクロールプレビューのプランが有効なアカウントでトークを長押しすると、
 * 従来の長押しメニューのダイアログではなく {@code ChatHistoryPreviewActivity} が開きます。
 * {@code readWithoutReceiptComposeMenuPatch} が行を足すダイアログは表示されないため、プレビュー下部の
 * メニューにも同じ行を足します。行一覧そのものはダイアログと同じ関数が作りますが、描画は別の
 * composable です。</p>
 *
 * <h2>注入するもの</h2>
 * <ol>
 *   <li>extension の {@code ReadWithoutReceiptPreviewMenuLabel} へ、プレビューの行のラベル lambda と同じ
 *   interface と {@code invoke(Object, Object)Object} を追加します。文字列は
 *   {@code ChatListMenuHooks.menuLabel()} から取り、プレビューの行の Text composable へ渡します。</li>
 *   <li>extension の {@code ReadWithoutReceiptPreviewMenuRow} へ、行を 1 つ描く static メソッドを追加します。
 *   設定 OFF や対象トーク不明のときも別 key の空 group を発行し、slot 構造を一定に保ちます。</li>
 *   <li>メニュー composable を呼ぶ直前（Column の中で、LINE の行より前）へ、その static メソッドの
 *   呼び出しを 1 命令だけ挿入します。</li>
 * </ol>
 *
 * <p>行を押すとプレビュー画面を閉じ、長押しメニューの行と同じ {@code ReadWithoutReceiptAction} で
 * 既読をつけずにトークを開きます。どの段でも導出に失敗した場合は何も注入せず、Patch Status を
 * 記録して終了します。</p>
 */
val readWithoutReceiptPreviewMenuPatch = bytecodePatch(
    name = "既読をつけずに読む（スクロールプレビュー）",
    description = "スクロールプレビュー画面のメニューへ「既読をつけずに読む」の行を追加します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(readWithoutReceiptComposeMenuPatch)

    execute {
        fun unsafe(reason: String, actual: Int = 1) = recordUnsafeFeatureStatus(
            listOf(PatchId.READ_WITHOUT_RECEIPT_PREVIEW_MENU_ROW),
            expectedTargetCount = 1,
            actualTargetCount = actual,
            reason = reason,
        )

        val menuItemsType = previewMenuItemsFingerprint.matchAllOrNull().orEmpty()
            .singleOrNull()?.originalClassDef?.type
        val promotionType = previewPromotionItemFingerprint.matchAllOrNull().orEmpty()
            .singleOrNull()?.originalClassDef?.type
        if (menuItemsType == null || promotionType == null) {
            recordFeatureStatus(
                listOf(PatchId.READ_WITHOUT_RECEIPT_PREVIEW_MENU_ROW),
                expectedTargetCount = 1,
                actualTargetCount = 0,
                reason = "ReadWithoutReceiptPreviewMenuModelNotFound",
            )
            return@execute
        }

        val menus = previewMenuFingerprint(menuItemsType, promotionType).matchAllOrNull().orEmpty()
        if (menus.size != 1) {
            recordFeatureStatus(
                listOf(PatchId.READ_WITHOUT_RECEIPT_PREVIEW_MENU_ROW),
                expectedTargetCount = 1,
                actualTargetCount = menus.size,
                reason = "ReadWithoutReceiptPreviewMenuNotUnique",
            )
            return@execute
        }
        val menu = menus.single().originalMethod
        val callers = previewMenuCallerFingerprint(menu).matchAllOrNull().orEmpty()
        if (callers.size != 1) {
            unsafe("ReadWithoutReceiptPreviewMenuCallerNotUnique", callers.size)
            return@execute
        }
        val caller = callers.single()

        val menuShape = previewMenuShape(menu) ?: run {
            unsafe("ReadWithoutReceiptPreviewMenuShapeMismatch")
            return@execute
        }
        val callerShape = previewMenuCallerShape(caller.originalMethod, menu) ?: run {
            unsafe("ReadWithoutReceiptPreviewMenuCallerShapeMismatch")
            return@execute
        }
        if (menuShape.startGroup.definingClass != callerShape.composerType ||
            menuShape.endGroup.definingClass != callerShape.composerType
        ) {
            unsafe("ReadWithoutReceiptPreviewMenuComposerMismatch")
            return@execute
        }

        val chatIdField = chatIdField(classDefByOrNull(callerShape.itemType)) ?: run {
            unsafe("ReadWithoutReceiptPreviewMenuChatIdFieldNotUnique")
            return@execute
        }

        val menuClass = classDefByOrNull(menu.definingClass)
        val labelShapes = menuShape.labelDonorTypes.mapNotNull { donorType ->
            classDefByOrNull(donorType)?.let { previewLabelShape(it, menuShape.composerInterface, menuClass) }
        }.distinct()
        val labelShape = labelShapes.singleOrNull() ?: run {
            unsafe("ReadWithoutReceiptPreviewMenuLabelDonorMismatch")
            return@execute
        }

        // 生成する Action と Label が、行 composable と lambda factory の引数の契約を実装できるか確かめます。
        if (!previewCallbackContractHolds(menuShape, labelShape) { type -> classDefByOrNull(type) }) {
            unsafe("ReadWithoutReceiptPreviewMenuCallbackContractMismatch")
            return@execute
        }

        val actionClass = mutableClassDefByOrNull(PREVIEW_ACTION_TYPE)
        val dismissClass = classDefByOrNull(PREVIEW_DISMISS_TYPE)
        val labelClass = mutableClassDefByOrNull(PREVIEW_LABEL_TYPE)
        val rowClass = mutableClassDefByOrNull(PREVIEW_ROW_TYPE)
        if (actionClass == null || dismissClass == null || labelClass == null || rowClass == null) {
            unsafe("ReadWithoutReceiptPreviewMenuExtensionClassMissing")
            return@execute
        }

        val function0Type = menuShape.row.parameterTypes[0].toString()
        if (!actionClass.interfaces.contains(function0Type)) {
            actionClass.interfaces.add(function0Type)
        }
        labelShape.interfaces.forEach { type ->
            if (!labelClass.interfaces.contains(type)) {
                labelClass.interfaces.add(type)
            }
        }

        addPreviewLabelInvoke(labelClass, menuShape, labelShape)
        addPreviewRenderMethod(rowClass, menuShape, callerShape, chatIdField)

        caller.method.addInstructionsWithLabels(
            callerShape.insertionIndex,
            "invoke-static { v${callerShape.itemRegister}, v${callerShape.composerRegister} }, " +
                "$PREVIEW_ROW_TYPE->$PREVIEW_RENDER_METHOD_NAME($OBJECT${callerShape.composerType})$VOID",
        )

        recordFeatureStatus(
            listOf(PatchId.READ_WITHOUT_RECEIPT_PREVIEW_MENU_ROW),
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "ReadWithoutReceiptPreviewMenuRowInjected",
        )
    }
}

/**
 * メニュー composable の命令から、行 composable・`rememberComposableLambda`・group の開始と終了を取り出します。
 *
 * <p>行 composable は自クラスの static `(Function0, ComposableLambda, Composer, int)V` で、Premium 誘導行と
 * 行一覧の 2 箇所から呼ばれます。group の開始と終了は、Composer の実体型に対する `(I)V` と `(Z)V` の
 * 呼び出しで、Premium 誘導行の有無の両分岐で 1 回ずつ使われます。</p>
 */
internal fun previewMenuShape(menu: Method): PreviewMenuShape? {
    val instructions = menu.implementation?.instructions?.toList() ?: return null
    val composerInterface = menu.parameterTypes.getOrNull(4)?.toString() ?: return null

    val rowCalls = instructions.filter { it.opcode == Opcode.INVOKE_STATIC }.mapNotNull { previewMethodReference(it) }
        .filter { reference ->
            val parameters = reference.parameterTypes.map(CharSequence::toString)
            reference.definingClass == menu.definingClass &&
                reference.returnType == VOID &&
                parameters.size == 4 &&
                parameters[2] == composerInterface &&
                parameters[3] == INT
        }
    val row = rowCalls.distinctBy { it.smali() }.singleOrNull() ?: return null
    if (rowCalls.size < 2) {
        return null
    }
    val lambdaType = row.parameterTypes[1].toString()

    val rememberLambda = instructions.filter { it.opcode == Opcode.INVOKE_STATIC }
        .mapNotNull { previewMethodReference(it) }
        .filter { reference ->
            val parameters = reference.parameterTypes.map(CharSequence::toString)
            reference.returnType == lambdaType &&
                parameters.size == 3 &&
                parameters[0] == INT &&
                parameters[2] == composerInterface
        }
        .distinctBy { it.smali() }.singleOrNull() ?: return null

    // Composer の実体型は、メニュー先頭の startRestartGroup `(I)<実体型>` の返り値です。
    val composerType = instructions.firstOrNull { instruction ->
        instruction.opcode == Opcode.INVOKE_INTERFACE && previewMethodReference(instruction)?.let { reference ->
            reference.definingClass == composerInterface &&
                reference.parameterTypes.map(CharSequence::toString) == listOf(INT) &&
                reference.returnType != VOID
        } == true
    }?.let { previewMethodReference(it)?.returnType } ?: return null

    val startGroups = composerVirtualCalls(instructions, composerType, listOf(INT))
    val endGroups = composerVirtualCalls(instructions, composerType, listOf(BOOLEAN))
    val startGroup = startGroups.distinctBy { it.smali() }.singleOrNull() ?: return null
    val endGroup = endGroups.distinctBy { it.smali() }.singleOrNull() ?: return null
    if (startGroups.size != 2 || endGroups.size != 2) {
        return null
    }

    val donorTypes = instructions.indices.filter { index ->
        instructions[index].opcode == Opcode.INVOKE_STATIC &&
            previewMethodReference(instructions[index])?.let { sameMethod(it, rememberLambda) } == true
    }.mapNotNull { index ->
        val lambdaRegister = (instructions[index] as? Instruction35c)?.registerD ?: return@mapNotNull null
        (index - 1 downTo 0).firstOrNull { previous ->
            instructions[previous].opcode == Opcode.NEW_INSTANCE &&
                (instructions[previous] as OneRegisterInstruction).registerA == lambdaRegister
        }?.let { previewTypeReference(instructions[it]) }
    }.distinct()
    if (donorTypes.isEmpty()) {
        return null
    }

    return PreviewMenuShape(
        composerInterface = composerInterface,
        row = row,
        rememberLambda = rememberLambda,
        startGroup = startGroup,
        endGroup = endGroup,
        labelDonorTypes = donorTypes,
    )
}

/**
 * Column の中でメニュー composable を呼ぶ側から、注入位置とトーク model・Composer の register を取り出します。
 *
 * <p>トーク model の register は、行一覧を作る static `(model)List` の引数です。この register への書き込みが
 * すべて第 1 引数（トーク model）からの move であることを確かめ、どの経路でも注入位置で model を指すことを
 * 保証します。Composer の register はメニュー composable の Composer 引数で、startRestartGroup の結果から
 * 書き換えられていないことを確かめます。</p>
 */
internal fun previewMenuCallerShape(caller: Method, menu: MethodReference): PreviewMenuCallerShape? {
    val implementation = caller.implementation ?: return null
    val instructions = implementation.instructions.toList()
    val itemType = caller.parameterTypes.getOrNull(0)?.toString() ?: return null
    val composerInterface = menu.parameterTypes.getOrNull(4)?.toString() ?: return null

    val menuIndex = instructions.indexOfFirst { instruction ->
        (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE) &&
            previewMethodReference(instruction)?.let { sameMethod(it, menu) } == true
    }
    if (menuIndex < 0) {
        return null
    }
    val composerRegister = argumentRegister(instructions[menuIndex], 4) ?: return null

    val itemsCalls = instructions.indices.filter { index ->
        instructions[index].opcode == Opcode.INVOKE_STATIC && previewMethodReference(instructions[index])?.let {
            it.parameterTypes.map(CharSequence::toString) == listOf(itemType) && it.returnType != VOID
        } == true
    }
    val itemsIndex = itemsCalls.singleOrNull() ?: return null
    if (itemsIndex > menuIndex) {
        return null
    }
    val itemRegister = (instructions[itemsIndex] as? Instruction35c)?.registerC ?: return null

    // static メソッドなので、引数は末尾の register 群に並び、第 1 引数がトーク model です。
    val parameterRegister = implementation.registerCount - caller.parameterTypes.size
    if (implementation.tryBlocks.isNotEmpty() ||
        (0 until menuIndex).any { instructionWritesRegister(instructions[it], parameterRegister) } ||
        !registerHoldsParameterAt(instructions, itemRegister, parameterRegister, menuIndex)
    ) {
        return null
    }

    // Composer の register は startRestartGroup `(I)<実体型>` の結果を受ける move-result-object です。
    val composerDefinition = (0 until menuIndex).lastOrNull { instructionWritesRegister(instructions[it], composerRegister) }
        ?: return null
    val start = instructions.getOrNull(composerDefinition - 1)
    val startReference = previewMethodReference(start)
    if (instructions[composerDefinition].opcode != Opcode.MOVE_RESULT_OBJECT ||
        start?.opcode != Opcode.INVOKE_INTERFACE ||
        startReference?.definingClass != composerInterface ||
        startReference.parameterTypes.map(CharSequence::toString) != listOf(INT)
    ) {
        return null
    }
    // 定義は分岐より前の直線区間にあり、以後は書き換えられないことを確かめます。
    if ((0..composerDefinition).any { instructions[it] is OffsetInstruction } ||
        !registerSurvivesBetween(instructions, composerRegister, composerDefinition, menuIndex)
    ) {
        return null
    }

    // 注入する呼び出しは 35c 形式の invoke-static なので、引数の register は 4bit（v0〜v15）しか取れません。
    if (itemRegister > 15 || composerRegister > 15) {
        return null
    }
    if (isDivertedInjectionIndex(instructions, menuIndex, exceptionHandlerAddresses(implementation))) {
        return null
    }

    return PreviewMenuCallerShape(
        insertionIndex = menuIndex,
        itemType = itemType,
        itemRegister = itemRegister,
        composerType = startReference.returnType,
        composerRegister = composerRegister,
    )
}

/**
 * ラベル lambda の複製元から、`shouldExecute`・`skipToGroupEnd`・Text composable・`kotlin.Unit` を取り出します。
 *
 * <p>Premium 誘導行のラベル lambda は Row の node 操作を含むため、`()V` の Composer 呼び出しが 1 種類に
 * 絞れず除外されます。行一覧のラベル lambda だけが残る想定です。</p>
 */
internal fun previewLabelShape(donor: ClassDef, composerInterface: String, menuClass: ClassDef?): PreviewLabelShape? {
    val invoke = donor.methods.singleOrNull { candidate ->
        candidate.name == PREVIEW_LABEL_METHOD_NAME &&
            candidate.returnType == OBJECT &&
            candidate.parameterTypes.map(CharSequence::toString) == listOf(OBJECT, OBJECT)
    } ?: return null
    val instructions = invoke.implementation?.instructions?.toList() ?: return null
    val interfaceCalls = instructions.filter { it.opcode == Opcode.INVOKE_INTERFACE }
        .mapNotNull { previewMethodReference(it) }
        .filter { it.definingClass == composerInterface }
        .distinctBy { it.smali() }

    val shouldExecute = interfaceCalls.singleOrNull {
        it.parameterTypes.map(CharSequence::toString) == listOf(INT, BOOLEAN) && it.returnType == BOOLEAN
    } ?: return null
    val skipToGroupEnd = interfaceCalls.filter { it.parameterTypes.isEmpty() && it.returnType == VOID }
        .singleOrNull() ?: return null
    if (interfaceCalls.size != 2) {
        return null
    }

    val text = instructions.filter { it.opcode == Opcode.INVOKE_STATIC }
        .mapNotNull { previewMethodReference(it) }
        .filter {
            it.returnType == VOID &&
                it.parameterTypes.map(CharSequence::toString) == listOf(STRING, composerInterface, INT)
        }
        .distinctBy { it.smali() }.singleOrNull() ?: return null
    if (menuClass != null && text.definingClass != menuClass.type) {
        return null
    }

    val unitField = instructions.filter { it.opcode == Opcode.SGET_OBJECT }
        .mapNotNull { previewFieldReference(it) }
        .distinctBy { it.smali() }.singleOrNull() ?: return null

    val interfaces = donor.interfaces.toList()
    if (interfaces.isEmpty()) {
        return null
    }

    return PreviewLabelShape(
        interfaces = interfaces,
        shouldExecute = shouldExecute,
        skipToGroupEnd = skipToGroupEnd,
        text = text,
        unitField = unitField,
    )
}

/**
 * 行の onClick の型と lambda factory の第 2 引数の型が、生成するクラスで満たせる契約かどうか。
 *
 * <ul>
 *   <li>onClick の型は interface で、`invoke()Object` を宣言していること（{@code ReadWithoutReceiptAction} が実装する）。</li>
 *   <li>複製元の interface はすべて interface で、いずれかが `invoke(Object, Object)Object` を宣言していること。</li>
 *   <li>lambda factory の第 2 引数の型が、複製元の interface かその上位 interface であること。</li>
 * </ul>
 */
internal fun previewCallbackContractHolds(
    menu: PreviewMenuShape,
    label: PreviewLabelShape,
    resolve: (String) -> ClassDef?,
): Boolean {
    fun isInterface(classDef: ClassDef?) = classDef != null && AccessFlags.INTERFACE.isSet(classDef.accessFlags)
    fun declares(classDef: ClassDef?, parameters: List<String>) = classDef?.methods?.any { method ->
        method.name == PREVIEW_LABEL_METHOD_NAME &&
            method.returnType == OBJECT &&
            method.parameterTypes.map(CharSequence::toString) == parameters &&
            AccessFlags.ABSTRACT.isSet(method.accessFlags)
    } == true

    val function0 = resolve(menu.row.parameterTypes[0].toString())
    if (!isInterface(function0) || !declares(function0, emptyList())) {
        return false
    }
    val donorInterfaces = label.interfaces.map(resolve)
    if (donorInterfaces.any { !isInterface(it) } || donorInterfaces.none { declares(it, listOf(OBJECT, OBJECT)) }) {
        return false
    }

    val factoryLambdaType = menu.rememberLambda.parameterTypes[1].toString()
    val visited = mutableSetOf<String>()
    val pending = ArrayDeque(label.interfaces)
    while (pending.isNotEmpty()) {
        val type = pending.removeFirst()
        if (!visited.add(type)) continue
        if (type == factoryLambdaType) return true
        resolve(type)?.interfaces?.let { pending.addAll(it) }
    }
    return false
}

/**
 * ラベルを描く `invoke(Object, Object)Object` を extension のクラスへ追加します。
 * 命令の並びは LINE 自身のラベル lambda と同じで、文字列 resource の読み出しだけを
 * {@code ChatListMenuHooks.menuLabel()} へ差し替えています。
 */
private fun addPreviewLabelInvoke(labelClass: MutableClass, menu: PreviewMenuShape, label: PreviewLabelShape) {
    val method = newPreviewMethod(
        definingClass = labelClass.type,
        name = PREVIEW_LABEL_METHOD_NAME,
        parameterTypes = listOf(OBJECT, OBJECT),
        returnType = OBJECT,
        accessFlags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        registerCount = PREVIEW_LABEL_REGISTER_COUNT,
        returnsObject = true,
    )
    method.addInstructionsWithLabels(
        0,
        """
            check-cast p1, ${menu.composerInterface}
            check-cast p2, Ljava/lang/Integer;
            invoke-virtual { p2 }, Ljava/lang/Integer;->intValue()I
            move-result v0
            and-int/lit8 v1, v0, 0x3
            const/4 v2, 0x2
            const/4 v3, 0x1
            if-eq v1, v2, :rwrPreviewLabelUnchanged
            move v1, v3
            goto :rwrPreviewLabelExecute
            :rwrPreviewLabelUnchanged
            const/4 v1, 0x0
            :rwrPreviewLabelExecute
            and-int/2addr v0, v3
            invoke-interface { p1, v0, v1 }, ${label.shouldExecute.smali()}
            move-result v0
            if-eqz v0, :rwrPreviewLabelSkip
            invoke-static { }, $PREVIEW_MENU_LABEL
            move-result-object v0
            const/4 v1, 0x0
            invoke-static { v0, p1, v1 }, ${label.text.smali()}
            goto :rwrPreviewLabelDone
            :rwrPreviewLabelSkip
            invoke-interface { p1 }, ${label.skipToGroupEnd.smali()}
            :rwrPreviewLabelDone
            sget-object v0, ${label.unitField.smali()}
            return-object v0
        """.trimIndent(),
    )
    labelClass.addPreviewMethod(method)
}

/**
 * 行を 1 つ描く static メソッドを extension のクラスへ追加します。
 *
 * <p>行を出す経路と出さない経路の両方で group を発行し、Compose の slot 構造を recomposition の
 * たびに一定へ保ちます。group の開始と終了はメニュー composable と同じ Composer 実体型の呼び出しです。</p>
 */
private fun addPreviewRenderMethod(
    rowClass: MutableClass,
    menu: PreviewMenuShape,
    caller: PreviewMenuCallerShape,
    chatIdField: FieldReference,
) {
    val method = newPreviewMethod(
        definingClass = rowClass.type,
        name = PREVIEW_RENDER_METHOD_NAME,
        parameterTypes = listOf(OBJECT, caller.composerType),
        returnType = VOID,
        accessFlags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value,
        registerCount = PREVIEW_RENDER_REGISTER_COUNT,
        returnsObject = false,
    )
    method.addInstructionsWithLabels(
        0,
        """
            const/4 v5, 0x0
            instance-of v0, p0, ${caller.itemType}
            if-eqz v0, :rwrPreviewRowNoChat
            check-cast p0, ${caller.itemType}
            iget-object v5, p0, ${chatIdField.smali()}
            :rwrPreviewRowNoChat
            invoke-static { v5 }, $PREVIEW_SHOULD_SHOW_ROW
            move-result v0
            if-eqz v0, :rwrPreviewRowHidden
            const v0, $PREVIEW_GROUP_KEY_SHOWN
            invoke-virtual { p1, v0 }, ${menu.startGroup.smali()}
            new-instance v1, $PREVIEW_ACTION_TYPE
            new-instance v2, $PREVIEW_DISMISS_TYPE
            invoke-direct { v2 }, $PREVIEW_DISMISS_CONSTRUCTOR
            invoke-direct { v1, v5, v2 }, $PREVIEW_ACTION_CONSTRUCTOR
            new-instance v2, $PREVIEW_LABEL_TYPE
            invoke-direct { v2 }, $PREVIEW_LABEL_CONSTRUCTOR
            const v3, $PREVIEW_GROUP_KEY_LAMBDA
            invoke-static { v3, v2, p1 }, ${menu.rememberLambda.smali()}
            move-result-object v2
            const/16 v3, $PREVIEW_ROW_CHANGED
            invoke-static { v1, v2, p1, v3 }, ${menu.row.smali()}
            const/4 v0, 0x0
            invoke-virtual { p1, v0 }, ${menu.endGroup.smali()}
            goto :rwrPreviewRowDone
            :rwrPreviewRowHidden
            const v0, $PREVIEW_GROUP_KEY_HIDDEN
            invoke-virtual { p1, v0 }, ${menu.startGroup.smali()}
            const/4 v0, 0x0
            invoke-virtual { p1, v0 }, ${menu.endGroup.smali()}
            :rwrPreviewRowDone
            nop
        """.trimIndent(),
    )
    rowClass.addPreviewMethod(method)
}

/**
 * 指定した register 数を持つ空のメソッドを作ります。末尾の 1〜2 命令は注入後に到達しない
 * dead code として残りますが、型は矛盾しない形にしています。
 */
private fun newPreviewMethod(
    definingClass: String,
    name: String,
    parameterTypes: List<String>,
    returnType: String,
    accessFlags: Int,
    registerCount: Int,
    returnsObject: Boolean,
): MutableMethod {
    val implementation = MutableMethodImplementation(registerCount)
    if (returnsObject) {
        implementation.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 0))
        implementation.addInstruction(BuilderInstruction11x(Opcode.RETURN_OBJECT, 0))
    } else {
        implementation.addInstruction(BuilderInstruction10x(Opcode.RETURN_VOID))
    }
    return MutableMethod(
        ImmutableMethod(
            definingClass,
            name,
            parameterTypes.map { ImmutableMethodParameter(it, null, null) },
            returnType,
            accessFlags,
            null,
            null,
            implementation,
        ),
    )
}

/** DEX writer は `directMethods` / `virtualMethods` を読むため、両方へ登録します。 */
private fun MutableClass.addPreviewMethod(method: MutableMethod) {
    methods.add(method)
    if (AccessFlags.STATIC.isSet(method.accessFlags)) {
        directMethods.add(method)
    } else {
        virtualMethods.add(method)
    }
}

private fun composerVirtualCalls(
    instructions: List<Instruction>,
    composerType: String,
    parameters: List<String>,
): List<MethodReference> = instructions
    .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
    .mapNotNull { previewMethodReference(it) }
    .filter {
        it.definingClass == composerType &&
            it.returnType == VOID &&
            it.parameterTypes.map(CharSequence::toString) == parameters
    }

/** invoke 命令の n 番目の引数 register。35c と 3rc の両方に対応します。 */
private fun argumentRegister(instruction: Instruction, index: Int): Int? = when (instruction) {
    is RegisterRangeInstruction -> if (index < instruction.registerCount) instruction.startRegister + index else null
    is FiveRegisterInstruction -> when (index) {
        0 -> instruction.registerC
        1 -> instruction.registerD
        2 -> instruction.registerE
        3 -> instruction.registerF
        4 -> instruction.registerG
        else -> null
    }.takeIf { index < instruction.registerCount }
    else -> null
}

/**
 * [targetIndex] の命令へ到達するすべての経路で、[register] が第 1 引数の register から move した値を
 * 保持しているかどうか。分岐と switch を辿る前向きの解析で、合流点では AND を取ります。
 * try block を含むメソッドは呼び出し側で拒否するため、例外経路は扱いません。
 */
internal fun registerHoldsParameterAt(
    instructions: List<Instruction>,
    register: Int,
    parameterRegister: Int,
    targetIndex: Int,
): Boolean {
    if (targetIndex !in instructions.indices) {
        return false
    }
    var address = 0
    val addresses = instructions.map { instruction -> address.also { address += instruction.codeUnits } }
    val indexByAddress = addresses.withIndex().associate { (index, value) -> value to index }

    fun successors(index: Int): List<Int> {
        val instruction = instructions[index]
        val next = mutableListOf<Int>()
        if (fallsThrough(instruction) && index + 1 < instructions.size) {
            next += index + 1
        }
        val branch = instruction as? OffsetInstruction ?: return next
        val target = indexByAddress[addresses[index] + branch.codeOffset] ?: return next
        val payload = instructions[target] as? SwitchPayload
        if (payload == null) {
            next += target
        } else {
            payload.switchElements.forEach { element ->
                indexByAddress[addresses[index] + element.offset]?.let { next += it }
            }
        }
        return next
    }

    fun holdsAfter(index: Int, holdsBefore: Boolean): Boolean {
        val instruction = instructions[index]
        if (!instructionWritesRegister(instruction, register)) {
            return holdsBefore
        }
        return (instruction.opcode == Opcode.MOVE_OBJECT || instruction.opcode == Opcode.MOVE_OBJECT_FROM16 ||
            instruction.opcode == Opcode.MOVE_OBJECT_16) &&
            (instruction as TwoRegisterInstruction).registerB == parameterRegister
    }

    val states = arrayOfNulls<Boolean>(instructions.size)
    states[0] = register == parameterRegister
    val worklist = ArrayDeque(listOf(0))
    while (worklist.isNotEmpty()) {
        val index = worklist.removeFirst()
        if (instructions[index] is SwitchPayload) {
            continue
        }
        val after = holdsAfter(index, states[index] == true)
        for (successor in successors(index)) {
            val merged = states[successor]?.let { it && after } ?: after
            if (states[successor] != merged) {
                states[successor] = merged
                worklist.addLast(successor)
            }
        }
    }
    return states[targetIndex] == true
}

private fun sameMethod(left: MethodReference, right: MethodReference): Boolean =
    left.definingClass == right.definingClass &&
        left.name == right.name &&
        left.returnType == right.returnType &&
        left.parameterTypes.map(CharSequence::toString) == right.parameterTypes.map(CharSequence::toString)

private fun MethodReference.smali(): String =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun FieldReference.smali(): String = "$definingClass->$name:$type"

private fun previewMethodReference(instruction: Instruction?): MethodReference? =
    (instruction as? ReferenceInstruction)?.reference as? MethodReference

private fun previewFieldReference(instruction: Instruction?): FieldReference? =
    (instruction as? ReferenceInstruction)?.reference as? FieldReference

private fun previewTypeReference(instruction: Instruction?): String? =
    ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type

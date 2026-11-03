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
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
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
import dev.utaa.linimal.patches.util.INTEGER
import dev.utaa.linimal.patches.util.OBJECT
import dev.utaa.linimal.patches.util.STRING
import dev.utaa.linimal.patches.util.VOID
import dev.utaa.linimal.patches.util.exceptionHandlerAddresses
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex
import dev.utaa.linimal.patches.util.registerSurvivesBetween


private const val EXTENSION_PACKAGE = "Ldev/utaa/linimal/extension/features/readwithoutreceipt"
private const val ACTION_TYPE = "$EXTENSION_PACKAGE/ReadWithoutReceiptAction;"
private const val LABEL_TYPE = "$EXTENSION_PACKAGE/ReadWithoutReceiptMenuLabel;"
private const val ROW_TYPE = "$EXTENSION_PACKAGE/ReadWithoutReceiptMenuRow;"
private const val HOOKS_TYPE = "$EXTENSION_PACKAGE/ChatListMenuHooks;"

private const val SHOULD_SHOW_ROW = "$HOOKS_TYPE->shouldShowRow($STRING)$BOOLEAN"
private const val MENU_LABEL = "$HOOKS_TYPE->menuLabel()$STRING"
private const val ACTION_CONSTRUCTOR = "$ACTION_TYPE-><init>($STRING$OBJECT)$VOID"
private const val LABEL_CONSTRUCTOR = "$LABEL_TYPE-><init>()$VOID"

private const val RENDER_METHOD_NAME = "render"
private const val LABEL_METHOD_NAME = "invoke"

/**
 * Compose の group key。親 group 内での slot 識別にだけ使われるため、値そのものに意味はありません。
 * 行を出す場合と出さない場合で必ず別の group を発行し、LINE 自身の各行と同じ構造を保ちます。
 */
private const val GROUP_KEY_SHOWN = 0x4C494E31
private const val GROUP_KEY_LAMBDA = 0x4C494E32
private const val GROUP_KEY_HIDDEN = 0x4C494E33

/** 行 composable へ渡す `$$changed` / `$$default`。LINE 自身の 4 行がすべてこの組み合わせです。 */
private const val ROW_CHANGED = 0xC00
private const val ROW_DEFAULT = 0x6

/** ラベル描画 lambda の register 数。複製元と同じ配置を使うため 28 で固定します。 */
private const val LABEL_REGISTER_COUNT = 28

/** 行描画メソッドの register 数。v0〜v6 を range 呼び出しに使い、v7 を chatId に充てます。 */
private const val RENDER_REGISTER_COUNT = 11

/** Compose の `Text` は 25 個の register を並べた range 呼び出しです。 */
private const val TEXT_REGISTER_COUNT = 25

/** 長押しメニューのトーク項目 model。toString の文字列は難読化されません。 */
private val chatItemModelFingerprint = Fingerprint(
    name = "toString",
    returnType = STRING,
    parameters = emptyList(),
    strings = listOf("ChatItem(chatId=", ", chatType=", ", isNotificationOn="),
)

/**
 * トーク一覧の長押しメニューの本体を探す fingerprint。
 *
 * <p>難読化名には一切依存しません。Compose の lambda は `(Object, Object, Object)Object` へ erase される
 * ため、その形をしたメソッドのうち、トーク項目 model への `instance-of` の分岐内で、行一覧を描く composable
 * `(項目, Function1, Composer, int)V` を 1 回だけ呼ぶものに絞ります。実 APK の全 DEX で 1 件です。
 * 26.16.0 では行が固定 4 行ではなく、この composable の中で一覧から描かれます。</p>
 */
private fun composeMenuFingerprint(itemType: String) = Fingerprint(
    returnType = OBJECT,
    parameters = listOf(OBJECT, OBJECT, OBJECT),
    custom = { method, _ -> looksLikeComposeMenu(method, itemType) },
)

/** メニュー本体から取り出した、注入に必要な参照一式。すべて実際の命令から導出します。 */
internal data class ComposeMenuShape(
    val insertionIndex: Int,
    val composerType: String,
    val itemType: String,
    val dismissRegister: Int,
    val itemRegister: Int,
    val composerRegister: Int,
    val rowComposable: MethodReference,
    val rememberLambda: MethodReference,
    val startReplaceGroup: MethodReference,
    val endReplaceGroup: MethodReference,
    val skipToGroupEnd: MethodReference,
    val shouldExecute: MethodReference,
    val labelDonorType: String,
)

/** ラベル描画 lambda の複製元から取り出した参照。 */
internal data class LabelDonorShape(
    val text: MethodReference,
    val unitField: FieldReference,
)

/**
 * トーク一覧の長押しメニューの先頭へ「既読をつけずに読む」の行を追加します。
 *
 * <h2>なぜ Compose を直接描くのか</h2>
 * <p>LINE の長押しメニューは Jetpack Compose のダイアログです。View も RecyclerView も
 * 介さないため、「メニュー項目のリストへ要素を足す」という従来の方法は使えません。旧実装が対象に
 * していた AlertDialog 経路は APK 内に残っていますが実行されない死んだコードでした。</p>
 *
 * <p>そこで、LINE 自身の各行とまったく同じ手順でもう 1 行を描きます。行 composable・
 * `rememberComposableLambda`・`startReplaceGroup` / `endReplaceGroup` の参照はすべてメニュー本体と
 * 行一覧の composable の命令列から取り出すため、難読化名を patch へ書き込みません。</p>
 *
 * <h2>注入するもの</h2>
 * <ol>
 *   <li>extension の {@code ReadWithoutReceiptMenuLabel} へ、ラベルを描く
 *   {@code invoke(Object, Object)Object} を追加します。中身は LINE 自身のラベル lambda から
 *   複製し、文字列 resource の読み出しだけを {@code ChatListMenuHooks.menuLabel()} に差し替えます。
 *   extension は難読化された Compose の型をコンパイル時に参照できないため、この方法を採ります。</li>
 *   <li>extension の {@code ReadWithoutReceiptMenuRow} へ、行を 1 つ描く static メソッドを
 *   追加します。設定 OFF や対象トーク不明のときも、LINE 自身の各行と同じく別 key の空 group を
 *   発行するため、Compose の slot 構造は常に一定です。</li>
 *   <li>メニュー本体の、トーク項目の分岐内で行一覧の composable を呼ぶ直前（LINE の 1 行目より前）へ、
 *   その static メソッドの呼び出しを 1 命令だけ挿入します。</li>
 * </ol>
 *
 * <p>どの段でも導出に失敗した場合は何も注入せず、Patch Status を記録して終了します。</p>
 */
val readWithoutReceiptComposeMenuPatch = bytecodePatch(
    name = "既読をつけずに読む",
    description = "トーク一覧の長押しメニューへ「既読をつけずに読む」の行を追加します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(readWithoutReceiptMenuLabelResourcePatch)

    execute {
        val items = chatItemModelFingerprint.matchAllOrNull().orEmpty()
        val itemType = items.singleOrNull()?.originalClassDef?.type
        val matches = itemType?.let { composeMenuFingerprint(it).matchAllOrNull().orEmpty() }.orEmpty()
        if (itemType == null || matches.size != 1) {
            recordFeatureStatus(
                listOf(PatchId.READ_WITHOUT_RECEIPT_COMPOSE_MENU_ROW),
                expectedTargetCount = 1,
                actualTargetCount = matches.size,
                reason = "ReadWithoutReceiptComposeMenuNotUnique",
            )
            return@execute
        }

        val match = matches.single()
        val shape = composeMenuShape(match.originalMethod, itemType) { reference ->
            classDefByOrNull(reference.definingClass)?.methods?.singleOrNull { candidate ->
                candidate.name == reference.name &&
                    candidate.returnType == reference.returnType &&
                    candidate.parameterTypes.map(CharSequence::toString) ==
                    reference.parameterTypes.map(CharSequence::toString)
            }
        }
        if (shape == null) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.READ_WITHOUT_RECEIPT_COMPOSE_MENU_ROW),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ReadWithoutReceiptComposeMenuShapeMismatch",
            )
            return@execute
        }

        val chatIdField = chatIdField(classDefByOrNull(shape.itemType))
        if (chatIdField == null) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.READ_WITHOUT_RECEIPT_COMPOSE_MENU_ROW),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ReadWithoutReceiptComposeMenuChatIdFieldNotUnique",
            )
            return@execute
        }

        val donor = labelDonorShape(classDefByOrNull(shape.labelDonorType)?.methods?.toList().orEmpty())
        if (donor == null) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.READ_WITHOUT_RECEIPT_COMPOSE_MENU_ROW),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ReadWithoutReceiptComposeMenuLabelDonorMismatch",
            )
            return@execute
        }

        val actionClass = mutableClassDefByOrNull(ACTION_TYPE)
        val labelClass = mutableClassDefByOrNull(LABEL_TYPE)
        val rowClass = mutableClassDefByOrNull(ROW_TYPE)
        if (actionClass == null || labelClass == null || rowClass == null) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.READ_WITHOUT_RECEIPT_COMPOSE_MENU_ROW),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ReadWithoutReceiptComposeMenuExtensionClassMissing",
            )
            return@execute
        }

        val function0Type = shape.rowComposable.parameterTypes[0].toString()
        val function2Type = shape.rowComposable.parameterTypes[2].toString()
        if (!actionClass.interfaces.contains(function0Type)) {
            actionClass.interfaces.add(function0Type)
        }
        if (!labelClass.interfaces.contains(function2Type)) {
            labelClass.interfaces.add(function2Type)
        }

        addLabelInvoke(labelClass, shape, donor)
        addRenderMethod(rowClass, shape, chatIdField)

        match.method.addInstructionsWithLabels(
            shape.insertionIndex,
            "invoke-static { v${shape.dismissRegister}, v${shape.itemRegister}, " +
                "v${shape.composerRegister} }, $ROW_TYPE->$RENDER_METHOD_NAME" +
                "($OBJECT$OBJECT${shape.composerType})$VOID",
        )

        recordFeatureStatus(
            listOf(PatchId.READ_WITHOUT_RECEIPT_COMPOSE_MENU_ROW),
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "ReadWithoutReceiptComposeMenuRowInjected",
        )
    }
}

/**
 * ラベルを描く `invoke(Object, Object)Object` を extension のクラスへ追加します。
 *
 * <p>命令の並びは LINE 自身のラベル lambda と同一で、文字列 resource の読み出しだけを
 * {@code ChatListMenuHooks.menuLabel()} へ差し替えています。register 配置も複製元に合わせ、
 * 25 引数の `Text` 呼び出しへ v0〜v24 を並べます。</p>
 */
private fun addLabelInvoke(labelClass: MutableClass, shape: ComposeMenuShape, donor: LabelDonorShape) {
    val method = newMethod(
        definingClass = labelClass.type,
        name = LABEL_METHOD_NAME,
        parameterTypes = listOf(OBJECT, OBJECT),
        returnType = OBJECT,
        accessFlags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        registerCount = LABEL_REGISTER_COUNT,
        returnsObject = true,
    )

    method.addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, v${LABEL_REGISTER_COUNT - 2}
            check-cast v0, ${shape.composerType}
            move-object/from16 v1, v${LABEL_REGISTER_COUNT - 1}
            check-cast v1, $INTEGER
            invoke-virtual { v1 }, $INTEGER->intValue()$INT
            move-result v1
            and-int/lit8 v2, v1, 0x3
            const/4 v3, 0x2
            const/4 v4, 0x1
            if-eq v2, v3, :rwrLabelSkipFlag
            move v2, v4
            goto :rwrLabelFlagDone
            :rwrLabelSkipFlag
            const/4 v2, 0x0
            :rwrLabelFlagDone
            and-int/2addr v1, v4
            invoke-interface { v0, v1, v2 }, ${shape.shouldExecute.smali()}
            move-result v1
            if-eqz v1, :rwrLabelSkip
            invoke-static { }, $MENU_LABEL
            move-result-object v1
            const/16 v23, 0x0
            const v24, 0x3fffe
            move-object/from16 v21, v0
            move-object v0, v1
            const/4 v1, 0x0
            const-wide/16 v2, 0x0
            const/4 v4, 0x0
            const-wide/16 v5, 0x0
            const/4 v7, 0x0
            const/4 v8, 0x0
            const-wide/16 v9, 0x0
            const/4 v11, 0x0
            const/4 v12, 0x0
            const-wide/16 v13, 0x0
            const/4 v15, 0x0
            const/16 v16, 0x0
            const/16 v17, 0x0
            const/16 v18, 0x0
            const/16 v19, 0x0
            const/16 v20, 0x0
            const/16 v22, 0x0
            invoke-static/range { v0 .. v24 }, ${donor.text.smali()}
            goto :rwrLabelDone
            :rwrLabelSkip
            move-object/from16 v21, v0
            invoke-interface/range { v21 .. v21 }, ${shape.skipToGroupEnd.smali()}
            :rwrLabelDone
            sget-object v0, ${donor.unitField.smali()}
            return-object v0
        """.trimIndent(),
    )

    labelClass.addMethod(method)
}

/**
 * 行を 1 つ描く static メソッドを extension のクラスへ追加します。
 *
 * <p>行を出す経路と出さない経路の両方で group を発行します。LINE 自身の各行がこの形（条件が
 * 成り立たない場合も別 key の空 group を出す）を採っており、Compose の slot 構造を recomposition
 * のたびに一定へ保つために必要です。</p>
 */
private fun addRenderMethod(rowClass: MutableClass, shape: ComposeMenuShape, chatIdField: FieldReference) {
    val method = newMethod(
        definingClass = rowClass.type,
        name = RENDER_METHOD_NAME,
        parameterTypes = listOf(OBJECT, OBJECT, shape.composerType),
        returnType = VOID,
        accessFlags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value,
        registerCount = RENDER_REGISTER_COUNT,
        returnsObject = false,
    )

    val dismiss = "v${RENDER_REGISTER_COUNT - 3}"
    val item = "v${RENDER_REGISTER_COUNT - 2}"
    val composer = "v${RENDER_REGISTER_COUNT - 1}"

    method.addInstructionsWithLabels(
        0,
        """
            const/4 v7, 0x0
            instance-of v0, $item, ${shape.itemType}
            if-eqz v0, :rwrRowNoChat
            check-cast $item, ${shape.itemType}
            iget-object v7, $item, ${chatIdField.smali()}
            :rwrRowNoChat
            invoke-static { v7 }, $SHOULD_SHOW_ROW
            move-result v0
            if-eqz v0, :rwrRowHidden
            const v0, $GROUP_KEY_SHOWN
            invoke-interface { $composer, v0 }, ${shape.startReplaceGroup.smali()}
            new-instance v0, $ACTION_TYPE
            invoke-direct { v0, v7, $dismiss }, $ACTION_CONSTRUCTOR
            new-instance v1, $LABEL_TYPE
            invoke-direct { v1 }, $LABEL_CONSTRUCTOR
            const v2, $GROUP_KEY_LAMBDA
            invoke-static { v2, v1, $composer }, ${shape.rememberLambda.smali()}
            move-result-object v3
            const/4 v1, 0x0
            const/4 v2, 0x0
            move-object v4, $composer
            const/16 v5, $ROW_CHANGED
            const/4 v6, $ROW_DEFAULT
            invoke-static/range { v0 .. v6 }, ${shape.rowComposable.smali()}
            invoke-interface { $composer }, ${shape.endReplaceGroup.smali()}
            goto :rwrRowDone
            :rwrRowHidden
            const v0, $GROUP_KEY_HIDDEN
            invoke-interface { $composer, v0 }, ${shape.startReplaceGroup.smali()}
            invoke-interface { $composer }, ${shape.endReplaceGroup.smali()}
            :rwrRowDone
            nop
        """.trimIndent(),
    )

    rowClass.addMethod(method)
}

/**
 * 指定した register 数を持つ空のメソッドを作ります。`MutableMethodImplementation` の registerCount は
 * 変更できないため、注入したい smali が必要とする register 数をここで確定させます。末尾の 1〜2 命令は
 * 注入後に到達しない dead code として残りますが、型は矛盾しない形にしています。
 */
private fun newMethod(
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

/**
 * DEX writer は `methods` ではなく `directMethods` / `virtualMethods` を読むため、両方へ登録します。
 * `MutableMethod` の equals は method reference 由来なので、重複登録は Set 上で無視されます。
 */
private fun MutableClass.addMethod(method: MutableMethod) {
    methods.add(method)
    if (AccessFlags.STATIC.isSet(method.accessFlags)) {
        directMethods.add(method)
    } else {
        virtualMethods.add(method)
    }
}

/** メニュー本体の Composer の型と register。`shouldExecute` `(I, Z)Z` の receiver から求めます。 */
private data class MenuComposer(val type: String, val register: Int, val castIndex: Int, val shouldExecute: MethodReference)

private fun menuComposer(instructions: List<Instruction>): MenuComposer? {
    val index = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_INTERFACE && methodReference(instruction)?.let { reference ->
            reference.parameterTypes.map(CharSequence::toString) == listOf(INT, BOOLEAN) &&
                reference.returnType == BOOLEAN
        } == true
    }
    if (index < 0) {
        return null
    }
    val shouldExecute = methodReference(instructions[index]) ?: return null
    val register = (instructions[index] as? FiveRegisterInstruction)?.registerC ?: return null
    val castIndex = (0 until index).firstOrNull { candidate ->
        instructions[candidate].opcode == Opcode.CHECK_CAST &&
            typeReference(instructions[candidate]) == shouldExecute.definingClass &&
            (instructions[candidate] as OneRegisterInstruction).registerA == register
    } ?: return null
    return MenuComposer(shouldExecute.definingClass, register, castIndex, shouldExecute)
}

private fun itemInstanceOfIndex(instructions: List<Instruction>, itemType: String): Int =
    instructions.indexOfFirst { it.opcode == Opcode.INSTANCE_OF && typeReference(it) == itemType }

/**
 * トーク項目の分岐内で行一覧の composable を呼ぶ位置。`(項目, Function1, Composer, int)V` を、
 * メニュー本体の Composer を第 3 引数にして呼ぶものが 1 つだけのときに返します。
 */
private fun rowListCallIndex(instructions: List<Instruction>, composer: MenuComposer, itemIndex: Int): Int? =
    (itemIndex + 1 until instructions.size).filter { index ->
        val instruction = instructions[index]
        val reference = methodReference(instruction)
        instruction.opcode == Opcode.INVOKE_STATIC && reference != null && reference.returnType == VOID &&
            reference.parameterTypes.map(CharSequence::toString).let { parameters ->
                parameters.size == 4 && parameters[2] == composer.type && parameters[3] == INT
            } &&
            (instruction as? FiveRegisterInstruction)?.registerE == composer.register
    }.singleOrNull()

/** fingerprint の絞り込みにだけ使うため、ここでは register の生存や分岐先を検証しません。 */
internal fun looksLikeComposeMenu(method: Method, itemType: String): Boolean {
    val instructions = method.implementation?.instructions?.toList() ?: return false
    val itemIndex = itemInstanceOfIndex(instructions, itemType)
    if (itemIndex < 0) {
        return false
    }
    val composer = menuComposer(instructions) ?: return false
    return rowListCallIndex(instructions, composer, itemIndex) != null
}

/**
 * メニュー本体と行一覧の composable を検証し、注入に必要な参照と register を取り出します。
 * 実測どおりの並びでなければ null を返し、patch は何も注入しません。
 */
internal fun composeMenuShape(
    method: Method,
    itemType: String,
    resolveRowList: (MethodReference) -> Method?,
): ComposeMenuShape? {
    val implementation = method.implementation ?: return null
    val instructions = implementation.instructions.toList()
    val itemIndex = itemInstanceOfIndex(instructions, itemType)
    if (itemIndex < 0) {
        return null
    }
    val composer = menuComposer(instructions) ?: return null
    val insertionIndex = rowListCallIndex(instructions, composer, itemIndex) ?: return null
    val itemRegister = (instructions[itemIndex] as TwoRegisterInstruction).registerB

    val rowListReference = methodReference(instructions[insertionIndex]) ?: return null
    val rowListInstructions = resolveRowList(rowListReference)?.implementation?.instructions?.toList() ?: return null
    val rowCalls = rowListInstructions.filter { isRowComposableCall(it, composer.type) }
    val rowComposable = rowCalls.mapNotNull { methodReference(it) }.distinct().singleOrNull() ?: return null
    val function0Type = rowComposable.parameterTypes[0].toString()

    // 閉じる動作の lambda は、挿入位置より前に読む唯一の Function0 field です。
    val dismissReads = (0 until insertionIndex).filter { index ->
        instructions[index].opcode == Opcode.IGET_OBJECT && fieldReference(instructions[index])?.type == function0Type
    }
    val dismissIndex = dismissReads.singleOrNull() ?: return null
    val dismissRegister = (instructions[dismissIndex] as OneRegisterInstruction).registerA

    // 行の呼び出しは 35c 形式の invoke-static なので、引数の register は 4bit（v0〜v15）しか取れません。
    if (composer.register !in 0..15 || itemRegister !in 0..15 || dismissRegister !in 0..15) {
        return null
    }
    if (
        !registerSurvivesBetween(instructions, composer.register, composer.castIndex, insertionIndex) ||
        !registerSurvivesBetween(instructions, itemRegister, itemIndex, insertionIndex) ||
        !registerSurvivesBetween(instructions, dismissRegister, dismissIndex, insertionIndex)
    ) {
        return null
    }

    // 行は composition のたびに必ず 1 回描く必要があります。dexlib2 は注入位置へ新しい location を
    // 挿入し、既存 location は Label を保持したまま後ろへずれるため、注入位置が既存の分岐先や
    // 例外 handler の先頭と一致すると、その経路だけが行を飛び越して slot 構造がずれます。
    if (isDivertedInjectionIndex(instructions, insertionIndex, exceptionHandlerAddresses(implementation))) {
        return null
    }

    val rememberLambda = rowListInstructions
        .mapNotNull { instruction ->
            if (instruction.opcode != Opcode.INVOKE_STATIC) return@mapNotNull null
            val reference = methodReference(instruction) ?: return@mapNotNull null
            val parameters = reference.parameterTypes.map(CharSequence::toString)
            if (parameters.size == 3 && parameters[0] == INT && parameters[2] == composer.type &&
                reference.returnType != VOID
            ) {
                reference
            } else {
                null
            }
        }
        .distinct()
        .singleOrNull() ?: return null

    val startReplaceGroup = composerCalls(instructions, composer.type, listOf(INT))
        .distinct()
        .singleOrNull() ?: return null

    // 行一覧の直後に呼ばれる引数なしの composer メソッドが endReplaceGroup です。
    // 同じ形の skipToGroupEnd と取り違えないよう、呼び出し位置で区別します。
    val endReplaceGroup = methodReference(instructions.getOrNull(insertionIndex + 1))
        ?.takeIf { it.definingClass == composer.type && it.parameterTypes.isEmpty() && it.returnType == VOID }
        ?: return null

    val skipToGroupEnd = composerCalls(instructions, composer.type, emptyList())
        .distinct()
        .filter { it != endReplaceGroup }
        .singleOrNull() ?: return null

    val labelDonorType = labelDonorType(rowListInstructions, rememberLambda) ?: return null

    return ComposeMenuShape(
        insertionIndex = insertionIndex,
        composerType = composer.type,
        itemType = itemType,
        dismissRegister = dismissRegister,
        itemRegister = itemRegister,
        composerRegister = composer.register,
        rowComposable = rowComposable,
        rememberLambda = rememberLambda,
        startReplaceGroup = startReplaceGroup,
        endReplaceGroup = endReplaceGroup,
        skipToGroupEnd = skipToGroupEnd,
        shouldExecute = composer.shouldExecute,
        labelDonorType = labelDonorType,
    )
}

/**
 * `rememberComposableLambda` へ渡される lambda の型。直前の `new-instance` から取り出します。
 * この lambda が、複製元とするラベル描画の実装を持ちます。
 */
private fun labelDonorType(instructions: List<Instruction>, rememberLambda: MethodReference): String? {
    for (index in instructions.indices) {
        val instruction = instructions[index]
        if (instruction.opcode != Opcode.INVOKE_STATIC) continue
        if (methodReference(instruction) != rememberLambda) continue
        val lambdaRegister = (instruction as? Instruction35c)?.registerD ?: continue

        for (previous in index - 1 downTo 0) {
            val candidate = instructions[previous]
            if (candidate.opcode != Opcode.NEW_INSTANCE) continue
            if ((candidate as OneRegisterInstruction).registerA != lambdaRegister) continue
            return typeReference(candidate)
        }
    }
    return null
}

/**
 * 複製元のラベル描画 lambda から、`Text` の method reference と `kotlin.Unit.INSTANCE` の
 * field reference を取り出します。どちらも 1 件に絞れない場合は null を返します。
 */
internal fun labelDonorShape(methods: List<Method>): LabelDonorShape? {
    val invoke = methods.singleOrNull { candidate ->
        candidate.name == LABEL_METHOD_NAME &&
            candidate.returnType == OBJECT &&
            candidate.parameterTypes.map(CharSequence::toString) == listOf(OBJECT, OBJECT)
    } ?: return null
    val instructions = invoke.implementation?.instructions?.toList() ?: return null

    val text = instructions
        .filter { it.opcode == Opcode.INVOKE_STATIC_RANGE }
        .filter { (it as RegisterRangeInstruction).registerCount == TEXT_REGISTER_COUNT }
        .mapNotNull { methodReference(it) }
        .distinct()
        .singleOrNull() ?: return null

    val unitField = instructions
        .filter { it.opcode == Opcode.SGET_OBJECT }
        .mapNotNull { fieldReference(it) }
        .distinct()
        .singleOrNull() ?: return null

    return LabelDonorShape(text = text, unitField = unitField)
}

/** トーク項目の型が持つ、ただ 1 つの String instance field。これがトーク ID です。 */
internal fun chatIdField(itemClass: com.android.tools.smali.dexlib2.iface.ClassDef?): FieldReference? =
    itemClass?.instanceFields?.singleOrNull { it.type == STRING }

/**
 * 行 composable の呼び出しかどうか。引数は
 * `(Function0, Modifier, Function2, Function2, Composer, int, int)` を返り値 void で取ります。
 */
private fun isRowComposableCall(instruction: Instruction, composerType: String): Boolean {
    if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) {
        return false
    }
    val reference = methodReference(instruction) ?: return false
    val parameters = reference.parameterTypes.map(CharSequence::toString)
    return reference.returnType == VOID &&
        parameters.size == 7 &&
        parameters[4] == composerType &&
        parameters[5] == INT &&
        parameters[6] == INT
}

/** Composer の interface メソッド呼び出しのうち、引数と返り値 void が一致するもの。 */
private fun composerCalls(
    instructions: List<Instruction>,
    composerType: String,
    parameters: List<String>,
): List<MethodReference> = instructions
    .filter { it.opcode == Opcode.INVOKE_INTERFACE || it.opcode == Opcode.INVOKE_INTERFACE_RANGE }
    .mapNotNull { methodReference(it) }
    .filter {
        it.definingClass == composerType &&
            it.returnType == VOID &&
            it.parameterTypes.map(CharSequence::toString) == parameters
    }

private fun MethodReference.smali(): String =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun FieldReference.smali(): String = "$definingClass->$name:$type"

private fun methodReference(instruction: Instruction?): MethodReference? =
    (instruction as? ReferenceInstruction)?.reference as? MethodReference

private fun fieldReference(instruction: Instruction?): FieldReference? =
    (instruction as? ReferenceInstruction)?.reference as? FieldReference

private fun typeReference(instruction: Instruction?): String? =
    ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type

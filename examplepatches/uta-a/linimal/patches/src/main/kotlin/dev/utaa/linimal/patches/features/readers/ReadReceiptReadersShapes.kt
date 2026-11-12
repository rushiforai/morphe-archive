package dev.utaa.linimal.patches.features.readers

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.utaa.linimal.patches.util.BOOLEAN
import dev.utaa.linimal.patches.util.LONG
import dev.utaa.linimal.patches.util.STRING
import dev.utaa.linimal.patches.util.VOID
import dev.utaa.linimal.patches.util.branchTargetAddress
import dev.utaa.linimal.patches.util.instructionAddress
import dev.utaa.linimal.patches.util.instructionWritesRegister
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex
import dev.utaa.linimal.patches.util.registerSurvivesBetween

/*
 * 既読者の表示に使う命令列の形の判定。Android や patcher の context に依存しない純粋関数にし、
 * 合成した命令列で unit test します。
 */

internal const val TEXT_VIEW = "Landroid/widget/TextView;"
internal const val VIEW = "Landroid/view/View;"
internal const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
internal const val SET = "Ljava/util/Set;"
internal const val SQLITE_DATABASE = "Landroid/database/sqlite/SQLiteDatabase;"
internal const val DIALOG_INTERFACE = "Landroid/content/DialogInterface;"

/** `ChatMessageCommonViewData` の toString の marker。data class の文字列は難読化されません。 */
internal const val MESSAGE_COMMON_MARKER = "ChatMessageCommonViewData(chatId="
internal const val SERVER_MESSAGE_ID_MARKER = ", serverMessageId="
internal const val SENDER_MID_MARKER = ", senderMid="
internal const val OTHER_USER_MESSAGE_MARKER = ", isOtherUserMessage="

/** 既読ラベルの bind で、メッセージ種別が既読数を持つかを問う非難読化のメソッド名。 */
internal const val READ_COUNT_REQUIRED_METHOD = "isReadCountRequired"

/** メッセージの共通 view data から読む 3 つの field。 */
internal data class MessageFields(
    val type: String,
    val chatId: FieldReference,
    val serverMessageId: FieldReference,
    val senderMid: FieldReference,
    /** 他人が送ったメッセージかどうか。受信行の bind にだけ使い、見つからなければ null です。 */
    val isOtherUserMessage: FieldReference?,
)

/**
 * `ChatMessageCommonViewData.toString()` の命令列から field を特定します。
 *
 * <ul>
 *   <li>chatId: 先頭の marker の後で最初に読む String field</li>
 *   <li>serverMessageId: `, serverMessageId=` の後で最初に読む long field</li>
 *   <li>senderMid: `, senderMid=` を渡す呼び出しで、その文字列の直後の引数に入る String field</li>
 * </ul>
 */
internal fun messageFieldsFromToString(type: String, instructions: List<Instruction>): MessageFields? {
    val headIndex = constStringIndex(instructions, MESSAGE_COMMON_MARKER) ?: return null
    val serverIndex = constStringIndex(instructions, SERVER_MESSAGE_ID_MARKER) ?: return null

    val chatId = (headIndex + 1 until instructions.size).asSequence()
        .map { instructions[it] }
        .firstOrNull { it.opcode == Opcode.IGET_OBJECT }
        ?.let { fieldReference(it) }
        ?.takeIf { it.definingClass == type && it.type == STRING }
        ?: return null
    val serverMessageId = (serverIndex + 1 until instructions.size).asSequence()
        .map { instructions[it] }
        .firstOrNull { it.opcode == Opcode.IGET_WIDE }
        ?.let { fieldReference(it) }
        ?.takeIf { it.definingClass == type && it.type == LONG }
        ?: return null

    val senderMid = labeledStringField(type, instructions, SENDER_MID_MARKER) ?: return null

    if (chatId.name == senderMid.name) {
        return null
    }
    val otherIndex = constStringIndex(instructions, OTHER_USER_MESSAGE_MARKER)
    val isOtherUserMessage = otherIndex?.let { start ->
        (start + 1 until instructions.size).asSequence()
            .map { instructions[it] }
            .firstOrNull { it.opcode == Opcode.IGET_BOOLEAN }
            ?.let { fieldReference(it) }
            ?.takeIf { it.definingClass == type && it.type == BOOLEAN }
    }
    return MessageFields(type, chatId, serverMessageId, senderMid, isOtherUserMessage)
}

/**
 * toString で `label` の文字列を渡す呼び出しのうち、その文字列の直後の引数に入る String field。
 *
 * <p>Kotlin の data class の toString は、`(..., "label=", value, ...)` の順に StringBuilder helper へ渡します。
 * 同じ helper に複数の field を渡すため、「最初に読む field」ではなく引数の位置で決めます。</p>
 */
internal fun labeledStringField(type: String, instructions: List<Instruction>, label: String): FieldReference? {
    val labelIndex = constStringIndex(instructions, label) ?: return null
    val labelRegister = (instructions[labelIndex] as? OneRegisterInstruction)?.registerA ?: return null
    val callIndex = (labelIndex + 1 until instructions.size).firstOrNull { index ->
        val opcode = instructions[index].opcode
        (opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE) &&
            invokeRegisters(instructions[index])?.contains(labelRegister) == true
    } ?: return null
    val arguments = invokeRegisters(instructions[callIndex]) ?: return null
    val valueRegister = arguments.getOrNull(arguments.indexOf(labelRegister) + 1) ?: return null
    // label を読み込んでから呼び出しまでの間に、その引数 register へ最後に読み込んだ field。
    return (labelIndex + 1 until callIndex).reversed().asSequence()
        .map { instructions[it] }
        .firstOrNull { instructionWritesRegister(it, valueRegister) }
        ?.takeIf { it.opcode == Opcode.IGET_OBJECT }
        ?.let { fieldReference(it) }
        ?.takeIf { it.definingClass == type && it.type == STRING }
}

/** LINE の Profile（自分のアカウント）の toString の marker。 */
internal const val PROFILE_MARKER = "Profile(authTokenV1="
internal const val PROFILE_MID_MARKER = ", mid="

/** 自分の Profile を返す、名前が難読化されない interface method。 */
internal const val GET_PROFILE_METHOD = "getProfile"

/**
 * `(Context)String` の static helper が、`getProfile()` の戻り値から自分の mid を読んで返すかどうか。
 *
 * ```
 * sget-object / invoke-static <lookup> / move-result-object / check-cast
 * invoke-interface {P}, <owner>->getProfile()<profile>
 * move-result-object P
 * iget-object P, P, <profile>->mid:Ljava/lang/String;
 * ...
 * return-object
 * ```
 */
internal fun isOwnMidGetter(instructions: List<Instruction>, profileType: String, midField: FieldReference): Boolean {
    val calls = instructions.indices.filter { index ->
        val reference = methodReference(instructions[index])
        instructions[index].opcode == Opcode.INVOKE_INTERFACE &&
            reference?.name == GET_PROFILE_METHOD &&
            reference.returnType == profileType &&
            reference.parameterTypes.isEmpty()
    }
    val callIndex = calls.singleOrNull() ?: return false
    val result = instructions.getOrNull(callIndex + 1) as? OneRegisterInstruction ?: return false
    val read = instructions.getOrNull(callIndex + 2) ?: return false
    val readField = fieldReference(read) ?: return false
    if (
        instructions[callIndex + 1].opcode != Opcode.MOVE_RESULT_OBJECT ||
        read.opcode != Opcode.IGET_OBJECT ||
        (read as TwoRegisterInstruction).registerB != result.registerA ||
        readField.definingClass != midField.definingClass ||
        readField.name != midField.name ||
        readField.type != midField.type
    ) {
        return false
    }
    // mid を読んだ後は、空文字への置き換え以外の加工をせずに返すこと。
    return instructions.drop(callIndex + 3).all { instruction ->
        instruction.opcode in setOf(
            Opcode.IF_NEZ, Opcode.IF_EQZ, Opcode.CONST_STRING, Opcode.RETURN_OBJECT, Opcode.NOP,
        )
    } && instructions.any { it.opcode == Opcode.RETURN_OBJECT }
}

/** 既読ラベルの bind で hook を挿入する 2 か所と、使う register。 */
internal data class ReadCountBindShape(
    /** 表示する経路の `setVisibility` の直後（`goto` の前）。 */
    val shownInjectionIndex: Int,
    /** 隠す経路の `setVisibility` の直後。合流点の label は元の命令に残るため、ここは隠す経路だけが通ります。 */
    val hiddenInjectionIndex: Int,
    val labelRegister: Int,
    val messageRegister: Int,
    /** メッセージの view data（`he1.h` 相当）の型。 */
    val messageHolderType: String,
)

/**
 * 既読ラベルの bind の形を検証します。
 *
 * ```
 * iget-object T, _, <holder>->a:Landroid/widget/TextView;
 * invoke-virtual {H}, <message>->d()<kind>
 * move-result-object K
 * invoke-virtual {K}, <kind>->isReadCountRequired()Z
 * ...
 * invoke-virtual {T, S}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
 * const/4 Z, 0x0
 * invoke-virtual {T, Z}, Landroid/view/View;->setVisibility(I)V   ← 表示
 * goto :merge
 * invoke-virtual {T, Y}, Landroid/view/View;->setVisibility(I)V   ← 非表示
 * :merge
 * ```
 */
internal fun readCountBindShape(
    instructions: List<Instruction>,
    handlerAddresses: Set<Int> = emptySet(),
): ReadCountBindShape? {
    val readCountIndices = instructions.indices.filter { index ->
        val reference = methodReference(instructions[index])
        instructions[index].opcode == Opcode.INVOKE_VIRTUAL &&
            reference?.name == READ_COUNT_REQUIRED_METHOD &&
            reference.returnType == BOOLEAN &&
            reference.parameterTypes.isEmpty()
    }
    val readCountIndex = readCountIndices.singleOrNull() ?: return null
    val readCount = methodReference(instructions[readCountIndex]) ?: return null

    val kindCall = instructions.getOrNull(readCountIndex - 2) ?: return null
    val kindReference = methodReference(kindCall) ?: return null
    val kindResult = instructions.getOrNull(readCountIndex - 1) as? OneRegisterInstruction ?: return null
    val kindArguments = invokeRegisters(kindCall) ?: return null
    val readCountArguments = invokeRegisters(instructions[readCountIndex]) ?: return null
    if (
        kindCall.opcode != Opcode.INVOKE_VIRTUAL ||
        kindReference.returnType != readCount.definingClass ||
        kindReference.parameterTypes.isNotEmpty() ||
        kindArguments.size != 1 ||
        instructions[readCountIndex - 1].opcode != Opcode.MOVE_RESULT_OBJECT ||
        readCountArguments != listOf(kindResult.registerA)
    ) {
        return null
    }
    val messageRegister = kindArguments.single()

    val labelIndex = readCountIndex - 3
    val labelRead = instructions.getOrNull(labelIndex) ?: return null
    val labelField = fieldReference(labelRead) ?: return null
    if (labelRead.opcode != Opcode.IGET_OBJECT || labelField.type != TEXT_VIEW) {
        return null
    }
    val labelRegister = (labelRead as OneRegisterInstruction).registerA

    val setTextIndex = (readCountIndex + 1 until instructions.size).firstOrNull { index ->
        isVirtualCall(instructions[index], TEXT_VIEW, "setText", listOf(CHAR_SEQUENCE)) &&
            invokeRegisters(instructions[index])?.firstOrNull() == labelRegister
    } ?: return null

    val zero = instructions.getOrNull(setTextIndex + 1)
    val shownIndex = setTextIndex + 2
    val gotoIndex = setTextIndex + 3
    val hiddenIndex = setTextIndex + 4
    val shown = instructions.getOrNull(shownIndex) ?: return null
    val gotoInstruction = instructions.getOrNull(gotoIndex) ?: return null
    val hidden = instructions.getOrNull(hiddenIndex) ?: return null
    if (
        zero?.opcode != Opcode.CONST_4 ||
        (zero as NarrowLiteralInstruction).narrowLiteral != 0 ||
        !isVirtualCall(shown, VIEW, "setVisibility", listOf("I")) ||
        invokeRegisters(shown) != listOf(labelRegister, (zero as OneRegisterInstruction).registerA) ||
        gotoInstruction.opcode !in GOTO_OPCODES ||
        !isVirtualCall(hidden, VIEW, "setVisibility", listOf("I")) ||
        invokeRegisters(hidden)?.firstOrNull() != labelRegister ||
        branchTargetAddress(instructions, gotoIndex) != instructionAddress(instructions, hiddenIndex + 1)
    ) {
        return null
    }

    val shownInjectionIndex = shownIndex + 1
    val hiddenInjectionIndex = hiddenIndex + 1
    if (
        labelRegister !in 0..15 ||
        messageRegister !in 0..15 ||
        labelRegister == messageRegister ||
        // 表示経路の注入位置（goto）へ飛び込む分岐があると、その経路は hook を通りません。
        isDivertedInjectionIndex(instructions, shownInjectionIndex, handlerAddresses) ||
        hiddenInjectionIndex >= instructions.size ||
        !registerSurvivesBetween(instructions, labelRegister, labelIndex, hiddenInjectionIndex) ||
        !registerSurvivesBetween(instructions, messageRegister, readCountIndex - 2, hiddenInjectionIndex)
    ) {
        return null
    }

    return ReadCountBindShape(
        shownInjectionIndex = shownInjectionIndex,
        hiddenInjectionIndex = hiddenInjectionIndex,
        labelRegister = labelRegister,
        messageRegister = messageRegister,
        messageHolderType = kindReference.definingClass,
    )
}

/** メッセージの view data から共通部分を返す getter。bind の中で既に呼ばれているものを再利用します。 */
internal fun messageCommonGetter(
    instructions: List<Instruction>,
    messageHolderType: String,
    messageCommonType: String,
): MethodReference? = instructions
    .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
    .mapNotNull { methodReference(it) }
    .filter {
        it.definingClass == messageHolderType &&
            it.returnType == messageCommonType &&
            it.parameterTypes.isEmpty()
    }
    .distinctBy { "${it.definingClass}->${it.name}" }
    .singleOrNull()

/** 行の view 群（`dr1.g` 相当）が持つ時刻表示の holder と、その TextView。 */
internal data class TimestampHolder(
    val ownerType: String,
    val holderField: FieldReference,
    val textField: FieldReference,
)

/**
 * 行の view 群の constructor で、時刻の TextView を holder に包んで field へ入れる形を検証します。
 *
 * ```
 * new-instance H, <holder>
 * const vI, <chat_ui_row_timestamp>
 * invoke-virtual {root, vI}, Landroid/view/View;->findViewById(I)Landroid/view/View;
 * ...
 * invoke-direct {H, T, ...}, <holder>-><init>(Landroid/widget/TextView;...)V
 * iput-object H, this, <owner>->z:<holder>
 * ```
 *
 * [textFieldOf] は holder の型から、TextView の instance field が 1 つだけならそれを返します。
 */
internal fun timestampHolder(
    instructions: List<Instruction>,
    timestampId: Int,
    textFieldOf: (String) -> FieldReference?,
): TimestampHolder? {
    val literalIndex = instructions.indices.singleOrNull { index ->
        (instructions[index].opcode == Opcode.CONST || instructions[index].opcode == Opcode.CONST_HIGH16) &&
            (instructions[index] as NarrowLiteralInstruction).narrowLiteral == timestampId
    } ?: return null
    val newInstance = (literalIndex - 1 downTo 0).firstOrNull { instructions[it].opcode == Opcode.NEW_INSTANCE }
        ?: return null
    val holderType = typeReference(instructions[newInstance]) ?: return null
    val holderRegister = (instructions[newInstance] as OneRegisterInstruction).registerA
    val constructorIndex = (literalIndex + 1 until instructions.size).firstOrNull { index ->
        val reference = methodReference(instructions[index])
        instructions[index].opcode == Opcode.INVOKE_DIRECT &&
            reference?.definingClass == holderType &&
            reference.name == "<init>" &&
            reference.parameterTypes.firstOrNull()?.toString() == TEXT_VIEW &&
            invokeRegisters(instructions[index])?.firstOrNull() == holderRegister
    } ?: return null
    val store = instructions.getOrNull(constructorIndex + 1) ?: return null
    val holderField = fieldReference(store) ?: return null
    if (
        store.opcode != Opcode.IPUT_OBJECT ||
        (store as TwoRegisterInstruction).registerA != holderRegister ||
        holderField.type != holderType
    ) {
        return null
    }
    val textField = textFieldOf(holderType) ?: return null
    return TimestampHolder(holderField.definingClass, holderField, textField)
}

/** 受信行を含むすべての行で、bind の入口に hook を入れるための register 範囲。 */
internal data class MessageBindEntryShape(
    /** `this` から view data（`he1.h` 相当）までの引数の register 範囲。 */
    val firstRegister: Int,
    val lastRegister: Int,
    /** bridge の引数の型。`this` の型から view data の型までです。 */
    val parameterTypes: List<String>,
    /** `this` から行の view 群を返す getter。 */
    val viewsGetter: MethodReference,
)

/**
 * bind の入口に `invoke-static/range {p0 .. pN}` を入れられるかを検証します。view data までの引数がすべて
 * 参照型（wide でない）で、入口が分岐先でなく、`this` から view 群の getter を呼んでいることが条件です。
 */
internal fun messageBindEntryShape(
    definingClass: String,
    isStatic: Boolean,
    parameterTypes: List<String>,
    registerCount: Int,
    instructions: List<Instruction>,
    messageHolderType: String,
    viewsOwnerType: String,
    handlerAddresses: Set<Int> = emptySet(),
): MessageBindEntryShape? {
    if (isStatic) {
        return null
    }
    val holderIndex = parameterTypes.indexOf(messageHolderType)
    if (holderIndex < 0 || parameterTypes.lastIndexOf(messageHolderType) != holderIndex) {
        return null
    }
    val leading = parameterTypes.take(holderIndex + 1)
    if (leading.any { !it.startsWith("L") && !it.startsWith("[") }) {
        return null
    }
    val parameterRegisterCount = 1 + parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
    val first = registerCount - parameterRegisterCount
    // 引数 register が大きい `this` は `invoke-virtual/range {p0 .. p0}` で渡されます。
    val getter = instructions
        .filter { it.opcode == Opcode.INVOKE_VIRTUAL || it.opcode == Opcode.INVOKE_VIRTUAL_RANGE }
        .mapNotNull { methodReference(it) }
        .filter { it.definingClass == definingClass && it.returnType == viewsOwnerType && it.parameterTypes.isEmpty() }
        .distinctBy { it.name }
        .singleOrNull() ?: return null
    if (first < 0 || isDivertedInjectionIndex(instructions, 0, handlerAddresses)) {
        return null
    }
    return MessageBindEntryShape(
        firstRegister = first,
        lastRegister = first + 1 + holderIndex,
        parameterTypes = listOf(definingClass) + leading,
        viewsGetter = getter,
    )
}

/** 長押しメニューで hook を挿入する位置と、使う register。 */
internal data class ContextMenuShape(
    /** 配色を当てる呼び出しの直前にある `sget-object S, <Set>`。S はここで上書きされるため一時に使えます。 */
    val injectionIndex: Int,
    val scratchRegister: Int,
    val containerRegister: Int,
    val dialogRegister: Int,
    val dialogType: String,
)

/**
 * 長押しメニューの格子を組み立て終えた直後、配色を当てる直前の位置を検証します。
 *
 * ```
 * new-instance D, <DialogInterface を実装する型>      ← メソッド冒頭
 * ...
 * sget-object S, <owner>->a:Ljava/util/Set;
 * invoke-interface {M, C, S, N}, <theme>->r(Landroid/view/View;Ljava/util/Set;...)Z
 * ...
 * iget-object _, D, <dialog>->...                     ← D がまだメニュー本体であることの確認
 * ```
 */
internal fun contextMenuShape(
    instructions: List<Instruction>,
    handlerAddresses: Set<Int> = emptySet(),
    implementsDialogInterface: (String) -> Boolean,
): ContextMenuShape? {
    val themeIndices = instructions.indices.filter { index ->
        val instruction = instructions[index]
        val reference = methodReference(instruction) ?: return@filter false
        val parameters = reference.parameterTypes.map(CharSequence::toString)
        (instruction.opcode == Opcode.INVOKE_INTERFACE || instruction.opcode == Opcode.INVOKE_VIRTUAL) &&
            reference.returnType == BOOLEAN &&
            parameters.size == 3 &&
            parameters[0] == VIEW &&
            parameters[1] == SET
    }
    val themeIndex = themeIndices.singleOrNull() ?: return null
    val themeArguments = invokeRegisters(instructions[themeIndex]) ?: return null
    if (themeArguments.size != 4) {
        return null
    }
    val containerRegister = themeArguments[1]
    val setRegister = themeArguments[2]

    val injectionIndex = themeIndex - 1
    val setRead = instructions.getOrNull(injectionIndex) ?: return null
    if (
        setRead.opcode != Opcode.SGET_OBJECT ||
        fieldReference(setRead)?.type != SET ||
        (setRead as OneRegisterInstruction).registerA != setRegister
    ) {
        return null
    }

    val dialogIndex = instructions.indices.firstOrNull { index ->
        instructions[index].opcode == Opcode.NEW_INSTANCE &&
            typeReference(instructions[index])?.let(implementsDialogInterface) == true
    } ?: return null
    val dialogRegister = (instructions[dialogIndex] as OneRegisterInstruction).registerA
    val dialogType = typeReference(instructions[dialogIndex]) ?: return null
    if (dialogIndex >= injectionIndex) {
        return null
    }
    val confirmedAfter = dialogReadBeforeOverwrite(instructions, themeIndex + 1, dialogRegister, dialogType)

    if (
        !confirmedAfter ||
        setRegister !in 0..15 ||
        containerRegister !in 0..15 ||
        dialogRegister !in 0..15 ||
        setRegister == containerRegister ||
        setRegister == dialogRegister ||
        containerRegister == dialogRegister ||
        isDivertedInjectionIndex(instructions, injectionIndex, handlerAddresses) ||
        !registerSurvivesBetween(instructions, dialogRegister, dialogIndex, injectionIndex)
    ) {
        return null
    }

    return ContextMenuShape(
        injectionIndex = injectionIndex,
        scratchRegister = setRegister,
        containerRegister = containerRegister,
        dialogRegister = dialogRegister,
        dialogType = dialogType,
    )
}

/**
 * [start] 以降で [register] が上書きされる前に、dialog の field として読まれるかどうか。
 * 注入位置で register がまだメニュー本体を指していることの裏取りに使います。
 */
internal fun dialogReadBeforeOverwrite(
    instructions: List<Instruction>,
    start: Int,
    register: Int,
    dialogType: String,
): Boolean {
    for (index in start until instructions.size) {
        val instruction = instructions[index]
        if (
            instruction.opcode == Opcode.IGET_OBJECT &&
            (instruction as TwoRegisterInstruction).registerB == register &&
            fieldReference(instruction)?.definingClass == dialogType
        ) {
            return true
        }
        if (instructionWritesRegister(instruction, register)) {
            return false
        }
    }
    return false
}

/** ReadCountManager の同期 coroutine から読み取る参照。 */
internal data class ReadRangeSyncShape(
    val managerType: String,
    val synchronizerField: FieldReference,
    val databaseField: FieldReference,
    val syncMethod: MethodReference,
    val syncOpcode: Opcode,
    val reasonType: String,
)

/**
 * `ReadCountManager$syncAllNonOpenChatReadCounts$2.invokeSuspend` の末尾の形を検証します。
 *
 * ```
 * iget-object E, M, <manager>->e:<synchronizer>
 * iget-object D, M, <manager>->c:Landroid/database/sqlite/SQLiteDatabase;
 * ...
 * invoke-virtual {E, D, S, R}, <synchronizer>->b(SQLiteDatabase, Set, <reason>)<exception>
 * ```
 */
internal fun readRangeSyncShape(instructions: List<Instruction>): ReadRangeSyncShape? {
    val calls = instructions.indices.filter { index ->
        val reference = methodReference(instructions[index]) ?: return@filter false
        val parameters = reference.parameterTypes.map(CharSequence::toString)
        instructions[index].opcode == Opcode.INVOKE_VIRTUAL &&
            parameters.size == 3 &&
            parameters[0] == SQLITE_DATABASE &&
            parameters[1] == SET &&
            parameters[2].startsWith("L") &&
            reference.returnType.startsWith("L")
    }
    val callIndex = calls.singleOrNull() ?: return null
    val call = methodReference(instructions[callIndex]) ?: return null
    val arguments = invokeRegisters(instructions[callIndex]) ?: return null
    if (arguments.size != 4) {
        return null
    }

    val reads = (0 until callIndex).map { instructions[it] }.filter { it.opcode == Opcode.IGET_OBJECT }
    val synchronizer = reads.lastOrNull {
        (it as OneRegisterInstruction).registerA == arguments[0] &&
            fieldReference(it)?.type == call.definingClass
    }?.let { fieldReference(it) } ?: return null
    val database = reads.lastOrNull {
        (it as OneRegisterInstruction).registerA == arguments[1] &&
            fieldReference(it)?.type == SQLITE_DATABASE
    }?.let { fieldReference(it) } ?: return null
    if (synchronizer.definingClass != database.definingClass) {
        return null
    }
    return ReadRangeSyncShape(
        managerType = synchronizer.definingClass,
        synchronizerField = synchronizer,
        databaseField = database,
        syncMethod = call,
        syncOpcode = instructions[callIndex].opcode,
        reasonType = call.parameterTypes[2].toString(),
    )
}

internal val GOTO_OPCODES = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

internal fun methodReference(instruction: Instruction): MethodReference? =
    (instruction as? ReferenceInstruction)?.reference as? MethodReference

internal fun fieldReference(instruction: Instruction): FieldReference? =
    (instruction as? ReferenceInstruction)?.reference as? FieldReference

internal fun typeReference(instruction: Instruction): String? =
    ((instruction as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.TypeReference)
        ?.type

internal fun MethodReference.smali(): String =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

internal fun FieldReference.smali(): String = "$definingClass->$name:$type"

private fun constStringIndex(instructions: List<Instruction>, value: String): Int? =
    instructions.indices.filter { index ->
        val instruction = instructions[index]
        (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
            ((instruction as ReferenceInstruction).reference as? StringReference)?.string == value
    }.singleOrNull()

private fun isVirtualCall(instruction: Instruction, owner: String, name: String, parameters: List<String>): Boolean {
    val reference = methodReference(instruction) ?: return false
    return instruction.opcode == Opcode.INVOKE_VIRTUAL &&
        reference.definingClass == owner &&
        reference.name == name &&
        reference.returnType == VOID &&
        reference.parameterTypes.map(CharSequence::toString) == parameters
}

/** invoke 命令が実際に渡す register の並び。35c は引数の個数までに限ります。 */
internal fun invokeRegisters(instruction: Instruction): List<Int>? = when (instruction) {
    is RegisterRangeInstruction ->
        (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
    is FiveRegisterInstruction -> listOf(
        instruction.registerC,
        instruction.registerD,
        instruction.registerE,
        instruction.registerF,
        instruction.registerG,
    ).take(instruction.registerCount)
    else -> null
}

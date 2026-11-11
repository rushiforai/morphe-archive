package dev.utaa.linimal.patches.features.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.utaa.linimal.patches.features.readwithoutreceipt.notificationReadWithoutReceiptEntryPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.LIST
import dev.utaa.linimal.patches.util.exceptionHandlerAddresses
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex

private const val ENUM = "Ljava/lang/Enum;"
private const val CLASS_INITIALIZER = "<clinit>"
private const val CHAT_LIST_HEADER_HOOK =
    "Ldev/utaa/linimal/extension/features/ChatListHeaderHooks;->filterButtons(Ljava/util/List;)Ljava/util/List;"

/**
 * トーク一覧上部のボタンは enum で表され、型と field の名前は難読化されます。ただし `Enum.name()` が
 * 返す文字列は `<clinit>` から `Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V` へ渡される定数として
 * 平文で残ります。この定数の集合を fingerprint の主条件にすることで、難読化名を patch へ書かずに済みます。
 */
private val CHAT_LIST_HEADER_BUTTON_NAMES = setOf(
    "AI_FRIEND",
    "ALBUM",
    "CALENDAR",
    "OPEN_CHAT",
    "PLUS_MENU",
)

/** ボタンの基準リストを組み立てるメソッドは 1 件だけです。絞り込めなければ一切注入しません。 */
internal const val CHAT_LIST_HEADER_BUTTONS_TARGET_COUNT = 1

private val chatListHeaderButtonPatchIds = listOf(
    PatchId.CHAT_LIST_HEADER_AI_FRIENDS,
    PatchId.CHAT_LIST_HEADER_CALENDAR,
    PatchId.CHAT_LIST_HEADER_OPEN_CHAT,
)

/**
 * 候補を索引で絞るための anchor。fingerprint の instruction filter に上げた文字列定数は、
 * 全 class 走査ではなくその定数を持つ class だけを候補にするために使われます。custom は
 * [CHAT_LIST_HEADER_BUTTON_NAMES] を 5 つとも引き続き検証するため、一致対象は変わりません。
 */
private const val CHAT_LIST_HEADER_BUTTON_ANCHOR_NAME = "AI_FRIEND"

private val chatListHeaderButtonEnumFingerprint = Fingerprint(
    name = CLASS_INITIALIZER,
    custom = { method, classDef ->
        classDef.superclass == ENUM &&
            method.name == CLASS_INITIALIZER &&
            declaresChatListHeaderButtonNames(method)
    },
    filters = listOf(string(CHAT_LIST_HEADER_BUTTON_ANCHOR_NAME)),
)

/**
 * トーク一覧上部の AI Friends・カレンダー・オープンチャットのアイコンを、表示設定に応じて抑制します。
 *
 * <h2>対象の特定</h2>
 * <p>まず superclass が `Ljava/lang/Enum;` で、`<clinit>` が `AI_FRIEND` / `ALBUM` / `CALENDAR` /
 * `OPEN_CHAT` / `PLUS_MENU` の const-string をすべて持つ class を 1 件だけ選び、ボタンの enum とします。
 * これらは `Enum.name()` が返す文字列なので難読化されません。</p>
 *
 * <p>次にその enum の定数を `sget-object` しているメソッドのうち、**5 定数すべて**を読むものを 1 件だけ
 * 選びます。enum 自身の class（`values()` などの synthetic）と `<clinit>` は除きます。Kotlin の `when` は
 * ordinal の対応表を synthetic class の `<clinit>` で組み立てるため、同じ 5 定数をすべて読みます。
 * 除かないと基準リストの組み立て元と区別できません。</p>
 *
 * <h2>抑制の方法</h2>
 * <p>基準リストは組み立て後に `(Ljava/util/List;)` を取る `invoke-static` で確定し、その結果が
 * StateFlow へ包まれて field へ入ります。この field は初期化でのみ設定され、表示用の一覧はここから
 * 派生します。そのため確定直後の `move-result-object` の**直後**へ hook を挟むと、初期表示と
 * 再計算の両方が一貫して絞り込まれます。ボタンごとの分岐を新しく作らないので、設定が OFF のときは
 * 元の List instance がそのまま流れます。</p>
 */
val chatListHeaderButtonsPatch = bytecodePatch(
    name = "トーク一覧上部のアイコン",
    description = "トーク一覧上部の AI Friends・カレンダー・オープンチャットのアイコンを、実行時設定で個別に取り除けるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    // 機能パッチは単一の直列チェーンを成し、この patch の後段に fisCertificateHeaderPatch が続きます。
    dependsOn(notificationReadWithoutReceiptEntryPatch)

    execute {
        val buttonEnumTypes = chatListHeaderButtonEnumFingerprint.matchAllOrNull().orEmpty()
            .map { it.originalClassDef.type }
            .toSet()
        if (buttonEnumTypes.size != CHAT_LIST_HEADER_BUTTONS_TARGET_COUNT) {
            recordUnappliedFeatureStatus(
                chatListHeaderButtonPatchIds,
                expectedTargetCount = CHAT_LIST_HEADER_BUTTONS_TARGET_COUNT,
                matchCount = buttonEnumTypes.size,
                reason = "ChatListHeaderButtonEnumNotUnique",
            )
            return@execute
        }
        val buttonEnumType = buttonEnumTypes.single()

        val builderFingerprint = Fingerprint(
            custom = { method, classDef ->
                classDef.type != buttonEnumType &&
                    method.name != CLASS_INITIALIZER &&
                    readsAllChatListHeaderButtons(method, buttonEnumType)
            },
        )
        val matches = builderFingerprint.matchAllOrNull().orEmpty()
        if (matches.size != CHAT_LIST_HEADER_BUTTONS_TARGET_COUNT) {
            recordUnappliedFeatureStatus(
                chatListHeaderButtonPatchIds,
                expectedTargetCount = CHAT_LIST_HEADER_BUTTONS_TARGET_COUNT,
                matchCount = matches.size,
                reason = "ChatListHeaderButtonBuilderNotUnique",
            )
            return@execute
        }

        val match = matches.single()
        // 注入位置そのものの安全性は、mutable 側の label 配置ではなく transform 前の
        // instruction / exception table で判定します。
        val originalImplementation = match.originalMethod.implementation
        val injection = originalImplementation?.let {
            chatListHeaderButtonsInjection(
                instructions = it.instructions.toList(),
                buttonEnumType = buttonEnumType,
                handlerAddresses = exceptionHandlerAddresses(it),
                isListType = { type -> isListType(type) { name -> classDefByOrNull(name) } },
            )
        }
        if (injection == null) {
            // cardinality は揃っていても組み立て後の shape が崩れている場合は、何も変更しません。
            recordUnsafeFeatureStatus(
                chatListHeaderButtonPatchIds,
                expectedTargetCount = CHAT_LIST_HEADER_BUTTONS_TARGET_COUNT,
                actualTargetCount = matches.size,
                reason = "ChatListHeaderButtonBuildShapeMismatch",
            )
            return@execute
        }

        match.method.addInstructions(
            injection.index,
            """
                invoke-static/range { v${injection.register} .. v${injection.register} }, $CHAT_LIST_HEADER_HOOK
                move-result-object v${injection.register}
            """.trimIndent(),
        )
        recordFeatureStatus(
            chatListHeaderButtonPatchIds,
            expectedTargetCount = CHAT_LIST_HEADER_BUTTONS_TARGET_COUNT,
            actualTargetCount = CHAT_LIST_HEADER_BUTTONS_TARGET_COUNT,
            reason = "ChatListHeaderButtonsFilteredAfterBuild",
        )
    }
}

/** enum の `<clinit>` が、ボタンの `Enum.name()` 文字列をすべて const-string として持つかどうか。 */
internal fun declaresChatListHeaderButtonNames(method: Method): Boolean {
    val declared = method.implementation?.instructions?.toList().orEmpty()
        .filter { it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO }
        .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
        .toSet()
    return declared.containsAll(CHAT_LIST_HEADER_BUTTON_NAMES)
}

/** ボタンの enum 定数を 5 つとも `sget-object` するメソッドかどうか。基準リストの組み立て元の条件です。 */
internal fun readsAllChatListHeaderButtons(method: Method, buttonEnumType: String): Boolean {
    val read = method.implementation?.instructions?.toList().orEmpty()
        .mapNotNull { chatListHeaderButtonName(it, buttonEnumType) }
        .toSet()
    return read.containsAll(CHAT_LIST_HEADER_BUTTON_NAMES)
}

internal data class ChatListHeaderButtonsInjection(
    val index: Int,
    val register: Int,
)

/**
 * 基準リストが確定する位置を求めます。
 *
 * <p>最後のボタン定数を読んだあと、`(Ljava/util/List;)` を単一引数に取る `invoke-static` と、それに続く
 * `move-result-object` で基準リストが確定します。この並びが 1 組だけであることを確認し、
 * `move-result-object` の**直後**を注入位置として返します。組が見つからない、あるいは複数ある場合は、
 * どれが基準リストなのか決められないので何も注入しません。</p>
 *
 * <p>`invoke-static` は 4bit register しか取れないため、確定した List の register が v15 を超える場合も
 * 拒否します。また注入位置が分岐先や例外 handler の先頭と一致する場合も拒否します。dexlib2 は注入位置へ
 * 新しい location を挿入し、既存 location は Label を保持したまま後ろへずれるため、その経路だけが
 * 絞り込みを飛び越して元の List をそのまま使ってしまいます。</p>
 */
internal fun chatListHeaderButtonsInjection(
    instructions: List<Instruction>,
    buttonEnumType: String,
    handlerAddresses: Set<Int>,
    isListType: (String) -> Boolean,
): ChatListHeaderButtonsInjection? {
    val lastButtonIndex = instructions.indices.lastOrNull { index ->
        chatListHeaderButtonName(instructions[index], buttonEnumType) != null
    } ?: return null

    // 末尾 1 命令は注入位置を持てないため、探索範囲から外します。
    val buildIndex = (lastButtonIndex + 1 until instructions.lastIndex).singleOrNull { index ->
        isChatListBuildCall(instructions[index]) &&
            instructions[index + 1].opcode == Opcode.MOVE_RESULT_OBJECT
    } ?: return null

    // hook は確定後の一覧を List として受け取るため、確定処理の戻り型が List でなければ verifier に拒否されます。
    val buildReturnType = ((instructions[buildIndex] as? ReferenceInstruction)?.reference as? MethodReference)
        ?.returnType ?: return null
    if (!isListType(buildReturnType)) {
        return null
    }

    val resultMove = instructions[buildIndex + 1] as? OneRegisterInstruction ?: return null
    if (resultMove.registerA !in 0..15) {
        return null
    }

    val injectionIndex = buildIndex + 2
    if (isDivertedInjectionIndex(instructions, injectionIndex, handlerAddresses)) {
        return null
    }
    return ChatListHeaderButtonsInjection(index = injectionIndex, register = resultMove.registerA)
}

/** その命令がボタンの enum 定数を読む `sget-object` なら、その定数の名前。違うなら null。 */
private fun chatListHeaderButtonName(instruction: Instruction, buttonEnumType: String): String? {
    if (instruction.opcode != Opcode.SGET_OBJECT) {
        return null
    }
    val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: return null
    return field.name.takeIf {
        field.definingClass == buttonEnumType &&
            field.type == buttonEnumType &&
            it in CHAT_LIST_HEADER_BUTTON_NAMES
    }
}

/**
 * [type] が `java.util.List` そのものか、その実装型かどうか。アプリ内の型は [classDefOf] で親と interface を
 * たどり、アプリ外（JDK）の型は既知の List 実装だけを認めます。たどれない型は List と見なしません。
 */
internal fun isListType(type: String, classDefOf: (String) -> ClassDef?): Boolean {
    val visited = mutableSetOf<String>()
    fun walk(current: String): Boolean {
        if (current == LIST || current in JDK_LIST_TYPES) return true
        if (!visited.add(current)) return false
        val classDef = classDefOf(current) ?: return false
        return classDef.interfaces.any(::walk) || classDef.superclass?.let(::walk) == true
    }
    return walk(type)
}

private val JDK_LIST_TYPES = setOf(
    "Ljava/util/AbstractList;",
    "Ljava/util/AbstractSequentialList;",
    "Ljava/util/ArrayList;",
    "Ljava/util/LinkedList;",
    "Ljava/util/Vector;",
    "Ljava/util/concurrent/CopyOnWriteArrayList;",
)

/** 組み立て済みの一覧を確定させる `invoke-static`。引数は List 1 つ。戻り型は [isListType] で別に確かめます。 */
private fun isChatListBuildCall(instruction: Instruction): Boolean {
    if (instruction.opcode != Opcode.INVOKE_STATIC) {
        return false
    }
    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return reference.parameterTypes.map { it.toString() } == listOf(LIST)
}

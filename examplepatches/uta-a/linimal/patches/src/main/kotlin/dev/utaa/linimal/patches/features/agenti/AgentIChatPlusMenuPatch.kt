package dev.utaa.linimal.patches.features.agenti

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.isSafeInjectionIndex
import dev.utaa.linimal.patches.util.registerSurvivesBetween

private const val VIEW = "Landroid/view/View;"
private const val COMPOSE_VIEW = "Landroidx/compose/ui/platform/ComposeView;"

/** `chat_ui_attach_menu_ai_talk_chip_switch`（26.16.0）。＋ メニュー上部の「トークルームのAgent iを表示」。 */
internal const val PLUS_MENU_AGENT_I_TOGGLE_ID = 0x7f0b068d

private const val VIEW_GONE = 0x8

/**
 * F は LINE が `const/4` の 0/1 から `move` で作る boolean です。hook は `(Z)Z` で受けて同じ register へ戻すため、
 * 後続の `if-eqz` と型が変わりません。
 */
private const val PLUS_MENU_TOGGLE_HOOK =
    "Ldev/utaa/linimal/extension/features/agenti/AgentIChatPlusMenuHooks;->adjustToggleVisibility(Z)Z"

/** 切り替えの ComposeView を ID で引き、表示可否を決める 1 か所。 */
private val plusMenuToggleFingerprint = Fingerprint(
    filters = listOf(
        literal(PLUS_MENU_AGENT_I_TOGGLE_ID),
        methodCall(
            definingClass = VIEW,
            name = "findViewById",
            returnType = VIEW,
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
        methodCall(
            definingClass = VIEW,
            name = "setVisibility",
            returnType = "V",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
)

/** 注入位置と、表示可否の boolean を持つ register。 */
internal data class PlusMenuToggleShape(
    val injectionIndex: Int,
    val flagRegister: Int,
)

/**
 * 切り替えの表示可否を決める命令列を検証します。
 *
 * ```
 * const vI, 0x7f0b068d
 * invoke-virtual {root, vI}, Landroid/view/View;->findViewById(I)Landroid/view/View;
 * move-result-object V
 * check-cast V, Landroidx/compose/ui/platform/ComposeView;
 *                                         ← 注入（F を hook に通す）
 * if-nez V, :found      / goto :end       ← View が無い構成
 * :found
 * if-eqz F, :hidden     / goto :visible
 * :hidden  const/16 X, 0x8
 * :visible invoke-virtual {V, X}, Landroid/view/View;->setVisibility(I)V
 * if-eqz F, :end                          ← 同じ F で中身（setContent）を組み立てるかも決める
 * ```
 *
 * <p>F は直前の分岐の合流点で決まるため、合流点（ラベルを持つ命令）ではなく check-cast の直後へ入れます。
 * ここは分岐先にも例外 handler にもならないことを [isSafeInjectionIndex] で確かめます。</p>
 */
internal fun plusMenuToggleShape(instructions: List<Instruction>): PlusMenuToggleShape? {
    val literalIndex = instructions.indices.singleOrNull { index ->
        val instruction = instructions[index]
        (instruction.opcode == Opcode.CONST || instruction.opcode == Opcode.CONST_HIGH16) &&
            (instruction as NarrowLiteralInstruction).narrowLiteral == PLUS_MENU_AGENT_I_TOGGLE_ID
    } ?: return null
    val idRegister = (instructions[literalIndex] as OneRegisterInstruction).registerA

    val find = instructions.getOrNull(literalIndex + 1) ?: return null
    val findReference = methodReference(find)
    val findArguments = (find as? FiveRegisterInstruction)?.let { listOf(it.registerC, it.registerD).take(it.registerCount) }
    val result = instructions.getOrNull(literalIndex + 2) as? OneRegisterInstruction
    val cast = instructions.getOrNull(literalIndex + 3)
    if (
        find.opcode != Opcode.INVOKE_VIRTUAL ||
        findReference?.definingClass != VIEW ||
        findReference.name != "findViewById" ||
        findArguments?.getOrNull(1) != idRegister ||
        instructions[literalIndex + 2].opcode != Opcode.MOVE_RESULT_OBJECT ||
        result == null ||
        cast?.opcode != Opcode.CHECK_CAST ||
        ((cast as ReferenceInstruction).reference as? TypeReference)?.type != COMPOSE_VIEW ||
        (cast as OneRegisterInstruction).registerA != result.registerA
    ) {
        return null
    }
    val viewRegister = result.registerA
    val injectionIndex = literalIndex + 4

    // 同じ View への setVisibility は 1 回だけで、その前後の if-eqz が同じ register を見ていること。
    val visibilityIndex = (injectionIndex until instructions.size).singleOrNull { index ->
        val reference = methodReference(instructions[index])
        instructions[index].opcode == Opcode.INVOKE_VIRTUAL &&
            reference?.definingClass == VIEW &&
            reference.name == "setVisibility" &&
            (instructions[index] as FiveRegisterInstruction).registerC == viewRegister
    } ?: return null
    val firstFlagCheck = (injectionIndex until visibilityIndex).firstOrNull {
        instructions[it].opcode == Opcode.IF_EQZ &&
            (instructions[it] as OneRegisterInstruction).registerA != viewRegister
    } ?: return null
    val flagRegister = (instructions[firstFlagCheck] as OneRegisterInstruction).registerA
    // setVisibility の引数は、F の分岐の中（F を見た後）で GONE が書かれる register であること。
    val visibilityArgument = (instructions[visibilityIndex] as FiveRegisterInstruction).registerD
    val goneWritten = (firstFlagCheck + 1 until visibilityIndex).any { index ->
        val instruction = instructions[index]
        (instruction.opcode == Opcode.CONST_16 || instruction.opcode == Opcode.CONST_4 || instruction.opcode == Opcode.CONST) &&
            (instruction as OneRegisterInstruction).registerA == visibilityArgument &&
            (instruction as NarrowLiteralInstruction).narrowLiteral == VIEW_GONE
    }
    val secondFlagCheck = instructions.getOrNull(visibilityIndex + 1) as? OneRegisterInstruction
    if (
        instructions.getOrNull(visibilityIndex + 1)?.opcode != Opcode.IF_EQZ ||
        secondFlagCheck?.registerA != flagRegister ||
        !goneWritten ||
        flagRegister !in 0..15 ||
        flagRegister == viewRegister ||
        !registerSurvivesBetween(instructions, flagRegister, injectionIndex - 1, visibilityIndex + 1)
    ) {
        return null
    }
    return PlusMenuToggleShape(injectionIndex, flagRegister)
}

/**
 * トークの ＋ メニュー上部にある「トークルームのAgent iを表示」の切り替えを、実行時設定で隠せるようにします。
 *
 * <p>LINE は Agent i in chat が使える構成で、この ComposeView を VISIBLE にして中身を組み立てます。
 * 表示可否の boolean だけを hook に通し、抑制時は LINE 自身の「使えない構成」と同じ経路（GONE で中身なし）を通します。
 * Agent i in chat の設定値や通信は変更しません。</p>
 */
val agentIChatPlusMenuPatch = bytecodePatch(
    name = "Agent i in chat plus menu",
    description = "トークの ＋ メニュー上部にある Agent i の切り替えを、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    // 機能パッチは単一の直列チェーンを成し、この patch の後段に lineAiMessageContextMenuPatch が続きます。
    dependsOn(agentIChatComposerPatch)

    execute {
        val patchIds = listOf(PatchId.AGENT_I_CHAT_PLUS_MENU)
        val matches = plusMenuToggleFingerprint.matchAllOrNull().orEmpty()
        val match = matches.singleOrNull()
        if (match == null) {
            recordUnappliedFeatureStatus(patchIds, 1, matches.size, "AgentIPlusMenuToggleNotUnique")
            return@execute
        }
        val implementation = match.method.implementation
        val shape = plusMenuToggleShape(implementation?.instructions?.toList().orEmpty())
        if (shape == null || !isSafeInjectionIndex(implementation, shape.injectionIndex)) {
            recordUnsafeFeatureStatus(patchIds, 1, 1, "AgentIPlusMenuToggleShapeMismatch")
            return@execute
        }
        match.method.addInstructions(
            shape.injectionIndex,
            """
                invoke-static/range { v${shape.flagRegister} .. v${shape.flagRegister} }, $PLUS_MENU_TOGGLE_HOOK
                move-result v${shape.flagRegister}
            """.trimIndent(),
        )
        recordFeatureStatus(patchIds, 1, 1, "AgentIPlusMenuToggleGuarded")
    }
}

private fun methodReference(instruction: Instruction): MethodReference? =
    (instruction as? ReferenceInstruction)?.reference as? MethodReference

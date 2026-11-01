package dev.jason.gboardpatches.patches.gboard.features.japaneseqwertyglide

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import dev.jason.gboardpatches.patches.gboard.features.japaneseqwertyglide.GboardJapaneseQwertyGlideTargets.DELIGHT5_FIELD
import dev.jason.gboardpatches.patches.gboard.features.japaneseqwertyglide.GboardJapaneseQwertyGlideTargets.FIND_VIEW_BY_ID
import dev.jason.gboardpatches.patches.gboard.features.japaneseqwertyglide.GboardJapaneseQwertyGlideTargets.HANDLER_CONTEXT_MANAGER_FIELD
import dev.jason.gboardpatches.patches.gboard.features.japaneseqwertyglide.GboardJapaneseQwertyGlideTargets.HANDLER_INFO_ARRAY
import dev.jason.gboardpatches.patches.gboard.features.japaneseqwertyglide.GboardJapaneseQwertyGlideTargets.MANAGER_DELEGATE_FIELD
import dev.jason.gboardpatches.patches.gboard.features.japaneseqwertyglide.GboardJapaneseQwertyGlideTargets.MANAGER_HANDLER_INFOS_FIELD
import dev.jason.gboardpatches.patches.gboard.features.japaneseqwertyglide.GboardJapaneseQwertyGlideTargets.VIEW_DEF_HANDLER_INFOS_FIELD
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationPlan
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationState
import dev.jason.gboardpatches.patches.gboard.shared.applyVerified
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isFieldReference
import dev.jason.gboardpatches.patches.gboard.shared.isInvoke
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.isOpcode
import dev.jason.gboardpatches.patches.gboard.shared.isReference
import dev.jason.gboardpatches.patches.gboard.shared.isRegisterOperation
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardJapaneseQwertyGlideBytecodePatch = bytecodePatch(
    description = "在日文 QWERTY ABC 模式解碼英文滑行詞彙、即時顯示候選並在確定後加入半形空格",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        JAPANESE_GLIDE_HOOKS.forEach { hook ->
            val original = findMutableMethodOrThrow(hook.target)
            val patched = original.applyJapaneseGlideHook(hook)
            if (original !== patched) {
                hook.target.ownerClass(this).methods.apply {
                    remove(original)
                    add(patched)
                }
            }
        }
    }
}

internal class JapaneseGlideHook(
    val target: GboardMethodTarget,
    val call: RuntimeCallId,
    val registerCount: Int,
    val delegateRange: IntRange,
    val isStockShape: (List<Instruction>) -> Boolean,
    val isDelegateShape: (List<Instruction>) -> Boolean,
    val mutate: MutableMethod.() -> Unit,
    val tryBlockCount: Int = 0,
    val patchedRegisterCount: Int = registerCount,
    val isPatchedStockShape: (List<Instruction>) -> Boolean = isStockShape,
    val replace: ((MutableMethod) -> MutableMethod)? = null,
)

internal fun MutableMethod.applyJapaneseGlideHook(hook: JapaneseGlideHook): MutableMethod {
    check(hook.target.matches(this)) { "Refusing non-target method for ${hook.target.reference}" }
    return applyVerified(
        VerifiedTransformationPlan(
            targetName = hook.target.reference,
            classify = { method -> method.classifyJapaneseGlideHook(hook) },
            mutate = { method -> hook.replace?.invoke(method) ?: method.apply(hook.mutate) },
        ),
    )
}

private fun MutableMethod.classifyJapaneseGlideHook(
    hook: JapaneseGlideHook,
): VerifiedTransformationState {
    val implementation = implementation ?: error("No instructions in ${hook.target.reference}")
    val instructions = implementation.instructions.toList()
    val reference = RuntimeAbiCatalog.abi(hook.call).reference
    val callCount = instructions.count { it.isMethodReference(reference) }
    val expectedRegisters = if (callCount == 0) hook.registerCount else hook.patchedRegisterCount
    if (implementation.registerCount != expectedRegisters || implementation.tryBlocks.size != hook.tryBlockCount) {
        return VerifiedTransformationState.MALFORMED
    }
    return when (callCount) {
        0 -> if (hook.isStockShape(instructions)) {
            VerifiedTransformationState.STOCK
        } else {
            VerifiedTransformationState.MALFORMED
        }
        1 -> {
            val range = hook.delegateRange
            val isPatched = instructions.size > range.last &&
                hook.isDelegateShape(instructions.slice(range)) &&
                hook.isPatchedStockShape(instructions.filterIndexed { index, _ -> index !in range })
            if (isPatched) VerifiedTransformationState.PATCHED else VerifiedTransformationState.MALFORMED
        }
        else -> VerifiedTransformationState.MALFORMED
    }
}

private fun abiReference(call: RuntimeCallId): String = RuntimeAbiCatalog.abi(call).reference

private val ATTACH_CALL = RuntimeCallId.JAPANESE_QWERTY_GLIDE_RUNTIME_AUGMENT_MOTION_EVENT_HANDLERS
private val READY_CALL = RuntimeCallId.JAPANESE_QWERTY_GLIDE_RUNTIME_OVERRIDE_GESTURE_READY
private val INPUT_AREA_CALL = RuntimeCallId.JAPANESE_QWERTY_GLIDE_RUNTIME_OVERRIDE_INPUT_AREA
private val EVENT_CALL = RuntimeCallId.JAPANESE_QWERTY_GLIDE_RUNTIME_HANDLE_HANDLER_EVENT
private val SESSION_CALL = RuntimeCallId.JAPANESE_QWERTY_GLIDE_RUNTIME_ON_INPUT_SESSION_CHANGED

// pmm.<init>: index 13 is `iput-object v2, p0, h` (a branch join point), so the delegate goes
// after it and re-stores h; the stock array-length at 0x0024 then sizes g/t from the new array.
private const val ATTACH_INSERT_INDEX = 14

internal val JAPANESE_GLIDE_HOOKS = listOf(
    JapaneseGlideHook(
        target = GboardJapaneseQwertyGlideTargets.managerInit,
        call = ATTACH_CALL,
        registerCount = 7,
        delegateRange = ATTACH_INSERT_INDEX..ATTACH_INSERT_INDEX + 3,
        isStockShape = { instructions ->
            instructions.size == 24 &&
                instructions[8].isRegisterOperation("IGET_OBJECT", 2, 5) &&
                instructions[8].isFieldReference(VIEW_DEF_HANDLER_INFOS_FIELD) &&
                instructions[13].isRegisterOperation("IPUT_OBJECT", 2, 1) &&
                instructions[13].isFieldReference(MANAGER_HANDLER_INFOS_FIELD) &&
                instructions[14].isOpcode("NEW_INSTANCE") &&
                instructions[18].isRegisterOperation("ARRAY_LENGTH", 2, 2)
        },
        isDelegateShape = { block ->
            block[0].isInvoke("INVOKE_STATIC", abiReference(ATTACH_CALL), 1, 2, 4, 5, 6) &&
                block[1].isRegisterOperation("MOVE_RESULT_OBJECT", 2) &&
                block[2].isRegisterOperation("CHECK_CAST", 2) &&
                block[2].isReference(HANDLER_INFO_ARRAY) &&
                block[3].isRegisterOperation("IPUT_OBJECT", 2, 1) &&
                block[3].isFieldReference(MANAGER_HANDLER_INFOS_FIELD)
        },
        mutate = {
            addInstructions(
                ATTACH_INSERT_INDEX,
                """
                    ${RuntimeCallEmitter.invoke(ATTACH_CALL, "v1, v2, v4, v5, v6")}
                    move-result-object v2
                    check-cast v2, $HANDLER_INFO_ARRAY
                    iput-object v2, v1, $MANAGER_HANDLER_INFOS_FIELD
                """.trimIndent(),
            )
        },
    ),
    JapaneseGlideHook(
        target = GboardJapaneseQwertyGlideTargets.gestureReady,
        call = READY_CALL,
        registerCount = 2,
        delegateRange = 0..4,
        isStockShape = { instructions ->
            instructions.firstOrNull()?.isRegisterOperation("IGET_OBJECT", 0, 1) == true &&
                instructions.first().isFieldReference(DELIGHT5_FIELD) &&
                instructions.last().isOpcode("RETURN")
        },
        isDelegateShape = { block ->
            block[0].isInvoke("INVOKE_STATIC", abiReference(READY_CALL), 1) &&
                block[1].isRegisterOperation("MOVE_RESULT", 0) &&
                block[2].isRegisterOperation("IF_LTZ", 0) &&
                block[3].isRegisterOperation("RETURN", 0) &&
                block[4].isOpcode("NOP")
        },
        mutate = {
            addEntryInterceptor(
                """
                    ${RuntimeCallEmitter.invoke(READY_CALL, "p0")}
                    move-result v0
                    if-ltz v0, :$CONTINUE_LABEL
                    return v0
                """.trimIndent(),
            )
        },
    ),
    JapaneseGlideHook(
        target = GboardJapaneseQwertyGlideTargets.gestureInputArea,
        call = INPUT_AREA_CALL,
        registerCount = 2,
        delegateRange = 0..4,
        isStockShape = { instructions ->
            instructions.firstOrNull()?.isRegisterOperation("IF_NEZ", 1) == true &&
                instructions.count { it.isMethodReference(FIND_VIEW_BY_ID) } == 1 &&
                instructions.last().isOpcode("RETURN_OBJECT")
        },
        isDelegateShape = { block ->
            block[0].isInvoke("INVOKE_STATIC", abiReference(INPUT_AREA_CALL), 0, 1) &&
                block[1].isRegisterOperation("MOVE_RESULT_OBJECT", 0) &&
                block[2].isRegisterOperation("IF_EQZ", 0) &&
                block[3].isRegisterOperation("RETURN_OBJECT", 0) &&
                block[4].isOpcode("NOP")
        },
        mutate = {
            // The stock body never reads p0 (= v0), so v0 can carry the runtime result.
            addEntryInterceptor(
                """
                    ${RuntimeCallEmitter.invoke(INPUT_AREA_CALL, "p0, p1")}
                    move-result-object v0
                    if-eqz v0, :$CONTINUE_LABEL
                    return-object v0
                """.trimIndent(),
            )
        },
    ),
    JapaneseGlideHook(
        target = GboardJapaneseQwertyGlideTargets.handlerContextSend,
        call = EVENT_CALL,
        registerCount = 2,
        patchedRegisterCount = 3,
        delegateRange = 0..3,
        isStockShape = { instructions ->
            instructions.size == 4 &&
                instructions[0].isRegisterOperation("IGET_OBJECT", 0, 0) &&
                instructions[0].isFieldReference(HANDLER_CONTEXT_MANAGER_FIELD) &&
                instructions[1].isRegisterOperation("IGET_OBJECT", 0, 0) &&
                instructions[1].isFieldReference(MANAGER_DELEGATE_FIELD) &&
                instructions[2].isInvoke("INVOKE_INTERFACE", GboardJapaneseQwertyGlideTargets.MANAGER_SEND, 0, 1) &&
                instructions[3].isOpcode("RETURN_VOID")
        },
        isPatchedStockShape = { instructions ->
            instructions.size == 4 &&
                instructions[0].isRegisterOperation("IGET_OBJECT", 0, 1) &&
                instructions[0].isFieldReference(HANDLER_CONTEXT_MANAGER_FIELD) &&
                instructions[1].isRegisterOperation("IGET_OBJECT", 0, 0) &&
                instructions[1].isFieldReference(MANAGER_DELEGATE_FIELD) &&
                instructions[2].isInvoke("INVOKE_INTERFACE", GboardJapaneseQwertyGlideTargets.MANAGER_SEND, 0, 2) &&
                instructions[3].isOpcode("RETURN_VOID")
        },
        isDelegateShape = { block ->
            block[0].isInvoke("INVOKE_STATIC", abiReference(EVENT_CALL), 1, 2) &&
                block[1].isRegisterOperation("MOVE_RESULT", 0) &&
                block[2].isRegisterOperation("IF_EQZ", 0) &&
                block[3].isOpcode("RETURN_VOID")
        },
        mutate = {},
        replace = { original ->
            // The stock method has no locals. Reserve v0 so p0 remains the pml context.
            ImmutableMethod(
                original.definingClass, original.name, original.parameters, original.returnType,
                original.accessFlags, original.annotations, original.hiddenApiRestrictions,
                MutableMethodImplementation(3),
            ).toMutable().apply { addInstructions(0, """
                ${RuntimeCallEmitter.invoke(EVENT_CALL, "p0, p1")}
                move-result v0
                if-eqz v0, :stock
                return-void
                :stock
                iget-object v0, p0, $HANDLER_CONTEXT_MANAGER_FIELD
                iget-object v0, v0, $MANAGER_DELEGATE_FIELD
                invoke-interface {v0, p1}, ${GboardJapaneseQwertyGlideTargets.MANAGER_SEND}
                return-void
            """.trimIndent()) }
        },
    ),
    sessionHook(GboardJapaneseQwertyGlideTargets.keyboardActivate, 3) { instructions ->
        instructions.firstOrNull()?.isReference("Keyboard.onActivate") == true &&
            instructions[1].isMethodReference("Landroid/os/Trace;->beginSection(Ljava/lang/String;)V") &&
            instructions[3].isFieldReference("${GboardJapaneseQwertyGlideTargets.KEYBOARD}->G:Z")
    },
    JapaneseGlideHook(
        target = GboardJapaneseQwertyGlideTargets.keyboardDeactivate,
        call = SESSION_CALL,
        registerCount = 10,
        delegateRange = 0..3,
        isStockShape = { instructions ->
            instructions.firstOrNull()?.isRegisterOperation("IGET_BOOLEAN", 0, 9) == true &&
                instructions.first().isFieldReference("${GboardJapaneseQwertyGlideTargets.KEYBOARD}->G:Z") &&
                instructions.last().isOpcode("RETURN_VOID")
        },
        isDelegateShape = { block ->
            block[0].isRegisterOperation("IGET_BOOLEAN", 0, 9) &&
                block[0].isFieldReference("${GboardJapaneseQwertyGlideTargets.KEYBOARD}->G:Z") &&
                block[1].isRegisterOperation("IF_EQZ", 0) &&
                block[2].isInvoke("INVOKE_STATIC", abiReference(SESSION_CALL)) && block[3].isOpcode("NOP")
        },
        mutate = {
            // An inactive keyboard has no session to invalidate.
            addEntryInterceptor("""
                iget-boolean v0, p0, ${GboardJapaneseQwertyGlideTargets.KEYBOARD}->G:Z
                if-eqz v0, :$CONTINUE_LABEL
                ${RuntimeCallEmitter.invoke(SESSION_CALL, "")}
            """.trimIndent())
        },
    ),
    JapaneseGlideHook(
        target = GboardJapaneseQwertyGlideTargets.japaneseImeEvent,
        call = RuntimeCallId.JAPANESE_QWERTY_GLIDE_SPACING_OBSERVE_IME,
        registerCount = 15,
        delegateRange = 0..0,
        isStockShape = { instructions ->
            instructions.firstOrNull()?.isInvoke("INVOKE_VIRTUAL", "Lohe;->g()Lqbc;", 14) == true &&
                instructions[1].isRegisterOperation("MOVE_RESULT_OBJECT", 0) &&
                instructions.last().isOpcode("RETURN")
        },
        isDelegateShape = { block ->
            block[0].isInvoke("INVOKE_STATIC", abiReference(RuntimeCallId.JAPANESE_QWERTY_GLIDE_SPACING_OBSERVE_IME), 13, 14)
        },
        mutate = {
            addInstructions(0, RuntimeCallEmitter.invoke(RuntimeCallId.JAPANESE_QWERTY_GLIDE_SPACING_OBSERVE_IME, "p0, p1"))
        },
    ),
    JapaneseGlideHook(
        target = GboardJapaneseQwertyGlideTargets.mozcCommit,
        call = RuntimeCallId.JAPANESE_QWERTY_GLIDE_SPACING_APPEND_COMMIT,
        registerCount = 11,
        delegateRange = 0..2,
        isStockShape = { instructions ->
            instructions.firstOrNull()?.isRegisterOperation("IGET_OBJECT", 0, 8) == true &&
                instructions.first().isFieldReference("Lmiz;->e:Lmjf;") &&
                instructions[1].isRegisterOperation("IF_NEZ", 0) &&
                instructions[2].isRegisterOperation("SGET_OBJECT", 0) &&
                instructions[2].isFieldReference("Lmjf;->a:Lmjf;") &&
                instructions.last().isOpcode("RETURN_OBJECT")
        },
        isDelegateShape = { block ->
            block[0].isInvoke("INVOKE_STATIC", abiReference(RuntimeCallId.JAPANESE_QWERTY_GLIDE_SPACING_APPEND_COMMIT), 7, 8, 10) &&
                block[1].isRegisterOperation("MOVE_RESULT_OBJECT", 8) &&
                block[2].isRegisterOperation("CHECK_CAST", 8) && block[2].isReference("Lmiz;")
        },
        mutate = {
            addInstructions(0, """
                ${RuntimeCallEmitter.invoke(RuntimeCallId.JAPANESE_QWERTY_GLIDE_SPACING_APPEND_COMMIT, "p0, p1, p3")}
                move-result-object p1
                check-cast p1, Lmiz;
            """.trimIndent())
        },
    ),
)

private fun sessionHook(
    target: GboardMethodTarget,
    tryBlockCount: Int,
    stock: (List<Instruction>) -> Boolean,
) = JapaneseGlideHook(
    target = target,
    call = SESSION_CALL,
    registerCount = 10,
    tryBlockCount = tryBlockCount,
    delegateRange = 0..0,
    isStockShape = stock,
    isDelegateShape = { block -> block[0].isInvoke("INVOKE_STATIC", abiReference(SESSION_CALL)) },
    mutate = { addInstructions(0, RuntimeCallEmitter.invoke(SESSION_CALL, "")) },
)

private const val CONTINUE_LABEL = "jasondev_continue_japanese_qwerty_glide"

private fun MutableMethod.addEntryInterceptor(smali: String) {
    addInstructions(0, "nop")
    val continuation = checkNotNull(implementation).instructions[0]
    addInstructionsWithLabels(0, smali, ExternalLabel(CONTINUE_LABEL, continuation))
}

package dev.jason.gboardpatches.patches.gboard.features.rambler

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationPlan
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationState
import dev.jason.gboardpatches.patches.gboard.shared.applyVerified
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.gboardStructuralFingerprint
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private val ENTER_LAUNCH_ABI = RuntimeAbiCatalog.abi(
    RuntimeCallId.RAMBLER_RUNTIME_ENTER_LAUNCH_SCOPE,
)
private val EXIT_LAUNCH_ABI = RuntimeAbiCatalog.abi(
    RuntimeCallId.RAMBLER_RUNTIME_EXIT_LAUNCH_SCOPE,
)
private val NGA_ELIGIBILITY_ABI = RuntimeAbiCatalog.abi(
    RuntimeCallId.RAMBLER_RUNTIME_AFTER_NGA_ELIGIBILITY,
)
private val INITIALIZE_FALLBACK_ABI = RuntimeAbiCatalog.abi(
    RuntimeCallId.RAMBLER_RUNTIME_TRY_INITIALIZE_STOCK_FALLBACK,
)
private val ENTER_PARSER_ABI = RuntimeAbiCatalog.abi(
    RuntimeCallId.RAMBLER_RUNTIME_ENTER_PARSER_SCOPE,
)
private val EXIT_PARSER_ABI = RuntimeAbiCatalog.abi(
    RuntimeCallId.RAMBLER_RUNTIME_EXIT_PARSER_SCOPE,
)
private val INJECT_SESSION_ABI = RuntimeAbiCatalog.abi(
    RuntimeCallId.RAMBLER_RUNTIME_INJECT_JETSON_SESSION,
)

internal val gboardRambler1777RoutePatch = bytecodePatch(
    description = "把 17.7.7 exact voice launch 導向 stock online Jetson backend。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(GboardVersionBindings.ramblerSwitcherLaunch)
            .applyRamblerLaunchScope()
        findMutableMethodOrThrow(GboardVersionBindings.ramblerNgaEligibility)
            .applyRamblerNgaEligibilityTransform()
        findMutableMethodOrThrow(GboardVersionBindings.ramblerSwitcherFallback)
            .applyRamblerFallbackInitialization()
        findMutableMethodOrThrow(GboardVersionBindings.ramblerStockVoiceHandler)
            .applyRamblerParserScope()
        findMutableMethodOrThrow(GboardVersionBindings.ramblerSessionBuilder)
            .applyRamblerSessionInputTransform()
    }
}

internal fun MutableMethod.applyRamblerLaunchScope() {
    applyRamblerVerified(
        GboardVersionBindings.ramblerSwitcherLaunch.reference,
        GboardRambler1777Fingerprints.switcherLaunchStock,
        GboardRambler1777Fingerprints.switcherLaunchPatched,
        { applyRamblerLaunchScopeUnchecked() },
    )
}

private fun MutableMethod.applyRamblerLaunchScopeUnchecked() {
    val instructions = implementation?.instructions
        ?: error("Rambler launch switcher has no implementation")
    val entryCount = countRuntimeCalls(ENTER_LAUNCH_ABI.reference)
    val exitCount = countRuntimeCalls(EXIT_LAUNCH_ABI.reference)
    val returns = returnInstructionIndices().filter { instructions[it].opcode == Opcode.RETURN }
    check(entryCount == 0 || entryCount == 1) { "Duplicate Rambler launch entries" }
    check(exitCount == 0 || exitCount == returns.size) { "Partial Rambler launch exits" }
    if (entryCount == 1) {
        check(exitCount == returns.size) { "Partial Rambler launch scope" }
        return
    }

    check(instructions.size >= 2 &&
        instructions[0].isMoveObjectFrom16(0) &&
        instructions[1].isMoveObjectFrom16(1)
    ) { "17.7.7 hng#f entry parameter copies changed" }
    addInstructions(
        2,
        RuntimeCallEmitter.invoke(RuntimeCallId.RAMBLER_RUNTIME_ENTER_LAUNCH_SCOPE, "v1"),
    )
    injectBeforeReturns(
        Opcode.RETURN,
        RuntimeCallId.RAMBLER_RUNTIME_EXIT_LAUNCH_SCOPE,
    )
}

internal fun MutableMethod.applyRamblerNgaEligibilityTransform() {
    applyRamblerVerified(
        GboardVersionBindings.ramblerNgaEligibility.reference,
        GboardRambler1777Fingerprints.ngaEligibilityStock,
        GboardRambler1777Fingerprints.ngaEligibilityPatched,
        { applyRamblerNgaEligibilityTransformUnchecked() },
    )
}

private fun MutableMethod.applyRamblerNgaEligibilityTransformUnchecked() {
    val instructions = implementation?.instructions
        ?: error("Rambler NGA eligibility target has no implementation")
    val returns = returnInstructionIndices().filter { instructions[it].opcode == Opcode.RETURN }
    val existing = countRuntimeCalls(NGA_ELIGIBILITY_ABI.reference)
    check(existing == 0 || existing == returns.size) {
        "Partial Rambler NGA eligibility delegates"
    }
    if (existing != 0) {
        return
    }
    returns.asReversed().forEach { returnIndex ->
        val register = (implementation!!.instructions[returnIndex] as? OneRegisterInstruction)
            ?.registerA
            ?: error("Rambler NGA eligibility return has no register")
        addInstructions(
            returnIndex,
            """
                ${RuntimeCallEmitter.invoke(
                    RuntimeCallId.RAMBLER_RUNTIME_AFTER_NGA_ELIGIBILITY,
                    "v$register",
                )}

                move-result v$register
            """.trimIndent(),
        )
    }
}

internal fun MutableMethod.applyRamblerFallbackInitialization() {
    applyRamblerVerified(
        GboardVersionBindings.ramblerSwitcherFallback.reference,
        GboardRambler1777Fingerprints.switcherFallbackStock,
        GboardRambler1777Fingerprints.switcherFallbackPatched,
        { applyRamblerFallbackInitializationUnchecked() },
    )
}

private fun MutableMethod.applyRamblerFallbackInitializationUnchecked() {
    val instructions = implementation?.instructions
        ?: error("Rambler fallback target has no implementation")
    val existing = countRuntimeCalls(INITIALIZE_FALLBACK_ABI.reference)
    check(existing == 0 || existing == 1) { "Duplicate Rambler fallback delegates" }
    if (existing == 1) {
        return
    }
    val continuation = instructions.firstOrNull()
        ?: error("Rambler fallback target is empty")
    addInstructionsWithLabels(
        0,
        """
            ${RuntimeCallEmitter.invoke(
                RuntimeCallId.RAMBLER_RUNTIME_TRY_INITIALIZE_STOCK_FALLBACK,
                "p0",
            )}

            move-result v0
            if-eqz v0, :gboardpatches_rambler_stock_fallback
            return-void
        """.trimIndent(),
        ExternalLabel("gboardpatches_rambler_stock_fallback", continuation),
    )
}

internal fun MutableMethod.applyRamblerParserScope() {
    applyRamblerVerified(
        GboardVersionBindings.ramblerStockVoiceHandler.reference,
        GboardRambler1777Fingerprints.stockVoiceHandlerStock,
        GboardRambler1777Fingerprints.stockVoiceHandlerPatched,
        { applyRamblerParserScopeUnchecked() },
    )
}

private fun MutableMethod.applyRamblerParserScopeUnchecked() {
    val instructions = implementation?.instructions
        ?: error("Rambler stock parser has no implementation")
    val entryCount = countRuntimeCalls(ENTER_PARSER_ABI.reference)
    val exitCount = countRuntimeCalls(EXIT_PARSER_ABI.reference)
    val returns = returnInstructionIndices().filter { instructions[it].opcode == Opcode.RETURN }
    check(entryCount == 0 || entryCount == 1) { "Duplicate Rambler parser entries" }
    check(exitCount == 0 || exitCount == returns.size) { "Partial Rambler parser exits" }
    if (entryCount == 1) {
        check(exitCount == returns.size) { "Partial Rambler parser scope" }
        return
    }
    addInstructions(
        0,
        RuntimeCallEmitter.invoke(RuntimeCallId.RAMBLER_RUNTIME_ENTER_PARSER_SCOPE, "p1"),
    )
    injectBeforeReturns(
        Opcode.RETURN,
        RuntimeCallId.RAMBLER_RUNTIME_EXIT_PARSER_SCOPE,
    )
}

internal fun MutableMethod.applyRamblerSessionInputTransform() {
    applyRamblerVerified(
        GboardVersionBindings.ramblerSessionBuilder.reference,
        GboardRambler1777Fingerprints.sessionBuilderStock,
        GboardRambler1777Fingerprints.sessionBuilderPatched,
        { applyRamblerSessionInputTransformUnchecked() },
    )
}

private fun MutableMethod.applyRamblerSessionInputTransformUnchecked() {
    val instructions = implementation?.instructions
        ?: error("Rambler session builder has no implementation")
    val existing = countRuntimeCalls(INJECT_SESSION_ABI.reference)
    check(existing == 0 || existing == 1) { "Duplicate Rambler session transforms" }
    if (existing == 1) {
        return
    }
    check(instructions.isNotEmpty()) { "Rambler session builder is empty" }
    addInstructions(
        0,
        """
            ${RuntimeCallEmitter.invoke(
                RuntimeCallId.RAMBLER_RUNTIME_INJECT_JETSON_SESSION,
                "p2",
            )}

            move-result-object p2
        """.trimIndent(),
    )
}

private fun MutableMethod.injectBeforeReturns(opcode: Opcode, call: RuntimeCallId) {
    val returns = returnInstructionIndices().filter {
        implementation!!.instructions[it].opcode == opcode
    }
    check(returns.isNotEmpty()) { "Rambler scoped target has no $opcode" }
    returns.asReversed().forEach { returnIndex ->
        addInstructions(returnIndex, RuntimeCallEmitter.invoke(call, ""))
    }
}

private fun MutableMethod.applyRamblerVerified(
    targetName: String,
    stockFingerprint: String,
    patchedFingerprint: String,
    mutate: MutableMethod.() -> Unit,
) {
    applyVerified(
        VerifiedTransformationPlan(
            targetName = targetName,
            classify = { method ->
                when (method.gboardStructuralFingerprint()) {
                    stockFingerprint -> VerifiedTransformationState.STOCK
                    patchedFingerprint -> VerifiedTransformationState.PATCHED
                    else -> VerifiedTransformationState.MALFORMED
                }
            },
            mutate = { method ->
                method.mutate()
                method
            },
        ),
    )
}

private fun MutableMethod.countRuntimeCalls(reference: String): Int =
    implementation!!.instructions.count { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.toString() ==
            reference
    }

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.isMoveObjectFrom16(
    destination: Int,
): Boolean =
    this is TwoRegisterInstruction &&
        opcode == Opcode.MOVE_OBJECT_FROM16 &&
        registerA == destination

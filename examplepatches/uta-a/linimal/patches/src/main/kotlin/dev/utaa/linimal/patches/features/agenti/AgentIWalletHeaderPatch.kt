package dev.utaa.linimal.patches.features.agenti

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import dev.utaa.linimal.patches.status.PatchStatusRecord
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus

private const val WALLET_HEADER_OWNER =
    "Lcom/linecorp/line/wallet/impl/v3/view/WalletV3GrandDesignHeaderView;"
private const val WALLET_AGENT_STATE =
    "Lcom/linecorp/line/wallet/impl/v3/view/WalletV3GrandDesignHeaderView\$a;"
private const val WALLET_AGENT_ACTION_SIGNATURE = "onAgentIButtonClick()V"
private const val WALLET_AGENT_ICON = 0x7f08221d
private const val WALLET_AGENT_ACCESSIBILITY_LABEL = 0x7f15035a
private const val WALLET_HEADER_HOOK =
    "Ldev/utaa/linimal/extension/features/agenti/AgentIWalletHeaderHooks;->adjustButtonState(Ljava/lang/Object;)Ljava/lang/Object;"

/**
 * Wallet header の Agent i button state setup。campaign / search state setup を含めません。
 * click action の Kotlin function reference metadata も同じ method 内で確認します。
 */
private val walletAgentStateSupplierFingerprint = Fingerprint(
    definingClass = WALLET_HEADER_OWNER,
    name = "o",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string(WALLET_AGENT_ACTION_SIGNATURE),
        literal(WALLET_AGENT_ICON),
        literal(WALLET_AGENT_ACCESSIBILITY_LABEL),
        methodCall(
            definingClass = WALLET_HEADER_OWNER,
            name = "setAgentIButtonState",
            parameters = listOf(WALLET_AGENT_STATE),
            returnType = "V",
            opcode = Opcode.INVOKE_DIRECT,
        ),
    ),
)

/**
 * Wallet mini-tab header が生成済み Agent i state を host setter へ渡す直前に gate を置きます。
 * ON はその state argument だけ null にし、OFF と hook failure は同一 state instance を渡します。
 */
val agentIWalletHeaderPatch = bytecodePatch(
    name = "ウォレット上部の Agent i",
    description = "ウォレット画面上部にある Agent i の入口を、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(agentIHomeHeaderPatch)

    execute {
        val supplierMatches = walletAgentStateSupplierFingerprint.matchAllOrNull().orEmpty()
        if (supplierMatches.size != 1) {
            recordWalletHeaderUnapplied(supplierMatches.size, "AgentIWalletStateSupplierNotUnique")
            return@execute
        }

        val supplier = supplierMatches.single()
        val stateSupply = walletAgentStateSupply(supplier.method)
        if (stateSupply == null) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.AGENT_I_WALLET_HEADER),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "AgentIWalletStateSupplierShapeMismatch",
            )
            return@execute
        }

        supplier.method.addInstructions(
            stateSupply.setterIndex,
            """
                invoke-static { v${stateSupply.stateRegister} }, $WALLET_HEADER_HOOK
                move-result-object v${stateSupply.stateRegister}
                check-cast v${stateSupply.stateRegister}, $WALLET_AGENT_STATE
            """.trimIndent(),
        )
        patchStatusCollector.record(
            patchId = PatchId.AGENT_I_WALLET_HEADER,
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "AgentIWalletStateArgumentAdjusted",
        )
    }
}

private data class WalletAgentStateSupply(
    val setterIndex: Int,
    val stateRegister: Int,
)

/**
 * Validates the final host call and proves that its argument is the unique Agent i state object constructed here.
 * The original method body remains intact; only the exact final argument register is replaced.
 */
private fun walletAgentStateSupply(method: Method): WalletAgentStateSupply? {
    val implementation = method.implementation ?: return null
    val instructions = implementation.instructions.toList()
    val setters = instructions.mapIndexedNotNull { index, instruction ->
        val setter = instruction as? FiveRegisterInstruction ?: return@mapIndexedNotNull null
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (
            instruction.opcode == Opcode.INVOKE_DIRECT &&
            setter.registerCount == 2 &&
            reference?.definingClass == WALLET_HEADER_OWNER &&
            reference.name == "setAgentIButtonState" &&
            reference.parameterTypes == listOf(WALLET_AGENT_STATE) &&
            reference.returnType == "V"
        ) {
            WalletAgentStateSupply(index, setter.registerD)
        } else {
            null
        }
    }
    val stateSupply = setters.singleOrNull() ?: return null
    val stateConstructors = instructions.mapIndexedNotNull { index, instruction ->
        val constructor = instruction as? FiveRegisterInstruction ?: return@mapIndexedNotNull null
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        (index to constructor).takeIf {
            instruction.opcode == Opcode.INVOKE_DIRECT &&
                reference?.definingClass == WALLET_AGENT_STATE &&
                reference.name == "<init>" &&
                reference.parameterTypes == listOf("I", "I", "Lnt8/a;", "Ljava/util/Set;") &&
                reference.returnType == "V" &&
                constructor.registerCount == 5 &&
                constructor.registerC == stateSupply.stateRegister
        }
    }
    val (stateConstructorIndex, stateConstructor) = stateConstructors.singleOrNull() ?: return null
    // state の click action は、この method で生成する Wallet header nested class の唯一の instance です。
    val actionAllocations = instructions.filter { instruction ->
        val type = ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type
        instruction.opcode == Opcode.NEW_INSTANCE &&
            type != null &&
            type != WALLET_AGENT_STATE &&
            type.startsWith(WALLET_HEADER_OWNER.removeSuffix(";") + "$")
    }
    val actionAllocation = actionAllocations.singleOrNull() as? OneRegisterInstruction ?: return null

    return stateSupply.takeIf {
        method.parameterTypes.isEmpty() &&
            implementation.registerCount >= 2 &&
            it.stateRegister in 0..15 &&
            it.setterIndex == instructions.lastIndex - 1 &&
            instructions.lastOrNull()?.opcode == Opcode.RETURN_VOID &&
            stateConstructorIndex < it.setterIndex &&
            actionAllocation.registerA == stateConstructor.registerF
    }
}

private fun recordWalletHeaderUnapplied(matchCount: Int, reason: String) {
    patchStatusCollector.record(agentIWalletHeaderUnappliedRecord(matchCount, reason))
}

internal fun agentIWalletHeaderUnappliedRecord(matchCount: Int, reason: String) = PatchStatusRecord(
    patchId = PatchId.AGENT_I_WALLET_HEADER,
    status = if (matchCount == 0) PatchStatus.TARGET_NOT_FOUND else PatchStatus.ERROR,
    expectedTargetCount = 1,
    actualTargetCount = matchCount,
    reason = reason,
)

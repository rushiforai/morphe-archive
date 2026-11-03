package dev.utaa.linimal.patches.features.agenti

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.utaa.linimal.patches.features.ads.homeTopAdPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import dev.utaa.linimal.patches.status.PatchStatusRecord
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus

private const val HOME_AGENT_ICON = 0x7f080b92
private const val HOME_AGENT_ACCESSIBILITY_LABEL = 0x7f15006c
private const val HOME_HEADER_HOOK =
    "Ldev/utaa/linimal/extension/features/agenti/AgentIHomeHeaderHooks;->adjustVisibility(Z)Z"

/** Agent i icon の drawable、accessibility label、Compose icon call を組み合わせた resource anchor。 */
private val homeAgentIconFingerprint = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        literal(HOME_AGENT_ACCESSIBILITY_LABEL),
        literal(HOME_AGENT_ICON),
        methodCall(
            definingClass = "Lfm2/n;",
            name = "b",
            parameters = listOf(
                "I",
                "Ljava/lang/String;",
                "Lnt8/a;",
                "Lb4/j;",
                "Lfm2/o;",
                "Lcom/linecorp/line/compose/theme/g;",
                "Ljava/util/Set;",
                "Lj3/r;",
                "I",
                "I",
            ),
            returnType = "V",
            opcode = Opcode.INVOKE_STATIC_RANGE,
        ),
    ),
    custom = { _, classDef -> classDef.interfaces.contains("Lnt8/q;") },
)

private val homeHeaderSupplierParameters = listOf(
    "Lts2/r;",
    "Z",
    "Z",
    "Z",
    "Z",
    "Lts2/j;",
    "Lts2/i;",
    "Lts2/i;",
    "Lts2/i;",
    "Lts2/i;",
    "Lj3/r;",
    "I",
)

/**
 * 4 icon callback を生成する composable のうち Agent i icon callback を持つ唯一の boolean supplier。
 * click は設定 URL 起点へ変わり deeplink 文字列が消えたため、resource で確定した icon callback から導出します。
 */
private fun homeAgentHeaderSupplierFingerprint(iconCallbackType: String) = Fingerprint(
    returnType = "V",
    parameters = homeHeaderSupplierParameters,
    custom = { method, _ -> methodCreatesType(method, iconCallbackType) },
)

/**
 * Home 上部ナビゲーションが再 composition ごとに受け取る Agent i 専用 boolean を制御します。
 * icon row や他の 3 button callback、遷移処理、analytics は変更しません。
 */
val agentIHomeHeaderPatch = bytecodePatch(
    name = "ホーム上部の Agent i",
    description = "ホーム画面上部にある Agent i の入口を、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(homeTopAdPatch)

    execute {
        val iconMatches = homeAgentIconFingerprint.matchAllOrNull().orEmpty()
        if (iconMatches.size != 1) {
            recordHomeHeaderUnapplied(iconMatches.size, "AgentIHomeHeaderIconNotUnique")
            return@execute
        }

        val supplierMatches = homeAgentHeaderSupplierFingerprint(
            iconMatches.single().originalClassDef.type,
        ).matchAllOrNull().orEmpty()
        if (supplierMatches.size != 1) {
            recordHomeHeaderUnapplied(supplierMatches.size, "AgentIHomeHeaderSupplierNotUnique")
            return@execute
        }

        val supplier = supplierMatches.single()
        if (!guardHomeHeaderSupplier(supplier.method, iconMatches.single().originalClassDef.type)) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.AGENT_I_HOME_HEADER),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "AgentIHomeHeaderSupplierShapeMismatch",
            )
            return@execute
        }

        supplier.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $HOME_HEADER_HOOK
                move-result p1
            """.trimIndent(),
        )
        patchStatusCollector.record(
            patchId = PatchId.AGENT_I_HOME_HEADER,
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "AgentIHomeHeaderVisibilitySupplied",
        )
    }
}

private fun guardHomeHeaderSupplier(method: Method, iconCallbackType: String): Boolean {
    val implementation = method.implementation ?: return false
    val instructions = implementation.instructions.toList()
    val expectedParameters = homeHeaderSupplierParameters
    val constructorIndices = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        index.takeIf {
            instruction.opcode == Opcode.INVOKE_DIRECT_RANGE &&
                reference?.definingClass == iconCallbackType &&
                reference.name == "<init>" &&
                reference.parameterTypes == listOf(
                    "Z",
                    "Lts2/i;",
                    "Z",
                    "Lts2/i;",
                    "Z",
                    "Lts2/i;",
                    "Z",
                    "Lts2/i;",
                ) &&
                reference.returnType == "V"
        }
    }
    val constructorIndex = constructorIndices.singleOrNull() ?: return false
    val constructor = instructions[constructorIndex] as? RegisterRangeInstruction ?: return false
    // The range receiver is followed by Agent i's first boolean. Its immediate move must originate from p1.
    val firstBooleanRegister = constructor.startRegister + 1
    val constructorArgumentCopy = instructions.getOrNull(constructorIndex - 8) as? TwoRegisterInstruction ?: return false
    val parameterStart = implementation.registerCount - expectedParameters.size
    val firstBooleanParameterRegister = parameterStart + 1
    val sourceCopies = instructions.take(constructorIndex).filter { instruction ->
        instruction.opcode == Opcode.MOVE_FROM16 &&
            instruction is TwoRegisterInstruction &&
            instruction.registerA == constructorArgumentCopy.registerB &&
            instruction.registerB == firstBooleanParameterRegister
    }

    return method.parameterTypes.map { it.toString() } == expectedParameters &&
        parameterStart >= 0 &&
        firstBooleanParameterRegister in 0..255 &&
        constructor.registerCount == 9 &&
        constructorArgumentCopy.opcode == Opcode.MOVE_FROM16 &&
        constructorArgumentCopy.registerA == firstBooleanRegister &&
        sourceCopies.size == 1
}

private fun methodCreatesType(method: Method, type: String): Boolean = method.implementation?.instructions?.any {
    it.opcode == Opcode.NEW_INSTANCE &&
        ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type == type
} == true

private fun recordHomeHeaderUnapplied(matchCount: Int, reason: String) {
    patchStatusCollector.record(agentIHomeHeaderUnappliedRecord(matchCount, reason))
}

internal fun agentIHomeHeaderUnappliedRecord(matchCount: Int, reason: String) = PatchStatusRecord(
    patchId = PatchId.AGENT_I_HOME_HEADER,
    status = if (matchCount == 0) PatchStatus.TARGET_NOT_FOUND else PatchStatus.ERROR,
    expectedTargetCount = 1,
    actualTargetCount = matchCount,
    reason = reason,
)

package dev.jason.gboardpatches.patches.gboard.features.writingtools

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAiWritingToolsDependencyPatch = bytecodePatch(
    description = "依 AiCore 狀態、allow_gen_ai_server 與官方 server switch 同步 hcv fallback 模式。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        injectDependencySync(
            name = "eU",
            parameterTypes = listOf("Landroid/content/Context;", "Loeb;"),
            reason = "hcv#eU",
            contextRegister = "p1"
        )
        injectDependencySync(
            name = "i",
            parameterTypes = emptyList(),
            reason = "hcv#i"
        )
        injectDependencySync(
            name = "f",
            parameterTypes = listOf("Lmpn;"),
            reason = "hcv#f"
        )
    }
}

context(context: BytecodePatchContext)
private fun injectDependencySync(
    name: String,
    parameterTypes: List<String>,
    reason: String,
    contextRegister: String? = null
) = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = DEPENDENCY_MONITOR_CLASS,
        name = name,
        returnType = "V",
        parameterTypes = parameterTypes
    )

    mutableMethod.returnInstructionIndices()
        .asReversed()
        .forEach { returnIndex ->
            mutableMethod.addInstructions(
                returnIndex,
                buildDependencySyncDelegate(reason, contextRegister)
            )
        }
}

private fun buildDependencySyncDelegate(reason: String, contextRegister: String?): String =
    if (contextRegister != null) {
        """
        const-string v0, "$reason"

        invoke-static {p0, $contextRegister, v0}, $AI_WRITING_TOOLS_DEPENDENCY_RUNTIME_CLASS->syncDependencyProvider(Ljava/lang/Object;Landroid/content/Context;Ljava/lang/String;)V
        """.trimIndent()
    } else {
        """
        const-string v0, "$reason"

        invoke-static {p0, v0}, $AI_WRITING_TOOLS_DEPENDENCY_RUNTIME_CLASS->syncDependencyProvider(Ljava/lang/Object;Ljava/lang/String;)V
        """.trimIndent()
    }

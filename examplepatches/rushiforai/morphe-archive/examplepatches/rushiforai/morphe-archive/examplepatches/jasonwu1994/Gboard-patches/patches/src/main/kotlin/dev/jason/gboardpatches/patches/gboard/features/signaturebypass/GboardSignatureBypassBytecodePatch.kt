package dev.jason.gboardpatches.patches.gboard.features.signaturebypass

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val SIGNATURE_UTILS_CLASS = "Lpuo;"

internal val gboardSignatureBypassBytecodePatch = bytecodePatch(
    description = "強制通過 Gboard 自身的簽章白名單檢查。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        injectSignatureBypass()
    }
}

context(context: BytecodePatchContext)
private fun injectSignatureBypass() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = SIGNATURE_UTILS_CLASS,
        name = "a",
        returnType = "Z",
        parameterTypes = listOf("Landroid/content/Context;", "Ljava/lang/String;")
    )

    mutableMethod.addInstructions(0, SIGNATURE_BYPASS_DELEGATE)
}

private val SIGNATURE_BYPASS_DELEGATE = """
    const/4 v0, 0x1

    return v0
""".trimIndent()

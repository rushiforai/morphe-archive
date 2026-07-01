package dev.jason.gboardpatches.patches.gboard.features.webclipboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices

internal val gboardWebClipboardCapturePatch = bytecodePatch(
    description = "在 nfl.onCreate() 後掛上 Web Clipboard capture bootstrap。"
) {
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = LATIN_IME_SERVICE_CLASS,
            name = "onCreate",
            returnType = "V",
            parameterTypes = emptyList()
        )
        val returnIndices = mutableMethod.returnInstructionIndices()
        check(returnIndices.isNotEmpty()) {
            "Could not find return instruction in $LATIN_IME_SERVICE_CLASS->onCreate()V"
        }
        returnIndices.asReversed().forEach { returnIndex ->
            mutableMethod.addInstructions(returnIndex, CAPTURE_BOOTSTRAP_DELEGATE)
        }
    }
}

private const val LATIN_IME_SERVICE_CLASS = "Lnfl;"

private const val CAPTURE_BOOTSTRAP_RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/webclipboard/GboardWebClipboardCaptureBootstrap;"

private val CAPTURE_BOOTSTRAP_DELEGATE = """
    invoke-static/range {p0 .. p0}, $CAPTURE_BOOTSTRAP_RUNTIME_CLASS->afterLatinImeOnCreate(Ljava/lang/Object;)V
""".trimIndent()

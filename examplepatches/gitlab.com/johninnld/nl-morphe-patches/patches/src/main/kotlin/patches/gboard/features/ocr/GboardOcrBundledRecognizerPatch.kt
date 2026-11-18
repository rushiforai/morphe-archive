package patches.gboard.features.ocr

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.gboard.Constants.COMPATIBILITY_GBOARD
import patches.gboard.shared.findMutableMethodOrThrow
import patches.gboard.shared.GboardMethodTarget
import patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import patches.gboard.shared.isMethodReference

/*
 * Gboard's OCR recogniser is created by one DI provider (jid.get). Stock builds it from the
 * Play Services recognition module, which a re-signed Gboard can never download. Answer that
 * provider with a recogniser backed by the pipeline bundled in this extension instead.
 */

/** The provider that hands Gboard its TextRecognizer. */
internal val textRecognizerProvider = GboardMethodTarget(
    classType = "Ljid;",
    // The DI method itself is obfuscated; get() is only the synthetic interface bridge.
    name = "a",
    parameterTypes = emptyList(),
    returnType = "Lj" + "$" + "/util/Optional;",
)

private const val BRIDGE = "Ldev/jason/gboardpatches/extension/ocr/GboardOcrBundledBridge;"

internal val gboardOcrBundledRecognizerPatch = bytecodePatch(
    description = "Answer Gboard's OCR provider with the bundled recogniser.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val provider = findMutableMethodOrThrow(textRecognizerProvider)
        val instructions = provider.implementation?.instructions
            ?: error("No implementation in ${provider.definingClass}->${provider.name}")
        if (instructions.any { it.isMethodReference("$BRIDGE->createOptional()Ljava/lang/Object;") }) {
            return@execute
        }
        // Gboard keeps the keyboard alive when OCR is unavailable, so a failure here degrades to
        // "no text recognised" rather than a crash.
        provider.addInstructions(
            0,
            """
                invoke-static {}, $BRIDGE->createOptional()Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Lj${'$'}/util/Optional;
                return-object v0
            """.trimIndent(),
        )
    }
}

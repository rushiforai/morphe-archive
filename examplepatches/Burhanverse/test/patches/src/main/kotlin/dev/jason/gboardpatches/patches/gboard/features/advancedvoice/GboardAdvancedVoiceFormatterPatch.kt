package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private val FORMATTER_RUNTIME_DESCRIPTOR = RuntimeAbiCatalog.abi(
    RuntimeCallId.ADVANCED_VOICE_RUNTIME_BEFORE_FORMATTER_CONSTRUCTED,
).reference

internal val ADVANCED_VOICE_FORMATTER_DELEGATE = """
    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.ADVANCED_VOICE_RUNTIME_BEFORE_FORMATTER_CONSTRUCTED,
        "p1, p2, p5",
    )}

    move-result p5
""".trimIndent()

internal val gboardAdvancedVoiceFormatterPatch = bytecodePatch(
    description = "在 17.7.7 exact zh-TW formatter constructor 使用參數前套用 gate。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val method = findMutableMethodOrThrow(
            GboardVersionBindings.advancedVoiceFormatterConstructor,
        )
        method.applyAdvancedVoiceFormatterDelegate()
    }
}

internal fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
    .applyAdvancedVoiceFormatterDelegate() {
    applyAdvancedVoiceFingerprintGuard(
        GboardVersionBindings.advancedVoiceFormatterConstructor.reference,
        FORMATTER_RUNTIME_DESCRIPTOR,
        GboardAdvancedVoice1777Fingerprints.formatterStock,
        GboardAdvancedVoice1777Fingerprints.formatterPatched,
    ) {
        val existing = implementation!!.instructions.count {
            it.isMethodReference(FORMATTER_RUNTIME_DESCRIPTOR)
        }
        check(existing == 0) { "Duplicate Advanced Voice formatter delegates" }
        addInstructions(0, ADVANCED_VOICE_FORMATTER_DELEGATE)
    }
}

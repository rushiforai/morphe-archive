package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val FORMATTER_RUNTIME_DESCRIPTOR =
    "$ADVANCED_VOICE_RUNTIME_CLASS->beforeFormatterConstructed(Ljava/util/Locale;Ljava/lang/Object;Z)Z"

internal val ADVANCED_VOICE_FORMATTER_DELEGATE = """
    invoke-static {p1, p2, p5}, $FORMATTER_RUNTIME_DESCRIPTOR

    move-result p5
""".trimIndent()

internal val gboardAdvancedVoiceFormatterPatch = bytecodePatch(
    description = "在 17.7.7 exact zh-TW formatter constructor 使用參數前套用 gate。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val method = findMutableMethodOrThrow(
            GboardAdvancedVoice1777Bindings.formatterConstructor,
        )
        method.applyAdvancedVoiceFormatterDelegate()
    }
}

internal fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
    .applyAdvancedVoiceFormatterDelegate() {
    applyAdvancedVoiceFingerprintGuard(
        GboardAdvancedVoice1777Bindings.formatterConstructor.descriptor(),
        FORMATTER_RUNTIME_DESCRIPTOR,
        GboardAdvancedVoice1777Bindings.formatterStockFingerprint,
        GboardAdvancedVoice1777Bindings.formatterPatchedFingerprint,
    ) {
        val existing = implementation!!.instructions.count {
            it.methodDescriptor() == FORMATTER_RUNTIME_DESCRIPTOR
        }
        check(existing == 0) { "Duplicate Advanced Voice formatter delegates" }
        addInstructions(0, ADVANCED_VOICE_FORMATTER_DELEGATE)
    }
}

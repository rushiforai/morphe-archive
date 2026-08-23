package dev.jason.gboardpatches.patches.gboard.features.addsymbols

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId

private val softKeyMetadataType = GboardVersionBindings.softKeyMetadataType.descriptor

internal val gboardZhuyinCustomSymbolsEntryPatch = bytecodePatch(
    description = "對注音逗號長按 popup 注入 jasondev_symbol 入口。"
) {
    dependsOn(gboardZhuyinCustomSymbolsExtensionPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(GboardVersionBindings.softKeyBind)

        mutableMethod.addInstructions(0, ENTRY_METADATA_DELEGATE)
    }
}

private val ENTRY_METADATA_DELEGATE = """
    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.ADD_SYMBOLS_SOFT_KEY_RUNTIME_PATCH_SOFT_KEY_METADATA,
        "p0, p1",
    )}

    move-result-object p1

    check-cast p1, $softKeyMetadataType
""".trimIndent()

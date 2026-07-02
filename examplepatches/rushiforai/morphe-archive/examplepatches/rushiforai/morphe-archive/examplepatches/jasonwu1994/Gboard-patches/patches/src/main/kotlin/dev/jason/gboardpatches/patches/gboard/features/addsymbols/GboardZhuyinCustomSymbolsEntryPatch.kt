package dev.jason.gboardpatches.patches.gboard.features.addsymbols

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow

private const val SOFT_KEY_VIEW_CLASS =
    "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;"

internal val gboardZhuyinCustomSymbolsEntryPatch = bytecodePatch(
    description = "對注音逗號長按 popup 注入 jasondev_symbol 入口。"
) {
    dependsOn(gboardZhuyinCustomSymbolsExtensionPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = SOFT_KEY_VIEW_CLASS,
            name = "p",
            returnType = "Z",
            parameterTypes = listOf("Loaa;", "J")
        )

        mutableMethod.addInstructions(0, ENTRY_METADATA_DELEGATE)
    }
}

private val ENTRY_METADATA_DELEGATE = """
    invoke-static {p0, p1}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsSoftKeyRuntime;->patchSoftKeyMetadata(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loaa;
""".trimIndent()

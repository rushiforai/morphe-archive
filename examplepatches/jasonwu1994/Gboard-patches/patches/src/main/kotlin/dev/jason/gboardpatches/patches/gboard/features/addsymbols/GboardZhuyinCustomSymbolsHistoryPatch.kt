package dev.jason.gboardpatches.patches.gboard.features.addsymbols

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow

private const val EMOTICON_ITEM_CLICK_CONSUMER_CLASS = "Lhuo;"
private const val EMOTICON_HISTORY_MANAGER_CLASS = "Lfkf;"

internal val gboardZhuyinCustomSymbolsHistoryPatch = bytecodePatch(
    description = "移植 add-symbols 的 recent/history namespace 隔離。"
) {
    dependsOn(gboardZhuyinCustomSymbolsExtensionPatch)

    execute {
        val clickMethod = findMutableMethodOrThrow(
            classType = EMOTICON_ITEM_CLICK_CONSUMER_CLASS,
            name = "accept",
            returnType = "V",
            parameterTypes = listOf("Ljava/lang/Object;")
        )
        clickMethod.addInstructions(0, ITEM_CLICK_DELEGATE)

        val historyWriteMethod = findMutableMethodOrThrow(
            classType = EMOTICON_HISTORY_MANAGER_CLASS,
            name = "c",
            returnType = "V",
            parameterTypes = listOf("Ljava/lang/String;")
        )
        historyWriteMethod.addInstructions(0, HISTORY_WRITE_DELEGATE)
    }
}

private val ITEM_CLICK_DELEGATE = """
    invoke-static/range {p0 .. p0}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->onEmoticonItemClick(Ljava/lang/Object;)V
""".trimIndent()

private val HISTORY_WRITE_DELEGATE = """
    invoke-static {p0, p1}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->interceptHistoryWrite(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :jasondev_continue

    return-void

    :jasondev_continue
""".trimIndent()

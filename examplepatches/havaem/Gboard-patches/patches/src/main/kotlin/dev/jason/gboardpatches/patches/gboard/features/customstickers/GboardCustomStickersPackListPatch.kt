package dev.jason.gboardpatches.patches.gboard.features.customstickers

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.isOpcode
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardCustomStickersPackListPatch = bytecodePatch(
    description = "在 ExpressiveStickerFetcher 解析完 sticker packs 後，把使用者自訂的 packs 加入清單。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(
            classType = STICKER_PACK_PARSER_CLASS,
            name = STICKER_PACK_PARSER_METHOD,
            returnType = OBJECT_TYPE,
            parameterTypes = listOf(OBJECT_TYPE),
        ).applyCustomStickerPackAppend()
    }
}

/**
 * The parser builds every pack the sticker keyboard, its management screen and its favorites
 * read, so appending once here reaches all of them through Gboard's own code.
 */
internal fun MutableMethod.applyCustomStickerPackAppend() {
    val abi = RuntimeAbiCatalog.abi(RuntimeCallId.CUSTOM_STICKERS_RUNTIME_APPEND_CUSTOM_PACKS)
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val returns = instructions.withIndex().filter { it.value.isOpcode("RETURN_OBJECT") }
    check(returns.size == 1) {
        "$definingClass->$name must contain exactly one RETURN_OBJECT"
    }
    val existing = instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == 1) { "Malformed custom sticker pack append in $definingClass->$name" }
        return
    }
    val returnIndex = returns.single().index
    val register = (returns.single().value as OneRegisterInstruction).registerA
    addInstructions(
        returnIndex,
        """
            ${RuntimeCallEmitter.invoke(RuntimeCallId.CUSTOM_STICKERS_RUNTIME_APPEND_CUSTOM_PACKS, "v$register")}

            move-result-object v$register
        """.trimIndent(),
    )
}

// shortcut: obfuscated 18.5.4 names (StickerPack parser), move to version bindings when porting.
private const val STICKER_PACK_PARSER_CLASS = "Lhaa;"
private const val STICKER_PACK_PARSER_METHOD = "apply"
private const val OBJECT_TYPE = "Ljava/lang/Object;"

// Based on bearinmindcat/morphe-patches (GPL-3.0) @ 5f79152, patches/src/main/kotlin/org/ungoogled/patches/samsungkeyboard/gifs/GifPatches.kt.
// Modified for Heval's Morphe Patches on 2026-11-13: package and extension prefix renamed, checked instruction helpers.

package app.template.patches.samsungkeyboard.gifs

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.template.patches.shared.Constants.COMPATIBILITY_SAMSUNG_KEYBOARD
import app.template.patches.samsungkeyboard.misc.SAMSUNG_KEYBOARD_EXTENSION
import app.template.patches.shared.addInstructionsAtControlFlowLabelChecked
import app.template.patches.samsungkeyboard.controls.SamsungKeyboardControlsCategory
import app.template.patches.samsungkeyboard.controls.samsungKeyboardControls
import app.template.patches.shared.hevalcontrols.HevalFeature

private const val GIFS = "Lapp/template/extension/samsungkeyboard/Gifs;"

/** Logged by the keyboard's choice of GIF providers for a language, and by every copy R8 made of it. */
private const val PROVIDER_CHOICE_LOG = "getGifCp "
private const val SUBSTRING = "Ljava/lang/String;->substring(II)Ljava/lang/String;"
private const val SET_CONTAINS = "Ljava/util/Set;->contains(Ljava/lang/Object;)Z"
private const val PROVIDER_LIST = "Ljava/util/concurrent/CopyOnWriteArrayList;"

/** The phone's region (CSC) switch for the GIF board: "enable" (the default) or "disable". */
private const val CSC_GIF = "CscFeature_Sip_ConfigWhetherToProvideGif"
private const val CSC_GET_STRING =
    "Lcom/samsung/android/feature/SemCscFeature;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;"

private val log = java.util.logging.Logger.getLogger("SamsungKeyboard")

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Instruction.call() = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.let {
    "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}"
}
private fun Method.instructions() = implementation?.instructions?.toList().orEmpty()

private fun BytecodePatchContext.methodsWhere(predicate: (Method) -> Boolean): List<Method> {
    val found = mutableListOf<Method>()
    classDefForEach { c -> c.methods.filterTo(found, predicate) }
    return found
}

private fun BytecodePatchContext.methodsWithString(string: String) =
    methodsWhere { m -> m.instructions().any { it.string() == string } }

private fun BytecodePatchContext.mutable(method: Method): MutableMethod =
    mutableClassDefBy(method.definingClass).methods.single {
        it.name == method.name && it.returnType == method.returnType &&
            it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
    }

@Suppress("unused")
val alwaysUseGiphyPatch = bytecodePatch(
    name = "Always use GIPHY",
    description = "Shows GIPHY GIFs in every language.",
) {
    compatibleWith(COMPATIBILITY_SAMSUNG_KEYBOARD)
    dependsOn(samsungKeyboardControls.patch)
    extendWith(SAMSUNG_KEYBOARD_EXTENSION)

    execute {
        // The keyboard asks only Tenor for German, Chinese, Arabic and Turkish and Tenor first for seven more
        // languages; Tenor's API no longer answers apps outside Google. Its choice (language -> 0, 2, 3 or 4) now
        // answers GIPHY first, then Tenor, as for English -- searches keep the phone's language, nothing new is sent.
        val sites = methodsWithString(PROVIDER_CHOICE_LOG)
        val (choices, copies) = sites.partition {
            it.returnType == "I" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
        }
        val choice = choices.singleOrNull()
            ?: throw PatchException("GIF provider choice not found (${choices.size} methods log \"$PROVIDER_CHOICE_LOG\")")
        if (choice.instructions().count { it.call() == SET_CONTAINS } != 3) {
            throw PatchException("GIF provider choice ${choice.definingClass}->${choice.name} no longer tests three language sets")
        }
        // What its answers mean: the provider list is Tenor alone for 2, Tenor then GIPHY for 4, else GIPHY then Tenor.
        val choiceCall = "${choice.definingClass}->${choice.name}(Ljava/lang/String;)I"
        val lists = methodsWhere { m ->
            m.returnType == PROVIDER_LIST && m.instructions().let { code ->
                code.any { it.call() == choiceCall } &&
                    listOf(2, 4).all { n -> code.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == n } }
            }
        }
        if (lists.isEmpty()) throw PatchException("GIF provider list (answers 2 and 4 from $choiceCall) not found")
        val answers = mutable(choice).run {
            val instructions = implementation!!.instructions
            val returns = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN }
            if (returns.isEmpty()) throw PatchException("GIF provider choice has no int return")
            for (index in returns.reversed()) {
                val register = (instructions[index] as OneRegisterInstruction).registerA
                addInstructionsAtControlFlowLabelChecked(
                    index,
                    "invoke-static/range {v$register .. v$register}, $GIFS->giphyFirst(I)I\nmove-result v$register",
                )
            }
            returns.size
        }

        // R8 copied the choice into the "Get content from ..." line and the privacy links of the GIF board; while the
        // switch is on they name both providers, as every language gets both (Gifs.noticeLanguage keeps the language
        // while it is off).
        for (copy in copies) mutable(copy).apply {
            val instructions = implementation!!.instructions
            val cut = instructions.indices.singleOrNull { instructions[it].call() == SUBSTRING }
                ?: throw PatchException("GIF provider notice ${copy.definingClass}->${copy.name}: no single language cut")
            val language = instructions.getOrNull(cut + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT }
                ?: throw PatchException("GIF provider notice ${copy.definingClass}->${copy.name}: language not kept")
            val register = (language as OneRegisterInstruction).registerA
            addInstructionsAtControlFlowLabelChecked(
                cut + 2,
                "invoke-static/range {v$register .. v$register}, $GIFS->noticeLanguage(Ljava/lang/String;)Ljava/lang/String;\nmove-result-object v$register",
            )
        }
        log.info("Always use GIPHY: ${choice.definingClass}->${choice.name}, $answers answers, ${lists.size} provider lists, ${copies.size} notices")
        samsungKeyboardControls.register(
            HevalFeature(
                id = "samsungkeyboard.always_giphy",
                name = "Always use GIPHY",
                description = "Shows GIPHY GIFs in every language.",
                category = SamsungKeyboardControlsCategory.APPEARANCE,
                default = true,
            ),
        )
    }
}

@Suppress("unused")
val showGifsInEveryRegionPatch = bytecodePatch(
    name = "Show GIFs in every region",
    description = "Shows the GIF board where the phone's region turns it off.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SAMSUNG_KEYBOARD)
    dependsOn(samsungKeyboardControls.patch)
    extendWith(SAMSUNG_KEYBOARD_EXTENSION)

    execute {
        // The keyboard reads its own CSC switch once, in its feature flags; that one answer goes through Gifs.gifRegion, which says "enable" while the switch is on and hands back the phone's own answer
        // while it is off. The rest
        // of the gate (no-network builds, dongles) and every other CSC feature stay as the phone says.
        var switches = 0
        for (reader in methodsWithString(CSC_GIF)) mutable(reader).apply {
            val instructions = implementation!!.instructions
            for (key in instructions.indices.filter { instructions[it].string() == CSC_GIF }.reversed()) {
                val keyRegister = (instructions[key] as OneRegisterInstruction).registerA
                val read = (key + 1 until minOf(key + 8, instructions.size)).firstOrNull {
                    instructions[it].call() == CSC_GET_STRING &&
                        (instructions[it] as? FiveRegisterInstruction)?.registerD == keyRegister
                } ?: throw PatchException("$CSC_GIF is not read through SemCscFeature.getString here")
                val answer = instructions.getOrNull(read + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT }
                    ?: throw PatchException("$CSC_GIF: the answer is not kept")
                val register = (answer as OneRegisterInstruction).registerA
                addInstructionsAtControlFlowLabelChecked(
                    read + 2,
                    "invoke-static/range {v$register .. v$register}, $GIFS->gifRegion(Ljava/lang/String;)Ljava/lang/String;\nmove-result-object v$register",
                )
                switches++
            }
        }
        if (switches == 0) throw PatchException("the keyboard's GIF region switch ($CSC_GIF) not found")
        log.info("Show GIFs in every region: $switches switch reads")
        // The phone's feature flags are read when the keyboard builds them, so a change needs a restart.
        samsungKeyboardControls.register(
            HevalFeature(
                id = "samsungkeyboard.gifs_every_region",
                name = "Show GIFs in every region",
                description = "Shows the GIF board where the phone's region turns it off.",
                category = SamsungKeyboardControlsCategory.APPEARANCE,
                default = true,
                restartRequired = true,
            ),
        )
    }
}

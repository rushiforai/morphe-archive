package app.polishapps.patches.zabka.home

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.stringOption
import app.polishapps.patches.inpost.shared.createsInstanceOf
import app.polishapps.patches.inpost.shared.findClasses
import app.polishapps.patches.inpost.shared.findMethods
import app.polishapps.patches.inpost.shared.mutableMethod
import app.polishapps.patches.inpost.shared.strings
import app.polishapps.patches.shared.Constants.COMPATIBILITY_ZABKA_4_51_2
import app.polishapps.patches.shared.replaceBody
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION = "Lapp/polishapps/extension/zabka/HomeShortcuts;"
private const val HOOK = "$EXTENSION->hide(Ljava/util/ArrayList;)V"

private data class PresetTile(val key: String, val title: String, val word: String, val hiddenByDefault: Boolean)

private val PRESET_TILES = listOf(
    PresetTile("hideTriki", "Strefa Gier Triki", "Triki", true),
    PresetTile("hideCouponZone", "Strefa kuponów", "Strefa kuponów", false),
    PresetTile("hideEverythingForZappsy", "Wszystko za żappsy", "Wszystko za żappsy", false),
    PresetTile("hideZabkaMenu", "Menu Żabki", "Menu Żabki", false),
    PresetTile("hideZabkaOffer", "Oferta Żabki", "Oferta Żabki", false),
    PresetTile("hidePartnerZone", "Strefa Partnerów", "Strefa Partnerów", false),
    PresetTile("hideAlcostore", "Alcostore w Żabce Jush!", "Alcostore", false),
    PresetTile("hideTaxi", "Taxi", "Taxi", false),
    PresetTile("hideParcels", "Paczki w Żabce", "Paczki w Żabce", false),
    PresetTile("hideDelivery", "Zakupy z dostawą", "Zakupy z dostawą", false),
    PresetTile("hideBundles", "Pakiety", "Pakiety", false),
    PresetTile("hideNano", "Nano 24/7", "Nano 24/7", false),
    PresetTile("hideVendingMachines", "Automaty vendingowe", "Automaty vendingowe", false),
)

/** The class whose `toString` contains [prefix] (R8 keeps the data class `toString` literals). */
private fun BytecodePatchContext.typeByToString(prefix: String): String =
    findClasses { classDef ->
        classDef.methods.any { it.name == "toString" && prefix in it.strings() }
    }.singleOrNull()?.type ?: throw PatchException("No single class with toString \"$prefix\"")

/** Escapes a value for a smali `const-string`. */
private fun String.smaliEscaped(): String = buildString {
    for (char in this@smaliEscaped) {
        when (char) {
            '\\' -> append("\\\\")
            '"' -> append("\\\"")
            '\n', '\r', '\t' -> append(' ')
            else -> append(char)
        }
    }
}

@Suppress("unused")
val hideHomeShortcutsPatch = bytecodePatch(
    name = "Hide home shortcuts",
    description = "Removes chosen tiles from the home shortcut grid (Strefa kuponów, Menu Żabki, ...). " +
        "Pick the tiles to hide in the patch options; by default only the \"Strefa Gier Triki\" tile.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZABKA_4_51_2)

    extendWith("extensions/extension.mpe")

    // One toggle per tile of the expanded 4.51.2 home grid (the grid itself is server-driven).
    val presetToggles = PRESET_TILES.map { (key, title, word, hiddenByDefault) ->
        booleanOption(
            key = key,
            default = hiddenByDefault,
            title = "Hide \"$title\"",
            description = "Hides the \"$title\" shortcut tile (matches \"$word\").",
        ) to word
    }

    val extraTiles = stringOption(
        key = "tiles",
        default = "",
        title = "Other tiles to hide",
        description = "Comma-separated words for tiles not listed above (for example tiles the server adds " +
            "later). A shortcut tile is hidden when its text contains one of them (case-insensitive).",
        required = false,
    )

    execute {
        val hidden = (presetToggles.filter { (option, _) -> option.value == true }.map { (_, word) -> word } +
            extraTiles.value.orEmpty().trim()).filter { it.isNotEmpty() }.joinToString(",")
        if (hidden.isEmpty()) return@execute

        val extension = mutableClassDefBy(EXTENSION)
        val hiddenWords = extension.methods.singleOrNull { it.name == "hidden" && it.parameters.isEmpty() }
            ?: throw PatchException("$EXTENSION->hidden not found")
        hiddenWords.replaceBody(
            """
                const-string v0, "${hidden.smaliEscaped()}"
                return-object v0
            """,
        )

        // The tile grid is a ServiceSection (or OptionTileSection) UI model built from a tile list; filter
        // that list right before it is handed to the model constructor.
        listOf("ServiceSection(id=", "OptionTileSection(id=").forEach { sectionToString ->
            val sectionType = typeByToString(sectionToString)
            val (classDef, method) = findMethods { _, candidate ->
                candidate.createsInstanceOf(sectionType) &&
                    candidate.implementation?.instructions?.any { instruction ->
                        instruction.opcode == Opcode.INVOKE_DIRECT &&
                            ((instruction as ReferenceInstruction).reference as MethodReference).let {
                                it.definingClass == sectionType && it.name == "<init>"
                            }
                    } == true
            }.singleOrNull() ?: throw PatchException("Mapper creating $sectionType not found")

            val mutable = mutableMethod(classDef, method)
            val constructorCalls = mutable.instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.INVOKE_DIRECT &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).let {
                        it.definingClass == sectionType && it.name == "<init>" &&
                            it.parameterTypes.lastOrNull() == "Ljava/util/ArrayList;"
                    }
            }
            val (index, instruction) = constructorCalls.singleOrNull()
                ?: throw PatchException("$sectionType constructor call not found in ${classDef.type}")
            val invoke = instruction as? FiveRegisterInstruction
                ?: throw PatchException("$sectionType constructor call is not a 35c invoke")
            val listRegister = when (invoke.registerCount) {
                2 -> invoke.registerD
                3 -> invoke.registerE
                4 -> invoke.registerF
                5 -> invoke.registerG
                else -> throw PatchException("Unexpected register count ${invoke.registerCount}")
            }
            mutable.addInstruction(index, "invoke-static {v$listRegister}, $HOOK")
        }
    }
}

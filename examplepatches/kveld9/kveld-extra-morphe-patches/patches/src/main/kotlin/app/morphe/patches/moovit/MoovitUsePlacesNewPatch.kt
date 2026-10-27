package app.morphe.patches.moovit

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants.COMPATIBILITY_MOOVIT
import app.morphe.patches.shared.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val SEARCH_CALLBACK_CLASS = "Lcom/moovit/search/DefaultSearchLocationCallback;"
private const val LEGACY_PROVIDER_MARKER = "google_place_autocomplete_legacy"
private const val NEW_PROVIDER_MARKER = "google_place_autocomplete"

@Suppress("unused")
val moovitUsePlacesNewPatch = bytecodePatch(
    name = "Use Places API (New)",
    description = "Switches search autocomplete from Places API (Legacy) to Places API (New). Legacy Places is not available in new Cloud projects. Requires Places API (New) to be enabled for the API key.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOOVIT)
    dependsOn(moovitFixGoogleMapsPatch)

    execute {
        val legacyTypes = classDefByStrings(LEGACY_PROVIDER_MARKER, StringComparisonType.EQUALS)
            .map { it.type }
            .toSet()
        if (legacyTypes.isEmpty()) {
            error("[Use Places API (New)] Legacy Places provider not found.")
        }

        val callbackClass = mutableClassDefBy(SEARCH_CALLBACK_CLASS)
        val legacyNewInstance = callbackClass.methods
            .asSequence()
            .flatMap { method ->
                val instructions = method.implementation?.instructions
                    ?: return@flatMap emptySequence<Triple<MutableMethod, Int, String>>()
                instructions.asSequence().mapIndexedNotNull { index, instruction ->
                    if (instruction.opcode == Opcode.NEW_INSTANCE &&
                        instruction.getReference<TypeReference>()?.type in legacyTypes
                    ) {
                        Triple(method, index, instruction.getReference<TypeReference>()!!.type)
                    } else {
                        null
                    }
                }
            }
            .firstOrNull()
            ?: error("[Use Places API (New)] Legacy Places provider construction not found.")

        val targetMethod = legacyNewInstance.first
        val legacyNewInstanceIndex = legacyNewInstance.second
        val legacyType = legacyNewInstance.third

        val newTypes = classDefByStrings(NEW_PROVIDER_MARKER, StringComparisonType.EQUALS)
            .map { it.type }
            .filter { it != legacyType }
            .toSet()
        val instructions = targetMethod.implementation!!.instructions.toList()
        val newInstanceIndex = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.NEW_INSTANCE &&
                instruction.getReference<TypeReference>()?.type in newTypes
        }
        if (newInstanceIndex < 0 || newInstanceIndex >= legacyNewInstanceIndex) {
            error("[Use Places API (New)] New Places provider construction not found before the legacy branch.")
        }
        val newType = instructions[newInstanceIndex].getReference<TypeReference>()!!.type

        // Both branches are selected by an if-* immediately before the new provider construction.
        // Turning that branch into a nop forces execution to fall through into the new provider block.
        val branchIndex = (newInstanceIndex - 1 downTo 0).firstOrNull { index ->
            instructions[index].opcode.name.startsWith("if-")
        } ?: error("[Use Places API (New)] Search provider branch not found.")

        targetMethod.replaceInstruction(branchIndex, "nop")
        println("[Use Places API (New)] Redirected search autocomplete to $newType.")
    }
}

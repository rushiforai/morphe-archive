package app.bookspiko.patches.books.reader.font

import app.bookspiko.patches.books.shared.Constants.EXTENSION_PACKAGE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val SETTINGS_HOOK = "$EXTENSION_PACKAGE/settings/SettingsHook;"

/** The `getValue(Map, key)` style static call, if [instruction] is one. */
private fun mapLookup(instruction: Instruction): MethodReference? {
    if (instruction.opcode != Opcode.INVOKE_STATIC) return null
    val reference = (instruction as ReferenceInstruction).reference as MethodReference
    if (reference.returnType != "Ljava/lang/Object;") return null
    if (reference.parameterTypes.map { it.toString() } != listOf("Ljava/util/Map;", "Ljava/lang/Object;")) return null
    return reference
}

/** Type of the first check-cast within a few instructions after [index]. */
private fun castAfter(instructions: List<Instruction>, index: Int): String? =
    instructions.subList(index + 1, minOf(index + 5, instructions.size))
        .firstOrNull { it.opcode == Opcode.CHECK_CAST }
        ?.let { ((it as ReferenceInstruction).reference as TypeReference).type }

private fun requireNibble(register: Int, what: String) {
    if (register > 15) throw PatchException("$what uses register v$register, which needs a range invoke")
}

/**
 * Adds a "Custom font" row to Settings > Ebook reading.
 *
 * The settings screen is built from a static tree of nodes and a Dagger map from item id to item.
 * The extension inserts a node with an unused id into the reading category and maps that id to a
 * second instance of the "About Google Play Books" row, which is then given its own title, subtitle
 * and click action here.
 */
context(context: BytecodePatchContext)
internal fun addFontSettingsEntry() {
    // region Register the row.

    // The extension reads the static settings tree through SettingsHook.treeRoot().
    val itemsProvider = SettingsItemsProviderFingerprint.match()
    val treeField = itemsProvider.instructionMatches[0].getInstruction<ReferenceInstruction>().reference as FieldReference
    context.mutableClassDefBy(SETTINGS_HOOK).methods.single { it.name == "treeRoot" }.addInstructions(
        0,
        """
            sget-object v0, ${treeField.definingClass}->${treeField.name}:${treeField.type}
            return-object v0
        """,
    )

    // Each settings screen gets its own copy of the item map from Dagger and looks items up with
    // getValue(), which throws for missing ids. Every class that reads items from such a map
    // (getValue followed by a cast to a settings item type) must get the map with the row added.
    val registryClass = (itemsProvider.instructionMatches[3].getInstruction<ReferenceInstruction>().reference as MethodReference).definingClass
    val (getValue, itemType) = context.mutableClassDefBy(registryClass).methods.firstNotNullOfOrNull { method ->
        val instructions = method.implementation?.instructions?.toList() ?: return@firstNotNullOfOrNull null
        instructions.withIndex().firstNotNullOfOrNull { (index, instruction) ->
            mapLookup(instruction)?.let { lookup -> castAfter(instructions, index)?.let { lookup to it } }
        }
    } ?: throw PatchException("Settings item lookup not found in $registryClass")

    val itemTypes = mutableSetOf(itemType)
    context.classDefForEach { classDef ->
        if (itemType in classDef.interfaces) itemTypes += classDef.type
    }

    val mapReaders = mutableListOf<String>()
    context.classDefForEach { classDef ->
        val readsItems = classDef.methods.any { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@any false
            instructions.withIndex().any { (index, instruction) ->
                mapLookup(instruction) == getValue && castAfter(instructions, index) in itemTypes
            }
        }
        if (readsItems) mapReaders += classDef.type
    }
    if (registryClass !in mapReaders || mapReaders.size < 2) {
        throw PatchException("Unexpected settings item map readers: $mapReaders")
    }

    mapReaders.forEach { type ->
        val constructors = context.mutableClassDefBy(type).methods.filter { method ->
            method.name == "<init>" && method.parameterTypes.any { it.toString() == "Ljava/util/Map;" }
        }
        if (constructors.isEmpty()) throw PatchException("No constructor taking the settings item map in $type")

        constructors.forEach { constructor ->
            var register = 1 // p0 is this.
            constructor.parameterTypes.forEach { parameter ->
                val name = parameter.toString()
                if (name == "Ljava/util/Map;") {
                    constructor.addInstructions(
                        0,
                        """
                            invoke-static/range { p$register .. p$register }, $SETTINGS_HOOK->registerFontItem(Ljava/util/Map;)Ljava/util/Map;
                            move-result-object p$register
                        """,
                    )
                }
                register += if (name == "J" || name == "D") 2 else 1
            }
        }
    }

    // endregion

    // region Title, subtitle and click of the reused row.

    AboutSettingsItemFingerprint.match().let { match ->
        val method = match.method
        val itemRegister = method.implementation!!.registerCount - method.parameters.size - 1
        requireNibble(itemRegister, "Settings row")

        // Subtitle: the String captured by the subtitle lambda, computed before the title.
        val subtitleConstructor = method.instructions.withIndex().firstOrNull { (_, instruction) ->
            if (instruction.opcode != Opcode.INVOKE_DIRECT) return@firstOrNull false
            val reference = (instruction as ReferenceInstruction).reference as MethodReference
            reference.name == "<init>" && reference.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;")
        } ?: throw PatchException("Subtitle lambda not found in ${method.definingClass}")
        val subtitle = (subtitleConstructor.value as FiveRegisterInstruction).registerD
        requireNibble(subtitle, "Settings row subtitle")

        // Title: result of the string resource lookup.
        val titleResult = match.instructionMatches[2]
        val title = titleResult.getInstruction<OneRegisterInstruction>().registerA
        requireNibble(title, "Settings row title")

        // Click lambda: the synthetic class constructed with the row itself.
        val clickLambdaType = method.instructions.firstNotNullOfOrNull { instruction ->
            if (instruction.opcode != Opcode.INVOKE_DIRECT) return@firstNotNullOfOrNull null
            val reference = (instruction as ReferenceInstruction).reference as MethodReference
            reference.definingClass.takeIf {
                reference.name == "<init>" &&
                    reference.parameterTypes.map { it.toString() } == listOf(method.definingClass)
            }
        } ?: throw PatchException("Click lambda not found in ${method.definingClass}")

        method.addInstructions(
            titleResult.index + 1,
            """
                invoke-static { v$itemRegister, v$title }, $SETTINGS_HOOK->title(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$title
            """,
        )
        // The subtitle register already holds the version text when the title resource is loaded.
        method.addInstructions(
            match.instructionMatches[0].index,
            """
                invoke-static { v$itemRegister, v$subtitle }, $SETTINGS_HOOK->subtitle(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$subtitle
            """,
        )

        val clickClass = context.mutableClassDefBy(clickLambdaType)
        val rowField = clickClass.fields.firstOrNull { it.type == method.definingClass }
            ?: throw PatchException("Row field not found in $clickLambdaType")
        val invoke = clickClass.methods.firstOrNull { candidate ->
            candidate.name != "<init>" && candidate.returnType == "Ljava/lang/Object;" &&
                candidate.implementation?.instructions?.any { it.opcode == Opcode.RETURN_OBJECT } == true
        } ?: throw PatchException("Click handler not found in $clickLambdaType")

        if (invoke.implementation!!.registerCount - invoke.parameters.size - 1 < 1) {
            throw PatchException("No free register in $clickLambdaType")
        }
        // The handler returns Kotlin's Unit singleton; reuse its reference.
        val unitField = invoke.instructions.last { it.opcode == Opcode.SGET_OBJECT }
            .let { ((it as ReferenceInstruction).reference as FieldReference) }

        invoke.addInstructionsWithLabels(
            0,
            """
                iget-object v0, p0, $clickLambdaType->${rowField.name}:${rowField.type}
                invoke-static { v0 }, $SETTINGS_HOOK->onClick(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :original
                sget-object v0, ${unitField.definingClass}->${unitField.name}:${unitField.type}
                return-object v0
            """,
            ExternalLabel("original", invoke.getInstruction(0)),
        )
    }

    // endregion
}

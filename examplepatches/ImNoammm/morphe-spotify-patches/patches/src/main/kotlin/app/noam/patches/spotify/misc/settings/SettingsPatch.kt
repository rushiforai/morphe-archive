package app.noam.patches.spotify.misc.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.spotify.shared.Constants
import app.noam.patches.spotify.shared.indexOfFirstOrThrow
import app.noam.patches.spotify.shared.returnString
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** The settings row the patch anchors on; its section is where the Morphe row is added. */
internal const val ANCHOR_ROW_ID = "appIcon"

/** Index of the row accessor in Spotify's settings row constructor. */
private const val ACCESSOR_PARAMETER_INDEX = 9

@Suppress("unused")
val settingsPatch = bytecodePatch(
    name = "Morphe settings",
    description = "Adds a Morphe entry to Spotify's settings, which is where the settings of the " +
        "other Morphe patches live.",
    default = true,
) {
    compatibleWith(Constants.SPOTIFY_PACKAGE)

    dependsOn(settingsResourcePatch)

    extendWith("extensions/spotify.mpe")

    execute {
        val method = SettingsSectionFingerprint.method

        // The anchor row tells us where in this method a settings row is built.
        val anchorIndex = method.indexOfFirstOrThrow(description = "the \"$ANCHOR_ROW_ID\" row") {
            it.opcode == Opcode.CONST_STRING &&
                ((it as ReferenceInstruction).reference as StringReference).string == ANCHOR_ROW_ID
        }

        // A settings row is the only constructor taking an id followed by two string resource ids.
        val rowConstructorIndex = method.indexOfFirstOrThrow(anchorIndex, "the settings row constructor") {
            if (it.opcode != Opcode.INVOKE_DIRECT_RANGE && it.opcode != Opcode.INVOKE_DIRECT) return@indexOfFirstOrThrow false
            val reference = (it as ReferenceInstruction).reference as? MethodReference
                ?: return@indexOfFirstOrThrow false
            reference.name == "<init>" &&
                reference.parameterTypes.size > ACCESSOR_PARAMETER_INDEX &&
                reference.parameterTypes[0] == "Ljava/lang/String;" &&
                reference.parameterTypes[1] == "Ljava/lang/Integer;" &&
                reference.parameterTypes[2] == "Ljava/lang/Integer;"
        }

        val rowConstructor = method
            .getInstruction<ReferenceInstruction>(rowConstructorIndex).reference as MethodReference

        // The accessor decides what happens when a row is tapped. Rather than tracing registers
        // through a method this large, both classes are identified by their shape: the accessor that
        // pairs navigation metadata with an action, and the action implementation that takes a Kotlin
        // function, which is the one that can run our code.
        val accessorInterface = rowConstructor.parameterTypes[ACCESSOR_PARAMETER_INDEX].toString()

        var holderType: String? = null
        var actionType: String? = null

        classDefsByInterface(accessorInterface).forEach { accessorImplementation ->
            if (holderType != null) return@forEach

            val constructor = accessorImplementation.directMethods.firstOrNull {
                it.name == "<init>" &&
                    it.parameterTypes.size == 2 &&
                    it.parameterTypes.all { parameter -> parameter.startsWith("L") }
            } ?: return@forEach

            val actionInterface = constructor.parameterTypes[1].toString()

            // Two actions carry a destination; the one that takes nothing but a string is
            // unambiguous, while the other also accepts an internal screen enum.
            val action = classDefByOrNull { classDef ->
                classDef.interfaces.contains(actionInterface) &&
                    classDef.directMethods.count { it.name == "<init>" } == 1 &&
                    classDef.directMethods.any { candidate ->
                        candidate.name == "<init>" &&
                            candidate.parameterTypes.size == 1 &&
                            candidate.parameterTypes[0] == "Ljava/lang/String;"
                    }
            } ?: return@forEach

            holderType = accessorImplementation.type
            actionType = action.type
        }

        if (holderType == null || actionType == null) {
            throw PatchException("Could not find a tappable settings row action")
        }

        // Hand the discovered class names to the extension, which builds the row reflectively so it
        // never has to name an obfuscated class at compile time.
        mutableClassDefBy(Constants.SETTINGS_TILE_CLASS).methods.apply {
            first { it.name == "navigationHolderClassName" }.returnString(holderType!!.toBinaryName())
            first { it.name == "destinationActionClassName" }.returnString(actionType!!.toBinaryName())
        }

        // The Morphe row is modelled on a real row from this section, but belongs in the main menu,
        // so this call only takes the copy. Patching the array rather than the built list keeps the
        // list's own type intact.
        val listBuilderIndex = method.indexOfFirstOrThrow(rowConstructorIndex, "the section row list") {
            if (it.opcode != Opcode.INVOKE_STATIC && it.opcode != Opcode.INVOKE_STATIC_RANGE) {
                return@indexOfFirstOrThrow false
            }
            val reference = (it as ReferenceInstruction).reference as? MethodReference
                ?: return@indexOfFirstOrThrow false
            reference.parameterTypes.size == 1 &&
                reference.parameterTypes[0] == "[Ljava/lang/Object;"
        }

        val arrayRegister = when (val instruction = method.getInstruction(listBuilderIndex)) {
            is RegisterRangeInstruction -> instruction.startRegister
            is FiveRegisterInstruction -> instruction.registerC
            else -> throw PatchException("Unexpected list builder instruction")
        }

        method.addInstructions(
            listBuilderIndex,
            """
                invoke-static/range { v$arrayRegister .. v$arrayRegister }, ${Constants.SETTINGS_TILE_CLASS}->captureTile([Ljava/lang/Object;)[Ljava/lang/Object;
                move-result-object v$arrayRegister
            """,
        )

        // Add the row to the main settings menu, just before its entries are converted for display.
        MainSettingsMenuFingerprint.method.apply {
            val anchorIndex = indexOfFirstOrThrow(description = "the settings page anchor") {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == "notificationsPage"
            }

            val menuListIndex = indexOfFirstOrThrow(anchorIndex, "the main settings menu list") {
                if (it.opcode != Opcode.INVOKE_STATIC && it.opcode != Opcode.INVOKE_STATIC_RANGE) {
                    return@indexOfFirstOrThrow false
                }
                val reference = (it as ReferenceInstruction).reference as? MethodReference
                    ?: return@indexOfFirstOrThrow false
                reference.parameterTypes.size == 1 &&
                    reference.parameterTypes[0] == "Ljava/util/List;" &&
                    reference.returnType != "V"
            }

            val listRegister = when (val instruction = getInstruction(menuListIndex)) {
                is RegisterRangeInstruction -> instruction.startRegister
                is FiveRegisterInstruction -> instruction.registerC
                else -> throw PatchException("Unexpected main settings menu instruction")
            }

            addInstructions(
                menuListIndex,
                """
                    invoke-static/range { v$listRegister .. v$listRegister }, ${Constants.SETTINGS_TILE_CLASS}->addToMainMenu(Ljava/util/List;)V
                """,
            )
        }

        // Guard against a silent no-op: the row constructor is needed by the extension at runtime.
        if (rowConstructor.parameterTypes.size < 10) {
            throw PatchException("Unexpected settings row constructor: $rowConstructor")
        }
    }
}

private fun String.toBinaryName() = substring(1, length - 1).replace('/', '.')

/** Every class in the app that directly implements [interfaceType]. */
context(context: app.morphe.patcher.patch.BytecodePatchContext)
private fun classDefsByInterface(interfaceType: String) = buildList {
    context.classDefForEach { if (it.interfaces.contains(interfaceType)) add(it) }
}

package app.morphe.patches.instants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SAVE_HELPER = "Lapp/morphe/extension/instants/InstantsSaveImage;"
private const val STRINGS_HELPER = "Lapp/morphe/extension/instants/InstantsStrings;"

/**
 * Adds a "Save to gallery" item (in the app's language) to the context menu of the friends' Instants viewer.
 * Part of [instantsModPatch].
 */
val instantsSaveImagePatch = bytecodePatch {  // unnamed: only loaded through [instantsModPatch]
    compatibleWith(INSTANTS_COMPATIBILITY)
    extendWith("extensions/extension.mpe")
    dependsOn(instantsActivityPatch)

    execute {
        // 1) The context menu: add one item before the last one ("Denunciar"), built with the app's
        //    own item factory so it looks like the others.
        val menu = ViewerMenuItemsFingerprint.method
        val menuInstructions = menu.implementation!!.instructions
        val factory = ViewerMenuItemFactoryFingerprint.method
        val enumType = factory.parameterTypes[1].toString()

        val factoryCalls = menuInstructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                ((instruction as ReferenceInstruction).reference as? MethodReference).let {
                    it != null && it.definingClass == factory.definingClass && it.name == factory.name
                }
        }
        check(factoryCalls.size >= 2) { "Instants: expected the viewer menu item calls, found ${factoryCalls.size}" }

        fun enumFieldBefore(callIndex: Int): Int = (callIndex - 1 downTo 0).first { index ->
            menuInstructions[index].opcode == Opcode.SGET_OBJECT &&
                ((menuInstructions[index] as ReferenceInstruction).reference as FieldReference).type == enumType
        }

        val lastCall = factoryCalls.last()
        val lastCallInstruction = lastCall.value as FiveRegisterInstruction
        val composerRegister = lastCallInstruction.registerC
        val enumRegister = lastCallInstruction.registerD
        val textRegister = lastCallInstruction.registerE

        // The list the items are added to: receiver of the next add() after the last item.
        val addInstruction = (lastCall.index + 1 until menuInstructions.size).map { menuInstructions[it] }.first {
            it.opcode == Opcode.INVOKE_VIRTUAL &&
                ((it as ReferenceInstruction).reference as MethodReference).name == "add"
        }
        val listRegister = (addInstruction as FiveRegisterInstruction).registerC
        val addReference = (addInstruction as ReferenceInstruction).reference as MethodReference
        check(listOf(composerRegister, enumRegister, textRegister, listRegister).all { it < 16 }) {
            "Instants: viewer menu registers do not fit a 4-bit encoding"
        }

        // The item is built by the app's own factory from an action enum (icon, id, destructive flag),
        // using the action of the second item ("Pular") as a base. Its icon is then swapped for the
        // app's download icon: the factory turns the enum's icon resource id into a painter with a
        // static (composer, int) function; the same function is called here with the download icon.
        val baseField = (menuInstructions[enumFieldBefore(factoryCalls[1].index)] as ReferenceInstruction).reference as FieldReference
        val factoryInstructions = factory.implementation!!.instructions
        val painterCallIndex = factoryInstructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                ((instruction as ReferenceInstruction).reference as? MethodReference).let {
                    it != null && it.returnType != "V" && it.parameterTypes.size == 2 &&
                        it.parameterTypes[1].toString() == "I"
                }
        }
        check(painterCallIndex >= 0) { "Instants: icon painter call not found in the menu item factory" }
        val painterReference = (factoryInstructions[painterCallIndex] as ReferenceInstruction).reference as MethodReference
        val painterResRegister = (factoryInstructions[painterCallIndex] as FiveRegisterInstruction).registerD
        val iconField = (0 until painterCallIndex).reversed().map { factoryInstructions[it] }.first {
            it.opcode == Opcode.IGET && (it as TwoRegisterInstruction).registerA == painterResRegister
        }.let { (it as ReferenceInstruction).reference as FieldReference }
        check(iconField.definingClass == enumType && iconField.type == "I") {
            "Instants: icon resource field not found on the menu action enum"
        }
        val painterDescriptor =
            "${painterReference.definingClass}->${painterReference.name}(${painterReference.parameterTypes.joinToString("")})${painterReference.returnType}"

        val insertAt = enumFieldBefore(lastCall.index)
        val factoryDescriptor =
            "${factory.definingClass}->${factory.name}(${factory.parameterTypes.joinToString("")})${factory.returnType}"
        val addDescriptor =
            "${addReference.definingClass}->${addReference.name}(${addReference.parameterTypes.joinToString("")})${addReference.returnType}"

        menu.addInstructions(
            insertAt,
            """
            sget-object v$enumRegister, ${baseField.definingClass}->${baseField.name}:${baseField.type}
            invoke-static {}, $STRINGS_HELPER->saveToGallery()Ljava/lang/String;
            move-result-object v$textRegister
            invoke-static {v$composerRegister, v$enumRegister, v$textRegister}, $factoryDescriptor
            move-result-object v$textRegister
            iget v$enumRegister, v$enumRegister, ${iconField.definingClass}->${iconField.name}:I
            invoke-static {v$enumRegister}, $SAVE_HELPER->downloadIcon(I)I
            move-result v$enumRegister
            invoke-static {v$composerRegister, v$enumRegister}, $painterDescriptor
            move-result-object v$enumRegister
            invoke-static {v$textRegister, v$enumRegister}, $SAVE_HELPER->markMenuItem(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$textRegister
            invoke-virtual {v$listRegister, v$textRegister}, $addDescriptor
            """.trimIndent(),
        )

        // 2) The menu composable also receives the viewer state (p3). The state knows which media
        //    is current, so the extension reads the photo from it when the item is clicked.
        // It also gets the class of the video player, which holds the static helper that turns a media
        // into its video source; the extension calls it on demand to tell videos from photos. v0 is
        // free at the start of the method.
        val videoPlayerClass = ViewerVideoPlayerFingerprint.method.definingClass
        menu.addInstructions(
            0,
            """
            invoke-static/range {p3 .. p3}, $SAVE_HELPER->onViewerState(Ljava/lang/Object;)V
            const-class v0, $videoPlayerClass
            invoke-static {v0}, $SAVE_HELPER->setVideoSourceClass(Ljava/lang/Class;)V
            """.trimIndent(),
        )

        // 3) The click: the handler reads the selected item's id; report it (an id that matches no
        //    action enum entry is otherwise ignored by the app).
        viewerMenuEnumType = enumType
        val selection = ViewerMenuSelectionFingerprint.method
        val selectionInstructions = selection.implementation!!.instructions.toList()
        val idRead = selectionInstructions.selectedItemIdReadIndex(enumType)
        check(idRead >= 0) { "Instants: menu selection handler not found" }
        val idRegister = (selectionInstructions[idRead] as TwoRegisterInstruction).registerA
        selection.addInstructions(
            idRead + 1,
            """
            invoke-static/range {v$idRegister .. v$idRegister}, $SAVE_HELPER->onMenuSelected(I)V
            """.trimIndent(),
        )
    }
}

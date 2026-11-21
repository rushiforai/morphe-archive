/*
 * Save Instants to gallery for Instagram (Morphe).
 *
 * Instagram ships Instants (quick snaps) inside the app. This patch ports the "Save to gallery"
 * row of the Instants Morphe patch (patches/.../Instants/InstantsSaveImagePatch.kt) to Instagram's
 * embedded viewer: the row is added to the viewer's context menu with the app's own item factory,
 * and the extension saves the photo or video of the current item to the device.
 *
 * Hook points resolved by unobfuscated Compose trace strings:
 *  - createQuickSnapContextMenuItems: builds the viewer menu items.
 *  - toMenuItem: the app's single menu item factory.
 *  - QuickSnapVideoPlayer: the class holding the static (Media) -> video source helper.
 * The click handler is found by the shape of its obfuscated code (it maps a menu item id to the
 * menu action enum), so its obfuscated name is not needed.
 */

package app.morphe.patches.instagram.instants

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi.ARM64_V8A
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val SAVE_HELPER = "Lapp/morphe/extension/instants/InstantsSaveImage;"
private const val STRINGS_HELPER = "Lapp/morphe/extension/instants/InstantsStrings;"
private const val GALLERY_HELPER = "Lapp/morphe/extension/instants/InstantsGalleryHelper;"

// True when the method loads a string literal starting with [prefix]. Compose trace names end with
// ".kt:<line>)", and the line moves from version to version.
private fun Method.hasStringStartingWith(prefix: String) = implementation?.instructions?.any { instruction ->
    (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
        ((instruction as ReferenceInstruction).reference as? StringReference)?.string?.startsWith(prefix) == true
} == true

// Records the activity for the extension (context of the toast and icon lookup).
private object InstagramActivityFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/base/activity/BaseFragmentActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

// Builds the viewer's context menu items.
private object QuickSnapMenuItemsFingerprint : Fingerprint(
    custom = { method, _ ->
        method.hasStringStartingWith(
            "com.instagram.quicksnap.viewer.compose.createQuickSnapContextMenuItems (",
        )
    },
)

// Factory of one menu item: (composer, action enum, text) -> item.
private object QuickSnapMenuItemFactoryFingerprint : Fingerprint(
    custom = { method, _ ->
        method.hasStringStartingWith("com.instagram.quicksnap.viewer.compose.toMenuItem (")
    },
)

// The viewer's video player composable. Only used to find the class that holds the video helper
// (Media -> video source), which the extension calls on demand.
private object QuickSnapVideoPlayerFingerprint : Fingerprint(
    custom = { method, _ ->
        method.hasStringStartingWith("com.instagram.quicksnap.common.ui.media.QuickSnapVideoPlayer (")
    },
)

// Index of the instruction that reads the selected item's id inside the menu click handler:
//   check-cast vX, <event>; ...; iget vN, vX, <event>->id:I; sget-object vY, <enum>->entries:EnumEntries
// The entries must belong to [enumType], the enum of the menu items.
private fun List<Instruction>.selectedItemIdReadIndex(enumType: String): Int {
    for (index in indices) {
        val instruction = this[index]
        if (instruction.opcode != Opcode.IGET) continue
        val field = (instruction as ReferenceInstruction).reference as? FieldReference ?: continue
        if (field.type != "I") continue
        val castBefore = (maxOf(0, index - 8) until index).any {
            this[it].opcode == Opcode.CHECK_CAST &&
                ((this[it] as ReferenceInstruction).reference as? TypeReference)?.type == field.definingClass
        }
        val entriesAfter = ((index + 1)..minOf(lastIndex, index + 3)).any {
            this[it].opcode == Opcode.SGET_OBJECT &&
                ((this[it] as ReferenceInstruction).reference as? FieldReference).let { entries ->
                    entries != null && entries.type == "Lkotlin/enums/EnumEntries;" &&
                        entries.definingClass == enumType
                }
        }
        if (castBefore && entriesAfter) return index
    }
    return -1
}

// Set by the patch, from the item factory's enum parameter, before the fingerprint below is resolved
// (fingerprints are matched lazily, on first access).
private var menuEnumType: String = ""

// The menu click handler: the lambda that maps the selected item's id to an entry of the menu
// items' enum. Neither its name nor its class are matched beyond the lambda shape.
private object QuickSnapMenuSelectionFingerprint : Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    custom = { method, _ ->
        menuEnumType.isNotEmpty() &&
            method.implementation?.instructions?.toList()?.selectedItemIdReadIndex(menuEnumType)?.let { it >= 0 } == true
    },
)

@Suppress("unused")
val saveInstantsToGalleryPatch = bytecodePatch(
    name = "Save Instants to gallery",
    description = "Adds a \"Save to gallery\" option to the Instants menu, so you can keep the photo " +
        "or video you are viewing.",
) {
    compatibleWith(
        Compatibility(
            name = "Instagram",
            packageName = "com.instagram.android",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFC483C,
            targets = listOf(
                AppTarget(
                    version = "452.1.0.53.64",
                    versionCodes = mapOf(ARM64_V8A to 385811006),
                ),
            ),
        ),
    )

    // Merges the Instants save/strings/gallery helpers (already in this bundle's extension) into
    // the patched APK.
    extendWith("extensions/extension.mpe")

    execute {
        // 1) The context menu: add one item before the last one, built with the app's own item
        //    factory so it looks like the others.
        val menu = QuickSnapMenuItemsFingerprint.method
        val menuInstructions = menu.implementation!!.instructions
        val factory = QuickSnapMenuItemFactoryFingerprint.method
        val enumType = factory.parameterTypes[1].toString()

        val factoryCalls = menuInstructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                ((instruction as ReferenceInstruction).reference as? MethodReference).let {
                    it != null && it.definingClass == factory.definingClass && it.name == factory.name
                }
        }
        check(factoryCalls.size >= 2) {
            "Instagram: expected the Instants menu item calls, found ${factoryCalls.size}"
        }

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
            "Instagram: Instants menu registers do not fit a 4-bit encoding"
        }

        // The item is built by the app's own factory from an action enum (icon, id, destructive flag),
        // using the action of the second item as a base. Its icon is then swapped for the app's
        // download icon: the factory turns the enum's icon resource id into a painter with a static
        // (composer, int) function; the same function is called here with the download icon.
        val baseField = (menuInstructions[enumFieldBefore(factoryCalls[1].index)] as ReferenceInstruction).reference as FieldReference
        val factoryInstructions = factory.implementation!!.instructions
        val painterCallIndex = factoryInstructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                ((instruction as ReferenceInstruction).reference as? MethodReference).let {
                    it != null && it.returnType != "V" && it.parameterTypes.size == 2 &&
                        it.parameterTypes[1].toString() == "I"
                }
        }
        check(painterCallIndex >= 0) { "Instagram: icon painter call not found in the Instants menu item factory" }
        val painterReference = (factoryInstructions[painterCallIndex] as ReferenceInstruction).reference as MethodReference
        val painterResRegister = (factoryInstructions[painterCallIndex] as FiveRegisterInstruction).registerD
        val iconField = (0 until painterCallIndex).reversed().map { factoryInstructions[it] }.first {
            it.opcode == Opcode.IGET && (it as TwoRegisterInstruction).registerA == painterResRegister
        }.let { (it as ReferenceInstruction).reference as FieldReference }
        check(iconField.definingClass == enumType && iconField.type == "I") {
            "Instagram: icon resource field not found on the Instants menu action enum"
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

        // 2) The menu composable also receives the viewer state (p3). The state knows which item is
        //    current, so the extension reads the photo from it when the item is clicked.
        // It also gets the class of the video player, which holds the static helper that turns a media
        // into its video source; the extension calls it on demand to tell videos from photos.
        val videoPlayerClass = QuickSnapVideoPlayerFingerprint.method.definingClass
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
        menuEnumType = enumType
        val selection = QuickSnapMenuSelectionFingerprint.method
        val selectionInstructions = selection.implementation!!.instructions.toList()
        val idRead = selectionInstructions.selectedItemIdReadIndex(enumType)
        check(idRead >= 0) { "Instagram: Instants menu selection handler not found" }
        val idRegister = (selectionInstructions[idRead] as TwoRegisterInstruction).registerA
        selection.addInstructions(
            idRead + 1,
            """
            invoke-static/range {v$idRegister .. v$idRegister}, $SAVE_HELPER->onMenuSelected(I)V
            """.trimIndent(),
        )

        // 4) The activity, for the toast and the download icon lookup.
        InstagramActivityFingerprint.method.addInstructions(
            0,
            """
            invoke-static/range {p0 .. p0}, $GALLERY_HELPER->setActivity(Landroid/app/Activity;)V
            """.trimIndent(),
        )
    }
}

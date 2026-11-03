package app.kyt.patches.rym

import app.kyt.patches.shared.Constants.COMPATIBILITY_TIDAL
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.findInstructionIndicesReversedOrThrow
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val EXTENSION_CLASS = "Lapp/kyt/extension/rym/RateYourMusicPatch;"
private const val EXTENSION_MENU_ITEM_CLASS = "Lapp/kyt/extension/rym/RymMenuItem;"
private const val EXTENSION_TIDAL_OBJECTS_CLASS = "Lapp/kyt/extension/rym/TidalObjects;"
private const val TRACK_TYPE = "Lcom/aspiro/wamp/model/Track;"
private const val ALBUM_TYPE = "Lcom/aspiro/wamp/model/Album;"
private const val ARTIST_TYPE = "Lcom/aspiro/wamp/model/Artist;"
private const val FRAGMENT_ACTIVITY_TYPE = "Landroidx/fragment/app/FragmentActivity;"

/**
 * Parameter types of the constructor of the TIDAL menu item class:
 * title, icon, id, content metadata, unknown, color, unknown, defaults mask.
 * Obfuscated types are declared as "L".
 */
private val MENU_ITEM_CONSTRUCTOR_PARAMETERS = listOf("L", "I", "Ljava/lang/String;", "L", "I", "I", "I", "I")

@Suppress("unused")
val rateYourMusicSearchPatch = bytecodePatch(
    name = "Add Rate Your Music search",
    description = "Adds an option to the track, album and artist menus to search them on Rate Your Music.",
    default = true
) {
    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith("extensions/extension.mpe")

    execute {
        setUpMenuItemClass()

        TrackContextMenuItemsFingerprint.addMenuItemsHookBeforeReturns(TRACK_TYPE, "onTrackMenuItems")
        AlbumContextMenuItemsFingerprint.addMenuItemsHookBeforeReturns(ALBUM_TYPE, "onAlbumMenuItems")

        ArtistContextMenuConstructorFingerprint.let {
            // The match is the instruction that saves the list of all possible items in a field:
            // iput-object vList, vThis, LArtistMenu;->list:Ljava/util/ArrayList;
            // Pass the list and the artist to the extension right after it.
            val saveListMatch = it.instructionMatches.first()
            val saveListInstruction = saveListMatch.getInstruction<TwoRegisterInstruction>()
            val listRegister = saveListInstruction.registerA
            val thisRegister = saveListInstruction.registerB
            val insertIndex = saveListMatch.index + 1

            val artistFieldSmali = it.originalClassDef.fieldSmaliOfType(ARTIST_TYPE)

            it.method.apply {
                // The list and "this" can be above v15, see addMenuItemsHookBeforeReturns().
                val registers = getFreeRegisterProvider(insertIndex, 2, listRegister, thisRegister)
                val freeRegister = registers.getFreeRegister4Bit()
                val artistRegister = registers.getFreeRegister4Bit()

                addInstructions(
                    insertIndex,
                    """
                        move-object/from16 v$freeRegister, v$thisRegister
                        iget-object v$artistRegister, v$freeRegister, $artistFieldSmali
                        move-object/from16 v$freeRegister, v$listRegister
                        invoke-static { v$freeRegister, v$artistRegister }, $EXTENSION_CLASS->onArtistMenuItems(Ljava/util/List;Ljava/lang/Object;)V
                    """
                )
            }
        }
    }
}

/**
 * For a menu method that builds and returns the list of menu items, passes the list and the
 * model object the menu was opened for (track, album...) to an extension method,
 * right before each return, and returns the list the extension method returns instead.
 *
 * The extension method returns a new list instead of adding to the original list,
 * because the original list can be unmodifiable, such as the list of the album menu.
 *
 * @param modelType The type of the field of the menu class that holds the model object.
 * @param extensionMethodName Extension method that takes the list and the model object
 * and returns the list to show.
 */
context(_: BytecodePatchContext)
private fun Fingerprint.addMenuItemsHookBeforeReturns(modelType: String, extensionMethodName: String) {
    // The menu class keeps the object it was opened for in a field.
    val modelFieldSmali = originalClassDef.fieldSmaliOfType(modelType)

    method.apply {
        // The method can have multiple returns, such as the track menu with one for each kind of menu
        // (album, playlist, queue...). Pass the list and the model object to the extension right before each one.
        // Indexes are visited from last to first, so inserting code keeps the others valid.
        findInstructionIndicesReversedOrThrow(opcode(Opcode.RETURN_OBJECT)).forEach { returnIndex ->
            val listRegister = getInstruction<OneRegisterInstruction>(returnIndex).registerA

            // The method uses many registers, so the list and p0 can be above v15.
            // iget-object and non-range invoke only accept v0-v15, so copy them to free 4-bit registers.
            val registers = getFreeRegisterProvider(returnIndex, 2, listRegister)
            val freeRegister = registers.getFreeRegister4Bit()
            val modelRegister = registers.getFreeRegister4Bit()

            // A branch can jump to the return, so the code must be placed at its control flow label.
            addInstructionsAtControlFlowLabel(
                returnIndex,
                """
                    move-object/from16 v$freeRegister, p0
                    iget-object v$modelRegister, v$freeRegister, $modelFieldSmali
                    move-object/from16 v$freeRegister, v$listRegister
                    invoke-static { v$freeRegister, v$modelRegister }, $EXTENSION_CLASS->$extensionMethodName(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;
                    move-result-object v$freeRegister
                    move-object/from16 v$listRegister, v$freeRegister
                """
            )
        }
    }
}

/**
 * @return The smali reference of the first field of the class with a type,
 * such as `Lewh;->b:Lcom/aspiro/wamp/model/Track;`.
 */
private fun ClassDef.fieldSmaliOfType(type: String): String {
    val field = fields.firstOrNull { it.type == type }
        ?: throw PatchException("No field of type $type in ${this.type}")

    return "${field.definingClass}->${field.name}:${field.type}"
}

/**
 * Turns the extension class RymMenuItem into a TIDAL context menu item.
 *
 * The TIDAL menu item class is obfuscated, so it is found here at patch time and then:
 * 1. It becomes the superclass of RymMenuItem.
 * 2. The super() call of the RymMenuItem constructor calls the TIDAL menu item constructor instead.
 * 3. RymMenuItem gets the click method TIDAL calls, which calls RymMenuItem.onClick().
 * 4. The extension methods that create obfuscated TIDAL objects and return resource ids are implemented.
 */
private fun BytecodePatchContext.setUpMenuItemClass() {
    // All context menu items, such as "Go to artist", extend the same class.
    val menuItemClass = classDefBy(ShowArtistMenuItemConstructorFingerprint.originalClassDef.superclass!!)

    val menuItemConstructor = menuItemClass.methods.single { it.name == "<init>" }
    val constructorParameters = menuItemConstructor.parameterTypes.map { it.toString() }
    if (constructorParameters.size != MENU_ITEM_CONSTRUCTOR_PARAMETERS.size ||
        !constructorParameters.zip(MENU_ITEM_CONSTRUCTOR_PARAMETERS).all { (type, expected) -> type.startsWith(expected) }
    ) {
        throw PatchException("Unexpected menu item constructor: $constructorParameters")
    }
    val menuItemConstructorSmali = "${menuItemClass.type}-><init>(${constructorParameters.joinToString("")})V"
    val titleType = constructorParameters[0]
    val contentMetadataType = constructorParameters[3]

    // The method TIDAL calls when a menu item is pressed. It is the only abstract method.
    val clickMethod = menuItemClass.methods.single { method ->
        AccessFlags.ABSTRACT.isSet(method.accessFlags) &&
            method.returnType == "V" &&
            method.parameterTypes.map { it.toString() } == listOf(FRAGMENT_ACTIVITY_TYPE)
    }

    // The title can be a string resource id or a raw text. Find the raw text title class,
    // the subclass of the title class with a constructor that takes a String.
    val rawTitleClass = classDefBy { classDef ->
        classDef.superclass == titleType && classDef.methods.any { method ->
            method.name == "<init>" && method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;")
        }
    }

    mutableClassDefBy(EXTENSION_MENU_ITEM_CLASS).apply {
        // 1. Extend the TIDAL menu item class.
        setSuperClass(menuItemClass.type)

        // 2. Replace super() with the TIDAL menu item constructor.
        // The parameter registers p0 to p8 are "this" and the first 8 parameters of the
        // RymMenuItem constructor, which are passed as they are.
        // The title and content metadata parameters are declared as Object in Java,
        // so they are cast to their TIDAL types first.
        methods.single { it.name == "<init>" }.apply {
            val superCallIndex = instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.INVOKE_DIRECT &&
                    instruction.getReference<MethodReference>()?.let { reference ->
                        reference.definingClass == "Ljava/lang/Object;" && reference.name == "<init>"
                    } == true
            }
            if (superCallIndex < 0) throw PatchException("Could not find the super() call of RymMenuItem")

            removeInstruction(superCallIndex)
            addInstructions(
                superCallIndex,
                """
                    check-cast p1, $titleType
                    check-cast p4, $contentMetadataType
                    invoke-direct/range { p0 .. p8 }, $menuItemConstructorSmali
                """
            )
        }

        // 3. Add the click method, which calls onClick(Activity).
        methods.add(
            ImmutableMethod(
                type,
                clickMethod.name,
                listOf(ImmutableMethodParameter(FRAGMENT_ACTIVITY_TYPE, null, null)),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                null,
                null,
                MutableMethodImplementation(2) // p0 (this) and p1 (the activity).
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        invoke-virtual { p0, p1 }, $type->onClick(Landroid/app/Activity;)V
                        return-void
                    """
                )
            }
        )
    }

    // 4. Implement the extension methods that use obfuscated classes and resource ids.
    mutableClassDefBy(EXTENSION_TIDAL_OBJECTS_CLASS).apply {
        // Registers: v0 for the new object, p0 (v1) for the text.
        replaceMethod(
            "createTitle",
            2,
            """
                new-instance v0, ${rawTitleClass.type}
                invoke-direct { v0, p0 }, ${rawTitleClass.type}-><init>(Ljava/lang/String;)V
                return-object v0
            """
        )

        // Registers: v0 for the new object, p0 (v1) and p1 (v2) for the content type and id.
        replaceMethod(
            "createContentMetadata",
            3,
            """
                new-instance v0, $contentMetadataType
                invoke-direct { v0, p0, p1 }, $contentMetadataType-><init>(Ljava/lang/String;Ljava/lang/String;)V
                return-object v0
            """
        )

        methods.single { it.name == "getIconResId" }.returnEarly(
            resourceId(ResourceType.DRAWABLE, "ic_external_link").toInt()
        )

        methods.single { it.name == "getColorResId" }.returnEarly(
            resourceId(ResourceType.COLOR, "context_menu_default_color").toInt()
        )
    }
}

/**
 * Replaces a method with a new method with the same signature, a number of registers and code.
 *
 * Code cannot be added to the original method, because its number of registers was chosen by the
 * compiler, which can reuse parameter registers. For example, `return null` in a method with one
 * parameter can be compiled to `const/4 p0, 0x0`, so the method has a single register and
 * v0 and p0 are the same register.
 *
 * @param registerCount The number of registers, including the parameter registers,
 * which are the last registers of the method.
 */
private fun MutableClass.replaceMethod(name: String, registerCount: Int, smali: String) {
    val original = methods.single { it.name == name }

    methods.remove(original)
    methods.add(
        ImmutableMethod(
            type,
            original.name,
            original.parameters,
            original.returnType,
            original.accessFlags,
            null,
            null,
            MutableMethodImplementation(registerCount)
        ).toMutable().apply {
            addInstructions(0, smali)
        }
    )
}

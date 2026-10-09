package app.aidan.patches.adobescan.customization

import app.aidan.patches.adobescan.shared.COMPATIBILITY_ADOBE_SCAN
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SETTINGS_FRAGMENT = "Ljt/v2;"

private const val FILE_OPTIONS_MENU_HELPER = "Lqt/u;"
private const val FILE_LIST_TOOLS = "Lut/p0;"
private const val FILE_LIST_TOOLS_ACTIONS = "Lut/r0;"
private const val PREVIEW_BOTTOM_TOOLBAR = "Lvt/b2;"
private const val PREVIEW_TOOLBAR_ITEMS = "Lvt/r4;"

private const val RES_FILL_AND_SIGN = 0x7f142619
private const val RES_OPEN_IN_ACROBAT = 0x7f142617
private const val RES_ABOUT = 0x7f141f71
private const val RES_FORUM = 0x7f141f72
private const val RES_HELP = 0x7f141f73
private const val RES_RATE_APP = 0x7f141f78
private const val RES_SHARE_APP = 0x7f141f79

@Suppress("unused")
val removeUselessPromotionalItemsPatch = bytecodePatch(
    name = "Remove Useless/Promotional Items",
    description = "Removes promotional, feedback, and support items from Settings and file menus.",
    default = false
) {
    category("Interface")
    compatibleWith(COMPATIBILITY_ADOBE_SCAN)

    val removeAbout = booleanOption(
        key = "removeAbout",
        default = true,
        title = "About Adobe Scan",
        description = "Removes the About Adobe Scan item from the Settings menu."
    )

    val removeHelp = booleanOption(
        key = "removeHelp",
        default = true,
        title = "Help",
        description = "Removes the Help item from the Settings menu."
    )

    val removeRateApp = booleanOption(
        key = "removeRateApp",
        default = true,
        title = "Rate App",
        description = "Removes the Rate app item from the Settings menu."
    )

    val removeSupportForum = booleanOption(
        key = "removeSupportForum",
        default = true,
        title = "Online Support Forum",
        description = "Removes the Online support forum item from the Settings menu."
    )

    val removeShareApp = booleanOption(
        key = "removeShareApp",
        default = true,
        title = "Share This App",
        description = "Removes the Share this app item from the Settings menu."
    )
    val removeFillAndSign = booleanOption(
        key = "removeFillAndSign",
        default = true,
        title = "Fill & Sign",
        description = "Removes the Fill & Sign item from the File Options bottom sheet."
    )
    val removeOpenInAcrobat = booleanOption(
        key = "removeOpenInAcrobat",
        default = false,
        title = "Open in Adobe Acrobat",
        description = "Removes the Open in Adobe Acrobat option from file option menus and the preview screen."
    )


    execute {
        val selectedResourceIds = buildList {
            if (removeAbout.value != false) add(RES_ABOUT)
            if (removeHelp.value != false) add(RES_HELP)
            if (removeRateApp.value != false) add(RES_RATE_APP)
            if (removeSupportForum.value != false) add(RES_FORUM)
            if (removeShareApp.value != false) add(RES_SHARE_APP)
        }

        val hideCategory = removeHelp.value != false &&
            removeRateApp.value != false &&
            removeSupportForum.value != false &&
            removeShareApp.value != false

        if (selectedResourceIds.isNotEmpty() || hideCategory) {
            hideSettingsPreferences(selectedResourceIds, hideCategory)
        }

        if (removeRateApp.value != false) {
            neutralizeRateAppOnCreate()
        }
        if (removeFillAndSign.value != false) {
            removeFillAndSign()
        }
        if (removeOpenInAcrobat.value == true) {
            removeOpenInAcrobat()
        }
    }
}

/**
 * Hides selected preferences and optionally the bottom PreferenceCategory (gray bar)
 * right after XML resource inflation in SettingsFragment.E.
 */
private fun BytecodePatchContext.hideSettingsPreferences(resourceIds: List<Int>, hideCategory: Boolean) {
    val settingsFragment = mutableClassDefByOrNull(SETTINGS_FRAGMENT)
        ?: throw PatchException("SettingsFragment not found")
    val preferenceLoader = settingsFragment.methods.singleOrNull {
        it.name == "E" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("SettingsFragment preference loader not found")
    val instructions = preferenceLoader.implementation?.instructions
        ?: throw PatchException("SettingsFragment preference loader has no implementation")
    val loadIndex = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            reference?.definingClass == "Landroidx/preference/b;" &&
            reference.name == "F" &&
            reference.parameterTypes.map(CharSequence::toString) == listOf("I", "Ljava/lang/String;") &&
            reference.returnType == "V"
    }
    if (loadIndex < 0) {
        throw PatchException("SettingsFragment XML loader invocation not found")
    }

    val individualItemsSmali = resourceIds.joinToString("\n") { resId ->
        """
        const v0, 0x${resId.toString(16)}
        invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;
        move-result-object v0
        invoke-virtual {p0, v0}, Landroidx/preference/b;->o(Ljava/lang/String;)Landroidx/preference/Preference;
        move-result-object v0
        const/4 v1, 0x0
        invoke-virtual {v0, v1}, Landroidx/preference/Preference;->C(Z)V
        """.trimIndent()
    }

    val categorySmali = if (hideCategory) {
        """
        const v0, 0x7f141f73
        invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;
        move-result-object v0
        invoke-virtual {p0, v0}, Landroidx/preference/b;->o(Ljava/lang/String;)Landroidx/preference/Preference;
        move-result-object v0
        iget-object v0, v0, Landroidx/preference/Preference;->J:Landroidx/preference/PreferenceGroup;
        const/4 v1, 0x0
        invoke-virtual {v0, v1}, Landroidx/preference/Preference;->C(Z)V
        """.trimIndent()
    } else {
        ""
    }

    val combinedSmali = listOf(individualItemsSmali, categorySmali)
        .filter { it.isNotBlank() }
        .joinToString("\n")

    preferenceLoader.addInstructions(loadIndex + 1, combinedSmali)
}

/**
 * Ensures Rate app remains hidden even if SettingsFragment.onCreate attempts to make it visible
 * based on Google Play Services availability checks.
 */
private fun BytecodePatchContext.neutralizeRateAppOnCreate() {
    val settingsFragment = mutableClassDefByOrNull(SETTINGS_FRAGMENT)
        ?: throw PatchException("SettingsFragment not found")
    val onCreateMethod = settingsFragment.methods.singleOrNull {
        it.name == "onCreate" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;") &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("SettingsFragment.onCreate not found")
    val instructions = onCreateMethod.implementation?.instructions
        ?: throw PatchException("SettingsFragment.onCreate has no implementation")

    val lastCIndex = instructions.indexOfLast { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            reference?.definingClass == "Landroidx/preference/Preference;" &&
            reference.name == "C" &&
            reference.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
            reference.returnType == "V"
    }
    if (lastCIndex < 0) {
        throw PatchException("SettingsFragment.onCreate Rate app C(Z) invocation not found")
    }

    onCreateMethod.addInstructions(
        lastCIndex + 1,
        """
        const/4 p1, 0x0
        invoke-virtual {v0, p1}, Landroidx/preference/Preference;->C(Z)V
        """.trimIndent()
    )
}

/**
 * Neutralizes the Fill & Sign item in File Options bottom sheet.
 * Fill & Sign opens the Play Store when the external Adobe Fill & Sign app is not installed.
 */
private fun BytecodePatchContext.removeFillAndSign() {
    val fileOptionsClass = mutableClassDefByOrNull(FILE_OPTIONS_MENU_HELPER)
        ?: throw PatchException("FileOptionsMenuBottomSheet class $FILE_OPTIONS_MENU_HELPER not found")
    val optionsMethod = fileOptionsClass.methods.singleOrNull {
        it.name == "a" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lqt/a;", "Lfu/b;", "Ljava/util/List;") &&
            it.returnType == "Lm90/b;" &&
            it.implementation != null
    } ?: throw PatchException("FileOptionsMenuBottomSheet options method not found")

    val instructions = optionsMethod.implementation?.instructions
        ?: throw PatchException("FileOptionsMenuBottomSheet options method has no implementation")

    // Find the literal loading RES_FILL_AND_SIGN (0x7f142619)
    val fillSignStringIndex = instructions.indexOfFirst {
        it is NarrowLiteralInstruction && it.narrowLiteral == RES_FILL_AND_SIGN
    }
    if (fillSignStringIndex < 0) {
        throw PatchException("Could not find Fill & Sign resource id in FileOptionsMenuBottomSheet")
    }

    // Walk backwards to find the nearest IF_EQZ guarding the creation of the menu item
    val ifEqzIdx = (fillSignStringIndex - 1 downTo maxOf(0, fillSignStringIndex - 10)).firstOrNull {
        instructions[it].opcode == Opcode.IF_EQZ
    } ?: throw PatchException("Could not find IF_EQZ guard for Fill & Sign")

    // The instruction right before IF_EQZ is MOVE_RESULT
    val moveResult = instructions[ifEqzIdx - 1] as? OneRegisterInstruction
        ?: throw PatchException("Could not find MOVE_RESULT for Fill & Sign guard")
    if (moveResult.opcode == Opcode.CONST_4) {
        return
    }
    if (moveResult.opcode != Opcode.MOVE_RESULT) {
        throw PatchException("Expected MOVE_RESULT before IF_EQZ guard for Fill & Sign, found ${moveResult.opcode}")
    }

    optionsMethod.addInstructions(ifEqzIdx, "const/4 v${moveResult.registerA}, 0x0")
}

/**
 * Neutralizes the Open in Adobe Acrobat option in File Options bottom sheet,
 * Preview bottom toolbar, and Recent scan card actions.
 */
private fun BytecodePatchContext.removeOpenInAcrobat() {
    val fileOptionsClass = mutableClassDefByOrNull(FILE_OPTIONS_MENU_HELPER)
        ?: throw PatchException("FileOptionsMenuBottomSheet class $FILE_OPTIONS_MENU_HELPER not found")
    val optionsMethod = fileOptionsClass.methods.singleOrNull {
        it.name == "a" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lqt/a;", "Lfu/b;", "Ljava/util/List;") &&
            it.returnType == "Lm90/b;" &&
            it.implementation != null
    } ?: throw PatchException("FileOptionsMenuBottomSheet options method not found")

    val instructions = optionsMethod.implementation?.instructions
        ?: throw PatchException("FileOptionsMenuBottomSheet options method has no implementation")

    val acrobatStringIndex = instructions.indexOfFirst {
        it is NarrowLiteralInstruction && it.narrowLiteral == RES_OPEN_IN_ACROBAT
    }
    if (acrobatStringIndex < 0) {
        throw PatchException("Could not find Open in Acrobat resource id in FileOptionsMenuBottomSheet")
    }

    val addIndex = (acrobatStringIndex + 1..minOf(instructions.size - 1, acrobatStringIndex + 10)).firstOrNull { idx ->
        val ref = (instructions[idx] as? ReferenceInstruction)?.reference as? MethodReference
        instructions[idx].opcode == Opcode.INVOKE_VIRTUAL &&
            ref?.definingClass == "Lm90/b;" &&
            ref.name == "add"
    } ?: throw PatchException("Could not find Lm90/b;->add for Open in Acrobat")

    optionsMethod.replaceInstruction(addIndex, "nop")

    val toolbarClass = mutableClassDefByOrNull(PREVIEW_BOTTOM_TOOLBAR)
        ?: throw PatchException("PreviewBottomToolbar class $PREVIEW_BOTTOM_TOOLBAR not found")
    val toolbarMethod = toolbarClass.methods.firstOrNull {
        it.name == "a" &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("PreviewBottomToolbar method not found")

    val tbInstructions = toolbarMethod.implementation?.instructions
        ?: throw PatchException("PreviewBottomToolbar method has no implementation")

    val acrobatSgetIndex = tbInstructions.indexOfFirst { inst ->
        val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference
        inst.opcode == Opcode.SGET_OBJECT &&
            ref?.definingClass == PREVIEW_TOOLBAR_ITEMS &&
            ref.name == "e"
    }
    if (acrobatSgetIndex < 0) {
        throw PatchException("Could not find r4.e reference in PreviewBottomToolbar")
    }

    val arrayIndex = (acrobatSgetIndex + 1..minOf(tbInstructions.size - 1, acrobatSgetIndex + 100)).firstOrNull { idx ->
        val inst = tbInstructions[idx]
        inst.opcode == Opcode.FILLED_NEW_ARRAY &&
            (inst as? ReferenceInstruction)?.reference?.toString() == "[Lod/kl;"
    } ?: throw PatchException("Could not find filled-new-array for PreviewBottomToolbar")

    val filledArrayInst = tbInstructions[arrayIndex] as? FiveRegisterInstruction
        ?: throw PatchException("Expected FiveRegisterInstruction for filled-new-array in PreviewBottomToolbar")
    val acrobatReg = filledArrayInst.registerF

    toolbarMethod.addInstructions(arrayIndex, "const/16 v$acrobatReg, 0x0")

    val toolsClass = mutableClassDefByOrNull(FILE_LIST_TOOLS_ACTIONS)
        ?: throw PatchException("FileListTools actions class $FILE_LIST_TOOLS_ACTIONS not found")
    val initMethod = toolsClass.methods.firstOrNull {
        it.name == "<init>" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lod/ll;", "Lod/ll;") &&
            it.implementation != null
    } ?: throw PatchException("FileListTools actions constructor not found")

    val initInstructions = initMethod.implementation?.instructions
        ?: throw PatchException("FileListTools actions constructor has no implementation")

    val acrobatSgetIndexInInit = initInstructions.indexOfFirst { inst ->
        val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference
        inst.opcode == Opcode.SGET_OBJECT &&
            ref?.definingClass == FILE_LIST_TOOLS &&
            ref.name == "c"
    }
    if (acrobatSgetIndexInInit >= 0) {
        val filledArrayIdxInInit = (acrobatSgetIndexInInit + 1..minOf(initInstructions.size - 1, acrobatSgetIndexInInit + 5)).firstOrNull {
            initInstructions[it].opcode == Opcode.FILLED_NEW_ARRAY
        }
        if (filledArrayIdxInInit != null) {
            val filledInst = initInstructions[filledArrayIdxInInit] as? FiveRegisterInstruction
            if (filledInst != null) {
                initMethod.replaceInstruction(
                    filledArrayIdxInInit,
                    "filled-new-array {v${filledInst.registerC}, v${filledInst.registerE}}, [Lod/ll;"
                )
            }
        }
    }
}


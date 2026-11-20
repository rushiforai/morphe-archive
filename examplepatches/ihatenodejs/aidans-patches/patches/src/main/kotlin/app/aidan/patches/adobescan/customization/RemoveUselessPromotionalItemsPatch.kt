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

private const val FILE_LIST_TOOLS_ACTIONS_B = "Lut/r0${'$'}b;"
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
    description = "Removes promotional, feedback, and broken cloud items from Settings and file menus.",
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
        description = "Removes the Fill & Sign item from file option menus and Recent scan cards."
    )

    val removeOpenInAcrobat = booleanOption(
        key = "removeOpenInAcrobat",
        default = false,
        title = "Open in Adobe Acrobat",
        description = "Removes the Open in Adobe Acrobat option from file option menus, the preview screen, and Recent scan cards."
    )

    val removeGenerativeSummary = booleanOption(
        key = "removeGenerativeSummary",
        default = true,
        title = "Generative Summary",
        description = "Removes Generative summary actions from the File Options bottom sheet."
    )

    val removeEditText = booleanOption(
        key = "removeEditText",
        default = true,
        title = "Edit Text",
        description = "Removes Edit text from file option menus, the preview bottom toolbar, and scan cards."
    )

    val removeMove = booleanOption(
        key = "removeMove",
        default = true,
        title = "Move",
        description = "Removes Move file from file option menus across all surfaces."
    )

    val removeCompressPdf = booleanOption(
        key = "removeCompressPdf",
        default = true,
        title = "Compress PDF",
        description = "Removes Compress PDF from file option menus and Send compressed from the Share sheet. Automatically skipped if Local PDF Compression is enabled."
    )

    execute {
        val selectedResourceIds = buildList {
            if (removeAbout.value != false) add(RES_ABOUT)
            if (removeHelp.value != false) add(RES_HELP)
            if (removeRateApp.value != false) add(RES_RATE_APP)
            if (removeSupportForum.value != false) add(RES_FORUM)
            if (removeShareApp.value != false) add(RES_SHARE_APP)
        }

        if (selectedResourceIds.isNotEmpty()) {
            hideSettingsPreferences(selectedResourceIds)
        }

        if (removeRateApp.value != false) {
            neutralizeRateAppOnCreate()
        }
        if (removeFillAndSign.value != false) {
            removeFillAndSign()
        }
        if (removeOpenInAcrobat.value != false) {
            removeOpenInAcrobat()
        }
        if (removeGenerativeSummary.value != false) {
            removeGenerativeSummary()
        }
        if (removeEditText.value != false) {
            removeEditText()
        }
        if (removeMove.value != false) {
            removeMove()
        }
    }

    finalize {
        if (removeCompressPdf.value != false) {
            removeCompressPdf()
        }
    }
}

/**
 * Hides selected preferences right after XML resource inflation in SettingsFragment.E.
 * Uses straight-line bytecode without labels to avoid Dexlib2 branch offset miscalculations.
 */
private fun BytecodePatchContext.hideSettingsPreferences(resourceIds: List<Int>) {
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
        throw PatchException("Could not find setPreferencesFromResource call in SettingsFragment")
    }

    val hidePreferencesSmali = resourceIds.joinToString("\n") { resourceId ->
        """
        const v0, $resourceId
        invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;
        move-result-object v0
        invoke-virtual {p0, v0}, Landroidx/preference/b;->o(Ljava/lang/String;)Landroidx/preference/Preference;
        move-result-object v0
        const/4 p1, 0x0
        invoke-virtual {v0, p1}, Landroidx/preference/Preference;->C(Z)V
        """.trimIndent()
    }

    preferenceLoader.addInstructions(loadIndex + 1, hidePreferencesSmali)
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

    val rateAppStringIndex = instructions.indexOfFirst { instruction ->
        val narrow = instruction as? NarrowLiteralInstruction
        narrow?.narrowLiteral == RES_RATE_APP
    }
    if (rateAppStringIndex < 0) {
        throw PatchException("Could not find R.string.rate_adobe_scan reference in SettingsFragment.onCreate")
    }

    val setVisibleIndex = (rateAppStringIndex + 1..minOf(instructions.size - 1, rateAppStringIndex + 15)).firstOrNull { idx ->
        val instruction = instructions[idx]
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            reference?.definingClass == "Landroidx/preference/Preference;" &&
            reference.name == "C" &&
            reference.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
            reference.returnType == "V"
    } ?: throw PatchException("Could not find Preference.setVisible call for Rate app in SettingsFragment.onCreate")

    onCreateMethod.replaceInstruction(setVisibleIndex, "nop")
}

/**
 * Neutralizes the Fill & Sign item in File Options bottom sheet and Recent scan card actions.
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

    val fillAndSignIndex = instructions.indexOfFirst {
        it is NarrowLiteralInstruction && it.narrowLiteral == RES_FILL_AND_SIGN
    }
    if (fillAndSignIndex < 0) {
        throw PatchException("Could not find Fill & Sign resource id in FileOptionsMenuBottomSheet")
    }

    val addIndex = (fillAndSignIndex + 1..minOf(instructions.size - 1, fillAndSignIndex + 15)).firstOrNull { idx ->
        val ref = (instructions[idx] as? ReferenceInstruction)?.reference as? MethodReference
        instructions[idx].opcode == Opcode.INVOKE_VIRTUAL &&
            ref?.name == "add"
    } ?: throw PatchException("Could not find add instruction for Fill & Sign")

    optionsMethod.replaceInstruction(addIndex, "nop")

    val bClass = mutableClassDefByOrNull(FILE_LIST_TOOLS_ACTIONS_B)
        ?: throw PatchException("FileListTools actions subclass B not found")
    val clinitMethod = bClass.methods.firstOrNull {
        it.name == "<clinit>" && it.implementation != null
    } ?: throw PatchException("FileListTools actions subclass B <clinit> not found")

    val clinitInstructions = clinitMethod.implementation?.instructions
        ?: throw PatchException("FileListTools actions subclass B <clinit> has no implementation")

    val fillSignSgetIndex = clinitInstructions.indexOfFirst { inst ->
        val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference
        inst.opcode == Opcode.SGET_OBJECT &&
            ref?.definingClass == FILE_LIST_TOOLS &&
            ref.name == "f"
    }
    if (fillSignSgetIndex >= 0) {
        val sgetInst = clinitInstructions[fillSignSgetIndex] as? OneRegisterInstruction
            ?: throw PatchException("Expected OneRegisterInstruction for FileListTools.f sget-object")

        clinitMethod.replaceInstruction(
            fillSignSgetIndex,
            "sget-object v${sgetInst.registerA}, $FILE_LIST_TOOLS->h:Lod/ll;"
        )
    }
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
        throw PatchException("Could not find Open in Adobe Acrobat resource id in FileOptionsMenuBottomSheet")
    }

    val addIndex = (acrobatStringIndex + 1..minOf(instructions.size - 1, acrobatStringIndex + 15)).firstOrNull { idx ->
        val ref = (instructions[idx] as? ReferenceInstruction)?.reference as? MethodReference
        instructions[idx].opcode == Opcode.INVOKE_VIRTUAL &&
            ref?.name == "add"
    } ?: throw PatchException("Could not find add instruction for Open in Adobe Acrobat")

    optionsMethod.replaceInstruction(addIndex, "nop")

    val previewToolbarClass = mutableClassDefByOrNull(PREVIEW_BOTTOM_TOOLBAR)
        ?: throw PatchException("Preview bottom toolbar class $PREVIEW_BOTTOM_TOOLBAR not found")
    val toolbarMethod = previewToolbarClass.methods.firstOrNull {
        it.name == "a" &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("Preview bottom toolbar method not found")

    val tbInstructions = toolbarMethod.implementation?.instructions
        ?: throw PatchException("Preview bottom toolbar method has no implementation")

    val acrobatSgetIndex = tbInstructions.indexOfFirst { inst ->
        val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference
        inst.opcode == Opcode.SGET_OBJECT &&
            ref?.definingClass == PREVIEW_TOOLBAR_ITEMS &&
            ref.name == "e"
    }
    if (acrobatSgetIndex < 0) {
        throw PatchException("Could not find r4.e reference in Preview bottom toolbar")
    }

    val arrayIndex = (acrobatSgetIndex + 1..minOf(tbInstructions.size - 1, acrobatSgetIndex + 100)).firstOrNull { idx ->
        val inst = tbInstructions[idx]
        inst.opcode == Opcode.FILLED_NEW_ARRAY &&
            (inst as? ReferenceInstruction)?.reference?.toString() == "[Lod/kl;"
    } ?: throw PatchException("Could not find filled-new-array for Preview bottom toolbar")

    val filledArrayInst = tbInstructions[arrayIndex] as? FiveRegisterInstruction
        ?: throw PatchException("Expected FiveRegisterInstruction for filled-new-array in Preview bottom toolbar")
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
            if (filledInst != null && filledInst.registerCount == 3) {
                initMethod.replaceInstruction(
                    filledArrayIdxInInit,
                    "filled-new-array {v${filledInst.registerC}, v${filledInst.registerE}}, [Lod/ll;"
                )
            }
        }
    }
}

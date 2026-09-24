package app.lchanc3.patches.jptt.settings

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_SETTINGS_TAB_CLASS
import app.lchanc3.patches.jptt.shared.Constants.SETTINGS_PAGER_ADAPTER_CLASS
import app.lchanc3.patches.jptt.shared.extensionHookPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val TITLES_FIELD = "titles"

@Suppress("unused")
val patchSettingsPatch = bytecodePatch(
    name = "Patch settings",
    description = "Adds a tab to JPTT's own settings where the options these patches " +
        "add can be changed without patching the app again, and where every setting " +
        "can be exported to a file and read back.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    dependsOn(extensionHookPatch)

    execute {
        addTabToTitles()
        answerTheEmptyTab()
    }
}

/**
 * The adapter takes its tab count, each tab's title and the size of its fragment
 * cache from one array, so lengthening that array as it is stored is the whole
 * of adding a tab.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.addTabToTitles() {
    val method = SettingsPagerAdapterClinitFingerprint.method
    val instructions = method.implementation?.instructions
        ?: throw PatchException("$SETTINGS_PAGER_ADAPTER_CLASS has no static initialiser.")

    val storeIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.SPUT_OBJECT &&
            ((instruction as ReferenceInstruction).reference as FieldReference).name == TITLES_FIELD
    }
    if (storeIndex < 0) {
        throw PatchException(
            "$SETTINGS_PAGER_ADAPTER_CLASS->$TITLES_FIELD is not assigned in <clinit>. " +
                "JPTT's settings tabs are built differently now.",
        )
    }

    // registerA of an sput holds the value being stored: the finished array.
    val register = (instructions[storeIndex] as OneRegisterInstruction).registerA
    method.addInstructions(
        storeIndex,
        """
            invoke-static { v$register }, $EXTENSION_SETTINGS_TAB_CLASS->withExtraTab([Ljava/lang/String;)[Ljava/lang/String;
            move-result-object v$register
        """,
    )
}

/**
 * getItem()'s switch has a case per tab and falls through to returning null for
 * anything else, which is where the new tab's position lands. Ask the extension
 * there instead; it answers null for every position but its own, so the branch
 * keeps doing what it did.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.answerTheEmptyTab() {
    val method = SettingsPagerAdapterGetItemFingerprint.method
    val instructions = method.implementation?.instructions
        ?: throw PatchException("$SETTINGS_PAGER_ADAPTER_CLASS->getItem() has no body.")

    val switchIndex = instructions.indexOfFirst {
        it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH
    }
    if (switchIndex < 0) {
        throw PatchException("$SETTINGS_PAGER_ADAPTER_CLASS->getItem() is no longer a switch.")
    }

    // The switch is followed by its default branch, which loads null and returns.
    val constant = instructions.elementAtOrNull(switchIndex + 1)
    val returns = instructions.elementAtOrNull(switchIndex + 2)
    val loadsNull = constant?.opcode == Opcode.CONST_4 &&
        (constant as WideLiteralInstruction).wideLiteral == 0L
    if (!loadsNull || returns?.opcode != Opcode.RETURN_OBJECT) {
        throw PatchException(
            "$SETTINGS_PAGER_ADAPTER_CLASS->getItem() does not return null for an " +
                "unknown tab any more, so there is nowhere to add one.",
        )
    }

    val register = (constant as OneRegisterInstruction).registerA
    method.removeInstructions(switchIndex + 1, 2)
    method.addInstructions(
        switchIndex + 1,
        """
            invoke-static { p1 }, $EXTENSION_SETTINGS_TAB_CLASS->fragment(I)Landroidx/fragment/app/Fragment;
            move-result-object v$register
            return-object v$register
        """,
    )
}

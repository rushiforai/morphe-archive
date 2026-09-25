package app.lchanc3.patches.jptt.search

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_SEARCH_HISTORY_ACTIONS_CLASS
import app.lchanc3.patches.jptt.shared.Constants.MAIN_ACTIVITY_CLASS
import app.lchanc3.patches.jptt.shared.extensionHookPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val FAVORITE_ITEM_TYPE = "Lcom/joshua/jptt/FavoriteListFragment\$FavoriteItem;"
private const val TEXT_VIEW_TYPE = "Landroid/widget/TextView;"

@Suppress("unused")
val searchHistoryActionsPatch = bytecodePatch(
    name = "Search history actions",
    description = "Long press a recent search keyword in the article search dialog to " +
        "delete it, clear the history, or add a home screen shortcut that opens the " +
        "board with that search. Shortcuts made from the 最近搜尋 tab open the search too.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    dependsOn(extensionHookPatch)

    execute {
        val method = AddSearchHistoryListToLayoutFingerprint.method
        val instructions = method.instructions.toList()

        fun checkCastTo(type: String) = instructions.withIndex().singleOrNull { (_, instruction) ->
            instruction.opcode == Opcode.CHECK_CAST &&
                ((instruction as ReferenceInstruction).reference as TypeReference).type == type
        } ?: throw PatchException(
            "Expected one check-cast to $type in addSearchHistoryListToLayout; " +
                "JPTT's search dialog has changed.",
        )

        // In the loop: the history entry is taken out of the list and cast, then
        // its button is inflated and cast. Right after the second cast both are in
        // registers -- the entry's register is reused for the button's background a
        // few instructions later, so this is the one place both are at hand.
        val (itemIndex, itemCast) = checkCastTo(FAVORITE_ITEM_TYPE)
        val (buttonIndex, buttonCast) = checkCastTo(TEXT_VIEW_TYPE)
        if (buttonIndex < itemIndex) {
            throw PatchException("The keyword button is created before its history entry is read.")
        }
        val itemRegister = (itemCast as OneRegisterInstruction).registerA
        val buttonRegister = (buttonCast as OneRegisterInstruction).registerA

        method.addInstructions(
            buttonIndex + 1,
            """
                invoke-static { v$buttonRegister, v$itemRegister }, $EXTENSION_SEARCH_HISTORY_ACTIONS_CLASS->addActions(${TEXT_VIEW_TYPE}Ljava/lang/Object;)V
            """,
        )

        // A search shortcut carries its keyword as an extra of its own; pass it on
        // to MainActivity as the wKeyword it already opens the widget's board with.
        StartMainActivityFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p1 }, $EXTENSION_SEARCH_HISTORY_ACTIONS_CLASS->passSearchKeyword(Landroid/content/Context;Landroid/os/Bundle;)V
            """,
        )

        // The history tab's 在啟動器建立捷徑 looks the row up, takes its board name
        // and hands that to JPTT's shortcut dialog. Hand the extension the row
        // itself instead, so a search history row gets a shortcut that opens its
        // search: drop the read of the name and keep the row in the register the
        // name would have gone to.
        //
        // No register beyond the ones the call already uses is touched. That
        // matters, because the method has none to spare: 3.8.5 compiles the
        // context into the register that held `this`.
        val clickMethod = HistoryOptionClickFingerprint.method
        val callIndex = clickMethod.instructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_STATIC &&
                reference?.definingClass == MAIN_ACTIVITY_CLASS &&
                reference.name == "showBuildShortcutOnLauncherDialog"
        }
        if (callIndex < 0) {
            throw PatchException("The history menu no longer calls showBuildShortcutOnLauncherDialog.")
        }
        val call = clickMethod.getInstruction<FiveRegisterInstruction>(callIndex)
        val (context, site, board) = Triple(call.registerC, call.registerD, call.registerE)

        val titleIndex = (callIndex - 1 downTo 0).firstOrNull { index ->
            val instruction = clickMethod.getInstruction(index)
            val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.IGET_OBJECT &&
                reference?.definingClass == FAVORITE_ITEM_TYPE &&
                reference.name == "title"
        } ?: throw PatchException("The history menu no longer reads the row's title for its shortcut.")
        val titleRead = clickMethod.getInstruction<TwoRegisterInstruction>(titleIndex)
        if (titleRead.registerA != board) {
            throw PatchException("The row's title is not what the history menu makes its shortcut for.")
        }
        // Between the read and the call, the register must not be written again.
        for (index in titleIndex + 1 until callIndex) {
            val instruction = clickMethod.getInstruction(index)
            if (instruction is OneRegisterInstruction && instruction.registerA == board &&
                instruction.opcode.setsRegister()
            ) {
                throw PatchException("The history menu reuses the title's register before the call.")
            }
        }
        if (listOf(context, site, board, titleRead.registerB).any { it > 15 }) {
            throw PatchException("The history menu's registers are out of reach of a plain move.")
        }

        // Replace the call first, so the title read's index is unaffected.
        clickMethod.removeInstruction(callIndex)
        clickMethod.addInstructions(
            callIndex,
            """
                invoke-static { v$context, v$site, v$board }, $EXTENSION_SEARCH_HISTORY_ACTIONS_CLASS->buildShortcut(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V
            """,
        )
        clickMethod.removeInstruction(titleIndex)
        clickMethod.addInstructions(
            titleIndex,
            """
                move-object v$board, v${titleRead.registerB}
            """,
        )
    }
}

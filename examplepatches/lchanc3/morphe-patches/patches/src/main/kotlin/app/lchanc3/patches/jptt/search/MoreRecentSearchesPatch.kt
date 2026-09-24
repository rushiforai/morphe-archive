package app.lchanc3.patches.jptt.search

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.Constants.DB_HELPER_CLASS
import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_PATCH_SETTINGS_CLASS
import app.lchanc3.patches.jptt.shared.JpttApplicationOnCreateFingerprint
import app.lchanc3.patches.jptt.shared.requireFreeLocals
import app.lchanc3.patches.jptt.shared.extensionHookPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intSliderOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val moreRecentSearchesPatch = bytecodePatch(
    name = "More recent searches",
    description = "Shows more of your recent search keywords in the article search dialog.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    dependsOn(extensionHookPatch)

    val boardKeywordCount by intSliderOption(
        key = "boardKeywordCount",
        min = 1,
        max = 50,
        default = 15,
        title = "最近看板搜尋 entries",
        description = "Starting value, changeable in the app afterwards. Recent " +
            "keywords used on the board you are currently in. JPTT shows 5 of them.",
    )

    val allKeywordCount by intSliderOption(
        key = "allKeywordCount",
        min = 1,
        max = 100,
        default = 30,
        title = "最近搜尋 entries",
        description = "Starting value, changeable in the app afterwards. Recent " +
            "keywords used on any board. JPTT shows 15 of them.",
    )

    execute {
        val method = ShowSearchDialogFingerprint.method

        // The two calls, in source order: first the board specific history, then
        // the history across all boards.
        val callIndices = method.instructions.withIndex().filter { (_, instruction) ->
            if (instruction.opcode != Opcode.INVOKE_STATIC) return@filter false

            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference != null &&
                reference.definingClass == DB_HELPER_CLASS &&
                reference.name == "getBoardHistory" &&
                reference.parameterTypes.size == 5
        }.map { it.index }

        // The options are now only defaults; the counts themselves come from the
        // settings page, read each time the dialog is opened.
        requireFreeLocals(JpttApplicationOnCreateFingerprint.method, 2)
        JpttApplicationOnCreateFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, $boardKeywordCount
                const/16 v1, $allKeywordCount
                invoke-static { v0, v1 }, $EXTENSION_PATCH_SETTINGS_CLASS->registerRecentSearches(II)V
            """,
        )

        val counts = listOf("boardKeywordCount", "allKeywordCount")
        if (callIndices.size != counts.size) {
            throw PatchException(
                "Expected ${counts.size} DBHelper.getBoardHistory calls in " +
                    "showSearchDialog, found ${callIndices.size}",
            )
        }

        // The row limit is the fifth argument of the call. Overwrite that register
        // right before the call instead of editing the original constant, which is
        // a const/4 in one case and a const/16 in the other.
        //
        // Walk backwards so the earlier index is still correct after the insert.
        callIndices.zip(counts).reversed().forEach { (index, getter) ->
            val limitRegister = method.getInstruction<FiveRegisterInstruction>(index).registerG

            method.addInstructions(
                index,
                """
                    invoke-static { }, $EXTENSION_PATCH_SETTINGS_CLASS->$getter()I
                    move-result v$limitRegister
                """,
            )
        }
    }
}

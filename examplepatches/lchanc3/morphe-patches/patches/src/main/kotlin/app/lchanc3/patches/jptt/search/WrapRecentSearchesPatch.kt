package app.lchanc3.patches.jptt.search

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_SEARCH_HISTORY_CLASS
import app.lchanc3.patches.jptt.shared.extensionHookPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val wrapRecentSearchesPatch = bytecodePatch(
    name = "Wrap recent searches",
    description = "Lays the recent search keywords out over several lines instead of " +
        "one line you have to scroll sideways.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    dependsOn(extensionHookPatch)

    execute {
        // p1 is the container the keywords are about to be added to. The
        // extension swaps the HorizontalScrollView around it for a vertical one
        // holding a flow layout, and hands back the container to fill instead.
        AddSearchHistoryListToLayoutFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $EXTENSION_SEARCH_HISTORY_CLASS->useFlowLayout(Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
                move-result-object p1
            """,
        )
    }
}

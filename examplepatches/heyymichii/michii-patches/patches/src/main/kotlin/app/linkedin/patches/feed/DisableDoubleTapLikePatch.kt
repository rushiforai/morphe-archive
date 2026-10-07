package app.linkedin.patches.feed

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val ACTION_LIST = "Lcom/linkedin/sdui/viewdata/action/ActionListViewData;"

/** ClickActions(onClick, onLongClick, onDoubleClick) of the server driven UI. */
private object ClickActionsFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/sdui/viewdata/action/ClickActions;",
    name = "<init>",
    parameters = listOf(ACTION_LIST, ACTION_LIST, ACTION_LIST),
)

@Suppress("unused")
val disableDoubleTapLikePatch = bytecodePatch(
    name = "Disable double-tap like",
    description = "Stops double tapping a post or photo from liking it.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isDisableDoubleTapLikeIncluded")

        // p3 is onDoubleClick. Range form because p3 can be above v15.
        ClickActionsFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p3 .. p3 }, $EXTENSION_PACKAGE/DoubleTapPatch;->filterDoubleClick(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p3
                check-cast p3, $ACTION_LIST
            """
        )
    }
}

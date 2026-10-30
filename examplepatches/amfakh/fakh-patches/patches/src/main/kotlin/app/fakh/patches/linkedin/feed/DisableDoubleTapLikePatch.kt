package app.fakh.patches.linkedin.feed

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.markIncluded
import app.fakh.patches.linkedin.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val ACTION_LIST = "Lcom/linkedin/sdui/viewdata/action/ActionListViewData;"

/**
 * ClickActions(onClick, onLongClick, onDoubleClick) of the server driven UI.
 * 4.1.1261 added a fourth parameter (onLongClickPhases), so only the first three are matched.
 */
private object ClickActionsFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/sdui/viewdata/action/ClickActions;",
    name = "<init>",
    custom = { method, _ ->
        method.parameterTypes.size >= 3 && method.parameterTypes.take(3).all { it.toString() == ACTION_LIST }
    },
)

@Suppress("unused")
val disableDoubleTapLikePatch = bytecodePatch(
    name = "Disable double-tap like",
    description = "Stops double tapping a post or photo from liking it.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feed")
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

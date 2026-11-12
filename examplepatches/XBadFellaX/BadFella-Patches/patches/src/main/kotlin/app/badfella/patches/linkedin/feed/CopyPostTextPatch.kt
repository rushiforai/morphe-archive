package app.badfella.patches.linkedin.feed

import app.badfella.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.badfella.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.badfella.patches.linkedin.shared.markIncluded
import app.badfella.patches.linkedin.shared.sduiComponentFilterPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val ACTION_LIST = "Lcom/linkedin/sdui/viewdata/action/ActionListViewData;"

/** ClickActions(onClick, onLongClick, onDoubleClick, ...) of the server driven UI. */
private object LongClickActionsFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/sdui/viewdata/action/ClickActions;",
    name = "<init>",
    custom = { method, _ ->
        method.parameterTypes.size >= 3 && method.parameterTypes.take(3).all { it.toString() == ACTION_LIST }
    },
)

@Suppress("unused")
val copyPostTextPatch = bytecodePatch(
    name = "Copy post text",
    description = "Long pressing a post's text copies all of it, including the part behind \"...more\".",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feed")
    // The filter hook passes the post text to the extension right before its ClickActions are built.
    dependsOn(sduiComponentFilterPatch)

    execute {
        markIncluded("isCopyPostTextIncluded")

        // p2 is onLongClick. Range form because p2 can be above v15.
        LongClickActionsFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p2 .. p2 }, $EXTENSION_PACKAGE/CopyPostText;->longClick(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p2
                check-cast p2, $ACTION_LIST
            """
        )
    }
}

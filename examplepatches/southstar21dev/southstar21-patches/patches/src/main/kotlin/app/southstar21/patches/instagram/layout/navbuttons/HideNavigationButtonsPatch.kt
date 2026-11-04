package app.southstar21.patches.instagram.layout.navbuttons

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.southstar21.patches.instagram.misc.extension.markPatchIncluded
import app.southstar21.patches.instagram.misc.tabs.tabListHookPatch
import app.southstar21.patches.instagram.shared.Constants.COMPATIBILITY_INSTAGRAM
import com.android.tools.smali.dexlib2.Opcode

private const val EXTENSION_CLASS =
    "Lapp/southstar21/extension/instagram/navbuttons/HideNavigationButtonsPatch;"

/**
 * The home page's action bar binds its heart button (a ToastingBadge) here: sets its icon and
 * click listener, then stores it as the view getActivityFeedView() returns.
 */
internal object BindActivityButtonFingerprint : Fingerprint(
    definingClass = "Linstagram/features/feed/mainfeed/actionbar/MainFeedActionBar;",
    returnType = "V",
    parameters = listOf("Lcom/instagram/notifications/badging/ui/component/ToastingBadge;", "L"),
)

@Suppress("unused")
val hideNavigationButtonsPatch = bytecodePatch(
    name = "Hide navigation buttons",
    description = "Adds settings to hide Search, Reels, Create, Messages and other tabs from the bottom bar.",
    default = false
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    dependsOn(tabListHookPatch)

    execute {
        BindActivityButtonFingerprint.method.apply {
            val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            addInstruction(
                returnIndex,
                "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onActivityButton(Landroid/view/View;)V"
            )
        }

        markPatchIncluded(EXTENSION_CLASS)
    }
}

package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.nav

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import com.android.tools.smali.dexlib2.AccessFlags

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/ui/nav/BottomNavigationItems;"

private const val ATTACH_METHOD = "attach(Landroid/view/View;)V"

private const val BADGES_METHOD = "badges(Landroid/view/View;)V"

private const val CLAIMED_METHOD =
    "claimed(Landroid/content/Context;Landroid/view/MenuItem;)Z"

/**
 * What the extension calls on Material's own navigation bar, each of which has to be public
 * there: the extension is not in Material's package, so a member that is not would throw the
 * first time a bar is drawn, which is every time the app opens.
 */
private val REACHED_ON_THE_BAR = mapOf(
    "the menu" to navigationBarMenuFingerprint,
    "how many items it will take" to navigationBarMaxItemsFingerprint,
    "the badge" to navigationBarBadgeFingerprint,
    "taking a badge off" to navigationBarRemoveBadgeFingerprint,
)

@Suppress("unused")
val bottomNavigationItemsPatch = bytecodePatch(
    name = "Choose what the bottom bar shows",
    description = "Lets each item on the bottom navigation bar — Posts, Actions, Explore and " +
            "Inbox — be left alone, taken off, or replaced with one of the actions from Sync's " +
            "own actions sheet, and adds one further button beside them. Covers the navigation " +
            "rail used in tablet mode as well.",
    default = true,
) {
    dependsOn(sharedExtensionPatch, bottomNavigationItemsSettingsPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        REACHED_ON_THE_BAR.forEach { (what, fingerprint: Fingerprint) ->
            if (fingerprint.method.accessFlags and AccessFlags.PUBLIC.value == 0) {
                throw PatchException("The navigation bar's $what cannot be reached from outside Material")
            }
        }

        // Called at the end, where the bar is dressed and the app has already taken off whatever
        // it did not want. Both methods hold a single return that every path reaches, so nothing
        // can branch over the call.
        listOf(bottomBarDressesItselfFingerprint, railDressesItselfFingerprint).forEach {
            it.method.apply {
                addInstruction(
                    instructions.lastIndex,
                    "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->$ATTACH_METHOD",
                )
            }
        }

        // The unread count is taken over rather than corrected afterwards. Sync draws it on the
        // inbox item by that item's id, and once the inbox can be somewhere else — chosen as the
        // action on another button, or on the added one — the id it uses is the wrong one. Every
        // path that drew it now asks the extension instead, which draws the same badge with the
        // same colours and offsets, on whichever button holds the inbox.
        //
        // Appending to these would not do: the bar being dressed, a message arriving and the bar
        // being attached all reach them, so a correction on one path is undone by the next. Going
        // in at the front and returning leaves what follows unreachable, which is the point.
        listOf(
            bottomBarDrawsTheUnreadCountFingerprint,
            railDrawsTheUnreadCountFingerprint,
        ).forEach {
            it.method.addInstructions(
                0,
                """
                invoke-static   { p0 }, $EXTENSION_CLASS_DESCRIPTOR->$BADGES_METHOD
                return-void
                """,
            )
        }

        // A tap on a button that has been given an action is carried out here and answered, so
        // that Sync's own run of comparisons never sees it. Answering yes also keeps Material
        // from drawing the button as the one selected: carrying out an action is not somewhere
        // the app has gone. Anything else falls through to Sync untouched.
        navigationTapFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                invoke-static   { p0, p2 }, $EXTENSION_CLASS_DESCRIPTOR->$CLAIMED_METHOD
                move-result     v0
                if-eqz          v0, :sync_answers_it
                const/4         v0, 0x0
                return          v0
                """,
                ExternalLabel("sync_answers_it", getInstruction(0)),
            )
        }
    }
}

package app.stayfree.patches.drawer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.stayfree.patches.settings.SCREEN_TREE_NODE
import app.stayfree.patches.settings.hideFromSettingsSearch
import app.stayfree.patches.settings.screenTreeNodeConstructor
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE

@Suppress("unused")
val removeMyFriendsPatch = bytecodePatch(
    name = "Remove My Friends",
    description = "Removes \"My Friends\" (usage sharing with friends through StayFree's " +
        "servers) from the side menu and from the settings search.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    extendWith("extensions/extension.mpe")

    execute {
        // Drawer item: return before the composable opens its restart group when asked to draw
        // USAGE_SHARING, so the entry emits nothing and the drawer's groups stay balanced (the
        // calling lambda opens and closes its own). The method is `.locals 28`, so p0 sits past
        // v15, out of reach of `if-ne`'s 4-bit operands: copy it down first. v0/v1 are
        // overwritten by the original code before being read.
        DrawerItemFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, p0
                    sget-object v1, $DRAWER_SCREEN_TYPE->USAGE_SHARING:$DRAWER_SCREEN_TYPE
                    if-ne v0, v1, :original
                    return-void
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // The search tree lists My Friends as a top-level node too.
        hideFromSettingsSearch(
            mutableClassDefBy(SCREEN_TREE_NODE).methods.screenTreeNodeConstructor(),
            "activity_my_friends",
        )
    }
}

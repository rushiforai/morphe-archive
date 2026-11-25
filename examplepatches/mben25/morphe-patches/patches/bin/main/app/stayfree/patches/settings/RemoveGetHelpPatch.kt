package app.stayfree.patches.settings

import app.morphe.patcher.patch.bytecodePatch
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE

@Suppress("unused")
val removeGetHelpPatch = bytecodePatch(
    name = "Remove Get Help",
    description = "Removes the \"Get Help\" row (HelpScout support chat) from Settings and from " +
        "the settings search.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    extendWith("extensions/extension.mpe")

    execute {
        // The third row of the Settings "More" section (after Storage and App Info).
        SettingsMoreSectionFingerprint.method.removeSettingsRow("get_help")

        // Settings > Get Help is also a (screen-less) leaf of the search tree.
        hideFromSettingsSearch(
            mutableClassDefBy(SCREEN_TREE_NODE).methods.screenTreeNodeConstructor(),
            "get_help",
        )
    }
}

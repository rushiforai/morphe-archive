package app.stayfree.patches.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE

@Suppress("unused")
val removeAppInfoContentsPatch = bytecodePatch(
    name = "Remove App Info contents",
    description = "Keeps the \"App Info\" row with the version number in Settings, but it no " +
        "longer opens the App Info screen: Debug Usage Limit Problems, Data Privacy, StayFree " +
        "Community, Support us, Credits & Open source libraries and the support App ID are gone. " +
        "They are also removed from the settings search.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    extendWith("extensions/extension.mpe")

    execute {
        // App Info row: `wt9.b(…, title = "App Info", summary = versionName, …, onClick = nn0
        // case 16, …)`. wt9.b builds its row with `clickable(enabled = onClick != null)`, and the
        // call passes onClick explicitly (default bit 0x10000 is clear in its mask), so a null
        // there gives the same row, text and version included, without ripple or navigation.
        // nn0 case 16 (→ App Info screen `ud9.g`) and case 21 (→ Debug Usage Limit Problems
        // `ee9.g`, built only on the App Info screen) are the only routes into either screen.
        val method = SettingsMoreSectionFingerprint.method
        val rowCall = method.indexOfSettingsRowCall(method.indexOfStringResource("app_info_title"))
        val onClick = method.rangeArgumentRegister(rowCall, 14)
        method.addInstruction(rowCall, "${if (onClick < 16) "const/4" else "const/16"} v$onClick, 0x0")

        // The search tree has App Info as a node whose children are the screen's rows; dropping
        // the node drops all of them (Debug Usage Limit Problems and Data Privacy included).
        hideFromSettingsSearch(
            mutableClassDefBy(SCREEN_TREE_NODE).methods.screenTreeNodeConstructor(),
            "app_info_title",
        )
    }
}

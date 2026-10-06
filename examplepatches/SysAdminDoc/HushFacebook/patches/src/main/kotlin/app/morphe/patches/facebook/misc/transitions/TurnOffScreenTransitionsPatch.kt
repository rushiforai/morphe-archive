/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.transitions

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

/**
 * Shows Facebook's tabs, its Menu and the screens that open over it without the slide between
 * them. Each moves its own way. A screen that opens over the app, like the post composer, is its
 * own activity: the settings patch already watches every Facebook screen from the application's
 * onCreate, and from those callbacks the extension's ScreenTransitions asks Android for no
 * transition once this patch says it's in the build. A tab and the Menu are Facebook's own view
 * animations, and for those the patch asks the extension where Facebook decides to slide
 * (TransitionAnchors.kt).
 *
 * Off in the default selection: Facebook's transitions are a matter of taste, not something it
 * does to you. Picked, its switch starts on.
 */
@Suppress("unused")
val turnOffScreenTransitionsPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Turn off screen transitions",
    description = "Shows Facebook's tabs, its Menu and the screens that open over it at once, without the slide " +
        "between them. Swiping and animations inside a page stay. Its switch starts on, under Appearance.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, facebookExtensionPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        // Both are found before either is changed, so a build missing one is left as it was.
        val showTab = ShowTabFingerprint.method
        val snapToPanel = SnapToPanelFingerprint.method
        showTab.quietTabSwitch()
        snapToPanel.quietPanelSnap()
        enableStatus("turnOffScreenTransitions")
    }
}

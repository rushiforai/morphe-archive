/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.transitions

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.extension.patchLog
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

/**
 * Shows Facebook's tabs, its Menu and the screens that open over it without the slide between
 * them. Each moves its own way. A screen that opens over the app, like the post composer, is its
 * own activity: the settings patch already watches every Facebook screen from the application's
 * onCreate, and from those callbacks the extension's ScreenTransitions asks Android for no
 * transition once this patch says it's in the build. A tab and the Menu are Facebook's own view
 * animations, and for those the patch asks the extension where Facebook decides to slide
 * (TransitionAnchors.kt). A tab strip inside a screen asks its pager for the page, and the patch
 * asks the extension first in the two places a tap goes through (PagerTabs.kt).
 *
 * In the default selection with its switch off: Facebook's transitions are a matter of taste, not
 * something it does to you.
 */
@Suppress("unused")
val turnOffScreenTransitionsPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Turn off screen transitions",
    description = "Shows Facebook's tabs, Menu and new screens at once, without the slide between them, so the " +
        "app feels quicker. Swipes and animations inside a page stay. Starts off. Turn it on in Hushfacebook " +
        "settings > Appearance.",
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

        // Tab strips inside a screen: see PagerTabs.kt. A build that draws them another way keeps the rest.
        try {
            val setPage = pagerTabClick(pagerTabStrip()).quietPagerTabTap()
            try {
                PickerSetTabFingerprint.method.quietPickerTab(setPage)
            } catch (moved: PatchException) {
                patchLog.warning("${moved.message}. The patch goes on without the Feelings and Activities tabs.")
            }
        } catch (moved: PatchException) {
            patchLog.warning("${moved.message}. The patch goes on without the tab strips inside a screen.")
        }
        enableStatus("turnOffScreenTransitions")
    }
}

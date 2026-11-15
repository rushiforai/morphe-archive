/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.instagram.shared.overrideInstagramMobileConfigBooleanFlag
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY
import app.template.patches.shared.cloneParameters
import app.template.patches.shared.returnEarly

private object ClipsViewPagerImplGetViewAtIndexFingerprint : Fingerprint(
    strings = listOf("ClipsViewPagerImpl_getViewAtIndex"),
)

private object ClipsSwipeRefreshLayoutOnInterceptTouchEventFingerprint : Fingerprint(
    parameters = listOf("Landroid/view/MotionEvent;"),
    definingClass = "Linstagram/features/clips/viewer/ui/ClipsSwipeRefreshLayout;",
)

@Suppress("unused")
val instagramDisableReelsScrollingPatch = bytecodePatch(
    name = "Disable Reels scrolling",
    description = "Disables the endless scrolling behavior in Instagram Reels, preventing swiping to the next Reel. " +
        "Note: On a clean install, the 'Tip' animation may appear but will stop on its own after a few seconds.",
    default = true,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)

    dependsOn(
        // Remove the "auto scroll" option from the 3-dots menu in Reels.
        overrideInstagramMobileConfigBooleanFlag(
            override = "83371::0" to false, // ig_reels_android_hands_free_mode::enabled
        ),
    )

    execute {
        val viewPagerField = ClipsViewPagerImplGetViewAtIndexFingerprint.classDef.fields.first {
            it.type == "Landroidx/viewpager2/widget/ViewPager2;"
        }

        // cloneParameters() preserves p0..pN and adds local scratch space so v0..v1 never clobber parameters.
        ClipsViewPagerImplGetViewAtIndexFingerprint.method.cloneParameters().addInstructions(
            0,
            """
                move-object/from16 v0, p0
                iget-object v0, v0, $viewPagerField
                const/4 v1, 0x0
                invoke-virtual {v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->setUserInputEnabled(Z)V
            """.trimIndent(),
        )

        // Return false in onInterceptTouchEvent to disable pull-to-refresh.
        ClipsSwipeRefreshLayoutOnInterceptTouchEventFingerprint.method.returnEarly(false)
    }
}

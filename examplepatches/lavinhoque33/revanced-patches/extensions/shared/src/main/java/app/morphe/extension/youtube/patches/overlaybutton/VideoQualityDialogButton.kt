/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.youtube.patches.overlaybutton

import android.view.View
import android.widget.ImageView
import app.morphe.extension.shared.utils.ResourceUtils
import app.morphe.extension.youtube.settings.Settings
import app.morphe.extension.youtube.shared.PlayerControlButton
import app.morphe.extension.youtube.shared.PlayerType
import app.morphe.extension.youtube.shared.RootView.isAdProgressTextVisible
import app.morphe.extension.youtube.utils.VideoUtils

@Suppress("unused") // Called by the player controls hooks.
object VideoQualityDialogButton {
    private const val BUTTON_ID = "revanced_video_quality_dialog_button"
    private var button: PlayerControlButton? = null

    @JvmStatic
    fun initializeButton(controlsView: View) {
        val buttonId = ResourceUtils.getIdIdentifier(BUTTON_ID)
        val placeholderId = ResourceUtils.getIdIdentifier("${BUTTON_ID}_placeholder")
        if (buttonId == 0 || placeholderId == 0 || controlsView.findViewById<View>(buttonId) !is ImageView ||
            controlsView.findViewById<View>(placeholderId) == null
        ) {
            button = null
            return
        }

        button = PlayerControlButton(
            controlsViewGroup = controlsView,
            imageViewButtonId = BUTTON_ID,
            buttonVisibility = ::isEnabled,
            onClickListener = { view ->
                if (view.isShown && isEnabled()) {
                    VideoUtils.showOverlayVideoQualityDialog(view.context)
                }
            },
        )
    }

    @JvmStatic
    fun setVisibility(visible: Boolean, animated: Boolean) {
        button?.setVisibility(visible, animated)
    }

    @JvmStatic
    fun setVisibilityImmediate(visible: Boolean) {
        button?.setVisibilityImmediate(visible)
    }

    @JvmStatic
    fun setVisibilityNegatedImmediate() {
        button?.setVisibilityNegatedImmediate()
    }

    private fun isEnabled(): Boolean {
        return Settings.OVERLAY_BUTTON_VIDEO_QUALITY.get()
            && PlayerType.current.isMaximizedOrFullscreenOrSliding()
            && !isAdProgressTextVisible()
    }
}

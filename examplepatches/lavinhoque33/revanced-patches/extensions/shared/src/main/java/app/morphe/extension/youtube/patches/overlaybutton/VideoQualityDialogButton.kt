/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-23.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.youtube.patches.overlaybutton

import android.content.res.Configuration
import android.view.View
import app.morphe.extension.shared.utils.ResourceUtils
import app.morphe.extension.youtube.patches.video.VideoQualityPatch
import app.morphe.extension.youtube.settings.Settings
import app.morphe.extension.youtube.shared.PlayerControlButton
import app.morphe.extension.youtube.shared.PlayerType
import app.morphe.extension.youtube.shared.RootView.isAdProgressTextVisible
import app.morphe.extension.youtube.utils.VideoUtils
import java.lang.ref.WeakReference

@Suppress("unused") // Called by the player controls hooks.
object VideoQualityDialogButton {
    private const val BUTTON_ID = "revanced_video_quality_dialog_button"
    private var button: PlayerControlButton? = null
    private var controlsRoot: WeakReference<View>? = null

    @JvmStatic
    fun initializeButton(controlsView: View) {
        val buttonId = ResourceUtils.getIdIdentifier(BUTTON_ID)
        val placeholderId = ResourceUtils.getIdIdentifier("${BUTTON_ID}_placeholder")
        if (buttonId == 0 || placeholderId == 0 ||
            controlsView.findViewById<View>(buttonId) !is VideoQualityLabelButton ||
            controlsView.findViewById<View>(placeholderId) == null
        ) {
            button = null
            controlsRoot = null
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
        controlsRoot = WeakReference(controlsView)
        onEffectiveQualityChanged()
    }

    @JvmStatic
    fun setVisibility(visible: Boolean, animated: Boolean) {
        if (visible) onEffectiveQualityChanged()
        button?.setVisibility(visible, animated)
    }

    @JvmStatic
    fun setVisibilityImmediate(visible: Boolean) {
        if (visible) onEffectiveQualityChanged()
        button?.setVisibilityImmediate(visible)
    }

    @JvmStatic
    fun setVisibilityNegatedImmediate() {
        button?.setVisibilityNegatedImmediate()
    }

    @JvmStatic
    fun onEffectiveQualityChanged() {
        val label = button?.imageView() as? VideoQualityLabelButton ?: return
        if (!Settings.OVERLAY_BUTTON_VIDEO_QUALITY.get()) return

        val resolution = VideoQualityPatch.getEffectiveQuality()?.patch_getResolution() ?: 0
        label.updateQuality(resolution, Settings.OVERLAY_BUTTON_VIDEO_QUALITY_RESOLUTION.get())
    }

    @JvmStatic
    fun replacesTimestampQuality(timestamp: View): Boolean {
        val root = controlsRoot?.get() ?: return false
        if (!isEnabled()) return false

        val maxButtons = if (root.resources.configuration.orientation == Configuration.ORIENTATION_LANDSCAPE) {
            Settings.OVERLAY_BUTTONS_MAX_LANDSCAPE.get()
        } else {
            Settings.OVERLAY_BUTTONS_MAX_PORTRAIT.get()
        }
        if (maxButtons <= 0) return false

        // The stock timestamp and the added button share the inflated bottom-controls layout.
        var child: View? = timestamp
        while (child != null && child !== root) {
            child = child.parent as? View
        }
        return child === root
    }

    private fun isEnabled(): Boolean {
        return Settings.OVERLAY_BUTTON_VIDEO_QUALITY.get()
            && PlayerType.current.isMaximizedOrFullscreenOrSliding()
            && !isAdProgressTextVisible()
    }
}

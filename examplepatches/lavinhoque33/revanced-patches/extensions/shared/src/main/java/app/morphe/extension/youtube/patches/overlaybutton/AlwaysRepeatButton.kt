package app.morphe.extension.youtube.patches.overlaybutton

import android.graphics.ColorFilter
import android.graphics.PorterDuff
import android.graphics.PorterDuffColorFilter
import android.util.TypedValue
import android.view.View
import android.widget.ImageView
import androidx.core.graphics.toColorInt
import app.morphe.extension.shared.utils.Logger
import app.morphe.extension.shared.utils.ResourceUtils
import app.morphe.extension.shared.utils.StringRef.str
import app.morphe.extension.shared.utils.Utils.showToastShort
import app.morphe.extension.youtube.settings.Settings
import app.morphe.extension.youtube.shared.PlayerControlButton
import app.morphe.extension.youtube.shared.RootView.isAdProgressTextVisible
import app.morphe.extension.youtube.videoplayer.PlayerIcons

@Suppress("unused")
object AlwaysRepeatButton {
    private val alwaysRepeat = Settings.ALWAYS_REPEAT
    private val alwaysRepeatPause = Settings.ALWAYS_REPEAT_PAUSE
    private val cf: ColorFilter =
        PorterDuffColorFilter("#fffffc79".toColorInt(), PorterDuff.Mode.SRC_ATOP)
    private var instance: PlayerControlButton? = null

    /**
     * Injection point.
     */
    @JvmStatic
    fun initializeButton(controlsView: View) {
        try {
            instance = PlayerControlButton(
                controlsViewGroup = controlsView,
                imageViewButtonId = "revanced_always_repeat_button",
                buttonVisibility = { isButtonEnabled() },
                onClickListener = { view: View -> onClick(view) },
                onLongClickListener = { view: View ->
                    onLongClick(view)
                    true
                }
            )
            instance?.changeSelected(selected = alwaysRepeat.get())
            instance?.setStyledIcon(
                iconName = "morphe_loop_video_button_off",
                activatedIconName = "morphe_loop_video_button_on",
                activatedState = android.R.attr.state_selected,
                activatedTintColor = activatedTint(controlsView),
            )
            instance?.setColorFilter(selected = alwaysRepeatPause.get())
        } catch (ex: Exception) {
            Logger.printException({ "initializeButton failure" }, ex)
        }
    }

    /**
     * injection point
     */
    @JvmStatic
    fun setVisibilityNegatedImmediate() {
        instance?.setVisibilityNegatedImmediate()
    }

    /**
     * injection point
     */
    @JvmStatic
    fun setVisibilityImmediate(visible: Boolean) {
        instance?.setVisibilityImmediate(visible)
    }

    /**
     * injection point
     */
    @JvmStatic
    fun setVisibility(visible: Boolean, animated: Boolean) {
        instance?.setVisibility(visible, animated)
    }

    private fun isButtonEnabled(): Boolean {
        return Settings.OVERLAY_BUTTON_ALWAYS_REPEAT.get()
                && !isAdProgressTextVisible()
    }

    /**
     * The tint the stock repeat selector uses for the selected state, `?attr/ytCallToAction`.
     * Icons of a custom icon pack are shown as they are, the pack has its own selected icon.
     *
     * @return The theme color, or null to keep the color of the icon.
     */
    private fun activatedTint(view: View): Int? {
        if (Settings.PLAYER_ICON_STYLE.get() == PlayerIcons.Style.CUSTOM) return null

        val attr = ResourceUtils.getAttrIdentifier("ytCallToAction")
        if (attr == 0) return null

        val value = TypedValue()
        if (!view.context.theme.resolveAttribute(attr, value, true)) return null
        if (value.type < TypedValue.TYPE_FIRST_COLOR_INT || value.type > TypedValue.TYPE_LAST_COLOR_INT) {
            return null
        }

        return value.data
    }

    private fun onClick(view: View) {
        instance?.changeSelected(!view.isSelected)
    }

    private fun onLongClick(view: View) {
        instance?.changeColorFilter()
    }

    private fun PlayerControlButton.changeColorFilter() {
        val imageView: ImageView? = imageView()
        if (imageView == null) return

        imageView.isSelected = true
        alwaysRepeat.save(true)

        val newValue: Boolean = !alwaysRepeatPause.get()
        alwaysRepeatPause.save(newValue)
        setColorFilter(imageView, newValue)
    }

    private fun PlayerControlButton.changeSelected(selected: Boolean) {
        val imageView: ImageView? = imageView()
        if (imageView == null) return

        if (imageView.colorFilter === cf) {
            showToastShort(str("revanced_overlay_button_not_allowed_warning"))
            return
        }

        imageView.isSelected = selected
        alwaysRepeat.save(selected)
    }

    private fun PlayerControlButton.setColorFilter(
        imageView: ImageView? = imageView(),
        selected: Boolean
    ) {
        if (selected) imageView?.colorFilter = cf
        else imageView?.clearColorFilter()
    }

}
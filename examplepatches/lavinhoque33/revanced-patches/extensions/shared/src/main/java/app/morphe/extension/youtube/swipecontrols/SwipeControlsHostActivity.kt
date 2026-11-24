package app.morphe.extension.youtube.swipecontrols

import android.app.Activity
import android.content.res.Configuration
import android.graphics.Rect
import android.os.Build
import android.os.Bundle
import android.view.Gravity
import android.view.KeyEvent
import android.view.MotionEvent
import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import app.morphe.extension.shared.utils.Logger.printDebug
import app.morphe.extension.shared.utils.Logger.printException
import app.morphe.extension.shared.utils.ResourceType
import app.morphe.extension.shared.utils.ResourceUtils.getIdentifier
import app.morphe.extension.shared.utils.Utils.dipToPixels
import app.morphe.extension.youtube.settings.Settings
import app.morphe.extension.youtube.shared.PlayerType
import app.morphe.extension.youtube.sponsorblock.ui.SponsorBlockViewController
import app.morphe.extension.youtube.swipecontrols.controller.AudioVolumeController
import app.morphe.extension.youtube.swipecontrols.controller.ScreenBrightnessController
import app.morphe.extension.youtube.swipecontrols.controller.SwipeZonesController
import app.morphe.extension.youtube.swipecontrols.controller.VolumeKeysController
import app.morphe.extension.youtube.swipecontrols.controller.gesture.ClassicSwipeController
import app.morphe.extension.youtube.swipecontrols.controller.gesture.PressToSwipeController
import app.morphe.extension.youtube.swipecontrols.controller.gesture.core.GestureController
import app.morphe.extension.youtube.swipecontrols.misc.Rectangle
import app.morphe.extension.youtube.swipecontrols.views.SwipeControlsOverlayLayout
import java.lang.ref.WeakReference

/**
 * The main controller for configurable edge-assigned swipe controls.
 * note that the superclass is overwritten to the superclass of the MainActivity at patch time.
 */
class SwipeControlsHostActivity : Activity() {
    /**
     * current instance of [AudioVolumeController]
     */
    var audio: AudioVolumeController? = null

    /**
     * current instance of [ScreenBrightnessController]
     */
    var screen: ScreenBrightnessController? = null

    /**
     * current instance of [SwipeControlsConfigurationProvider]
     */
    lateinit var config: SwipeControlsConfigurationProvider

    /**
     * current instance of [SwipeControlsOverlayLayout]
     */
    lateinit var overlay: SwipeControlsOverlayLayout

    /**
     * current instance of [SwipeZonesController]
     */
    lateinit var zones: SwipeZonesController

    /**
     * main gesture controller
     */
    private lateinit var gesture: GestureController

    /**
     * main volume keys controller
     */
    private lateinit var keys: VolumeKeysController

    private var swipeGestureInProgress = false
    private var portraitSwipeInProgress = false
    private var portraitOverlayBounds: Rectangle? = null

    // MainActivity's stock constructor bypasses this injected superclass's constructor.
    // Keep all non-default instance state in the lifecycle initialization path.
    private var controlsOverlayId = 0
    private var elevatedOverlayId = 0
    private var playButtonId = 0
    private var timeBarId = 0
    private var inlineTimeBarId = 0
    private var largeTimeBarId = 0
    private var engagementPanelContentId = 0
    private var maxTimeBarHeight = 0
    private lateinit var touchBounds: Rect
    private lateinit var windowLocation: IntArray
    private lateinit var regularScrubber: PreciseSeekOverlay
    private lateinit var elevatedScrubber: PreciseSeekOverlay

    private var playerTypeObserver: ((PlayerType) -> Unit)? = null

    /**
     * current content view with id [android.R.id.content]
     */
    private val contentRoot
        get() = window.decorView.findViewById<ViewGroup>(android.R.id.content)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        initialize()
    }

    override fun onDestroy() {
        playerTypeObserver?.let { PlayerType.onChange -= it }
        super.onDestroy()
    }

    override fun onStart() {
        super.onStart()
        reAttachOverlays()
    }

    override fun dispatchTouchEvent(ev: MotionEvent?): Boolean {
        ensureInitialized()
        if (ev == null) {
            return super.dispatchTouchEvent(ev)
        }

        val action = ev.actionMasked
        if (action == MotionEvent.ACTION_DOWN) {
            if (swipeGestureInProgress) gesture.cancelTouchEvent(ev)
            swipeGestureInProgress = prepareSwipeGesture(ev)
        } else if (swipeGestureInProgress &&
            (!canContinueSwipe() || (portraitSwipeInProgress && ev.pointerCount > 1))
        ) {
            // Cancel only RVX's detector, including any delayed action. Native fine scrubbing
            // keeps the original DOWN/MOVE/UP sequence even if its overlay closes before UP.
            gesture.cancelTouchEvent(ev)
            overlay.hideFeedback()
            swipeGestureInProgress = false
        }

        if (!swipeGestureInProgress) return super.dispatchTouchEvent(ev)

        val consumed = gesture.submitTouchEvent(ev)
        if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
            swipeGestureInProgress = false
        }

        if (!consumed) return super.dispatchTouchEvent(ev)

        // Consumed DOWN bypasses Activity's user-interaction report, leaving autoplay idle.
        if (action == MotionEvent.ACTION_DOWN) onUserInteraction()
        return true
    }

    private fun prepareSwipeGesture(event: MotionEvent): Boolean {
        if (!config.enableSwipeControls ||
            SponsorBlockViewController.isNewSegmentLayoutVisibleAndContains(event.rawX, event.rawY)
        ) return false

        val controlsOverlay = findViewById<View>(controlsOverlayId)
        regularScrubber.bind(controlsOverlay)
        elevatedScrubber.bind(if (elevatedOverlayId == 0) null else findViewById(elevatedOverlayId))
        if (isPreciseSeekActive()) {
            overlay.hideFeedback()
            return false
        }

        // Let native scrubbing decide whether to open its precise mode without an intercepted DOWN.
        if (touchesVisibleBar(controlsOverlay?.findViewById(timeBarId), event) ||
            touchesVisibleBar(controlsOverlay?.findViewById(inlineTimeBarId), event) ||
            touchesVisibleBar(controlsOverlay?.findViewById(largeTimeBarId), event)
        ) return false

        portraitSwipeInProgress = config.enablePortraitSwipeControls
        if (!portraitSwipeInProgress) {
            setPortraitOverlayBounds(null)
            return true
        }

        if (!isPortraitSwipeAvailable() ||
            controlsOverlay?.findViewById<View>(playButtonId)?.isShown == true ||
            touchesVisibleView(findViewById(engagementPanelContentId), event)
        ) return false

        val playerBounds = zones.preparePortraitTouch(controlsOverlay ?: return false, event) ?: return false
        setPortraitOverlayBounds(playerBounds)
        return true
    }

    private fun playerViewId(name: String) = getIdentifier(name, ResourceType.ID, this)

    private fun isPreciseSeekActive(): Boolean = regularScrubber.isShown() || elevatedScrubber.isShown()

    private fun isPortraitSwipeAvailable(): Boolean =
        config.enablePortraitSwipeControls && resources.configuration.orientation == Configuration.ORIENTATION_PORTRAIT

    internal fun canContinueSwipe(): Boolean = swipeGestureInProgress &&
        config.enableSwipeControls && (!portraitSwipeInProgress || isPortraitSwipeAvailable()) && !isPreciseSeekActive()

    private fun touchesVisibleBar(view: View?, event: MotionEvent): Boolean =
        view != null && view.height <= maxTimeBarHeight && touchesVisibleView(view, event)

    private fun touchesVisibleView(view: View?, event: MotionEvent): Boolean {
        if (view == null || !view.isShown || !view.getLocalVisibleRect(touchBounds)) return false

        view.getLocationInWindow(windowLocation)
        return touchBounds.contains(
            event.x.toInt() - windowLocation[0],
            event.y.toInt() - windowLocation[1],
        )
    }

    private fun setPortraitOverlayBounds(bounds: Rectangle?) {
        if (portraitOverlayBounds == bounds) return
        portraitOverlayBounds = bounds
        overlay.hideFeedback()

        overlay.layoutParams = if (bounds == null) {
            FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
        } else {
            contentRoot.getLocationInWindow(windowLocation)
            FrameLayout.LayoutParams(bounds.width, bounds.height, Gravity.TOP or Gravity.LEFT).apply {
                leftMargin = bounds.left - windowLocation[0]
                topMargin = bounds.top - windowLocation[1]
            }
        }
    }

    override fun dispatchKeyEvent(ev: KeyEvent?): Boolean {
        ensureInitialized()
        return if ((ev != null) && keys.onKeyEvent(ev)) {
            // Activity reports user interaction for every key event.
            onUserInteraction()

            true
        } else {
            super.dispatchKeyEvent(ev)
        }
    }

    /**
     * dispatch a touch event to downstream views
     *
     * @param event the event to dispatch
     * @return was the event consumed?
     */
    fun dispatchDownstreamTouchEvent(event: MotionEvent) =
        super.dispatchTouchEvent(event)

    /**
     * ensures that swipe controllers are initialized and attached.
     * on some ROMs with SDK <= 23, [onCreate] and [onStart] may not be called correctly.
     * see https://github.com/revanced/revanced-patches/issues/446
     */
    private fun ensureInitialized() {
        if (!this::config.isInitialized) {
            printException {
                "swipe controls were not initialized in onCreate, initializing on-the-fly (SDK is ${Build.VERSION.SDK_INT})"
            }
            initialize()
            reAttachOverlays()
        }
    }

    /**
     * initializes controllers, only call once
     */
    private fun initialize() {
        // create controllers
        printDebug { "initializing swipe controls controllers" }
        initializeTouchState()

        config = SwipeControlsConfigurationProvider()
        keys = VolumeKeysController(this)
        audio = createAudioController()
        screen = createScreenController()

        // create overlay
        SwipeControlsOverlayLayout(this, config).let {
            overlay = it
            contentRoot.addView(it)
        }

        // create swipe zone controller
        zones = SwipeZonesController(config, this) {
            Rectangle(
                contentRoot.x.toInt(),
                contentRoot.y.toInt(),
                contentRoot.width,
                contentRoot.height,
            )
        }

        // create the gesture controller
        gesture = createGestureController()

        // listen for changes in the player type
        val observer = { type: PlayerType -> onPlayerTypeChanged(type) }
        playerTypeObserver = observer
        PlayerType.onChange += observer

        // set current instance reference
        currentHost = WeakReference(this)
    }

    private fun initializeTouchState() {
        controlsOverlayId = playerViewId("youtube_controls_overlay")
        elevatedOverlayId = playerViewId("elevated_controls_layout")
        playButtonId = playerViewId("player_control_play_pause_replay_button_touch_area")
        timeBarId = playerViewId("time_bar")
        inlineTimeBarId = playerViewId("watch_while_time_bar_view")
        largeTimeBarId = playerViewId("large_controls_time_bar")
        engagementPanelContentId = playerViewId("engagement_panel_content")
        maxTimeBarHeight = dipToPixels(64f)
        touchBounds = Rect()
        windowLocation = IntArray(2)

        val fineScrubbingId = playerViewId("fine_scrubbing_overlay")
        regularScrubber = PreciseSeekOverlay(fineScrubbingId, playerViewId("fine_scrubbing_overlay_stub"))
        elevatedScrubber = PreciseSeekOverlay(fineScrubbingId, playerViewId("elevated_fine_scrubbing_overlay_stub"))
    }

    /**
     * (re) attaches swipe overlays
     */
    private fun reAttachOverlays() {
        printDebug { "attaching swipe controls overlay" }
        contentRoot.removeView(overlay)
        contentRoot.addView(overlay)
    }

    /** Each stock stub inflates a view with the same ID, even in the separate elevated container. */
    private class PreciseSeekOverlay(private val overlayId: Int, private val stubId: Int) {
        private var container: View? = null
        private var overlay: View? = null
        private var stub: View? = null

        fun bind(parent: View?) {
            container = parent
            overlay = parent?.findViewById(overlayId)
            stub = if (overlay == null && stubId != 0) parent?.findViewById(stubId) else null
        }

        fun isShown(): Boolean {
            // Do not walk the view tree on every MOVE. A replaced stub signals inflation.
            if (stub?.isAttachedToWindow == false) {
                overlay = container?.findViewById(overlayId)
                stub = null
            }
            return overlay?.isShown == true
        }
    }

    // Flag that indicates whether the brightness has been saved and restored default brightness
    private var isBrightnessSaved = false

    /**
     * called when the player type changes
     *
     * @param type the new player type
     */
    private fun onPlayerTypeChanged(type: PlayerType) {
        if (type != PlayerType.WATCH_WHILE_MAXIMIZED && Settings.SWIPE_PORTRAIT.get()) {
            runOnUiThread {
                if (PlayerType.current != PlayerType.WATCH_WHILE_MAXIMIZED) setPortraitOverlayBounds(null)
            }
        }

        when {
            // If saving and restoring brightness is enabled, and the player type is WATCH_WHILE_FULLSCREEN,
            // and brightness has already been saved, then restore the screen brightness
            config.shouldSaveAndRestoreBrightness && type == PlayerType.WATCH_WHILE_FULLSCREEN && isBrightnessSaved -> {
                screen?.restore()
                isBrightnessSaved = false
            }
            // If saving and restoring brightness is enabled, and brightness has not been saved,
            // then save the current screen state, restore default brightness, and mark brightness as saved
            config.shouldSaveAndRestoreBrightness && !isBrightnessSaved -> {
                screen?.save()
                screen?.restoreDefaultBrightness()
                isBrightnessSaved = true
            }
            // If saving and restoring brightness is disabled, simply keep the default brightness
            else -> screen?.restoreDefaultBrightness()
        }
    }

    /**
     * create the audio volume controller
     */
    private fun createAudioController() =
        if (config.enableVolumeControls) {
            AudioVolumeController(this)
        } else {
            null
        }

    /**
     * create the screen brightness controller instance
     */
    private fun createScreenController() =
        if (config.enableBrightnessControl) {
            ScreenBrightnessController(window, config)
        } else {
            null
        }

    /**
     * create the gesture controller based on settings
     */
    private fun createGestureController() =
        if (config.shouldEnablePressToSwipe) {
            PressToSwipeController(this, config)
        } else {
            ClassicSwipeController(this, config)
        }

    companion object {
        /**
         * the currently active swipe controls host.
         * the reference may be null!
         */
        @JvmStatic
        var currentHost: WeakReference<SwipeControlsHostActivity> = WeakReference(null)
            private set
    }
}

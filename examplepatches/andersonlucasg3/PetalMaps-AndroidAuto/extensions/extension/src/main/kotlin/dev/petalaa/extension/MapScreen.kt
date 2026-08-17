package dev.petalaa.extension

import androidx.car.app.CarContext
import androidx.car.app.Screen
import androidx.car.app.model.Action
import androidx.car.app.model.ActionStrip
import androidx.car.app.model.CarIcon
import androidx.car.app.model.Template
import androidx.car.app.navigation.model.NavigationTemplate

/**
 * The main map [Screen] rendered on the Android Auto head unit.
 *
 * This screen returns a [NavigationTemplate] whose [ActionStrip] holds a
 * single no-op action: the library requires a non-empty action strip, but
 * the buttons are redundant here — zoom, pan and recenter are driven by
 * gestures (pinch, scroll, fling, click) dispatched through [CarDisplay].
 * The actual surface rendering is managed by [PetalSession] via
 * [AppManager.setSurfaceCallback].
 *
 * @param carContext The car context provided by the framework.
 * @param carDisplay Helper that dispatches synthetic touch events
 *                   (scroll, fling, pinch, click) to the projected map.
 */
class MapScreen(
    carContext: CarContext,
    private val carDisplay: CarDisplay
) : Screen(carContext) {

    init {
        AALogger.i("MapScreen created")
    }

    override fun onGetTemplate(): Template {
        AALogger.i("onGetTemplate")

        // NavigationTemplate requires a non-empty ActionStrip; the single
        // action is a no-op placeholder.
        val noOpAction = Action.Builder()
            .setTitle("")
            .setIcon(CarIcon.ALERT)
            .setOnClickListener { }
            .build()

        val actionStrip = ActionStrip.Builder()
            .addAction(noOpAction)
            .build()

        return NavigationTemplate.Builder()
            .setActionStrip(actionStrip)
            .build()
    }
}

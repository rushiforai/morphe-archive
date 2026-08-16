package dev.petalaa.extension

import androidx.car.app.CarContext
import androidx.car.app.Screen
import androidx.car.app.model.Action
import androidx.car.app.model.ActionStrip
import androidx.car.app.model.CarIcon
import androidx.car.app.model.Template
import androidx.car.app.navigation.model.NavigationTemplate
import androidx.core.graphics.drawable.IconCompat

/**
 * The main map [Screen] rendered on the Android Auto head unit.
 *
 * This screen returns a [NavigationTemplate] with a zoom/center
 * [ActionStrip]. The actual surface rendering is managed by
 * [PetalSession] via [AppManager.setSurfaceCallback], and touch
 * events are dispatched through [CarDisplay].
 *
 * @param carContext The car context provided by the framework.
 * @param carDisplay Helper that dispatches synthetic touch events
 *                   when the user taps action-strip buttons.
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

        val zoomInAction = Action.Builder()
            .setTitle("+")
            .setIcon(
                CarIcon.Builder(
                    IconCompat.createWithResource(carContext, android.R.drawable.ic_input_add)
                ).build()
            )
            .setOnClickListener { carDisplay.zoomIn() }
            .build()

        val zoomOutAction = Action.Builder()
            .setTitle("\u2212") // Unicode minus sign
            .setIcon(
                CarIcon.Builder(
                    IconCompat.createWithResource(carContext, android.R.drawable.ic_input_delete)
                ).build()
            )
            .setOnClickListener { carDisplay.zoomOut() }
            .build()

        val reCenterAction = Action.Builder()
            .setTitle("\u25C9") // target / locate symbol
            .setIcon(
                CarIcon.Builder(
                    IconCompat.createWithResource(carContext, android.R.drawable.ic_menu_mylocation)
                ).build()
            )
            .setOnClickListener { carDisplay.reCenter() }
            .build()

        val actionStrip = ActionStrip.Builder()
            .addAction(zoomInAction)
            .addAction(zoomOutAction)
            .addAction(reCenterAction)
            .build()

        return NavigationTemplate.Builder()
            .setActionStrip(actionStrip)
            .build()
    }
}

package dev.petalaa.extension

import android.content.Intent
import android.graphics.Rect
import android.util.Log
import android.view.Surface
import androidx.car.app.AppManager
import androidx.car.app.Screen
import androidx.car.app.Session
import androidx.car.app.SurfaceCallback
import androidx.car.app.SurfaceContainer

/**
 * Android Auto session that provides the map [Screen] and manages
 * the [SurfaceCallback] lifecycle.
 *
 * The [SurfaceCallback] is registered with [AppManager] once per session
 * and survives screen transitions. It creates a [VirtualDisplay] on the
 * host-provided surface and projects `AutoPetalMapsActivity` onto it.
 *
 * ## Resize handling
 *
 * When the head unit changes display configuration (rotation, split-screen,
 * etc.), [onVisibleAreaChanged] / [onStableAreaChanged] are called.
 * If dimensions differ from the current VirtualDisplay, we tear it down
 * and recreate it on the updated surface. The previous VirtualDisplay is
 * released first to avoid leaks.
 */
class PetalSession : Session() {

    companion object {
        private const val TAG = "PetalAA"
    }

    private val carDisplay by lazy { CarDisplay(carContext) }
    private var surfaceCallbackRegistered = false

    /** The most recent SurfaceContainer — saved for resize recreation. */
    private var lastContainer: SurfaceContainer? = null

    override fun onCreateScreen(intent: Intent): Screen {
        Log.i(TAG, "onCreateScreen: creating MapScreen")

        // Register the SurfaceCallback once per session lifetime.
        if (!surfaceCallbackRegistered) {
            surfaceCallbackRegistered = true
            Log.i(TAG, "Registering SurfaceCallback with AppManager")
            val appManager = carContext.getCarService(AppManager::class.java)
            appManager.setSurfaceCallback(createSurfaceCallback())
        }

        return MapScreen(carContext, carDisplay)
    }

    // ---- SurfaceCallback factory ------------------------------------------

    private fun createSurfaceCallback(): SurfaceCallback {
        return object : SurfaceCallback {

            override fun onSurfaceAvailable(container: SurfaceContainer) {
                Log.i(TAG, "onSurfaceAvailable")
                lastContainer = container
                createDisplayFromContainer(container)
            }

            override fun onSurfaceDestroyed(container: SurfaceContainer) {
                Log.i(TAG, "onSurfaceDestroyed")
                lastContainer = null
                carDisplay.destroy()
            }

            override fun onVisibleAreaChanged(visibleArea: Rect) {
                Log.d(TAG, "onVisibleAreaChanged: $visibleArea")
                // If the visible area is smaller than before, the head unit may
                // have opened system UI. We keep the full surface but let the
                // activity adapt via configuration change.
            }

            override fun onStableAreaChanged(stableArea: Rect) {
                Log.d(TAG, "onStableAreaChanged: $stableArea")
                val (w, h) = carDisplay.currentDimensions()
                // If the stable area size differs substantially from our
                // current VirtualDisplay dimensions, recreate the display.
                if (stableArea.width() > 0 && stableArea.height() > 0) {
                    if (stableArea.width() != w || stableArea.height() != h) {
                        Log.i(TAG, "Stable area changed: ${stableArea.width()}x${stableArea.height()} " +
                                "(was ${w}x${h}) — recreating VirtualDisplay")
                        val container = lastContainer
                        if (container != null) {
                            // Re-create on the current surface with new dimensions.
                            carDisplay.destroy()
                            val surface: Surface = container.surface ?: return
                            val density = carContext.resources.displayMetrics.densityDpi
                            carDisplay.create(surface, stableArea.width(), stableArea.height(), density)
                        }
                    }
                }
            }

            // -- Gesture callbacks ------------------------------------------

            @Suppress("DEPRECATION")
            @androidx.car.app.annotations.ExperimentalCarApi
            override fun onScroll(distanceX: Float, distanceY: Float) {
                carDisplay.dispatchScroll(distanceX, distanceY)
            }

            @Suppress("DEPRECATION")
            @androidx.car.app.annotations.ExperimentalCarApi
            override fun onFling(velocityX: Float, velocityY: Float) {
                carDisplay.dispatchFling(velocityX, velocityY)
            }

            @Suppress("DEPRECATION")
            @androidx.car.app.annotations.ExperimentalCarApi
            override fun onScale(focusX: Float, focusY: Float, scaleFactor: Float) {
                carDisplay.dispatchScale(scaleFactor, focusX, focusY)
            }

            @Suppress("DEPRECATION")
            @androidx.car.app.annotations.ExperimentalCarApi
            override fun onClick(x: Float, y: Float) {
                carDisplay.dispatchClick(x, y)
            }

            // -- Internal helper --------------------------------------------

            private fun createDisplayFromContainer(container: SurfaceContainer) {
                val surface: Surface = container.surface ?: run {
                    Log.e(TAG, "onSurfaceAvailable: surface is null")
                    return
                }

                val metrics = carContext.resources.displayMetrics
                val width = metrics.widthPixels
                val height = metrics.heightPixels
                val density = metrics.densityDpi

                Log.i(TAG, "Creating VirtualDisplay: ${width}x${height}, density=$density")
                val success = carDisplay.create(surface, width, height, density)
                if (!success) {
                    Log.e(TAG, "Failed to create VirtualDisplay — map will not render")
                }
            }
        }
    }
}

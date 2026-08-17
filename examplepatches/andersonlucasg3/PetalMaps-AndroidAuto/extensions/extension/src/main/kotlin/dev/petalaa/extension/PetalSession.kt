package dev.petalaa.extension

import android.content.Intent
import android.graphics.Rect
import android.os.Handler
import android.os.Looper
import androidx.car.app.AppManager
import androidx.car.app.Screen
import androidx.car.app.Session
import androidx.car.app.SurfaceCallback
import androidx.car.app.SurfaceContainer
import kotlin.math.abs

/**
 * Android Auto session that provides the map [Screen] and manages
 * the [SurfaceCallback] lifecycle.
 *
 * The [SurfaceCallback] is registered with [AppManager] once per session
 * and survives screen transitions. It hands the host-provided surface to
 * [CarDisplay], which projects `PetalMapsActivity` onto a decoupled
 * VirtualDisplay and draws the captured frames onto the car surface.
 *
 * ## Resize handling
 *
 * When the head unit changes display configuration (rotation, split-screen,
 * etc.), [onVisibleAreaChanged] / [onStableAreaChanged] are called.
 * If dimensions differ meaningfully (>= 5%) from the current VirtualDisplay,
 * we schedule a recreation debounced by ~700ms — the host often sends a burst
 * of area updates, and recreating per update kills the activity the touch
 * events are being dispatched to. Identical or sub-5% changes are ignored.
 */
class PetalSession : Session() {

    private val carDisplay by lazy { CarDisplay(carContext) }
    private var surfaceCallbackRegistered = false

    /** The most recent SurfaceContainer — saved for resize recreation. */
    private var lastContainer: SurfaceContainer? = null

    /** Main-thread handler used to debounce resize-driven recreations. */
    private val mainHandler = Handler(Looper.getMainLooper())

    /** Pending debounced recreation runnable, if any. */
    private var pendingRecreate: Runnable? = null

    override fun onCreateScreen(intent: Intent): Screen {
        AALogger.i("onCreateScreen: creating MapScreen")

        // Register the SurfaceCallback once per session lifetime.
        if (!surfaceCallbackRegistered) {
            surfaceCallbackRegistered = true
            AALogger.i("Registering SurfaceCallback with AppManager")
            val appManager = carContext.getCarService(AppManager::class.java)
            appManager.setSurfaceCallback(createSurfaceCallback())
            AALogger.shareableCopy()

            AALogger.i("Car mode disabled by design — phone locks naturally stop projection")
        }

        return MapScreen(carContext, carDisplay)
    }

    // ---- SurfaceCallback factory ------------------------------------------

    private fun createSurfaceCallback(): SurfaceCallback {
        return object : SurfaceCallback {

            override fun onSurfaceAvailable(container: SurfaceContainer) {
                AALogger.i("onSurfaceAvailable: width=${container.width}, height=${container.height}, density=${container.dpi}")
                cancelPendingRecreate("new surface available")
                lastContainer = container
                createDisplayFromContainer(container)
                AALogger.shareableCopy()
            }

            override fun onSurfaceDestroyed(container: SurfaceContainer) {
                AALogger.i("onSurfaceDestroyed")
                cancelPendingRecreate("surface destroyed")
                lastContainer = null
                carDisplay.destroy()
                // Copy log to /sdcard for easy retrieval after session ends
                AALogger.shareableCopy()
            }

            override fun onVisibleAreaChanged(visibleArea: Rect) {
                AALogger.d("onVisibleAreaChanged: $visibleArea")
                // If the visible area is smaller than before, the head unit may
                // have opened system UI. We keep the full surface but let the
                // activity adapt via configuration change.
            }

            override fun onStableAreaChanged(stableArea: Rect) {
                AALogger.d("onStableAreaChanged: $stableArea")
                val newW = stableArea.width()
                val newH = stableArea.height()
                if (newW <= 0 || newH <= 0) return

                val (w, h) = carDisplay.currentDimensions()

                // No display yet — create immediately (no debounce needed).
                if (w <= 0 || h <= 0) {
                    AALogger.i("Stable area ${newW}x${newH} with no live display — creating now")
                    recreateDisplay(newW, newH)
                    AALogger.shareableCopy()
                    return
                }

                // Ignore identical or sub-5% changes — not worth a recreation.
                val dwPct = abs(newW - w) / w.toFloat()
                val dhPct = abs(newH - h) / h.toFloat()
                if ((newW == w && newH == h) || (dwPct < 0.05f && dhPct < 0.05f)) {
                    AALogger.d("Stable area ${newW}x${newH} vs current ${w}x${h} below threshold — ignored")
                    return
                }

                // Debounce: the host often sends a burst of stable-area
                // updates; only recreate once the dims settle for ~700ms.
                cancelPendingRecreate("new area ${newW}x${newH}")
                val task = Runnable {
                    pendingRecreate = null
                    val (cw, ch) = carDisplay.currentDimensions()
                    AALogger.i("Debounce fired: recreating VirtualDisplay at ${newW}x${newH} (was ${cw}x${ch})")
                    recreateDisplay(newW, newH)
                    AALogger.shareableCopy()
                }
                pendingRecreate = task
                mainHandler.postDelayed(task, 700L)
                AALogger.i("Recreation debounce scheduled in 700ms for ${newW}x${newH} (was ${w}x${h})")
                AALogger.shareableCopy()
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
                val success = carDisplay.create(container)
                if (!success) {
                    AALogger.e("Failed to create VirtualDisplay — map will not render")
                }
            }

            /** Cancel a scheduled recreation, if any. */
            private fun cancelPendingRecreate(reason: String) {
                pendingRecreate?.let {
                    mainHandler.removeCallbacks(it)
                    pendingRecreate = null
                    AALogger.i("Recreation debounce cancelled ($reason)")
                }
            }

            /**
             * Recreate the VirtualDisplay at the given dimensions on the last
             * known surface. [CarDisplay.create] finishes the old activity
             * and releases the previous display internally.
             */
            private fun recreateDisplay(width: Int, height: Int) {
                val container = lastContainer
                if (container == null) {
                    AALogger.w("Cannot recreate VirtualDisplay at ${width}x${height}: no surface container")
                    return
                }
                // The display renders onto its own ImageReader-backed
                // surface; the car surface is already held by CarDisplay.
                // Use the container's own dpi (not carContext phone metrics).
                carDisplay.create(width, height, container.dpi)
            }
        }
    }
}

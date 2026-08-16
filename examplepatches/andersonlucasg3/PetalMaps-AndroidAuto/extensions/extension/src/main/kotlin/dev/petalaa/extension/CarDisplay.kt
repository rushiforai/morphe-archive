package dev.petalaa.extension

import android.app.Activity
import android.app.Application
import android.content.Context
import android.content.Intent
import android.hardware.display.DisplayManager
import android.hardware.display.VirtualDisplay
import android.os.Build
import android.os.Bundle
import android.util.DisplayMetrics
import android.view.MotionEvent
import android.view.Surface
import androidx.car.app.SurfaceContainer
import java.lang.reflect.Method

/**
 * Helper that manages a [VirtualDisplay] projecting `AutoPetalMapsActivity`
 * onto the [Surface] provided by Android Auto.
 *
 * ## Input injection strategy
 *
 * We use [android.view.View.dispatchTouchEvent] on the decor view of the
 * projected activity. Alternatives considered:
 *
 * | Approach | Verdict |
 * |---|---|
 * | `InputManager.injectInputEvent()` | Requires `INJECT_EVENTS` (signature-level). Not available. |
 * | `Instrumentation.sendPointerSync()` | Requires `android:sharedUserId="android.uid.system"` or instrumented test runner. Not viable. |
 * | `View.dispatchTouchEvent()` | Works in-process, no extra permissions. ✓ Chosen. |
 *
 * The activity is auto-attached via [Application.ActivityLifecycleCallbacks]:
 * when `onActivityCreated` fires for an activity whose display ID matches
 * our VirtualDisplay, we save the reference for touch dispatch.
 *
 * ## Re-center
 *
 * Calls `AutoLocationHelper.v().moveToLocation(mode)` via reflection.
 * The mode is obtained from `mj9.F().i()` (0=3D car, 1=visual car, 2=normal).
 * This is the same call chain the HiCar location button uses.
 */
class CarDisplay(
    private val context: Context,
    private val targetActivityClass: String = TARGET_ACTIVITY_CLASS
) {

    companion object {
        /** Fully-qualified class name of the Petal Maps automotive activity. */
        const val TARGET_ACTIVITY_CLASS = "com.huawei.maps.auto.activity.AutoPetalMapsActivity"

        /** Name passed to DisplayManager.createVirtualDisplay(). */
        private const val VIRTUAL_DISPLAY_NAME = "PetalAA-VirtualDisplay"

        /**
         * VirtualDisplay flags.
         *
         * [DisplayManager.VIRTUAL_DISPLAY_FLAG_OWN_CONTENT_ONLY] (0x8):
         *   The display is private to the owning app. Only activities from
         *   the same UID can be shown. Since our dex runs inside the Petal
         *   Maps process, we are the same UID — this works.
         *
         * [DisplayManager.VIRTUAL_DISPLAY_FLAG_PRESENTATION] (0x2):
         *   Makes the display behave like a Presentation window, which gives
         *   us proper window focus and touch handling.
         *
         * [DisplayManager.VIRTUAL_DISPLAY_FLAG_PUBLIC] (0x1) is NOT used —
         *   unnecessary and a potential security concern.
         */
        private val VIRTUAL_DISPLAY_FLAGS =
            DisplayManager.VIRTUAL_DISPLAY_FLAG_OWN_CONTENT_ONLY or
            DisplayManager.VIRTUAL_DISPLAY_FLAG_PRESENTATION
    }

    // ---- state -----------------------------------------------------------

    private var virtualDisplay: VirtualDisplay? = null
    private var projectedActivity: Activity? = null
    private var displayId: Int = -1
    private var surfaceWidth: Int = 0
    private var surfaceHeight: Int = 0
    private var surfaceDensity: Int = DisplayMetrics.DENSITY_DEFAULT

    /** Most recent touch position — used as anchor for scroll/fling. */
    private var lastTouchX: Float = 0f
    private var lastTouchY: Float = 0f

    /** Whether a gesture stream is in progress (DOWN already sent). */
    private var gestureInProgress: Boolean = false

    /** Cached Application reference for lifecycle callbacks registration. */
    private val app: Application =
        (context.applicationContext as Application)

    /** Our lifecycle callbacks; stored so we can unregister on destroy. */
    private var lifecycleCallbacks: Application.ActivityLifecycleCallbacks? = null

    // ---- VirtualDisplay management ---------------------------------------

    /**
     * Creates a [VirtualDisplay] from a [SurfaceContainer] provided by the
     * Android Auto host. This is the preferred entry point called from
     * [SurfaceCallback.onSurfaceAvailable].
     *
     * Extracts the surface, dimensions, and dpi **from the container**
     * (not from [carContext] phone metrics) and delegates to
     * [create][create(surface,width,height,density)].
     *
     * ## Dimension validation
     *
     * If [SurfaceContainer.getWidth] or [SurfaceContainer.getHeight] return
     * 0 or negative, the container is considered invalid and **no display
     * is created** — we log an error and return `false`.
     *
     * ## Orientation check
     *
     * `AutoPetalMapsActivity` is declared `screenOrientation="landscape"`.
     * We expect `width > height` from the head-unit surface. If the
     * reported dimensions are portrait (`height > width`) we log a warning
     * but still use the container values as-is (no swap / invention).
     *
     * @return `true` if the VirtualDisplay was created and the activity
     *         was successfully requested, `false` otherwise.
     */
    fun create(container: SurfaceContainer): Boolean {
        val surface: Surface = container.surface ?: run {
            AALogger.e("onSurfaceAvailable: surface is null — cannot create VirtualDisplay")
            return false
        }

        val width = container.width
        val height = container.height
        val dpi = container.dpi

        AALogger.i("onSurfaceAvailable: width=$width, height=$height, density=$dpi")

        // Guard: 0 / negative dimensions → bail out
        if (width <= 0 || height <= 0) {
            AALogger.e("Cannot create VirtualDisplay: invalid container dimensions ${width}x${height}")
            return false
        }

        // Orientation check: expect landscape (width > height) for AutoPetalMapsActivity
        if (height > width) {
            AALogger.w(
                "Surface reports portrait dimensions (${width}x${height}) but " +
                "AutoPetalMapsActivity is landscape — using container values as-is"
            )
        }

        return create(surface, width, height, dpi)
    }

    /**
     * Creates a [VirtualDisplay] on [surface] and launches the target
     * activity onto it. Prefer [create(SurfaceContainer)] for initial
     * creation; this overload is used for resize / recreation flows
     * where explicit dimensions are needed (e.g. from
     * [SurfaceCallback.onStableAreaChanged]).
     */
    fun create(surface: Surface, width: Int, height: Int, density: Int): Boolean {
        // Guard: 0 / negative dimensions → bail out
        if (width <= 0 || height <= 0) {
            AALogger.e("Cannot create VirtualDisplay: invalid dimensions ${width}x${height}")
            return false
        }

        destroy() // ensure any previous display + callbacks are released first

        surfaceWidth = width
        surfaceHeight = height
        surfaceDensity = density

        val displayManager = context.getSystemService(Context.DISPLAY_SERVICE) as DisplayManager

        try {
            virtualDisplay = displayManager.createVirtualDisplay(
                VIRTUAL_DISPLAY_NAME,
                width,
                height,
                density,
                surface,
                VIRTUAL_DISPLAY_FLAGS
            )
        } catch (e: Exception) {
            AALogger.e("createVirtualDisplay failed: ${e.message}", e)
            return false
        }

        val vd = virtualDisplay ?: return false
        displayId = vd.display.displayId
        AALogger.i("VirtualDisplay created: id=$displayId, ${width}x${height}, density=$density")

        // Register lifecycle callbacks BEFORE launching the activity so we
        // can catch onActivityCreated and auto-attach it.
        registerLifecycleCallbacks()

        // Launch the activity on the virtual display via `am start` as root.
        // Ordinary apps cannot use ActivityOptions.setLaunchDisplayId on a
        // VirtualDisplay they own (SecurityException: Permission Denial).
        // The `am start --display <id>` approach works because it runs as
        // system server via su.
        val componentName = "${context.packageName}/$targetActivityClass"
        // Flags: NEW_TASK(0x10000000) | MULTIPLE_TASK(0x00080000) | EXCLUDE_FROM_RECENTS(0x00002000)
        val flagsDecimal = 0x10000000 or 0x00080000 or 0x00002000 // 269967936
        val amCmd = "am start -n $componentName --display $displayId -f $flagsDecimal"
        AALogger.i("CarDisplay: launching via root: $amCmd")

        val (exitCode, stdout, stderr) = RootShell.run(amCmd, timeoutSec = 15)
        val rootLaunchOk = (exitCode == 0 || stdout.contains("StartActivity", ignoreCase = true))

        if (rootLaunchOk) {
            AALogger.i("CarDisplay: am start succeeded (exit=$exitCode)")
            AALogger.d("CarDisplay: am start stdout=${stdout.trim()}")
            if (stderr.isNotBlank()) {
                AALogger.d("CarDisplay: am start stderr=${stderr.trim()}")
            }
        } else {
            AALogger.w(
                "CarDisplay: am start failed (exit=$exitCode, out='${stdout.trim()}', " +
                    "err='${stderr.trim()}') — falling back to startActivity()"
            )
            // Fallback: try the original startActivity with launchDisplayId.
            // This will likely fail with SecurityException on VirtualDisplay,
            // but we keep it for completeness (e.g. if the ROM allows it).
            try {
                val intent = Intent(Intent.ACTION_VIEW).apply {
                    setClassName(context.packageName, targetActivityClass)
                    addFlags(
                        Intent.FLAG_ACTIVITY_NEW_TASK or
                        Intent.FLAG_ACTIVITY_MULTIPLE_TASK or
                        Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS
                    )
                }
                val options = android.app.ActivityOptions.makeBasic()
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    options.launchDisplayId = displayId
                }
                @Suppress("DEPRECATION")
                context.startActivity(intent, options.toBundle())
                AALogger.i("CarDisplay: fallback startActivity succeeded")
            } catch (e: SecurityException) {
                AALogger.e("CarDisplay: fallback startActivity blocked: ${e.message}", e)
                destroy()
                return false
            } catch (e: IllegalStateException) {
                AALogger.e("CarDisplay: fallback startActivity error: ${e.message}", e)
                destroy()
                return false
            } catch (e: Exception) {
                AALogger.e("CarDisplay: fallback startActivity failed: ${e.message}", e)
                destroy()
                return false
            }
        }

        return true
    }

    /**
     * Tears down the [VirtualDisplay], unregisters callbacks, and releases
     * the surface. Call from [SurfaceCallback.onSurfaceDestroyed].
     */
    fun destroy() {
        unregisterLifecycleCallbacks()

        val vd = virtualDisplay
        if (vd != null) {
            try {
                vd.release()
                AALogger.i("VirtualDisplay released (id=$displayId)")
            } catch (e: Exception) {
                AALogger.e("Error releasing VirtualDisplay: ${e.message}", e)
            }
            virtualDisplay = null
        }
        projectedActivity = null
        displayId = -1
        gestureInProgress = false
    }

    /**
     * Returns the current display dimensions as [width, height].
     * Used to detect whether a resize is needed.
     */
    fun currentDimensions(): Pair<Int, Int> = surfaceWidth to surfaceHeight

    // ---- Activity lifecycle detection ------------------------------------

    private fun registerLifecycleCallbacks() {
        val targetId = displayId
        val callbacks = object : Application.ActivityLifecycleCallbacks {

            override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle?) {
                val activityDisplayId = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                    activity.display?.displayId ?: -1
                } else {
                    @Suppress("DEPRECATION")
                    activity.windowManager.defaultDisplay?.displayId ?: -1
                }
                AALogger.d("onActivityCreated: ${activity.javaClass.simpleName} on display $activityDisplayId")

                if (activityDisplayId == targetId &&
                    activity.javaClass.name == targetActivityClass) {
                    projectedActivity = activity
                    AALogger.i("Activity auto-attached for touch dispatch: ${activity.javaClass.simpleName}")
                }
            }

            override fun onActivityDestroyed(activity: Activity) {
                if (activity === projectedActivity) {
                    projectedActivity = null
                    gestureInProgress = false
                    AALogger.i("Projected activity destroyed, detached")
                }
            }

            override fun onActivityStarted(activity: Activity) {}
            override fun onActivityResumed(activity: Activity) {}
            override fun onActivityPaused(activity: Activity) {}
            override fun onActivityStopped(activity: Activity) {}
            override fun onActivitySaveInstanceState(activity: Activity, outState: Bundle) {}
        }

        app.registerActivityLifecycleCallbacks(callbacks)
        lifecycleCallbacks = callbacks
        AALogger.i("ActivityLifecycleCallbacks registered for displayId=$targetId")
    }

    private fun unregisterLifecycleCallbacks() {
        val callbacks = lifecycleCallbacks ?: return
        try {
            app.unregisterActivityLifecycleCallbacks(callbacks)
            AALogger.d("ActivityLifecycleCallbacks unregistered")
        } catch (e: Exception) {
            AALogger.w("Failed to unregister lifecycle callbacks: ${e.message}")
        }
        lifecycleCallbacks = null
    }

    // ---- MotionEvent dispatch helpers ------------------------------------

    /**
     * Low-level dispatch — sends [event] to the projected activity's decor
     * view. Silently dropped if the activity hasn't been attached yet.
     */
    private fun dispatchToActivity(event: MotionEvent) {
        projectedActivity?.window?.decorView?.dispatchTouchEvent(event)
    }

    // -- click -------------------------------------------------------------

    fun dispatchClick(x: Float, y: Float) {
        finishGestureStream()
        val now = System.currentTimeMillis()
        lastTouchX = x
        lastTouchY = y

        val down = MotionEvent.obtain(now, now, MotionEvent.ACTION_DOWN, x, y, 0)
        dispatchToActivity(down)
        down.recycle()

        val up = MotionEvent.obtain(now, now + 50, MotionEvent.ACTION_UP, x, y, 0)
        dispatchToActivity(up)
        up.recycle()
    }

    // -- scroll (touch drag) -----------------------------------------------

    fun dispatchScroll(distanceX: Float, distanceY: Float) {
        ensureGestureDown()
        val now = System.currentTimeMillis()
        val x = (lastTouchX + distanceX).coerceIn(0f, surfaceWidth.toFloat())
        val y = (lastTouchY + distanceY).coerceIn(0f, surfaceHeight.toFloat())

        val move = MotionEvent.obtain(now, now, MotionEvent.ACTION_MOVE, x, y, 0)
        dispatchToActivity(move)
        move.recycle()

        lastTouchX = x
        lastTouchY = y
    }

    // -- fling -------------------------------------------------------------

    fun dispatchFling(velocityX: Float, velocityY: Float) {
        ensureGestureDown()
        // Emit a series of MOVE events over ~150ms to simulate fling decay
        val now = System.currentTimeMillis()
        val steps = 3
        val dt = 50L // ms per step
        for (i in 1..steps) {
            val progress = i.toFloat() / steps
            val dx = velocityX * (dt * progress / 1000f)
            val dy = velocityY * (dt * progress / 1000f)
            val x = (lastTouchX + dx).coerceIn(0f, surfaceWidth.toFloat())
            val y = (lastTouchY + dy).coerceIn(0f, surfaceHeight.toFloat())

            val move = MotionEvent.obtain(
                now + i * dt, now + i * dt, MotionEvent.ACTION_MOVE, x, y, 0
            )
            dispatchToActivity(move)
            move.recycle()
        }

        // End gesture — fling is a discrete event, so finish the stream
        val endX = lastTouchX + velocityX * (steps * dt / 1000f)
        val endY = lastTouchY + velocityY * (steps * dt / 1000f)
        lastTouchX = endX.coerceIn(0f, surfaceWidth.toFloat())
        lastTouchY = endY.coerceIn(0f, surfaceHeight.toFloat())
        finishGestureStream()
    }

    // -- pinch-to-zoom -----------------------------------------------------

    /**
     * Synthesizes a pinch-to-zoom gesture with two pointers.
     * [scaleFactor] > 1 → zoom in (pointers move apart)
     * [scaleFactor] < 1 → zoom out (pointers move together)
     * [centerX]/[centerY] is the center of the pinch.
     */
    fun dispatchScale(scaleFactor: Float, centerX: Float, centerY: Float) {
        finishGestureStream()
        val now = System.currentTimeMillis()
        val span = 100f // base span in pixels
        val newSpan = (span * scaleFactor).coerceIn(20f, surfaceWidth.toFloat() / 2f)

        val pointerCount = 2

        val pointerProperties = arrayOf(
            MotionEvent.PointerProperties().apply {
                id = 0
                toolType = MotionEvent.TOOL_TYPE_FINGER
            },
            MotionEvent.PointerProperties().apply {
                id = 1
                toolType = MotionEvent.TOOL_TYPE_FINGER
            }
        )

        // ACTION_DOWN (first pointer) + ACTION_POINTER_DOWN (second pointer)
        val downCoords = arrayOf(
            MotionEvent.PointerCoords().apply {
                x = centerX - span / 2
                y = centerY
                pressure = 1f
                size = 1f
            },
            MotionEvent.PointerCoords().apply {
                x = centerX + span / 2
                y = centerY
                pressure = 1f
                size = 1f
            }
        )

        val downEvent = MotionEvent.obtain(
            now, now,
            MotionEvent.ACTION_POINTER_DOWN or (1 shl MotionEvent.ACTION_POINTER_INDEX_SHIFT),
            pointerCount, pointerProperties, downCoords,
            0, 0, 1f, 1f, 0, 0, 0, 0
        )
        dispatchToActivity(downEvent)
        downEvent.recycle()

        // ACTION_MOVE (scale)
        val moveCoords = arrayOf(
            MotionEvent.PointerCoords().apply {
                x = centerX - newSpan / 2
                y = centerY
                pressure = 1f
                size = 1f
            },
            MotionEvent.PointerCoords().apply {
                x = centerX + newSpan / 2
                y = centerY
                pressure = 1f
                size = 1f
            }
        )

        val moveEvent = MotionEvent.obtain(
            now, now + 30, MotionEvent.ACTION_MOVE,
            pointerCount, pointerProperties, moveCoords,
            0, 0, 1f, 1f, 0, 0, 0, 0
        )
        dispatchToActivity(moveEvent)
        moveEvent.recycle()

        // ACTION_UP
        val upEvent = MotionEvent.obtain(
            now, now + 60, MotionEvent.ACTION_UP,
            1, pointerProperties, arrayOf(moveCoords[0]),
            0, 0, 1f, 1f, 0, 0, 0, 0
        )
        dispatchToActivity(upEvent)
        upEvent.recycle()
    }

    // -- gesture stream helpers --------------------------------------------

    /**
     * If no gesture stream is active, emit ACTION_DOWN at the last known
     * touch position to start one.
     */
    private fun ensureGestureDown() {
        if (gestureInProgress) return
        val now = System.currentTimeMillis()
        val down = MotionEvent.obtain(
            now, now, MotionEvent.ACTION_DOWN, lastTouchX, lastTouchY, 0
        )
        dispatchToActivity(down)
        down.recycle()
        gestureInProgress = true
    }

    /**
     * End any in-progress gesture stream by emitting ACTION_UP.
     */
    private fun finishGestureStream() {
        if (!gestureInProgress) return
        val now = System.currentTimeMillis()
        val up = MotionEvent.obtain(
            now, now, MotionEvent.ACTION_UP, lastTouchX, lastTouchY, 0
        )
        dispatchToActivity(up)
        up.recycle()
        gestureInProgress = false
    }

    // ---- ActionStrip button handlers -------------------------------------

    /** Notify that a zoom-in button was pressed. */
    fun zoomIn() {
        val cx = surfaceWidth / 2f
        val cy = surfaceHeight / 2f
        dispatchScale(1.5f, cx, cy)
    }

    /** Notify that a zoom-out button was pressed. */
    fun zoomOut() {
        val cx = surfaceWidth / 2f
        val cy = surfaceHeight / 2f
        dispatchScale(0.67f, cx, cy)
    }

    /**
     * Re-center the map on the user's current location.
     *
     * Calls `AutoLocationHelper.v().moveToLocation(mode)` via reflection,
     * replicating the HiCar location-button flow. The visual mode is read
     * from `mj9.F().i()` (0=3D car heading, 1=visual car, 2=normal).
     *
     * If reflection fails (class/method not found), falls back to a
     * center-click and logs a warning.
     */
    @Suppress("UNCHECKED_CAST")
    fun reCenter() {
        try {
            // Read the current visual mode: mj9.F().i()
            val mj9Class = Class.forName("defpackage.mj9")
            val fMethod: Method = mj9Class.getMethod("F")
            val mj9Instance = fMethod.invoke(null)
            val iMethod: Method = mj9Class.getMethod("i")
            val mode = (iMethod.invoke(mj9Instance) as Int?) ?: 2

            // Call AutoLocationHelper.v().moveToLocation(mode)
            val autoLocClass = Class.forName("com.huawei.maps.auto.location.AutoLocationHelper")
            val vMethod: Method = autoLocClass.getMethod("v")
            val locInstance = vMethod.invoke(null)
            val moveMethod: Method = autoLocClass.getMethod("moveToLocation", Int::class.javaPrimitiveType)
            moveMethod.invoke(locInstance, mode)

            AALogger.i("reCenter: called AutoLocationHelper.v().moveToLocation($mode)")
        } catch (e: Exception) {
            AALogger.w("reCenter: reflection failed (${e.message}), falling back to center-click")
            // Fallback: tap the center of the screen
            val cx = surfaceWidth / 2f
            val cy = surfaceHeight / 2f
            dispatchClick(cx, cy)
        }
    }

    }

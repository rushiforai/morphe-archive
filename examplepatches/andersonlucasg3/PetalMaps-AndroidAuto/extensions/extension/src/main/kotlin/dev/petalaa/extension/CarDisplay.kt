package dev.petalaa.extension

import android.app.Activity
import android.app.ActivityManager
import android.app.Application
import android.content.Context
import android.content.Intent
import android.graphics.Matrix
import android.hardware.display.DisplayManager
import android.hardware.display.VirtualDisplay
import android.os.Build
import android.os.Bundle
import android.util.DisplayMetrics
import android.view.Display
import android.view.MotionEvent
import android.view.Surface
import android.view.View
import androidx.car.app.SurfaceContainer

/**
 * Helper that manages a [VirtualDisplay] projecting `PetalMapsActivity`
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
 * On `onActivityResumed`, the attached activity is forced into
 * `SCREEN_ORIENTATION_SENSOR_LANDSCAPE` (once per activity instance) to
 * avoid a portrait/letterboxed window, and its live bounds are logged
 * ~2s later for remote letterbox diagnosis.
 */
class CarDisplay(
    private val context: Context,
    private val targetActivityClass: String = TARGET_ACTIVITY_CLASS
) {

    companion object {
        /** Fully-qualified class name of the Petal Maps activity. */
        const val TARGET_ACTIVITY_CLASS = "com.huawei.maps.app.petalmaps.PetalMapsActivity"

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

        /** Delay before logging post-orientation window bounds for diagnosis. */
        private const val ORIENTATION_BOUNDS_LOG_DELAY_MS = 2_000L
    }

    // ---- state -----------------------------------------------------------

    private var virtualDisplay: VirtualDisplay? = null
    private var projectedActivity: Activity? = null
    private var displayId: Int = -1
    private var surfaceWidth: Int = 0
    private var surfaceHeight: Int = 0
    private var surfaceDensity: Int = DisplayMetrics.DENSITY_DEFAULT

    /**
     * Last known valid landscape dimensions (width > height).
     * Used as a fallback when the host reports transient portrait dims
     * (e.g. 579x804) that would cause letterboxing on a landscape-only activity.
     */
    private var lastLandscapeW: Int = 0
    private var lastLandscapeH: Int = 0

    /** Most recent touch position — used as anchor for scroll/fling. */
    private var lastTouchX: Float = 0f
    private var lastTouchY: Float = 0f

    /** Whether a gesture stream is in progress (DOWN already sent). */
    private var gestureInProgress: Boolean = false

    /** Whether the scroll anchor (live window center) has been logged once. */
    private var scrollAnchorLogged: Boolean = false

    /** Cached Application reference for lifecycle callbacks registration. */
    private val app: Application =
        (context.applicationContext as Application)

    /** Our lifecycle callbacks; stored so we can unregister on destroy. */
    private var lifecycleCallbacks: Application.ActivityLifecycleCallbacks? = null

    /** Activity we already forced landscape on — applied once per instance. */
    private var orientationForcedOn: Activity? = null

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
     * ## Orientation check (portrait guard)
     *
     * The projected activity is expected to run in landscape; the host may
     * transiently report portrait dimensions (e.g. 579x804)
     * during initialization or rotation, which causes letterboxing.
     *
     * - If dims are landscape (width > height): create/update normally,
     *   and remember as the last valid landscape.
     * - If dims are portrait and we have a previous landscape: use the
     *   last known landscape dimensions instead (avoid letterbox).
     * - If dims are portrait and we have NO previous landscape: **do not
     *   create the display** — wait for the next stable area update that
     *   reports landscape. This keeps the template buttons visible while
     *   the map stays out until we have correct dimensions.
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

        val isLandscape = width > height

        if (isLandscape) {
            // Normal case: landscape dims — use them and remember.
            lastLandscapeW = width
            lastLandscapeH = height
            return create(surface, width, height, dpi)
        }

        // Portrait reported — host sent transient dims (e.g. 579x804).
        if (lastLandscapeW > 0 && lastLandscapeH > 0) {
            // We have a previous valid landscape — use it to avoid letterbox.
            AALogger.w(
                "Surface reports portrait (${width}x${height}) but we have a valid " +
                "landscape (${lastLandscapeW}x${lastLandscapeH}) — using last landscape"
            )
            return create(surface, lastLandscapeW, lastLandscapeH, dpi)
        }

        // No previous landscape known — wait for the host to send proper dims.
        AALogger.w(
            "Surface reports portrait (${width}x${height}) with no prior landscape — " +
            "skipping VirtualDisplay creation (waiting for stable landscape dims)"
        )
        return false
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

        // Remember valid landscape dims for fallback on transient portrait reports.
        if (width > height) {
            lastLandscapeW = width
            lastLandscapeH = height
        }

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
        AALogger.shareableCopy()

        // Register lifecycle callbacks BEFORE launching the activity so we
        // can catch onActivityCreated and auto-attach it.
        registerLifecycleCallbacks()

        // If the activity is already attached and alive on the current
        // display, skip the am start — with MULTIPLE_TASK removed a relaunch
        // would just reuse the same task anyway.
        val attached = projectedActivity
        if (attached != null && !attached.isFinishing && !attached.isDestroyed) {
            AALogger.i("CarDisplay: activity already attached on display $displayId — skipping am start")
            AALogger.shareableCopy()
            return true
        }

        // A previous creation may leave a task with stale (portrait/
        // letterboxed) bounds that am start would inherit — remove it so
        // the relaunch starts fresh (best-effort).
        removeStaleTask()

        // Launch the activity on the virtual display via `am start` as root.
        // Ordinary apps cannot use ActivityOptions.setLaunchDisplayId on a
        // VirtualDisplay they own (SecurityException: Permission Denial).
        // The `am start --display <id>` approach works because it runs as
        // system server via su.
        val componentName = "${context.packageName}/$targetActivityClass"
        // Flags: NEW_TASK(0x10000000) | EXCLUDE_FROM_RECENTS(0x00002000)
        // MULTIPLE_TASK was removed: each relaunch used to spawn a NEW task,
        // leaving orphan windows with inherited/letterboxed bounds.
        val flagsDecimal = 0x10000000 or 0x00002000 // 268443648
        // --windowingMode 1 = WINDOWING_MODE_FULLSCREEN: force the window
        // into fullscreen bounds on the display instead of inheriting stale
        // bounds from a reused task.
        val amCmd = "am start -n $componentName --display $displayId -f $flagsDecimal --windowingMode 1"
        AALogger.i("CarDisplay: launching via root: $amCmd")

        val (exitCode, stdout, stderr) = RootShell.run(amCmd, timeoutSec = 15)
        val rootLaunchOk = (exitCode == 0 || stdout.contains("StartActivity", ignoreCase = true))

        if (rootLaunchOk) {
            AALogger.i("CarDisplay: am start succeeded (exit=$exitCode)")
            AALogger.d("CarDisplay: am start stdout=${stdout.trim()}")
            if (stderr.isNotBlank()) {
                AALogger.d("CarDisplay: am start stderr=${stderr.trim()}")
            }
            AALogger.shareableCopy()
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
                        Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS
                    )
                }
                val options = android.app.ActivityOptions.makeBasic()
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    options.launchDisplayId = displayId
                }
                // Note: ActivityOptions.setLaunchWindowingMode is @hide —
                // not exposed to apps. The fullscreen windowing mode is
                // only applied via `--windowingMode 1` in the am command.
                @Suppress("DEPRECATION")
                context.startActivity(intent, options.toBundle())
                AALogger.i("CarDisplay: fallback startActivity succeeded")
            } catch (e: SecurityException) {
                AALogger.e("CarDisplay: fallback startActivity blocked: ${e.message}", e)
                AALogger.shareableCopy()
                destroy()
                return false
            } catch (e: IllegalStateException) {
                AALogger.e("CarDisplay: fallback startActivity error: ${e.message}", e)
                AALogger.shareableCopy()
                destroy()
                return false
            } catch (e: Exception) {
                AALogger.e("CarDisplay: fallback startActivity failed: ${e.message}", e)
                AALogger.shareableCopy()
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
        // Finish the projected activity BEFORE releasing the display so no
        // orphan windows are left on a dead display.
        val activity = projectedActivity
        if (activity != null) {
            try {
                AALogger.i("Finishing projected activity before destroying display (id=$displayId)")
                activity.finish()
            } catch (e: Exception) {
                AALogger.w("Failed to finish projected activity: ${e.message}")
            }
            projectedActivity = null
            orientationForcedOn = null
        }

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
        displayId = -1
        gestureInProgress = false
        scrollAnchorLogged = false
    }

    /**
     * Returns the current display dimensions as [width, height].
     * Used to detect whether a resize is needed.
     */
    fun currentDimensions(): Pair<Int, Int> = surfaceWidth to surfaceHeight

    // ---- task cleanup / window bounds -------------------------------------

    /**
     * Best-effort removal of any pre-existing task for the target activity.
     *
     * A previous creation may leave a task whose window bounds are stale
     * (e.g. portrait/letterboxed). `am start` would reuse that task and
     * inherit its bounds, so we remove it before relaunching.
     *
     * Uses [ActivityManager.getAppTasks]: the task belongs to our own UID
     * (we run inside the Petal Maps process), so no permission is needed.
     * Deprecated since API 29 but still functional for own-app tasks.
     * Identifying the task's base component requires `AppTask.getTaskInfo`
     * (API 29+); on older APIs we can't identify it and skip removal.
     */
    private fun removeStaleTask() {
        try {
            val am = context.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
            @Suppress("DEPRECATION")
            val tasks = am.appTasks
            if (tasks.isNullOrEmpty()) return
            for (task in tasks) {
                val baseClass = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    task.taskInfo?.baseActivity?.className
                } else null
                if (baseClass == targetActivityClass) {
                    AALogger.w(
                        "CarDisplay: removing stale task for $targetActivityClass " +
                            "(would inherit old window bounds)"
                    )
                    task.finishAndRemoveTask()
                }
            }
        } catch (e: Exception) {
            AALogger.w("CarDisplay: removeStaleTask failed: ${e.message}")
        }
    }

    /**
     * Logs the live window bounds in display space as
     * `[left, top, right, bottom] (WxH)`. Best-effort: at attach time the
     * window may not be fully laid out yet, so values can be provisional.
     */
    private fun logWindowBounds(activity: Activity, tag: String) {
        try {
            val decor = activity.window?.decorView ?: return
            val loc = IntArray(2)
            decor.getLocationOnScreen(loc)
            AALogger.i(
                "CarDisplay: $tag window bounds=[${loc[0]},${loc[1]}," +
                    "${loc[0] + decor.width},${loc[1] + decor.height}] " +
                    "(${decor.width}x${decor.height})"
            )
        } catch (e: Exception) {
            AALogger.w("CarDisplay: failed to read window bounds ($tag): ${e.message}")
        }
    }

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

                // Attach ONLY if the activity lives on the CURRENT live
                // display — never attach an instance from a destroyed one.
                if (displayId != -1 && virtualDisplay != null &&
                    activityDisplayId == displayId &&
                    activity.javaClass.name == targetActivityClass) {
                    projectedActivity = activity
                    AALogger.i("Activity auto-attached for touch dispatch: ${activity.javaClass.simpleName} on display $activityDisplayId")
                    logWindowBounds(activity, "launch")
                    AALogger.shareableCopy()
                }
            }

            override fun onActivityDestroyed(activity: Activity) {
                if (activity === projectedActivity) {
                    projectedActivity = null
                    gestureInProgress = false
                    AALogger.i("Projected activity destroyed, detached")
                }
                if (activity === orientationForcedOn) {
                    orientationForcedOn = null
                }
            }

            override fun onActivityStarted(activity: Activity) {}
            override fun onActivityResumed(activity: Activity) {
                // Attached instance only, and once per activity instance —
                // re-applying on every resume would restart the activity.
                if (activity !== projectedActivity || orientationForcedOn === activity) return
                orientationForcedOn = activity

                val before = activity.requestedOrientation
                AALogger.i(
                    "CarDisplay: forcing landscape on ${activity.javaClass.simpleName} " +
                        "(requestedOrientation=$before)"
                )
                activity.requestedOrientation =
                    android.content.pm.ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE
                AALogger.i(
                    "CarDisplay: requestedOrientation=${activity.requestedOrientation} " +
                        "(SCREEN_ORIENTATION_SENSOR_LANDSCAPE=" +
                        "${android.content.pm.ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE})"
                )
                AALogger.shareableCopy()

                // After ~2s the window has (re)laid out — log live bounds to
                // diagnose letterboxing remotely.
                activity.window?.decorView?.postDelayed(
                    {
                        if (projectedActivity === activity) {
                            logWindowBounds(activity, "post-orientation")
                            AALogger.shareableCopy()
                        }
                    },
                    ORIENTATION_BOUNDS_LOG_DELAY_MS
                )
            }
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
     *
     * ## Coordinate transform
     *
     * The host sends touch coordinates in **display space**, but
     * `View.dispatchTouchEvent` expects **window-local** coordinates. The
     * window can be offset on the display (e.g. letterboxing) and/or
     * rotated (`Display.getRotation()` != 0), so before dispatch every
     * pointer is mapped with an affine transform (via [Matrix]):
     *
     * 1. Subtract the window's on-screen location
     *    ([android.view.View.getLocationOnScreen]) from the event
     *    coordinates — this compensates the window offset.
     * 2. If the display reports rotation, apply the inverse rotation using
     *    the display's current real dimensions:
     *    - `ROTATION_90`  (1): (x, y) → (y, w-1-x)
     *    - `ROTATION_180` (2): (x, y) → (w-1-x, h-1-y)
     *    - `ROTATION_270` (3): (x, y) → (h-1-y, x)
     *
     * The transform is applied to **every pointer** of the event, so
     * multi-pointer gestures (pinch) are covered uniformly.
     */
    private fun dispatchToActivity(event: MotionEvent) {
        val activity = projectedActivity ?: return
        // Never dispatch touch to an instance living on a destroyed display.
        if (displayId == -1 || virtualDisplay == null) return
        val activityDisplayId = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            activity.display?.displayId ?: -1
        } else {
            @Suppress("DEPRECATION")
            activity.windowManager.defaultDisplay?.displayId ?: -1
        }
        if (activityDisplayId != displayId) {
            AALogger.w("dispatchToActivity: activity on stale display $activityDisplayId (current=$displayId) — detaching and dropping event")
            projectedActivity = null
            gestureInProgress = false
            return
        }

        val decor: View = activity.window?.decorView ?: return
        val display: Display = decor.display ?: run {
            decor.dispatchTouchEvent(event)
            return
        }

        // Window offset in display space (letterboxing shifts the window).
        val loc = IntArray(2)
        decor.getLocationOnScreen(loc)
        val rotation = display.rotation
        val rotated = rotation != Surface.ROTATION_0

        // Log transform parameters once per gesture (first event only),
        // to avoid spamming the log on every MOVE.
        when (event.actionMasked) {
            MotionEvent.ACTION_DOWN, MotionEvent.ACTION_POINTER_DOWN -> {
                if (loc[0] != 0 || loc[1] != 0) {
                    AALogger.d("CarDisplay: window offset=(${loc[0]},${loc[1]}) — compensating input coordinates")
                }
                if (rotated) {
                    AALogger.w("CarDisplay: display rotation=$rotation — applying inverse rotation to touch input")
                }
            }
        }

        // Fast path: identity transform.
        if (!rotated && loc[0] == 0 && loc[1] == 0) {
            decor.dispatchTouchEvent(event)
            return
        }

        val matrix = Matrix()
        if (rotated) {
            val metrics = DisplayMetrics()
            @Suppress("DEPRECATION")
            display.getRealMetrics(metrics)
            val w = metrics.widthPixels
            val h = metrics.heightPixels
            when (rotation) {
                Surface.ROTATION_90 -> {
                    // (x, y) → (y, w-1-x), composed with the window offset.
                    matrix.setRotate(-90f)
                    matrix.postTranslate(-loc[1].toFloat(), (w - 1 + loc[0]).toFloat())
                }
                Surface.ROTATION_180 -> {
                    // (x, y) → (w-1-x, h-1-y), composed with the window offset.
                    matrix.setRotate(180f)
                    matrix.postTranslate((w - 1 + loc[0]).toFloat(), (h - 1 + loc[1]).toFloat())
                }
                Surface.ROTATION_270 -> {
                    // (x, y) → (h-1-y, x), composed with the window offset.
                    matrix.setRotate(90f)
                    matrix.postTranslate((h - 1 + loc[1]).toFloat(), -loc[0].toFloat())
                }
            }
        } else {
            matrix.postTranslate(-loc[0].toFloat(), -loc[1].toFloat())
        }
        event.transform(matrix)
        decor.dispatchTouchEvent(event)
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
     * If no gesture stream is active, emit ACTION_DOWN to start one.
     *
     * The anchor is the **center of the live window in display space**,
     * not the last click position: the host sends only deltas for
     * scroll/fling, and `lastTouchX/Y` may be stale or lie outside the
     * (offset) window — the initial DOWN would then land off-window and
     * the map never drags.
     *
     * The center is `getLocationOnScreen` + half the decor size, which is
     * already display space (window → display is the inverse of the
     * dispatch transform; the rectangle center is invariant under the
     * window rotation), so the dispatch transform still applies exactly
     * once — it is NOT applied here.
     */
    private fun ensureGestureDown() {
        if (gestureInProgress) return

        val activity = projectedActivity
        val decor = activity?.window?.decorView
        if (decor != null) {
            val loc = IntArray(2)
            decor.getLocationOnScreen(loc)
            lastTouchX = (loc[0] + decor.width / 2).toFloat()
            lastTouchY = (loc[1] + decor.height / 2).toFloat()

            // Log bounds + anchor once per display lifecycle (first scroll),
            // not per event — MOVE events would spam the log.
            if (!scrollAnchorLogged) {
                scrollAnchorLogged = true
                AALogger.i(
                    "CarDisplay: scroll anchor at window center=($lastTouchX,$lastTouchY) " +
                        "bounds=[${loc[0]},${loc[1]},${loc[0] + decor.width},${loc[1] + decor.height}] " +
                        "(${decor.width}x${decor.height})"
                )
            }
        }

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
}

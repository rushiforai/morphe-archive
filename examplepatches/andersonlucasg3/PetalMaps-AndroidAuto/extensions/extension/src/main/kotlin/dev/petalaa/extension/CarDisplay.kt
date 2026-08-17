package dev.petalaa.extension

import android.annotation.SuppressLint
import android.app.Activity
import android.app.ActivityManager
import android.app.Application
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.ColorSpace
import android.graphics.Matrix
import android.graphics.Paint
import android.graphics.PixelFormat
import android.graphics.Rect
import android.graphics.RectF
import android.hardware.HardwareBuffer
import android.hardware.display.DisplayManager
import android.hardware.display.VirtualDisplay
import android.media.ImageReader
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.HandlerThread
import android.os.SystemClock
import android.util.DisplayMetrics
import android.view.Display
import android.view.MotionEvent
import android.view.PixelCopy
import android.view.Surface
import android.view.View
import androidx.annotation.RequiresApi
import androidx.car.app.SurfaceContainer
import java.nio.ByteBuffer
import java.lang.reflect.Method
import java.util.concurrent.atomic.AtomicReference
import kotlin.math.max

/**
 * Helper that manages a [VirtualDisplay] projecting `PetalMapsActivity`
 * and renders it onto the [Surface] provided by Android Auto.
 *
 * ## Rendering pipeline
 *
 * The VirtualDisplay is decoupled from the car surface: it renders onto a
 * private [ImageReader]-backed [Surface] (frames discarded — the reader
 * only keeps the display's buffer queue drained), while a dedicated
 * capture thread grabs the composited virtual display every ~500ms.
 * Primary path: in-process capture via hidden framework APIs unlocked at
 * runtime by the companion LSPosed module (`ScreenCapture` via
 * `IWindowManager.captureDisplay` on API 34+, `SurfaceControl.screenshot`
 * below — raw RGBA, includes SurfaceView/GL layers that window
 * [PixelCopy] misses). Fallbacks, in order: root `screencap -d`, then
 * window PixelCopy. The latest frame is drawn onto the car surface with a
 * crop-to-fill (cover) transform, so portrait-letterboxed window content
 * fills the whole landscape car surface. On capture failure the last
 * valid frame stays on screen (never black).
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

        /** Fixed interval between PixelCopy capture iterations. */
        private const val CAPTURE_INTERVAL_MS = 500L

        /** Minimum interval between rate-limited capture-failure warnings. */
        private const val COPY_FAIL_LOG_INTERVAL_MS = 30_000L

        /** Name of the dedicated capture thread. */
        private const val CAPTURE_THREAD_NAME = "PetalAA-Capture"

        /** Retry the screencap path every N iterations while it is failing. */
        private const val SCREENCAP_RETRY_EVERY = 10
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

    // ---- Decoupled rendering state ----------------------------------------

    /** Car surface (draw target) from the last SurfaceContainer. */
    private var carSurface: Surface? = null

    /** Dimensions of the car surface — the draw destination. */
    private var carWidth: Int = 0
    private var carHeight: Int = 0

    /**
     * Private ImageReader (frame sink) + its Surface — the VirtualDisplay
     * renders onto this, never onto the car surface. Arriving frames are
     * discarded immediately; consumption happens via the in-process
     * capture paths (reflection first, then root screencap, then window
     * PixelCopy). The Surface belongs to the ImageReader — it must NOT be
     * released manually, [ImageReader.close] does it.
     */
    private var imageReader: ImageReader? = null
    private var virtualSurface: Surface? = null

    /** Capture thread + handler; PixelCopy and the surface draw run here. */
    private var captureThread: HandlerThread? = null
    private var captureHandler: Handler? = null

    /** Bitmap being filled by the in-flight PixelCopy (capture thread only). */
    private var captureBitmap: Bitmap? = null
    private var captureBitmapW: Int = 0
    private var captureBitmapH: Int = 0
    private var captureInFlight: Boolean = false

    /** Last successfully copied frame — kept on screen when capture fails. */
    private val lastFrame = AtomicReference<Bitmap?>()

    /** Result-state tracking so PixelCopy outcomes are logged only on change. */
    private var lastCopySuccess: Boolean = true
    private var lastCopyFailLogAt: Long = 0L
    private var firstFrameDrawn: Boolean = false

    // ---- Screencap (root) capture state -----------------------------------

    /** Consecutive screencap failures; when > 0 the PixelCopy path is active. */
    private var screencapConsecutiveFailures: Int = 0

    /** Capture loop iteration counter — drives the periodic screencap retry. */
    private var captureIteration: Long = 0L

    /** Active capture path ("screencap" / "pixelcopy") — logged on change. */
    private var activeCapturePath: String? = null
    private var lastPathLogAt: Long = 0L

    /** Screencap timing stats — logged on the 1st frame and every 30s. */
    private var screencapCount: Long = 0L
    private var screencapTotalMs: Long = 0L
    private var lastScreencapStatLogAt: Long = 0L

    /** Rate-limited screencap failure log. */
    private var lastScreencapFailLogAt: Long = 0L

    /** Last raw dims that differed from the display — logged once per change. */
    private var lastRawW: Int = 0
    private var lastRawH: Int = 0

    // ---- In-process (reflection) capture state -----------------------------

    /**
     * Resolved reflection bridge (method handles cached). Null until the
     * first capture attempt; once resolved it stays valid for the process
     * lifetime, even across display re-creations.
     */
    private var reflectionBridge: InProcessCapture? = null

    /** Consecutive in-process capture failures; when > 0 it is retried periodically. */
    private var reflectionConsecutiveFailures: Int = 0

    /** In-process capture timing stats — logged on the 1st frame and every 30s. */
    private var reflectionCount: Long = 0L
    private var reflectionTotalMs: Long = 0L
    private var lastReflectionStatLogAt: Long = 0L

    /** Rate-limited in-process capture failure log. */
    private var lastReflectionFailLogAt: Long = 0L

    /**
     * Crop-to-fill mapping of the last drawn frame (capture thread writes,
     * main thread reads for input). A car-surface point (x, y) maps to the
     * window point (x / cropScale + cropSrcX, y / cropScale + cropSrcY).
     */
    @Volatile private var cropScale: Float = 1f
    @Volatile private var cropSrcX: Int = 0
    @Volatile private var cropSrcY: Int = 0

    /** Whether the input crop mapping has been logged (once per display). */
    private var inputMappingLogged: Boolean = false

    /** Last logged draw transform — the draw log fires only on change. */
    private var lastDrawScale: Float = -1f
    private var lastDrawSrcX: Int = -1
    private var lastDrawSrcY: Int = -1
    private var lastDrawDstW: Int = -1
    private var lastDrawDstH: Int = -1

    /** Paint for the frame draw — bilinear filtering for scaling. */
    private val drawPaint = Paint(Paint.FILTER_BITMAP_FLAG)

    // ---- VirtualDisplay management ---------------------------------------

    /**
     * Creates a [VirtualDisplay] from a [SurfaceContainer] provided by the
     * Android Auto host. This is the preferred entry point called from
     * [SurfaceCallback.onSurfaceAvailable].
     *
     * Extracts the surface, dimensions, and dpi **from the container**
     * (not from [carContext] phone metrics). The container's surface becomes
     * the **draw target** of the capture loop; the VirtualDisplay itself
     * renders onto a private ImageReader-backed surface (see
     * [createDisplay]).
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
            AALogger.e("onSurfaceAvailable: surface is null — nothing to draw the map onto")
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
            carSurface = surface
            carWidth = width
            carHeight = height
            return createDisplay(width, height, dpi)
        }

        // Portrait reported — host sent transient dims (e.g. 579x804).
        if (lastLandscapeW > 0 && lastLandscapeH > 0) {
            // We have a previous valid landscape — use it to avoid letterbox.
            AALogger.w(
                "Surface reports portrait (${width}x${height}) but we have a valid " +
                "landscape (${lastLandscapeW}x${lastLandscapeH}) — using last landscape"
            )
            // The car surface keeps its real dims for the draw dst; only the
            // VirtualDisplay uses the remembered landscape dims.
            carSurface = surface
            carWidth = width
            carHeight = height
            return createDisplay(lastLandscapeW, lastLandscapeH, dpi)
        }

        // No previous landscape known — wait for the host to send proper dims.
        AALogger.w(
            "Surface reports portrait (${width}x${height}) with no prior landscape — " +
            "skipping VirtualDisplay creation (waiting for stable landscape dims)"
        )
        return false
    }

    /**
     * Creates a [VirtualDisplay] at explicit dimensions and launches the
     * target activity onto it. Used for resize / recreation flows (e.g.
     * from [SurfaceCallback.onStableAreaChanged]) — the car surface is
     * already held from the last [SurfaceContainer].
     */
    fun create(width: Int, height: Int, density: Int): Boolean {
        // Guard: 0 / negative dimensions → bail out
        if (width <= 0 || height <= 0) {
            AALogger.e("Cannot create VirtualDisplay: invalid dimensions ${width}x${height}")
            return false
        }
        // Remember valid landscape dims for fallback on transient portrait reports.
        if (width > height) {
            lastLandscapeW = width
            lastLandscapeH = height
        }
        return createDisplay(width, height, density)
    }

    /**
     * Creates the [VirtualDisplay] on a private ImageReader-backed
     * [Surface] — decoupled from the car surface — and launches the target
     * activity onto it via `am start` as root. The capture loop hands the
     * frames over to the car surface.
     */
    private fun createDisplay(width: Int, height: Int, density: Int): Boolean {
        destroy() // ensure any previous display + callbacks are released first

        surfaceWidth = width
        surfaceHeight = height
        surfaceDensity = density

        // Decoupled render target: the display renders onto an ImageReader-
        // backed surface (never the car surface). The reader discards every
        // arriving frame, keeping the display's buffer queue drained so the
        // compositor never stalls; the real consumption is the capture
        // pipeline (in-process reflection capture → screencap → PixelCopy).
        val reader = ImageReader.newInstance(width, height, PixelFormat.RGBA_8888, 2)
        reader.setOnImageAvailableListener(
            { r ->
                try {
                    r.acquireLatestImage()?.close()
                } catch (e: Exception) {
                    AALogger.w("CarDisplay: image discard failed: ${e.message}")
                }
            },
            null
        )
        val ownSurface = reader.surface

        val displayManager = context.getSystemService(Context.DISPLAY_SERVICE) as DisplayManager

        try {
            virtualDisplay = displayManager.createVirtualDisplay(
                VIRTUAL_DISPLAY_NAME,
                width,
                height,
                density,
                ownSurface,
                VIRTUAL_DISPLAY_FLAGS
            )
        } catch (e: Exception) {
            AALogger.e("createVirtualDisplay failed: ${e.message}", e)
            reader.close()
            return false
        }

        val vd = virtualDisplay ?: run {
            reader.close()
            return false
        }
        imageReader = reader
        virtualSurface = ownSurface
        displayId = vd.display.displayId
        AALogger.i("VirtualDisplay created: id=$displayId, ${width}x${height}, density=$density (decoupled surface)")
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
            ensureCaptureLoop()
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
                ensureCaptureLoop()
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

        ensureCaptureLoop()
        return true
    }

    /**
     * Tears down the [VirtualDisplay], unregisters callbacks, and releases
     * the surface. Call from [SurfaceCallback.onSurfaceDestroyed].
     */
    fun destroy() {
        // Stop the capture loop first so no further PixelCopy/draw touches
        // the surfaces or bitmaps being torn down below.
        val handler = captureHandler
        val thread = captureThread
        captureHandler = null
        captureThread = null
        handler?.removeCallbacksAndMessages(null)
        thread?.quitSafely()
        captureInFlight = false
        captureBitmap?.recycle()
        captureBitmap = null
        captureBitmapW = 0
        captureBitmapH = 0
        lastFrame.getAndSet(null)?.recycle()
        cropScale = 1f
        cropSrcX = 0
        cropSrcY = 0
        inputMappingLogged = false
        firstFrameDrawn = false
        lastCopySuccess = true
        screencapConsecutiveFailures = 0
        activeCapturePath = null
        screencapCount = 0L
        screencapTotalMs = 0L
        lastRawW = 0
        lastRawH = 0
        reflectionConsecutiveFailures = 0
        reflectionCount = 0L
        reflectionTotalMs = 0L
        lastReflectionFailLogAt = 0L

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

        // Close the display's ImageReader sink (after the display itself,
        // so the compositor is gone first). ImageReader.close() releases
        // its internal Surface.
        imageReader?.let {
            try {
                it.close()
            } catch (e: Exception) {
                AALogger.w("Error closing ImageReader: ${e.message}")
            }
        }
        imageReader = null
        virtualSurface = null

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

    // ---- Capture / draw pipeline ------------------------------------------

    /**
     * Starts the dedicated capture thread and schedules the first
     * iteration. The fallback window PixelCopy requires API 26 — below
     * that the loop is disabled and the map stays off-screen.
     */
    private fun ensureCaptureLoop() {
        if (captureHandler != null) return
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
            AALogger.e(
                "CarDisplay: capture loop needs API 26+ (PixelCopy from Window) — " +
                    "rendering disabled on API ${Build.VERSION.SDK_INT}"
            )
            return
        }
        val thread = HandlerThread(CAPTURE_THREAD_NAME).apply { start() }
        captureThread = thread
        captureHandler = Handler(thread.looper)
        AALogger.i(
            "CarDisplay: capture loop started on $CAPTURE_THREAD_NAME " +
                "(interval=${CAPTURE_INTERVAL_MS}ms)"
        )
        scheduleCapture()
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun scheduleCapture() {
        captureHandler?.postDelayed(captureRunnable, CAPTURE_INTERVAL_MS)
    }

    /**
     * One capture iteration. Runs on the capture thread; the PixelCopy
     * completion listener is delivered to the same thread, so the bitmap
     * swap and the surface draw never race each other, and the main
     * thread is never blocked.
     */
    @RequiresApi(Build.VERSION_CODES.O)
    private val captureRunnable = object : Runnable {
        override fun run() {
            captureIteration++
            try {
                captureAndDraw()
            } catch (t: Throwable) {
                AALogger.w("CarDisplay: capture iteration failed: ${t.message}")
            }
            scheduleCapture()
        }
    }

    /**
     * One capture iteration. Primary path: in-process capture of the
     * composited virtual display via hidden framework APIs unlocked by the
     * LSPosed module (`ScreenCapture` on API 34+, `SurfaceControl` below —
     * captures SurfaceView/GL layers — the map — that window PixelCopy
     * misses). Fallback 1: root `screencap -d`. Fallback 2: window
     * PixelCopy. Runs on the capture thread; skips this tick while a
     * PixelCopy is still in flight (the interval is 500ms, copies are
     * usually faster).
     */
    @RequiresApi(Build.VERSION_CODES.O)
    private fun captureAndDraw() {
        if (captureInFlight) return
        val activity = projectedActivity ?: return
        if (displayId == -1 || virtualDisplay == null) return

        // Path 0 — in-process reflection capture. While it fails, retry
        // only every SCREENCAP_RETRY_EVERY ticks (cheap on its own, but the
        // failure log and the wasted frame slot still cost).
        if (reflectionConsecutiveFailures == 0 ||
            captureIteration % SCREENCAP_RETRY_EVERY == 0L
        ) {
            val frame = captureViaReflection()
            if (frame != null) {
                reflectionConsecutiveFailures = 0
                publishFrame(frame)
                return
            }
            reflectionConsecutiveFailures++
        }

        // Path 1 — root screencap of the virtual display. While it fails,
        // retry only every SCREENCAP_RETRY_EVERY ticks to avoid paying the
        // su process spawn on every 500ms tick.
        if (screencapConsecutiveFailures == 0 ||
            captureIteration % SCREENCAP_RETRY_EVERY == 0L
        ) {
            val frame = captureViaScreencap()
            if (frame != null) {
                screencapConsecutiveFailures = 0
                logActivePath("screencap")
                publishFrame(frame)
                return
            }
            screencapConsecutiveFailures++
        }

        // Path 2 (fallback) — window PixelCopy.
        val handler = captureHandler ?: return
        val decor = activity.window?.decorView ?: return
        val w = decor.width
        val h = decor.height
        if (w <= 0 || h <= 0) return

        val existing = captureBitmap
        if (existing == null || existing.width != w || existing.height != h) {
            existing?.recycle()
            val bmp = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888)
            captureBitmap = bmp
            if (captureBitmapW != w || captureBitmapH != h) {
                captureBitmapW = w
                captureBitmapH = h
                AALogger.i("CarDisplay: capture bitmap resized to ${w}x${h} (projected window)")
            }
        }

        try {
            captureInFlight = true
            PixelCopy.request(
                activity.window, null, captureBitmap!!, pixelCopyListener, handler
            )
        } catch (e: Exception) {
            captureInFlight = false
            logCopyFailure("request threw: ${e.message}")
        }
    }

    /**
     * Captures the composited virtual display in-process via the hidden
     * framework capture APIs (ScreenCapture / SurfaceControl), resolved by
     * reflection and unlocked at runtime by the LSPosed module. Returns the
     * frame bitmap, or null on any failure — callers fall back to the
     * screencap path.
     */
    private fun captureViaReflection(): Bitmap? {
        val bridge = reflectionBridge
            ?: InProcessCapture(Build.VERSION.SDK_INT).also { reflectionBridge = it }
        val started = SystemClock.elapsedRealtime()
        val frame = try {
            bridge.capture(displayId)
        } catch (e: Exception) {
            return logReflectionFailure("${e.javaClass.simpleName}: ${e.message}")
        } ?: return logReflectionFailure("capture returned null")
        val elapsed = SystemClock.elapsedRealtime() - started

        // Timing stats — log the 1st frame, then averages every 30s.
        reflectionCount++
        reflectionTotalMs += elapsed
        val now = SystemClock.elapsedRealtime()
        if (reflectionCount == 1L) {
            AALogger.i(
                "CarDisplay: in-process capture ok (${bridge.pathName}): " +
                    "${frame.width}x${frame.height} in ${elapsed}ms"
            )
            AALogger.shareableCopy()
        } else if (now - lastReflectionStatLogAt >= COPY_FAIL_LOG_INTERVAL_MS) {
            lastReflectionStatLogAt = now
            AALogger.i(
                "CarDisplay: in-process capture avg=${reflectionTotalMs / reflectionCount}ms over " +
                    "$reflectionCount frames (last=${elapsed}ms)"
            )
            reflectionCount = 0L
            reflectionTotalMs = 0L
        }

        logActivePath(bridge.pathName)
        return frame
    }

    /** Rate-limited in-process capture failure log — at most once per 30s. */
    private fun logReflectionFailure(detail: String): Bitmap? {
        val now = SystemClock.elapsedRealtime()
        if (now - lastReflectionFailLogAt >= COPY_FAIL_LOG_INTERVAL_MS) {
            lastReflectionFailLogAt = now
            AALogger.d(
                "CarDisplay: in-process capture failed ($detail) — " +
                    "falling back to screencap/pixelcopy (rate-limited)"
            )
        }
        return null
    }

    /**
     * Captures the composited virtual display via root `screencap -d`
     * (raw RGBA). Returns the parsed frame bitmap, or null on any failure
     * — callers fall back to the PixelCopy path.
     */
    private fun captureViaScreencap(): Bitmap? {
        val id = displayId
        if (id == -1) return null
        val started = SystemClock.elapsedRealtime()
        val bytes = RootShell.runBytes("screencap -d $id")
            ?: return logScreencapFailure("runBytes failed")
        val elapsed = SystemClock.elapsedRealtime() - started
        val frame = parseScreencapRaw(bytes, surfaceWidth, surfaceHeight)
            ?: return logScreencapFailure("unparseable raw header (${bytes.size} bytes)")

        // Timing stats — log the 1st frame, then averages every 30s.
        screencapCount++
        screencapTotalMs += elapsed
        val now = SystemClock.elapsedRealtime()
        if (screencapCount == 1L) {
            AALogger.i(
                "CarDisplay: screencap raw ok: ${frame.w}x${frame.h} fmt=${frame.format} " +
                    "in ${elapsed}ms (${bytes.size} bytes)"
            )
            AALogger.shareableCopy()
        } else if (now - lastScreencapStatLogAt >= COPY_FAIL_LOG_INTERVAL_MS) {
            lastScreencapStatLogAt = now
            AALogger.i(
                "CarDisplay: screencap avg=${screencapTotalMs / screencapCount}ms over " +
                    "$screencapCount frames (last=${elapsed}ms)"
            )
            screencapCount = 0L
            screencapTotalMs = 0L
        }

        // Raw dims vs expected display dims — log once per change.
        if (frame.w != surfaceWidth || frame.h != surfaceHeight) {
            if (frame.w != lastRawW || frame.h != lastRawH) {
                lastRawW = frame.w
                lastRawH = frame.h
                AALogger.w(
                    "CarDisplay: screencap raw dims ${frame.w}x${frame.h} differ from " +
                        "display ${surfaceWidth}x${surfaceHeight}"
                )
            }
        }

        return frame.toBitmap()
    }

    /** Rate-limited screencap failure warning — at most once per 30s. */
    private fun logScreencapFailure(detail: String): Bitmap? {
        val now = SystemClock.elapsedRealtime()
        if (now - lastScreencapFailLogAt >= COPY_FAIL_LOG_INTERVAL_MS) {
            lastScreencapFailLogAt = now
            AALogger.w("CarDisplay: screencap failed ($detail) — falling back to PixelCopy (rate-limited)")
        }
        return null
    }

    /**
     * Tracks the active capture path and logs transitions (rate-limited to
     * once per 30s so path flapping cannot spam the log).
     */
    private fun logActivePath(path: String) {
        if (activeCapturePath == path) return
        val now = SystemClock.elapsedRealtime()
        val logIt = now - lastPathLogAt >= COPY_FAIL_LOG_INTERVAL_MS
        activeCapturePath = path
        if (logIt) {
            lastPathLogAt = now
            AALogger.i("CarDisplay: active capture path -> $path")
            AALogger.shareableCopy()
        }
    }

    /**
     * Publishes a captured frame: stores it as the last valid frame,
     * draws it onto the car surface, and recycles the previous one.
     */
    private fun publishFrame(bitmap: Bitmap) {
        val old = lastFrame.getAndSet(bitmap)
        drawFrame(bitmap, bitmap.width, bitmap.height)
        old?.recycle()
    }

    /**
     * Handles the PixelCopy result (on the capture thread): on SUCCESS the
     * frame becomes the new lastFrame and is drawn onto the car surface;
     * on failure the last valid frame stays on screen.
     */
    @RequiresApi(Build.VERSION_CODES.O)
    private val pixelCopyListener = PixelCopy.OnPixelCopyFinishedListener { result ->
        captureInFlight = false
        val bmp = captureBitmap
        captureBitmap = null
        if (result == PixelCopy.SUCCESS) {
            if (!lastCopySuccess) {
                lastCopySuccess = true
                AALogger.i("CarDisplay: PixelCopy succeeded (result=SUCCESS) — capture resumed")
            }
            if (bmp != null) {
                logActivePath("pixelcopy")
                publishFrame(bmp)
            }
        } else {
            if (lastCopySuccess) {
                lastCopySuccess = false
                AALogger.w("CarDisplay: PixelCopy failed (result=$result) — keeping last frame")
                AALogger.shareableCopy()
            }
            logCopyFailure("result=$result")
            bmp?.recycle()
        }
    }

    /** Rate-limited warning for capture failures — at most once per 30s. */
    private fun logCopyFailure(detail: String) {
        val now = SystemClock.elapsedRealtime()
        if (now - lastCopyFailLogAt < COPY_FAIL_LOG_INTERVAL_MS) return
        lastCopyFailLogAt = now
        AALogger.w("CarDisplay: capture failed ($detail) — keeping last frame (rate-limited)")
    }

    /**
     * Draws [bitmap] onto the car surface with a crop-to-fill (cover)
     * transform: scale = max(carW/bw, carH/bh), centered, so the whole
     * landscape car surface is covered even when the window content is
     * portrait-letterboxed.
     *
     * Publishes the crop rect (scale + src origin) for the inverse input
     * mapping. Runs on the capture thread — lockCanvas/unlockCanvasAndPost
     * happen on the same thread that captures.
     */
    private fun drawFrame(bitmap: Bitmap, bw: Int, bh: Int) {
        val surface = carSurface ?: return
        val cw = carWidth
        val ch = carHeight
        if (cw <= 0 || ch <= 0) return
        if (!surface.isValid) {
            AALogger.w("CarDisplay: car surface is invalid — cannot draw frame")
            return
        }

        val scale = max(cw / bw.toFloat(), ch / bh.toFloat())
        val srcW = minOf((cw / scale).toInt(), bw)
        val srcH = minOf((ch / scale).toInt(), bh)
        val srcX = (bw - srcW) / 2
        val srcY = (bh - srcH) / 2
        val src = Rect(srcX, srcY, srcX + srcW, srcY + srcH)
        val dst = RectF(0f, 0f, cw.toFloat(), ch.toFloat())

        // Publish the crop mapping for input (read on the main thread).
        cropScale = scale
        cropSrcX = srcX
        cropSrcY = srcY

        // Log the draw transform only when it changes — not every 500ms.
        if (scale != lastDrawScale || srcX != lastDrawSrcX || srcY != lastDrawSrcY ||
            cw != lastDrawDstW || ch != lastDrawDstH
        ) {
            lastDrawScale = scale
            lastDrawSrcX = srcX
            lastDrawSrcY = srcY
            lastDrawDstW = cw
            lastDrawDstH = ch
            AALogger.i(
                "CarDisplay: draw transform bitmap=${bw}x${bh} -> dst=${cw}x${ch} " +
                    "scale=$scale src=[$srcX,$srcY,${srcX + srcW},${srcY + srcH}]"
            )
        }

        try {
            val canvas = surface.lockHardwareCanvas() ?: run {
                AALogger.w("CarDisplay: lockHardwareCanvas returned null — frame skipped")
                return
            }
            try {
                canvas.drawBitmap(bitmap, src, dst, drawPaint)
            } finally {
                surface.unlockCanvasAndPost(canvas)
            }
        } catch (e: Exception) {
            AALogger.e("CarDisplay: draw failed: ${e.message}", e)
            return
        }

        if (!firstFrameDrawn) {
            firstFrameDrawn = true
            AALogger.i("CarDisplay: first frame drawn (${cw}x${ch})")
            AALogger.shareableCopy()
        }
    }

    // ---- MotionEvent dispatch helpers ------------------------------------

    /**
     * Low-level dispatch — sends [event] to the projected activity's decor
     * view. Silently dropped if the activity hasn't been attached yet.
     *
     * ## Coordinate transform
     *
     * The host sends touch coordinates in **car-surface space**, but
     * `View.dispatchTouchEvent` expects **window-local** coordinates, and
     * the captured frame is scaled/cropped onto the car surface. Before
     * dispatch every pointer is mapped in two steps (via [Matrix]):
     *
     * 1. Inverse crop-to-fill: (x, y) → (x/scale + srcX, y/scale + srcY)
     *    using the crop rect of the last drawn frame — car-surface
     *    coordinates become projected-window coordinates.
     * 2. Window compensation:
     *    a. Subtract the window's on-screen location
     *       ([android.view.View.getLocationOnScreen]) from the event
     *       coordinates — this compensates the window offset.
     *    b. If the display reports rotation, apply the inverse rotation
     *       using the display's current real dimensions:
     *       - `ROTATION_90`  (1): (x, y) → (y, w-1-x)
     *       - `ROTATION_180` (2): (x, y) → (w-1-x, h-1-y)
     *       - `ROTATION_270` (3): (x, y) → (h-1-y, x)
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

        // Step 1 — inverse crop mapping: host coords are car-surface
        // coords; map them back into the projected window space using the
        // crop transform of the last drawn frame (see drawFrame()).
        val scale = cropScale
        if (!inputMappingLogged &&
            (event.actionMasked == MotionEvent.ACTION_DOWN ||
                event.actionMasked == MotionEvent.ACTION_POINTER_DOWN)
        ) {
            inputMappingLogged = true
            AALogger.i(
                "CarDisplay: input crop mapping car=(${event.x},${event.y}) -> " +
                    "window=(${event.x / scale + cropSrcX},${event.y / scale + cropSrcY}) " +
                    "(scale=$scale, src=($cropSrcX,$cropSrcY))"
            )
            AALogger.shareableCopy()
        }
        if (scale > 0f && (scale != 1f || cropSrcX != 0 || cropSrcY != 0)) {
            val cropInv = Matrix()
            cropInv.setScale(1f / scale, 1f / scale)
            cropInv.postTranslate(cropSrcX.toFloat(), cropSrcY.toFloat())
            event.transform(cropInv)
        }

        // Step 2 — window offset in display space (letterboxing shifts the
        // window) and display rotation compensation.
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
     * window rotation), so the dispatch transform — including the inverse
     * crop mapping — still applies exactly once: it is NOT applied here.
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

// ---- Raw screencap frame parsing -------------------------------------------

/**
 * One parsed raw `screencap` frame (header stripped, pixels only).
 */
private class RawFrame(
    val w: Int,
    val h: Int,
    val format: Int,
    val pixels: ByteArray
) {

    /**
     * Converts to an ARGB_8888 bitmap. RGBA_8888 (1) and RGBX_8888 (2)
     * pass through directly; BGRA_8888 (5) gets its R/B channels swapped.
     */
    fun toBitmap(): Bitmap {
        if (format == 5) {
            // BGRA_8888 → RGBA: swap the R and B bytes of every pixel.
            for (i in 0 until pixels.size step 4) {
                val tmp = pixels[i]
                pixels[i] = pixels[i + 2]
                pixels[i + 2] = tmp
            }
        }
        val bmp = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888)
        bmp.copyPixelsFromBuffer(ByteBuffer.wrap(pixels))
        return bmp
    }
}

/**
 * Parses a raw `screencap` frame. Header: 12 bytes (width, height,
 * format) or 16 bytes (plus dataspace, Android 12+); screencap writes
 * host byte order (little-endian on ARM64), but big-endian is accepted
 * defensively — candidates are validated by pixel-payload size, so only
 * the correct endianness survives. Supported formats: RGBA_8888 (1),
 * RGBX_8888 (2), BGRA_8888 (5). Candidates whose dims match the display
 * dims win; otherwise the first size-consistent candidate is used.
 */
private fun parseScreencapRaw(
    data: ByteArray,
    expectedW: Int,
    expectedH: Int
): RawFrame? {
    var fallback: RawFrame? = null
    for (headerLen in intArrayOf(16, 12)) {
        if (data.size <= headerLen) continue
        for (bigEndian in booleanArrayOf(false, true)) {
            val w = readInt(data, 0, bigEndian)
            val h = readInt(data, 4, bigEndian)
            val format = readInt(data, 8, bigEndian)
            if (w <= 0 || h <= 0 || w > 16_384 || h > 16_384) continue
            val bpp = when (format) {
                1, 2, 5 -> 4 // RGBA_8888 / RGBX_8888 / BGRA_8888
                else -> 0 // RGB_565 etc. unsupported
            }
            if (bpp == 0) continue
            if ((data.size - headerLen).toLong() != w.toLong() * h * bpp) continue
            val frame = RawFrame(w, h, format, data.copyOfRange(headerLen, data.size))
            if (w == expectedW && h == expectedH) return frame
            if (fallback == null) fallback = frame
        }
    }
    return fallback
}

/** Reads a 32-bit int from [data] at [offset] in the given byte order. */
private fun readInt(data: ByteArray, offset: Int, bigEndian: Boolean): Int {
    val b0 = data[offset].toInt() and 0xFF
    val b1 = data[offset + 1].toInt() and 0xFF
    val b2 = data[offset + 2].toInt() and 0xFF
    val b3 = data[offset + 3].toInt() and 0xFF
    return if (bigEndian) {
        (b0 shl 24) or (b1 shl 16) or (b2 shl 8) or b3
    } else {
        (b3 shl 24) or (b2 shl 16) or (b1 shl 8) or b0
    }
}

// ---- In-process (reflection) capture ----------------------------------------

/** One resolved in-process capture path (method handles already cached). */
private interface DisplayCaptureImpl {
    /** Captures display [displayId]; null on failure, exceptions propagate. */
    fun capture(displayId: Int): Bitmap?
}

/**
 * In-process capture of the virtual display via hidden framework APIs,
 * unlocked at runtime by the companion LSPosed module. All access goes
 * through reflection so the dex has no compile-time dependency on hidden
 * classes. Method handles are resolved once at construction (any failure —
 * missing class, hidden-API SecurityException still enforced, ... — is
 * remembered and re-thrown as [IllegalStateException] on every capture
 * attempt, so the caller logs it rate-limited and falls back).
 *
 * - API 34+: `IWindowManager.captureDisplay(int, CaptureArgs, listener)`
 *   (the SystemUI path — WindowManagerService resolves the display by id,
 *   virtual displays included, and captures via ScreenCapture.captureLayers).
 * - API 29-33: `SurfaceControl.screenshotToBuffer(IBinder display, ...)`
 *   when a display token is resolvable, else
 *   `SurfaceControl.screenshot(Rect, int, int, int)` (internal display
 *   only). Note: on stock AOSP, SurfaceFlinger maps only *physical*
 *   display ids to tokens (`getPhysicalDisplayToken`), so for a virtual
 *   display the token path yields null and the internal display is used.
 * - Below API 29: unsupported (null impl).
 */
private class InProcessCapture(sdkInt: Int) {

    /** Active path name reported via `CarDisplay.logActivePath`. */
    val pathName: String = if (sdkInt >= 34) "screenCapture" else "surfaceControl"

    private val impl: DisplayCaptureImpl?
    private val initError: String?

    init {
        var error: String? = null
        impl = try {
            when {
                sdkInt >= 34 -> ScreenCaptureApi34.resolve()
                sdkInt >= 29 -> SurfaceControlLegacy.resolve()
                else -> {
                    error = "API level $sdkInt < 29 — unsupported"
                    null
                }
            }
        } catch (t: Throwable) {
            error = "${t.javaClass.simpleName}: ${t.message}"
            null
        }
        initError = error
    }

    fun capture(displayId: Int): Bitmap? {
        val i = impl ?: throw IllegalStateException(initError ?: "unavailable")
        return i.capture(displayId)
    }
}

/**
 * API 34+: `IWindowManager.captureDisplay` + `ScreenCapture` (the
 * SystemUI path). `captureArgs` is passed as null — WindowManagerService
 * builds the default LayerCaptureArgs (RGBA_8888, display bounds) and
 * captures the display by id, virtual displays included. The synchronous
 * listener blocks up to ~1s (framework-internal latch) and yields the
 * ScreenshotHardwareBuffer; `asBitmap()` wraps it into a hardware bitmap.
 */
private class ScreenCaptureApi34(
    private val wm: Any,
    private val captureDisplay: Method,
    private val createSyncListener: Method,
    private val getBuffer: Method,
    private val asBitmap: Method,
) : DisplayCaptureImpl {

    override fun capture(displayId: Int): Bitmap? {
        val listener = createSyncListener.invoke(null)
        captureDisplay.invoke(wm, displayId, null, listener)
        val buffer = getBuffer.invoke(listener) ?: return null
        return asBitmap.invoke(buffer) as? Bitmap
    }

    companion object {
        // Hidden-API access is intentional — unlocked at runtime by LSPosed.
        @SuppressLint("BlockedPrivateApi", "DiscouragedPrivateApi", "PrivateApi")
        fun resolve(): ScreenCaptureApi34 {
            val wmGlobal = Class.forName("android.view.WindowManagerGlobal")
            val wm = wmGlobal.getDeclaredMethod("getWindowManagerService").invoke(null)
            val iwmClass = Class.forName("android.view.IWindowManager")
            val scClass = Class.forName("android.window.ScreenCapture")
            val captureArgsClass =
                Class.forName("android.window.ScreenCapture\$CaptureArgs")
            val listenerClass =
                Class.forName("android.window.ScreenCapture\$ScreenCaptureListener")
            val syncListenerClass =
                Class.forName("android.window.ScreenCapture\$SynchronousScreenCaptureListener")
            val bufferClass =
                Class.forName("android.window.ScreenCapture\$ScreenshotHardwareBuffer")
            return ScreenCaptureApi34(
                wm = wm,
                captureDisplay = iwmClass.getDeclaredMethod(
                    "captureDisplay",
                    Int::class.javaPrimitiveType,
                    captureArgsClass,
                    listenerClass,
                ),
                createSyncListener = scClass.getDeclaredMethod("createSyncCaptureListener"),
                getBuffer = syncListenerClass.getDeclaredMethod("getBuffer"),
                asBitmap = bufferClass.getDeclaredMethod("asBitmap"),
            )
        }
    }
}

/**
 * API 29-33: `SurfaceControl` captures.
 *
 * Preferred: the virtual display via
 * `SurfaceControl.screenshotToBuffer(IBinder display, Rect, int, int,
 * boolean, int)` + `Bitmap.wrapHardwareBuffer()`. The token comes from
 * `SurfaceControl.getPhysicalDisplayToken(long)`; on stock AOSP
 * SurfaceFlinger only maps physical display ids to tokens, so for our
 * virtual display it is null and we degrade to the internal display.
 *
 * Degraded: `SurfaceControl.screenshot(Rect, int, int, int)` — internal
 * display only (known limitation).
 */
@SuppressLint("NewApi")
private class SurfaceControlLegacy(
    private val getPhysicalDisplayToken: Method,
    private val screenshotToBuffer: Method,
    private val getGraphicBuffer: Method,
    private val getColorSpace: Method,
    private val screenshotInternal: Method,
) : DisplayCaptureImpl {

    override fun capture(displayId: Int): Bitmap? {
        val token = getPhysicalDisplayToken.invoke(null, displayId.toLong())
        if (token != null) {
            val buffer = screenshotToBuffer.invoke(
                null, token, Rect(), 0, 0, false, Surface.ROTATION_0
            ) ?: return null
            val graphicBuffer = getGraphicBuffer.invoke(buffer) as? HardwareBuffer ?: return null
            val colorSpace = getColorSpace.invoke(buffer) as? ColorSpace
            return Bitmap.wrapHardwareBuffer(graphicBuffer, colorSpace)
        }
        // Virtual-display token unavailable on this ROM — capture the
        // internal display only (the screencap path handles the VD).
        return screenshotInternal.invoke(null, Rect(), 0, 0, Surface.ROTATION_0) as? Bitmap
    }

    companion object {
        // Hidden-API access is intentional — unlocked at runtime by LSPosed.
        @SuppressLint("BlockedPrivateApi", "DiscouragedPrivateApi", "PrivateApi")
        fun resolve(): SurfaceControlLegacy {
            val scClass = Class.forName("android.view.SurfaceControl")
            val sgbClass = Class.forName("android.view.SurfaceControl\$ScreenshotGraphicBuffer")
            return SurfaceControlLegacy(
                getPhysicalDisplayToken = scClass.getDeclaredMethod(
                    "getPhysicalDisplayToken", Long::class.javaPrimitiveType
                ),
                screenshotToBuffer = scClass.getDeclaredMethod(
                    "screenshotToBuffer",
                    Class.forName("android.os.IBinder"),
                    Rect::class.java,
                    Int::class.javaPrimitiveType,
                    Int::class.javaPrimitiveType,
                    Boolean::class.javaPrimitiveType,
                    Int::class.javaPrimitiveType,
                ),
                getGraphicBuffer = sgbClass.getDeclaredMethod("getGraphicBuffer"),
                getColorSpace = sgbClass.getDeclaredMethod("getColorSpace"),
                screenshotInternal = scClass.getDeclaredMethod(
                    "screenshot",
                    Rect::class.java,
                    Int::class.javaPrimitiveType,
                    Int::class.javaPrimitiveType,
                    Int::class.javaPrimitiveType,
                ),
            )
        }
    }
}

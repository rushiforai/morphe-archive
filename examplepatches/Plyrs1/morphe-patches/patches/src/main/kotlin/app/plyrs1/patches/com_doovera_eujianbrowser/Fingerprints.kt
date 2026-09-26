package app.plyrs1.patches.com_doovera_eujianbrowser

import app.morphe.patcher.Fingerprint

// ─── WebViewClient ────────────────────────────────────────────────────────────

/**
 * q0.p.onPageStarted(WebView, String, Bitmap)
 * Fires when a new page begins loading — before any page scripts execute.
 * Injection point for the JS event-suppression monkeypatch.
 */
object OnPageStartedFingerprint : Fingerprint(
    definingClass = "Lq0/p;",
    name = "onPageStarted",
    returnType = "V",
    parameters = listOf(
        "Landroid/webkit/WebView;",
        "Ljava/lang/String;",
        "Landroid/graphics/Bitmap;"
    )
)

// ─── ExamActivity native security methods ─────────────────────────────────────

/**
 * ExamActivity.B(Z)V — multi-window / split-screen detection handler.
 * Called from onResume() and onConfigurationChanged() with isInMultiWindowMode().
 * When true: shows split-screen dialog and calls R() for alarm.
 */
object MultiWindowDetectionFingerprint : Fingerprint(
    definingClass = "Lcom/doovera/eujianbrowser/ExamActivity;",
    name = "B",
    returnType = "V",
    parameters = listOf("Z")
)

/**
 * ExamActivity.R()V — violation alarm trigger.
 * Convergence point for ALL security checks. Sets volume to max, plays
 * alarm tone, triggers vibration. Returning early silences all alarms.
 */
object ViolationAlarmFingerprint : Fingerprint(
    definingClass = "Lcom/doovera/eujianbrowser/ExamActivity;",
    name = "R",
    returnType = "V",
    parameters = emptyList()
)

/**
 * ExamActivity.w()V — Do Not Disturb detection.
 * Queries NotificationManager.getCurrentInterruptionFilter(); fires alarm
 * if DND is active (filter 2 PRIORITY, 3 NONE, 4 ALARMS).
 */
object DndDetectionFingerprint : Fingerprint(
    definingClass = "Lcom/doovera/eujianbrowser/ExamActivity;",
    name = "w",
    returnType = "V",
    parameters = emptyList()
)

/**
 * ExamActivity.x()V — Silent / Vibrate mode detection.
 * Queries AudioManager.getRingerMode(); fires alarm if not RINGER_MODE_NORMAL.
 */
object SilentModeDetectionFingerprint : Fingerprint(
    definingClass = "Lcom/doovera/eujianbrowser/ExamActivity;",
    name = "x",
    returnType = "V",
    parameters = emptyList()
)

/**
 * ExamActivity.J()V — OverlayGuard / focus loss handler.
 * Draws full-screen TYPE_APPLICATION_OVERLAY window and starts N() loop
 * that forcefully reorders ExamActivity to front every 1500 ms.
 */
object OverlayGuardFingerprint : Fingerprint(
    definingClass = "Lcom/doovera/eujianbrowser/ExamActivity;",
    name = "J",
    returnType = "V",
    parameters = emptyList()
)

/**
 * ExamActivity.onPause()V
 * Calls R() (alarm) whenever the activity pauses without an authorized reason
 * (file chooser, split-screen state, or grace timer).
 */
object OnPauseFingerprint : Fingerprint(
    definingClass = "Lcom/doovera/eujianbrowser/ExamActivity;",
    name = "onPause",
    returnType = "V",
    parameters = emptyList()
)

/**
 * ExamActivity.onResume()V
 * Resumes activity, initializes WebView, re-enables fullscreen UI.
 */
object ExamActivityOnResumeFingerprint : Fingerprint(
    definingClass = "Lcom/doovera/eujianbrowser/ExamActivity;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList()
)

/**
 * ExamActivity.onWindowFocusChanged(Z)V
 * Schedules a 1500 ms delayed check (Runnable case 5) when focus is lost.
 * If focus has not returned after 1500 ms, triggers "Window lost focus" alarm.
 * Also re-invokes w() and x() (DND + silent checks) on every focus gain.
 */
object OnWindowFocusChangedFingerprint : Fingerprint(
    definingClass = "Lcom/doovera/eujianbrowser/ExamActivity;",
    name = "onWindowFocusChanged",
    returnType = "V",
    parameters = listOf("Z")
)

/**
 * ExamActivity.onPictureInPictureModeChanged(Z, Configuration)V
 * Calls M() (terminate exam) immediately when PiP mode is entered.
 */
object OnPipModeChangedFingerprint : Fingerprint(
    definingClass = "Lcom/doovera/eujianbrowser/ExamActivity;",
    name = "onPictureInPictureModeChanged",
    returnType = "V",
    parameters = listOf("Z", "Landroid/content/res/Configuration;")
)

/**
 * ExamActivity.dispatchTouchEvent(MotionEvent)Z
 * Checks MotionEvent.FLAG_WINDOW_IS_PARTIALLY_OBSCURED (API 29+).
 * Sets f1923c0=true and schedules 1500 ms delayed "partially obscured" alarm.
 */
object DispatchTouchEventFingerprint : Fingerprint(
    definingClass = "Lcom/doovera/eujianbrowser/ExamActivity;",
    name = "dispatchTouchEvent",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;")
)

/**
 * ExamActivity.A()V — fullscreen / immersive UI enforcement.
 * API 30+: WindowInsetsController hides status + nav bars.
 * API <30: setSystemUiVisibility(0x1706).
 * Called from onCreate(), onResume(), onWindowFocusChanged().
 */
object FullscreenEnforcementFingerprint : Fingerprint(
    definingClass = "Lcom/doovera/eujianbrowser/ExamActivity;",
    name = "A",
    returnType = "V",
    parameters = emptyList()
)

/**
 * ExamActivity.onCreate(Bundle)V
 * Sets FLAG_SECURE (0x2000) and FLAG_KEEP_SCREEN_ON (0x80) on the window.
 * Also registers ClipboardGuard, configures WebView, sets up HIDE_OVERLAY_WINDOWS.
 */
object ExamActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/doovera/eujianbrowser/ExamActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

/**
 * ExamActivity.S()V — starts lock task / app pinning mode.
 * Calls examActivity.startLockTask() to pin the screen so the user cannot exit.
 * Returning early disables screen pinning.
 */
object AutoPinFingerprint : Fingerprint(
    definingClass = "Lcom/doovera/eujianbrowser/ExamActivity;",
    name = "S",
    returnType = "V",
    parameters = emptyList()
)

// ─── ClipboardGuard ───────────────────────────────────────────────────────────

/**
 * u0.d.run()V — ClipboardGuard runner.
 * Contains both calls to ClipboardManager.setPrimaryClip():
 *   - Case 1: wipes clipboard on exam startup
 *   - Case 0: wipes clipboard whenever text is copied
 *
 * Patching run() to return-void neutralizes both destructive clipboard operations.
 */
object ClipboardGuardRunFingerprint : Fingerprint(
    definingClass = "Lu0/d;",
    name = "run",
    returnType = "V",
    parameters = emptyList()
)

// ─── SplashActivity startup security ──────────────────────────────────────────

/**
 * SplashActivity.onCreate(Bundle)V
 * Contains all startup security checks: path validation, cloner detection,
 * VM/cloud-phone detection, hook library detection, emulator detection,
 * and blacklisted-app scan. All checks share one coroutine launched here.
 */
object SplashActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/doovera/eujianbrowser/SplashActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

// ─── Pre-exam blacklist & launch methods ──────────────────────────────────────

/**
 * q0.v.invokeSuspend(Object)Object — pre-exam blacklist coroutine body.
 * Fetches dynamic blacklist from API, merges with hardcoded list, scans
 * getInstalledApplications(), and blocks exam start if any match found.
 */
object BlacklistScanFingerprint : Fingerprint(
    definingClass = "Lq0/v;",
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;")
)

/**
 * MainActivity.t()V — pre-exam verification and ExamActivity launch.
 * Verifies overlay permission, DND state, and ringer mode, then launches
 * ExamActivity with EXAM_URL, TENANT_CODE, and IS_V3 extras.
 */
object MainActivityStartExamFingerprint : Fingerprint(
    definingClass = "Lcom/doovera/eujianbrowser/MainActivity;",
    name = "t",
    returnType = "V",
    parameters = emptyList()
)

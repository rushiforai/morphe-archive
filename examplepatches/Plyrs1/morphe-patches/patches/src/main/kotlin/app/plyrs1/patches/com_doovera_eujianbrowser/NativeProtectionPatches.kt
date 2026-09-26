package app.plyrs1.patches.com_doovera_eujianbrowser

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_EUJIANBROWSER

// ─── 1. Violation Alarm ───────────────────────────────────────────────────────

/**
 * Silences the violation alarm (audio tone + vibration) fired by every
 * native security check. R() is the single convergence point — patching it
 * once covers multi-window, focus loss, overlay, DND, and silent mode.
 *
 * R() sets audio to max volume, plays a repeating ToneGenerator alarm, and
 * vibrates the device. Returning early prevents all of that without affecting
 * the warning dialogs shown by Q() (called before R() at each site).
 */
@Suppress("unused")
val disableViolationAlarmPatch = bytecodePatch(
    name = "Disable Violation Alarm",
    description = "Suppresses the max-volume alarm tone and vibration triggered on any exam security violation.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    execute {
        ViolationAlarmFingerprint.method.addInstructions(0, "return-void")
    }
}

// ─── 2. Multi-Window / Split-Screen ───────────────────────────────────────────

/**
 * Prevents exam exit when split-screen mode is detected.
 *
 * B(Z) is called from onResume() and onConfigurationChanged() with
 * isInMultiWindowMode() as its argument. When true it shows a warning dialog
 * and calls R(). Returning early skips both.
 */
@Suppress("unused")
val bypassMultiWindowDetectionPatch = bytecodePatch(
    name = "Bypass Multi-Window Detection",
    description = "Disables split-screen detection so the exam continues normally in split-screen mode.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    execute {
        MultiWindowDetectionFingerprint.method.addInstructions(0, "return-void")
    }
}

// ─── 3. Do Not Disturb Detection ─────────────────────────────────────────────

/**
 * Allows the exam to run with Do Not Disturb mode active.
 *
 * w() queries NotificationManager.getCurrentInterruptionFilter() and fires
 * the alarm if DND is enabled (filter 2/3/4). Returning early skips the check.
 */
@Suppress("unused")
val bypassDndDetectionPatch = bytecodePatch(
    name = "Bypass DND Detection",
    description = "Allows the exam to run with Do Not Disturb mode enabled.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    execute {
        DndDetectionFingerprint.method.addInstructions(0, "return-void")
    }
}

// ─── 4. Silent / Vibrate Mode Detection ──────────────────────────────────────

/**
 * Allows the exam to run with the device on silent or vibrate.
 *
 * x() queries AudioManager.getRingerMode() and fires the alarm if the result
 * is not RINGER_MODE_NORMAL (2). Returning early skips the check.
 */
@Suppress("unused")
val bypassSilentModeDetectionPatch = bytecodePatch(
    name = "Bypass Silent Mode Detection",
    description = "Allows the exam to run with the device on silent or vibrate.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    execute {
        SilentModeDetectionFingerprint.method.addInstructions(0, "return-void")
    }
}

// ─── 5. OverlayGuard Foreground Recovery Loop ────────────────────────────────

/**
 * Stops the OverlayGuard system overlay and foreground-recovery loop.
 *
 * J() is called when the exam loses foreground without an authorized reason.
 * It draws a full-screen TYPE_APPLICATION_OVERLAY window and starts a
 * Handler loop (N()) that calls FLAG_ACTIVITY_REORDER_TO_FRONT every 1500 ms.
 * Returning early prevents both the overlay and the reorder loop.
 */
@Suppress("unused")
val disableOverlayGuardPatch = bytecodePatch(
    name = "Disable Overlay Guard",
    description = "Stops the OverlayGuard system window and foreground-recovery loop on focus loss.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    execute {
        OverlayGuardFingerprint.method.addInstructions(0, "return-void")
    }
}

// ─── 6. onPause Alarm ────────────────────────────────────────────────────────

/**
 * Prevents the alarm from firing when the activity is paused.
 *
 * In Android, onPause() MUST call super.onPause() to satisfy the lifecycle contract.
 * We invoke super.onPause() first, then return immediately to avoid calling R().
 */
@Suppress("unused")
val disableOnPauseAlarmPatch = bytecodePatch(
    name = "Disable onPause Alarm",
    description = "Prevents the alarm from triggering when the exam activity is paused or backgrounded.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    execute {
        OnPauseFingerprint.method.addInstructions(
            0,
            """
                invoke-super {p0}, Lg/k;->onPause()V
                return-void
            """
        )
    }
}

// ─── 7. Window Focus Lost Alarm ───────────────────────────────────────────────

/**
 * Prevents the 1500 ms delayed focus-loss alarm.
 *
 * onWindowFocusChanged(false) schedules Runnable case 5 which, after 1500 ms,
 * logs "Window lost focus" and calls R().
 * We invoke super.onWindowFocusChanged(p1), then if focus is lost (p1 == false),
 * return early so the alarm is never scheduled.
 */
@Suppress("unused")
val disableFocusLossAlarmPatch = bytecodePatch(
    name = "Disable Focus Loss Alarm",
    description = "Prevents the delayed alarm triggered when the exam window loses focus.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    execute {
        OnWindowFocusChangedFingerprint.method.addInstructions(
            0,
            """
                invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V
                if-nez p1, :skip_early_return
                return-void
                :skip_early_return
            """
        )
    }
}

// ─── 8. Picture-in-Picture Detection ─────────────────────────────────────────

/**
 * Prevents exam termination when Picture-in-Picture mode is entered.
 *
 * Invokes super.onPictureInPictureModeChanged, then returns before M() can be called.
 */
@Suppress("unused")
val bypassPipDetectionPatch = bytecodePatch(
    name = "Bypass PiP Detection",
    description = "Allows the exam to continue when entered into Picture-in-Picture mode.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    execute {
        OnPipModeChangedFingerprint.method.addInstructions(
            0,
            """
                invoke-super {p0, p1, p2}, La/o;->onPictureInPictureModeChanged(ZLandroid/content/res/Configuration;)V
                return-void
            """
        )
    }
}

// ─── 9. Touch Obscurity Detection ───────────────────────────────────────────

/**
 * Disables the partially-obscured touch detection (API 29+).
 *
 * dispatchTouchEvent checks MotionEvent.FLAG_WINDOW_IS_PARTIALLY_OBSCURED.
 * We delegate directly to super.dispatchTouchEvent and return its result.
 */
@Suppress("unused")
val disableTouchObscurityDetectionPatch = bytecodePatch(
    name = "Disable Touch Obscurity Detection",
    description = "Removes the overlay-touch detection that fires an alarm when another window partially covers the exam.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    execute {
        DispatchTouchEventFingerprint.method.addInstructions(
            0,
            """
                invoke-super {p0, p1}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
                move-result v0
                return v0
            """
        )
    }
}

// ─── 10. FLAG_SECURE (Screenshot Prevention) ──────────────────────────────────

/**
 * Removes FLAG_SECURE so screenshots and screen recording work normally.
 *
 * onCreate() sets FLAG_SECURE (0x2000). In onResume(), we clear it
 * via Window.clearFlags(0x2000).
 */
@Suppress("unused")
val removeScreenshotProtectionPatch = bytecodePatch(
    name = "Remove Screenshot Protection",
    description = "Removes FLAG_SECURE so screenshots and screen recording work normally during the exam.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    execute {
        ExamActivityOnResumeFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                move-result-object v0
                const/16 v1, 0x2000
                invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V
            """
        )
    }
}

// ─── 11. Fullscreen Enforcement ───────────────────────────────────────────────

/**
 * Allows status bar and navigation bar to be visible during the exam.
 *
 * A() hides system UI via WindowInsetsController (API 30+) or
 * setSystemUiVisibility(0x1706) on older devices. Returning early lets
 * the system UI remain in its default visible state.
 */
@Suppress("unused")
val allowSystemUIPatch = bytecodePatch(
    name = "Allow System UI",
    description = "Allows the status bar and navigation bar to remain visible during the exam.",
    default = false
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    execute {
        FullscreenEnforcementFingerprint.method.addInstructions(0, "return-void")
    }
}

// ─── 12. Auto-Pin App (Lock Task Mode) ────────────────────────────────────────

/**
 * Disables automatic screen pinning (lock task mode).
 *
 * ExamActivity.S() invokes Activity.startLockTask() to pin the exam to the screen
 * (locking the user out of Home, Recents, and navigation gestures).
 * Returning early from S() disables screen pinning completely.
 */
@Suppress("unused")
val removeAutoPinAppPatch = bytecodePatch(
    name = "Remove Auto-Pin App",
    description = "Disables automatic screen pinning / lock task mode so the app is not pinned to the screen.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    execute {
        AutoPinFingerprint.method.addInstructions(0, "return-void")
    }
}

// ─── 13. Clipboard Guard ──────────────────────────────────────────────────────

/**
 * Disables ClipboardGuard's clipboard-clearing operations.
 *
 * u0.d.run() contains both calls to ClipboardManager.setPrimaryClip():
 *   - Case 1: wipes existing clipboard on exam startup
 *   - Case 0: wipes clipboard whenever text is copied anywhere on the device
 *
 * Patching run() to return-void neutralizes both destructive clipboard operations,
 * keeping the system clipboard intact and allowing copy-paste to work normally.
 */
@Suppress("unused")
val disableClipboardGuardPatch = bytecodePatch(
    name = "Disable Clipboard Guard",
    description = "Prevents the app from wiping the clipboard on exam start and when copying text.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    execute {
        ClipboardGuardRunFingerprint.method.addInstructions(0, "return-void")
    }
}

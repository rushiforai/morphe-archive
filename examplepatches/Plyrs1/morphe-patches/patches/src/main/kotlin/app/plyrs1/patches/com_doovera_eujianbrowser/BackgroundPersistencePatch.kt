package app.plyrs1.patches.com_doovera_eujianbrowser

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_EUJIANBROWSER

/**
 * Keeps the exam process alive in the background using a WakeLock-backed
 * foreground Service.
 *
 * ## Problem
 * Without this patch the app has no background persistence. It relies only on
 * FLAG_KEEP_SCREEN_ON (0x80) which only prevents display sleep while the
 * Activity is in the foreground. If the OS needs memory, or the user navigates
 * away and the screen turns off, the process can be killed. Exam state is lost.
 *
 * ## Solution
 * Merges `ExamKeepAliveService` (compiled in the extension module at
 * `extensions/extension/src/main/java/app/plyrs1/extension/ExamKeepAliveService.java`)
 * into the target APK's DEX, then injects start/stop calls into ExamActivity.
 *
 * ### ExamKeepAliveService behaviour
 * - Acquires `PARTIAL_WAKE_LOCK` — CPU stays on even with screen off; WebView JS
 *   timers, network calls, and exam state all continue running.
 * - Calls `startForeground()` — promotes the process to foreground-service
 *   priority tier. Android will not kill it for memory except under extreme
 *   pressure, and restarts it automatically via `START_STICKY`.
 * - Shows a minimal silent notification ("Ujian sedang berlangsung") required
 *   by Android since API 26 for foreground services.
 * - `android:stopWithTask="false"` (set in manifest patch) keeps the service
 *   alive even if the user swipes the app off the recents screen.
 *
 * ### Injection points
 * - `ExamActivity.onCreate()` index 0 → `startForegroundService(ExamKeepAliveService)`
 * - `ExamActivity.onDestroy()` index 0 → `stopService(ExamKeepAliveService)`
 *
 * ### Required companion patch
 * [manifestPatch] must run alongside this patch to add:
 *   - `android.permission.WAKE_LOCK`
 *   - `android.permission.FOREGROUND_SERVICE`
 *   - `android.permission.FOREGROUND_SERVICE_SPECIAL_USE`
 *   - `<service android:name=".ExamKeepAliveService" .../>`
 *
 * Note: The service class lives in `app.plyrs1.extension` package inside the
 * extension DEX, but is referenced in the injected Smali as its full descriptor
 * `Lapp/plyrs1/extension/ExamKeepAliveService;` which is resolved at APK
 * runtime after the DEX merge.
 */
@Suppress("unused")
val backgroundPersistencePatch = bytecodePatch(
    name = "Background Persistence (WakeLock + Foreground Service)",
    description = "Keeps the exam process alive in the background using a WakeLock-backed " +
            "foreground Service. Prevents OS from killing the exam when backgrounded or " +
            "screen turns off. Service restarts automatically via START_STICKY if killed.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)

    // Merge ExamKeepAliveService from the extension DEX into the target APK.
    extendWith("extensions/extension.mpe")

    execute {
        // ── Start service from ExamActivity.onCreate() ────────────────────────
        // Injected at index 0 — runs before any existing onCreate body.
        // p0 = ExamActivity (Context subclass).
        // v0, v1 available (method declares .locals 14).
        ExamActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Landroid/content/Intent;
                const-class v1, Lapp/plyrs1/extension/ExamKeepAliveService;
                invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
                invoke-virtual {p0, v0}, Landroid/content/Context;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;
            """
        )

        // ── Stop service from ExamActivity.onDestroy() ────────────────────────
        // Find onDestroy on the same class as onCreate.
        // Injected at index 0 before existing cleanup (WebView teardown, etc.).
        val onDestroyMethod = ExamActivityOnCreateFingerprint.classDef.methods
            .first { it.name == "onDestroy" }

        onDestroyMethod.addInstructions(
            0,
            """
                new-instance v0, Landroid/content/Intent;
                const-class v1, Lapp/plyrs1/extension/ExamKeepAliveService;
                invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
                invoke-virtual {p0, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z
            """
        )
    }
}

package dev.brave.patches.perf

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import dev.brave.patches.media.ClassLoaderMismatchFingerprint
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

private const val STARTUP_HELPER = "Ldev/brave/extension/perf/StartupHelper;"

internal object BackgroundSyncScheduleFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/background_sync/BackgroundSyncBackgroundTaskScheduler;",
    name = "scheduleOneOffTask",
    returnType = "Z",
    parameters = listOf("I", "J")
)

@Suppress("unused")
val stopBackgroundWakeupsPatch = patch(
    name = "Stop Background Wakeups",
    description = "Disables Chromium's background-sync task scheduler gate and cancels previously scheduled background-sync jobs."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    extendWith("extensions/brave.mpe")

    execute {
        ClassLoaderMismatchFingerprint.method.apply {
            addInstructions(
                0,
                "invoke-static/range {p1 .. p1}, $STARTUP_HELPER->cancelPendingBackgroundSyncJobs(Landroid/content/Context;)V"
            )
        }

        BackgroundSyncScheduleFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    invoke-virtual {p0, v0}, Lorg/chromium/chrome/browser/background_sync/BackgroundSyncBackgroundTaskScheduler;->cancelOneOffTask(I)V
                    const/4 v0, 0x1
                    invoke-virtual {p0, v0}, Lorg/chromium/chrome/browser/background_sync/BackgroundSyncBackgroundTaskScheduler;->cancelOneOffTask(I)V
                    const/4 v0, 0x0
                    return v0
                """.trimIndent()
            )
        }
    }
}

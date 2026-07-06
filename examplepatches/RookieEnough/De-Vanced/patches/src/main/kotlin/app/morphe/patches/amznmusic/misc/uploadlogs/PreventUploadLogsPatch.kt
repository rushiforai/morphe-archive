/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/amznmusic/misc/uploadlogs/PreventUploadLogsPatch.kt
 */
package app.morphe.patches.amznmusic.misc.uploadlogs

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.returnEarly

private const val PENDING_CRASH_LOGS_CLASS = "Lcom/amazon/mp3/det/PendingCrashLogs;"

internal object UploadLogAfterCrashFingerprint : Fingerprint(
    definingClass = PENDING_CRASH_LOGS_CLASS,
    name = "uploadLogAfterCrash",
    returnType = "V",
    parameters = listOf(),
)

internal object UploadPendingCrashLogsIfRequiredFingerprint : Fingerprint(
    definingClass = PENDING_CRASH_LOGS_CLASS,
    name = "uploadPendingCrashLogsIfRequired",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val preventUploadLogsPatch = bytecodePatch(
    name = "Prevent log upload",
    description = "Avoid uploading logs when the application crashes.",
) {
    compatibleWith(AppCompatibilities.AMAZON_MUSIC)

    execute {
        // Amazon Music changes frequently; skip if method is absent in a build.
        UploadLogAfterCrashFingerprint.methodOrNull?.returnEarly()
        UploadPendingCrashLogsIfRequiredFingerprint.methodOrNull?.returnEarly()
    }
}


package semicoloncolonel.mobilestream.patches.att.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.att.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// myAT&T 2026.10.1 bundles Ookla's Speedtest SDK. Besides the speed test you
// start, the SDK turns on its own background reports: a scheduled job that
// measures your signal and network, with your location, and restarts after
// a reboot. The reports are never turned on, and the background job ends as
// soon as it starts. The speed test you start is not changed.

internal object EnableBackgroundReportsFingerprint : Fingerprint(
    definingClass = "Lcom/ookla/speedtest/sdk/internal/AndroidCaptureDeviceTask;",
    name = "enableBackgroundReports",
    parameters = listOf(),
    returnType = "V",
)

internal object BackgroundJobStartFingerprint : Fingerprint(
    definingClass = "Lcom/ookla/speedtest/sdk/other/BackgroundJob;",
    name = "onStartJob",
    parameters = listOf("Landroid/app/job/JobParameters;"),
    returnType = "Z",
)

@Suppress("unused")
val blockBackgroundSpeedTestsPatch = bytecodePatch(
    name = "Block background network reports",
    description = "Stops Ookla's background reports, which measure your signal and network " +
        "with your location while you are not using the app. The speed test you start still " +
        "works. Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        EnableBackgroundReportsFingerprint.method.returnEarly("return-void")
        BackgroundJobStartFingerprint.method.returnEarly("const/4 v0, 0x0\nreturn v0")
    }
}

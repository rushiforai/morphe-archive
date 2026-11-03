package semicoloncolonel.mobilestream.patches.xfinity.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.xfinity.shared.Constants

// Xfinity 6.14.0-2. Once Advanced Security is turned on, CUJO's on-device
// filter keeps uploading telemetry: the domains it checked, network and VPN
// changes, and threats. The upload job now reports success without sending
// anything. Filtering itself runs on the device and is not changed.

private const val RESULT_SUCCESS = "Landroidx/work/ListenableWorker\$Result\$Success;"

internal object TelemetryWorkerFingerprint : Fingerprint(
    definingClass = "Lcom/cujo/otm/telemetry/worker/TelemetryWorker;",
    name = "doWork",
    parameters = listOf(),
    returnType = "Landroidx/work/ListenableWorker\$Result;",
)

@Suppress("unused")
val blockSecurityTelemetryPatch = bytecodePatch(
    name = "Block Advanced Security telemetry",
    description = "Stops Advanced Security from uploading the websites it checked and your " +
        "network changes. Threat filtering on the phone keeps working. Opt-in; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        TelemetryWorkerFingerprint.method.returnEarly(
            """
                new-instance v0, $RESULT_SUCCESS
                invoke-direct { v0 }, $RESULT_SUCCESS-><init>()V
                return-object v0
            """.trimIndent(),
        )
    }
}

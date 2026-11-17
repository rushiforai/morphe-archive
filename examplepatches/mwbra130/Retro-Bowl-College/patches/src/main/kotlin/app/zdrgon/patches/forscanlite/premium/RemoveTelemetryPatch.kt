package app.zdrgon.patches.forscanlite.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.forscanlite.shared.Constants.COMPATIBILITY_FORSCAN_LITE

/**
 * FORScan Lite — Remove telemetry.
 *
 * Census (verified 2026-11-16 against the exact 1.5.31 APK): the
 * app carries NO third-party analytics, crash-reporting or
 * advertising SDKs, no advertising ID and no install referrer.
 * The one phone-home that is not app function is the version
 * check: an AsyncTask (Lcom/astech/forscancore/r$h;) POSTs the
 * app version to https://forscan.org/api/last_version_la.php on
 * launch and stores the latest-version info it gets back.
 *
 * This patch no-ops that task's background method, so the check
 * never runs. The license endpoints (activation / revoke) are
 * app function and are deliberately left alone; diagnostics and
 * every other feature are unaffected.
 */
@Suppress("unused")
val removeTelemetryPatch = bytecodePatch(
    name = "Remove telemetry",
    description = "Stops the app from phoning home. FORScan Lite has no analytics or " +
        "ad SDKs; the only non-essential traffic is a launch-time version check to " +
        "forscan.org, which this patch disables. Diagnostics and all other features " +
        "are unaffected. FORScan Lite 1.5.31 only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FORSCAN_LITE)

    execute {
        // The task's result is fire-and-forget (nothing reads it),
        // so returning null at entry is a complete no-op.
        VersionCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """.trimIndent()
        )
    }
}

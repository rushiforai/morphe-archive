package app.template.patches.meowdoku

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch

/**
 * Stops the app reporting anything to its analytics endpoints.
 *
 * Everything the app tracks goes through `AnalyzeManager.realSendEvent`, and the three
 * platform SDKs (AppsFlyer, Firebase Analytics, Facebook App Events) are only started by
 * their own `init()`. Returning early at both points leaves the game untouched: no events
 * are queued, no SDK identity or install handshake goes out. Google Play services' own
 * Firebase collector still fires before any app code runs, so also block
 * `app-measurement.com` if you want that one gone.
 */
val blockTelemetryPatch = bytecodePatch(
    name = "Block telemetry",
    description = "Stops AppsFlyer, Firebase Analytics and Facebook App Events from being started or sent anything.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MEOWDOKU)

    val blockTelemetry by booleanOption(
        key = "Block telemetry",
        description = "Keep the analytics SDKs from starting and drop every queued event.",
        default = true
    )

    execute {
        if (blockTelemetry != true) return@execute

        val stopped = mutableListOf<String>()

        // Kill the single dispatch point first: even if an SDK is somehow already running,
        // nothing reaches it any more.
        val send = AnalyzeSendEventFingerprint.matchOrNull()
            ?: throw PatchException("AnalyzeManager.realSendEvent(Event) was not found.")
        send.method.addInstructions(0, "return-void")
        stopped += "event dispatch"

        // Then stop the SDKs from ever starting, which also ends their own install and
        // session traffic.
        for ((label, fingerprint) in listOf(
            "AppsFlyer" to AppsFlyerInitFingerprint,
            "Firebase Analytics" to FirebaseAnalyzeInitFingerprint,
            "Facebook App Events" to FacebookAnalyzeInitFingerprint
        )) {
            val match = fingerprint.matchOrNull() ?: continue
            match.method.addInstructions(0, "return-void")
            stopped += label
        }

        println("Block telemetry: stopped ${stopped.joinToString()}.")
    }
}

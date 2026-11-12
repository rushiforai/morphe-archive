package patches.universal.telemetry

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import java.util.logging.Logger

private val crashExtraStaticEntries = setOf(
    "init", "start", "launch", "register", "setup", "configure", "initialize",
    "send", "reportException", "logException",
)

private val crashExtraInstanceEntries = setOf(
    "send", "reportException", "logException", "logMessage", "start",
)

@Suppress("unused")
val blockCrashExtrasPatch = bytecodePatch(
    name = "Block Crash Extras",
    description = "Stops smaller crash reporters missed by Disable Crash Reporters so stack traces never upload",
    default = false,
) {
    category("Telemetry")
    val blockRaygun by booleanOption(
        title = "Block Raygun",
        default = true,
        key = "blockRaygun",
        description = "Crash reporting SDK.",
    )
    val blockShake by booleanOption(
        title = "Block Shake",
        default = true,
        key = "blockShake",
        description = "Bug reporting with screenshots SDK.",
    )
    val blockEmbrace by booleanOption(
        title = "Block Embrace",
        default = true,
        key = "blockEmbrace",
        description = "Mobile observability SDK.",
    )
    val blockSplunk by booleanOption(
        title = "Block Splunk Mint",
        default = true,
        key = "blockSplunkMint",
        description = "Legacy crash and event SDK.",
    )
    val blockAppCenter by booleanOption(
        title = "Block App Center",
        default = true,
        key = "blockAppCenter",
        description = "Microsoft App Center crashes and analytics.",
    )
    val blockSentry by booleanOption(
        title = "Block Sentry",
        default = true,
        key = "blockSentry",
        description = "Sentry error tracking SDK.",
    )
    val blockAcra by booleanOption(
        title = "Block ACRA",
        default = true,
        key = "blockAcra",
        description = "ACRA crash reporting SDK.",
    )
    val blockOpenTelemetry by booleanOption(
        title = "Block OpenTelemetry",
        default = true,
        key = "blockOpenTelemetry",
        description = "OpenTelemetry (OpenCensus/OpenTracing) spans and export.",
    )

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        val prefixes = buildMap {
            if (blockRaygun == true) put("Lcom/mindscapehq", "Raygun")
            if (blockShake == true) put("Lcom/shakebugs", "Shake")
            if (blockEmbrace == true) put("Lio/embrace", "Embrace")
            if (blockSplunk == true) put("Lcom/splunk", "Splunk Mint")
            if (blockAppCenter == true) put("Lcom/microsoft/appcenter", "App Center")
            if (blockSentry == true) put("Lio/sentry", "Sentry")
            if (blockAcra == true) put("Lorg/acra", "ACRA")
            if (blockOpenTelemetry == true) put("Lio/opentelemetry", "OpenTelemetry")
        }
        if (prefixes.isEmpty()) {
            logger.warning("All vendors disabled. No changes applied.")
            return@execute
        }
        val hit = blockSdkMethods(prefixes, crashExtraStaticEntries, crashExtraInstanceEntries)
        if (hit.isEmpty()) logger.warning("No crash reporter SDKs found. No changes applied.")
        else hit.forEach { (sdk, count) -> logger.info("Blocked $sdk ($count method(s))") }
    }
}

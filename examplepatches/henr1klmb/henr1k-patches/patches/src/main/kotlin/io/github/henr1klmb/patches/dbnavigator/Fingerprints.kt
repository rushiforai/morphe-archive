package io.github.henr1klmb.patches.dbnavigator

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val DB_NAVIGATOR_COMPATIBILITY = Compatibility(
    packageName = "de.hafas.android.db",
    name = "DB Navigator",
    targets = listOf(AppTarget("26.20.0")),
)

internal object TealiumInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("Initializing Tealium failed"),
)

internal object AdjustInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("adjust_enabled_v1", "eu.adjust.com"),
)

internal object QualtricsInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("qualtrics_enabled_v2"),
)

internal object EnableScreenshotsFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    strings = listOf("configProvider"),
)

internal object OptimizelyInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("Optimizely failed to initialize!"),
)

internal object InstanaInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("The initialization of Instana agent is not finished yet"),
)

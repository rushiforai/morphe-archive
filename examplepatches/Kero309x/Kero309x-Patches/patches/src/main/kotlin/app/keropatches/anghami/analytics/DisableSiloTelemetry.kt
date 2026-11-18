// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.analytics

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The stored answer to "should song plays be reported to Silo?".
 *
 * It is a preference over `silo_song_tracking`, written from the sign-in
 * response. The only reader is `SiloPlaySongReporting.reportSongPlayEvent`, which
 * returns `false` immediately when this answers `false`.
 */
private object SongTrackingFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "getSiloSongTrackingEnabled",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("silo_song_tracking"),
)

/**
 * The stored answer to "should navigation instrumentation be reported?".
 *
 * It is a preference over `product_instrumentation`, also written from the
 * sign-in response. Four reporters read it — click, impression, time spent and
 * playqueue — and each one logs "disabled by API" and returns when it is false.
 */
private object SiloInstrumentationFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "isSiloInstrumentationEnabled",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("product_instrumentation"),
)

/**
 * The reporter for a generic application error event.
 *
 * It has no preference gate: whenever a caller hands it a non-empty source it
 * builds a payload and queues it. The method is `void` and its callers do not use
 * a result, so answering it with an early return cannot leave work half done.
 */
private object AppErrorReportingFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/silo/error/SiloErrorReporting;",
    name = "postAppGenericErrorEvent",
    isStatic = true,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

/**
 * The asynchronous upload of the device specification payload.
 *
 * It is private and ungated, reached only from the tail of `prepareDeviceSpecs`.
 * Returning before it queues anything leaves the builder in place; that builder
 * is also used by the local device profile, so skipping the upload does not
 * remove anything the application reads.
 */
private object DeviceInfoReportingFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/silo/deviceinfo/SiloDeviceInfoReporting;",
    name = "reportDeviceSpecsAsync",
    isStatic = true,
    returnType = "V",
    parameters = listOf("Lcom/anghami/ghost/pojo/DeviceSpecs;"),
)

/**
 * Stops Anghami's own telemetry client from receiving data.
 *
 * This is separate from `anghami.privacy.analytics`: that patch removes the
 * third-party SDKs, while Silo is first-party and queues to its own endpoint.
 *
 * Four code points are changed, each of them an existing local gate or an
 * ungated reporter:
 *
 * 1. Song-play reporting is answered `false`. This is the same answer the client
 *    gives when the server does not enable tracking, and `reportSongPlayEvent`
 *    returns before it builds or queues a payload.
 * 2. Navigation instrumentation is answered `false`. The click, impression,
 *    time-spent and playqueue reporters all check it and return without queueing.
 * 3. Generic application error events return immediately.
 * 4. The device specification upload returns immediately.
 *
 * The preferences themselves are left as the server wrote them; only the local
 * answers change.
 */
@Suppress("unused")
val disableSiloTelemetryPatch = bytecodePatch(
    name = "Disable first-party Silo telemetry",
    description = "Stops the application reporting playback, navigation and device data to Anghami's own Silo telemetry.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.PRIVACY.label)

    execute {
        SongTrackingFingerprint.method.returnEarly(false)
        SiloInstrumentationFingerprint.method.returnEarly(false)
        AppErrorReportingFingerprint.method.returnEarly()
        DeviceInfoReportingFingerprint.method.returnEarly()
    }
}

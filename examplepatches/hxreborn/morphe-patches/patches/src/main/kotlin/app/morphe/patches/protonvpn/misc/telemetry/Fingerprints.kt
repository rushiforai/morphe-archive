/*
 * Copyright (C) 2026 Paresh Maheshwari
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Ported from Paresh-Maheshwari/paresh-patches:
 * https://gitlab.com/Paresh-Maheshwari/paresh-patches/-/commit/7c732a6b7791eade5d22fdd64f0d9addac57f56b
 * Commit 7c732a6b7791eade5d22fdd64f0d9addac57f56b (2026-04-29),
 * patches/src/main/kotlin/app/paresh/patches/protonvpn/misc/DisableTelemetryPatch.kt
 */
package app.morphe.patches.protonvpn.misc.telemetry

import app.morphe.patcher.Fingerprint

internal object VpnTelemetryEventFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/telemetry/Telemetry;",
    name = "addEvent",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lcom/protonvpn/android/telemetry/TelemetryEvent;", "Z", "Lkotlin/coroutines/Continuation;"),
)

internal object CoreTelemetryUploadSchedulerFingerprint : Fingerprint(
    definingClass = "Lme/proton/core/telemetry/data/worker/TelemetryWorkerManagerImpl;",
    returnType = "V",
    parameters = listOf("Lme/proton/core/domain/entity/UserId;", "J"),
)

internal object ObservabilityUploadFingerprint : Fingerprint(
    definingClass = "Lme/proton/core/observability/data/usecase/SendObservabilityEventsImpl;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/util/List;", "Lkotlin/coroutines/Continuation;"),
)

internal object ObservabilityEnabledFingerprint : Fingerprint(
    definingClass = "Lme/proton/core/observability/data/IsObservabilityEnabledImpl;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/Continuation;"),
)

internal object PaymentsObservabilityWorkerFingerprint : Fingerprint(
    definingClass = "Lme/proton/android/payment/observability/ObservabilityWorkerImpl;",
    name = "start",
    returnType = "V",
    parameters = emptyList(),
)

/*
 * Copyright (C) 2026 Paresh Maheshwari
 * Copyright (C) 2026 sqzass
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Ported from Paresh-Maheshwari/paresh-patches:
 * https://gitlab.com/Paresh-Maheshwari/paresh-patches/-/commit/7c732a6b7791eade5d22fdd64f0d9addac57f56b
 * Commit 7c732a6b7791eade5d22fdd64f0d9addac57f56b (2026-04-29),
 * patches/src/main/kotlin/app/paresh/patches/protonvpn/misc/DisableTelemetryPatch.kt
 */
package app.sqzass.patches.protonvpn.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.resource.ResourceType
import app.sqzass.patches.protonvpn.misc.anchors.resourceField
import com.android.tools.smali.dexlib2.Opcode

private const val PAYMENT_FFI = "Lme/proton/android/payment/core/PaymentFfi;"

internal object VpnTelemetryEventFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("event added, total: "),
)

internal object CoreTelemetryEnqueueFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("core.telemetry.enqueue"),
)

internal object ObservabilityUploadFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/util/List;", "L"),
    filters = listOf(
        fieldAccess(
            definingClass = "Lme/proton/core/observability/data/api/request/MetricEvent;",
            opcode = Opcode.SGET_OBJECT,
        ),
    ),
)

internal object ObservabilityEnabledFingerprint : Fingerprint(
    filters = listOf(
        resourceField(ResourceType.BOOL, "core_feature_observability_enabled"),
        methodCall(definingClass = "Landroid/content/res/Resources;", name = "getBoolean", location = MatchAfterImmediately()),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

internal object PaymentsObservabilityWorkerFingerprint : Fingerprint(
    name = "runObservabilityWorker",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, classDef -> classDef.type == PAYMENT_FFI && method.implementation != null },
)

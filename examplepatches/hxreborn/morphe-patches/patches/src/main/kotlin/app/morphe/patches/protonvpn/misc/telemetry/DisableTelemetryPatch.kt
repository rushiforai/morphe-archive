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

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.protonvpn.misc.settings.patchesSettingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.misc.analytics.disableAnalyticsCollectionPatch
import app.morphe.patches.shared.misc.proton.markPatchApplied
import app.morphe.util.matchSingle
import app.morphe.util.returnBoxedBooleanEarly
import app.morphe.util.returnEarly

private const val RETURN_UNIT = """
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    return-object p0
"""

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Stops sending usage statistics and diagnostics to Proton.",
) {
    compatibleWith(AppCompatibilities.PROTON_VPN)
    dependsOn(patchesSettingsPatch, disableAnalyticsCollectionPatch)

    execute {
        markPatchApplied("disableTelemetry")
        ObservabilityEnabledFingerprint.matchSingle().method.returnBoxedBooleanEarly(false)
        VpnTelemetryEventFingerprint.matchSingle().method.addInstructions(0, RETURN_UNIT)
        ObservabilityUploadFingerprint.matchSingle().method.addInstructions(0, RETURN_UNIT)
        CoreTelemetryUploadSchedulerFingerprint.matchAll(2..2).forEach { it.method.returnEarly() }
        PaymentsObservabilityWorkerFingerprint.matchSingle().method.returnEarly()
    }
}

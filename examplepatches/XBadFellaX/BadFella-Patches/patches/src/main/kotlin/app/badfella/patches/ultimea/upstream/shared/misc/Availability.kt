/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.badfella.patches.ultimea.upstream.shared.misc

import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.AvailabilityResolver
import app.morphe.patcher.patch.PatchAvailability

private fun architectureAvailability(selection: PatchAvailability, vararg supported: ApkArchitecture) =
    AvailabilityResolver { _, architecture ->
        if (architecture == ApkArchitecture.UNIVERSAL || architecture in supported) selection else PatchAvailability.UNAVAILABLE
    }

internal fun arm64Availability(selection: PatchAvailability) =
    architectureAvailability(selection, ApkArchitecture.ARM64_V8A)

internal val requireArm64 = arm64Availability(PatchAvailability.ENABLED)

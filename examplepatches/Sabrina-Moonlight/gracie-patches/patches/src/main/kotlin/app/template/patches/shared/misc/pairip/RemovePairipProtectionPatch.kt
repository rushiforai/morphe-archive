/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.template.patches.shared.misc.pairip

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

val removePairipProtectionPatch = bytecodePatch(
    name = "Remove Pairip Protection",
    description = "Skips the local license check entry point.",
    default = true,
) {
    compatibleWith(GLASS_WIDGETS)

    execute {
        if (classDefByOrNull(LICENSE_CLIENT_CLASS) == null) return@execute
        InitializeLicenseCheckFingerprint.method.returnEarly()
    }
}

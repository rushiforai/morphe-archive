/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.trackchecker.patches.menu

import app.loki.patches.universal.addOptionsMenuRow
import app.loki.patches.universal.menuPatch
import app.morphe.patcher.patch.bytecodePatch

/**
 * A "Loki Patches" row in TrackChecker's own menu. `TC_MainActivity` is the launcher activity, declared in the
 * manifest, so its name survives obfuscation; the row goes through the framework's options-menu methods.
 */
internal val trackCheckerMenuRowPatch = bytecodePatch {
    dependsOn(menuPatch)

    execute {
        addOptionsMenuRow("Lcom/metalsoft/trackchecker_mobile/ui/activities/TC_MainActivity;", "TrackChecker")
    }
}

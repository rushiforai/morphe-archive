/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.adm.patches.menu

import app.loki.patches.universal.addOptionsMenuRow
import app.loki.patches.universal.menuPatch
import app.morphe.patcher.patch.bytecodePatch

/**
 * A "Loki Patches" row in ADM's own menu. `com.dv.get.Main` is the launcher activity, declared in the manifest, and
 * builds its toolbar menu through the framework's `onCreateOptionsMenu`, so the row is added there and its tap is
 * answered in `onOptionsItemSelected`. Neither name can be changed by the obfuscator.
 */
internal val admMenuRowPatch = bytecodePatch {
    dependsOn(menuPatch)

    execute {
        addOptionsMenuRow("Lcom/dv/get/Main;", "ADM")
    }
}

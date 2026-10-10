/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.reddit.misc.fix.signature

import app.morphe.patcher.Fingerprint

internal object ApplicationFingerprint : Fingerprint(
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    custom = { _, classDef ->
        classDef.superclass == "Landroid/app/Application;"
    }
)

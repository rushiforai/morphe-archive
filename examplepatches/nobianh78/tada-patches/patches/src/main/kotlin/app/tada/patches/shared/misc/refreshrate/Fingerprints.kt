/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/2695
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.shared.misc.refreshrate

import app.morphe.patcher.Fingerprint

internal object ActivityOnCreateFingerprint : Fingerprint(
    name = "onCreate",
    custom = { _, classDef ->
        classDef.superclass == "Landroid/app/Activity;"
    }
)

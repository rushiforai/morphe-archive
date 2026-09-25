/*
 * Copyright 2026 MRX Halawa.
 * https://github.com/mrx7014/MRXHalawa-Patches/pull/2695
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.shared.misc.refreshrate

import app.morphe.patcher.Fingerprint

internal object ActivityOnCreateFingerprint : Fingerprint(
    name = "onCreate",
    custom = { _, classDef ->
        classDef.superclass == "Landroid/app/Activity;"
    }
)

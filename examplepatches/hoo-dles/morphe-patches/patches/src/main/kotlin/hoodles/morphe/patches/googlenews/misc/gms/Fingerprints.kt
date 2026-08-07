/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.googlenews.misc.gms

import app.morphe.patcher.Fingerprint

object MainActivityOnCreateFingerprint : Fingerprint(
    strings = listOf("StartActivity onCreate")
)
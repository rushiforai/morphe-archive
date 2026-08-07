/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.xodo.misc.signature

import app.morphe.patcher.Fingerprint

object SignatureCheckFingerprint : Fingerprint(
    parameters = listOf("Lviewer/CompleteReaderMainActivity;"),
    strings = listOf("UTF_8")
)
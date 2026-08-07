/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.soundcloud.misc.telemetry

import app.morphe.patcher.Fingerprint

object HandleMessageFingerprint : Fingerprint(
    definingClass = "/TrackingHandler;",
    name = "handleMessage"
)
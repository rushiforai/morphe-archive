/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.protonvpn.delay

import app.morphe.patcher.Fingerprint

object GetLongDelayFingerprint : Fingerprint(
    name = "getChangeServerLongDelayInSeconds"
)

object GetShortDelayFingerprint : Fingerprint(
    name = "getChangeServerShortDelayInSeconds"
)
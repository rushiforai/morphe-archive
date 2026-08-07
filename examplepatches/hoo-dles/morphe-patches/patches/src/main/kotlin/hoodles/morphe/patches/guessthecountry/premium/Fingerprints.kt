/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.guessthecountry.premium

import app.morphe.patcher.Fingerprint

object IsProductInCacheFingerprint : Fingerprint(
    name = "isIapProductInFileCache",
    definingClass = "AppActivity;"
)
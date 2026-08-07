/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.niagara.pro

import app.morphe.patcher.Fingerprint

object ProStateConstructorFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        name = "toString",
        strings = listOf("E(1=", ", 2=")
    ),
    name = "<init>",
    parameters = listOf("Z", "Z", "Z")
)
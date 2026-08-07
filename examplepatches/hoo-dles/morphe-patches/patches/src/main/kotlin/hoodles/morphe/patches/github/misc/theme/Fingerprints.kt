/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.github.misc.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

object FunctionalColorsCtorFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf("GitHubFunctionalColors(backgroundPrimary=")
    ),
    name = "<init>"
)

object SetNavigationBarContrastFingerprint : Fingerprint(
    filters = listOf(
        methodCall(name = "setNavigationBarContrastEnforced")
    )
)
package io.github.xxlc.patches.grok

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

@Suppress("unused")
val bypassLicenseCheckPatch = bytecodePatch(
    name = "Bypass license check",
    description = "Skip the Pairip license check when Grok starts.",
    default = true,
) {
    compatibleWith(grokCompatibility)

    execute {
        LicenseCheckFingerprint.method.returnEarly()
    }
}

package app.template.patches.sofascore.misc.integrity

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.morphe.util.returnEarly

@Suppress("unused")
val disablePlayIntegrityPatch = bytecodePatch(
    name = "Disable Play Integrity",
    description = "Bypasses Google Play Integrity API checks."
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        IntegrityManagerRequestTokenFingerprint.methodOrNull?.returnEarly()
        IntegrityManagerFactoryCreateFingerprint.methodOrNull?.returnEarly()
    }
}

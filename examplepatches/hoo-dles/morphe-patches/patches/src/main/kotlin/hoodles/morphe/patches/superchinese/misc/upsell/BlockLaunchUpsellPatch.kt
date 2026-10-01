package hoodles.morphe.patches.superchinese.misc.upsell

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import hoodles.morphe.compatibility.Compat
import hoodles.morphe.patches.superchinese.shared.signature.spoofSignaturePatch

@Suppress("unused")
val blockLaunchUpsellPatch = bytecodePatch(
    name = "Block launch upsell",
    description = "Prevents the premium upsell popup on app launch."
) {
    compatibleWith(Compat.SUPERCHINESE)

    dependsOn(spoofSignaturePatch)

    execute {
        UpsellFetchFingerprint.method.returnEarly()
    }
}
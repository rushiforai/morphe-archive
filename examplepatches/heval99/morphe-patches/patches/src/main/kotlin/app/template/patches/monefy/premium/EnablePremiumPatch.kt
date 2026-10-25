package app.template.patches.monefy.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_MONEFY
import app.morphe.util.returnEarly

/** The fingerprint's only match. Several would mean the shape drifted, so that fails too. */
private fun BytecodePatchContext.single(fingerprint: Fingerprint, label: String): MutableMethod {
    val matches = fingerprint.matchAllOrNull().orEmpty()
    return matches.singleOrNull()?.method ?: throw PatchException(
        "Expected one $label, found " + matches.map { "${it.classDef.type}->${it.method.name}" },
    )
}

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Pro features."
) {
    compatibleWith(COMPATIBILITY_MONEFY)

    execute {
        // Master check: pro app id or cached purchase.
        single(MasterProFingerprint, "master pro check").returnEarly(true)

        // Cached purchase flag itself (read directly by the main activity).
        single(ProBoughtFingerprint, "pro purchase flag reader").returnEarly(true)

        // RevenueCat can mark the subscription expired on every sync; treat it as never
        // expired so premium is not revoked client-side.
        single(SubscriptionExpiredFingerprint, "subscription-expired reader").returnEarly(false)
    }
}

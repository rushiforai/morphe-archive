package app.template.patches.easynotes.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_EASYNOTES

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the VIP-only fonts, note backgrounds, stickers and drawing tools. " +
        "The app checks entitlement entirely locally — there is no license server — so forcing " +
        "the App.isVip() gate to return true unlocks everything, and stays unlocked even though " +
        "BillingManager resets the underlying purchase flags from Play on every startup."
) {
    compatibleWith(COMPATIBILITY_EASYNOTES)

    execute {
        // Master gate. Patched on the consumer rather than on the flag writers, because
        // BillingManager$5/$7/$8 overwrite has_buyed / has_subscribe from Play's response on
        // every launch — a forced return value is immune to that reset.
        val isVip = AppIsVipFingerprint.methodOrNull
            ?: throw PatchException("Failed to resolve App.isVip()Z (anchor string \"isVip \")")

        isVip.returnEarly(true)

        // Cosmetic "Google VIP" badge. No unique string to anchor on, so best-effort:
        // if R8 ever renames it, skip silently rather than fail the whole patch.
        AppIsGoogleVipFingerprint.methodOrNull?.returnEarly(true)
    }
}

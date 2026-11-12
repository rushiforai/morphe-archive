package app.template.patches.easynotes.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_EASYNOTES

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks VIP features."
) {
    compatibleWith(COMPATIBILITY_EASYNOTES)

    execute {
        // Master gate. Patched on the consumer rather than on the flag writers, because
        // BillingManager$5/$7/$8 overwrite has_buyed / has_subscribe from Play's response on
        // every launch — a forced return value is immune to that reset.
        val isVip = AppIsVipFingerprint.methodOrNull
            ?: throw PatchException("Failed to resolve App.isVip()Z (anchor string \"isVip \")")

        isVip.returnEarly(true)

        // Cosmetic "Google VIP" badge. App.isGoogleVip is kept by name (matches in 1.3.65.1019), so
        // a vanished anchor fails loudly instead of leaving the badge locked.
        AppIsGoogleVipFingerprint.method.returnEarly(true)
    }
}

package com.torbenstriegel.morphe.patches.chargeprice.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.torbenstriegel.morphe.patches.shared.Constants.COMPATIBILITY_CHARGEPRICE

/**
 * Unlocks Chargeprice premium features **without requiring an account login**.
 *
 * ## How premium is decided (verified on Chargeprice 4.4.0, fr.chargeprice.app)
 *
 * Every premium gate in the app is driven by `combinedPremium = local || remote`:
 *
 *   local  ("isPremium")       = PurchaseDataController.isPremium() StateFlow,
 *                                seeded from SecurePreferences "isPremium" and updated
 *                                by Google Play Billing (`updateIsPremiumStatus`).
 *   remote ("isRemotePremium") = UserSettings.products contains MOBILE_PREMIUM, read in
 *                                every ViewModel's `fetchRemotePremium()`.
 *
 * ## Why the upstream patch needs a login
 *
 * The upstream patch injects `MOBILE_PREMIUM` into the response of
 * `UserDataControllerProcessingKt.parseUserSettings(...)`, i.e. into the *server*
 * payload. That payload only exists after a successful login, so premium is only
 * granted once the user signs in.
 *
 * ## Why this patch does not need a login
 *
 * Both premium paths converge on a single read:
 * `SecurePreferencesImpl.getSettingsProducts()`.
 *
 *   - `PurchaseDataControllerImpl.updateIsPremiumStatus(...)` computes its premium
 *     flag as `playPurchase || securePreferences.getSettingsProducts().contains(MOBILE_PREMIUM)`.
 *   - `UserDataController.getUserSettings()` (used by `fetchRemotePremium()`) builds the
 *     `UserSettings` model from `securePreferences.getSettingsProducts()`.
 *
 * By making `getSettingsProducts()` always return a list containing `MOBILE_PREMIUM`,
 * both the local and the remote flag become `true` offline — no account, no Play
 * purchase, no network round-trip required.
 *
 * The method is a fixed-name (non-obfuscated) member of the persistence layer and is
 * stable across versions; the injected smali only uses the always-present
 * `java.util.ArrayList` plus the `UserSettings$Product.MOBILE_PREMIUM` enum constant.
 */
private val UserSettingsProductsFingerprint = Fingerprint(
    definingClass = "Lfr/chargeprice/core/internal/persistence/shared/secure/SecurePreferencesImpl;",
    name = "getSettingsProducts",
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium features",
    description = "Unlocks Chargeprice premium features (ad-free, price filters, route " +
        "planner, favourites, ...) without needing to log in or purchase a subscription.",
) {
    compatibleWith(COMPATIBILITY_CHARGEPRICE)

    execute {
        // .registers 4 -> v0/v1 are free locals at the method start.
        UserSettingsProductsFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                sget-object v1, Lfr/chargeprice/core/internal/model/local/user/UserSettings${'$'}Product;->MOBILE_PREMIUM:Lfr/chargeprice/core/internal/model/local/user/UserSettings${'$'}Product;
                invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                return-object v0
            """
        )
    }
}

package semicoloncolonel.mobilestream.patches.walgreens.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.shared.misc.prependGate
import semicoloncolonel.mobilestream.patches.walgreens.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Hide sponsored products.
//
// Walgreens 118.0 switches every ad placement with a feature flag from its
// getconfig service: the Criteo sponsored carousels and display banners
// (criteo...), the Google Ad Manager banners, promo cards, and sponsored
// coupon (gam...), and the Rokt partner offers after checkout (ROKT). Native
// screens and the React Native screens all read flags through one suspend
// method, RealFeatureFlags.isEnabled(flag, continuation). There the flag goes
// through ShoppingAdsFilter, and the ad flags read as off.
//
// The reader's class and the flag interface are renamed by R8, so the reader
// is found by its package and shape, and the flag's key is read by the
// extension.
// ─────────────────────────────────────────────────────────────────────────────

private const val ADS_FILTER = "Lsemicoloncolonel/mobilestream/extension/shared/misc/ShoppingAdsFilter;"

internal object FeatureFlagReaderFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/walgreens/foundation/feature/flags/impl/") &&
            method.parameterTypes.size == 2 &&
            method.parameterTypes[1].toString() == "Lkotlin/coroutines/Continuation;"
    },
)

@Suppress("unused")
val hideSponsoredProductsPatch = bytecodePatch(
    name = "Hide sponsored products",
    description = "Turns off the sponsored product carousels, ad banners, and partner offers " +
        "after checkout.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        FeatureFlagReaderFingerprint.method.prependGate(
            """
                invoke-static/range { p1 .. p1 }, $ADS_FILTER->isWalgreensAdFlag(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :msp_orig
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
            """.trimIndent(),
        )
    }
}

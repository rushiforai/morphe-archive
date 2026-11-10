package app.sledgesune.patches.syncme.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

private const val BILLING_PRODUCT = "Lcom/syncme/billing/data/product/BillingProduct;"

/**
 * Matches `PremiumAccess.isAdFree()` (obfuscated, e.g. `Lcvc;->j()Z` in 4.71.2.1):
 *
 * ```
 * public boolean isAdFree() {
 *     if (isPremium()) return true;
 *     return purchases.hasAny(EnumSet.of(BillingProduct.GIFT_NO_ADS, BillingProduct.NO_ADS))
 *         || AdsGracePeriodHelper.isGracePeriod();
 * }
 * ```
 *
 * This is the single check that the in-house ads SDK (`com.sync.me.adssdk`, through its
 * bridge `e.a.f()`) and every ad surface in the app (after-call screen, missed-call reminder,
 * app-open ads, consent prompt, promotions) consult before showing an ad.
 *
 * The class and method names are obfuscated, so match on the un-obfuscated enum fields it reads.
 * `GIFT_NO_ADS` followed by `NO_ADS` is unique to this method (the other gift checks never read `NO_ADS`).
 */
object IsAdFreeFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = BILLING_PRODUCT,
            name = "GIFT_NO_ADS",
        ),
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = BILLING_PRODUCT,
            name = "NO_ADS",
        ),
        methodCall(
            definingClass = "Ljava/util/EnumSet;",
            name = "of",
        ),
    )
)

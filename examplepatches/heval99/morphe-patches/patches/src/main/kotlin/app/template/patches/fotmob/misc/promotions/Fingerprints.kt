package app.template.patches.fotmob.misc.promotions

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// The FotMob+ promo config model keeps its name.
internal const val PLUS_PROMO_CONFIG = "Lcom/fotmob/android/feature/billing/model/PlusPromoConfig;"

// The static reader that parses the "fotmobplus_promo" Remote Config value into a PlusPromoConfig
// (239: jnb.a()). Both callers null-check its result: the promo eligibility coroutine then answers
// false, and the RevenueCat experiment attribute is not set.
internal object PlusPromoConfigFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = PLUS_PROMO_CONFIG,
    parameters = listOf(),
    strings = listOf("fotmobplus_promo"),
)

package patches.investify

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/*
 * Investify's entire "premium" is ad removal. One backend entitlement drives it:
 * `com.blueinklabs.investifystocks.models.auth.Entitlements` (a Realm object) with a boolean
 * `no_ads` field (`@SerializedName("no_ads")`), read via its getter. The app decides ad-free/premium
 * from `user.getEntitlements().getNoAds()`. RevenueCat (`remove_ads_entitlement`) is only the
 * purchase/paywall path — after a buy the backend flips `no_ads`; the UI reads the backend flag,
 * not RevenueCat's CustomerInfo. So forcing the `no_ads` getter true = ad-free/premium, no purchase.
 *
 * Why patch the getter (not the two consumer ViewModel methods that call it): it's the single
 * chokepoint every consumer routes through, present and future. Two concrete getter impls exist —
 * the base model (unmanaged / freshly JSON-parsed User) and the generated Realm proxy subclass
 * (managed User read from the local DB). We force BOTH so it holds regardless of managed state.
 *
 * Name-agnostic anchoring: the model package `.../models/auth/Entitlements` is NOT obfuscated
 * (stable across releases); the getter method name IS obfuscated (currently `m()`), so we derive it
 * structurally — the model's public no-arg ()Z getters — instead of hardcoding `m`. The proxy is
 * found as the class whose superclass is Entitlements, and only its overrides of those same getter
 * names are touched (never Realm's own internal ()Z methods like isValid/isFrozen).
 *
 * Emitted at the top of each getter:
 *   const/4 v0, 0x1
 *   return v0
 *
 * Verified in smali: base `Entitlements` declares exactly two no-arg ()Z getters — `m()` (no_ads)
 * and `n()` (no_ads_offline); `n()` has zero callers. Forcing both true is harmless (both only ever
 * mean "more ad-free"). Consumers `LJ4/f;->d()Z` (Settings/Profile UI) and `LF4/A;->g()Z` (main
 * ViewModel) both return the result of this getter.
 */

private const val ENTITLEMENTS = "Lcom/blueinklabs/investifystocks/models/auth/Entitlements;"

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium (remove ads)",
    description = "Unlocks Investify premium — forces the backend `no_ads` entitlement getter to " +
        "report true in both the model and its Realm proxy, so the app treats the account as ad-free " +
        "without any purchase. Ad SDK loads are gated on this flag app-wide.",
) {
    compatibleWith(COMPATIBILITY_INVESTIFY)

    execute {
        val forceTrue = """
            const/4 v0, 0x1
            return v0
        """.trimIndent()

        val base = mutableClassDefBy(ENTITLEMENTS)

        // The model's boolean entitlement getters (no_ads / no_ads_offline) — public, no-arg, ()Z.
        val getterNames = base.methods
            .filter { it.parameters.isEmpty() && it.returnType == "Z" }
            .map { it.name }
            .toSet()

        // Base model + the generated managed Realm proxy (its subclass), if present.
        val proxy = mutableClassDefByOrNull { it.superclass == ENTITLEMENTS }
        val targets = listOfNotNull(base, proxy)

        var patched = 0
        targets.forEach { cls ->
            cls.methods
                .filter { it.name in getterNames && it.parameters.isEmpty() && it.returnType == "Z" }
                .forEach { method ->
                    method.addInstructions(0, forceTrue)
                    patched++
                }
        }

        check(patched >= 1) { "Investify: no_ads getter not found on $ENTITLEMENTS" }
    }
}

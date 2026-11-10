package app.template.patches.materialcapsule

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

// ════════════════════════════════════════════════════════════════════════════════
// Material Capsule (com.pryshedko.mtisland) 17.3 (versionCode 173) — fingerprint anchors.
//
// Material Capsule is a single-dex Kotlin/Compose build, fully R8-obfuscated: every
// app class is a short name (`u40`, `uu1`, `pu1`, …) that reshuffles on every release.
// Each anchor below is therefore a *string literal the code must contain* (Cipher
// transformation, Play product IDs), never a class or method name. The pro store and
// its flow mapper are located from the string anchor and then by *shape* (field/parameter
// types), so an R8 name shift does not break the patch.
// ════════════════════════════════════════════════════════════════════════════════

/**
 * The secure pro store's decrypt helper — `uu1.a(String, SecretKey)String`.
 *
 * Its only hard-coded literal is the Cipher transformation `AES/CBC/PKCS7Padding`;
 * the class it lives in (`uu1`) also holds the AndroidKeyStore alias `pro_version_key`
 * and the DataStore key `SECURE_DATA`, and exposes the one-shot pro read
 * `c(Continuation)Object` plus the encrypted write `e(Z, Continuation)Object`.
 *
 * The matched class IS the pro store; the patch then edits its `c` read, and locates
 * the sibling flow mapper from the same class type.
 */
val ProStoreDecryptFingerprint = Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;", "Ljavax/crypto/SecretKey;"),
    filters = listOf(string("AES/CBC/PKCS7Padding")),
)

/**
 * The billing products constructor — `u40.<init>(Context, uu1, ny1)V`.
 *
 * Identified by the ordered Play product-ID literals it builds (the $5 in-app SKU
 * first, then the trial subscription). Two ordered literals are required because
 * `sku_one_dollar_with_trial` alone also appears in the paywall view-model (`tz7`);
 * the pair is unique to the purchase repository.
 *
 * The matched class (`u40`) holds the client-side entitlement source
 * `b(u40, Continuation)Object` — "the account owns any Play purchase" — which is the
 * value the app encrypts into its local pro store.
 */
val BillingProductsFingerprint = Fingerprint(
    filters = listOf(
        string("sku_five_dollars"),
        string("sku_one_dollar_with_trial"),
    ),
)

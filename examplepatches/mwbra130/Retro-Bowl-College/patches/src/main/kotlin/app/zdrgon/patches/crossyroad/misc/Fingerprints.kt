package app.zdrgon.patches.crossyroad.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Google Play Billing 8.0.0 — Crossy Road 7.14.0 ────────────────────────
//
// All targets are public Play Billing API methods on the SDK's own
// BillingClientImpl — never obfuscated, unique by (name, returnType,
// parameters) within the class.
//
// 7.14.0 still ships billing 8.0.0 (billing.properties in the base APK), and
// the BillingClientImpl member layout was re-verified by jadx decompile of
// the 7.14.0 base APK on 2026-10-27: field `zzf` is a `zzs`, launchBillingFlow
// reads the SKU via BillingFlowParams.zzj() → zzby.zza(...) → SkuDetails /
// zzk() → ProductDetailsParams, in the same order as 7.13.0.
//
// The zzce testing-wrapper subclass routes every one of these calls through
// static synthetic bridges that invoke-super into the BillingClientImpl
// methods — so patching the four methods below covers BOTH the direct and
// the wrapper path.

/**
 * BillingClientImpl.launchBillingFlow(Activity, BillingFlowParams)BillingResult
 * (.registers 33 → p0=v30, p1=v31, p2=v32; large try/catch table — see the
 * patch's WHY-helper note).
 *
 * PRIMARY hook: forge an OK BillingResult + a fake Purchase for the tapped
 * SKU and deliver it through the registered PurchasesUpdatedListener
 * (this.zzf → zzs.zzd()) so C# grants the product synchronously and no
 * Google Play sheet ever opens.
 */
object LaunchBillingFlowFingerprint : Fingerprint(
    returnType = "Lcom/android/billingclient/api/BillingResult;",
    parameters = listOf(
        "Landroid/app/Activity;",
        "Lcom/android/billingclient/api/BillingFlowParams;"
    ),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "launchBillingFlow"
)

/**
 * BillingClientImpl.acknowledgePurchase(AcknowledgePurchaseParams,
 * AcknowledgePurchaseResponseListener)V (.registers 9).
 * C# acknowledges durables right after the grant; the real service would
 * reject the fake token — fire the listener with OK instead.
 */
object AcknowledgePurchaseFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lcom/android/billingclient/api/AcknowledgePurchaseParams;",
        "Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;"
    ),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "acknowledgePurchase"
)

/**
 * BillingClientImpl.consumeAsync(ConsumeParams, ConsumeResponseListener)V
 * (.registers 9). C# consumes coin packs immediately after the grant — same
 * Play-rejection failure mode as acknowledge; report OK with the token from
 * the params.
 */
object ConsumeAsyncFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lcom/android/billingclient/api/ConsumeParams;",
        "Lcom/android/billingclient/api/ConsumeResponseListener;"
    ),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "consumeAsync"
)

/**
 * BillingClientImpl.queryProductDetailsAsync(QueryProductDetailsParams,
 * ProductDetailsResponseListener)V (.registers 9, NO catch entries — direct
 * labeled injection is safe).
 *
 * Serve a fake per-SKU ProductDetails catalog so the store populates and the
 * buy buttons enable even without a working Play catalog fetch; SKU ids and
 * types are read dynamically from p1.zza() → zzbt of
 * QueryProductDetailsParams$Product (zza()=id, zzb()=type).
 */
object QueryProductDetailsAsyncFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lcom/android/billingclient/api/QueryProductDetailsParams;",
        "Lcom/android/billingclient/api/ProductDetailsResponseListener;"
    ),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "queryProductDetailsAsync"
)

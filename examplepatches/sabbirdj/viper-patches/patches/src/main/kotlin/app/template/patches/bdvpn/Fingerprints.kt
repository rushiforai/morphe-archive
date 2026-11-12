package app.template.patches.bdvpn

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * Bangladesh VPN (com.banglatech.bangladeshvpn) 67.26, versionCode 67.
 * A dzboot OpenVPN white-label app. VIP is a Play Billing subscription
 * (products base-weekly-plan / weekly-auto, vpn1m, base-daily-onetime),
 * but every gate is evaluated LOCALLY -- there is no server entitlement
 * check. The subscription tier is a local enum Lt7/m:
 *   UNKNOWN (X=-1), NONE (X=0), BASIC (X=5), FULL (X=100).
 * Verified on 67.26 by hand-built .apks v4 (confirmed working on device
 * 2026-11-12): VIP servers connect and the premium section activates.
 *
 * The premium state is decided in three places, all of which must be
 * forced, because each reads the tier from a different source:
 *
 * 1) Lcl/g.H / Lcl/g.I -- the tier predicates. H returns true when the
 *    tier's X >= 5 (BASIC); I returns true when X >= 100 (FULL). They
 *    gate VIP server connections (MainFragment, ServersFragment,
 *    VPNService) and the full-feature gates (Settings, MainActivity).
 *    Forcing their false-branch const to 1 makes both always true.
 *
 * 2) Ll8/q.onQueryPurchasesResponse -- the Play Billing "subs" purchase
 *    query callback. It sets MainFragment.v0 from whether any purchase
 *    is PURCHASED; v0 gates ads only. Forcing its init const to 1 makes
 *    ads stay off.
 *
 * 3) The tier itself, derived in Landroidx/lifecycle/u0.invokeSuspend and
 *    persisted in DataStore key "current_subs" (Lt7/u, default NONE).
 *    The deriver maps the Play Billing purchase list to a tier: empty
 *    list -> NONE, any purchase -> BASIC, a "full_features" product ->
 *    FULL. With MicroG RE the purchase query returns null, so the
 *    deriver falls back to reading the persisted tier -- which is NONE
 *    from any earlier unpatched run. So BOTH the deriver's initial NONE
 *    and the DataStore default NONE are forced to FULL. On a fresh
 *    install (or after clearing app data) the tier is FULL from the
 *    start, the paywall observes FULL, and the premium section shows
 *    as active.
 *
 * Every fingerprint pins its defining class and method name. The app is
 * heavily R8-obfuscated (single-letter classes/methods), so pinning is
 * essential -- without it the patcher could match the wrong method.
 */

/**
 * Lcl/g.H -- the BASIC-tier predicate (X >= 5).
 *
 * Original:
 *   if-eqz p0, :cond_b
 *   iget p0, p0, Lt7/m;->X:I
 *   sget-object v0, Lt7/m;->Y:Lt7/m;
 *   const/4 v0, 0x5
 *   if-lt p0, v0, :cond_b
 *   const/4 p0, 0x1
 *   return p0
 *   :cond_b
 *   const/4 p0, 0x0
 *   return p0
 * The patch replaces the `const/4 p0, 0x0` at :cond_b with 0x1, so H
 * always returns true.
 */
object BdvpnTierCheckHFingerprint : Fingerprint(
    definingClass = "Lcl/g;",
    name = "H",
    returnType = "Z",
    parameters = listOf("Lt7/m;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = "Lt7/m;",
            name = "X",
            type = "I",
        ),
    )
)

/**
 * Lcl/g.I -- the FULL-tier predicate (X >= 100).
 *
 * Original is identical to H except the threshold is 0x64 (100) and the
 * false branch is :cond_c. The patch replaces its `const/4 p0, 0x0`
 * with 0x1, so I always returns true.
 */
object BdvpnTierCheckIFingerprint : Fingerprint(
    definingClass = "Lcl/g;",
    name = "I",
    returnType = "Z",
    parameters = listOf("Lt7/m;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET,
            definingClass = "Lt7/m;",
            name = "X",
            type = "I",
        ),
    )
)

/**
 * Ll8/q.onQueryPurchasesResponse -- the Play Billing "subs" purchase
 * query callback. Sets MainFragment.v0 (ads gate) from whether any
 * purchase is PURCHASED.
 *
 * Original:
 *   invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z
 *   move-result p1
 *   const/4 v1, 0x0
 *   if-eqz p1, :cond_14
 *   ...
 * The patch replaces the `const/4 v1, 0x0` with 0x1, so v0 is always
 * true and ads stay off.
 */
object BdvpnQueryPurchasesFingerprint : Fingerprint(
    definingClass = "Ll8/q;",
    name = "onQueryPurchasesResponse",
    returnType = "V",
    parameters = listOf(
        "Lcom/android/billingclient/api/BillingResult;",
        "Ljava/util/List;",
    ),
    filters = listOf(
        string("purchases"),
        methodCall(
            name = "isEmpty",
            returnType = "Z",
        ),
    )
)

/**
 * Landroidx/lifecycle/u0.invokeSuspend -- the tier deriver (a suspend
 * function in Lm8/h's scope). Maps the Play Billing purchase list to
 * the Lt7/m tier and persists it to DataStore.
 *
 * Original (relevant part):
 *   sget-object v3, Lt7/m;->Z:Lt7/m;   // NONE
 *   invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z
 *   if-nez v6, :cond_30b                // empty list -> stays NONE
 *   sget-object v3, Lt7/m;->e0:Lt7/m;   // BASIC
 *   ... iterate for "full_features" -> Lt7/m;->f0 (FULL)
 * The patch replaces the initial `sget-object v3, Lt7/m;->Z` with
 * `sget-object v3, Lt7/m;->f0`, so an empty purchase list yields FULL
 * instead of NONE.
 */
object BdvpnTierDeriverFingerprint : Fingerprint(
    definingClass = "Landroidx/lifecycle/u0;",
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("full_features"),
    )
)

/**
 * Lt7/u.<clinit> -- the DataStore key "current_subs" holding the
 * persisted Lt7/m tier, with default NONE.
 *
 * Original:
 *   new-instance v0, Lt7/u;
 *   const-string v1, "current_subs"
 *   sget-object v2, Lt7/m;->Z:Lt7/m;   // NONE (default)
 *   const-class v3, Lt7/m;
 *   invoke-direct {v0, v2, v3, v1}, Lt7/e;-><init>(...)V
 * The patch replaces the `sget-object v2, Lt7/m;->Z` with
 * `sget-object v2, Lt7/m;->f0`, so the default tier is FULL.
 */
object BdvpnCurrentSubsDefaultFingerprint : Fingerprint(
    definingClass = "Lt7/u;",
    name = "<clinit>",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("current_subs"),
    )
)

package app.zdrgon.patches.mp3tagger.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Free-tier predicate — Smart MP3 Tagger 26.8.130 ───────────────────
//
// Direct Play Billing (no RevenueCat/Adapty). Four products feed ONE
// unified entitlement state; there is no separate
// subscription-vs-lifetime state anywhere in the app:
//
//   one-time  tageditor...mp3edit.remove_ads   "Super Pro Forever" $49.99
//   sub       com.smarttageditor.sub_pro       monthly $2.99
//   sub       com.smarttageditor.sub_pro_7     weekly  $1.99
//   sub       com.smarttageditor.sub_pro_year  yearly  $31.99
//
// The billing wrapper (Lc52;, classes.dex) keeps purchase records
// (Lkq0; = productId + acknowledged flag, built once in Lq76;->d from
// the Play purchase JSON) in a local in-memory list (Lc52;->i).
// Lc52;->b(Ljava/lang/String;)Z answers "is this SKU in the owned
// list" from that list, and it has exactly ONE caller in the whole
// app — the reader below. Lc52; and Lmr0; are Dagger singletons
// (constructed once, in Lq7;->get / Lr7;->get). No server is
// consulted at read time (no dev backend exists in the app at all).
//
//   Lmr0;->a()Z   (PUBLIC FINAL)
//     -> returns 0 as soon as c52.b(<any of the 4 SKUs>) is true;
//        returns 1 only when NOTHING is owned.
//
// POLARITY (corrected 2026-11-03 — the original recon inverted this
// and v1.54.0 shipped a pin to 1, the free value): a() is the app's
// FREE-TIER predicate, not an isPro getter. Branch-level proof: all
// four if-nez probes in a() jump to the shared "const/4 v, 0; return"
// tail; the "const/4 v, 1; return" is the no-hit fall-through.
// Consumer proof (18 call sites in 11 methods — MainActivity.p,
// MoreTabFragment.D, Lq5; x4 methods, Lt5;, Lt8;, Lu8;, Lup1;,
// Lx5;): the promotion popup, the upgrade menu entries and every ad
// loader fire only when a() == 1. A paying user — including a
// "Super Pro Forever" buyer — runs with a() == 0 everywhere, so the
// patch pins 0.
//
// Dead ends ruled out by the re-audit: Lmr0;'s own fields (a–f) are
// AppConfig AD parameters (feed position, collapsible-banner flags),
// written from AppConfig by Lm33; and read by the ad-request builder
// Lc5; — not entitlement state. Lc52;->l is the billing-initialized
// flag. The owned list Lc52;->i is read directly only inside the
// billing callback's own add/dedupe methods (Lb52;->b/c). No
// SharedPreferences premium flag exists.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality;
// the method is declared "public final".

/** The single free-tier reader. Pinning it to 0 pins the whole app to the owned state. */
object IsFreeTierFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lmr0;",
    name = "a"
)

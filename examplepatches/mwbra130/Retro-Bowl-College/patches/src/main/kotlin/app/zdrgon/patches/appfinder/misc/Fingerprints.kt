package app.zdrgon.patches.appfinder.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Plan tier gate — App Finder 1.5.1 ────────────────────────────────
//
// App Finder sells three paid plans (Advance / Ultimate /
// Professional) as Play Billing products. The current plan is a
// single int on the user-state object (verified 2026-11-16 across
// both app dexes):
//
//   Lscadica/aq/UU;   field f:I — the plan tier
//     0 = free, 1/2 = Advance, 3 = Ultimate, 4 = Professional
//     (tier names from Lscadica/aq/BllKt;->pns)
//
// The tier is produced by Lscadica/aq/BlKt;->chkP, which parses the
// user's Play purchases (productId char 0 = period w/m/s/x, char 1
// = tier digit), stores one Lscadica/aq/Pla; per tier in UU.pla and
// derives UU.f from the plans whose end timestamp is still ahead.
// A lifetime ("x") purchase is stored with an end ~200 years out;
// nothing anywhere distinguishes it beyond that timestamp.
//
// At READ time nothing asks a server and nothing re-checks the Pla
// list: every feature asks the state object directly —
//
//   Lscadica/aq/UU;->getF()I   ~39 call sites across 14 files
//
// (filter/sort gates, other-country apps, local ratings lists,
// developer-country filter, min/target-API display, and the CSV
// export limit, which reads getF() > 3 ? 20,000 : 2,000 locally at
// export time). The only direct iget of UU.f in the app is inside
// getF()/setF() themselves. UsrKt.valiChg, despite the name, only
// refreshes gated UI when the value changes; it makes no network
// calls.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality;
// getF is declared "public final" (0x0011).

/** The plan-tier reader. Pinning it pins every paid feature. */
object PlanTierFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lscadica/aq/UU;",
    name = "getF"
)

// ── Telemetry — App Finder 1.5.1 ─────────────────────────────────────
//
// Census verified 2026-11-16 across all three base dexes (the four
// XAPK splits are config-only and carry no code):
//
// There is NO third-party analytics/crash/ads SDK in this app: no
// Firebase Analytics or Crashlytics (com.google.firebase appears
// only as firebase-encoders, a datatransport dependency; there is
// no FirebaseApp reference, no FirebaseInitProvider and no
// google-services config), no Sentry / AppMetrica / Amplitude /
// Mixpanel / Adjust / AppsFlyer. No AD_ID permission, no
// AdvertisingIdClient, no install-referrer API, and no ANDROID_ID
// or random-UUID reads in app code. The manifest declares only
// INTERNET, BILLING and ACCESS_NETWORK_STATE.
//
// The reporting that does exist is first-party, to the developer's
// own backend (afapi.org / intcon.appquery.org), and rides on two
// readers of the same user-state object as the plan tier:
//
//   Lscadica/aq/UU;->getIid()Ljava/lang/String;
//     The persistent install ID. The backend assigns it in the
//     /inf startup exchange and UU stores it; from then on it is
//     read out ONLY through this getter (dex census: the iid field
//     itself is touched only inside UU; getIid's only callers are
//     the three request-payload classes Qn, Qq and Qu, which take
//     their iid default from it). So every search query — and every
//     later /inf post — carries the same cross-session identifier.
//
//   Lscadica/aq/UU;->log(Lscadica/aq/Sli;Z)Ljava/lang/String;
//     A usage log disguised as a settings diff: it walks the
//     user-state fields, and for each field whose value changed
//     since the previous snapshot (minus a denylist that excludes
//     iid itself) appends "field=value" to a string. Its only
//     external caller is the search-request builder in RsltsKt,
//     which attaches it to every query as Qn.uu (" |" + log(...)).
//     The backend needs no diff to answer a search — the full query
//     state travels in the same request — so this channel exists
//     purely to report which settings the user changed between
//     searches.
//
// Both methods are declared "public final" (0x0011), like getF.

/** The persistent install-ID reader. Pinning it severs the ID from every outbound payload. */
object InstallIdFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lscadica/aq/UU;",
    name = "getIid"
)

/** The settings-diff usage log. Pinning it empties the uu field of every search query. */
object SettingsDiffLogFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Lscadica/aq/Sli;", "Z"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lscadica/aq/UU;",
    name = "log"
)

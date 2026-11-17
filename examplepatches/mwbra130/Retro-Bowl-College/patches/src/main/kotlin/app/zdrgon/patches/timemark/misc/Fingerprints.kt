package app.zdrgon.patches.timemark.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Plus entitlement — Timemark v10.0.316 ────────────────────────────
//
// Timemark sells "Plus" ($49.99/yr personal premium) and a Business
// plan. Billing is the Play Billing Library directly (product
// plus_1year_onetime); there is no RevenueCat/Superwall, no PairIP
// and no signature self-check. Entitlement is issued by the
// developer's server and cached locally:
//
//   GET member/vip/info  ->  VipInfo { isVip, vipExpireTime,
//     vipType (0 none / 1 basic / 2 premium), vipVersion,
//     watermarkSaveQuota }
//
// The refresh coroutine Ldb0/l;->invokeSuspend is the bean's main
// consumer: it writes the bean into the state holder Ldb0/n;
//
//   Ldb0/n;->a Z   = VipInfo.isVip()          (in-memory mirror)
//   Ldb0/n;->b J   = VipInfo.getVipExpireTime()
//   prefs "key_is_vip" = isVip, "key_vip_expire_time" = expireTime
//   (persisted through Lcom/xhey/xcamera/util/f;)
//
// and hands the quota bean to Leb0/d;->f(...). From then on every
// local gate reads the state back through three readers on Ldb0/n;
// (verified by a full 8-dex caller census, 2026-11-16):
//
//   Ldb0/n;->d()Z  = key_is_vip && expireTime > now   (15 callers,
//     incl. WatermarkRemovedPreviewActivity)
//   Ldb0/n;->e()Z  = d() || config["key_team_space_is_business_
//     plan_user"]                                     (70 callers:
//     settings, custom filename, watermark style, markup editor,
//     camera widgets, paywall — the dominant reader)
//   Ldb0/n;->g()Lp50/e; = (d() || business) ? ACTIVE :
//     queried ? NON_MEMBER : UNKNOWN                  (5 callers)
//
// vipType is never persisted and no feature gate reads it; locally
// the app has exactly one premium boolean, and that boolean IS the
// Plus state. The Business distinction rides on a separate local
// flag — see the Business section below.
//
// The free-tier photo-save quota is a second state machine:
// Leb0/d;->a()Leb0/a; derives UNLIMITED / NON_MEMBER /
// QUOTA_AVAILABLE / QUOTA_EXHAUSTED from Ldb0/n;->d()Z plus the
// server-issued WatermarkSaveQuota bean (type/limit/remaining)
// stored by Leb0/d;. Its monitor() sibling delegates to the same
// reader family.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality.
// VipInfo getters are "public final" (0x0011); the Ldb0/n; and
// Leb0/d; readers are "public static" (0x0009).

/** The server bean's isVip getter. Pinning it makes the app's own refresh persist the Plus state. */
object VipIsVipFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/xhey/xcamera/data/model/bean/vip/VipInfo;",
    name = "isVip"
)

/** The server bean's expiry getter. Pinned to 2100-01-01 so the persisted state never lapses. */
object VipExpireTimeFingerprint : Fingerprint(
    returnType = "J",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/xhey/xcamera/data/model/bean/vip/VipInfo;",
    name = "getVipExpireTime"
)

/** The plain local VIP reader (persisted prefs + clock). */
object VipReaderDFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Ldb0/n;",
    name = "d"
)

/** The dominant VIP reader (d() OR business-plan flag), ~70 call sites. */
object VipReaderEFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Ldb0/n;",
    name = "e"
)

/** The membership-state enum reader used by the paywall/state UI. */
object VipStateFingerprint : Fingerprint(
    returnType = "Lp50/e;",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Ldb0/n;",
    name = "g"
)

/** The watermark photo-save quota reader. Pinned to UNLIMITED. */
object SaveQuotaFingerprint : Fingerprint(
    returnType = "Leb0/a;",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Leb0/d;",
    name = "a"
)

// ── Location funnel — Timemark v10.0.316 ────────────────────────────
//
// Every GPS fix flows through one class: Lcom/xhey/xcamera/location/
// GlobalLocationService; is the ONLY subclass of the location engine
// Lcom/xhey/xcamera/location/a;, and its refreshPlace is called only
// from that engine. The fix object is Lry/c;:
//
//   Lry/c;->a D = latitude,  Lry/c;->b D = longitude
//
// (proven by refreshPlace building new double[]{fix.a, fix.b} as the
// lat/lng pair for both the server place-list request and the local
// Geocoder). refreshPlace resolves the fix into LocationInfoData
// (largeposition / smallposition / addressList / EXIF
// LocationDetail) — the exact strings the watermark prints — so
// overwriting a/b at refreshPlace entry redirects the server place
// lookup, the geocoder, the geo-address cache keys and the composed
// watermark text in one move.
//
// refreshPlace is "public" (0x0001), 36 registers, 4 ins: with
// parameters (Lry/c;, List, List) the fix arrives in v33 and the
// method's own prologue copies it to v4 (move-object/from16 at
// index 1). The spoof hooks right after that copy and hands v4 to
// the extension, which overwrites a/b from the coordinates the
// user picked at runtime in the patch settings — no patch-time
// coordinates, no re-patch to change location. (Direct iput-wide
// writes into v33 are impossible: iput-wide is format 22c, whose
// register fields are 4-bit; see RECON.md.)

/** The single location funnel entry. The spoof overwrites the fix's lat/lng here. */
object RefreshPlaceFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lry/c;", "Ljava/util/List;", "Ljava/util/List;"),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/xhey/xcamera/location/GlobalLocationService;",
    name = "refreshPlace"
)

// ── Business plan state — Timemark v10.0.316 ───────────────────────
//
// The Business distinction locally is the boolean config flag
// "key_team_space_is_business_plan_user" (string resource
// 0x7f1212c5), read through the config store Lcom/xhey/xcamera/
// util/i1;->a(I Z)Z, which resolves the id to its key string and
// reads the SAME prefs store that holds "key_is_vip". A full
// census found exactly 8 literal read sites: Ldb0/n;->e() and
// Ldb0/n;->g() (both already pinned by the Plus set), the team-
// space cache refreshers Lb50/y0;->H(...) and Lb50/y0;->I()V,
// the sync writer Lb50/y0;->W(Z)V, an account coroutine
// (Lb50/p0;->invokeSuspend, which calls W(false) when the
// account has no team space), RenewalOfferHost.f (suppresses the
// personal renewal offer for business users) and one analytics
// call. The cached static Lb50/y0;->k Z is read by the quota
// reader (Leb0/d;), the paywall (PurchaseActivity) and the ad
// service (XAdServices).
//
// Lb50/y0;->W(Z)V is the producer: called with the server-synced
// business value, it writes BOTH the cache (sput y0.k) and the
// persisted config (i1.g) whenever they differ. W is "public
// static" (0x0009), 4 registers, so its boolean argument sits
// in v3.
//
// WHY THE v1.79.10 WRITER-ONLY PIN FAILED ON-DEVICE (diagnosed
// 2026-11-16 from the dex; see RECON.md): W is called from
// exactly three places — Lb50/y0;->k0(MemberSubscriptionInfo)
// and the Lb50/k0; coroutine, both fed by the SERVER's
// MemberSubscriptionInfo.getStatus() inside team-space /
// subscription sync flows, and Lb50/p0;->invokeSuspend, which
// is the teamSpaceLogOut coroutine calling W(false). For an
// account that never enters those flows W never runs at all,
// so the flag is never persisted — and every other path derives
// the cached flag from the (still false) persisted value: the
// ONLY writers of Lb50/y0;->k Z in the whole app are W (its
// argument), I()V and H(...) (both re-read the persisted flag
// into k). The paywall (PurchaseActivity) reads k directly, so
// it kept presenting the personal Plus state. The store is NOT
// mismatched — i1.a and i1.g resolve through the same i1.e key
// mapping into the same util/f prefs; the write simply never
// happened.
//
// The fix therefore pins the READ side: k is seeded true in
// y0's <clinit>, and the two refreshers' flag reads (I and H)
// are forced true at their move-result, so every write of k
// writes true regardless of sync state. W's argument pin is
// kept: when the subscription sync does run, it now also
// persists the flag true through i1.g. RenewalOfferHost.f —
// the one remaining functional literal read site — is forced
// the same way. (The Lb50/p0; read's result is discarded, and
// Lq50/j;->e is analytics; neither needs a pin. Ldb0/n;->e/g
// are already pinned by the Plus set.)

/** The business-plan sync writer. Kept pinned so a subscription sync persists the flag true. */
object BusinessSyncFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lb50/y0;",
    name = "W"
)

/** Team-space state holder's static initializer — seeds the cached business flag (y0.k) true at class load. */
object BusinessStaticInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    definingClass = "Lb50/y0;",
    name = "<clinit>"
)

/** Team-space cache refresh (public static I()V): re-reads the persisted business flag into y0.k. */
object BusinessCacheRefreshFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lb50/y0;",
    name = "I"
)

/** TeamSpaceStatusManager refresh (public final H): re-reads the persisted business flag into y0.k. */
object BusinessStatusRefreshFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroidx/fragment/app/FragmentActivity;", "Lyf0/c;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lb50/y0;",
    name = "H"
)

/** Renewal-offer host's business read (public final f): business users are not shown the personal renewal offer. */
object RenewalOfferBusinessReadFingerprint : Fingerprint(
    returnType = "Lo70/w2;",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/xhey/xcamera/ui/bill/renewal/RenewalOfferHost;",
    name = "f"
)

// ── Business round 3 (2026-11-16): the prefs funnel ────────────────
//
// v1.79.13 pinned every consumer of the cached flag, yet on device
// the plan still presented as Plus. A full round-3 census (RECON.md)
// proved two things:
//
//   1. There are NO other literal readers of the business key: all
//      8 call sites of i1.a with resource 0x7f1212c5 are the sites
//      already pinned. But i1.a itself has no spare register
//      (2 registers, 2 ins) for a key-compare guard, and its ONLY
//      path to storage is the string-keyed funnel beneath it,
//      Lcom/xhey/xcamera/util/f;->p(Ljava/lang/String; Z)Z — an
//      MMKV boolean read (3 registers: v0 local, v1 key, v2
//      default). Pinning f.p with a key compare covers every
//      i1.a read of the business key — cached, direct or dynamic —
//      at the one funnel they all pass through.
//
//   2. The displayed current-plan NAME is not flag-driven anywhere
//      in the app. Every surface that prints a plan name derives
//      it from the SERVER subscription model — MemberSubscription-
//      Info.getType()/getStatus() inside the downloaded GroupInfo
//      (Lb50/y0;->j / y0.p), mapped by Lb50/y0;->v (0 Free /
//      1 Business / 2 Trial): the team-space header, the
//      team-space plan page, the team chooser rows, and the
//      paywall's Business-tab "Current Plan" block (visible only
//      when a y0.p GroupInfo carries type 1 / status 1). No local
//      boolean is ever mapped to the "Business" label, so that
//      label cannot appear without a server-issued team
//      subscription. The f.p pin completes the LOCAL flag; it
//      does not (and cannot) fabricate the server team model.

/** The string-keyed prefs boolean read beneath i1.a — the funnel every config read of the business key passes through. */
object PrefsBoolReadFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "Z"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lcom/xhey/xcamera/util/f;",
    name = "p"
)

// ── Business round 4 (2026-11-16): the subscription model funnels ──
//
// Round 3 proved the displayed plan NAME is rendered only from the
// server subscription model, MemberSubscriptionInfo inside the
// downloaded (or locally cached) GroupInfo, via Lb50/y0;->v:
// type==1 && status==1 -> Business (1), type==1 && status==2 ->
// Trial (2), else Free (0). Round 3 left the model untouched;
// round 4 pins its two getters — the same technique as the shipped
// VipInfo pins (isVip/getVipExpireTime) — so any MemberSubscription-
// Info the app actually holds reports Business/active:
//
//   getType()   -> 1 (Business)
//   getStatus() -> 1 (active)
//
// Full 8-dex reader census of both getters (2026-11-16, RECON.md
// round 4): every reader is display, gating, analytics or a local
// derived-state cache (y0.v/O/D/E/j/e/h, PurchaseActivity A/U/j0,
// Lw40/g3;->D, Lw40/ia via v, Lm40/e rows, Ls40/v;->B, Lig0/b;->N,
// Lb50/d1;->j and Lb50/h1;->i analytics property builders, and the
// y0.w per-group state map fed by centerGroupList$2 / y0.a). The
// two network-response handlers that read them (queryGroupInfo$2,
// centerGroupList$2) use them only in branch conditions and to
// derive that same local state; nothing writes getter values into
// a request, an order or a persisted model — Gson serializes the
// bean's FIELDS, which the pins do not touch, and the one sync
// derivation (y0.k0 / Lb50/k0;) feeds only Lb50/y0;->W, the local
// flag writer already pinned. TeamMemberSubscriptionInfo is a
// wrapper bean with NO type/status getters of its own (it holds a
// MemberSubscriptionInfo), so these two pins cover it. The third
// status-like getter, getSubscriptionStatus, has exactly one
// reader (Ln40/h;->c, an analytics property builder) and is not
// part of the plan-name path; it is deliberately not pinned.
//
// Reach limit (dex-proven): the holders Lb50/y0;->j (current
// GroupInfo) and y0.p (cached group list) are populated ONLY from
// Lcom/xhey/xcamera/data/pref/b;->b()/d() — Gson deserialization of
// a JSON string persisted by earlier server sync flows — and from
// the sync coroutines themselves. Nothing constructs a GroupInfo
// locally. For an account that has never had a team, j stays null
// and p stays empty, so the model-fed name surfaces (team-space
// header/plan page, team chooser, the paywall Business tab's
// "Current Plan" block) cannot render at all; where a GroupInfo
// does exist, these pins make its subscription read Business.

/** The server subscription model's plan-type getter (1 = Business). Pinned to 1 in Enable Business. */
object MemberSubscriptionTypeFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/xhey/xcamera/data/model/bean/teamspace/MemberSubscriptionInfo;",
    name = "getType"
)

/** The server subscription model's status getter (1 = active). Pinned to 1 in Enable Business. */
object MemberSubscriptionStatusFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/xhey/xcamera/data/model/bean/teamspace/MemberSubscriptionInfo;",
    name = "getStatus"
)

/**
 * The paywall's status-page builder. Its P() method is the SOLE
 * code site that loads string resource 0x7f120f58
 * ('「Timemark Plus」 purchased and activated') and sets it on the
 * banner TextView (view-binding field K) whenever Ldb0/n;->e() is
 * true. The string has no Business variant anywhere in the app's
 * resources; Enable Business overwrites the loaded string with
 * the Business literal right after the getString call.
 */
object PurchaseBannerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/xhey/xcamera/ui/bill/PurchaseActivity;",
    name = "P"
)

// ── Patch-settings machinery — Timemark v10.0.316 ──────────────────
//
// The spoof's runtime half lives in the bundle extension
// (app.template.extension.timemark): a PatchContext that tracks
// the resumed activity (hxreborn's pattern), an OpenStreetMap
// pin-drop picker, and the saved-coordinates store. Three hooks
// wire it into the app:
//
//   1. TodayApplication.onCreate ("public final", 14 registers,
//      p0 = v13): PatchContext.attach(Application) at index 0.
//   2. The settings fragment Lcom/xhey/xcamera/ui/setting/z0;
//      builds its rows (ArrayList field o0 of NewSettingItem) in
//      onViewCreated ("public", 10 registers) and copies them
//      into the adapter's own list (field n on
//      Lcom/xhey/xcamera/ui/setting/e;) with an ArrayList.addAll
//      right before setAdapter. The settings patch inserts the
//      row-append call immediately after that addAll, and a
//      value-refresh call at the fragment's p() ("public final",
//      the onResume refresh).
//   3. Row clicks are delivered by the adapter as a synthetic
//      Lbz/i; Function1 whose e0 field holds the NewSettingItem
//      (constructor (Object, Object, int, int): X = 4th arg = 1
//      for settings rows, e0 = 2nd arg = the item). Its invoke
//      ("public final", 16 registers: p0 = v14, p1 = v15) is
//      hooked at index 0 with a key check for the patch row.

/** Host Application.onCreate — the PatchContext.attach hook point. */
object ApplicationOnCreateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/xhey/xcamera/TodayApplication;",
    name = "onCreate"
)

/** Settings fragment onViewCreated — the row-append hook point (after the adapter addAll). */
object SettingsOnViewCreatedFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/xhey/xcamera/ui/setting/z0;",
    name = "onViewCreated"
)

/** Settings fragment refresh (called from onResume) — keeps the patch row's value current. */
object SettingsRefreshFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/xhey/xcamera/ui/setting/z0;",
    name = "p"
)

/** Settings row click dispatcher — the patch-row click hook point. */
object SettingsClickFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lbz/i;",
    name = "invoke"
)

// ── Telemetry — Timemark v10.0.316 ──────────────────────────────────
//
// Census verified 2026-11-16 across all 8 dexes and the manifest:
//
// SensorsData is the analytics platform (694 SDK class refs, plus
// 88 AB-test and 186 Sensors Focus classes; SensorsDataContent-
// Provider + SensorsFocusContentProvider in the manifest). The app
// sends its product analytics — clicks, watermark edits, purchase
// funnel, and location-page events that carry lat/lng and address
// properties — through exactly two funnels, both ending in
// SensorsDataAPI.track:
//
//   1. Lcom/xhey/xcamera/util/SensorAnalyzeUtil;->wrapSensorsTrack
//      (both overloads) — the analytics facade's own sinks; every
//      one of its dozens of event methods ends here.
//   2. Lcom/xhey/xcamera/services/LogService;->track (both
//      overloads) — the implementation behind the framework
//      logger's track() (Xlog / Lty/h;), called all over the app;
//      LogService.monitor() delegates to it as well.
//
// Firebase is present (Analytics, Crashlytics, Messaging,
// Sessions) but the app code does not call FirebaseAnalytics
// directly (13 referencing classes are SDK registrars and camera
// classes referencing the registrar chain); its upload plumbing is
// Google datatransport, whose three components are declared in the
// manifest. Install-referrer API classes are present for ad/SDK
// attribution. The ad SDK sprawl (AppLovin, AdMob, FAN, Vungle,
// Mintegral, Bigo, Pangle, Unity, Tramini, Qumeng, AdSurge) is ads,
// not telemetry, and is out of scope for this patch.
//
// First-party API reporters on the feature client
// (reportDeviceFeature, reportActiveVersion, addEventCount,
// saveUserAttribution) are deliberately NOT pinned: they are
// suspend calls returning response beans that feature code
// consumes (the event counters feed server-side feature
// accounting), so they are dual-use feature traffic, not a clean
// telemetry funnel. See RECON.md for the full census.
//
// Access flags: wrapSensorsTrack overloads are "public static"
// (0x0009); LogService.track overloads are "public" (0x0001).

/** SensorsData sink #1: the analytics facade's event sink (with properties). */
object WrapSensorsTrackPropsFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lorg/json/JSONObject;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lcom/xhey/xcamera/util/SensorAnalyzeUtil;",
    name = "wrapSensorsTrack"
)

/** SensorsData sink #1b: the analytics facade's event sink (no properties). */
object WrapSensorsTrackFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lcom/xhey/xcamera/util/SensorAnalyzeUtil;",
    name = "wrapSensorsTrack"
)

/** SensorsData sink #2: the framework logger's backing track (with properties). */
object LogServiceTrackPropsFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lorg/json/JSONObject;"),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/xhey/xcamera/services/LogService;",
    name = "track"
)

/** SensorsData sink #2b: the framework logger's backing track (no properties). */
object LogServiceTrackFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/xhey/xcamera/services/LogService;",
    name = "track"
)

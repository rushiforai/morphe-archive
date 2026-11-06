package app.zdrgon.patches.idm.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── 1DM 20.0 (30257) — ad funnels ──────────────────────────────────────
//
// Census of the merged dexes (88,078 classes), verified 2026-11-03:
//
// The app requests ads through exactly two funnels.
//
// 1) Appodeal mediation (AppLovin MAX, Mintegral, Pangle, Unity Ads,
//    Chartboost, etc. sit behind it). The app-level entry points are
//    the static Appodeal API itself — the app has no separate loader
//    layer above it:
//      - MyAppCompatActivity.initializeAdsAndRun initializes Appodeal
//        with a type mask of 3 or 7 and registers the banner view id.
//      - The obfuscated ad manager Li/om; (BannerCallbacks +
//        InterstitialCallbacks) drives cache/show for the rotation.
//    Every Appodeal.show call site in app code (Li/b0; type 3
//    interstitial, Li/j5; and Li/nm; type 64 banner/native slot,
//    Li/x73;) treats a false return as the designed "no ad" outcome
//    (runs its continuation / notifies not-showing), so pinning show
//    to false is the safe off state. cache() is fire-and-forget
//    preloading; no-oping it starves the rotation.
//    Formats in use: interstitial (type 3) and the banner/native
//    slot (type 64, coordinated with the app's BannerManager).
//    MREC and native-feed views are never requested by app code
//    (zero app callers of getMrecView / getNativeAds /
//    getBannerView). REWARDED: no opt-in rewarded flow exists — zero
//    app callers of setRewardedVideoCallbacks or getReward, and the
//    init mask never includes a rewarded type. Nothing rewarded is
//    touched because there is nothing rewarded to touch.
//
// 2) Amazon Publisher Services (APS/DTB), a direct second path that
//    does NOT go through Appodeal:
//      - AmazonService.fetch() is the single internal funnel: its
//        fetchBanner / fetchBannerBackfill / fetchInterstitial are
//        called ONLY from fetch(). Its caches feed the browser's
//        BannerView.setAd (banner backfill) and Li/x73; (interstitial).
//        With fetch() no-oped the caches stay empty and consumers get
//        null, a state stock code already handles before the first
//        fetch completes.
//      - Li/g0; is a separate direct APS fetcher used by the Amazon
//        fallback case in Li/b0;: its two (Z)DTBAdResponse methods
//        synchronously load a DTBAdRequest. b0 null-checks the
//        response and bails to its continuation runnable on null, so
//        pinning both to null is safe.
//
// 3) The house cross-promo system (BannerInfo offers baked into the
//    app: VPN offers, the Telegram help group, 1DM+ itself, third-party
//    app promos). The offers ROTATE — the same placement shows different
//    creatives over time. Three render paths exist:
//
//    a) NewBannerView (id/defaultBannerViewNew 0x7f0a0372, layout
//       res/layout/default_banner_new.xml, root starts visibility=gone)
//       — the tall bar at the bottom of the downloads screen (icon +
//       text + "Get 1DM+"/INSTALL buttons) and the same container in
//       the browser / torrent-details layouts. It is filled and shown
//       by exactly one funnel: the "FallbackNetwork" source Li/l82;
//       (driven from MyAppCompatActivity.onPostCreate via Li/k82;
//       runnables). l82's method U+06E6 U+06D6 U+06E4 registers the
//       offer list (built by Li/x73;), U+06E6 U+06D6 U+06E6 is the
//       SHOW entry: it picks the next due BannerInfo, finds the
//       NewBannerView and schedules the fill runnable Li/ba1; (case
//       24), whose body sets every field and ends with
//       setVisibility(VISIBLE) on the view. No other code path fills
//       the view or sets it visible (full census 2026-11-03).
//       FIX HISTORY: v1.57.0 pinned U+06E6 U+06D6 U+06EC instead —
//       that sibling method is the HIDE trigger (it schedules
//       Li/vq1; to set the view GONE). The show entry stayed live,
//       so both placements kept rendering on-device. This round pins
//       the show entry and drops the hide pin (stock hide behaviour
//       is harmless once nothing can show).
//
//    b) The OLD Lightning BannerView (id/defaultBannerView 0x7f0a0371,
//       layout res/layout/default_banner.xml, also starts gone) sits
//       in the same banner containers. BannerManager delivers house
//       BannerInfos to it via DefaultBannerCallback ->
//       BannerView.onAdReceived -> BannerView.setAd(Integer,
//       BannerInfo) (private), the view's only fill/show method
//       (its APS backfill half is already dead via the AmazonService
//       stub above). Pin setAd and this view can never render a
//       house creative either.
//
//    c) The downloads-list fragment's OWN offer strip — a different,
//       simpler system, NOT BannerInfo: LinearLayout
//       id/offer_vpnLL (0x7f0a089c) at the top of
//       res/layout/download_list.xml (MyTextView id/offer_vpn +
//       EImageView id/hide_vpn_message close icon). The layout
//       declares NO visibility, so it starts VISIBLE; the fragment
//       (MainActivity$a) decides content/visibility in exactly one
//       method, U+06E6 U+06D6 U+06DF (Z)V: it picks between the
//       shoppers-search promo (string/install_shoppers_search_desc),
//       the Telegram help text (string/info_help_telegram) and the
//       VPN offer (string/vpn_offer_x formatted with the configured
//       VPN name), then calls setVisibility(VISIBLE) — which would
//       override a layout-only edit. So this path is cut twice:
//       the method is pinned to return-void AND the layout element
//       is set visibility=gone in the resource half of the patch
//       (see RemoveAdsPatch). Field census: the strip view field is
//       written once in onCreateView (plus its click listeners) and
//       its visibility is written ONLY inside that one method.
//
// // NOTE: Morphe fingerprints compare access flags by EXACT equality.
// The obfuscated method names below are the exact dex names, verified
// codepoint-by-codepoint against the 20.0 dexes:

/** Appodeal show funnel — every format the app displays goes through it. */
object AppodealShowFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/app/Activity;", "I"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    definingClass = "Lcom/appodeal/ads/Appodeal;",
    name = "show"
)

/** Appodeal preload (2-arg). Fire-and-forget; starves the rotation. */
object AppodealCacheFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "I"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    definingClass = "Lcom/appodeal/ads/Appodeal;",
    name = "cache"
)

/** Appodeal preload (3-arg, with count). Same funnel, belt and braces. */
object AppodealCacheWithCountFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "I", "I"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    definingClass = "Lcom/appodeal/ads/Appodeal;",
    name = "cache"
)

/** AmazonService.fetch() — the single funnel for all APS bid caching. */
object AmazonServiceFetchFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PRIVATE),
    definingClass = "Lidm/internet/download/manager/amazon/AmazonService;",
    name = "fetch"
)

/** Li/g0; direct APS fetch #1 (name U+06E6 U+06D6 U+06D6). */
object AmazonDirectFetchFingerprint : Fingerprint(
    returnType = "Lcom/amazon/device/ads/DTBAdResponse;",
    parameters = listOf("Z"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Li/g0;",
    name = "ۦۖۖ"
)

/** Li/g0; direct APS fetch #2 (name U+06E6 U+06D6 U+06DC). */
object AmazonDirectFetchBackfillFingerprint : Fingerprint(
    returnType = "Lcom/amazon/device/ads/DTBAdResponse;",
    parameters = listOf("Z"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Li/g0;",
    name = "ۦۖۜ"
)

/** House promo SHOW entry in Li/l82; (name U+06E6 U+06D6 U+06E6).
 *  Schedules the Li/ba1; fill runnable that populates NewBannerView
 *  and sets it VISIBLE. Returning false is a normal stock outcome
 *  (no due offer / wrong provider tag), so callers handle it. */
object HousePromoShowFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Lacr/browser/lightning/activity/MyAppCompatActivity;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Li/l82;",
    name = "ۦۖۦ"
)

/** Downloads-fragment offer strip decider in MainActivity$a
 *  (name U+06E6 U+06D6 U+06DF). The only method that can set the
 *  id/offer_vpnLL strip VISIBLE or fill its text. */
object OfferStripFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lidm/internet/download/manager/MainActivity\$a;",
    name = "ۦۖ۟"
)

/** Old Lightning BannerView fill/show: BannerView.setAd (private).
 *  Sole entry from onAdReceived(DefaultBannerCallback); fills the
 *  house creative (or APS backfill) and makes the view visible. */
object HouseBannerSetAdFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/Integer;", "Lcom/aspsine/multithreaddownload/core/BannerInfo;"),
    accessFlags = listOf(AccessFlags.PRIVATE),
    definingClass = "Lacr/browser/lightning/view/BannerView;",
    name = "setAd"
)

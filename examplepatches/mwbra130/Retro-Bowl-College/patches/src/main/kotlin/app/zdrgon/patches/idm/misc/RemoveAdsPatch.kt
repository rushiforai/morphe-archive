package app.zdrgon.patches.idm.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.zdrgon.patches.idm.shared.Constants.COMPATIBILITY_IDM
import java.util.logging.Logger
import org.w3c.dom.Element

/**
 * 1DM (free) — Remove ads.
 *
 * Scope, stated plainly: this removes advertising from the FREE app.
 * It does NOT unlock 1DM+ features — 1DM+ is a SEPARATE paid app
 * (idm.internet.download.manager.plus) and its feature code is not
 * compiled into this binary at all; there is no plus state in here
 * to pin. The free binary contains zero BillingClient references
 * from app classes and no SKU / purchase surface.
 *
 * What it kills (census in Fingerprints.kt):
 *
 *   Appodeal.show(Activity, I)Z        -> return false
 *     The single display funnel for every mediated format the app
 *     uses (interstitial type 3; banner/native slot type 64). All
 *     four app call sites treat false as the designed "no ad"
 *     outcome, so flows continue normally.
 *   Appodeal.cache(Activity, I)V and cache(Activity, I, I)V
 *                                      -> return-void
 *     Preload starvation for the same rotation.
 *   AmazonService.fetch()V             -> return-void
 *     The single funnel of the DIRECT Amazon (APS/DTB) path: banner,
 *     banner-backfill and interstitial bid caching all start here.
 *     The caches stay empty; consumers (browser BannerView backfill,
 *     the Li/x73; interstitial) already handle a null cache entry.
 *   Li/g0;'s two (Z)DTBAdResponse fetchers -> return null
 *     The separate direct-APS loader used by the Amazon fallback in
 *     Li/b0;, which null-checks the response and bails cleanly.
 *   House cross-promo (the app's OWN rotating BannerInfo offers —
 *     VPN offers, the Telegram help group, 1DM+ itself, third-party
 *     app promos; NOT network ads). Three render paths, all cut:
 *     a) Li/l82; SHOW entry (U+06E6 U+06D6 U+06E6) -> return false.
 *        The only funnel that fills/shows NewBannerView (the tall
 *        bottom bar on the downloads screen): it schedules the
 *        Li/ba1; fill runnable, which sets the view VISIBLE.
 *        FIX (v1.57.0 miss): the first version pinned the sibling
 *        method U+06E6 U+06D6 U+06EC, which is the HIDE trigger —
 *        the show entry stayed live and the bar kept rendering.
 *        That pin is removed; this round pins the show entry.
 *     b) BannerView.setAd(Integer, BannerInfo) -> return-void.
 *        The OLD Lightning BannerView in the same containers is
 *        filled with house offers by BannerManager via
 *        onAdReceived -> setAd, its only fill/show method.
 *     c) Downloads-fragment offer strip (id/offer_vpnLL in
 *        res/layout/download_list.xml — the VPN/Telegram strip
 *        under the tab bar): its decider method in MainActivity$a
 *        (U+06E6 U+06D6 U+06DF)(Z)V -> return-void, AND the layout
 *        element is set visibility=gone in the resource half
 *        below. Both are needed: the layout starts VISIBLE (no
 *        visibility attribute) and the method would re-show it
 *        with setVisibility(VISIBLE) if only the layout changed.
 *
 * Rewarded: the app has NO opt-in rewarded flow (zero app callers of
 * the rewarded callbacks, no rewarded type in the init mask), so
 * there is no rewarded economy to preserve or to break.
 *
 * The green "Upgrade to 1DM+" bar at the bottom of the settings
 * drawer is the inline resource half below: the bar is a layout
 * view (id/nav_upgrade) declared at the bottom of the drawer in
 * res/layout/activity_main_idm.xml with text
 * @string/upgrade_idm_plus ("Upgrade to 1DM+") and the successColor
 * green background. No dex code references its string resource — it
 * is declared, not added in code — so the suppression is a layout
 * edit: android:visibility="gone" on that one element. Neighbouring
 * drawer items are untouched. The same resource half also hides
 * the downloads offer strip (id/offer_vpnLL, see (c) above); the
 * orange storage-warning bar directly above the banner container
 * in the downloads footer is a different element and is NOT
 * touched.
 *
 * NOT an ad, deliberately left alone: the orange "Click to fix" bar
 * is the app's own notice "The download location is not writable.
 * Click to fix" — a storage-permission warning, not advertising.
 *
 * Known cosmetic limit: an ad slot whose container keeps its own
 * layout height may leave a blank strip where a banner sat. The ad
 * itself never loads or renders.
 *
 * ══ WHY one entry: inline dependsOn(resourcePatch) ════════════════
 *
 * The DSL binds one context type per patch: bytecodePatch has no
 * document() API, resourcePatch has no dex API. Following the Crossy
 * Road "Free store" precedent, the layout edit lives in an inline
 * resourcePatch created inside dependsOn() — never a top-level
 * field, so PatchLoader never lists it separately and the Manager
 * shows exactly ONE entry: "Remove ads".
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes ads (Appodeal mediation and the direct Amazon ads path), hides the app's own rotating promo bars (the bottom house-promo bar and the downloads-screen VPN/Telegram offer strip) and the green \"Upgrade to 1DM+\" bar in the settings drawer. Does NOT unlock 1DM+ features — 1DM+ is a separate paid app and its features are not in this app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_IDM)

    // ══ Layout edits — inline resourcePatch dependency ═══════════════
    // Defined INSIDE dependsOn() so PatchLoader never discovers it as a
    // separate top-level entry (see KDoc "WHY one entry").
    dependsOn(
        resourcePatch(
            name = "Remove ads (layout edits)",
            description = "Hides the green \"Upgrade to 1DM+\" bar (id/nav_upgrade) at the bottom of the settings drawer and the downloads-screen offer strip (id/offer_vpnLL) by setting their layout visibility to gone.",
            default = true
        ) {
            compatibleWith(COMPATIBILITY_IDM)

            execute {
                val logger = Logger.getLogger(this::class.java.name)

                document("res/layout/activity_main_idm.xml").use { document ->
                    val all = document.getElementsByTagName("*")
                    var hidden = 0
                    for (i in 0 until all.length) {
                        val element = all.item(i) as Element
                        val id = element.getAttribute("android:id")
                        val text = element.getAttribute("android:text")
                        if (id.endsWith("nav_upgrade") || text.endsWith("upgrade_idm_plus")) {
                            element.setAttribute("android:visibility", "gone")
                            hidden++
                        }
                    }
                    if (hidden == 0) {
                        throw PatchException(
                            "1DM Remove ads: the \"Upgrade to 1DM+\" bar (id/nav_upgrade) was not found " +
                                "in res/layout/activity_main_idm.xml; refusing to ship without the upsell edit."
                        )
                    }
                    logger.info("1DM Remove ads: \"Upgrade to 1DM+\" drawer bar set to gone ($hidden element(s)).")
                }

                document("res/layout/download_list.xml").use { document ->
                    val all = document.getElementsByTagName("*")
                    var hidden = 0
                    for (i in 0 until all.length) {
                        val element = all.item(i) as Element
                        val id = element.getAttribute("android:id")
                        if (id.endsWith("offer_vpnLL")) {
                            element.setAttribute("android:visibility", "gone")
                            hidden++
                        }
                    }
                    if (hidden == 0) {
                        throw PatchException(
                            "1DM Remove ads: the downloads offer strip (id/offer_vpnLL) was not found " +
                                "in res/layout/download_list.xml; refusing to ship without the strip edit."
                        )
                    }
                    logger.info("1DM Remove ads: downloads offer strip (id/offer_vpnLL) set to gone ($hidden element(s)).")
                }
            }
        }
    )

    execute {
        // Appodeal display funnel: false is the designed "no ad" result
        // at every app call site.
        AppodealShowFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent()
        )

        // Appodeal preload starvation.
        AppodealCacheFingerprint.method.addInstructions(0, "return-void")
        AppodealCacheWithCountFingerprint.method.addInstructions(0, "return-void")

        // Direct Amazon path: the single bid-cache funnel.
        AmazonServiceFetchFingerprint.method.addInstructions(0, "return-void")

        // Direct Amazon path: the standalone DTBAdResponse loaders.
        val returnNull = """
            const/4 v0, 0x0
            return-object v0
        """.trimIndent()
        AmazonDirectFetchFingerprint.method.addInstructions(0, returnNull)
        AmazonDirectFetchBackfillFingerprint.method.addInstructions(0, returnNull)

        // House promo: pin the SHOW entry so the fill runnable that
        // populates NewBannerView and sets it VISIBLE is never
        // scheduled. (v1.57.0 pinned the HIDE sibling by mistake.)
        HousePromoShowFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent()
        )

        // Old Lightning BannerView: never fill/show a house creative
        // (or APS backfill) delivered by BannerManager.
        HouseBannerSetAdFingerprint.method.addInstructions(0, "return-void")

        // Downloads-fragment offer strip: its decider can never fill
        // the text or set the strip VISIBLE again (the layout half
        // above starts it gone).
        OfferStripFingerprint.method.addInstructions(0, "return-void")
    }
}

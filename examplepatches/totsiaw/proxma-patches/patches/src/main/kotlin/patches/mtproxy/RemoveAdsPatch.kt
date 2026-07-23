package patches.mtproxy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/*
 * Removes all ads in MTProxy (com.sdev.mtproxy 2.1.4). The app is 100% Google AdMob: one
 * interstitial (feature-coupled) + one banner (cosmetic). No rewarded / app-open ads exist,
 * and no feature is gated behind watching an ad, so there is nothing else to preserve.
 *
 * The interstitial is a GATE, not a side effect: the proxy "apply/connect" action only runs
 * from the ad-lifecycle callbacks (fail -> run now; loaded -> run on ad-dismiss). A raw
 * return-early on the loader would leave every callback un-fired and silently break tapping a
 * proxy. So instead we reroute every load straight into the benign "failed to load" branch by
 * invoking the load-callback's onAdFailedToLoad(null) at method entry, then returning: the
 * proxy-apply feature still runs (via the fail path), but no interstitial ever loads or shows.
 * (Null error is never dereferenced — both ViewActivity/MainActivity callbacks overwrite it
 * with const/4 before use; verified in smali.)
 *
 * The banner load is independent and simply skipped (return-void) — the AdView slot stays empty.
 */

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes every AdMob ad — the interstitial (rerouted to its onAdFailedToLoad " +
        "branch so the proxy-apply action still runs, but no ad loads or shows) and the on-screen " +
        "banner (load skipped). No feature is lost.",
) {
    compatibleWith(COMPATIBILITY_MTPROXY)

    execute {
        // Best-effort: a target absent in some build shouldn't fail the whole patch.
        fun stub(fingerprint: Fingerprint, code: String) {
            try {
                fingerprint.method.addInstructions(0, code)
            } catch (_: Exception) {
                // fingerprint didn't resolve — skip
            }
        }

        // PRIMARY — interstitial loader (Lhi0;->a(Ctx,String,Lj3;,Lii0;)V).
        // p3 = load callback (Lii0; : Lnv4;). Force the fail branch: onAdFailedToLoad(null) then return.
        // onAdFailedToLoad is Lnv4;->p(Ldn0;)V (abstract on Lnv4;, overridden by both app callbacks);
        // virtual dispatch on p3 is correct. v0 is free (.registers 12, params occupy v8-v11).
        stub(
            interstitialLoadFingerprint,
            """
                const/4 v0, 0x0
                invoke-virtual {p3, v0}, Lnv4;->p(Ldn0;)V
                return-void
            """.trimIndent(),
        )

        // SECONDARY — banner AdView.loadAd (Lwc;->a(Lj3;)V), void method: just skip the load.
        stub(bannerLoadAdFingerprint, "return-void")
    }
}

package app.morphe.patches.bejeweled

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patches.shared.Constants
import java.io.ByteArrayInputStream
import java.io.InputStream
import java.util.Base64
import java.util.function.Supplier

/**
 * Cross-promo redirect patch for Bejeweled Classic.
 *
 * The "GET STARS!" button promotes a sibling EA game (server-selected; e.g.
 * Bejeweled Skies, package com.ea.gp.bejeweledskies). The target URL is
 * server-pushed / composed at runtime (not present in any dex), so this patch
 * acts at every seam that can leave the app with a URL:
 *
 *   - AndroidPlatform.openURL(String)                (native ACTION_VIEW builder)
 *   - AndroidPlatform.showWebView(J, Act, String,S)  (in-app webview)
 *   - com.ea.rs.xpromo.Item.launch():Z              (dedicated promo panel;
 *                                                    builds its own ACTION_VIEW)
 *
 * The shared seams feed their URL through the CrossPromoSilo.rewrite helper
 * (substring whitelist, widened for intent:// / market:// / app-store shapes).
 * Item.launch is dedicated cross-promo, so its URLs are overwritten outright.
 *
 * DIAGNOSTICS (temporary): every seam emits one
 * Log.i("MorpheCanary", "XPROMO[seam] <url>") via CrossPromoSilo.probe, proving
 * the mpp is applied and revealing which seam the button travels through.
 * Remove the probes once the redirect is confirmed on-device.
 */
@Suppress("SpellCheckingInspection")
private const val CROSSPROMO_HELPER_DEX_BASE64 = """
ZGV4CjAzNwAoQy8Ga1kUUVM+6StVRP9+SoLSaiQf9usMCAAAcAAAAHhWNBIAAAAAAAAAAGAHAAAzAAAAcAAAAAoAAAA8AQAACQAAAGQBAAADAAAA0AEAAAwAAADoAQAAAQAAAEgCAACkBQAAaAIAAGoEAAB0BAAAfAQAAIAEAACVBAAAnQQAAKAEAAClBAAAqAQAAKwEAACwBAAAxAQAAOwEAAAGBQAAGgUAAC4FAABJBQAAVwUAAF4FAABjBQAAZgUAAGoFAABvBQAAeAUAAHsFAAB/BQAAlAUAAJgFAACgBQAAqgUAALQFAAC+BQAAygUAANQFAADbBQAA5AUAABAGAAATBgAAHwYAACoGAAA0BgAAPgYAAEgGAABTBgAAXAYAAGkGAABwBgAAeQYAAIIGAACPBgAAmQYAAAUAAAAKAAAACwAAAAwAAAANAAAADgAAAA8AAAATAAAAFwAAABkAAAAGAAAAAAAAAEQEAAAHAAAABQAAAAAAAAAJAAAABQAAAEwEAAAIAAAABgAAAFQEAAAJAAAABgAAAEwEAAATAAAABwAAAAAAAAAUAAAABwAAAEwEAAAVAAAABwAAAFwEAAAYAAAACAAAAGQEAAACAAUABAAAAAIACQARAAAAAgAFABIAAAABAAAAJAAAAAIABQAAAAAAAgAFAAEAAAACAAcALQAAAAIAAgAuAAAABAAFAAEAAAAFAAgAIAAAAAUAAQAwAAAABgAGAAEAAAAGAAMAGwAAAAYABAAbAAAABgABADEAAAACAAAAEQAAAAQAAAAAAAAAAwAAAAAAAAA7BwAAWQcAAAMAAQACAAAAIwQAAFwAAAA5AgMAKFZuEAcAAgAMABoBHQBuIAYAEAAKATkBTAAaAR4AbiAGABAACgE5AUQAGgEfAG4gBgAQAAoBOQE8ABoBKgBuIAYAEAAKATkBNAAaASwAbiAGABAACgE5ASwAGgEiAG4gBgAQAAoBOQEkABoBJgBuIAYAEAAKATkBHAAaARwAbiAGABAACgE5ARQAGgElAG4gBgAQAAoBOQEMABoBIQBuIAYAEAAKADgAAwAoAhECGgIjABECAwAAAAAAAAAwBAAAHwAAABJQIwAJABIBGgIrAE0CAAESERoCLwBNAgABEiEaAigATQIAARIxGgInAE0CAAESQRoCKQBNAgABaQABAA4AAAABAAEAAQAAADQEAAAEAAAAcBAFAAAADgAGAAIAAgABADgEAAA4AAAAGgAWABoBAgA6BQoAYgIBACEjNTUFAEYFAgUoDiICBgBwIAgAEgBuIAkAUgAMBW4QCwAFAAwFGgEQACICBgBwIAgAAgBuIAoAUgAMBRoAGgBuIAoABQAMBW4gCgBFAAwEbhALAAQADARxIAAAQQAOAAYAAAAxAAEAAQA3GgEAO0sBEg//////AAoAHQAOAA4AEwIAAGgBFQ8AAAAAAgAAAAUABQABAAAABQAAAAEAAAAAAAAAAgAAAAUAAAABAAAAAwAIPGNsaW5pdD4ABjxpbml0PgACPyMAE0Nyb3NzUHJvbW9TaWxvLmphdmEABkdJVEhVQgABSQADSUxMAAFMAAJMSQACTEwAEkxhbmRyb2lkL3V0aWwvTG9nOwAmTGFwcC9tb3JwaGUvY3Jvc3Nwcm9tby9Dcm9zc1Byb21vU2lsbzsAGExqYXZhL2xhbmcvQ2hhclNlcXVlbmNlOwASTGphdmEvbGFuZy9PYmplY3Q7ABJMamF2YS9sYW5nL1N0cmluZzsAGUxqYXZhL2xhbmcvU3RyaW5nQnVpbGRlcjsADE1vcnBoZUNhbmFyeQAFU0VBTVMAA1RBRwABVgACVkwAA1ZMSQAHWFBST01PWwABWgACWkwAE1tMamF2YS9sYW5nL1N0cmluZzsAAl0gAAZhcHBlbmQACGFwcHN0b3JlAAhiZWpld2VlZAAIYmVqZXdlbGwACmNvbS5lYS5ncC4ACGNvbnRhaW5zAAVmeWJlcgAHZ2x1bGl2ZQAqaHR0cHM6Ly9naXRodWIuY29tLzZqYXJqYXI2L21vcnBoZS1wYXRjaGVzAAFpAAppbm5lcmFjdGl2AAlpbnRlbnQ6Ly8ACGl0ZW1fYXBwAAhpdGVtX2VudAAIaXRlbV9zdG8ACW1hcmtldDovLwAHb3BlblVSTAALcGxheS5nb29nbGUABXByb2JlAAdyZXdyaXRlAAdzaG93V2ViAAt0b0xvd2VyQ2FzZQAIdG9TdHJpbmcAnwF+fkQ4eyJiYWNrZW5kIjoiZGV4IiwiY29tcGlsYXRpb24tbW9kZSI6InJlbGVhc2UiLCJoYXMtY2hlY2tzdW1zIjpmYWxzZSwibWluLWFwaSI6MjQsInNoYS0xIjoiYTdhZDE4YTcwNDYwYjc5OWQwNDgyZTQ5N2MxMDlhNzViZjdmOTFkZSIsInZlcnNpb24iOiI4LjEwLjktZGV2In0AAwAEAAAaARoBGQGIgASwBgGCgASABwEJmAcBCegEAxcjHhcQAA4AAAAAAAAAAQAAAAAAAAABAAAAMwAAAHAAAAACAAAACgAAADwBAAADAAAACQAAAGQBAAAEAAAAAwAAANABAAAFAAAADAAAAOgBAAAGAAAAAQAAAEgCAAABIAAABAAAAGgCAAADIAAABAAAACMEAAABEAAABQAAAEQEAAACIAAAMwAAAGoEAAAAIAAAAQAAADsHAAAFIAAAAQAAAFkHAAAAEAAAAQAAAGAHAAA=
"""

private val CrossPromoSiloDexSupplier: Supplier<InputStream> =
    Supplier { ByteArrayInputStream(Base64.getDecoder().decode(CROSSPROMO_HELPER_DEX_BASE64.trim())) }

private const val SIL_PROBE = "Lapp/morphe/crosspromo/CrossPromoSilo;->probe(Ljava/lang/String;I)V"
private const val SIL_REWRITE = "Lapp/morphe/crosspromo/CrossPromoSilo;->rewrite(Ljava/lang/String;)Ljava/lang/String;"

@Suppress("SpellCheckingInspection")
val bejeweledCrossPromoRedirect = bytecodePatch(
    name = "[Experimental] Cross-promo-redirect",
    description = "Redirects the GET STARS! cross-promo button to the GitHub repo (instead of promoting EA\u2019s game). Temporary MorpheCanary diagnostics log each incoming URL.",
    default = true
) {
    compatibleWith(Constants.BEJEWELED_COMPATIBILITY)
    extendWith(CrossPromoSiloDexSupplier)

    execute {
        // ======================================================================
        // 1. openURL(String) — native ACTION_VIEW builder.
        //    Layout: registers=3, ins=2. Locals: this=p0=v1, url=p1=v2.
        //    Body: new-instance v0 ($11); <init>(v1,this; v2,url);
        //          runOnUIThread(v0); return-void.
        //    Scratch v0 (overwritten by the original new-instance).
        //    probe signature: (String url, int which).
        // ======================================================================
        OpenUrlFingerprint.method.addInstructions(
            0,
            "const/4 v0, 0\ninvoke-static {v2, v0}, $SIL_PROBE"
        )
        OpenUrlFingerprint.method.addInstruction(2, "invoke-static {v2}, $SIL_REWRITE")
        OpenUrlFingerprint.method.addInstruction(3, "move-result-object v2")

        // ======================================================================
        // 2. showWebView(J, Activity, String url, String config) — in-app webview.
        //    Layout: registers=13, ins=6 (this=v7, J=v8:v9, Act=v10, url=v11,
        //    config=v12). CONFIRMED via Lambda$6: v11(p3)->val$url,
        //    v12(p4)->val$config. (v1.2.1 rewrote p4=config — WRONG register;
        //    fixed here.)
        //    Scratch v0 (overwritten by the original new-instance).
        // ======================================================================
        ShowWebViewFingerprint.method.addInstructions(
            0,
            "const/4 v0, 1\ninvoke-static {v11, v0}, $SIL_PROBE"
        )
        ShowWebViewFingerprint.method.addInstruction(2, "invoke-static {v11}, $SIL_REWRITE")
        ShowWebViewFingerprint.method.addInstruction(3, "move-result-object v11")

        // ======================================================================
        // 3. com.ea.rs.xpromo.Item.launch:()Z — DEDICATED cross-promo panel
        //    (builds its own ACTION_VIEW intent; never reaches openURL).
        //    Original 38-instruction layout (this=v6; v5 unused till orig 29):
        //      0 getCurrentActivity  1 mro v0  2 iget v1 m_appLinks
        //      3 const "appLaunch"  4 Map.get  5 mro v1
        //      6 check-cast v1      7 getInstalledAppPackageName(v1)
        //      8 mro v1  9 const/4 v2,1  10 if-eqz v1, 0x2a  (=> target orig 21)
        //      11-19 app-installed branch (v0,v1,v3)
        //      20 return v2  21 trackStoreRedirect (branch target)
        //      22-25 log (v1,v3)  26 new Intent v1  27 const VIEW v3
        //      28 iget v4 m_appLinks  29 const "store" v5  30 Map.get
        //      31 mro v4  32 check-cast v4  33 Uri.parse(v4)  34 mro v4
        //      35 Intent<v3,v4>  36 startActivity(v0,v1)  37 return v2
        //
        // Insertions (running list, ascending indices; all index arithmetic
        // against the CURRENT list, as required by the addInstruction API):
        //   step A (idx 0): 3 insns — entry canary
        //     const/4 v5, 2; const-string v4, "ENTRY"; probe {v4, v5}
        //     -> list 41. pos(orig j) = j+3.
        //   step B (idx 10): 3 insns — appLaunch URL canary + overwrite
        //     const/4 v5, 3; probe {v1, v5}; const-string v1, GH
        //     idx 10 = orig 7 (getInstalledApp...) AFTER the 3-entry shift.
        //     Logs the RECEIVED appLaunch url, then overrides v1 for
        //     getInstalledAppPackageName (GH -> null pkg -> store branch).
        //     -> list 44. pos(orig j) = j+3 (j<=6), j+6 (j>=7).
        //   step C (idx 39): 2 insns — store URL canary
        //     const/4 v5, 4; probe {v4, v5}
        //     pos(orig 32) = 32+6 = 38 (check-cast v4); pos(orig 33) = 39
        //     (Uri.parse). Canary sits after the cast, before the parse,
        //     observing the RECEIVED store url (still a validated String).
        //     -> list 46. pos(orig j) = j+6 (j<=32), j+8 (j>=33).
        //   step D (idx 41): const-string v4, GH — before orig 33 (now 41).
        //     -> list 47.
        //   Final order: check-cast v4 (38) -> canary (39-40) -> v4=GH (41)
        //     -> Uri.parse (42).
        //
        // Branch integrity: if-eqz (orig 10) at pos 16; target (orig 21)
        // at pos 27; relative delta 11 (identical to the original code-unit
        // width 23, since only equal-width shifts apply). PRESERVED.
        //
        // Register safety:
        //   v4 written by the entry canary, probed at step A, then clobbered
        //   by orig 28 (pos 34) — long before the store canary.
        //   v5 written by canaries (2,3,4); orig 29 (const "store" v5)
        //   overwrites after the appLaunch canary. No live-range collision.
        //   v1 overwrite (GH) before getInstalledAppPackageName (pos 13):
        //   getInstalledAppPackageName(GH-https) internally catches
        //   NameNotFoundException and returns null -> branch taken.
        // ======================================================================
        val launch = XpromoItemLaunchFingerprint.method
        // step A: entry canary.
        launch.addInstructions(
            0,
            "const/4 v5, 2\nconst-string v4, \"ENTRY\"\ninvoke-static {v4, v5}, $SIL_PROBE"
        )
        // step B: appLaunch URL canary + overwrite (before orig 7).
        launch.addInstructions(
            10,
            "const/4 v5, 3\ninvoke-static {v1, v5}, $SIL_PROBE\n" +
                "const-string v1, \"https://github.com/6jarjar6/morphe-patches\""
        )
        // step C: store URL canary (after check-cast v4, before Uri.parse).
        launch.addInstructions(
            39,
            "const/4 v5, 4\ninvoke-static {v4, v5}, $SIL_PROBE"
        )
        // step D: store URL overwrite (before Uri.parse).
        launch.addInstruction(41, "const-string v4, \"https://github.com/6jarjar6/morphe-patches\"")

        // ======================================================================
        // 4. com.ea.blast.SystemAndroidDelegate.IntentView(String) -> Z
        //    The Blast engine's native->Java bridge. The native game passes
        //    ANY url (incl. "market://details?id=com.ea.gp.bejeweldedskies")
        //    and this builds Intent(ACTION_VIEW, Uri.parse(url)) + startActivity
        //    directly, bypassing openURL/showWebView/Item.launch. This is the
        //    "Get Stars" path the v1.2.3 canary missed.
        //    Layout: registers=4, ins=2 (p0=this, p1=url, v0=scratch Intent).
        //    Body (original):
        //      0 new-instance v0 (Intent)
        //      1 const-string v1, "android.intent.action.VIEW"
        //      2 invoke-static {p1}, Uri.parse
        //      3 move-result-object p1
        //      4 invoke-direct {v0, v1, p1}, Intent.<init>
        //      5 iget-object p1, mMainActivity
        //      6 invoke-virtual {p1, v0}, MainActivity.startActivity
        //      7 const/4 p1, 1
        //      8 return p1
        //      :catch 9 const/4 p1, 0  10 return p1
        //    No free register for the probe id — grab one via
        //    getFreeRegisterProvider(0,1) (bumps .registers 4 -> 5).
        //    Insert at index 0 (before new-instance): probe + rewrite of p1.
        //    After rewrite, orig Uri.parse(p1) sees the rewritten URL.
        // ======================================================================
        val iv = SystemAndroidDelegateIntentViewFingerprint.method
        iv.getFreeRegisterProvider(0, 1).let { rp ->
            val probeId = rp.getFreeRegister()
            check(probeId != null) { "Could not get free register for IntentView canary" }
            iv.addInstructions(
                0,
                "const/4 v$probeId, 5\n" +
                    "invoke-static {p1, v$probeId}, $SIL_PROBE\n" +
                    "invoke-static {p1}, $SIL_REWRITE\n" +
                    "move-result-object p1"
            )
        }
    }
}

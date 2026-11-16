package app.morphe.patches.bejeweled

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
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
 * server-pushed / composed at runtime (not present in any dex), and the
 * native game engine hands it to the Blast bridge
 * `com.ea.blast.SystemAndroidDelegate.IntentView(String)` — the ONLY seam
 * the button actually travels through (confirmed on-device: the canary fired
 * at IntentView and never at openURL/showWebView/Item.launch).
 *
 * IntentView is a SHARED bridge (the native engine passes any URL), so the
 * rewrite is CONDITIONAL: CrossPromoSilo.rewrite swaps only URLs matching
 * known cross-promo/store shapes (market://, play.google, com.ea.gp., ...);
 * legitimate URLs pass through unchanged.
 */
@Suppress("SpellCheckingInspection")
private const val CROSSPROMO_HELPER_DEX_BASE64 = """
ZGV4CjAzNQAE0MIYNv9nZcjyIJPItknwNXH2PianfGv0BAAAcAAAAHhWNBIAAAAAAAAAADwEAAAYAAAAcAAAAAcAAADQAAAAAwAAAOwAAAACAAAAEAEAAAUAAAAgAQAAAQAAAEgBAACMAwAAaAEAADoCAABEAgAATAIAAGECAABpAgAAbQIAAJUCAACvAgAAwwIAANcCAADgAgAA4wIAAOYCAADqAgAA/wIAAAkDAAAVAwAAHwMAACYDAABSAwAAXQMAAGgDAAB1AwAAfgMAAAUAAAAGAAAABwAAAAgAAAAKAAAACwAAAA0AAAAEAAAAAwAAACwCAAAKAAAABAAAAAAAAAAMAAAABQAAADQCAAAAAAMAAwAAAAAABgAJAAAAAAABAAAAAAAAAAEAAQAAAAAAAAAWAAAAAgABAAEAAAADAAIAEAAAAAAAAAARAAAAAgAAAAAAAAACAAAAAAAAAB0EAAA1BAAABQABAAIAAAAYAgAAGAAAADkEAwARBGIAAQAhARICNRIQAEYDAAJuIAQANAAKAzgDBQAaBBIAEQTYAgIBKPERBAMAAAAAAAAAIQIAACQAAAASYCMABgAaARQAEgJNAQACGgEVABISTQEAAhoBDwASIk0BAAIaAQ4AEjJNAQACGgETABJCTQEAAhoBEQASUk0BAAJpAAEADgABAAEAAQAAACUCAAAEAAAAcBADAAAADgAUAQAOPIeUPgANAA4AEQAOAAAAAAEAAAADAAAAAQAAAAEACDxjbGluaXQ+AAY8aW5pdD4AE0Nyb3NzUHJvbW9TaWxvLmphdmEABkdJVEhVQgACTEwAJkxhcHAvbW9ycGhlL2Nyb3NzcHJvbW8vQ3Jvc3NQcm9tb1NpbG87ABhMamF2YS9sYW5nL0NoYXJTZXF1ZW5jZTsAEkxqYXZhL2xhbmcvT2JqZWN0OwASTGphdmEvbGFuZy9TdHJpbmc7AAdORUVETEVTAAFWAAFaAAJaTAATW0xqYXZhL2xhbmcvU3RyaW5nOwAIYmVqZXdlbGwACmNvbS5lYS5ncC4ACGNvbnRhaW5zAAVmeWJlcgAqaHR0cHM6Ly9naXRodWIuY29tLzZqYXJqYXI2L21vcnBoZS1wYXRjaGVzAAlpbnRlbnQ6Ly8ACW1hcmtldDovLwALcGxheS5nb29nbGUAB3Jld3JpdGUAnAF+fkQ4eyJiYWNrZW5kIjoiZGV4IiwiY29tcGlsYXRpb24tbW9kZSI6ImRlYnVnIiwiaGFzLWNoZWNrc3VtcyI6ZmFsc2UsIm1pbi1hcGkiOjEsInNoYS0xIjoiYTdhZDE4YTcwNDYwYjc5OWQwNDgyZTQ5N2MxMDlhNzViZjdmOTFkZSIsInZlcnNpb24iOiI4LjEwLjktZGV2In0AAgADAAAaARoAiIAEqAMBgoAEgAQBCegCARcSAAAAAA8AAAAAAAAAAQAAAAAAAAABAAAAGAAAAHAAAAACAAAABwAAANAAAAADAAAAAwAAAOwAAAAEAAAAAgAAABABAAAFAAAABQAAACABAAAGAAAAAQAAAEgBAAABIAAAAwAAAGgBAAADIAAAAwAAABgCAAABEAAAAgAAACwCAAACIAAAGAAAADoCAAAAIAAAAQAAAB0EAAAFIAAAAQAAADUEAAADEAAAAQAAADgEAAAAEAAAAQAAADwEAAA=
"""

private val CrossPromoSiloDexSupplier: Supplier<InputStream> =
    Supplier { ByteArrayInputStream(Base64.getDecoder().decode(CROSSPROMO_HELPER_DEX_BASE64.trim())) }

private const val SIL_REWRITE = "Lapp/morphe/crosspromo/CrossPromoSilo;->rewrite(Ljava/lang/String;)Ljava/lang/String;"

/** Replacement label for the cross-promo buttons (was server-pushed "GET STARS!"). */
private const val PROMO_BUTTON_LABEL = "GitHub"

@Suppress("SpellCheckingInspection")
val bejeweledCrossPromoRedirect = bytecodePatch(
    name = "[Experimental] Cross-promo-redirect",
    description = "Redirects the GET STARS! cross-promo button to the GitHub repo (instead of promoting EA\u2019s game).",
    default = true
) {
    compatibleWith(Constants.BEJEWELED_COMPATIBILITY)
    extendWith(CrossPromoSiloDexSupplier)

    execute {
        // =====================================================================
        // com.ea.blast.SystemAndroidDelegate.IntentView(String) -> Z
        //   The Blast engine's native->Java bridge. The native game passes
        //   ANY url (incl. "market://details?id=com.ea.gp.bejeweldedskies")
        //   and this builds Intent(ACTION_VIEW, Uri.parse(url)) + startActivity
        //   directly, bypassing the app's own URL helpers.
        //   Layout: registers=4, ins=2 (p0=this, p1=url, v0=scratch Intent).
        //   Insert at index 0 (before new-instance): rewrite p1 in place.
        //   After rewrite, orig Uri.parse(p1) sees the rewritten URL.
        // =====================================================================
        val iv = SystemAndroidDelegateIntentViewFingerprint.method
        iv.addInstructions(
            0,
            "invoke-static {p1}, $SIL_REWRITE\n" +
                "move-result-object p1"
        )

        // =====================================================================
        // com.ea.rs.xpromo.Item.getTitle() -> String — the button label
        // (server-pushed "GET STARS!"). Unconditional: Item is cross-promo
        // exclusive.
        // =====================================================================
        XpromoItemTitleFingerprint.method.returnEarly(PROMO_BUTTON_LABEL)
    }
}

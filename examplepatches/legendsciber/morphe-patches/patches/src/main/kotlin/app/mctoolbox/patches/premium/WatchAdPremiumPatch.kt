package app.mctoolbox.patches.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.mctoolbox.patches.shared.Constants.COMPATIBILITY_MCTOOLBOX

/**
 * Watch Ad Instant Reward — "Watch ad" butonuna basmak yeterli.
 *
 * ── Orijinal akis ────────────────────────────────────────────────────────────
 * 1. Premium dialog "Watch ad" butonu → SimpleInterstitialAdActivity acilir
 * 2. Reklam yuklenir, geri sayim r() ile isler (100ms tick)
 * 3. Sure dolunca (vs0.a()==true) kullanici kapatir → finish()
 * 4. finish() icinde: a()/b() kontrolleri gecerse tv$a.a() cagrilir
 *    → native tarafa "+15 dk premium" bildirilir (internal/premium_unlocked)
 *
 * ── Yama ─────────────────────────────────────────────────────────────────────
 * 1. vs0.a()Z → sabit true   (sure aninda dolmus sayilir)
 * 2. vs0.b()Z → sabit true   (erken kapatma diyalogu asla cikmaz)
 * 3. r() govde basina finish() enjekte edilir → aktivite hic icerik
 *    gostermadan ~100ms icinde kapanir; finish() basarili odul yolunu
 *    calistirir (+15 dk eklenir, premium acilir).
 *
 * Buton -> tik -> aninda "premium aktif". Reklam icerigi asla yuklenmez.
 *
 * ── Guvenlik notlari ─────────────────────────────────────────────────────────
 * - a()/b() prepend'leri: const/4 v0 + return v0; orijinal govde sonrasida
 *   ulasilamaz ama hala tip-tutarli oldugu icin verifier temiz gecer.
 * - r() prepend'i: invoke-finish {p0} + return-void; p0 aktivite referansidir,
 *   .locals 16 icinde param register'lari assembler tarafindan cozunur.
 */
@Suppress("unused")
val mctoolboxWatchAdInstantRewardPatch = bytecodePatch(
    name = "Watch Ad Instant Reward",
    description = "\"Watch ad\" butonuna basmak yeterli: reklam izlemeden 15 dakikalik premium aninda eklenir ve her basinca ustune eklenmeye devam eder.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MCTOOLBOX)

    execute {
        // 1) sure dolmus kabul edilsin
        Vs0TimeElapsedFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """.trimIndent())

        // 2) tamamlandi/tamamlanabilir kontrolu hep true
        Vs0CanCloseFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """.trimIndent())

        // 3) ad ekrani ilk tick'te kendini kapatsin -> odul verilsin
        AdScreenTickFingerprint.method.addInstructions(0, """
            invoke-virtual {p0}, Lio/mrarm/simpleads/SimpleInterstitialAdActivity;->finish()V
            return-void
        """.trimIndent())
    }
}

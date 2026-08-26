package app.mctoolbox.patches.premium

import app.morphe.patcher.Fingerprint

/**
 * Lvs0.a()Z — "reklam suresi doldu mu?" kontrolu.
 * currentTimeMillis >= baslangic + sure*1000 karsilastirmasi yapar.
 *
 * Govdesi tamamen degistirilir: HER ZAMAN true doner.
 */
object Vs0TimeElapsedFingerprint : Fingerprint(
    definingClass = "Lvs0;",
    name = "a",
    returnType = "Z",
    parameters = listOf()
)

/**
 * Lvs0.b()Z — ikinci tamamlandi kontrolu (erken kapatma diyalogu ve
 * odul kosulu icin kullanilan diger boolean).
 *
 * Govdesi tamamen degistirilir: HER ZAMAN true doner.
 */
object Vs0CanCloseFingerprint : Fingerprint(
    definingClass = "Lvs0;",
    name = "b",
    returnType = "Z",
    parameters = listOf()
)

/**
 * SimpleInterstitialAdActivity.r() — reklam ekraninin geri sayim tick'i.
 * Butona basilinca aktivite olusturulur ve bu metod 100ms sonra ilk kez
 * calisir. Govde basina finish() enjekte edilir: aktivite hic icerik
 * gostermadan aninda kapanir ve finish() icindeki odul yolu isler.
 */
object AdScreenTickFingerprint : Fingerprint(
    definingClass = "Lio/mrarm/simpleads/SimpleInterstitialAdActivity;",
    name = "r",
    returnType = "V",
    parameters = listOf()
)

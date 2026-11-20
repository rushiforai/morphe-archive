package app.parchefacemoji.patches.facemoji.ads

import app.morphe.patcher.Fingerprint

/**
 * Huellas de la publicidad de Facemoji 3.7.0.
 *
 * En esta version la app ya no usa la API publica de AdMob: solo queda el stub de mediacion
 * del SDK de Google (no existen `BaseAdView`, `InterstitialAd` ni `AdLoader`). La publicidad
 * real la sirve Pangle/CSJ (ByteDance), pero R8 ha renombrado sus clases, asi que no hay
 * ningun nombre estable al que engancharse dentro del SDK.
 *
 * Lo que si sobrevive al renombrado es el motor de **sugerencias patrocinadas** del teclado:
 * `com.baidu.simeji.plutus.adsuggestion.AdSuggestionUtils`. Ese es el anuncio que aparece
 * dentro del teclado mientras se escribe, y se puede apagar desde su propio interruptor.
 *
 * Las huellas se declaran en dos niveles:
 * - los dos metodos que deciden si hay que pedir sugerencias (`b` y `c`),
 * - los `getEnable()` de las tres configuraciones que los alimentan.
 *
 * Los `getEnable()` son beans Kotlin: su nombre no lo toca la ofuscacion, por lo que
 * sobreviven incluso si los nombres de `b`/`c` cambian en una version futura.
 */

/**
 * Interruptor general de las sugerencias patrocinadas.
 *
 * Devuelve `true` cuando el interruptor remoto esta activo y hay red.
 */
internal object AdSuggestionMasterGateFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/plutus/adsuggestion/AdSuggestionUtils;",
    name = "b",
    returnType = "Z",
)

/**
 * Interruptor de las sugerencias de comercio (enlaces a tiendas).
 *
 * Devuelve `true` cuando la configuracion de anuncios o la de comercio estan activas,
 * hay red y la preferencia local no lo impide.
 */
internal object AdSuggestionCommerceGateFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/plutus/adsuggestion/AdSuggestionUtils;",
    name = "c",
    returnType = "Z",
)

/** Configuracion de las sugerencias patrocinadas normales. */
internal object AdSuggestionSwitchEnableFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/plutus/adsuggestion/AdSuggestionUtils\$AdSuggestionSwitch;",
    name = "getEnable",
    returnType = "Z",
)

/** Configuracion de las sugerencias de la app de comercio. */
internal object AdSuggestionEcommerceEnableFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/plutus/adsuggestion/AdSuggestionUtils\$EcommerceSuggestionSwitch;",
    name = "getEnable",
    returnType = "Z",
)

/** Configuracion de estilo de las sugerencias (afecta al diseno del anuncio). */
internal object AdSuggestionGpConfigEnableFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/plutus/adsuggestion/AdSuggestionUtils\$GpAdSugConfig;",
    name = "getEnable",
    returnType = "Z",
)

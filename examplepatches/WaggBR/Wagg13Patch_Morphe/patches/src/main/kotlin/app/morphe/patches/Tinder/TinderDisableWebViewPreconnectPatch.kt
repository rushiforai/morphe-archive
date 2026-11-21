package app.morphe.patches.tinder.fixes

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.tinder.TinderCompatibility

/**
 * SDK de anúncios do Google embutido no Tinder (`ads_mobile_sdk`), 17.41.0: `im3` é a
 * corrotina que, na inicialização, percorre a lista de domínios do Google Ads e chama
 * `androidx.webkit.Profile.preconnect(url)` para cada um. Em alguns WebViews (ex.: AOSP
 * `com.android.webview` 153.0.8010.37 no Android 12) isso derruba o processo com SIGTRAP
 * dentro de `libwebviewchromium.so`, logo na abertura do app.
 *
 * É apenas uma otimização de latência (pré-aquecer conexões), então pular não muda
 * nenhum comportamento visível. É o único chamador de `Profile.preconnect` no app.
 */
private object AdsWebViewPreconnectFingerprint : Fingerprint(
    definingClass = "Lads_mobile_sdk/im3;",
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

@Suppress("unused")
val tinderDisableWebViewPreconnectPatch = bytecodePatch(
    name = "Tinder Disable WebView Preconnect",
    description = "Prevents a startup crash on devices whose WebView crashes in Profile.preconnect (Google Ads SDK).",
    default = true,
) {
    compatibleWith(TinderCompatibility.TINDER)

    execute {
        // invokeSuspend tem 15 registradores (v0 livre); a corrotina termina logo com Unit.
        AdsWebViewPreconnectFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                return-object v0
            """.trimIndent(),
        )
    }
}

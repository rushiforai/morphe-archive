package app.rimixyz.patches.mytherapy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_MYTHERAPY

/**
 * Impede apenas o carregamento de anúncios comuns (banner programático e nativo).
 *
 * Os dois pontos de carga são substituídos por um retorno antecipado de `Unit`, antes de qualquer
 * chamada ao SDK. O cache de nativos e o `clear()` (que destrói os objetos) permanecem intactos,
 * assim como a inicialização do Mobile Ads, o UMP, o intersticial e o recompensado — este último
 * continua com sua semântica de recompensa legítima.
 *
 * Efeito colateral a medir em T7: a UI pode renderizar o espaço vazio/fallback previsto pelo
 * produto em vez do anúncio. A remoção visual pura exigiria tocar em Compose, o que poderia
 * deixar a requisição de rede ativa; aqui o pedido é eliminado na origem.
 */
@Suppress("unused")
val disableCommonAdsInMyTherapyPatch = patch(
    name = "Disable common ads in MyTherapy",
    description = "Stops non-rewarded banner and native ad requests at the load entry points, preserving UMP, interstitial and rewarded flows.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MYTHERAPY)

    execute {
        verifyMyTherapyTarget()

        val earlyReturn = """
            sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
            return-object v0
        """.trimIndent()

        NativeAdRequestFingerprint.method.addInstructions(0, earlyReturn)
        BannerLoadFingerprint.method.addInstructions(0, earlyReturn)
    }
}

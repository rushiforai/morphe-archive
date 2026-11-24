package app.rimixyz.patches.mytherapy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_MYTHERAPY

private const val FLOW_KT = "Lkotlinx/coroutines/flow/FlowKt;"
private const val BOXING = "Lkotlin/coroutines/jvm/internal/Boxing;"

/**
 * Desativa completamente todos os anúncios e a inicialização dos SDKs publicitários no MyTherapy.
 *
 * Pontos neutralizados (todos confirmados em classes16.dex / classes3.dex de MyTherapy 4.16.2):
 *  - `ShouldShowAdsUseCaseImpl.invoke`: retorna `FlowKt.flowOf(false)`, desligando banners,
 *    nativos, contagem intersticial e recompensados na UI mesmo sem `Unlock Plus benefits`.
 *  - `InitMobileAdsUseCaseImpl.invoke`: retorno antecipado `Unit`, impedindo a inicialização do
 *    Google Mobile Ads SDK e dos adaptadores de mediação (Meta, Mintegral, Liftoff, TikTok, Unity).
 *  - `UpdateAdsConsentInfoUseCaseImpl.invoke`: retorno antecipado `Unit`, evitando chamadas e
 *    diálogos de consentimento publicitário do Google UMP.
 *  - `NativeAdManager.request`, `AndroidLoadBannerAdUseCase.invoke`,
 *    `AndroidInterstitialAdManagerImpl.request` e `RewardedAdManagerImpl.request`: retorno
 *    antecipado direto nos pontos de carregamento de todos os formatos de anúncio.
 */
@Suppress("unused")
val disableAllAdsInMyTherapyPatch = patch(
    name = "Disable all ads",
    description = "Blocks all ad formats (banner, native, interstitial and rewarded), stops Mobile Ads/mediation SDK initialization, and skips UMP ad consent prompts.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MYTHERAPY)

    execute {
        verifyMyTherapyTarget()

        // Árbitro central: sempre emite false no Flow<Boolean>.
        ShouldShowAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-static {v0}, $BOXING->boxBoolean(Z)Ljava/lang/Boolean;
                move-result-object v0
                invoke-static {v0}, $FLOW_KT->flowOf(Ljava/lang/Object;)Lkotlinx/coroutines/flow/Flow;
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )

        val unitReturn = """
            sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
            return-object v0
        """.trimIndent()

        // Impede inicialização do Mobile Ads SDK + mediação e fluxo UMP.
        InitMobileAdsFingerprint.method.addInstructions(0, unitReturn)
        UpdateAdsConsentInfoFingerprint.method.addInstructions(0, unitReturn)

        // Corta na origem todos os formatos de anúncio.
        NativeAdRequestFingerprint.method.addInstructions(0, unitReturn)
        BannerLoadFingerprint.method.addInstructions(0, unitReturn)
        InterstitialAdRequestFingerprint.method.addInstructions(0, "return-void")
        RewardedAdRequestFingerprint.method.addInstructions(0, "return-void")
    }
}

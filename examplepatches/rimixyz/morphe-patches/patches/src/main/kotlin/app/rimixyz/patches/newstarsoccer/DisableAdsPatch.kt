package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER

private const val RETURN_VOID = "return-void"

/**
 * Patch unificado de bloqueio de anúncios e promoções do New Star Soccer 4.34.
 *
 * Reúne em um único patch:
 *  - Intersticiais de rede (AdMob e DT Exchange/Fyber): corta carregamento e exibição
 *    não recompensados, mantendo vídeos recompensados opt-in intactos.
 *  - Tela promocional interna (`c_TScreen_FakeAd.m_SetUpScreen`): reporta indisponível (`false`).
 *  - Botão promocional "Games we like" nas Opções: força `Settings / GamesWeLikeEnabled = 0.0f`
 *    no início de `c_TScreen_Options.m_SetUpScreen()` (cobre visual moderno e clássico).
 */
@Suppress("unused")
val disableAdsInNssPatch = patch(
    name = "Disable ads",
    description = "Blocks AdMob and DT Exchange/Fyber interstitial ads, removes the built-in promo interstitial, and hides the promotional \"Games we like\" button while keeping opt-in rewarded videos.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    execute {
        verifyNewStarSoccerTarget()

        // 1. Intersticiais de rede (AdMob e Fyber).
        AdMobInterstitialLoadFingerprint.method.addInstructions(0, RETURN_VOID)
        AdMobInterstitialShowFingerprint.method.addInstructions(0, RETURN_VOID)
        FyberInterstitialPreloadFingerprint.method.addInstructions(0, RETURN_VOID)
        FyberInterstitialShowFingerprint.method.addInstructions(0, RETURN_VOID)

        // 2. Intersticial promocional interno (fake ad).
        FakeInterstitialSetupFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )

        // 3. Botão promocional "Games we like" nas Opções (moderno + clássico).
        OptionsSetupScreenFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "Settings"
                const-string v1, "GamesWeLikeEnabled"
                const/4 v2, 0x0
                invoke-static { v0, v1, v2 }, Lcom/newstargames/newstarsoccer/c_TweakValueFloat;->m_Set(Ljava/lang/String;Ljava/lang/String;F)Lcom/newstargames/newstarsoccer/c_TweakValueFloat;
            """.trimIndent(),
        )
    }
}

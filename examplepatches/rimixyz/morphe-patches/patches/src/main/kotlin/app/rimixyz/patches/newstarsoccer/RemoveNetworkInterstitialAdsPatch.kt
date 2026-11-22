package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER

private const val RETURN_VOID = "return-void"

/**
 * Corta carregamento e exibição dos intersticiais de rede não recompensados nas duas pontes.
 *
 * AdMob: os Runnables agendados por PreLoadAd(String) e DisplayAd sao interrompidos antes de
 * InterstitialAd.load/show. Fyber: PreLoadAdInternal(String) nao chega a requestAd e
 * DisplayAdInternal() nao chega a show. Os caminhos recompensados (AdMob$7/$9 e
 * PreLoadRewardedAdInternal/DisplayRewardedAdInternal) ficam intactos, bem como o consentimento UMP.
 *
 * O jogo continua usando a semantica original de "anuncio indisponivel": os metodos de
 * disponibilidade retornam false e o fluxo de retorno a tela/partida permanece o mesmo.
 */
@Suppress("unused")
val removeNetworkInterstitialAdsPatch = patch(
    name = "Remove network interstitial ads",
    description = "Blocks loading and display of non-rewarded interstitials from AdMob and DT Exchange/Fyber while preserving rewarded videos.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    execute {
        verifyNewStarSoccerTarget()

        AdMobInterstitialLoadFingerprint.method.addInstructions(0, RETURN_VOID)
        AdMobInterstitialShowFingerprint.method.addInstructions(0, RETURN_VOID)
        FyberInterstitialPreloadFingerprint.method.addInstructions(0, RETURN_VOID)
        FyberInterstitialShowFingerprint.method.addInstructions(0, RETURN_VOID)
    }
}

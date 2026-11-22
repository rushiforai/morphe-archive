package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER

/**
 * Faz a tela promocional interna reportar indisponibilidade, exatamente como acontece quando
 * falta imagem ou anúncio no PATH original. Os três chamadores continuam seu fluxo normal:
 * o que consulta o retorno cai no teste de disponibilidade de rede e os outros dois o descartam.
 *
 * Os assets fake-ad e os caminhos de carregamento das outras telas não são alterados.
 */
@Suppress("unused")
val removeFakeInterstitialPatch = patch(
    name = "Remove in-game promo interstitial",
    description = "Suppresses the game's built-in promo interstitial on all three entry paths while preserving navigation and return to play.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    execute {
        verifyNewStarSoccerTarget()

        // m_SetUpScreen(I)Z: v0 é registrador livre; retorna 0 (indisponível).
        FakeInterstitialSetupFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )
    }
}

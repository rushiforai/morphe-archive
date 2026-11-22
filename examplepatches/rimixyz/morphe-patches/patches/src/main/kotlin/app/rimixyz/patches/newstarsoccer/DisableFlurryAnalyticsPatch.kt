package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER

/**
 * Impede que o wrapper Monkey inicie a sessão de Analytics do Flurry.
 *
 * BBFlurry.onStartSession(String) é o único ponto explícito de inicialização pelo jogo; o
 * retorno antecipado preserva log, consentimento, eventos e estruturas do jogo. O SDK permanece
 * no APK e suas guardas internas continuam respondendo "evento não registrado" aos eventos
 * seguintes. O Flurry é um serviço descontinuado, portanto o benefício de rede pode ser nulo;
 * o efeito local é verificável pela ausência da chamada a FlurryAgent.Builder.build.
 */
@Suppress("unused")
val disableFlurryAnalyticsPatch = patch(
    name = "Disable Flurry analytics session",
    description = "Prevents the game from starting a Flurry analytics session without removing SDK classes or changing the consent flow.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    execute {
        verifyNewStarSoccerTarget()

        FlurrySessionStartFingerprint.method.addInstructions(0, "return-void")
    }
}

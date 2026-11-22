package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER

/**
 * Neutraliza a medição de inicialização feita pelo FlurryContentProvider.
 *
 * O provider declara a URI "performance" e registra callbacks de ciclo de vida com tempo de
 * arranque, memória usada e total. Em vez de remover a declaração do manifesto — o que deixaria
 * consumidores da URI sem provider — o onCreate retorna true sem registrar nada. Assim o
 * componente permanece disponível e o arranque do jogo não é afetado.
 *
 * Endurecimento: nenhum chamador direto da URI "performance" foi encontrado no DEX, mas query()
 * usa UriMatcher/Cursor que ficariam nulos. O patch também faz query() devolver null, eliminando
 * o risco de NPE se um consumidor externo tentar consultar o provider.
 */
@Suppress("unused")
val disableFlurryStartupMeasurementPatch = patch(
    name = "Disable Flurry startup measurement",
    description = "Stops the Flurry provider from capturing startup time and memory usage while keeping the component declared.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    execute {
        verifyNewStarSoccerTarget()

        // onCreate()Z devolve v3 = 1 no caminho original; devolve o mesmo sem registrar nada.
        FlurryProviderOnCreateFingerprint.method.addInstructions(
            0,
            """
                const/4 v3, 0x1
                return v3
            """.trimIndent(),
        )

        // query() usa os campos a/c que ficaram nulos. v1 é o parâmetro Uri; devolver null
        // mantém o contrato do ContentProvider sem risco de NPE em consumidores externos.
        FlurryProviderQueryFingerprint.method.addInstructions(
            0,
            """
                const/4 v1, 0x0
                return-object v1
            """.trimIndent(),
        )
    }
}

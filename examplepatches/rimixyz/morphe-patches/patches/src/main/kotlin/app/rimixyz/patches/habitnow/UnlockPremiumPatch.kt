package app.rimixyz.patches.habitnow

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_HABITNOW

/**
 * Concede o estado premium local consultado pelo HabitNow 2.5.5.
 *
 * O app decide quase todos os recursos pagos com um único getter, `ia1.W`,
 * que lê a preferência booleana `com.habitnow.premium`. Três pontos são
 * ajustados:
 *
 * 1. O getter passa a devolver `true`, cobrindo as telas, widgets, cotas de
 *    `h44.t`, exportação CSV, temas, categorias, timer, backups etc.
 * 2. O repositório `np` passa a nascer com o estado `PURCHASED`, para as telas
 *    que consomem o fluxo em vez de chamar o getter diretamente.
 * 3. O ramo de revogação de `np.k` (acionado no sign-out com lista de compras
 *    vazia) deixa de limpar a flag. O parâmetro `z` é forçado a `false` logo
 *    na entrada do método; ele não é lido em nenhum outro ponto.
 *
 * Não há fabricação de compra, token, recibo ou resposta de servidor. A
 * checagem remota `productivitynow.app` continua intacta: ela apenas concede
 * premium quando o backend confirma e nunca revoga o estado local.
 */
@Suppress("unused")
val unlockPremiumInHabitNowPatch = patch(
    name = "Unlock premium",
    description = "Grants the local premium state the app reads for its paid features.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HABITNOW)

    execute {
        verifyHabitNowTarget()

        // 1. Árbitro único das telas e das cotas.
        PremiumFlagFingerprint.method.returnEarly(true)

        // 2. Estado inicial do fluxo: substitui o enum logo antes do r02.<init>.
        PremiumStateInitFingerprint.let { match ->
            val r02ConstructorIndex = match.instructionMatches.last().index
            match.method.addInstructions(
                r02ConstructorIndex,
                "sget-object p1, Lbc2;->c:Lbc2;",
            )
        }

        // 3. z=false desativa somente o ramo de revogação; o processamento de
        // compras reais e o caminho normal (z=false) permanecem inalterados.
        // p3 é o quarto parâmetro; com .locals 22 ele corresponde a v25.
        // O compilador de smali inline do Morphe não aceita o alias p3.
        ForcedPremiumRevokeFingerprint.method.addInstructions(0, "const/16 v25, 0x0")
    }
}

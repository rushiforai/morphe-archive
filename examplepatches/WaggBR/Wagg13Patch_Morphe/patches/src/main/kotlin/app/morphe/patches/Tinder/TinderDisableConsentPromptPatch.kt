package app.morphe.patches.tinder.consent

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.tinder.TinderCompatibility

// ============================================================================
// VERSÃO SUPORTADA: 17.41.0 (travada via TinderCompatibility)
//
// Pop-up "Privacy preference centre" (TCF), do gerenciador de consentimento
// próprio do Tinder (com.tinder.cmp). Ideia do repo Kirby1997/morphe-patches
// (17.15.0), re-derivada na 17.41.0.
//
// CmpLifecycleObserver.promptIfNeccesary() compila para o método estático
//   Lcom/tinder/cmp/trigger/a;->d(Lcom/tinder/cmp/trigger/a;ZZ)Lbbc;
// Se o 1º booleano é true e há Activity em primeiro plano, ele monta
// CmpLifecycleObserver$promptIfNeccesaryInput$1 e põe na fila de exibição.
// Senão, cai no ramo da instrução 0x28:
//   sget-object Lfca;->a:Lfca;   (fluxo vazio; Lfca; implementa Lbbc;)
//   return-object
// O patch toma esse ramo sempre. É um caminho que o app já trata, então nada
// quebra; como o prompt não aparece, nenhum consentimento é concedido.
//
// Mudou desde a 17.15.0: o tipo de retorno (era kotlinx.coroutines.flow.j,
// agora Lbbc;) e o singleton do fluxo vazio (era flow.i, agora Lfca;).
// Método estático: p0 = 1º parâmetro (v3 de 6 registradores), então
// "sget-object p0" cabe na forma de 8 bits.
// ============================================================================

private object CmpPromptIfNecessaryFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/cmp/trigger/a;",
    name = "d",
    returnType = "Lbbc;",
    parameters = listOf("Lcom/tinder/cmp/trigger/a;", "Z", "Z"),
)

@Suppress("unused")
val tinderDisableConsentPromptPatch = bytecodePatch(
    name = "Tinder Disable Consent Prompt",
    description = "Suppresses Tinder's in-house privacy/consent (TCF) pop-up. No consent is granted.",
    default = false,
) {
    compatibleWith(TinderCompatibility.TINDER)

    execute {
        CmpPromptIfNecessaryFingerprint.method.addInstructions(
            0,
            """
                sget-object p0, Lfca;->a:Lfca;
                return-object p0
            """
        )
    }
}

/*
 * OBSERVAÇÕES:
 *
 * 1. NÃO TESTADO — conferido por leitura do bytecode da 17.41.0.
 *
 * 2. DESLIGADO POR PADRÃO
 *    Não é monetização, é privacidade/consentimento, e pode nem aparecer
 *    na sua região. Ligue só se o pop-up te incomoda.
 */

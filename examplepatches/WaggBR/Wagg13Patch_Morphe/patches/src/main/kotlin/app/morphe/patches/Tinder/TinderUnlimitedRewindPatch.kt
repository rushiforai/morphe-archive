package app.morphe.patches.tinder.rewind

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

// ============================================================================
// FINGERPRINT — RewindLastRec.invoke()
//
// Nomes reais confirmados via desmontagem de bytecode (androguard) nesta build
// específica do app (R8 renomeia classes/métodos — muda a cada versão):
//
//   RewindLastRec (fonte original)  -> com.tinder.library.rewind.internal.usecase.b
//   invoke()                        -> método "a"
//
// Corpo real do método "a" (confirmado, não suposto):
//   1. Verifica se algum item da lista de swipes é de um tipo "bloqueado".
//   2. Se NÃO for bloqueado -> chama b(swipe) direto (ação real do rewind,
//      sem nenhuma checagem — restaura o swipe via RecsEngine).
//   3. Se FOR bloqueado -> entra no fluxo de rewarded-video / paywall.
//
// Este patch substitui o corpo inteiro de "a" para sempre seguir o caminho (2).
// ============================================================================

private object RewindLastRecInvokeFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/library/rewind/internal/usecase/b;",
    name = "a",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lx02/v0;", "Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
)

// ============================================================================
// PATCH: Tinder Unlimited Rewind
// ============================================================================

@Suppress("unused")
val tinderUnlimitedRewindPatch = bytecodePatch(
    name = "Tinder Unlimited Rewind",
    description = "Enables unlimited rewinds (only). Every other premium feature depends on " +
        "Tinder's servers and cannot be unlocked by a patch.",
    default = true,
) {
    // The fingerprint uses R8-obfuscated names, so the patch only works on this exact version.
    compatibleWith(
        Compatibility(
            name = "Tinder",
            packageName = "com.tinder",
            targets = listOf(AppTarget(version = "17.34.1")),
        )
    )

    execute {
        // No runCatching on purpose: if the fingerprint does not match (different Tinder
        // version), the patch must fail loudly instead of "succeeding" without changing anything.
        RewindLastRecInvokeFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0, p1}, Lcom/tinder/library/rewind/internal/usecase/b;->b(Lx02/v0;)V
                sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                return-object v0
            """
        )
    }
}

/*
 * OBSERVAÇÕES:
 *
 * 1. FRAGILIDADE DE VERSÃO
 *    "b", "a" e o campo "a" de Lkotlin/Unit; são nomes gerados pelo R8 nesta
 *    build específica que foi analisada. Numa atualização do Tinder, o
 *    mapeamento de ofuscação muda e esta fingerprint provavelmente não vai
 *    bater mais. Nesse caso o patch falha com erro (de propósito) em vez de
 *    "aplicar" sem efeito; é preciso reanalisar o bytecode da nova versão.
 *
 * 2. ESCOPO DO QUE FOI CONFIRMADO
 *    CanUserRewind e RecsCardStackViewModel.tryRewind (código-fonte original)
 *    não têm implementação em lugar nenhum deste APK — por isso este patch
 *    não tenta tocar neles. Se depois de aplicar esse patch o rewind ainda
 *    aparecer limitado na tela que você usa, é sinal de que a UI real passa
 *    por outra ViewModel (ex: VerticalProfileCardStackViewModel ou
 *    CuratedCardStackViewModel — ambas encontradas na análise com suporte a
 *    rewind), e não pela RecsCardStackViewModel legada.
 */

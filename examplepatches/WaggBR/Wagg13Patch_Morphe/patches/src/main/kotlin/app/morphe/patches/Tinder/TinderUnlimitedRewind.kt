package app.morphe.patches.tinder.rewind

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

// ============================================================================
// FINGERPRINT 1 — RewindLastRec.invoke()
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
// FINGERPRINT 2 — Li03/a;.<init>()
//
// Classe (renomeada pelo R8 nesta build) que monta o texto de versão exibido
// nas configurações do app. Confirmado via bytecode:
//
//   1. Pega o nome da versão (ex: "17.34.1") de um campo de Lpz/a;
//   2. Concatena com o número de build entre parênteses (ex: "(17340184)")
//   3. Chama Resources.getString(R.string.app_info_version, [essa_string])
//      -> a string de recurso já é a localizada ("Versão %1$s", "Version %s",
//         etc.), então o resultado (v4) já sai FORMATADO E LOCALIZADO.
//   4. Guarda o resultado num StateFlow que a UI observa.
//
// O ponto de inserção fica logo depois do getString() — ali v4 já tem o
// texto final pronto pra qualquer idioma, então concatenar o watermark ali
// funciona igual em todos os locales.
//
// Aplicada junto com o patch de rewind, sem entrada própria visível na lista
// de patches do Morphe — ver observação 3 no fim do arquivo.
// ============================================================================

private object AppInfoVersionConstructorFingerprint : Fingerprint(
    definingClass = "Li03/a;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Lpz/a;", "Landroid/content/res/Resources;"),
)

// ============================================================================
// PATCH: Tinder Unlimited Rewind
// ============================================================================

@Suppress("unused")
val tinderUnlimitedRewindPatch = bytecodePatch(
    name = "Tinder Unlimited Rewind",
    description = "Bypasses the paywall check and enables unlimited REWIND on FREE accounts.",
    default = true,
) {
    compatibleWith("com.tinder")

    execute {
        // --- Rewind ilimitado ---
        runCatching {
            RewindLastRecInvokeFingerprint.method.addInstructions(
                0,
                """
                    invoke-virtual {p0, p1}, Lcom/tinder/library/rewind/internal/usecase/b;->b(Lx02/v0;)V
                    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                    return-object v0
                """
            )
        }.onFailure {
            // A fingerprint não bateu
        }

        // --- Watermark de versão ---
        runCatching {
            AppInfoVersionConstructorFingerprint.method.addInstructions(
                15,
                """
                    const-string v1, " - MOD by @Wagg13 - Morphe"
                    invoke-virtual {v4, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v4
                """
            )
        }.onFailure {
            // Idem: nomes ofuscados podem ter mudado numa atualização.
        }
    }
}

/*
 * OBSERVAÇÕES:
 *
 * 1. FRAGILIDADE DE VERSÃO
 *    "b", "a", o campo "a" de Lkotlin/Unit; e "Li03/a;" são nomes gerados
 *    pelo R8 nesta build específica que foi analisada. Numa atualização do
 *    Tinder, o mapeamento de ofuscação muda e essas fingerprints
 *    provavelmente não vão bater mais (o runCatching evita que isso quebre
 *    o patch inteiro, mas cada parte que falhar simplesmente não é aplicada
 *    nessa versão nova, silenciosamente).
 *
 * 2. ESCOPO DO QUE FOI CONFIRMADO (rewind)
 *    CanUserRewind e RecsCardStackViewModel.tryRewind (código-fonte original)
 *    não têm implementação em lugar nenhum deste APK — por isso este patch
 *    não tenta tocar neles. Se o rewind ainda aparecer limitado na tela que
 *    você usa, é sinal de que a UI real passa por outra ViewModel (ex:
 *    VerticalProfileCardStackViewModel ou CuratedCardStackViewModel), e não
 *    pela RecsCardStackViewModel legada.
 *
 * 3. WATERMARK BUNDLADO DE PROPÓSITO
 *    O watermark não tem seu próprio `bytecodePatch`/entrada na lista do
 *    Morphe — está fundido dentro do `execute` do patch de rewind, por
 *    pedido explícito. Consequência prática: quem usa esse patch não tem
 *    como aplicar o rewind ilimitado SEM o watermark (não há toggle
 *    separado), e o nome "MOD by @Wagg13 - Morphe" não aparece em nenhuma
 *    tela de informação/changelog do patcher — só no app já modificado,
 *    na tela de versão. Se algum dia você quiser desacoplar os dois de
 *    novo (ex: pra dar o rewind sem o watermark pra alguém), é só voltar a
 *    ter dois `bytecodePatch` separados como nos arquivos originais.
 *
 * 4. ÍNDICE DE INSERÇÃO DO WATERMARK
 *    O índice 15 é fixo, obtido por desmontagem direta do bytecode desta
 *    build — não é calculado dinamicamente. Se a fingerprint continuar
 *    batendo numa versão futura mas o corpo do método mudar, esse índice
 *    pode passar a apontar pro lugar errado mesmo com a classe encontrada
 *    (o patch aplicaria sem erro, mas o watermark sairia no ponto errado).
 */

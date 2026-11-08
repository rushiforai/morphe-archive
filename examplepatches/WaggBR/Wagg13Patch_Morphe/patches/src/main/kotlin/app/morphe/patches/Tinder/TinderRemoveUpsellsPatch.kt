package app.morphe.patches.tinder.upsells

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.tinder.TinderCompatibility

// ============================================================================
// VERSÃO SUPORTADA: 17.41.0 (travada via TinderCompatibility)
//
// Três alvos, todos do lado do app (nenhum depende de resposta do servidor).
// Nomes confirmados por desmontagem desta versão; o R8 renomeia a cada build.
// ============================================================================

// ----------------------------------------------------------------------------
// 1) MENSAGENS PATROCINADAS NO CHAT — SponsoredMessageLifecycleObserver.onCreate()
//
// O onCreate registra um loader de anúncios (ad unit "/7214/mat.tinder",
// prioridade HIGH) e lança a corrotina que observa/exibe a mensagem patrocinada.
// Sair no início corta as duas coisas. O onDestroy só chama addy.a.e() (parar o
// gerenciador), o que é seguro mesmo sem loader.
// ----------------------------------------------------------------------------

private object SponsoredMessageFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/sponsoredmessage/lifecycle/observer/a;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Lpch;"),
)

// ----------------------------------------------------------------------------
// 2) MODAL DE UPSELL "LIKES YOU" DO GOLD — LaunchLikesYouGoldUpsellModalLifecycleObserver.onCreate()
//
// O onCreate só chama super.onCreate (método padrão da interface, sem efeito) e
// lança a corrotina que observa os perfis e abre o modal. Sair no início
// impede a corrotina de existir.
// ----------------------------------------------------------------------------

private object LikesYouUpsellModalFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/likesyoumodal/lifecycle/a;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Lpch;"),
)

// ----------------------------------------------------------------------------
// 3) UPSELL DE BOOST — TakeShouldShowBoostUpsellImpl.invoke(String)
//
// Método "a" (suspend, devolve Boolean boxed: "mostrar o upsell?"). Confirmado
// pela continuação $invoke$1 criada dentro dele. O método "b" é
// userIsPlatinumOrGold e NÃO é tocado. Quem consome é o framework central de
// pop-ups (PrioritizedModalEligibilityChecksFactory): false = modal não elegível.
// ----------------------------------------------------------------------------

private object BoostUpsellFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/boost/domain/usecase/e;",
    name = "a",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
)

private const val RETURN_VOID_SMALI = """
    return-void
"""

// v0 é um local livre (8 locais no total). Não suspende de verdade, então
// devolver o Boolean direto é válido.
private const val RETURN_FALSE_SMALI = """
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    return-object v0
"""

@Suppress("unused")
val tinderRemoveUpsellsPatch = bytecodePatch(
    name = "Tinder Remove Upsells",
    description = "Removes sponsored chat messages and upsell pop-ups (Likes You, Boost).",
    default = true,
) {
    compatibleWith(TinderCompatibility.TINDER)

    execute {
        SponsoredMessageFingerprint.method.addInstructions(0, RETURN_VOID_SMALI)
        LikesYouUpsellModalFingerprint.method.addInstructions(0, RETURN_VOID_SMALI)
        BoostUpsellFingerprint.method.addInstructions(0, RETURN_FALSE_SMALI)
    }
}

/*
 * OBSERVAÇÕES:
 *
 * 1. NÃO TESTADO
 *    Lógica confirmada por desmontagem; o patch não foi compilado nem aplicado.
 *
 * 2. O QUE FICOU DE FORA (de propósito)
 *    - Upsell de Super Like e da lista Platinum: são cadeias de Flow com emit
 *      (cerca de 70 instruções cada), bem mais arriscadas de alterar.
 *    - PrioritizedModalEligibilityChecksFactory inteiro: ele decide TODOS os
 *      pop-ups do app (inclusive consentimento e avisos de segurança).
 *    - userIsPlatinumOrGold (método "b" do Boost): não é gate de upsell.
 *
 * 3. VERSÃO TRAVADA
 *    "a", "e" e o tipo "pch" são nomes do R8. Compatibilidade declarada
 *    em TinderCompatibility.TINDER (17.41.0). Para suportar outra versão,
 *    rastrear a classe real pelo this$0 das continuações (…$onCreate$1,
 *    TakeShouldShowBoostUpsellImpl$invoke$1) e atualizar as fingerprints.
 */

package app.morphe.patches.tinder.upsells

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.tinder.TinderCompatibility

// ============================================================================
// VERSÃO SUPORTADA: 17.41.0 (travada via TinderCompatibility)
//
// Complementa TinderRemoveUpsellsPatch (Boost, Likes You, mensagem patrocinada)
// com os pop-ups de upsell que ele não cobre. Ideia vinda do repo
// Kirby1997/morphe-patches (Tinder 17.15.0), reconferida por inspeção do DEX
// da 17.41.0: as classes abaixo existem e o que mudou foi o nome R8 do
// DialogFragment (era Landroidx/fragment/app/q;, agora Landroidx/fragment/app/i;).
//
// Os quatro DialogFragments têm o mesmo formato:
//   public final onCreateView(LayoutInflater, ViewGroup, Bundle) : View
// com 4 ou 5 registradores no total (p0 = this, p1 = inflater). Então o corpo
// "dismiss + devolver view nula" cabe nas formas de 4 bits sem usar range.
// ============================================================================

// ----------------------------------------------------------------------------
// 1) "Você curtiu pessoas incríveis! Seja visto mais rápido com Platinum"
//    (aba Curtidas enviadas). Cadeia: ...DialogFragment > Lcde; > Lge3; > Lb81; > i
// ----------------------------------------------------------------------------
private object MyLikesUpsellFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/mylikes/ui/dialog/MyLikesUpsellDialogFragment;",
    name = "onCreateView",
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
)

// ----------------------------------------------------------------------------
// 2) Confirmação de compra "headless" no meio de um fluxo.
// ----------------------------------------------------------------------------
private object HeadlessPurchaseUpsellFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/headlesspurchaseupsell/internal/view/HeadlessPurchaseUpsellDialogFragment;",
    name = "onCreateView",
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
)

// ----------------------------------------------------------------------------
// 3) Upsell do Primetime Boost.
// ----------------------------------------------------------------------------
private object PrimetimeBoostUpsellFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/primetimeboostupsell/internal/view/PrimetimeBoostUpsellDialogFragment;",
    name = "onCreateView",
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
)

// ----------------------------------------------------------------------------
// 4) Upsell do Secret Admirer (Gold). É o pop-up de venda, NÃO o jogo do
//    Secret Admirer nem o vídeo recompensado dele.
// ----------------------------------------------------------------------------
private object SecretAdmirerUpsellFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/feature/secretadmirer/internal/view/SecretAdmirerUpsellDialogFragment;",
    name = "onCreateView",
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
)

// ----------------------------------------------------------------------------
// 5) Upsell Platinum Likes ao deslizar — ShowPlatinumLikesUpsellForSwipe.invoke().
//
// Na 17.15.0 isto era um DialogFragment (PlatinumLikesUpsellDialogFragment).
// Na 17.41.0 essa classe não existe mais: virou um bottom sheet em Compose
// com nome R8, então o alvo passou a ser o caso de uso que decide e abre o
// modal. Ele é um suspend que devolve Unit (todos os retornos do método são
// kotlin.Unit.a), então devolver Unit direto é válido e a corrotina termina
// de forma síncrona.
// Classe d / método a nesta versão; 9 registradores, 3 de entrada, v0 livre.
// ----------------------------------------------------------------------------
private object PlatinumLikesUpsellForSwipeFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/mylikes/domain/usecase/d;",
    name = "a",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Li4w;", "Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
)

// Fecha o DialogFragment e devolve view nula. Landroidx/fragment/app/i; é o
// DialogFragment desta build (confirmado: ele define dismissAllowingStateLoss
// e está na cadeia dos quatro fragmentos acima).
private const val DISMISS_DIALOG_FRAGMENT = """
    invoke-virtual {p0}, Landroidx/fragment/app/i;->dismissAllowingStateLoss()V
    const/4 p1, 0x0
    return-object p1
"""

private const val RETURN_UNIT = """
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
    return-object v0
"""

@Suppress("unused")
val tinderRemoveUpsellDialogsPatch = bytecodePatch(
    name = "Tinder Remove Upsell Dialogs",
    description = "Removes upsell pop-ups such as Platinum Likes, Boost, and Secret Admirer.",
    default = true,
) {
    compatibleWith(TinderCompatibility.TINDER)

    execute {
        MyLikesUpsellFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT)
        HeadlessPurchaseUpsellFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT)
        PrimetimeBoostUpsellFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT)
        SecretAdmirerUpsellFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT)
        PlatinumLikesUpsellForSwipeFingerprint.method.addInstructions(0, RETURN_UNIT)
    }
}

/*
 * OBSERVAÇÕES:
 *
 * 1. NÃO TESTADO
 *    Alvos e registradores conferidos por leitura do bytecode da 17.41.0; o
 *    patch não foi compilado nem aplicado.
 *
 * 2. FICOU DE FORA DE PROPÓSITO
 *    - BoostUpsellDialogFragment: o TinderRemoveUpsellsPatch já corta o
 *      "mostrar upsell de Boost?" mais acima (TakeShouldShowBoostUpsellImpl).
 *    - PaywallDialogFragment (paywall dinâmico): é a mesma tela das telas de
 *      upgrade que o usuário abre por conta própria.
 *
 * 3. SE O DIALOGFRAGMENT FOR RENOMEADO NUMA VERSÃO FUTURA
 *    Trocar "Landroidx/fragment/app/i;" em DISMISS_DIALOG_FRAGMENT pela
 *    classe que define dismissAllowingStateLoss() e é ancestral dos fragmentos.
 */

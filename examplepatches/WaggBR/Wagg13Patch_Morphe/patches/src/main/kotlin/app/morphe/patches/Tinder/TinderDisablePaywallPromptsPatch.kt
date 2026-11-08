package app.morphe.patches.tinder.paywall

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.tinder.TinderCompatibility

// ============================================================================
// VERSÃO SUPORTADA: 17.41.0 (travada via TinderCompatibility)
//
// Dois patches OPCIONAIS (ambos desligados por padrão), vindos do repo
// Kirby1997/morphe-patches e re-derivados na 17.41.0.
// ============================================================================

// ----------------------------------------------------------------------------
// A) FLUXO CENTRAL DE PAYWALL — LaunchPaywallFlow.invoke()
//
// Todo paywall roteado pelo módulo paywallflow passa por aqui. Na 17.15.0 o
// método era c(Luc1/a;, Landroidx/appcompat/app/n;)V; na 17.41.0 é
//   Lcom/tinder/feature/paywallflow/internal/delegates/b;->d(Lven;Lh71;)V
// (confirmado: é ele que instancia LaunchPaywallFlow$invoke$1, lança a
// corrotina e envia o evento de analytics do paywall). Retornar no início
// não abre nenhum paywall.
// CUSTO: também bloqueia telas de upgrade que você abra por conta própria.
// ----------------------------------------------------------------------------
private object LaunchPaywallFlowInvokeFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/feature/paywallflow/internal/delegates/b;",
    name = "d",
    returnType = "V",
    parameters = listOf("Lven;", "Lh71;"),
)

@Suppress("unused")
val tinderDisablePaywallFlowPatch = bytecodePatch(
    name = "Tinder Disable Paywall Flow",
    description = "Short-circuits Tinder's central paywall launcher so no paywall screen opens. " +
        "Also blocks upgrade screens you open yourself.",
    default = false,
) {
    compatibleWith(TinderCompatibility.TINDER)

    execute {
        LaunchPaywallFlowInvokeFingerprint.method.addInstructions(0, "return-void")
    }
}

// ----------------------------------------------------------------------------
// B) "ASSISTA UM ANÚNCIO PARA CONTINUAR" (ads bouncer)
//
// Na 17.15.0 o alvo era RewardedVideoBottomSheet.onCreateView. Na 17.41.0 essa
// classe não existe: o bottom sheet agora é
//   Lcom/tinder/feature/adsbouncerpaywall/internal/presentation/BouncerRewardedVideoBottomSheetFragment;
// (cadeia: > Llde; > Lxx5; > Lpx9; > i). Ela não tem onCreateView próprio (o
// da base xx5 monta a view), mas tem onViewCreated(View, Bundle)V com 3
// registradores e 3 de entrada (p0 = v0, sem locais). Então o patch fecha o
// sheet logo ali, sem tocar na base compartilhada.
// LIMITE: só esconde a folha. O limite de curtidas é decidido pelo servidor.
// O RewardedVideoBottomSheetFragment genérico (outro módulo) NÃO é tocado
// porque o jogo do Secret Admirer usa vídeo recompensado.
// ----------------------------------------------------------------------------
private object BouncerRewardedVideoOnViewCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/feature/adsbouncerpaywall/internal/presentation/BouncerRewardedVideoBottomSheetFragment;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

@Suppress("unused")
val tinderDisableBouncerRewardedVideoPatch = bytecodePatch(
    name = "Tinder Disable Watch-an-Ad Sheet",
    description = "Hides the \"watch an ad to keep swiping\" bottom sheet shown when you are out of likes.",
    default = false,
) {
    compatibleWith(TinderCompatibility.TINDER)

    execute {
        BouncerRewardedVideoOnViewCreatedFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Landroidx/fragment/app/i;->dismissAllowingStateLoss()V
                return-void
            """
        )
    }
}

/*
 * OBSERVAÇÕES:
 *
 * 1. NÃO TESTADO — conferido por leitura do bytecode da 17.41.0.
 *    O mais incerto é o item B: fechar o sheet em onViewCreated é diferente do
 *    que o Kirby faz (onCreateView) e não foi exercitado em runtime.
 *
 * 2. LIKES YOU + PAYWALL FLOW
 *    O Kirby documenta um crash: com o paywall suprimido, tocar num rosto do
 *    teaser "Likes You" (Gold) quebra o app. O TinderRemoveUpsellsPatch já
 *    impede o teaser de abrir, então deixe-o ligado se usar o patch A.
 */

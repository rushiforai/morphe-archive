package app.morphe.patches.tinder.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

// ============================================================================
// FINGERPRINT 1 — CardStackAdsConfig.<init>(shouldShowAds, isGoogleRecsAdsEnabled, config)
//
// Classe (renomeada pelo R8 nesta build) com o estado de anúncios do deck.
// Mapeamento de campos confirmado pelo toString() e pelo construtor:
//   a (Z) = shouldShowAds
//   b (Z) = isGoogleRecsAdsEnabled
//   c     = googleRecsAdConfig
//
// O único consumidor desses campos é um FlowCollector (emit) que faz:
//   se shouldShowAds == true  -> carrega anúncios (Google direct / open auction)
//   se shouldShowAds == false -> para o loader e limpa (o mesmo caminho de quem
//                                não deve ver anúncios)
// Forçar shouldShowAds = false no construtor manda TODA emissão pelo caminho
// "sem anúncios". isGoogleRecsAdsEnabled e a config só são lidos dentro do
// ramo "mostrar", então não precisam ser tocados.
// ============================================================================

private object CardStackAdsConfigConstructorFingerprint : Fingerprint(
    definingClass = "Lf51/d;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Z", "Z", "Lcom/tinder/library/adsrecs/internal/e;"),
)

// ============================================================================
// FINGERPRINT 2 — ObserveNimbusRecsAdsEnabledImpl (lambda do combine)
//
// Segunda fonte de anúncios do deck (Nimbus). O flow "Nimbus Recs Ads enabled"
// combina duas levers remotas + consentimento com um AND (Z0 && Z1 && Z2).
// O handler de erro do próprio app emite FALSE quando algo falha, então FALSE
// é um estado suportado e significa "Nimbus desligado no deck".
//
// O nome desta classe (Outer$invoke$1) permaneceu legível nesta build, ao
// contrário das classes de uma letra — tende a ser mais estável entre versões.
// ============================================================================

private object NimbusRecsAdsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/adsnimbus/internal/ObserveNimbusRecsAdsEnabledImpl\$invoke\$1;",
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

// ============================================================================
// PATCH: Tinder Remove Ads
// ============================================================================

@Suppress("unused")
val tinderRemoveAdsPatch = bytecodePatch(
    name = "Tinder Remove Ads",
    description = "Remove os anúncios exibidos entre os perfis do deck de swipe.",
    default = true,
) {
    compatibleWith("com.tinder")

    execute {
        // --- Anúncios Google no deck: shouldShowAds sempre false ---
        // Construtor com 0 locais: p1 == v1 (cabe em const/4). Escrever em p1
        // antes do super-init é válido (só "this" fica não inicializado).
        runCatching {
            CardStackAdsConfigConstructorFingerprint.method.addInstructions(
                0,
                """
                    const/4 p1, 0x0
                """
            )
        }.onFailure {
            // Fingerprint não bateu: nomes ofuscados mudaram (app atualizado).
        }

        // --- Anúncios Nimbus no deck: flow "enabled" sempre false ---
        // invokeSuspend tem 4 locais, então v0 é livre. Retorno imediato de um
        // Boolean é o mesmo formato que o método já devolve no fluxo normal.
        runCatching {
            NimbusRecsAdsEnabledFingerprint.method.addInstructions(
                0,
                """
                    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                    return-object v0
                """
            )
        }.onFailure {
            // Idem.
        }
    }
}

/*
 * OBSERVAÇÕES:
 *
 * 1. ESCOPO
 *    Só os anúncios do deck de swipe (Google e Nimbus). NÃO foram tocados de
 *    propósito: anúncios em vídeo recompensado (Nimbus RV, usados no jogo do
 *    Secret Admirer), anúncios do "bouncer paywall" e anúncios de interesse
 *    patrocinado. Desligar o RV pode quebrar fluxos que esperam o vídeo
 *    terminar, então ficou de fora.
 *
 * 2. FRAGILIDADE DE VERSÃO
 *    "Lf51/d;" e "Lcom/tinder/adsrecs/internal/e;" são nomes do R8 desta build
 *    (17.34.1 / 17340184) e mudam a cada versão. A fingerprint 2 usa um nome
 *    legível e deve durar mais. Como o runCatching engole falhas, cada parte
 *    que não bater simplesmente deixa de ser aplicada, sem aviso.
 *
 * 3. NÃO TESTADO
 *    Lógica confirmada por desmontagem de bytecode; o patch não foi aplicado
 *    nem executado aqui.
 */

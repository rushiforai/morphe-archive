package app.morphe.patches.telegraph

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.telegraph.ads.SponsoredMessagesReadParamsFingerprint
import app.morphe.patches.telegraph.ads.SponsoredPeersReadParamsFingerprint

// Conteúdo patrocinado do próprio Telegram/Graph:
//  - Mensagens patrocinadas dentro do chat (isSponsored + getSponsoredMessages + readParams)
//  - Contato/canal patrocinado no topo da lista de chats (sponsoredPeers readParams)
//  - Anúncios em vídeo (VideoAds.load)
//  - Proxy/canal patrocinado (checkPromoInfoInternal + TL_help_getPromoData)
//
// Nota: os SDKs de anúncio de TERCEIROS (AppLovin/Pangle/AdMob) e a inicialização
// deles ficam no RemoveThirdPartyAdSdkPatch, não aqui.
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove Telegraph ads",
    description = "Removes sponsored messages, video ads and the sponsored proxy.",
    default = true
) {
    compatibleWith(TelegraphCompatibility.TELEGRAPH)

    // MessageObject.isSponsored(): nome preservado (sl na 13.0.2.0) e único no app.
    val isSponsoredFingerprint = Fingerprint(
        name = "isSponsored",
        returnType = "Z",
        parameters = listOf()
    )

    // MessagesController.getSponsoredMessages(long) (hs.P1 na 13.0.2.0): único método com
    // parâmetro long que monta TL_messages_getSponsoredMessages (VideoAds.load também monta,
    // mas sem parâmetros, então fica fora deste filtro).
    val getSponsoredMessagesFingerprint = Fingerprint(
        parameters = listOf("J"),
        filters = listOf(
            methodCall(
                definingClass = "Lorg/telegram/tgnet/TLRPC\$TL_messages_getSponsoredMessages;",
                name = "<init>"
            )
        )
    )

    // Anúncios em vídeo (a classe VideoAds não é ofuscada).
    val videoAdsLoadFingerprint = Fingerprint(
        definingClass = "Lorg/telegram/messenger/video/VideoAds;",
        name = "load",
        returnType = "V"
    )

    // MessagesController.checkPromoInfoInternal(boolean) (hs.O na 13.0.2.0): busca o proxy/canal
    // patrocinado.
    val promoInfoFingerprint = Fingerprint(
        returnType = "V",
        parameters = listOf("Z"),
        filters = listOf(
            methodCall(
                definingClass = "Lorg/telegram/tgnet/TLRPC\$TL_help_getPromoData;",
                name = "<init>"
            )
        )
    )

    execute {
        // 1. Mensagem patrocinada dentro do chat
        isSponsoredFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // 2. Requisição de mensagens patrocinadas (retorna null = sem dados)
        getSponsoredMessagesFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )

        // 3. Parse da resposta de mensagens patrocinadas — mesmo que o servidor responda,
        //    o readParams() não preenche o objeto e a UI não tem o que desenhar.
        SponsoredMessagesReadParamsFingerprint.method.addInstructions(0, "return-void")

        // 4. Parse dos peers patrocinados (o "anúncio" fixo no topo da lista de chats).
        //    Sem o parse, a linha vazia "Nenhum resultado" não aparece.
        SponsoredPeersReadParamsFingerprint.method.addInstructions(0, "return-void")

        // 5. Anúncios em vídeo
        videoAdsLoadFingerprint.method.addInstructions(0, "return-void")

        // 6. Proxy/canal patrocinado
        promoInfoFingerprint.method.addInstructions(0, "return-void")
    }
}

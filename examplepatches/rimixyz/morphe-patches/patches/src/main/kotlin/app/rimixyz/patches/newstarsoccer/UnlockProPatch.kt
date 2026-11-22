package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER

private const val BB = "Lcom/newstargames/newstarsoccer/bb_;"

/**
 * Força as quatro flags locais de licença que o jogo consulta diretamente:
 *
 * - g_gIAP_CareerMode              -> Licença Pro / Remover anúncios / contrato e transferência
 *                                     (lida por c_Product_RemoveAds.p_Owned, c_TScreen_GameMenu,
 *                                      c_TPlayer.p_CheckEnergyAndPlayMatch e outras telas)
 * - g_gIAP_PitchPack               -> Campos e clima (c_Product_PitchWeatherPack.p_Owned)
 * - g_gIAP_UserBallsFree           -> bolas de usuário gratuitas
 * - g_gIAP_UserBallsSpecialEffect  -> efeito especial das bolas
 *
 * A descoberta que corrigiu este patch: p_HasPurchasedProduct NÃO tem chamadores no DEX.
 * O caminho real de concessão é o loop c_ProductRegistry.m_CheckForPurchases (chamado a cada
 * frame por c_GameEngine.p_OnUpdate) e, no clique do usuário, c_TScreen_Message.m_DoCallFunction
 * -> c_Product.p_Buy(), que grava essas flags e chama c_TPlayer.m_SaveGlobalData().
 * Manter o hook de p_HasPurchasedProduct é inofensivo e cobre a ponte Google Play, mas o efeito
 * funcional vem das flags.
 *
 * A injeção usa v0 (livre: a instrução original `const/4 v0, 0` vem logo depois e o restaura).
 * Nenhum recibo, token ou resposta da Play é fabricado; apenas estado local do jogo.
 *
 * Fora de escopo (conforme RELATORIO_FINAL.md): itens consumíveis via p_CanConsumeProduct,
 * que exigiriam um Purchase real para o consumeAsync e concederiam recompensa sem evento legítimo.
 */
@Suppress("unused")
val unlockProPatch = patch(
    name = "Unlock Pro features",
    description = "Unlocks the Pro license, ad removal, pitches/weather and special balls by setting the local license flags the game checks.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    execute {
        verifyNewStarSoccerTarget()

        ProductRegistryCheckPurchasesFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                sput v0, $BB->g_gIAP_CareerMode:I
                sput v0, $BB->g_gIAP_PitchPack:I
                sput v0, $BB->g_gIAP_UserBallsFree:I
                sput v0, $BB->g_gIAP_UserBallsSpecialEffect:I
            """.trimIndent(),
        )

        // Ponte da Play: reporta produtos como possuídos (defensivo; sem chamadores confirmados).
        // v2 é o registrador de retorno de p_HasPurchasedProduct.
        GoogleIAPHasPurchasedFingerprint.method.addInstructions(
            0,
            """
                const/4 v2, 0x1
                return v2
            """.trimIndent(),
        )
    }
}

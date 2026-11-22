package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val BB = "Lcom/newstargames/newstarsoccer/bb_;"
private const val PRODUCT = "Lcom/newstargames/newstarsoccer/c_Product;"
private const val PRODUCT_REGISTRY = "Lcom/newstargames/newstarsoccer/c_ProductRegistry;"
private const val PRODUCT_NRG_SOFT = "Lcom/newstargames/newstarsoccer/c_Product_NRG_Soft;"
private const val PRODUCT_AGENT_SOFT = "Lcom/newstargames/newstarsoccer/c_Product_Agent_Soft;"
private const val PRODUCT_TRAINER_SOFT = "Lcom/newstargames/newstarsoccer/c_Product_Trainer_Soft;"
private const val TPLAYER = "Lcom/newstargames/newstarsoccer/c_TPlayer;"
private const val AUDIO_MANAGER = "Lcom/newstargames/newstarsoccer/c_AudioManager;"
private const val SOCIAL_HUB = "Lcom/newstargames/newstarsoccer/c_SocialHub;"
private const val AGENT_DETAILS = "Lcom/newstargames/newstarsoccer/c_TScreen_AgentDetails;"

private data class ClassicStaffSpec(
    val uid: String,
    val canonicalSku: String,
)

private val CLASSIC_STAFF_SPECS = listOf(
    ClassicStaffSpec("Agent_2", "com.newstargames.newstarsoccer.topagent_3.1"),
    ClassicStaffSpec("Agent_3", "com.newstargames.newstarsoccer.topagent_5.1"),
    ClassicStaffSpec("Trainer_2", "com.newstargames.newstarsoccer.trainer_3.1"),
    ClassicStaffSpec("Trainer_3", "com.newstargames.newstarsoccer.trainer_5.1"),
)

/**
 * Converte todos os itens consumíveis/temporários que originalmente exigiam dinheiro real
 * (Google Play IAP) em uma economia interna real paga com Star Bux (★), funcionando de forma
 * nativa tanto no visual moderno quanto no visual clássico:
 *
 *  - Chuteiras especiais (Boot_21..26): ativa o ramo nativo de chuteiras Soft do motor
 *    (NS-CNTRL Mk1 ★250 até NS-SWRV+CNTRL ★750, 15 a 40 jogos) e mantém as 6 disponíveis
 *    permanentemente ao lado da rotação natural das chuteiras comuns.
 *  - Energéticos Super NRG (NRG_5 = Bolt x1, NRG_6 = Bolt x4): re-registra como c_Product_NRG_Soft
 *    usando a fórmula oficial de Star Bux do próprio jogo (level * 25 - 1 e level * 25 * 3.5 - 1).
 *  - Agentes e Treinadores Pro (tier 2, 100 jogos) e Expert (tier 3, 150 jogos): re-registra
 *    como c_Product_Agent_Soft / c_Product_Trainer_Soft com preços progressivos por Star Level:
 *      * Tier 1: level * 5  + 25  (original)
 *      * Tier 2: level * 15 + 100
 *      * Tier 3: level * 35 + 250
 *  - Saldo insuficiente: substitui o redirecionamento morto para o BuxOverlay (compra de Star Bux
 *    com dinheiro real) pelo banner nativo localizado "Sem dinheiro suficiente!" em ambos os visuais.
 *
 * Não interfere nas licenças permanentes tratadas por `Unlock Pro features` (Career Mode /
 * Remoção de anúncios, Pitch/Weather Pack e bolas especiais).
 */
@Suppress("unused")
val inGameEconomyPatch = patch(
    name = "Convert IAP items to Star Bux",
    description = "Converts real-money boots, Super NRG drinks, and Pro/Expert agents and trainers into Star Bux purchases in both modern and classic UI, and replaces the dead Buy Bux redirect with an in-game insufficient-funds banner.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    execute {
        verifyNewStarSoccerTarget()

        // 1. c_SoccerProducts.m_RegisterProducts():
        //    (a) Força o ramo pago nativo para registrar Boot_21..26 como c_Product_Boot_Soft.
        //    (b) Após m_SetAltPricing(), substitui NRG_5, NRG_6, Agent_2/3 e Trainer_2/3 por
        //        suas subclasses *_Soft via c_ProductRegistry.m_AddProduct (que também reescreve
        //        os 11 TweakValues do produto no catálogo "Products").
        val registerProducts = SoccerProductsRegisterProductsFingerprint.method
        val paidBootsSgetIdx = registerProducts.instructions.indexOfFirst { ins ->
            ins.opcode == Opcode.SGET &&
                ((ins as ReferenceInstruction).reference as? FieldReference)?.let {
                    it.definingClass == BB && it.name == "g_gPaidVersion"
                } == true
        }
        check(paidBootsSgetIdx >= 0) {
            "In-game economy: sget g_gPaidVersion não encontrado em c_SoccerProducts.m_RegisterProducts"
        }
        val paidBootsReg = (registerProducts.instructions[paidBootsSgetIdx] as OneRegisterInstruction).registerA
        registerProducts.replaceInstruction(paidBootsSgetIdx, "const/4 v$paidBootsReg, 0x1")

        val regProductsReturnIdx = registerProducts.instructions.size - 1
        check(
            regProductsReturnIdx >= 0 &&
                registerProducts.instructions[regProductsReturnIdx].opcode == Opcode.RETURN_VOID,
        ) {
            "In-game economy: return-void final não encontrado em c_SoccerProducts.m_RegisterProducts"
        }
        check(checkNotNull(registerProducts.implementation).registerCount >= 5) {
            "In-game economy: registradores insuficientes em c_SoccerProducts.m_RegisterProducts"
        }
        registerProducts.addInstructions(
            regProductsReturnIdx,
            """
                new-instance v0, $PRODUCT_NRG_SOFT
                invoke-direct { v0 }, $PRODUCT_NRG_SOFT-><init>()V
                const/4 v1, 0x5
                const-string v2, "supernrg_1.1"
                const-string v3, "NRG_S"
                const/4 v4, 0x1
                invoke-virtual { v0, v1, v2, v3, v4 }, $PRODUCT_NRG_SOFT->m_Product_NRG_Soft_new(ILjava/lang/String;Ljava/lang/String;I)$PRODUCT_NRG_SOFT
                move-result-object v0
                invoke-static { v0 }, $PRODUCT_REGISTRY->m_AddProduct($PRODUCT)I

                new-instance v0, $PRODUCT_NRG_SOFT
                invoke-direct { v0 }, $PRODUCT_NRG_SOFT-><init>()V
                const/4 v1, 0x6
                const-string v2, "supernrg_4.1"
                const-string v3, "NRG_SMulti"
                const/4 v4, 0x4
                invoke-virtual { v0, v1, v2, v3, v4 }, $PRODUCT_NRG_SOFT->m_Product_NRG_Soft_new(ILjava/lang/String;Ljava/lang/String;I)$PRODUCT_NRG_SOFT
                move-result-object v0
                invoke-static { v0 }, $PRODUCT_REGISTRY->m_AddProduct($PRODUCT)I

                new-instance v0, $PRODUCT_AGENT_SOFT
                invoke-direct { v0 }, $PRODUCT_AGENT_SOFT-><init>()V
                const/4 v1, 0x2
                invoke-virtual { v0, v1 }, $PRODUCT_AGENT_SOFT->m_Product_Agent_Soft_new(I)$PRODUCT_AGENT_SOFT
                move-result-object v0
                invoke-static { v0 }, $PRODUCT_REGISTRY->m_AddProduct($PRODUCT)I

                new-instance v0, $PRODUCT_AGENT_SOFT
                invoke-direct { v0 }, $PRODUCT_AGENT_SOFT-><init>()V
                const/4 v1, 0x3
                invoke-virtual { v0, v1 }, $PRODUCT_AGENT_SOFT->m_Product_Agent_Soft_new(I)$PRODUCT_AGENT_SOFT
                move-result-object v0
                invoke-static { v0 }, $PRODUCT_REGISTRY->m_AddProduct($PRODUCT)I

                new-instance v0, $PRODUCT_TRAINER_SOFT
                invoke-direct { v0 }, $PRODUCT_TRAINER_SOFT-><init>()V
                const/4 v1, 0x2
                invoke-virtual { v0, v1 }, $PRODUCT_TRAINER_SOFT->m_Product_Trainer_Soft_new(I)$PRODUCT_TRAINER_SOFT
                move-result-object v0
                invoke-static { v0 }, $PRODUCT_REGISTRY->m_AddProduct($PRODUCT)I

                new-instance v0, $PRODUCT_TRAINER_SOFT
                invoke-direct { v0 }, $PRODUCT_TRAINER_SOFT-><init>()V
                const/4 v1, 0x3
                invoke-virtual { v0, v1 }, $PRODUCT_TRAINER_SOFT->m_Product_Trainer_Soft_new(I)$PRODUCT_TRAINER_SOFT
                move-result-object v0
                invoke-static { v0 }, $PRODUCT_REGISTRY->m_AddProduct($PRODUCT)I
            """.trimIndent(),
        )

        // 2. c_Product_Boot.m_UpdateAvailability():
        //    Muda o corte `m_id > 21` para `m_id > 20` para que Boot_21 (NS-CNTRL Mk1) também fique
        //    sempre disponível junto com Boot_22..26, preservando a rotação natural de Boot_1..20.
        val bootAvail = ProductBootUpdateAvailabilityFingerprint.method
        val paidFlagIdx = bootAvail.instructions.indexOfFirst { ins ->
            ins.opcode == Opcode.SGET &&
                ((ins as ReferenceInstruction).reference as? FieldReference)?.let {
                    it.definingClass == BB && it.name == "g_gPaidVersion"
                } == true
        }
        check(paidFlagIdx >= 0) {
            "In-game economy: sget g_gPaidVersion não encontrado em c_Product_Boot.m_UpdateAvailability"
        }
        val bootCutoffIdx = (paidFlagIdx + 1 until minOf(paidFlagIdx + 8, bootAvail.instructions.size))
            .firstOrNull { idx ->
                val ins = bootAvail.instructions[idx]
                ins is NarrowLiteralInstruction && ins.narrowLiteral == 21
            }
            ?: error("In-game economy: constante 21 não encontrada em c_Product_Boot.m_UpdateAvailability")
        val bootCutoffReg = (bootAvail.instructions[bootCutoffIdx] as OneRegisterInstruction).registerA
        bootAvail.replaceInstruction(bootCutoffIdx, "const/16 v$bootCutoffReg, 0x14")

        // 2b. c_Product_Boot.m_RefreshRemoteConfiguration():
        //     No APK gratuito, Boot_ResellMult_* para Boot_21..26 vem como "None" (ou SKU de IAP),
        //     pois o jogo esperava c_Product_Boot_Hard. Ao torná-las c_Product_Boot_Soft, o método
        //     tenta Float.parseFloat("None") e gera NumberFormatException no boot. Mantém os arrays
        //     m_fuseparam_resellMult (0.0f) e m_fuseparam_resellSKU ("") alocados sem chamar parseFloat.
        val bootRemoteConfig = ProductBootRefreshRemoteConfigFingerprint.method
        val configLenIdx = bootRemoteConfig.instructions.indexOfFirst { ins ->
            ins.opcode == Opcode.INVOKE_VIRTUAL &&
                ((ins as ReferenceInstruction).reference as? MethodReference)?.let {
                    it.definingClass == "Ljava/lang/String;" && it.name == "length"
                } == true
        }
        check(configLenIdx >= 0 && configLenIdx + 1 < bootRemoteConfig.instructions.size) {
            "In-game economy: String.length não encontrado em c_Product_Boot.m_RefreshRemoteConfiguration"
        }
        val configLenMove = bootRemoteConfig.instructions[configLenIdx + 1]
        check(configLenMove.opcode == Opcode.MOVE_RESULT) {
            "In-game economy: move-result esperado após String.length em m_RefreshRemoteConfiguration"
        }
        val configLenReg = (configLenMove as OneRegisterInstruction).registerA
        bootRemoteConfig.replaceInstruction(configLenIdx + 1, "const/4 v$configLenReg, 0x0")

        // 3. c_Product_NRG.m_UpdateAvailability():
        //    Ignora o bloco que desativa NRG_5 e NRG_6 quando a Play Billing não devolve SKUs.
        val nrgAvail = ProductNrgUpdateAvailabilityFingerprint.method
        val nrgPaidIdx = nrgAvail.instructions.indexOfFirst { ins ->
            ins.opcode == Opcode.SGET &&
                ((ins as ReferenceInstruction).reference as? FieldReference)?.let {
                    it.definingClass == BB && it.name == "g_gPaidVersion"
                } == true
        }
        check(nrgPaidIdx >= 0) {
            "In-game economy: sget g_gPaidVersion não encontrado em c_Product_NRG.m_UpdateAvailability"
        }
        val nrgPaidReg = (nrgAvail.instructions[nrgPaidIdx] as OneRegisterInstruction).registerA
        nrgAvail.replaceInstruction(nrgPaidIdx, "const/4 v$nrgPaidReg, 0x1")

        // 4. c_TPlayer.p_GetPriceAgent(I)I e p_GetPriceTrainer(I)I:
        //    Tier 1 = level * 5 + 25 | Tier 2 = level * 15 + 100 | Tier 3 = level * 35 + 250.
        patchStaffPriceMethod(PlayerGetPriceAgentFingerprint.method, "p_GetPriceAgent")
        patchStaffPriceMethod(PlayerGetPriceTrainerFingerprint.method, "p_GetPriceTrainer")

        // 5. bb_GSPlayerUtility.g_GSPlayerNotEnoughCash(I)V:
        //    Impede a abertura do BuxOverlay (loja morta de Star Bux por dinheiro real) no visual
        //    moderno e usa o banner neutro "splashmessage" com CMESSAGE_NOTENOUGHCASHSHORT.
        val notEnoughCash = PlayerNotEnoughCashFingerprint.method
        val isNewIdx = notEnoughCash.instructions.indexOfFirst { ins ->
            ins.opcode == Opcode.INVOKE_STATIC &&
                ((ins as ReferenceInstruction).reference as? MethodReference)?.let {
                    it.definingClass == BB && it.name == "g_IsAppearanceNew"
                } == true
        }
        check(isNewIdx >= 0 && isNewIdx + 1 < notEnoughCash.instructions.size) {
            "In-game economy: g_IsAppearanceNew não encontrado em g_GSPlayerNotEnoughCash"
        }
        val isNewMove = notEnoughCash.instructions[isNewIdx + 1]
        check(isNewMove.opcode == Opcode.MOVE_RESULT) {
            "In-game economy: move-result esperado após g_IsAppearanceNew"
        }
        val isNewReg = (isNewMove as OneRegisterInstruction).registerA
        notEnoughCash.replaceInstruction(isNewIdx + 1, "const/4 v$isNewReg, 0x0")

        val splashBuxIdx = notEnoughCash.instructions.indexOfFirst { ins ->
            ins.opcode == Opcode.CONST_STRING &&
                ((ins as ReferenceInstruction).reference as? StringReference)?.string == "splashmessageBux"
        }
        check(splashBuxIdx >= 0) {
            "In-game economy: string splashmessageBux não encontrada em g_GSPlayerNotEnoughCash"
        }
        val splashReg = (notEnoughCash.instructions[splashBuxIdx] as OneRegisterInstruction).registerA
        notEnoughCash.replaceInstruction(splashBuxIdx, "const-string v$splashReg, \"splashmessage\"")

        // 6. Visual clássico — compra de Super NRG x1 / x4 com Star Bux em c_TScreen_BootShop.m_Buy():
        val bootShopBuy = BootShopBuyFingerprint.method
        val buyPaidIdx = bootShopBuy.instructions.indexOfFirst { ins ->
            ins.opcode == Opcode.SGET &&
                ((ins as ReferenceInstruction).reference as? FieldReference)?.let {
                    it.definingClass == BB && it.name == "g_gPaidVersion"
                } == true
        }
        check(buyPaidIdx >= 0) {
            "In-game economy: sget g_gPaidVersion não encontrado em c_TScreen_BootShop.m_Buy"
        }
        val buyPaidReg = (bootShopBuy.instructions[buyPaidIdx] as OneRegisterInstruction).registerA
        bootShopBuy.replaceInstruction(buyPaidIdx, "const/4 v$buyPaidReg, 0x1")

        // 7. Visual clássico — botões Agente / Treinador no menu principal abrem a lista completa
        //    de 3 tiers mesmo offline (sem exigir lista de SKUs da Play Store).
        patchGameMenuStaffButton(GameMenuButtonAgentFingerprint.method, "m_ButtonAgent")
        patchGameMenuStaffButton(GameMenuButtonTrainerFingerprint.method, "m_ButtonTrainer")

        // 8. Visual clássico — lista Agent_2/3 e Trainer_2/3 com preços em Star Bux em m_RefreshTableBux().
        patchClassicRefreshTableBux(BootShopRefreshTableBuxFingerprint.method)

        // 9. Visual clássico — compra de Agent_2/3 e Trainer_2/3 via c_Product_*_Soft.p_TryBuy()
        //    em c_TScreen_BootShop.m_BuyStarBux().
        patchClassicBuyStarBux(BootShopBuyStarBuxFingerprint.method)

        // 10. Visual clássico — tela de detalhes (Info -> Contratar) exibe preço em Star Bux e
        //     permite contratar todos os 3 tiers offline.
        val agentDetailsSetup = AgentDetailsSetupScreenFingerprint.method
        val getPriceTrainerIdx = agentDetailsSetup.instructions.indexOfFirst { ins ->
            ins.opcode == Opcode.INVOKE_VIRTUAL &&
                ((ins as ReferenceInstruction).reference as? MethodReference)?.let {
                    it.definingClass == TPLAYER && it.name == "p_GetPriceTrainer"
                } == true
        }
        check(getPriceTrainerIdx >= 0) {
            "In-game economy: p_GetPriceTrainer não encontrado em c_TScreen_AgentDetails.m_SetUpScreen"
        }
        val tierOneCheckIdx = (getPriceTrainerIdx - 1 downTo maxOf(0, getPriceTrainerIdx - 16))
            .firstOrNull { idx ->
                agentDetailsSetup.instructions[idx].opcode == Opcode.IF_NE &&
                    idx + 1 < agentDetailsSetup.instructions.size &&
                    agentDetailsSetup.instructions[idx + 1].opcode == Opcode.IF_NEZ
            }
            ?: error("In-game economy: guarda level == 1 não encontrada em c_TScreen_AgentDetails.m_SetUpScreen")
        agentDetailsSetup.replaceInstruction(tierOneCheckIdx, "nop")

        val agentDetailsHire = AgentDetailsButtonHireFingerprint.method
        val onlinePurchaseIdx = agentDetailsHire.instructions.indexOfFirst { ins ->
            ins.opcode == Opcode.SGET_BOOLEAN &&
                ((ins as ReferenceInstruction).reference as? FieldReference)?.let {
                    it.definingClass == AGENT_DETAILS && it.name == "m_onlinepurchase"
                } == true
        }
        check(onlinePurchaseIdx >= 0) {
            "In-game economy: sget-boolean m_onlinepurchase não encontrado em c_TScreen_AgentDetails.m_ButtonHire"
        }
        val onlineReg = (agentDetailsHire.instructions[onlinePurchaseIdx] as OneRegisterInstruction).registerA
        agentDetailsHire.replaceInstruction(onlinePurchaseIdx, "const/4 v$onlineReg, 0x1")
    }
}

private fun patchStaffPriceMethod(method: MutableMethod, label: String) {
    val regs = checkNotNull(method.implementation).registerCount
    check(regs >= 3) { "In-game economy: layout inesperado em $label (regs=$regs)" }
    val thisReg = regs - 2
    val idReg = regs - 1

    // Substitui o comportamento desde o índice 0 usando rótulos gerenciados por addInstructionsWithLabels.
    method.addInstructionsWithLabels(
        0,
        """
            const/4 v0, 0x1
            if-ne v$idReg, v0, :check_tier2
            const/4 v0, 0x0
            invoke-virtual { v$thisReg, v0 }, $TPLAYER->p_GetStarLevel(I)I
            move-result v0
            mul-int/lit8 v0, v0, 0x5
            add-int/lit8 v0, v0, 0x19
            return v0

            :check_tier2
            const/4 v0, 0x2
            if-ne v$idReg, v0, :check_tier3
            const/4 v0, 0x0
            invoke-virtual { v$thisReg, v0 }, $TPLAYER->p_GetStarLevel(I)I
            move-result v0
            mul-int/lit8 v0, v0, 0xf
            add-int/lit8 v0, v0, 0x64
            return v0

            :check_tier3
            const/4 v0, 0x3
            if-ne v$idReg, v0, :fallback
            const/4 v0, 0x0
            invoke-virtual { v$thisReg, v0 }, $TPLAYER->p_GetStarLevel(I)I
            move-result v0
            mul-int/lit8 v0, v0, 0x23
            add-int/lit16 v0, v0, 0xfa
            return v0

            :fallback
            const v0, 0x98967f
            return v0
        """.trimIndent(),
    )
}

private fun patchGameMenuStaffButton(method: MutableMethod, label: String) {
    val splitIdx = method.instructions.indexOfFirst { ins ->
        ins.opcode == Opcode.INVOKE_STATIC &&
            ((ins as ReferenceInstruction).reference as? MethodReference)?.name == "split"
    }
    check(splitIdx >= 0) { "In-game economy: split não encontrado em c_TScreen_GameMenu.$label" }

    val ifLezIdx = (splitIdx + 1 until minOf(splitIdx + 25, method.instructions.size))
        .firstOrNull { idx -> method.instructions[idx].opcode == Opcode.IF_LEZ }
        ?: error("In-game economy: if-lez de produtos online não encontrado em c_TScreen_GameMenu.$label")

    method.replaceInstruction(ifLezIdx, "nop")
}

private fun patchClassicRefreshTableBux(method: MutableMethod) {
    for (spec in CLASSIC_STAFF_SPECS) {
        val uidIdx = method.instructions.indexOfFirst { ins ->
            ins.opcode == Opcode.CONST_STRING &&
                ((ins as ReferenceInstruction).reference as? StringReference)?.string == spec.uid
        }
        check(uidIdx >= 0) {
            "In-game economy: string ${spec.uid} não encontrada em m_RefreshTableBux"
        }

        // 1. Substitui `iget-object vX, vX, c_Product->m_sku` pela string canônica de SKU usada
        //    como tag da coluna 3 na tabela clássica (lida por m_ButtonInfo e m_BuyStarBux).
        val skuIgetIdx = (uidIdx + 1 until minOf(uidIdx + 8, method.instructions.size))
            .firstOrNull { idx ->
                val ins = method.instructions[idx]
                ins.opcode == Opcode.IGET_OBJECT &&
                    ((ins as ReferenceInstruction).reference as? FieldReference)?.name == "m_sku"
            }
            ?: error("In-game economy: iget m_sku de ${spec.uid} não encontrado em m_RefreshTableBux")
        val skuReg = (method.instructions[skuIgetIdx] as OneRegisterInstruction).registerA
        method.replaceInstruction(skuIgetIdx, "const-string v$skuReg, \"${spec.canonicalSku}\"")

        // 2. Força o resultado de `c_StringStack.p_Contains(sku)` para true para exibir o item offline.
        val containsIdx = (skuIgetIdx + 1 until minOf(skuIgetIdx + 6, method.instructions.size))
            .firstOrNull { idx ->
                val ins = method.instructions[idx]
                ins.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((ins as ReferenceInstruction).reference as? MethodReference)?.name == "p_Contains"
            }
            ?: error("In-game economy: p_Contains de ${spec.uid} não encontrado em m_RefreshTableBux")
        val containsMove = method.instructions[containsIdx + 1]
        check(containsMove.opcode == Opcode.MOVE_RESULT) {
            "In-game economy: move-result esperado após p_Contains de ${spec.uid}"
        }
        val containsReg = (containsMove as OneRegisterInstruction).registerA
        method.replaceInstruction(containsIdx + 1, "const/4 v$containsReg, 0x1")

        // 3. Troca `c_SocialHub.m_Instance2().p_GetPrice(sku)` por
        //    `c_ProductRegistry.m_Get(uid).p_PriceString()`.
        //    A primeira instrução (`m_Instance2`) é alvo de salto interno, então usamos
        //    replaceInstruction nela para manter o destino de branch intacto.
        val getInstanceIdx = (containsIdx + 2 until minOf(containsIdx + 25, method.instructions.size))
            .firstOrNull { idx ->
                val ins = method.instructions[idx]
                ins.opcode == Opcode.INVOKE_STATIC &&
                    ((ins as ReferenceInstruction).reference as? MethodReference)?.let {
                        it.definingClass == SOCIAL_HUB && it.name == "m_Instance2"
                    } == true
            }
            ?: error("In-game economy: SocialHub.m_Instance2 de ${spec.uid} não encontrado em m_RefreshTableBux")

        val moveHub = method.instructions[getInstanceIdx + 1]
        val callGetPrice = method.instructions[getInstanceIdx + 2]
        val movePrice = method.instructions[getInstanceIdx + 3]
        check(
            moveHub.opcode == Opcode.MOVE_RESULT_OBJECT &&
                callGetPrice.opcode == Opcode.INVOKE_VIRTUAL &&
                ((callGetPrice as ReferenceInstruction).reference as? MethodReference)?.name == "p_GetPrice" &&
                movePrice.opcode == Opcode.MOVE_RESULT_OBJECT,
        ) {
            "In-game economy: sequência p_GetPrice inesperada para ${spec.uid} em m_RefreshTableBux"
        }

        val priceReg = (movePrice as OneRegisterInstruction).registerA
        method.replaceInstruction(getInstanceIdx, "const-string v$priceReg, \"${spec.uid}\"")
        method.replaceInstruction(
            getInstanceIdx + 1,
            "invoke-static { v$priceReg }, $PRODUCT_REGISTRY->m_Get(Ljava/lang/String;)$PRODUCT",
        )
        method.replaceInstruction(getInstanceIdx + 2, "move-result-object v$priceReg")
        method.replaceInstruction(
            getInstanceIdx + 3,
            "invoke-virtual { v$priceReg }, $PRODUCT->p_PriceString()Ljava/lang/String;",
        )
        method.addInstruction(getInstanceIdx + 4, "move-result-object v$priceReg")
    }
}

private fun patchClassicBuyStarBux(method: MutableMethod) {
    val regs = checkNotNull(method.implementation).registerCount
    check(regs >= 11) { "In-game economy: layout inesperado em m_BuyStarBux (regs=$regs)" }

    val getSelectedIdx = method.instructions.indexOfFirst { ins ->
        ins.opcode == Opcode.INVOKE_VIRTUAL &&
            ((ins as ReferenceInstruction).reference as? MethodReference)?.name == "p_GetSelectedText"
    }
    check(getSelectedIdx >= 0 && getSelectedIdx + 2 < method.instructions.size) {
        "In-game economy: p_GetSelectedText não encontrado em m_BuyStarBux"
    }
    val moveSelected = method.instructions[getSelectedIdx + 1]
    check(moveSelected.opcode == Opcode.MOVE_RESULT_OBJECT) {
        "In-game economy: move-result-object esperado após p_GetSelectedText em m_BuyStarBux"
    }
    val selectedReg = (moveSelected as OneRegisterInstruction).registerA
    check(selectedReg == 0) {
        "In-game economy: registrador inesperado para texto selecionado em m_BuyStarBux (v$selectedReg)"
    }

    val insertIdx = getSelectedIdx + 2
    val continueTarget = method.instructions[insertIdx]

    // Preserva v0 (SKU selecionado), v1 (0 de retorno) e v2 (índice de coluna 3); usa apenas v3..v10.
    method.addInstructionsWithLabels(
        insertIdx,
        """
            const-string v3, "com.newstargames.newstarsoccer.topagent_3.1"
            invoke-virtual { v0, v3 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
            move-result v3
            if-nez v3, :check_agent3
            sget-object v3, $BB->g_player:$TPLAYER
            invoke-virtual { v3 }, $TPLAYER->p_GotAgent()I
            move-result v3
            const/4 v4, 0x2
            if-ne v3, v4, :buy_agent2
            goto :play_error
            :buy_agent2
            const-string v3, "Agent_2"
            goto :try_buy_soft

            :check_agent3
            const-string v3, "com.newstargames.newstarsoccer.topagent_5.1"
            invoke-virtual { v0, v3 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
            move-result v3
            if-nez v3, :check_trainer2
            sget-object v3, $BB->g_player:$TPLAYER
            invoke-virtual { v3 }, $TPLAYER->p_GotAgent()I
            move-result v3
            const/4 v4, 0x3
            if-ne v3, v4, :buy_agent3
            goto :play_error
            :buy_agent3
            const-string v3, "Agent_3"
            goto :try_buy_soft

            :check_trainer2
            const-string v3, "com.newstargames.newstarsoccer.trainer_3.1"
            invoke-virtual { v0, v3 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
            move-result v3
            if-nez v3, :check_trainer3
            sget-object v3, $BB->g_player:$TPLAYER
            invoke-virtual { v3 }, $TPLAYER->p_GotTrainer()I
            move-result v3
            const/4 v4, 0x2
            if-ne v3, v4, :buy_trainer2
            goto :play_error
            :buy_trainer2
            const-string v3, "Trainer_2"
            goto :try_buy_soft

            :check_trainer3
            const-string v3, "com.newstargames.newstarsoccer.trainer_5.1"
            invoke-virtual { v0, v3 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
            move-result v3
            if-nez v3, :continue_buy_bux
            sget-object v3, $BB->g_player:$TPLAYER
            invoke-virtual { v3 }, $TPLAYER->p_GotTrainer()I
            move-result v3
            const/4 v4, 0x3
            if-ne v3, v4, :buy_trainer3
            goto :play_error
            :buy_trainer3
            const-string v3, "Trainer_3"

            :try_buy_soft
            invoke-static { v3 }, $PRODUCT_REGISTRY->m_Get(Ljava/lang/String;)$PRODUCT
            move-result-object v3
            if-eqz v3, :done_soft
            invoke-virtual { v3 }, $PRODUCT->p_TryBuy()V
            :done_soft
            return v1

            :play_error
            invoke-static { }, $AUDIO_MANAGER->m_Get()$AUDIO_MANAGER
            move-result-object v4
            const-string v5, "CError"
            const/high16 v6, 0x3f800000
            const/4 v7, 0x0
            const/4 v8, -0x1
            const/4 v9, 0x1
            const/high16 v10, 0x3f800000
            invoke-virtual/range { v4 .. v10 }, $AUDIO_MANAGER->p_Play(Ljava/lang/String;FFIZF)I
            return v1
        """.trimIndent(),
        ExternalLabel("continue_buy_bux", continueTarget),
    )
}

package app.template.patches.buzzcast

// Patches BuzzCast 3.2.92 (base: rushiranpise/morphe-patches, commit 7d640be). NÃO TESTADO em dispositivo.
//
// REGRA IMPORTANTE (erro real visto no log: VerifyError "target dex pc 0x2a is not at instruction start"):
// addInstructions(índice, smali) NÃO recalcula labels locais do trecho inserido. Labels (:cont, :skip...) só
// funcionam quando o trecho é inserido no índice 0 do método. Em qualquer outro índice, NÃO use labels/desvios
// (if-*, goto) dentro do smali inserido; use replaceInstruction/nop ou reestruture sem desvio.
//
// Atualização 3.2.90 -> 3.2.92: o bytecode de TODOS os métodos alterados é idêntico nas duas versões
// (comparado instrução a instrução). Só mudaram: (a) os IDs de recurso da tela de Ajustes (versionLL/versionTV...,
// 0x7f0a1638/0x7f0a163a -> 0x7f0a163b/0x7f0a163d) e (b) os nomes ofuscados dos métodos de billing
// (H0,J0,J1... -> Q0,R0,e2...), que o filtro por assinatura já cobre.
//
//   1) "Unlock SVIP"          -> VIP + bloqueio de billing + bloqueio de Unity Ads + limpeza de manifest
//   2) "Hide live room notice" -> remove o aviso "Transmissão ao vivo saudável..." (separado)
//   3) "Hide join and follow messages" -> esconde "ingressou" e "Seguiu a âncora" no chat da live
//   4) "Hide live room cards"          -> esconde os cards do canto da live (evento, parede de honra, recarga)
//   5) "Hide home banner"              -> esconde o carrossel de banners/promoções no meio da lista da aba inicial
//   7) "Disable trackers"              -> desliga AppsFlyer, Firebase Analytics, Bugly e ID de publicidade
//   8) "Block app open reports"        -> (desligado por padrão) não envia ao servidor o relatório de abertura/canal
//   9) "Hide first recharge popups"    -> esconde os diálogos de oferta de primeira recarga
//  10) "Hide splash promo"            -> pula a tela promocional em tela cheia ("Pular N" / botão GO) ao abrir o app
//  11) "Hide update prompt"            -> esconde o aviso "Atualizar agora / Depois" do app
//  12) "Hide rating prompts"           -> esconde os pedidos de avaliação do app
//   (oculto) branding Wagg13  -> tela de Ajustes: linha "Versão" vira link do canal + rodapé do mod.
//                               Aplicado automaticamente junto com qualquer patch acima (dependsOn), sem aparecer na lista.
//
// Importante: o patch original apagava o corpo dos métodos (removeInstructions), deixando blocos try/catch
// órfãos -> java.lang.VerifyError em com.unity3d.ads.UnityAds. Aqui nunca se removem instruções: só se
// insere o retorno antecipado no índice 0.

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val PKG = "com.guochao.faceshow"
private const val VERSION = "3.2.92"

private val BUZZCAST_COMPATIBILITY = Compatibility(
    name = "BuzzCast",
    packageName = PKG,
    apkFileType = ApkFileType.APK,
    targets = listOf(AppTarget(version = VERSION)),
)

// Dependência do patch 1 (não aparece sozinha na lista).
private val buzzCastStripAdManifestPatch = resourcePatch(
    description = "Removes ad permissions and manifest entries.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val adPermissions = setOf(
                "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
            )

            for (tag in listOf("uses-permission", "uses-library", "activity", "property")) {
                val nodes = doc.getElementsByTagName(tag)
                for (i in nodes.length - 1 downTo 0) {
                    val node = nodes.item(i) as? Element ?: continue
                    val name = node.getAttribute("android:name")
                    val remove = when (tag) {
                        "uses-permission" -> name in adPermissions
                        "uses-library" -> name == "android.ext.adservices"
                        "activity" -> name.startsWith("com.unity3d.services.ads.") ||
                            name == "com.unity3d.ads.adplayer.FullScreenWebViewDisplay"
                        "property" -> name == "android.adservices.AD_SERVICES_CONFIG"
                        else -> false
                    }
                    if (remove) node.parentNode?.removeChild(node)
                }
            }
        }
    }
}

// Tela de Ajustes (com.guochao.faceshow.mine.view.SettingActivity):
//   - Linha "Versão  3.2.92 >"  -> rótulo vira "Channel Wagg13 Mods" (número da versão continua) e, ao tocar,
//     abre https://t.me/wagg13mods (em vez de checar atualização).
//   - Rodapé "BuzzCast version 3.2.92" -> "Mod BuzzCast by Wagg13 - V3.2.92".
// Detalhes (3.2.92; os campos/métodos são os mesmos da 3.2.90):
//   * onCreate: z (curr_version_text, 0x7f0a03ba) recebe AAMethod.getFullVersionName(); G (versionNumTV) recebe
//     SystemUtil.getVersionName(). Inserimos o nosso código logo depois desses setText (antes de h3()).
//     Usamos v0, v1 e p1 como temporários (onCreate tem 2 locais; o p1/Bundle já é sobrescrito pelo app).
//   * O rótulo (versionTV, 0x7f0a163d na 3.2.92; era 0x7f0a163a na 3.2.90) não é guardado em campo: pegamos com
//     findViewById. É o único ID de recurso fixo do bundle.
//   * onClick(View): se a view clicada for o campo F (versionLL) abre o Telegram e retorna (sem depender de ID).
//   * r3(): decide mostrar o ponto vermelho de "atualização disponível" (campo H); como a linha deixou de
//     checar atualização, o ponto fica sempre escondido.
// Específico da 3.2.92 (campos/métodos ofuscados z, F, G, H, r3 e o ID do rótulo).
//
// PATCH OCULTO E OBRIGATÓRIO: não tem "name", então não aparece na lista do Morphe, e todos os outros patches
// declaram dependsOn(buzzCastBrandingPatch): ao aplicar qualquer um deles, este vai junto e o usuário não
// consegue desmarcá-lo. IMPORTANTE: precisa ficar declarado ANTES dos patches que dependem dele (os vals
// top-level são inicializados na ordem do arquivo).
private val buzzCastBrandingPatch = bytecodePatch(
    description = "Settings screen: version row opens the Wagg13 Mods Telegram channel and the footer shows the mod credit.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)

    execute {
        val settings = mutableClassDefBy("Lcom/guochao/faceshow/mine/view/SettingActivity;")
        val cls = "Lcom/guochao/faceshow/mine/view/SettingActivity;"

        // ---- onCreate: textos ----
        val onCreate = settings.methods.first { it.name == "onCreate" && it.parameterTypes.size == 1 }
        val versionNameCall = onCreate.implementation!!.instructions.toList().indexOfFirst {
            it.opcode == Opcode.INVOKE_STATIC &&
                ((it as ReferenceInstruction).reference as MethodReference).let { r ->
                    r.definingClass == "Lcom/guochao/faceshow/utils/SystemUtil;" && r.name == "getVersionName"
                }
        }
        check(versionNameCall >= 0) { "SystemUtil.getVersionName não encontrado no SettingActivity.onCreate" }

        // [i] invoke-static getVersionName, [i+1] move-result-object, [i+2] setText, [i+3] invoke-direct h3()
        onCreate.addInstructions(
            versionNameCall + 3,
            """
                iget-object v0, p0, ${cls}->z:Landroid/widget/TextView;
                new-instance v1, Ljava/lang/StringBuilder;
                invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
                const-string p1, "Mod BuzzCast by Wagg13 - V"
                invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-static {}, Lcom/guochao/faceshow/utils/SystemUtil;->getVersionName()Ljava/lang/String;
                move-result-object p1
                invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v1
                invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

                const v0, 0x7f0a163d
                invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;
                move-result-object v0
                check-cast v0, Landroid/widget/TextView;
                const-string v1, "Channel Wagg13 Mods"
                invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
            """,
        )

        // ---- onClick: abrir o canal do Telegram ----
        settings.methods
            .first { it.name == "onClick" && it.parameterTypes.size == 1 }
            .addInstructions(
                0,
                """
                    iget-object v0, p0, ${cls}->F:Landroid/view/View;
                    if-ne p1, v0, :cont
                    new-instance v0, Landroid/content/Intent;
                    const-string v1, "android.intent.action.VIEW"
                    const-string v2, "https://t.me/wagg13mods"
                    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
                    move-result-object v2
                    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V
                    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
                    return-void
                    :cont
                    nop
                """,
            )

        // ---- r3: esconder o ponto vermelho de atualização da linha ----
        settings.methods
            .first { it.name == "r3" && it.parameterTypes.isEmpty() && it.returnType == "V" }
            .addInstructions(
                0,
                """
                    iget-object v0, p0, ${cls}->H:Landroid/view/View;
                    const/16 v1, 0x8
                    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                    return-void
                """,
            )
    }
}

@Suppress("unused")
val buzzCastUnlockSvipPatch = bytecodePatch(
    name = "Unlock SVIP",
    description = "Unlocks SVIP features and removes ads and purchase pop-ups.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)
    dependsOn(buzzCastStripAdManifestPatch, buzzCastBrandingPatch)

    execute {
        fun replaceBody(className: String, methodName: String, returnType: String, smali: String) {
            mutableClassDefBy(className).methods
                .first { it.name == methodName && it.returnType == returnType }
                .addInstructions(0, smali)
        }

        fun replaceBodyIfPresent(className: String, methodName: String, returnType: String, smali: String) {
            val classDef = runCatching { mutableClassDefBy(className) }.getOrNull() ?: return
            classDef.methods
                .firstOrNull { it.name == methodName && it.returnType == returnType }
                ?.addInstructions(0, smali)
        }

        // ---------------- VIP ----------------
        val vipData = "Lcom/guochao/faceshow/aaspring/beans/UserVipData;"
        val level2 = "const/4 v0, 0x2\nreturn v0"
        val boxed2 =
            "const/4 v0, 0x2\ninvoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;\nmove-result-object v0\nreturn-object v0"
        val forever = "const-wide v0, 0x7fffffffffffffffL\nreturn-wide v0"
        val retTrue = "const/4 v0, 0x1\nreturn v0"

        // NÃO forçar isOfficial()/getOfficialAccount(): o modelo UserVipData é de TODOS os usuários, e quando
        // isOfficial() é true o app troca a foto de perfil real pelo logo do app + selo "V"
        // (ex.: SuperFansLevelView.setUserImg não carrega UserBean.getSmallImg() para contas oficiais).
        // Era isso que trocava as fotos de perfil por uma imagem padrão.
        replaceBody(vipData, "getIsVip", "I", level2)
        replaceBody(vipData, "getVipLevel", "I", level2)
        replaceBody("Lcom/guochao/faceshow/bean/UserBean;", "getVipLevel", "I", level2)
        replaceBody(vipData, "getVip", "Ljava/lang/Integer;", boxed2)
        replaceBody(vipData, "getVipExpireTime", "J", forever)
        replaceBody(vipData, "getThirdEndTime", "J", forever)
        replaceBody(vipData, "getVipSign", "Ljava/lang/String;", "const-string v0, \"vvip1_1\"\nreturn-object v0")
        replaceBodyIfPresent(vipData, "isVip", "Z", retTrue)
        replaceBodyIfPresent("Lcom/guochao/faceshow/aaspring/utils/VipUserInfoUtil\$1;", "getVipLevel", "I", level2)
        replaceBodyIfPresent("Lcom/guochao/faceshow/aaspring/utils/VipUserInfoUtil\$1;", "isVip", "Z", retTrue)

        // ---------------- Google Play billing ----------------
        mutableClassDefBy("Lcom/guochao/faceshow/aaspring/modulars/googlepay/InAppBillingViewModel;")
            .methods
            .filter { m ->
                m.returnType == "I" && m.parameters.any {
                    it.type == "Landroidx/fragment/app/FragmentActivity;" ||
                        it.type == "Lcom/android/billingclient/api/ProductDetails;" ||
                        it.type == "Lcom/android/billingclient/api/SkuDetails;"
                }
            }
            .forEach { it.addInstructions(0, "const/4 v0, -0x1\nreturn v0") }

        // ---------------- Unity Ads ----------------
        val unity = mutableClassDefBy("Lcom/unity3d/ads/UnityAds;")
        unity.methods
            .first { it.name == "isSupported" && it.returnType == "Z" }
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        unity.methods
            .filter { it.name in setOf("initialize", "load", "show") && it.returnType == "V" }
            .forEach { it.addInstructions(0, "return-void") }
    }
}

// Esconde o aviso "Transmissão ao vivo saudável..." ao entrar nas lives.
// LiveChatFragment.reset(): const 0x7f130951 (R.string.liveshengming) -> getString -> createNoticModel
// -> AutoLiveChatAdapter.k(LiveMessageModel, Z). Troca só essa última chamada por nop.
// O ID 0x7f130951 (R.string.liveshengming) é o mesmo na 3.2.90 e na 3.2.92.
@Suppress("unused")
val buzzCastHideLiveNoticePatch = bytecodePatch(
    name = "Hide live room notice",
    description = "Removes the \"healthy live streaming\" message shown in every live chat.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)
    dependsOn(buzzCastBrandingPatch)

    execute {
        val method = mutableClassDefBy("Lcom/guochao/faceshow/aaspring/modulars/live/common/LiveChatFragment;")
            .methods.first { it.name == "reset" && it.parameterTypes.isEmpty() }

        val instructions = method.implementation!!.instructions.toList()

        val constIndex = instructions.indexOfFirst {
            it.opcode == Opcode.CONST && (it as WideLiteralInstruction).wideLiteral == 0x7f130951L
        }
        if (constIndex < 0) throw IllegalStateException("R.string.liveshengming não encontrado (versão do app diferente?)")

        val addIndex = (constIndex until instructions.size).first { i ->
            val ins = instructions[i]
            ins.opcode == Opcode.INVOKE_VIRTUAL &&
                ((ins as ReferenceInstruction).reference as MethodReference).let {
                    it.definingClass == "Lcom/guochao/faceshow/aaspring/modulars/live/adapter/AutoLiveChatAdapter;" &&
                        it.name == "k"
                }
        }

        method.replaceInstruction(addIndex, "nop")
    }
}

// Esconde as mensagens "<usuário> ingressou" e "<usuário> Seguiu a âncora" do chat da live.
// Todas as mensagens do chat (inclusive sala de voz) passam por AutoLiveChatAdapter.k(LiveMessageModel, Z).
// BaseLiveMessage.getType() == "TYPE_ADD_GROUP" (ingressou) ou "TYPE_FOLLOW_ANCHOR" (seguiu) -> return-void.
// k() tem 7 registradores locais (v0..v6), então v0/v1 são livres. Específico da 3.2.92 (idêntico na 3.2.90) (método "k" ofuscado).
@Suppress("unused")
val buzzCastHideJoinFollowMessagesPatch = bytecodePatch(
    name = "Hide join and follow messages",
    description = "Hides the \"joined\" and \"followed\" messages in live chats and the join banner at the top.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)
    dependsOn(buzzCastBrandingPatch)

    execute {
        val model = "Lcom/guochao/faceshow/aaspring/modulars/live/model/LiveMessageModel;"
        val base = "Lcom/guochao/faceshow/aaspring/modulars/live/model/BaseLiveMessage;"

        mutableClassDefBy("Lcom/guochao/faceshow/aaspring/modulars/live/adapter/AutoLiveChatAdapter;")
            .methods
            .first {
                it.name == "k" && it.returnType == "V" &&
                    it.parameterTypes.size == 2 && it.parameterTypes[0].toString() == model
            }
            .addInstructions(
                0,
                """
                    invoke-virtual {p1}, ${model}->getData()${base}
                    move-result-object v0
                    if-eqz v0, :cont
                    invoke-virtual {v0}, ${base}->getType()Ljava/lang/String;
                    move-result-object v0
                    const-string v1, "TYPE_ADD_GROUP"
                    invoke-static {v1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v1
                    if-nez v1, :skip
                    const-string v1, "TYPE_FOLLOW_ANCHOR"
                    invoke-static {v1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :cont
                    :skip
                    return-void
                    :cont
                    nop
                """,
            )

        // Banner "<usuário> ingressou" que aparece no topo da tela da live.
        // LiveJoinTipsShowController.G(14 params) / H(12 params) enfileiram e desenham esse banner
        // (chamados por BaseLiveRoomFragment.V8, VoiceRoomLiveChatFragment.dispatchGCIMMessage e $39.run).
        // return-void no início = o banner (e a animação de entrada que vai junto) nunca é mostrado.
        mutableClassDefBy("Lcom/guochao/faceshow/gift/controller/LiveJoinTipsShowController;")
            .methods
            .filter {
                it.returnType == "V" &&
                    ((it.name == "G" && it.parameterTypes.size == 14) ||
                        (it.name == "H" && it.parameterTypes.size == 12))
            }
            .also { check(it.size == 2) { "LiveJoinTipsShowController.G/H não encontrados (versão do app diferente?)" } }
            .forEach { it.addInstructions(0, "return-void") }
    }
}

// Esconde os cards que ficam se revezando no canto direito da live (evento "Sinal do Coração",
// "Parede de honra do presente", recarga diária etc.).
// Todos vêm da mesma lista: LiveRoomAutoScrollPageFragment.w7(Z, Fragment, List) entrega a lista ao
// AutoScrollAdapter.i(List). Trocando a lista por uma ArrayList vazia o carrossel fica sem itens:
//   - AutoScrollAdapter.getItemCount()/e() = 0, e o auto-scroll só gira quando e() > 1 (sem risco de crash)
//   - PageIndicatorView.setCount(0): sem pontinhos
// Específico da 3.2.92 (idêntico na 3.2.90) (método "w7" ofuscado). w7 é estático: p2 = a lista; v0 é registrador livre.
@Suppress("unused")
val buzzCastHideCornerCardsPatch = bytecodePatch(
    name = "Hide live room cards",
    description = "Hides the rotating event and gift cards in the corner of live rooms.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)
    dependsOn(buzzCastBrandingPatch)

    execute {
        mutableClassDefBy("Lcom/guochao/faceshow/aaspring/modulars/live/fragment/LiveRoomAutoScrollPageFragment;")
            .methods
            .first { it.name == "w7" && it.parameterTypes.size == 3 }
            .addInstructions(
                0,
                """
                    new-instance v0, Ljava/util/ArrayList;
                    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                    move-object p2, v0
                """,
            )
    }
}

// Esconde o carrossel de banners/promoções (ex.: "Semanal Estrela dos Presentes") que aparece no meio da
// lista de lives da aba inicial ("Para você").
// LiveListFragment.N7() cria um RoomItemData com liveId "-4" e o insere na lista do LiveListAdapter na
// posição 4 (ou no fim, se a lista tiver até 4 itens). RoomItemData.getItemType() mapeia "-4" -> tipo 4, e o
// LiveListAdapter.L() cria um LiveBannerHeader (layout header_live_banner) para esse tipo.
// N7() é chamado por LiveListFragment.O7 e w8 (duas vezes). Com return-void o item nunca entra na lista
// (o app já trata "-4" como item de enfeite: LiveRoomListValueHolder.r o descarta da navegação das salas).
// Específico da 3.2.92 (idêntico na 3.2.90) (método "N7" ofuscado).
@Suppress("unused")
val buzzCastHideHomeBannerPatch = bytecodePatch(
    name = "Hide home banner",
    description = "Hides the promotional banner in the middle of the home list.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)
    dependsOn(buzzCastBrandingPatch)

    execute {
        mutableClassDefBy("Lcom/guochao/faceshow/aaspring/modulars/live/fragment/LiveListFragment;")
            .methods
            .first { it.name == "N7" && it.returnType == "V" && it.parameterTypes.isEmpty() }
            .addInstructions(0, "return-void")
    }
}

// ---------------------------------------------------------------------------------------------------------------
// TELEMETRIA / RASTREADORES (3.2.92)
// ---------------------------------------------------------------------------------------------------------------
// Verificado no DEX:
//   * BaseApplication.trackFirebase(String, Bundle) é o único ponto que envia eventos ao Firebase Analytics.
//   * AppsflyerUtils.init/onTrackEvent/handAfReport iniciam e alimentam o AppsFlyer. O app ainda chama
//     AppsFlyerLib.getAppsFlyerUID() no login/pagamento; esse método NÃO depende de init()/start() (lê o estado
//     interno do SDK), então desligar o init não quebra o login.
//   * BuglyUtils.init inicia o Bugly (relatório de crash/desempenho da Tencent). As demais chamadas do app
//     (Bugly.updateUserId / putUserData) checam a flag "inicializado" e retornam sem fazer nada.
//   * Todos os stubs são "return-void" no índice 0: nada é apagado, então não há risco de VerifyError.

// Dependência (oculta): manifest.
private val buzzCastTrackerManifestPatch = resourcePatch(
    description = "Disables Firebase Analytics / advertising ID collection and removes ad-ID permissions.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val removePermissions = setOf(
                "com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_TOPICS",
                "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
            )
            val perms = doc.getElementsByTagName("uses-permission")
            for (i in perms.length - 1 downTo 0) {
                val node = perms.item(i) as? Element ?: continue
                if (node.getAttribute("android:name") in removePermissions) node.parentNode?.removeChild(node)
            }

            val application = doc.getElementsByTagName("application").item(0) as Element
            fun meta(name: String, value: String) {
                val metas = doc.getElementsByTagName("meta-data")
                for (i in 0 until metas.length) {
                    val e = metas.item(i) as? Element ?: continue
                    if (e.getAttribute("android:name") == name) { e.setAttribute("android:value", value); return }
                }
                val e = doc.createElement("meta-data")
                e.setAttribute("android:name", name)
                e.setAttribute("android:value", value)
                application.appendChild(e)
            }
            meta("firebase_analytics_collection_deactivated", "true")
            meta("google_analytics_adid_collection_enabled", "false")
            meta("google_analytics_ssaid_collection_enabled", "false")
            meta("google_analytics_default_allow_ad_personalization_signals", "false")
            meta("com.facebook.sdk.AdvertiserIDCollectionEnabled", "false")
        }
    }
}

@Suppress("unused")
val buzzCastDisableTrackersPatch = bytecodePatch(
    name = "Disable trackers",
    description = "Stops the app from collecting your usage and advertising data.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)
    dependsOn(buzzCastTrackerManifestPatch, buzzCastBrandingPatch)

    execute {
        fun stub(className: String, methodName: String, paramCount: Int) {
            mutableClassDefBy(className).methods
                .first { it.name == methodName && it.returnType == "V" && it.parameterTypes.size == paramCount }
                .addInstructions(0, "return-void")
        }

        stub("Lcom/guochao/faceshow/BaseApplication;", "trackFirebase", 2)

        val appsflyer = "Lcom/guochao/faceshow/aaspring/utils/AppsflyerUtils;"
        stub(appsflyer, "init", 1)
        stub(appsflyer, "onTrackEvent", 2)
        stub(appsflyer, "handAfReport", 2)

        stub("Lcom/guochao/faceshow/utils/BuglyUtils;", "init", 1)
    }
}

// Opcional (desligado por padrão): o app envia ao próprio servidor "abri o app" e "canal de instalação".
// DelayIniter.reportAppChannel() / reportAppChannelAf(String, String) / reportAppOpen() -> AppOpenViewModel.m/n/o.
// Não há efeito local conhecido, mas o servidor pode usar isso para atribuição; por isso fica desligado.
@Suppress("unused")
val buzzCastBlockAppReportsPatch = bytecodePatch(
    name = "Block app open reports",
    description = "Stops the app from telling BuzzCast every time you open it.",
    default = false,
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)
    dependsOn(buzzCastBrandingPatch)

    execute {
        val delayIniter = mutableClassDefBy("Lcom/guochao/faceshow/aaspring/utils/DelayIniter;")
        for ((name, params) in listOf("reportAppChannel" to 0, "reportAppChannelAf" to 2, "reportAppOpen" to 0)) {
            delayIniter.methods
                .first { it.name == name && it.returnType == "V" && it.parameterTypes.size == params }
                .addInstructions(0, "return-void")
        }
    }
}

// Esconde os diálogos de "primeira recarga".
// BaseFirstRechargeDialog.show(FragmentManager, String) é o funil único: FirstRechargeDialog e
// FirstRechargeFragment herdam dele. return-void no índice 0 = o diálogo nunca é exibido.
// (Não cobre o cabeçalho de primeira recarga no painel de presentes, o item no chat da live nem o
//  FirstChargeRadarDialog: são componentes separados.)
@Suppress("unused")
val buzzCastHideFirstRechargePopupPatch = bytecodePatch(
    name = "Hide first recharge popups",
    description = "Hides the first-recharge offer pop-ups.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)
    dependsOn(buzzCastBrandingPatch)

    execute {
        mutableClassDefBy("Lcom/guochao/faceshow/aaspring/modulars/googlepay/firstrecharge/BaseFirstRechargeDialog;")
            .methods
            .first { it.name == "show" && it.returnType == "V" && it.parameterTypes.size == 2 }
            .addInstructions(0, "return-void")
    }
}

// Pula a tela promocional em tela cheia que aparece às vezes ao abrir o app (imagem do servidor com contagem
// "Pular N" e botão GO, ex.: "BuzzCast Short Video Creative Contest").
// Fluxo (SplashFragment herda de BaseSplashFragment):
//   C7(): m = SplashUtils.getSplashData(); se (m != null && D7(m)) -> p = true e SplashActivity.J3(this) mostra o splash;
//         senão -> k = 1 e K7() segue o fluxo normal (login/principal).
//   J7() ("call showSplashOrJump"): só exibe a imagem se (m != null && D7(m) && p); senão pula.
//   D7(SplashInfoData): retorna (info.result != null && info.total > 0). A contagem "Pular" vem de BaseSplashFragment$1.onTick.
// D7 é o portão único: forçando false, os dois caminhos seguem direto para o fluxo normal.
// D7 é privado, regs=3, ins=2 (um local v0). Específico da 3.2.92.
@Suppress("unused")
val buzzCastHideSplashPromoPatch = bytecodePatch(
    name = "Hide splash promo",
    description = "Skips the full-screen promotion shown when the app opens.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)
    dependsOn(buzzCastBrandingPatch)

    execute {
        mutableClassDefBy("Lcom/guochao/faceshow/aaspring/modulars/welcome/BaseSplashFragment;")
            .methods
            .first { it.name == "D7" && it.returnType == "Z" && it.parameterTypes.size == 1 }
            .addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """,
            )
    }
}

// Esconde o aviso de atualização do app ("Atualizar agora" / "Depois").
// UpdateController.b(Activity) -> c(Activity) -> g(Activity, Z): g monta o UpdateAppDialog com o texto do servidor
// (UserBean.getUpdateCopywriting) e os botões update_now / update_later. É o único caminho que mostra o diálogo.
// Atenção: UserUpdateDialog/AnchorUpdateDialog NÃO são de atualização do app (são o aviso de "subiu de nível"),
// e ForcedUpdateActivity é a tela de cadastro (escolha de gênero); por isso não são tocados.
// g é privado, regs=6, ins=3 e retorna void. Específico da 3.2.92.
@Suppress("unused")
val buzzCastHideUpdatePromptPatch = bytecodePatch(
    name = "Hide update prompt",
    description = "Stops the pop-up that asks you to update the app.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)
    dependsOn(buzzCastBrandingPatch)

    execute {
        mutableClassDefBy("Lcom/guochao/faceshow/update/UpdateController;")
            .methods
            .first { it.name == "g" && it.returnType == "V" && it.parameterTypes.size == 2 }
            .addInstructions(0, "return-void")
    }
}

// Esconde os pedidos de avaliação do app (avaliação do Google Play e o diálogo próprio ReviewDialog).
// InAppReviewHelper.showInAppReview(int, FragmentManager, FragmentActivity) e showDefault(...) retornam boolean
// ("foi exibido?"). Chamadores: MainActivity (A5, onShowReviewEvent, onUgcPublishEvent), WatchLiveRoomActivity,
// WithdrawalMoneyActivity e H5WithdrawalMoneyWebActivity. Retornando false o app segue como se nada tivesse sido
// exibido. Ambos têm 4 locais (v0 livre). Específico da 3.2.92.
@Suppress("unused")
val buzzCastHideRatingPromptsPatch = bytecodePatch(
    name = "Hide rating prompts",
    description = "Stops the pop-ups that ask you to rate the app.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)
    dependsOn(buzzCastBrandingPatch)

    execute {
        val helper = mutableClassDefBy("Lcom/guochao/faceshow/aaspring/utils/InAppReviewHelper;")
        for (name in listOf("showInAppReview", "showDefault")) {
            helper.methods
                .first { it.name == name && it.returnType == "Z" && it.parameterTypes.size == 3 }
                .addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        return v0
                    """,
                )
        }
    }
}

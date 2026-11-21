package app.template.patches.buzzcast

// Patches BuzzCast 3.3.02 (base: rushiranpise/morphe-patches, commit 7d640be). NÃO TESTADO em dispositivo.
//
// REGRA IMPORTANTE (erro real visto no log: VerifyError "target dex pc 0x2a is not at instruction start"):
// addInstructions(índice, smali) NÃO recalcula labels locais do trecho inserido. Labels (:cont, :skip...) só
// funcionam quando o trecho é inserido no índice 0 do método. Em qualquer outro índice, NÃO use labels/desvios
// (if-*, goto) dentro do smali inserido; use replaceInstruction/nop ou reestruture sem desvio.
//
// Atualização 3.3.01 -> 3.3.02: o R8 reofuscou de novo (SettingActivity F/L/M/N -> H/N/O/P, SystemUtil.m -> q,
// LiveChatFragment.O4 -> M7, AutoLiveChatAdapter.E(3) sumiu, BaseApplication.a/m -> L, AppsflyerUtils.b.run -> d(Context),
// AppOpenViewModel.m/n/o -> w/x/y, SplashUtils.a(FragmentActivity) -> a(Context), UpdateController.a -> b/c). Todos os
// alvos continuam achados pela estrutura (assinatura / campo / string / chamada), nunca só pelo nome.
//
// Atualização 3.2.92 -> 3.3.01: o R8 reofuscou quase todos os nomes (k->j, G->k, N7->P4, w7->i, g->a, D7 -> SplashUtils.a,
// trackFirebase->a/m, DelayIniter.report*->AppOpenViewModel.m/n/o, getVip*/getVipSign -> j/o/q/t...). Por isso, sempre
// que possível os alvos agora são achados pela ASSINATURA / campos / strings / chamadas internas, e não pelo nome.
// Os trechos de smali são os mesmos da 3.2.92 (a lógica não mudou); só mudaram os alvos e os IDs de recurso.
//
//   1) "Unlock SVIP"          -> VIP + bloqueio de billing + bloqueio de Unity Ads + limpeza de manifest
//   2) "Hide live room notice" -> remove o aviso "Transmissão ao vivo saudável..." (separado)
//   3) "Hide join and follow messages" -> esconde "ingressou", "Seguiu a âncora" e as mensagens automáticas "siga-me" / "apoie o streamer" no chat da live
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
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Element

private const val PKG = "com.guochao.faceshow"
private const val VERSION = "3.3.02"

private val BUZZCAST_COMPATIBILITY = Compatibility(
    name = "BuzzCast",
    packageName = PKG,
    apkFileType = ApkFileType.APK,
    targets = listOf(AppTarget(version = VERSION)),
)

// ---------------------------------------------------------------------------------------------------------------
// Helpers para achar métodos ofuscados pela assinatura / conteúdo (valem para qualquer MutableMethod / Method).
// ---------------------------------------------------------------------------------------------------------------
private fun Method.instrList() = implementation?.instructions?.toList().orEmpty()

private fun Method.hasParams(vararg types: String) = parameterTypes.map { it.toString() } == types.toList()

private fun Method.readsField(fieldName: String) = instrList().any {
    ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name == fieldName
}

private fun Method.callsMethod(name: String) = instrList().any {
    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == name
}

private fun Method.hasString(value: String) = instrList().any {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
}

// Índice da chamada AutoLiveChatAdapter.<método>(LiveMessageModel) (1 parâmetro, void) que vem logo depois da
// const-string [afterString] (é assim que o app insere uma mensagem local no chat). Na 3.3.02 só existe essa chamada
// de 1 parâmetro (y); a de 3 parâmetros da 3.3.01 sumiu. Achado pela assinatura.
private fun Method.adapterAddCallAfterString(afterString: String): Int {
    val adapter = "Lcom/guochao/faceshow/aaspring/modulars/live/adapter/AutoLiveChatAdapter;"
    val ins = instrList()
    val start = ins.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == afterString }
    check(start >= 0) { "const-string \"$afterString\" não encontrada em $name (versão do app diferente?)" }
    return (start until ins.size).first { i ->
        val r = (ins[i] as? ReferenceInstruction)?.reference as? MethodReference
        ins[i].opcode == Opcode.INVOKE_VIRTUAL && r != null && r.definingClass == adapter &&
            r.returnType == "V" && r.parameterTypes.size == 1
    }
}

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
//   - Linha "Versão  3.3.02 >"  -> rótulo vira "Channel Wagg13 Mods" (número da versão continua) e, ao tocar,
//     abre https://t.me/wagg13mods (em vez de checar atualização).
//   - Rodapé "BuzzCast version 3.3.02" -> "Mod BuzzCast by Wagg13 - V3.3.02".
// Detalhes (3.3.02; campos ofuscados H, N, O, P e os IDs de recurso):
//   * onCreate (regs=4, p0=v2, p1=v3): H (TextView do rodapé) recebe AAMethod.a(ctx) ("BuzzCast version X"); O (TextView
//     do número) recebe SystemUtil.q() (versionName). Inserimos o nosso código logo antes do "iget-object O" (índice
//     achado pelo campo O). Só v0, v1 e p1 (v3, o Bundle, que já não é usado e é sobrescrito logo depois) são livres.
//     Sem labels. O nome do método de versionName é lido da instrução que vem logo depois do iget-object O.
//   * O rótulo (versionTV, 0x7f0a1720) não é guardado em campo: pegamos com findViewById. Os IDs da linha em
//     SettingActivity.t4: versionLL 0x7f0a171e (campo N), versionNumTV 0x7f0a171f (campo O), ponto vermelho
//     0x7f0a171d (campo P), versionTV 0x7f0a1720 (só no ActivitySettingBinding.bind).
//   * onClick(View) (regs=7, p1=v6; locais v0..v4): se a view clicada for o campo N (versionLL) abre o Telegram e
//     retorna (sem depender de ID). Inserido no índice 0, então o label :cont funciona.
//   * o5(): decide mostrar o ponto vermelho de "atualização disponível" (campo P) e é chamado do onResume. onResume
//     não tem registrador livre (regs=1), então o ponto é escondido no início do o5 (return-void logo depois).
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
        val cls = "Lcom/guochao/faceshow/mine/view/SettingActivity;"
        val settings = mutableClassDefBy(cls)

        // ---- onCreate: textos ----
        val onCreate = settings.methods.first { it.name == "onCreate" && it.parameterTypes.size == 1 }
        val onCreateInstr = onCreate.instrList()
        val versionFieldIndex = onCreateInstr.indexOfFirst {
            it.opcode == Opcode.IGET_OBJECT &&
                ((it as ReferenceInstruction).reference as FieldReference).let { r ->
                    r.definingClass == cls && r.name == "O"
                }
        }
        check(versionFieldIndex > 0) { "SettingActivity.O (número da versão) não encontrado no onCreate (versão do app diferente?)" }
        val versionGetter = (onCreateInstr[versionFieldIndex + 1] as? ReferenceInstruction)?.reference as? MethodReference
        check(
            versionGetter != null && onCreateInstr[versionFieldIndex + 1].opcode == Opcode.INVOKE_STATIC &&
                versionGetter.parameterTypes.isEmpty() && versionGetter.returnType == "Ljava/lang/String;",
        ) { "SettingActivity.onCreate: getter de versionName não encontrado depois do iget O (versão do app diferente?)" }
        val versionCall = "${versionGetter!!.definingClass}->${versionGetter.name}()Ljava/lang/String;"

        // O instruction em versionFieldIndex é "iget-object v3, p0, O" (logo depois do setText do rodapé).
        onCreate.addInstructions(
            versionFieldIndex,
            """
                iget-object p1, p0, ${cls}->H:Landroid/widget/TextView;
                new-instance v1, Ljava/lang/StringBuilder;
                invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
                const-string v0, "Mod BuzzCast by Wagg13 - V"
                invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-static {}, $versionCall
                move-result-object v0
                invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v1
                invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

                const v1, 0x7f0a1720
                invoke-virtual {p0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;
                move-result-object v1
                check-cast v1, Landroid/widget/TextView;
                const-string v0, "Channel Wagg13 Mods"
                invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
            """,
        )

        // ---- onClick: abrir o canal do Telegram ----
        settings.methods
            .first { it.name == "onClick" && it.parameterTypes.size == 1 }
            .addInstructions(
                0,
                """
                    iget-object v0, p0, ${cls}->N:Landroid/view/View;
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

        // ---- ponto vermelho de atualização da linha: escondido (INVISIBLE) e sai do o5() ----
        // o5() é o método (V, sem params) que lê o campo P (ponto) e é chamado pelo onResume.
        val dotUpdater = settings.methods.filter {
            it.returnType == "V" && it.parameterTypes.isEmpty() && it.name != "onResume" && it.implementation != null &&
                it.instrList().any { ins ->
                    ins.opcode == Opcode.IGET_OBJECT &&
                        ((ins as ReferenceInstruction).reference as FieldReference).let { r -> r.definingClass == cls && r.name == "P" }
                }
        }
        check(dotUpdater.size == 1) { "SettingActivity: método que controla o ponto vermelho (campo P) não encontrado (versão do app diferente?)" }
        dotUpdater.single().addInstructions(
            0,
            """
                iget-object v0, p0, ${cls}->P:Landroid/view/View;
                const/4 v1, 0x4
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
                .first { it.name == methodName && it.returnType == returnType && it.parameterTypes.isEmpty() }
                .addInstructions(0, smali)
        }

        fun replaceBodyIfPresent(className: String, methodName: String, returnType: String, smali: String) {
            val classDef = runCatching { mutableClassDefBy(className) }.getOrNull() ?: return
            classDef.methods
                .firstOrNull { it.name == methodName && it.returnType == returnType && it.parameterTypes.isEmpty() }
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
        //
        // Na 3.3.01 os getters de UserVipData (getIsVip/getVip/getVipExpireTime/getThirdEndTime/getVipSign) foram
        // renomeados pelo R8 (j/o/q/t). Achamos cada um pelo CAMPO que ele lê:
        //   (3.3.02) n()I       lê vip + isVip   -> nível (2)        [j na 3.3.01]
        //   (3.3.02) s()Integer lê vip + isVip   -> nível boxed (2)  [o na 3.3.01]
        //   (3.3.02) u()J       lê vipExpireTime -> nunca expira     [q na 3.3.01]
        //   (3.3.02) x()String  lê vipSign       -> "vvip1_1"        [t na 3.3.01]
        // O getter de vipPlatform NÃO é tocado (o filtro por campos não o pega; os nomes mudam a cada versão).
        // getVipLevel()I e isVip()Z mantiveram o nome.
        val vip = mutableClassDefBy(vipData)
        fun patchVipByField(returnType: String, smali: String, vararg fields: String) {
            val targets = vip.methods.filter { m ->
                m.returnType == returnType && m.parameterTypes.isEmpty() && m.implementation != null &&
                    m.name != "getVipLevel" && m.name != "isVip" &&
                    fields.all { m.readsField(it) }
            }
            check(targets.isNotEmpty()) { "UserVipData: nenhum método $returnType lendo ${fields.toList()} (versão do app diferente?)" }
            targets.forEach { it.addInstructions(0, smali) }
        }
        patchVipByField("I", level2, "vip", "isVip")
        patchVipByField("Ljava/lang/Integer;", boxed2, "vip", "isVip")
        patchVipByField("J", forever, "vipExpireTime")
        patchVipByField("Ljava/lang/String;", "const-string v0, \"vvip1_1\"\nreturn-object v0", "vipSign")

        replaceBody(vipData, "getVipLevel", "I", level2)
        replaceBody("Lcom/guochao/faceshow/bean/UserBean;", "getVipLevel", "I", level2)
        replaceBodyIfPresent(vipData, "isVip", "Z", retTrue)
        replaceBodyIfPresent("Lcom/guochao/faceshow/aaspring/utils/VipUserInfoUtil\$1;", "getVipLevel", "I", level2)
        replaceBodyIfPresent("Lcom/guochao/faceshow/aaspring/utils/VipUserInfoUtil\$1;", "isVip", "Z", retTrue)

        // ---------------- Google Play billing ----------------
        // (filtro por assinatura: pega os métodos (...)I que recebem ProductDetails/SkuDetails/FragmentActivity;
        //  na 3.3.02: I0, J0, Y1, a2 (bridges estáticos) e M1, N1, X1, Z1)
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
// LiveChatFragment.reset(): const <R.string.liveshengming> -> Resources.getString(I) -> createNoticModel
// -> AutoLiveChatAdapter.<método>(LiveMessageModel, Z) (x na 3.3.02, j na 3.3.01, k na 3.2.92). Troca só essa última chamada por nop.
// O ID da string mudou (0x7f130951 -> 0x7f130972), então achamos pela estrutura: a primeira chamada a
// Resources.getString(I) do reset() e, depois dela, a primeira chamada ao adapter com (LiveMessageModel, Z).
@Suppress("unused")
val buzzCastHideLiveNoticePatch = bytecodePatch(
    name = "Hide live room notice",
    description = "Removes the \"healthy live streaming\" message shown in every live chat.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)
    dependsOn(buzzCastBrandingPatch)

    execute {
        val adapter = "Lcom/guochao/faceshow/aaspring/modulars/live/adapter/AutoLiveChatAdapter;"
        val model = "Lcom/guochao/faceshow/aaspring/modulars/live/model/LiveMessageModel;"

        val method = mutableClassDefBy("Lcom/guochao/faceshow/aaspring/modulars/live/common/LiveChatFragment;")
            .methods.first { it.name == "reset" && it.parameterTypes.isEmpty() }

        val instructions = method.instrList()

        val getStringIndex = instructions.indexOfFirst {
            it.opcode == Opcode.INVOKE_VIRTUAL &&
                ((it as ReferenceInstruction).reference as MethodReference).let { r ->
                    r.definingClass == "Landroid/content/res/Resources;" && r.name == "getString" &&
                        r.parameterTypes.map { p -> p.toString() } == listOf("I")
                }
        }
        check(getStringIndex >= 0) { "Resources.getString(I) não encontrado no LiveChatFragment.reset (versão do app diferente?)" }

        val addIndex = (getStringIndex until instructions.size).first { i ->
            val ins = instructions[i]
            ins.opcode == Opcode.INVOKE_VIRTUAL &&
                ((ins as ReferenceInstruction).reference as MethodReference).let {
                    it.definingClass == adapter && it.returnType == "V" &&
                        it.parameterTypes.map { p -> p.toString() } == listOf(model, "Z")
                }
        }

        method.replaceInstruction(addIndex, "nop")
    }
}

// Esconde as mensagens "<usuário> ingressou" e "<usuário> Seguiu a âncora" do chat da live.
// Todas as mensagens do chat (inclusive sala de voz) passam por AutoLiveChatAdapter.<método>(LiveMessageModel, Z)
// (x na 3.3.02, j na 3.3.01). BaseLiveMessage.getType() == "TYPE_ADD_GROUP" (ingressou) ou "TYPE_FOLLOW_ANCHOR" (seguiu) -> return-void.
// O método tem 14 registradores (v0..v10 locais; p0=v11, p1=v12, p2=v13), então v0/v1 são livres.
// O getter de dados do LiveMessageModel (getData na 3.2.92) agora é "d()" e é achado pela assinatura (sem params,
// retorna BaseLiveMessage).
@Suppress("unused")
val buzzCastHideJoinFollowMessagesPatch = bytecodePatch(
    name = "Hide join and follow messages",
    description = "Hides the \"joined\" and \"followed\" messages, the join banner, and the automatic \"follow me\" and \"support the streamer\" chat messages.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)
    dependsOn(buzzCastBrandingPatch)

    execute {
        val model = "Lcom/guochao/faceshow/aaspring/modulars/live/model/LiveMessageModel;"
        val base = "Lcom/guochao/faceshow/aaspring/modulars/live/model/BaseLiveMessage;"

        val dataGetter = mutableClassDefBy(model).methods
            .first { it.parameterTypes.isEmpty() && it.returnType == base }
            .name

        mutableClassDefBy("Lcom/guochao/faceshow/aaspring/modulars/live/adapter/AutoLiveChatAdapter;")
            .methods
            .first {
                it.returnType == "V" && it.hasParams(model, "Z")
            }
            .addInstructions(
                0,
                """
                    invoke-virtual {p1}, ${model}->${dataGetter}()${base}
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
        // LiveJoinTipsShowController.M(14 params) enfileira e desenha esse banner (na 3.2.92 eram G(14) e H(12);
        // na 3.3.01/3.3.02 só existe o de 14 parâmetros). return-void no início = o banner (e a animação de entrada que
        // vai junto) nunca é mostrado.
        mutableClassDefBy("Lcom/guochao/faceshow/gift/controller/LiveJoinTipsShowController;")
            .methods
            .filter { it.returnType == "V" && it.parameterTypes.size == 14 }
            .also { check(it.size == 1) { "LiveJoinTipsShowController: método de 14 parâmetros não encontrado (versão do app diferente?)" } }
            .forEach { it.addInstructions(0, "return-void") }

        // Mensagens automáticas que o próprio app injeta no chat (locais, não vêm do servidor). Na 3.3.02 cada uma
        // tem seu método em LiveChatFragment (V, sem params), achado pela const-string que ele usa:
        //  1) M7() (const-string LIVE_CUSTOM_MSG): "Olá <você>, siga-me se gostar e seja notificado quando a
        //     transmissão começar!" (só aparece se você ainda não segue o streamer). Logo depois o mesmo método
        //     adiciona o convite de compartilhar (LOCAL_LIVE_ADD_SHARE) e, em sala de voz, a boas-vindas da sala;
        //     esses NÃO são tocados. Só a chamada ao adapter que insere a mensagem custom vira nop.
        //  2) P7() (const-string LOCAL_FIRST_VP_TIPS): "Apoie o streamer e torne-se o membro exclusivo do streamer".
        //     (Na 3.3.01 era o timer LiveChatFragment$33.run(); na 3.3.02 esse Runnable não existe mais.)
        // nop no lugar do invoke (sem labels, sem remover instruções): o registrador do modelo apenas deixa de ser usado.
        val chat = mutableClassDefBy("Lcom/guochao/faceshow/aaspring/modulars/live/common/LiveChatFragment;")
        for (marker in listOf("LIVE_CUSTOM_MSG", "LOCAL_FIRST_VP_TIPS")) {
            val holder = chat.methods
                .filter { it.returnType == "V" && it.parameterTypes.isEmpty() && it.hasString(marker) }
                .also { check(it.size == 1) { "LiveChatFragment: método com \"$marker\" não encontrado/ambíguo (versão do app diferente?)" } }
                .single()
            holder.replaceInstruction(holder.adapterAddCallAfterString(marker), "nop")
        }
    }
}

// Esconde os cards que ficam se revezando no canto direito da live (evento "Sinal do Coração",
// "Parede de honra do presente", recarga diária etc.).
// Todos vêm da mesma lista, entregue ao AutoScrollAdapter.r(List) (i na 3.3.01) (era a mesma chamada via w7 na 3.2.92).
// Zerando o parâmetro (const/4 p1, 0x0 = null) o corpo já trata null (if-eqz antes do addAll): a lista do adapter
// é limpa (clear) e fica vazia, ou seja, o carrossel não tem itens:
//   - getItemCount() = 0, e o auto-scroll só gira com mais de 1 item (sem risco de crash)
//   - sem pontinhos do indicador
// r() tem regs=3, ins=2: v0 local, p0=v1, p1=v2. Inserido no índice 0.
@Suppress("unused")
val buzzCastHideCornerCardsPatch = bytecodePatch(
    name = "Hide live room cards",
    description = "Hides the rotating event and gift cards in the corner of live rooms.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)
    dependsOn(buzzCastBrandingPatch)

    execute {
        mutableClassDefBy("Lcom/guochao/faceshow/aaspring/modulars/live/adapter/AutoScrollAdapter;")
            .methods
            .filter { it.returnType == "V" && it.hasParams("Ljava/util/List;") }
            .also { check(it.size == 1) { "AutoScrollAdapter: método (List)V não encontrado (versão do app diferente?)" } }
            .forEach { it.addInstructions(0, "const/4 p1, 0x0") }
    }
}

// Esconde o carrossel de banners/promoções (ex.: "Semanal Estrela dos Presentes") que aparece no meio da
// lista de lives da aba inicial ("Para você").
// O app cria um RoomItemData com liveId "-4" (RoomItemData.getItemType() mapeia "-4" -> tipo 4, e o LiveListAdapter
// cria um LiveBannerHeader para esse tipo). Na 3.3.02 há DOIS métodos de LiveListFragment (V, sem params, chamam
// RoomItemData.setLiveId e usam a string "-4"):
//   * F7() (era P4/N7): insere o item na lista do adapter (posição 4 ou no fim). Não tem outra função -> return-void.
//   * I8(): estado "lista vazia": põe só o item "-4" via GCCoreLoadMoreAdapter.I(List) e ainda atualiza visibilidade
//     e LoadStatus. Não dá para return-void; só a chamada I(List) (1 parâmetro List, void) vira nop.
// Distinção pela estrutura: I8 chama um método void de 1 parâmetro List depois do setLiveId; F7 não.
@Suppress("unused")
val buzzCastHideHomeBannerPatch = bytecodePatch(
    name = "Hide home banner",
    description = "Hides the promotional banner in the middle of the home list.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)
    dependsOn(buzzCastBrandingPatch)

    execute {
        val targets = mutableClassDefBy("Lcom/guochao/faceshow/aaspring/modulars/live/fragment/LiveListFragment;")
            .methods
            .filter {
                it.returnType == "V" && it.parameterTypes.isEmpty() &&
                    it.callsMethod("setLiveId") && it.hasString("-4")
            }
        check(targets.size == 2) { "LiveListFragment: esperados 2 métodos do banner (-4), achei ${targets.size} (versão do app diferente?)" }

        for (method in targets) {
            val ins = method.instrList()
            val setLiveIdIndex = ins.indexOfFirst {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "setLiveId"
            }
            val addList = (setLiveIdIndex until ins.size).firstOrNull { i ->
                val r = (ins[i] as? ReferenceInstruction)?.reference as? MethodReference
                ins[i].opcode == Opcode.INVOKE_VIRTUAL && r != null && r.returnType == "V" &&
                    r.parameterTypes.map { p -> p.toString() } == listOf("Ljava/util/List;")
            }
            if (addList != null) method.replaceInstruction(addList, "nop") else method.addInstructions(0, "return-void")
        }
    }
}

// ---------------------------------------------------------------------------------------------------------------
// TELEMETRIA / RASTREADORES (3.3.02)
// ---------------------------------------------------------------------------------------------------------------
// Verificado no DEX da 3.3.02:
//   * BaseApplication.L(String, Bundle) é o ponto que envia eventos ao Firebase Analytics (K e a só delegam).
//   * AppsflyerUtils.a(String, Bundle) é o envio de eventos do AppsFlyer e AppsflyerUtils.d(Context) é o init/start.
//   * BuglyUtils.i(Context) (estático) inicia o Bugly (relatório de crash/desempenho da Tencent). As demais chamadas
//     do app (Bugly.updateUserId / putUserData) checam a flag "inicializado" e retornam sem fazer nada.
//   * Todos os stubs são "return-void" sem apagar nada, então não há risco de VerifyError.

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
        val stringBundle = arrayOf("Ljava/lang/String;", "Landroid/os/Bundle;")

        // Firebase: BaseApplication.L(String, Bundle) é o único que chama FirebaseAnalytics (K e a são wrappers
        // que só delegam). return-void aqui corta o envio de todos os eventos.
        val app = mutableClassDefBy("Lcom/guochao/faceshow/BaseApplication;")
        app.methods
            .filter { m ->
                m.returnType == "V" && m.hasParams(*stringBundle) && m.instrList().any {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass?.contains("FirebaseAnalytics") == true
                }
            }
            .also { check(it.size == 1) { "BaseApplication: método que chama FirebaseAnalytics (String,Bundle) não encontrado (versão do app diferente?)" } }
            .forEach { it.addInstructions(0, "return-void") }

        // AppsFlyer: envio de eventos (a(String,Bundle)) e init/start (d(Context), estático). Na 3.3.02 o init/start
        // saiu do Runnable com packed-switch e ficou em AppsflyerUtils.d(Context); return-void no índice 0 dos dois.
        // O app ainda chama AppsFlyerLib.getAppsFlyerUID() no login/pagamento; esse método NÃO depende de init()/start()
        // (lê o estado interno do SDK), então desligar o init não quebra o login.
        val appsflyer = mutableClassDefBy("Lcom/guochao/faceshow/aaspring/utils/AppsflyerUtils;")
        appsflyer.methods
            .filter { it.returnType == "V" && it.hasParams(*stringBundle) }
            .also { check(it.size == 1) { "AppsflyerUtils.a(String,Bundle) não encontrado (versão do app diferente?)" } }
            .forEach { it.addInstructions(0, "return-void") }
        appsflyer.methods
            .filter { m ->
                m.returnType == "V" && m.hasParams("Landroid/content/Context;") && m.instrList().any {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == "Lcom/appsflyer/AppsFlyerLib;"
                }
            }
            .also { check(it.size == 1) { "AppsflyerUtils.d(Context) (init/start do AppsFlyer) não encontrado (versão do app diferente?)" } }
            .forEach { it.addInstructions(0, "return-void") }

        // Bugly (estático, 1 parâmetro Context)
        mutableClassDefBy("Lcom/guochao/faceshow/utils/BuglyUtils;").methods
            .filter { it.returnType == "V" && it.hasParams("Landroid/content/Context;") }
            .also { check(it.size == 1) { "BuglyUtils.a(Context) não encontrado (versão do app diferente?)" } }
            .forEach { it.addInstructions(0, "return-void") }
    }
}

// Opcional (desligado por padrão): o app envia ao próprio servidor "abri o app" e "canal de instalação".
// AppOpenViewModel.w() / x(String, String) / y() = reportAppChannel / reportAppChannelAf / reportAppOpen (V; cada um
// lança uma corrotina "$reportApp...$1"). Achados por esse new-instance. z() é setAdsID e não é mexido.
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
        val reports = mutableClassDefBy("Lcom/guochao/faceshow/aaspring/modulars/app_open/viewmodel/AppOpenViewModel;")
            .methods
            .filter { m ->
                m.returnType == "V" && m.instrList().any {
                    it.opcode == Opcode.NEW_INSTANCE &&
                        ((it as ReferenceInstruction).reference as TypeReference).type.contains("\$reportApp")
                }
            }
        check(reports.size == 3) { "AppOpenViewModel: esperados 3 métodos reportApp*, achei ${reports.size} (versão do app diferente?)" }
        reports.forEach { it.addInstructions(0, "return-void") }
    }
}

// Esconde os diálogos de "primeira recarga".
// BaseFirstRechargeDialog.show(FragmentManager, String) é o funil único: FirstRechargeDialog e
// FirstRechargeFragment herdam dele. return-void no índice 0 = o diálogo nunca é exibido.
// (Não cobre o cabeçalho de primeira recarga no painel de presentes, o item no chat da live nem o
//  FirstChargeRadarDialog: são componentes separados.) Mesmo nome/assinatura na 3.2.92, 3.3.01 e 3.3.02.
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
// Quem entrega os dados do splash é SplashUtils.a(Context): SplashInfoData (estático, regs=2, ins=1; na 3.3.01 o
// parâmetro era FragmentActivity). Os chamadores já tratam null
// (m != null) e seguem o fluxo normal (login/principal). Retornando null no índice 0 nenhum splash é montado.
@Suppress("unused")
val buzzCastHideSplashPromoPatch = bytecodePatch(
    name = "Hide splash promo",
    description = "Skips the full-screen promotion shown when the app opens.",
) {
    compatibleWith(BUZZCAST_COMPATIBILITY)
    dependsOn(buzzCastBrandingPatch)

    execute {
        mutableClassDefBy("Lcom/guochao/faceshow/aaspring/utils/SplashUtils;")
            .methods
            .filter {
                it.returnType == "Lcom/guochao/faceshow/aaspring/beans/SplashInfoData;" &&
                    it.hasParams("Landroid/content/Context;")
            }
            .also { check(it.size == 1) { "SplashUtils.a(Context)SplashInfoData não encontrado (versão do app diferente?)" } }
            .forEach {
                it.addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        return-object v0
                    """,
                )
            }
    }
}

// Esconde o aviso de atualização do app ("Atualizar agora" / "Depois").
// Na 3.3.02 UpdateController.b(Activity) -> c(Activity) -> g(Activity, Z) monta o UpdateAppDialog com o texto do
// servidor e os botões update_now / update_later (b e c são wrappers; c é o único que chama g). Chamado por
// SettingActivity.a5 e pela tela principal. return-void no índice 0 de b e c (qualquer um já basta; os dois
// ficam por segurança). g tem 2 parâmetros e não é tocado.
// Atenção: UserUpdateDialog/AnchorUpdateDialog NÃO são de atualização do app (são o aviso de "subiu de nível"),
// e ForcedUpdateActivity é a tela de cadastro (escolha de gênero); por isso não são tocados.
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
            .filter { it.returnType == "V" && it.hasParams("Landroid/app/Activity;") }
            .also { check(it.size == 2) { "UpdateController.b/c(Activity) não encontrados (versão do app diferente?)" } }
            .forEach { it.addInstructions(0, "return-void") }
    }
}

// Esconde os pedidos de avaliação do app (avaliação do Google Play e o diálogo próprio ReviewDialog).
// InAppReviewHelper.showInAppReview(int, FragmentManager, FragmentActivity) e showDefault(...) retornam boolean
// ("foi exibido?"). Retornando false o app segue como se nada tivesse sido exibido. Ambos têm 4 locais (v0 livre).
// Mesmos nomes/assinaturas na 3.2.92, 3.3.01 e 3.3.02.
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

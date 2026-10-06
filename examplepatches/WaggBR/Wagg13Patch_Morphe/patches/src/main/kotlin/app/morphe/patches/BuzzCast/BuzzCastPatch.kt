package app.template.patches.buzzcast

// Patches BuzzCast 3.2.90 (base: rushiranpise/morphe-patches, commit 7d640be).
//
//   1) "Unlock SVIP"          -> VIP + bloqueio de billing + bloqueio de Unity Ads + limpeza de manifest
//   2) "Hide live room notice" -> remove o aviso "Transmissão ao vivo saudável..." (separado)


import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val PKG = "com.guochao.faceshow"
private const val VERSION = "3.2.90"

private val buzzCastStripAdManifestPatch = resourcePatch(
    description = "Removes ad permissions and manifest entries.",
) {
    compatibleWith(PKG(VERSION))

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

@Suppress("unused")
val buzzCastUnlockSvipPatch = bytecodePatch(
    name = "Unlock SVIP",
    description = "Unlocks SVIP features, blocks purchase flow and Unity Ads.",
) {
    compatibleWith(PKG(VERSION))
    dependsOn(buzzCastStripAdManifestPatch)

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
        val boxed1 =
            "const/4 v0, 0x1\ninvoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;\nmove-result-object v0\nreturn-object v0"
        val forever = "const-wide v0, 0x7fffffffffffffffL\nreturn-wide v0"
        val retTrue = "const/4 v0, 0x1\nreturn v0"

        replaceBody(vipData, "getIsVip", "I", level2)
        replaceBody(vipData, "getVipLevel", "I", level2)
        replaceBody("Lcom/guochao/faceshow/bean/UserBean;", "getVipLevel", "I", level2)
        replaceBody(vipData, "getVip", "Ljava/lang/Integer;", boxed2)
        replaceBody(vipData, "getVipExpireTime", "J", forever)
        replaceBody(vipData, "getThirdEndTime", "J", forever)
        replaceBody(vipData, "getVipSign", "Ljava/lang/String;", "const-string v0, \"vvip1_1\"\nreturn-object v0")
        replaceBodyIfPresent(vipData, "isVip", "Z", retTrue)
        replaceBodyIfPresent(vipData, "isOfficial", "Z", retTrue)
        replaceBodyIfPresent("Lcom/guochao/faceshow/aaspring/utils/VipUserInfoUtil\$1;", "getVipLevel", "I", level2)
        replaceBodyIfPresent("Lcom/guochao/faceshow/aaspring/utils/VipUserInfoUtil\$1;", "isVip", "Z", retTrue)
        replaceBodyIfPresent("Lcom/guochao/lib_service_center/live/game/UserVipData1;", "getOfficialAccount", "Ljava/lang/Integer;", boxed1)
    }
}

// Esconde o aviso "Transmissão ao vivo saudável..." ao entrar nas lives.
// LiveChatFragment.reset(): const 0x7f130951 (R.string.liveshengming) -> getString -> createNoticModel
// -> AutoLiveChatAdapter.k(LiveMessageModel, Z). Troca só essa última chamada por nop.
// O ID 0x7f130951 é específico da 3.2.90.
@Suppress("unused")
val buzzCastHideLiveNoticePatch = bytecodePatch(
    name = "Hide live room notice",
    description = "Removes the 'healthy live streaming' notice shown in every live chat.",
) {
    compatibleWith(PKG(VERSION))

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

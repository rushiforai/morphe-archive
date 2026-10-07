package app.s.chzzk.ad

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.s.chzzk.common.utils.rewrite
import app.s.chzzk.common.utils.parameterTypeNames
import app.s.chzzk.common.utils.localRegisterCount
import app.s.chzzk.chat.SETTINGS
import app.s.chzzk.chat.chatCustomizationPatch
import app.s.chzzk.shared.Constants.COMPATIBILITY_CHZZK
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Playback without ads",
    description = "Skips player ad-source wrapping, ignores live ad events and removes AD cards from the clip feed.",
) {
    compatibleWith(COMPATIBILITY_CHZZK)
    dependsOn(chatCustomizationPatch)

    execute {
        val playerModels = "Lcom/navercorp/game/android/community/data/core/entity/player/"
        mutableClassDefBy("${playerModels}extension/SourceExtensionsKt;").methods.single {
            it.returnType == "Lcom/naver/prismplayer/Source;" && it.parameterTypeNames ==
                listOf("Lcom/naver/prismplayer/Source;", "${playerModels}PlayableAdParams;")
        }.rewrite("return-object p0")
        mutableClassDefBy("Lcom/navercorp/game/android/community/core/feature/feature/player/ad/AdEnterPlayer;")
            .methods.single {
                it.returnType == "V" && it.parameterTypeNames == listOf(
                    "Lcom/navercorp/game/android/community/core/feature/feature/player/data/LivePlayerData\$Event\$AD;"
                )
            }.rewrite("return-void")
        val cardType = classDefBy("Lcom/navercorp/shortform/sdk/data/dto/CreatorHubCard;").methods.single {
            it.name == "getCardType" && it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty()
        }
        val adCardBridge = mutableClassDefBy(SETTINGS).methods.single { it.name == "isAdCard" }
        check(adCardBridge.localRegisterCount >= 1)
        adCardBridge.rewrite("""
            check-cast p0, Lcom/navercorp/shortform/sdk/data/dto/CreatorHubCard;
            invoke-virtual {p0}, ${cardType.definingClass}->${cardType.name}()Ljava/lang/String;
            move-result-object p0
            const-string v0, "AD"
            invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            return v0
        """)
        val cards = mutableClassDefBy("Lcom/navercorp/shortform/sdk/data/dto/CreatorHubCardsBody;")
            .methods.single { it.name == "getCards" && it.returnType == "Ljava/util/List;" && it.parameterTypes.isEmpty() }
        cards.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }.reversed().forEach { (index, instruction) ->
                val register = (instruction as OneRegisterInstruction).registerA
                cards.addInstructions(index, """
                    invoke-static/range {v$register .. v$register}, $SETTINGS->filterClipCards(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$register
                """.trimIndent())
            }
    }
}

package app.s.chzzk.homebanner

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.localRegisterCount
import app.s.chzzk.common.utils.parameterTypeNames
import app.s.chzzk.common.initializeField
import app.s.chzzk.shared.Constants.COMPATIBILITY_CHZZK_MOBILE
import app.s.chzzk.shared.nativeKeyboxPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

@Suppress("unused")
val hideHomeBannerPatch = bytecodePatch(
    name = "Home without promotions",
    description = "Removes home carousels, campaign exposure and promotional topic rows while preserving content rows.",
) {
    compatibleWith(COMPATIBILITY_CHZZK_MOBILE)
    dependsOn(nativeKeyboxPatch)

    execute {
        val entities = "Lcom/navercorp/game/android/community/data/"
        initializeField("${entities}mobile/entity/home/streaming/StreamingHomeBanners;", "banners", null)
        initializeField("${entities}core/entity/football/FootballCampaign;", "exposure", false)
        val component = "Lcom/navercorp/game/android/community/data/mobile/entity/recommendation/TopicSlotComponent"
        if (packageMetadata.versionName == "3.17.0") {
            val rows = mutableClassDefBy("Lcom/navercorp/game/android/community/app/ui/home/streaming/topic/e;")
                .methods.single { it.name == "invoke" }
            val instructions = rows.implementation!!.instructions
            val banners = setOf("$component${'$'}ImageBannerComponent;", "$component${'$'}SpecialEventBannerComponent;")
            val checks = instructions.withIndex().filter {
                it.value.opcode == Opcode.INSTANCE_OF && it.value.getReference<TypeReference>()?.type in banners
            }
            check(checks.size == 2)
            for ((index, instruction) in checks) {
                check(instructions[index + 1].opcode == Opcode.IF_EQZ)
                val register = (instruction as TwoRegisterInstruction).registerA
                rows.replaceInstruction(index, "const/4 v$register, 0x0")
            }
            return@execute
        }
        val rows = mutableClassDefBy("Lcom/navercorp/game/android/community/app/ui/home/streaming/topic/StreamingTopicSlotContentsKt;")
            .methods.single { it.returnType == "V" && "$component;" in it.parameterTypeNames }
        check(rows.parameterTypeNames.indexOf("$component;") == 7 && rows.localRegisterCount > 0)
        rows.addInstructionsWithLabels(0, """
            move-object/from16 v0, p7
            instance-of v0, v0, $component${'$'}ImageBannerComponent;
            if-nez v0, :hide_banner
            move-object/from16 v0, p7
            instance-of v0, v0, $component${'$'}SpecialEventBannerComponent;
            if-eqz v0, :show_slot
            :hide_banner
            return-void
            :show_slot
            nop
        """.trimIndent())
    }
}

package patches.rtl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
private fun guarded(owner: String, signature: String, count: Int, registers: Int, flags: Int) =
    exact(owner, signature).method.also {
        check(it.instructions.size == count && it.implementation!!.registerCount == registers && it.accessFlags == flags) {
            "RTL original ad contract changed: $owner->$signature"
        }
    }

@Suppress("unused")
val hideAds = bytecodePatch(name = "Hide ads", description = "Suppresses native placements, client-side video ads and built-in/Swrve in-app campaigns before display; preserves media, accounts, purchases and manual notification/push services.") {
    dependsOn(originalInput)
    compatibleWith(rtl)
    execute {
        disableCampaigns()
        val common = guarded("Llg;", "a(Lda8;Lce;Lnl/rtl/rtnl/core/model/AdMetaData;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lew4;ZFLkotlin/jvm/functions/Function1;Lu72;II)V", 1112, 73, 0x19)
        val original = common.instructions.toList()
        check(original[764].opcode == Opcode.IF_NEZ && (original[764] as OneRegisterInstruction).registerA == 29 &&
            (original[768] as ReferenceInstruction).reference.toString() == "Lkg;->a(Lqd;)V") {
            "RTL common ad completion branch changed"
        }
        // Use the SDK's actual ad-free failure: height0 + completed=true, then
        // the original GONE fallback view. Do not launch a renderer or demand wait.
        common.replaceInstruction(764, "sget-object v0, Lrc;->a:Lrc;")
        common.replaceInstruction(765, "invoke-virtual {v12, v0}, Lkg;->a(Lqd;)V")
        for (index in 766..768) common.replaceInstruction(index, "nop")

        // The pure ad wrappers otherwise retain remembered250-height/loading.
        guarded("Lgr6;", "a(Llv6;Lce;Lnl/rtl/rtnl/core/model/listitem/AdItemModel;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lew4;Lu72;I)V", 320, 34, 0x19).addInstructions(0, STOP)
        guarded("Lv71;", "a(Lda8;Lnl/rtl/rtnl/core/model/listitem/BrandedContentItem;FLu72;II)V", 210, 27, 0x19).addInstructions(0, STOP)

        val regular = guarded("Ley4;", "d(Lda8;Lcod;Lmod;Lnl/rtl/videoplayer/playerstate/RtlPlayerState;Lnl/rtl/videoplayer/playerstate/PlayerEventListener;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lew4;Lu72;II)V", 667, 75, 0x19)
        check(regular.instructions.toList()[379].opcode == Opcode.IF_EQZ)
        // Select only the existing player AdFree branch. Genuine sa/JWT/Billing
        // state and all token/play/DRM work remain original.
        regular.replaceInstruction(379, "nop")

        val legacy = guarded("Lnl/rtl/videoplayer/rtlxl/config/ContentLoader;", "loadVmapUrl(Ljava/lang/String;Ljava/lang/String;Lnl/rtl/videoplayer/rtlxl/config/Config;Ljava/lang/String;Lui2;)Ljava/lang/Object;", 91, 11, 0x12)
        check(legacy.instructions.toList()[34].opcode == Opcode.IF_NE)
        legacy.replaceInstruction(34, "nop") // Native nullable no-VMAP result.

        val tfk = guarded("Lcom/triple/tfkplayer/exo/TFKExoPlayer;", "d(Ljava/lang/Long;)V", 564, 41, 0x11)
        val tag = tfk.instructions.toList()[100]
        check(tag.opcode == Opcode.IGET_OBJECT && (tag as TwoRegisterInstruction).registerA == 7 && tag.registerB == 2 &&
            (tag as ReferenceInstruction).reference.toString() == "Lxac;->e:Ljava/lang/String;")
        tfk.replaceInstruction(100, "const/4 v7, 0x0") // Both native no-ad paths.
    }
}

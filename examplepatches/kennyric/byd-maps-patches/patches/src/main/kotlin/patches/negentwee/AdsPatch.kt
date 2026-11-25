package patches.negentwee

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

@Suppress("unused")
val hideAds = bytecodePatch(
    name = "Hide ads",
    description = "Uses 9292's native no-ad paths for Google/PubMatic, station ads and post-payment voucher promotions. Stops ad auto-initialization and advertising location publication while preserving journeys, precise location, tickets and payment outcomes.",
) {
    dependsOn(originalInput, fixPairipStartup, adsResources)
    compatibleWith(negentwee)
    execute {
        val policy = exact("Lj0a;", "b(Ljava/lang/String;)Z", 17, 10, 59)
        val first = policy.getInstruction<ReferenceInstruction>(0)
        check(first.opcode == Opcode.IGET_OBJECT && first.reference.toString() == "Lj0a;->a:Lls4;")
        policy.addInstructionsWithLabels(0, """
            const-string v0, "disable_ads_android"
            invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-nez v0, :disabled
            const-string v0, "disable_station_ads"
            invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-nez v0, :disabled
            const-string v0, "sovendus_android"
            invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :native
            const/4 v0, 0x0
            return v0
            :disabled
            const/4 v0, 0x1
            return v0
        """.trimIndent(), ExternalLabel("native", first))

        val location = exact("Lx43;", "a(Lq43;Lez2;)Ljava/lang/Object;", 17, 13, 93)
        val calls = location.instructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.INVOKE_STATIC && (instruction as ReferenceInstruction).reference.toString() ==
                "Lcom/pubmatic/sdk/common/OpenWrapSDK;->setLocation(Lcom/pubmatic/sdk/common/models/POBLocation;)V"
        }.map { it.index }
        check(calls == listOf(79)) { "9292 original advertising location call changed" }
        location.removeInstruction(calls.single())
    }
}

package dev.supperelias2.sbs.qol

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.supperelias2.sbs.morphe.registerFeature
import dev.supperelias2.sbs.morphe.settingsPatch

private fun customizeCountdown(method: MutableMethod, owner: String, consumer: String, argument: (FiveRegisterInstruction) -> Int) {
    val instructions = method.implementation!!.instructions.toList()
    val calls = instructions.withIndex().filter { (_, instruction) ->
        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
            it.definingClass == owner && it.name == consumer
        } == true
    }
    check(calls.size == 1) { "Unexpected SBS countdown $consumer layout" }
    val call = calls.single()
    val valueRegister = argument(call.value as FiveRegisterInstruction)
    val constantIndex = call.index - 1
    val constant = instructions[constantIndex]
    check((constant as? WideLiteralInstruction)?.wideLiteral == 9L &&
        (constant as OneRegisterInstruction).registerA == valueRegister) {
        "Unexpected SBS countdown initial value"
    }
    method.replaceInstruction(constantIndex,
        "invoke-static {}, Ldev/supperelias2/sbs/morphe/features/GeneralHooks;->nextEpisodeCountdown()I")
    method.addInstructions(constantIndex + 1, "move-result v$valueRegister")
}

@Suppress("unused")
val nextEpisodeCountdownPatch = bytecodePatch(
    name = "Experimental: next episode countdown",
    description = "Adds an opt-in next-episode delay preference. Original autoplay, cancel and watch-credits actions are retained.",
    default = true
) {
    category("Experimental")
    compatibleWith(Compatibility(
        name = "SBS On Demand", packageName = "com.sbs.ondemand.android",
        apkFileType = ApkFileType.APKM, appIconColor = 0xDCBD1D,
        targets = listOf(AppTarget(version = "6.4.0", isExperimental = true))
    ))
    dependsOn(settingsPatch)
    execute {
        registerFeature("next_episode_countdown")
        customizeCountdown(Fingerprint(
            definingClass = "Lcom/sbs/ondemand/player/ui/tv/PlaybackEventButtonKt;",
            name = "NextEpisodeLayout", returnType = "V"
        ).method, "Landroidx/compose/runtime/SnapshotIntStateKt;", "mutableIntStateOf") { it.registerC }
        customizeCountdown(Fingerprint(
            definingClass = "Lcom/sbs/ondemand/player/ui/tv/PlaybackEventButtonKt\$NextEpisodeLayout\$1\$1;",
            name = "invokeSuspend", returnType = "Ljava/lang/Object;", parameters = listOf("Ljava/lang/Object;")
        ).method, "Lcom/sbs/ondemand/player/ui/tv/PlaybackEventButtonKt;", "access\$NextEpisodeLayout\$lambda\$16") { it.registerD }
    }
}

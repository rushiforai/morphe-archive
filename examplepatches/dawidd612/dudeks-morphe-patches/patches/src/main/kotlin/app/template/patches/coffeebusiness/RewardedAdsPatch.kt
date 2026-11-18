package app.template.patches.coffeebusiness

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.replaceBody
import com.android.tools.smali.dexlib2.Opcode

private const val REWARD = "Lcom/ironsource/unity/androidbridge/RewardedAd;"
private const val LOCAL = "Lcom/ironsource/unity/androidbridge/CoffeeRewardedBridge;"
private const val LISTENER = "Lcom/ironsource/unity/androidbridge/IUnityRewardedAdListener;"
private const val SDK = "Lcom/unity3d/mediation/rewarded/LevelPlayRewardedAd;"

@Suppress("unused")
val coffeeRewardedAdsPatch = bytecodePatch(
    name = "Skip rewarded ads",
    description = "Completes the requested rewarded-video flow locally using the game's callbacks.",
    default = true,
) {
    compatibleWith(CoffeeProfiles.compatibility)
    dependsOn(coffeeStartupSupport)
    execute {
        val constructor = coffeeMethod(REWARD, "<init>", listOf(STRING,
            "Lcom/unity3d/mediation/rewarded/LevelPlayRewardedAd\$Config;", LISTENER), "V", false)
        val load = coffeeMethod(REWARD, "loadAd", emptyList(), "V", false)
        val show = coffeeMethod(REWARD, "showAd", listOf(STRING), "V", false)
        val ready = coffeeMethod(REWARD, "isAdReady", emptyList(), "Z", false)
        checkCoffee(constructor.calls(REWARD, "setupRewardedListener") &&
            constructor.instructions.last().opcode == Opcode.RETURN_VOID &&
            load.calls(SDK, "loadAd") && show.calls(SDK, "showAd") && ready.calls(SDK, "isAdReady"),
            "rewarded bridge changed or already patched")
        constructor.addInstructions(constructor.instructions.count() - 1,
            "invoke-static {p0, p1, p3}, $LOCAL->register(Ljava/lang/Object;$STRING$LISTENER)V")
        load.replaceBody("invoke-static {p0}, $LOCAL->load(Ljava/lang/Object;)V\nreturn-void")
        show.replaceBody("invoke-static {p0, p1}, $LOCAL->show(Ljava/lang/Object;$STRING)V\nreturn-void")
        ready.replaceBody("invoke-static {p0}, $LOCAL->ready(Ljava/lang/Object;)Z\nmove-result p0\nreturn p0")
    }
}

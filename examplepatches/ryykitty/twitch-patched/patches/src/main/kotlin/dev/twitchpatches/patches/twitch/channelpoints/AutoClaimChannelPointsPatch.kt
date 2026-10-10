package dev.twitchpatches.patches.twitch.channelpoints

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import dev.twitchpatches.patches.twitch.shared.TwitchTarget
import dev.twitchpatches.patches.twitch.shared.reference
import dev.twitchpatches.patches.twitch.settings.settingsPatch
import dev.twitchpatches.patches.twitch.shared.reactNativeBridgePatch

@Suppress("unused")
val autoClaimChannelPointsPatch = bytecodePatch(
    name = "Auto-claim bonus channel points",
    description = "Automatically claims bonus channel points while watching live streams.",
    default = true,
) {
    compatibleWith(TwitchTarget.compatibility)
    dependsOn(settingsPatch, reactNativeBridgePatch, reactNativePointsPatch)
    execute {
        val points = resolvePointsHooks()
        val player = resolvePlayerHooks()
        val ui = resolveUiHooks()
        val claimBridge = pointsBridge(points)
        val configureBridge = playerConfigurationBridge(player)
        val stateBridge = playerStateBridge(player)
        mutableClassDefBy(points.update.definingClass).methods.single { it.reference == points.update.reference }
            .addInstruction(points.updateIndex + 1,
                "invoke-static {v${points.providerRegister}, v${points.modelRegister}}, $claimBridge")
        mutableClassDefBy(player.player.type).methods.single { it.reference == player.configure.reference }
            .addInstruction(0, "invoke-static/range {p0 .. p2}, $configureBridge")
        mutableClassDefBy(player.player.type).methods.single { it.reference == player.state.reference }
            .addInstruction(0, "invoke-static/range {p0 .. p1}, $stateBridge")
        mutableClassDefBy(player.player.type).methods.single { it.reference == player.release.reference }
            .addInstruction(0, "invoke-static/range {p0 .. p0}, $RUNTIME->release(Ljava/lang/Object;)V")
        applyUiHooks(ui)
    }
}

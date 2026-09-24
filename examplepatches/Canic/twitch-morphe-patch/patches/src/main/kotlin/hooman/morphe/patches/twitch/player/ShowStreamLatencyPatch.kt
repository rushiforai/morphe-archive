package hooman.morphe.patches.twitch.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION = "Lapp/morphe/extension/twitch/player/PlayerLatencyPatch;"

@Suppress("unused")
val showStreamLatencyPatch = bytecodePatch(
    name = "Show stream latency",
    description = "Shows the current live-stream latency in the player. Tap the badge to seek back to the live edge.",
) {
    compatibleWith(
        Compatibility(
            name = "Twitch",
            packageName = "tv.twitch.android.app",
            appIconColor = 0x9147FF,
            targets = listOf(AppTarget("30.5.0")),
        ),
    )

    extendWith("extensions/twitch.mpe")

    execute {
        val playerConstructor = IvsPlayerWrapperConstructorFingerprint.method
        playerConstructor.addInstructions(
            playerConstructor.implementation!!.instructions.lastIndex,
            """
                move-object/from16 v0, p0
                iget-object v1, v0, Lgq9;->t:Lcom/amazonaws/ivs/player/MediaPlayer;
                invoke-static { v0, v1 }, $EXTENSION->registerPlayer(Ljava/lang/Object;Ljava/lang/Object;)V
            """,
        )

        val viewConstructor = MainPlayerViewDelegateConstructorFingerprint.method
        viewConstructor.addInstructions(
            viewConstructor.implementation!!.instructions.lastIndex,
            """
                iget-object v0, p0, Ltv/twitch/android/core/mvp/viewdelegate/BaseViewDelegate;->b:Landroid/view/View;
                invoke-static { v0 }, $EXTENSION->attachBadge(Ljava/lang/Object;)V
            """,
        )
    }
}

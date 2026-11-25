package app.aapam.patches.sonyliv.player.upnext

import app.aapam.patches.sonyliv.shared.Constants.COMPATIBILITY_SONYLIV
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch

private const val NEXT_EPISODE_UI_CLASS =
    "Lcom/sonyliv/mediaplayer/player/playerrevamp/SLNextEpisodeUI;"
private const val BINDING_CLASS =
    "Lcom/sonyliv/databinding/LogixTvPlaybackNextEpisodeBinding;"

@Suppress("unused")
val autoSkipUpNextPatch = bytecodePatch(
    name = "Auto-skip Up Next",
    description = "Plays the next episode immediately when the \"Up Next\" card appears, " +
        "skipping the auto-play countdown.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SONYLIV)

    execute {
        // 6.23.1 support: invoke next-episode button onClick on visibility change
        UpdateNextEpisodeVisibilityFingerprint.methodOrNull?.let { method ->
            method.addInstructionsWithLabels(
                0,
                """
                    if-eqz p1, :original
                    iget-object v0, p0, $NEXT_EPISODE_UI_CLASS->nextEpisodeBinding:$BINDING_CLASS
                    if-eqz v0, :original
                    iget-object v1, v0, $BINDING_CLASS->nextEpisodeBtn:Landroid/widget/LinearLayout;
                    iget-object v2, p0, $NEXT_EPISODE_UI_CLASS->clickListener:Landroid/view/View${'$'}OnClickListener;
                    invoke-interface { v2, v1 }, Landroid/view/View${'$'}OnClickListener;->onClick(Landroid/view/View;)V
                    return-void
                    :original
                    nop
                """,
            )
        }

        // 6.29.11+ support: fire CountDownTimer onFinish() immediately upon timer start
        StartClockwiseTimerFingerprint.methodOrNull?.let { method ->
            val classDef = StartClockwiseTimerFingerprint.classDef
            val timerField = classDef.fields.first { it.type.startsWith("La10/") || it.type.contains("Timer") }
            val timerFieldRef = "${classDef.type}->${timerField.name}:${timerField.type}"

            method.addInstructionsWithLabels(
                0,
                """
                    iget-object v0, p0, $timerFieldRef
                    if-eqz v0, :original
                    invoke-virtual { v0 }, Landroid/os/CountDownTimer;->onFinish()V
                    return-void
                    :original
                    nop
                """,
            )
        }
    }
}

package io.github.jordanwoodson.patches.kick.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import io.github.jordanwoodson.patches.kick.settings.kickMatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

private const val KEY = "refresh_stream"
private const val RELOAD = "lurkReload"

@Suppress("unused")
val refreshStreamPatch = bytecodePatch(
    name = "Refresh stream",
    description = "Long-press the video to reload a stuck stream from the address Kick gave the player; a video " +
        "picks up where it was. On by default. Turn it off in Lurk settings > Playback.",
) {
    compatibleWith(COMPATIBILITY_KICK)
    // The long press is read in MainActivity's dispatchTouchEvent (kickPlayerTouchPatch), on Kick's player view.
    dependsOn(kickPlayerTouchPatch)

    execute {
        // Kick's player keeps the source React Native last loaded (its committed source) and loads a new one through
        // prepare(), with the source set as its uncommitted one, which builds the Media3 source with Kick's own data
        // source, headers and live configuration. Loading the committed source again is the reload. The getter is
        // private, so the patch gives the player a method that does it.
        val prepare = PlayerPrepareFingerprint.kickMatch("player prepare").method
        val player = mutableClassDefBy(prepare.definingClass)
        fun has(name: String, returnType: String, parameters: List<String>) = player.methods.any {
            it.name == name && it.returnType == returnType && it.parameterTypes.map(Any::toString) == parameters
        }
        if (!has("getCommitedSource", VIDEO_SOURCE, emptyList()) || !has("setUncommittedSource", "V", listOf(VIDEO_SOURCE))) {
            throw PatchException("Kick: the player no longer keeps a committed and an uncommitted source")
        }
        if (player.methods.any { it.name == RELOAD }) throw PatchException("Kick: the player already has $RELOAD")
        // v0, then this (v1).
        player.methods.add(
            ImmutableMethod(
                player.type, RELOAD, emptyList(), "Z", AccessFlags.PUBLIC.value, null, null,
                MutableMethodImplementation(2),
            ).toMutable().apply {
                addInstructionsWithLabels(0, """
                    invoke-direct { p0 }, $VIDEO_PLAYER->getCommitedSource()$VIDEO_SOURCE
                    move-result-object v0
                    if-eqz v0, :none
                    invoke-virtual { p0, v0 }, $VIDEO_PLAYER->setUncommittedSource($VIDEO_SOURCE)V
                    invoke-virtual { p0 }, $VIDEO_PLAYER->prepare()V
                    const/4 v0, 0x1
                    return v0
                    :none
                    const/4 v0, 0x0
                    return v0
                """)
            },
        )
        Locators.record("kick.refresh_stream.prepare", prepare)

        // The view's player, then its ExoPlayer (Media3 keeps its names): a video's duration, unless it's live; the
        // position; a seek. Media3 reports C.TIME_UNSET for a duration it doesn't know, which KickTouch treats as live.
        bridge(KICK_TOUCH, "reload", """
            check-cast p0, $PLAYER_VIEW
            invoke-virtual { p0 }, $PLAYER_VIEW->getVideoPlayer()$VIDEO_PLAYER
            move-result-object v0
            if-eqz v0, :none
            invoke-virtual { v0 }, $VIDEO_PLAYER->$RELOAD()Z
            move-result v0
            return v0
            :none
            const/4 v0, 0x0
            return v0
        """, locals = 1)
        bridge(KICK_TOUCH, "duration", """
            check-cast p0, $PLAYER_VIEW
            invoke-virtual { p0 }, $PLAYER_VIEW->getVideoPlayer()$VIDEO_PLAYER
            move-result-object v0
            if-eqz v0, :none
            invoke-virtual { v0 }, $VIDEO_PLAYER->getPlayer()$EXO_PLAYER
            move-result-object v0
            invoke-interface { v0 }, $MEDIA3_PLAYER->isCurrentMediaItemLive()Z
            move-result v1
            if-nez v1, :none
            invoke-interface { v0 }, $MEDIA3_PLAYER->getDuration()J
            move-result-wide v0
            invoke-static { v0, v1 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
            move-result-object v0
            return-object v0
            :none
            const/4 v0, 0x0
            return-object v0
        """, locals = 2)
        bridge(KICK_TOUCH, "position", """
            check-cast p0, $PLAYER_VIEW
            invoke-virtual { p0 }, $PLAYER_VIEW->getVideoPlayer()$VIDEO_PLAYER
            move-result-object v0
            if-eqz v0, :none
            invoke-virtual { v0 }, $VIDEO_PLAYER->getPlayer()$EXO_PLAYER
            move-result-object v0
            invoke-interface { v0 }, $MEDIA3_PLAYER->getCurrentPosition()J
            move-result-wide v0
            const-wide/16 v2, 0x3e8
            div-long/2addr v0, v2
            long-to-int v0, v0
            return v0
            :none
            const/4 v0, 0x0
            return v0
        """, locals = 4)
        bridge(KICK_TOUCH, "seek", """
            check-cast p0, $PLAYER_VIEW
            invoke-virtual { p0 }, $PLAYER_VIEW->getVideoPlayer()$VIDEO_PLAYER
            move-result-object v0
            if-eqz v0, :none
            invoke-virtual { v0 }, $VIDEO_PLAYER->getPlayer()$EXO_PLAYER
            move-result-object v0
            const-wide v2, 0x408f400000000000L    # 1000.0
            mul-double/2addr v2, p1
            double-to-long v2, v2
            invoke-interface { v0, v2, v3 }, $MEDIA3_PLAYER->seekTo(J)V
            :none
            return-void
        """, locals = 4)

        kickSettings.add(
            SwitchSetting(
                KEY,
                "Refresh stream",
                "Long-press the video to reload a stuck stream; a video picks up where it was.",
                Section.PLAYBACK,
                default = true,
            ),
        )
    }
}

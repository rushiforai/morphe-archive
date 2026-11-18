package io.github.jordanwoodson.patches.kick.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import io.github.jordanwoodson.patches.kick.settings.kickMatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.settings.kickSettingsPatch
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.settings.ChoiceSetting
import io.github.jordanwoodson.patches.shared.settings.Section

@Suppress("unused")
val sleepTimerPatch = bytecodePatch(
    name = "Sleep timer",
    description = "Pauses playback a chosen time after it last started or resumed, including background audio. " +
        "Starts off. Choose a time in Lurk settings > Playback.",
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickSettingsPatch)

    execute {
        // Every start or resume of a player, from React Native, the media notification or a headset, sets its
        // ExoPlayer's playWhenReady, and a pause clears it; Media3 tells the player's listener. Kick's listener keeps
        // Player.Listener's empty onPlayWhenReadyChanged: the patch adds one that hands the player to KickPlayer.
        // Buffering doesn't change playWhenReady, so a stream that stalls doesn't restart the timer.
        val (listenerType, player) = playerListener()
        val listener = mutableClassDefBy(listenerType)
        if (classDefBy(MEDIA3_LISTENER).methods.none { it.name == "onPlayWhenReadyChanged" &&
                it.parameterTypes.map(Any::toString) == listOf("Z", "I") }) {
            throw PatchException("Kick: Media3's Player.Listener has no onPlayWhenReadyChanged(boolean, int)")
        }
        if (listener.methods.any { it.name == "onPlayWhenReadyChanged" }) {
            throw PatchException("Kick: the player's listener now handles onPlayWhenReadyChanged itself")
        }
        // v0, then this (v1), playWhenReady (v2) and the reason (v3).
        listener.methods.add(
            ImmutableMethod(
                listenerType, "onPlayWhenReadyChanged",
                listOf(ImmutableMethodParameter("Z", null, null), ImmutableMethodParameter("I", null, null)), "V",
                AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(4),
            ).toMutable().apply {
                addInstructions(0, """
                    iget-object v0, p0, $player
                    invoke-static { v0, p1 }, $KICK_PLAYER->onPlayWhenReady(Ljava/lang/Object;Z)V
                    return-void
                """)
            },
        )
        Locators.record("kick.sleep_timer.player_listener", listenerType)

        // A released player is done.
        PlayerCloseFingerprint.kickMatch("player close").method.apply {
            addInstructions(0, invokeStatic("$KICK_PLAYER->onStop(Ljava/lang/Object;)V", parameterRegister(0)))
        }

        // The timer pauses each started player the way Kick's own pause does (its ExoPlayer's pause(), on the main
        // thread), so the controls, the media notification and the background service follow.
        bridge(KICK_PLAYER, "pausePlayer", """
            check-cast p0, $VIDEO_PLAYER
            invoke-virtual { p0 }, $VIDEO_PLAYER->getPlayer()$EXO_PLAYER
            move-result-object p0
            invoke-interface { p0 }, $EXO_PLAYER->pause()V
            const/4 p0, 0x1
            return p0
        """)

        kickSettings.add(
            ChoiceSetting(
                "sleep_timer",
                "Sleep timer",
                "Pauses playback this long after it last started or resumed, including background audio.",
                Section.PLAYBACK,
                "0",
                listOf(
                    "Off" to "0", "15 minutes" to "15", "30 minutes" to "30", "45 minutes" to "45",
                    "1 hour" to "60", "1.5 hours" to "90", "2 hours" to "120",
                ),
            ),
        )
    }
}

package io.github.jordanwoodson.patches.kick.player

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.jordanwoodson.patches.kick.settings.kickMatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

private const val KEY = "refresh_stream"

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
        // Kick's player view keeps the address React Native last gave it (streamUri) and loads one through
        // setStreamUrl, which also resets the view's per-stream state and tells React Native a load started.
        // Loading the same address again is the reload: the IVS playback token in it isn't required for Kick's
        // channels. lastDuration and lastPositionInSeconds are what the view last read from the IVS player.
        val setStreamUrl = PlayerViewSetStreamUrlFingerprint.kickMatch("player view setStreamUrl").method
        val seekTo = PlayerViewSeekFingerprint.kickMatch("player view seekTo").method
        val view = mutableClassDefBy(PLAYER_VIEW)
        // The fields are private; the bridges read them from KickTouch, so they become public.
        fun field(name: String, type: String) = view.fields.singleOrNull { it.name == name && it.type == type }
            ?.apply { setAccessFlags((accessFlags and AccessFlags.PRIVATE.value.inv()) or AccessFlags.PUBLIC.value) }
            ?.let { "$PLAYER_VIEW->$name:$type" }
            ?: throw PatchException("Kick: the player view has no $name ($type)")
        val streamUri = field("streamUri", "Landroid/net/Uri;")
        val duration = field("lastDuration", "Ljava/lang/Long;")
        val position = field("lastPositionInSeconds", "I")
        Locators.record("kick.refresh_stream.set_stream_url", setStreamUrl)
        Locators.record("kick.refresh_stream.seek_to", seekTo)

        bridge(KICK_TOUCH, "reload", """
            check-cast p0, $PLAYER_VIEW
            iget-object v0, p0, $streamUri
            if-eqz v0, :none
            invoke-virtual { v0 }, Landroid/net/Uri;->toString()Ljava/lang/String;
            move-result-object v0
            invoke-virtual { p0, v0 }, $setStreamUrl
            const/4 v0, 0x1
            return v0
            :none
            const/4 v0, 0x0
            return v0
        """, locals = 1)
        bridge(KICK_TOUCH, "duration", """
            check-cast p0, $PLAYER_VIEW
            iget-object v0, p0, $duration
            return-object v0
        """, locals = 1)
        bridge(KICK_TOUCH, "position", """
            check-cast p0, $PLAYER_VIEW
            iget v0, p0, $position
            return v0
        """, locals = 1)
        bridge(KICK_TOUCH, "seek", """
            check-cast p0, $PLAYER_VIEW
            invoke-virtual { p0, p1, p2 }, $seekTo
            return-void
        """)

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

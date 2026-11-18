package io.github.jordanwoodson.patches.kick.playback

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import io.github.jordanwoodson.patches.kick.player.ApplyPipParamsFingerprint
import io.github.jordanwoodson.patches.kick.player.KICK_PLAYER
import io.github.jordanwoodson.patches.kick.player.PlayerViewSetAutoEnterPipFingerprint
import io.github.jordanwoodson.patches.kick.player.StaysActiveInBackgroundFingerprint
import io.github.jordanwoodson.patches.kick.settings.kickMatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.settings.kickSettingsPatch
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

@Suppress("unused")
val backgroundAudioPatch = bytecodePatch(
    name = "Background audio",
    description = "Keeps live streams and videos playing as audio when you leave Kick, using Kick's own audio " +
        "notification. A second switch turns off the automatic picture-in-picture window. On by default, as on " +
        "Twitch. Turn it off in Lurk settings > Playback.",
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickSettingsPatch)

    execute {
        // Kick's player keeps playing in the background, with its media notification and playback service, while its
        // staysActiveInBackground is set; Kick sets it for its main player. Both places that pause players when Kick
        // goes to the background (the video manager and the picture-in-picture manager) read it through this getter,
        // so the switch decides there: on, Kick's value; off, the player pauses when you leave, unless it goes into
        // picture-in-picture.
        StaysActiveInBackgroundFingerprint.kickMatch("player staysActiveInBackground").method.apply {
            val read = getInstruction(0)
            val field = ((read as? ReferenceInstruction)?.reference)?.toString()
            if (read.opcode != Opcode.IGET_BOOLEAN || field?.endsWith("->staysActiveInBackground:Z") != true ||
                getInstruction(1).opcode != Opcode.RETURN) {
                throw PatchException("Kick: staysActiveInBackground is no longer a plain getter")
            }
            val value = (read as TwoRegisterInstruction).registerA
            addInstructions(1, """
                ${invokeStatic("$KICK_PLAYER->staysActive(Z)Z", value)}
                move-result v$value
            """)
        }

        // Kick lets the system enter picture-in-picture on its own when you leave (auto-enter in the activity's
        // picture-in-picture parameters, Android 12 and later, which Kick requires), for a player view whose
        // startsPictureInPictureAutomatically React Native sets. Both places that pause players on leaving leave such a
        // view playing, expecting the window. So the switch goes in at both: the view's own flag (for players opened
        // afterwards) and the activity's parameters. Kick's own picture-in-picture button enters it directly and keeps
        // working.
        listOf(
            PlayerViewSetAutoEnterPipFingerprint to "player view setAutoEnterPiP",
            ApplyPipParamsFingerprint to "player picture-in-picture parameters",
        ).forEach { (fingerprint, what) ->
            fingerprint.kickMatch(what).method.apply {
                addInstructions(0, """
                    ${invokeStatic("$KICK_PLAYER->autoEnterPip(Z)Z", parameterRegister(1))}
                    move-result p1
                """)
            }
        }

        kickSettings.add(
            SwitchSetting(
                "background_audio",
                "Background audio",
                "Keep playing as audio when you leave Kick.",
                Section.PLAYBACK,
            ),
            SwitchSetting(
                "no_auto_pip",
                "No automatic picture-in-picture",
                "Don't open the floating video when you leave Kick while watching.",
                Section.PLAYBACK,
                default = false,
            ),
        )
    }
}

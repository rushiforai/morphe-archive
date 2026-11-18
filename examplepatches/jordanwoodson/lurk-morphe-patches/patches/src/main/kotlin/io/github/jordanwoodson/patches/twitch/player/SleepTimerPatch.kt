package io.github.jordanwoodson.patches.twitch.player

import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.jordanwoodson.patches.shared.ivs.IvsPauseFingerprint
import io.github.jordanwoodson.patches.shared.ivs.IvsPlayFingerprint
import io.github.jordanwoodson.patches.shared.ivs.IvsReleaseFingerprint
import io.github.jordanwoodson.patches.shared.settings.ChoiceSetting
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.requireLocals
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.twitch.chat.fieldRef
import io.github.jordanwoodson.patches.twitch.chat.methodRef
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val STREAM_SETTINGS = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchStreamSettings;"

@Suppress("unused")
val sleepTimerPatch = bytecodePatch(
    name = "Sleep timer",
    description = "Pauses playback a chosen time after it last started or resumed, through Twitch's own pause " +
        "for native, portal and React Native players, and says so in a short notice. Choose the time in Lurk " +
        "settings or in the player's settings sheet (the gear), which gets a Sleep timer row under Background " +
        "audio; it is off until then.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)
    execute {
        // Every start or resume, native or React Native, reaches IVS play(); pause() and release() end it.
        IvsPlayFingerprint.twitchMatch("IVS play").method.apply {
            addInstructions(0, invokeStatic("$PLAYER->onPlay(Ljava/lang/Object;)V", parameterRegister(0)))
        }
        listOf(IvsPauseFingerprint to "IVS pause", IvsReleaseFingerprint to "IVS release").forEach { (fingerprint, what) ->
            fingerprint.twitchMatch(what).method.apply {
                addInstructions(0, invokeStatic("$PLAYER->onStop(Ljava/lang/Object;)V", parameterRegister(0)))
            }
        }

        // Twitch's ExoPlayer 2 backend (Force ExoPlayer) never reaches IVS: its own start() arms the timer,
        // pause() and stop() end it (issue 70). pause() is public, which the timer's last resort relies on.
        val exoPlayer = mutableClassDefBy(ExoPlayerTeardownFingerprint.twitchMatch("ExoPlayer teardown").classDef.type)
        Locators.record("twitch.sleep_timer.exo_player", exoPlayer.type)
        listOf("start" to "onPlay", "pause" to "onStop", "stop" to "onStop").forEach { (name, hook) ->
            val method = exoPlayer.methods.singleOrNull {
                it.name == name && it.parameterTypes.isEmpty() && it.returnType == "V" &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags)
            } ?: throw PatchException("Twitch: the ExoPlayer player has no public $name()")
            method.apply {
                addInstructions(0, invokeStatic("$PLAYER->$hook(Ljava/lang/Object;)V", parameterRegister(0)))
            }
        }

        // Twitch pauses every player before a Guest Star call through a registry each player presenter joins in its
        // constructor: it adds itself to the registry's set (the registry's add method is inlined since 32.1.0).
        // The set holds an interface whose only method pauses. The registry's constructor hands its set over.
        val presenter = playerPresenterClass()
        val constructor = presenter.methods.singleOrNull { it.name == "<init>" }
            ?: throw PatchException("Twitch: player presenter has more than one constructor")
        val registryType = constructor.parameterTypes.firstOrNull()?.toString()
            ?: throw PatchException("Twitch: player presenter constructor changed")
        val registry = mutableClassDefBy(registryType)
        val players = registry.fields.singleOrNull { it.type == "Ljava/util/Set;" }
            ?: throw PatchException("Twitch: the pause registry no longer holds a set")
        val joins = constructor.implementation!!.instructions.toList().let { code ->
            code.any { it.opcode == Opcode.IGET_OBJECT && it.fieldRef?.let { field ->
                field.definingClass == registryType && field.name == players.name } == true } &&
                code.any { it.opcode == Opcode.INVOKE_INTERFACE && it.methodRef?.let { method ->
                    method.definingClass == "Ljava/util/Set;" && method.name == "add" } == true }
        }
        if (!joins) throw PatchException("Twitch: player presenters no longer join the pause registry")
        val pausable = presenter.interfaces.mapNotNull { classDefByOrNull(it) }.singleOrNull { type ->
            AccessFlags.INTERFACE.isSet(type.accessFlags) && type.methods.singleOrNull()?.let { method ->
                method.parameterTypes.isEmpty() && method.returnType == "V"
            } == true
        } ?: throw PatchException("Twitch: the pause registry's player interface changed")
        val pause = pausable.methods.single()
        Locators.record("twitch.sleep_timer.pause_registry", "$registryType->${players.name}:${players.type}")
        registry.methods.singleOrNull { it.name == "<init>" }?.apply {
            val code = implementation!!.instructions.toList()
            val end = code.indices.singleOrNull { code[it].opcode == Opcode.RETURN_VOID }
                ?: throw PatchException("Twitch: the pause registry constructor doesn't return once")
            // v0 is a local, dead at the return.
            requireLocals(1)
            addInstructions(end, """
                move-object/from16 v0, p0
                iget-object v0, v0, $registryType->${players.name}:${players.type}
                ${invokeStatic("$PLAYER->pauseRegistry(Ljava/util/Set;)V", 0)}
            """)
        } ?: throw PatchException("Twitch: the pause registry has more than one constructor")
        bridge("pauseRegisteredPlayer", """
            check-cast p0, ${pausable.type}
            invoke-interface { p0 }, $pause
        """)

        // The player's settings sheet (the gear) gets a Sleep timer row after Background audio, so the time can
        // be changed without leaving the stream (issue 52). The sheet's view holder looks its rows up in its
        // constructor; the row is added once that is done, with the sheet (p2, untouched until the end).
        StreamSettingsViewFingerprint.twitchMatch("stream settings sheet").let { match ->
            Locators.record("twitch.sleep_timer.stream_settings_view", match.classDef.type)
            match.method.apply {
                val code = implementation!!.instructions.toList()
                val end = code.indices.filter { code[it].opcode == Opcode.RETURN_VOID }.singleOrNull()
                    ?: throw PatchException("Twitch: the stream settings sheet constructor doesn't return once")
                val sheet = parameterRegister(2)
                requireUnwritten(sheet, end, "the stream settings sheet view")
                addInstructions(end, invokeStatic("$STREAM_SETTINGS->sleepTimerRow(Landroid/view/View;)V", sheet))
            }
        }

        twitchSettings.add(ChoiceSetting("sleep_timer", "Sleep timer",
            "Pauses playback this long after it last started or resumed, including background audio. Also " +
                "in the player's settings sheet (the gear).",
            Section.PLAYBACK, "0", listOf("Off" to "0", "15 minutes" to "15",
                "30 minutes" to "30", "45 minutes" to "45", "1 hour" to "60", "1.5 hours" to "90",
                "2 hours" to "120")))
    }
}

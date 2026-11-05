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

        // Twitch pauses every player before a Guest Star call through a registry each player presenter
        // joins in its constructor: registry.add(this) with an interface whose only method pauses.
        val presenter = playerPresenterClass()
        val constructor = presenter.methods.singleOrNull { it.name == "<init>" }
            ?: throw PatchException("Twitch: player presenter has more than one constructor")
        val registryType = constructor.parameterTypes.firstOrNull()?.toString()
            ?: throw PatchException("Twitch: player presenter constructor changed")
        val add = constructor.implementation!!.instructions
            .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
            .mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
            .filter { reference ->
                reference.definingClass == registryType && reference.returnType == "V" &&
                    reference.parameterTypes.size == 1 && reference.parameterTypes[0].toString() in presenter.interfaces
            }.distinct().singleOrNull() ?: throw PatchException("Twitch: player presenters no longer join the pause registry")
        val pausable = classDefBy(add.parameterTypes[0].toString())
        val pause = pausable.methods.singleOrNull()
        if (!AccessFlags.INTERFACE.isSet(pausable.accessFlags) || pause == null ||
            pause.parameterTypes.isNotEmpty() || pause.returnType != "V") {
            throw PatchException("Twitch: the pause registry's player interface changed")
        }
        val registry = mutableClassDefBy(registryType)
        val players = registry.fields.singleOrNull { it.type == "Ljava/util/Set;" }
            ?: throw PatchException("Twitch: the pause registry no longer holds a set")
        registry.methods.single { method ->
            method.name == add.name && method.parameterTypes.map { it.toString() } == listOf(pausable.type)
        }.apply {
            // v0 is a local, so it holds nothing at the start.
            requireLocals(1)
            addInstructions(0, """
                move-object/from16 v0, p0
                iget-object v0, v0, $players
                ${invokeStatic("$PLAYER->pauseRegistry(Ljava/util/Set;)V", 0)}
            """)
        }
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

package io.github.jordanwoodson.patches.rumble.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import io.github.jordanwoodson.patches.rumble.playback.QualitySwitchFingerprint
import io.github.jordanwoodson.patches.rumble.settings.rumbleSettings
import io.github.jordanwoodson.patches.rumble.settings.settingsPatch
import io.github.jordanwoodson.patches.rumble.shared.Constants.COMPATIBILITY_RUMBLE
import io.github.jordanwoodson.patches.rumble.shared.RUMBLE
import io.github.jordanwoodson.patches.rumble.shared.RUMBLE_REMOTE
import io.github.jordanwoodson.patches.rumble.shared.enumWith
import io.github.jordanwoodson.patches.rumble.shared.requireNoBranchTo
import io.github.jordanwoodson.patches.rumble.shared.single
import io.github.jordanwoodson.patches.rumble.shared.singleMethod
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.shared.compose.constStrings
import io.github.jordanwoodson.patches.shared.compose.parameters
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegisters
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

private const val KEY = "remote_keys"
private const val MAIN_ACTIVITY = "Lcom/rumble/battles/landing/RumbleMainActivity;"
private const val KEY_EVENT = "Landroid/view/KeyEvent;"
private const val FRAME = "Landroidx/media3/ui/AspectRatioFrameLayout;"
private const val EXO_PLAYER = "Landroidx/media3/exoplayer/ExoPlayer;"

// The keys of Rumble's TV handler whose branches name the player's methods (see TvRemoteKeysFingerprint).
private const val MEDIA_PLAY = 126
private const val MEDIA_PAUSE = 127
private const val MEDIA_PLAY_PAUSE = 85
private const val MEDIA_FAST_FORWARD = 90
private const val MEDIA_REWIND = 89
private val MEDIA_KEYS = setOf(MEDIA_PLAY, MEDIA_PAUSE, MEDIA_PLAY_PAUSE, MEDIA_FAST_FORWARD, MEDIA_REWIND)

@Suppress("unused")
val remoteControlPatch = bytecodePatch(
    name = "Remote control",
    description = "Lets a TV remote, gamepad or keyboard control the video player: OK, Enter or Space plays and " +
        "pauses, left and right skip back and forward, media keys work, and Back leaves the player. On by " +
        "default. Turn it off in Lurk settings > Playback.",
) {
    compatibleWith(COMPATIBILITY_RUMBLE)
    dependsOn(settingsPatch)

    execute {
        val player = QualitySwitchFingerprint.single("player quality switch").classDef

        // Rumble's TV player answers the remote in one handler; each media key's branch calls the player's own
        // method for it. The patch takes the first call of each shape in each branch (up to its return).
        val handler = TvRemoteKeysFingerprint.single("TV remote key handler").method
        val calls = mutableMapOf<Pair<Int, String>, MethodReference>()
        var key: Int? = null
        handler.implementation!!.instructions.forEach { instruction ->
            val literal = (instruction as? NarrowLiteralInstruction)?.narrowLiteral
            when {
                literal != null && literal in MEDIA_KEYS -> key = literal
                instruction.opcode == Opcode.RETURN -> key = null
                instruction.opcode == Opcode.INVOKE_VIRTUAL -> {
                    val call = (instruction as ReferenceInstruction).reference as MethodReference
                    val branch = key
                    if (branch != null && call.definingClass == player.type) {
                        calls.putIfAbsent(branch to "(${call.parameterTypes.joinToString("")})${call.returnType}", call)
                    }
                }
            }
        }
        fun call(branch: Int, shape: String, what: String) =
            calls[branch to shape] ?: throw PatchException("Rumble: the TV key handler's $branch branch has no $what call")
        val play = call(MEDIA_PLAY, "()V", "play")
        val pause = call(MEDIA_PAUSE, "()V", "pause")
        val isPlaying = call(MEDIA_PLAY_PAUSE, "()Z", "is playing")
        val canSeek = call(MEDIA_FAST_FORWARD, "()Z", "can seek")
        val seekForward = call(MEDIA_FAST_FORWARD, "(I)V", "seek forward")
        val seekBack = call(MEDIA_REWIND, "(I)V", "seek back")
        if (play == pause || seekForward == seekBack || call(MEDIA_REWIND, "()Z", "can seek") != canSeek) {
            throw PatchException("Rumble: the TV key handler's branches no longer match play, pause and seek")
        }

        // The player's screen type (feed, video page, full screen, mini player), set through one setter whose
        // null check names its parameter.
        val screenType = enumWith("EMBEDDED", "FULL_SCREEN_LANDSCAPE", "FULL_SCREEN_PORTRAIT", "MINIMIZED").type
        val typeSetter = player.singleMethod("player screen type setter") {
            it.parameters() == listOf(screenType) && it.returnType == "V" && "type" in it.constStrings()
        }
        typeSetter.requireNoBranchTo(0, "the start of the player's screen type setter")
        typeSetter.addInstructions(
            0,
            invokeStatic("$RUMBLE_REMOTE->onPlayerType(Ljava/lang/Object;Ljava/lang/Object;)V", *typeSetter.parameterRegisters().toIntArray()),
        )

        // The video on screen is a Media3 PlayerView (a FrameLayout around the video frame, the type of one of the
        // player's fields) showing one of the player's ExoPlayers (content and ads, each with a public getter).
        val playerViews = player.fields.map { it.type }.distinct().filter { type ->
            classDefByOrNull(type)?.let { it.superclass == "Landroid/widget/FrameLayout;" && it.fields.any { field -> field.type == FRAME } } == true
        }
        val playerView = playerViews.singleOrNull()
            ?: throw PatchException("Rumble: expected one Media3 player view in the player, found ${playerViews.size}")
        val media3Player = classDefBy(EXO_PLAYER).interfaces.singleOrNull()
            ?: throw PatchException("Rumble: ExoPlayer doesn't extend exactly one interface")
        val viewPlayer = classDefBy(playerView).methods.singleOrNull {
            AccessFlags.PUBLIC.isSet(it.accessFlags) && it.parameterTypes.isEmpty() && it.returnType == media3Player
        } ?: throw PatchException("Rumble: the player view has no unique player getter")
        val exoPlayers = player.methods.filter {
            AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.parameterTypes.isEmpty() && it.returnType == EXO_PLAYER
        }
        if (exoPlayers.isEmpty()) throw PatchException("Rumble: the player has no ExoPlayer getter")

        // The extension calls them through bridged stubs, so they must stay public.
        fun ref(method: MethodReference): String {
            val parameters = method.parameterTypes.map(CharSequence::toString)
            val target = player.methods.single {
                it.name == method.name && it.parameters() == parameters && it.returnType == method.returnType
            }
            if (!AccessFlags.PUBLIC.isSet(target.accessFlags)) throw PatchException("Rumble: player ${method.name} isn't public")
            return "${player.type}->${method.name}(${parameters.joinToString("")})${method.returnType}"
        }
        bridge(
            RUMBLE_REMOTE,
            "viewPlayer",
            """
                instance-of v0, p0, $playerView
                if-eqz v0, :none
                check-cast p0, $playerView
                invoke-virtual { p0 }, $playerView->${viewPlayer.name}()$media3Player
                move-result-object v0
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
            """,
            locals = 1,
        )
        bridge(
            RUMBLE_REMOTE,
            "plays",
            "check-cast p0, ${player.type}\n" + exoPlayers.joinToString("\n") {
                "invoke-virtual { p0 }, ${player.type}->${it.name}()$EXO_PLAYER\nmove-result-object v0\nif-eq v0, p1, :yes"
            } + "\nconst/4 v0, 0x0\nreturn v0\n:yes\nconst/4 v0, 0x1\nreturn v0",
            locals = 1,
        )
        mapOf("isPlaying" to isPlaying, "canSeek" to canSeek).forEach { (stub, method) ->
            bridge(RUMBLE_REMOTE, stub, "check-cast p0, ${player.type}\ninvoke-virtual { p0 }, ${ref(method)}\nmove-result v0\nreturn v0", locals = 1)
        }
        mapOf("play" to play, "pause" to pause).forEach { (stub, method) ->
            bridge(RUMBLE_REMOTE, stub, "check-cast p0, ${player.type}\ninvoke-virtual { p0 }, ${ref(method)}\nreturn-void")
        }
        mapOf("seekBack" to seekBack, "seekForward" to seekForward).forEach { (stub, method) ->
            bridge(RUMBLE_REMOTE, stub, "check-cast p0, ${player.type}\ninvoke-virtual { p0, p1 }, ${ref(method)}\nreturn-void")
        }

        // Keys reach the main activity (named in the manifest) before its views: it gets a dispatchKeyEvent that
        // asks the extension first and otherwise dispatches as Activity does.
        val activity = mutableClassDefBy(MAIN_ACTIVITY)
        if (activity.methods.any { it.name == "dispatchKeyEvent" }) {
            throw RUMBLE.error("RumbleMainActivity has its own dispatchKeyEvent now; hook it instead")
        }
        val superclass = activity.superclass ?: throw RUMBLE.error("RumbleMainActivity has no superclass")
        activity.methods.add(
            ImmutableMethod(
                activity.type,
                "dispatchKeyEvent",
                listOf(ImmutableMethodParameter(KEY_EVENT, null, null)),
                "Z",
                AccessFlags.PUBLIC.value,
                null,
                null,
                MutableMethodImplementation(3),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        invoke-static { p0, p1 }, $RUMBLE_REMOTE->dispatch(Landroid/app/Activity;$KEY_EVENT)Z
                        move-result v0
                        if-eqz v0, :dispatch
                        return v0
                        :dispatch
                        invoke-super { p0, p1 }, $superclass->dispatchKeyEvent($KEY_EVENT)Z
                        move-result v0
                        return v0
                    """,
                )
            },
        )

        Locators.record("rumble.remote_keys.tv_key_handler", handler)
        Locators.record("rumble.remote_keys.play", play)
        Locators.record("rumble.remote_keys.pause", pause)
        Locators.record("rumble.remote_keys.is_playing", isPlaying)
        Locators.record("rumble.remote_keys.can_seek", canSeek)
        Locators.record("rumble.remote_keys.seek_back", seekBack)
        Locators.record("rumble.remote_keys.seek_forward", seekForward)
        Locators.record("rumble.remote_keys.type_setter", typeSetter)
        Locators.record("rumble.remote_keys.player_view", playerView)
        Locators.record("rumble.remote_keys.view_player", "$playerView->${viewPlayer.name}()$media3Player")
        exoPlayers.forEachIndexed { i, getter -> Locators.record("rumble.remote_keys.exo_player_$i", getter) }

        rumbleSettings.add(
            SwitchSetting(
                KEY,
                "Remote control",
                "A TV remote, gamepad or keyboard controls the video page's player: OK or Space plays and pauses, " +
                    "left and right skip 10 seconds (or the Seek interval), Back leaves the player.",
                Section.PLAYBACK,
                default = true,
            ),
        )
    }
}

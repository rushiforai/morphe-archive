package io.github.jordanwoodson.patches.rumble.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import io.github.jordanwoodson.patches.rumble.settings.rumbleSettings
import io.github.jordanwoodson.patches.rumble.settings.settingsPatch
import io.github.jordanwoodson.patches.rumble.shared.Constants.COMPATIBILITY_RUMBLE
import io.github.jordanwoodson.patches.rumble.shared.RUMBLE_STATS
import io.github.jordanwoodson.patches.rumble.shared.requireNoBranchTo
import io.github.jordanwoodson.patches.rumble.shared.single
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.shared.compose.constStrings
import io.github.jordanwoodson.patches.shared.compose.mutableTwin
import io.github.jordanwoodson.patches.shared.compose.parameters
import io.github.jordanwoodson.patches.shared.compose.reference
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

private const val EXO_PLAYER = "Landroidx/media3/exoplayer/ExoPlayer;"
private const val FRAME = "Landroidx/media3/ui/AspectRatioFrameLayout;"

// Media3's AnalyticsListener event IDs (public API constants), which its analytics collector passes along with
// each event it reports.
private const val EVENT_BANDWIDTH_ESTIMATE = 1006
private const val EVENT_AUDIO_INPUT_FORMAT_CHANGED = 1009
private const val EVENT_VIDEO_ENABLED = 1015
private const val EVENT_VIDEO_INPUT_FORMAT_CHANGED = 1017

@Suppress("unused")
val videoStatsPatch = bytecodePatch(
    name = "Show video stats",
    description = "Shows a small panel in the corner of the player with what Rumble's video player reports, " +
        "refreshed every second: bitrate and the network estimate, buffer, dropped frames, resolution, frame " +
        "rate and codecs, and for live streams that carry wall-clock times the delay behind the broadcast. The " +
        "numbers come from the player on your phone; nothing is sent anywhere, and the panel never takes a tap. " +
        "Starts off. Turn it on in Lurk settings > Playback.",
) {
    compatibleWith(COMPATIBILITY_RUMBLE)
    dependsOn(settingsPatch)

    execute {
        // Media3's Player interface (which ExoPlayer extends), its implementation and that one's base class.
        val player = classDefBy(EXO_PLAYER).interfaces.singleOrNull()
            ?: throw PatchException("Rumble: ExoPlayer doesn't extend exactly one interface")
        val implementations = mutableListOf<ClassDef>()
        classDefForEach { if (EXO_PLAYER in it.interfaces && !AccessFlags.INTERFACE.isSet(it.accessFlags)) implementations += it }
        val exoPlayerImpl = implementations.singleOrNull()
            ?: throw PatchException("Rumble: expected one ExoPlayer implementation, found ${implementations.size}")
        val basePlayer = classDefBy(exoPlayerImpl.superclass ?: throw PatchException("Rumble: ExoPlayer has no base class"))
        if (player !in basePlayer.interfaces) throw PatchException("Rumble: ExoPlayer's base class isn't Media3's BasePlayer")

        // getTotalBufferedDuration(): the thread check, then usToMs(playbackInfo.totalBufferedDurationUs).
        val buffered = exoPlayerImpl.methods.filter { method ->
            val code = method.implementation?.instructions?.toList() ?: return@filter false
            method.parameterTypes.isEmpty() && method.returnType == "J" && code.size == 6 &&
                code[1].opcode == Opcode.IGET_OBJECT && code[1].field()?.definingClass == exoPlayerImpl.type &&
                code[2].opcode == Opcode.IGET_WIDE && code[2].field()?.definingClass == code[1].field()?.type &&
                code[3].opcode == Opcode.INVOKE_STATIC && code[4].opcode == Opcode.MOVE_RESULT_WIDE &&
                code[5].opcode == Opcode.RETURN_WIDE
        }.singleOrNull() ?: throw PatchException("Rumble: no unique getTotalBufferedDuration in ExoPlayer")
        // getCurrentLiveOffset(): now minus the window's start minus the position, the only ()J of BasePlayer
        // that subtracts twice.
        val liveOffset = basePlayer.methods.filter { method ->
            method.parameterTypes.isEmpty() && method.returnType == "J" &&
                method.implementation?.instructions?.count {
                    it.opcode == Opcode.SUB_LONG || it.opcode == Opcode.SUB_LONG_2ADDR
                } == 2
        }.singleOrNull() ?: throw PatchException("Rumble: no unique getCurrentLiveOffset in Media3's BasePlayer")
        val playerMethods = classDefBy(player).methods.map { it.name to it.parameters() }
        listOf(buffered, liveOffset).forEach {
            if ((it.name to emptyList<String>()) !in playerMethods) {
                throw PatchException("Rumble: ${it.name}() isn't a method of Media3's Player")
            }
        }

        // The analytics collector: the class that reports all four events, by the IDs it passes with them.
        val format = FormatLogFingerprint.single("Media3 format log").let { match ->
            if (match.method.parameterTypes.single().toString() != match.classDef.type) {
                throw PatchException("Rumble: Media3's format log isn't a method of Format")
            }
            Locators.record("rumble.video_stats.format_log", match.method)
            match.method
        }
        fun Method.reports(event: Int, vararg parameters: String?) = returnType == "V" &&
            parameterTypes.size == parameters.size &&
            parameters.withIndex().all { (i, type) -> type == null || parameterTypes[i].toString() == type } &&
            implementation?.instructions?.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == event } == true
        fun ClassDef.reporter(event: Int, vararg parameters: String?) = methods.singleOrNull { it.reports(event, *parameters) }
        val collectors = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.reporter(EVENT_BANDWIDTH_ESTIMATE, "I", "J", "J") != null &&
                classDef.reporter(EVENT_VIDEO_INPUT_FORMAT_CHANGED, format.definingClass, null) != null &&
                classDef.reporter(EVENT_AUDIO_INPUT_FORMAT_CHANGED, format.definingClass, null) != null &&
                classDef.reporter(EVENT_VIDEO_ENABLED, null) != null
            ) {
                collectors += classDef
            }
        }
        val collector = collectors.singleOrNull()
            ?: throw PatchException("Rumble: expected one Media3 analytics collector, found ${collectors.size}")
        val collectorPlayer = collector.fields.singleOrNull { it.type == player && !AccessFlags.STATIC.isSet(it.accessFlags) }
            ?: throw PatchException("Rumble: the analytics collector doesn't keep one player")

        // The video decoder's counters are read through their toString(), which names each one.
        val counters = collector.reporter(EVENT_VIDEO_ENABLED, null)!!.parameterTypes.single().toString()
        val countersText = classDefBy(counters).methods.singleOrNull { it.name == "toString" && it.parameterTypes.isEmpty() }
            ?.constStrings().orEmpty()
        if (countersText.none { " droppedBuffers=%s" in it && " renderedOutputBuffers=%s" in it }) {
            throw PatchException("Rumble: Media3's decoder counters no longer describe themselves")
        }

        fun hook(event: Int, vararg parameters: String?, call: (Int) -> String) {
            val method = mutableTwin(collector, collector.reporter(event, *parameters)!!)
            if (AccessFlags.STATIC.isSet(method.accessFlags)) throw PatchException("Rumble: unexpected collector method ${method.name}")
            method.requireNoBranchTo(0, "the start of the analytics collector's ${method.name}")
            method.addInstructions(0, call(method.parameterRegister(0)))
            Locators.record("rumble.video_stats.event_$event", method)
        }
        hook(EVENT_VIDEO_INPUT_FORMAT_CHANGED, format.definingClass, null) { self ->
            invokeStatic("$RUMBLE_STATS->onVideoFormat(Ljava/lang/Object;Ljava/lang/Object;)V", self, self + 1)
        }
        hook(EVENT_AUDIO_INPUT_FORMAT_CHANGED, format.definingClass, null) { self ->
            invokeStatic("$RUMBLE_STATS->onAudioFormat(Ljava/lang/Object;Ljava/lang/Object;)V", self, self + 1)
        }
        hook(EVENT_VIDEO_ENABLED, null) { self ->
            invokeStatic("$RUMBLE_STATS->onVideoEnabled(Ljava/lang/Object;Ljava/lang/Object;)V", self, self + 1)
        }
        // (this, int elapsedMs, long bytes, long bitrate): the estimate is the second long.
        hook(EVENT_BANDWIDTH_ESTIMATE, "I", "J", "J") { self ->
            invokeStatic("$RUMBLE_STATS->onBandwidth(Ljava/lang/Object;J)V", self, self + 4, self + 5)
        }

        // The video frame reports itself when it is measured; its parent, Media3's PlayerView, keeps the player.
        val playerViews = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.fields.any { it.type == FRAME } && classDef.fields.any { it.type == player }) playerViews += classDef
        }
        val playerView = playerViews.singleOrNull()
            ?: throw PatchException("Rumble: expected one Media3 player view, found ${playerViews.size}")
        val viewPlayer = playerView.fields.singleOrNull { it.type == player }
            ?: throw PatchException("Rumble: the player view doesn't keep one player")
        AspectRatioMeasureFingerprint.single("video frame measure").method.apply {
            requireNoBranchTo(0, "the start of the video frame's measure")
            addInstructions(0, invokeStatic("$RUMBLE_STATS->onFrame(Landroid/view/View;)V", parameterRegister(0)))
        }

        // The extension reads both private fields: make them public rather than add accessors.
        listOf(collector, playerView, classDefBy(player), classDefBy(format.definingClass)).forEach {
            if (!AccessFlags.PUBLIC.isSet(it.accessFlags)) throw PatchException("Rumble: ${it.type} isn't public")
        }
        makePublic(collector.type, collectorPlayer.name)
        makePublic(playerView.type, viewPlayer.name)
        Locators.record("rumble.video_stats.collector", collector.type)
        Locators.record("rumble.video_stats.collector_player", "${collector.type}->${collectorPlayer.name}:$player")
        Locators.record("rumble.video_stats.player_view", playerView.type)
        Locators.record("rumble.video_stats.view_player", "${playerView.type}->${viewPlayer.name}:$player")
        Locators.record("rumble.video_stats.buffered", "$player->${buffered.name}()J")
        Locators.record("rumble.video_stats.live_offset", "$player->${liveOffset.name}()J")
        Locators.record("rumble.video_stats.decoder_counters", counters)

        bridge(
            RUMBLE_STATS,
            "collectorPlayer",
            """
                check-cast p0, ${collector.type}
                iget-object v0, p0, ${collector.type}->${collectorPlayer.name}:$player
                return-object v0
            """,
            locals = 1,
        )
        bridge(
            RUMBLE_STATS,
            "viewPlayer",
            """
                instance-of v0, p0, ${playerView.type}
                if-eqz v0, :none
                check-cast p0, ${playerView.type}
                iget-object v0, p0, ${playerView.type}->${viewPlayer.name}:$player
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
            """,
            locals = 1,
        )
        bridge(
            RUMBLE_STATS,
            "formatLog",
            """
                check-cast p0, ${format.definingClass}
                invoke-static { p0 }, ${format.reference()}
                move-result-object v0
                return-object v0
            """,
            locals = 1,
        )
        listOf("bufferedMs" to buffered, "liveOffsetMs" to liveOffset).forEach { (stub, method) ->
            bridge(
                RUMBLE_STATS,
                stub,
                """
                    check-cast p0, $player
                    invoke-interface { p0 }, $player->${method.name}()J
                    move-result-wide v0
                    invoke-static { v0, v1 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
                    move-result-object v0
                    return-object v0
                """,
                locals = 2,
            )
        }

        rumbleSettings.add(
            SwitchSetting(
                "video_stats",
                "Show video stats",
                "A panel over the player with bitrate, buffer, dropped frames, resolution and codecs, and a live " +
                    "stream's delay when it reports one, refreshed every second. Applies at once.",
                Section.PLAYBACK,
                default = false,
            ),
        )
    }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.field() =
    (this as? ReferenceInstruction)?.reference as? FieldReference

private fun BytecodePatchContext.makePublic(type: String, field: String) {
    mutableClassDefBy(type).fields.single { it.name == field }.apply {
        setAccessFlags(
            (accessFlags and (AccessFlags.PRIVATE.value or AccessFlags.PROTECTED.value).inv()) or AccessFlags.PUBLIC.value,
        )
    }
}

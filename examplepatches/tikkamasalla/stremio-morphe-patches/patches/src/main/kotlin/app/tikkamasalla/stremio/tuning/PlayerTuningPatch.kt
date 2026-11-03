package app.tikkamasalla.stremio.tuning

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.tikkamasalla.stremio.introskip.Constants
import app.tikkamasalla.stremio.introskip.hookEveryReturn
import app.tikkamasalla.stremio.introskip.StartStreamPlaybackFingerprint
import app.tikkamasalla.stremio.introskip.playerAssignedIndex
import app.tikkamasalla.stremio.introskip.resolvePlayerInterface
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.util.ReferenceUtil

private const val TUNING = "Lapp/tikkamasalla/stremio/tuning/PlayerTuning;"
private const val SWITCH = "Lapp/tikkamasalla/stremio/tuning/FrameRateSwitch;"
private const val GATE = "Lapp/tikkamasalla/stremio/tuning/SubtitleGate;"
private const val TRACK_DIALOG = "Lcom/stremio/tv/views/player/dialog/TrackSelectionDialog;"
private const val STRATEGY_TYPE = "Lcom/stremio/core/types/profile/Profile\$FrameRateMatchingStrategy;"

/** Turns the invoke at [index] into an invoke-static of [target] on the same registers (receiver first). */
private fun redirectCall(method: MutableMethod, index: Int, argCount: Int, target: String) {
    val call = method.implementation!!.instructions[index]
    val registers = when (call) {
        is FiveRegisterInstruction -> listOf(call.registerC, call.registerD, call.registerE).take(call.registerCount)
        is RegisterRangeInstruction -> List(call.registerCount) { call.startRegister + it }
        else -> throw IllegalStateException("unexpected call shape ${call.opcode}")
    }
    if (registers.size != argCount || registers.any { it > 15 }) throw IllegalStateException("unexpected registers")
    method.replaceInstruction(index, "invoke-static {${registers.joinToString { "v$it" }}}, $target")
}

/**
 * Smoother playback in Stremio's own (Media3) player: frame-rate matching mode and a larger network buffer.
 * Each hook is optional and fails soft: a build where an anchor moved keeps the stock behaviour for that part.
 */
val playerTuningPatch = bytecodePatch(
    name = "Smoother playback",
    description = "Frame-rate matching (Seamless only / Always / Off), a larger, debrid-friendly playback buffer, and no stream re-open freeze when arriving addon subtitles would not change what is on screen, for Stremio's own player.",
    default = true,
) {
    compatibleWith(Constants.STREMIO_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        val log = java.util.logging.Logger.getLogger("PlayerTuningPatch")

        // Buffer (1.6.12 / 1.10.4): swap the LoadControl before createPlayer and the totalAllocatedBytes() field see it.
        try {
            ExoWrapperConstructorFingerprint.method.addInstructions(
                0,
                """
                    invoke-static/range {p4 .. p4}, $TUNING->loadControl(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object p4
                    check-cast p4, Landroidx/media3/exoplayer/LoadControl;
                """.trimIndent(),
            )
        } catch (_: Exception) {
            log.info("ExoPlayer wrapper constructor not found: the stock buffer stays in this build")
        }

        // Frame rate, part 1 (Media3 hint): route the strategy int through the setting just before it is applied.
        try {
            val method = CreatePlayerFingerprint.method
            val instructions = method.implementation!!.instructions
            val index = instructions.indexOfFirst {
                val ref = (it as? ReferenceInstruction)?.reference
                ref is MethodReference && ref.name == "setVideoChangeFrameRateStrategy"
            }
            if (index < 0) throw IllegalStateException("no setVideoChangeFrameRateStrategy call")
            val call = instructions[index] as FiveRegisterInstruction
            if (call.registerCount != 2 || (call.opcode != Opcode.INVOKE_VIRTUAL && call.opcode != Opcode.INVOKE_INTERFACE)) {
                throw IllegalStateException("unexpected call shape ${call.opcode}")
            }
            val reference = ReferenceUtil.getReferenceString((call as ReferenceInstruction).reference)
            val opName = if (call.opcode == Opcode.INVOKE_VIRTUAL) "invoke-virtual" else "invoke-interface"
            // The first line replaces the call in place (a label on the call stays on it), the rest follows it.
            method.replaceInstruction(index, "invoke-static {v${call.registerD}}, $TUNING->exoStrategy(I)I")
            method.addInstructions(
                index + 1,
                """
                    move-result v${call.registerD}
                    $opName {v${call.registerC}, v${call.registerD}}, $reference
                """.trimIndent(),
            )
        } catch (_: Exception) {
            log.info("createPlayer frame-rate call not found: the stock Media3 frame-rate hint stays in this build")
        }

        // Frame rate, part 2 (Stremio's display-mode matcher): the profile strategy it and the hint read, every build.
        try {
            val hooked = hookEveryReturn(FrameRateStrategyGetterFingerprint.method, Opcode.RETURN_OBJECT) { register ->
                """
                    invoke-static/range {v$register .. v$register}, $TUNING->matchStrategy(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$register
                    check-cast v$register, $STRATEGY_TYPE
                """
            }
            if (hooked == 0) throw IllegalStateException("getter has no return-object")
        } catch (_: Exception) {
            log.warning("getFrameRateMatchingStrategy not found: Match frame rate has no effect on the display matcher")
        }

        // Subtitle re-open gate (1.6.12; every anchor is optional, a build without one keeps stock's re-open).
        // Redirecting an invoke keeps its registers. bind reads the register the store itself reads, so
        // nothing is clobbered; the other hooks at this index write only v0 and v1.
        try {
            val start = StartStreamPlaybackFingerprint.method
            val index = playerAssignedIndex(start)
            val stored = (start.implementation!!.instructions[index - 1] as TwoRegisterInstruction).registerA
            if (stored > 15) throw IllegalStateException("player register out of invoke range")
            val onState = OnPlayerStateFingerprint.method
            val setIndex = onState.implementation!!.instructions.indexOfFirst {
                val ref = (it as? ReferenceInstruction)?.reference
                ref is MethodReference && ref.name == "setMediaItem" && ref.parameterTypes.map { p -> p.toString() } ==
                    listOf("Landroidx/media3/common/MediaItem;", "Z")
            }
            val showDialog = ShowTrackDialogFingerprint.method
            val showIndex = showDialog.implementation!!.instructions.indexOfFirst {
                val ref = (it as? ReferenceInstruction)?.reference
                ref is MethodReference && ref.name == "show" && ref.definingClass == TRACK_DIALOG
            }
            if (setIndex < 0 || showIndex < 0) throw IllegalStateException("gate call not found")
            redirectCall(onState, setIndex, 3, "$GATE->applySubtitles(Ljava/lang/Object;Ljava/lang/Object;Z)V")
            redirectCall(showDialog, showIndex, 1, "$GATE->showTrackDialog(Ljava/lang/Object;)V")
            start.addInstructions(index, "invoke-static {p0, v$stored}, $GATE->bind(Ljava/lang/Object;Ljava/lang/Object;)V")
        } catch (_: Exception) {
            log.info("Subtitle gate anchors not found: the stock subtitle re-open stays in this build")
        }

        // Which build's silent switch really landed: the extension offers "Always" as the default only then.
        var landedBuild = 0

        // Frame rate, part 5 (1.12.0): same hold as part 4, but every name is obfuscated. The merged
        // effects lambda is anchored by its strings, the engines and their load/prepare methods are
        // resolved from the JNI-bound classes that keep their names (MPVLib, libvlc, core Stream),
        // and the dispose-time mode reset is the one default-package action that writes
        // preferredDisplayModeId. All hooks or none: resolve them before touching any.
        try {
            // invokeSuspend itself: a LaunchedEffect starts through create() + invokeSuspend (fs2.n -> v00.k), so
            // the lambda's invoke() is not on that path and a hook there never runs.
            val effects = PlayerEffects112Fingerprint.method
            val iface = resolvePlayerInterface() ?: throw IllegalStateException("no player interface")
            val ifaceDef = classDefByOrNull(iface.type) ?: throw IllegalStateException("no player interface def")
            val loadName112 = ifaceDef.methods.single {
                it.returnType == "V" && it.parameterTypes.map { p -> p.toString() } == listOf("Landroid/net/Uri;", "J")
            }.name
            val prepareName112 = ifaceDef.methods.single { m ->
                m.returnType == "V" && m.parameterTypes.size == 1 &&
                    classDefByOrNull(m.parameterTypes[0].toString())?.let {
                        AccessFlags.INTERFACE.isSet(it.accessFlags)
                    } == true
            }.name
            val allClasses = mutableListOf<ClassDef>()
            classDefForEach { allClasses += it }
            val implTypes = mutableSetOf<String>()
            allClasses.filter { iface.type in it.interfaces && !AccessFlags.INTERFACE.isSet(it.accessFlags) }
                .forEach { implTypes += it.type }
            var grew = true
            while (grew) {
                grew = false
                allClasses.forEach { c ->
                    if (c.type !in implTypes && c.superclass in implTypes) {
                        implTypes += c.type
                        grew = true
                    }
                }
            }
            val implementors = allClasses.filter { it.type in implTypes }
            val mpvClass = implementors.single { c -> c.fields.any { it.type == "Ldev/jdtech/mpv/MPVLib;" } }
            val vlcClass = implementors.single { c -> c.fields.any { it.type == "Lorg/videolan/libvlc/MediaPlayer;" } }
            val exoClass = implementors.single { c ->
                c.methods.any { m ->
                    m.name == "<init>" &&
                        m.parameterTypes.any { p -> p.toString() == "Lcom/stremio/core/types/resource/Stream;" }
                }
            }
            val exoPrepare112 = mutableClassDefBy(exoClass).methods.single { it.name == prepareName112 }
            val mpvLoad112 = mutableClassDefBy(mpvClass).methods.single { it.name == loadName112 }
            val vlcLoad112 = mutableClassDefBy(vlcClass).methods.single { it.name == loadName112 }
            val restoreCandidates = allClasses.filter { c ->
                !c.type.contains('/') && c.fields.any { it.type == "I" } &&
                    c.fields.any { it.type == "Ljava/lang/Object;" }
            }.flatMap { c ->
                c.methods.filter { m ->
                    m.returnType == "V" && m.parameterTypes.isEmpty() &&
                        m.implementation?.instructions?.any { ins ->
                            val ref = (ins as? ReferenceInstruction)?.reference
                            ref is FieldReference && ref.name == "preferredDisplayModeId" &&
                                ins.opcode.name.startsWith("iput")
                        } == true
                }.map { c to it.name }
            }
            val (restoreClass, restoreName) = restoreCandidates.single()
            val restore112 = mutableClassDefBy(restoreClass).methods.single {
                it.name == restoreName && it.returnType == "V" && it.parameterTypes.isEmpty()
            }
            val deferLoadGate112 = """
                    invoke-static/range {p0 .. p3}, $SWITCH->deferLoad(Ljava/lang/Object;Ljava/lang/Object;J)Z
                    move-result v0
                    if-eqz v0, :framerate_stock
                    return-void
                    :framerate_stock
                    nop
                """.trimIndent()
            effects.addInstructionsWithLabels(
                0,
                """
                    invoke-static/range {p0 .. p0}, $SWITCH->hook112(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v0
                    if-eqz v0, :framerate_stock
                    return-object v0
                    :framerate_stock
                    nop
                """.trimIndent(),
            )
            restore112.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p0}, $SWITCH->onRestore112(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :framerate_stock
                    return-void
                    :framerate_stock
                    nop
                """.trimIndent(),
            )
            exoPrepare112.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p0, p1}, $SWITCH->deferPrepare(Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :framerate_stock
                    return-void
                    :framerate_stock
                    nop
                """.trimIndent(),
            )
            mpvLoad112.addInstructionsWithLabels(0, deferLoadGate112)
            vlcLoad112.addInstructionsWithLabels(0, deferLoadGate112)
            landedBuild = 3
        } catch (_: Exception) {
            log.info("1.12.0 player effects / engines not resolved: no silent frame-rate switch in this build")
        }

        // Frame rate, part 4 (1.10.4): the silent switch on the Compose player. The stream reaches the
        // engine before the media probe, so the engine's load (mpv/VLC) or prepare (Exo) is held in the
        // extension and replayed once the display has switched: the wait stays on the loading screen.
        // All hooks or none: resolve them before touching any.
        try {
            val mediaPlayer110 = MediaPlayer110Fingerprint.method
            val adjustMatcher = AdjustMatcher110Fingerprint.method
            val restoreMatcher = RestoreMatcher110Fingerprint.method
            val exoPrepare = ExoPrepare110Fingerprint.method
            val mpvLoad = MpvLoad110Fingerprint.method
            val vlcLoad = VlcLoad110Fingerprint.method
            val probeEffect = ProbeEffect110Fingerprint.method
            val instructions110 = mediaPlayer110.implementation!!.instructions
            val loadIndex = instructions110.indexOfFirst {
                val ref = (it as? ReferenceInstruction)?.reference
                ref is MethodReference && ref.name == "load" &&
                    ref.definingClass == "Lcom/stremio/common/players/Player;"
            }
            if (loadIndex < 0) throw IllegalStateException("no Player.load call")
            val loadCall = instructions110[loadIndex] as FiveRegisterInstruction
            // Static synthetic (PlayerType, PlaybackManager, Stream, String, long): p1 is the manager,
            // p3 the stream URL, and the load receiver register holds the new player.
            mediaPlayer110.addInstructions(
                loadIndex,
                "invoke-static {p1, v${loadCall.registerC}, p3}, $SWITCH->onStreamStart110(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V",
            )
            val deferLoadGate = """
                    invoke-static/range {p0 .. p3}, $SWITCH->deferLoad(Ljava/lang/Object;Ljava/lang/Object;J)Z
                    move-result v0
                    if-eqz v0, :framerate_stock
                    return-void
                    :framerate_stock
                    nop
                """.trimIndent()
            adjustMatcher.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p0, p1}, $SWITCH->adjust110(Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :framerate_stock
                    return-void
                    :framerate_stock
                    nop
                """.trimIndent(),
            )
            restoreMatcher.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p0}, $SWITCH->onRestore110(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :framerate_stock
                    return-void
                    :framerate_stock
                    nop
                """.trimIndent(),
            )
            exoPrepare.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p0, p1}, $SWITCH->deferPrepare(Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :framerate_stock
                    return-void
                    :framerate_stock
                    nop
                """.trimIndent(),
            )
            mpvLoad.addInstructionsWithLabels(0, deferLoadGate)
            vlcLoad.addInstructionsWithLabels(0, deferLoadGate)
            probeEffect.addInstructions(
                0,
                "invoke-static/range {p0 .. p0}, $SWITCH->probeEffect110(Ljava/lang/Object;)V",
            )
            landedBuild = 2
        } catch (_: Exception) {
            log.info("FrameRateMatcher / PlaybackManager methods not found: no silent frame-rate switch in this build")
        }

        // Frame rate, part 3 (1.6.12): the silent switch. All three hooks or none: resolve them before touching any.
        try {
            val mediaPlayer = MediaPlayerFingerprint.method
            val adjust = AdjustDisplayModeFingerprint.method
            val restore = RestoreDisplayModeFingerprint.method
            val index = mediaPlayer.implementation!!.instructions.indexOfFirst {
                val ref = (it as? ReferenceInstruction)?.reference
                ref is MethodReference && ref.name == "startMediaLoadJobs"
            }
            if (index < 0) throw IllegalStateException("no startMediaLoadJobs call")
            mediaPlayer.addInstructions(
                index,
                "invoke-static {p0, p1}, $SWITCH->onStreamStart(Ljava/lang/Object;Ljava/lang/String;)V",
            )
            adjust.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p0, p1}, $SWITCH->adjust(Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :framerate_stock
                    return-void
                    :framerate_stock
                    nop
                """.trimIndent(),
            )
            restore.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p0}, $SWITCH->onRestore(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :framerate_stock
                    return-void
                    :framerate_stock
                    nop
                """.trimIndent(),
            )
            landedBuild = 1
        } catch (_: Exception) {
            log.info("PlayerFragment display-mode methods not found: no silent frame-rate switch in this build")
        }

        try {
            FrameRateLandedFingerprint.method.addInstructions(0, "const/4 v0, $landedBuild\nreturn v0")
        } catch (_: Exception) {
            log.warning("FrameRateModes.landed not found: the silent switch is judged by the class shape alone")
        }
    }
}

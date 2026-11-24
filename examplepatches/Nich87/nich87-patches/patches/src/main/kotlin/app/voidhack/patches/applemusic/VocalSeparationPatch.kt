package app.voidhack.patches.applemusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val RENDERER = "Lcom/apple/android/music/playback/renderer/SVAudioRendererV2;"
private const val AUDIO_SINK = "Lcom/google/android/exoplayer2/audio/DefaultAudioSink;"
private const val AUDIO_PROCESSORS = "[Lcom/google/android/exoplayer2/audio/AudioProcessor;"
private const val SING_PROCESSOR = "Lapp/voidhack/extension/applemusic/sing/SingAudioProcessor;"
private const val BASE_PROCESSOR = "Lcom/google/android/exoplayer2/audio/BaseAudioProcessor;"
private const val AUDIO_FORMAT = "Lcom/google/android/exoplayer2/audio/AudioProcessor\$AudioFormat;"
private const val BUFFER = "Ljava/nio/ByteBuffer;"
private const val PLAYBACK = "Lapp/voidhack/extension/applemusic/sing/SingPlayback;"
private const val CONTROLS = "Lapp/voidhack/extension/applemusic/sing/SingControls;"
private const val PLAYER_CONTROLS = "Lapp/voidhack/extension/applemusic/sing/SingControls\$PlayerControls;"
private const val LYRICS = "Lcom/apple/android/music/player/fragment/PlayerLyricsViewFragment;"
private val viewCreatedParameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;")

private val singStrings = resourcePatch {
    execute {
        listOf("values", "values-ja").forEach { directory ->
            val source = "/applemusic/sing/$directory/voidhack_sing.xml"
            checkNotNull(PlaybackProcessors::class.java.getResourceAsStream(source)).use { input ->
                document(input).use { translations ->
                    document("res/$directory/strings.xml").use { destination ->
                        val entries = translations.getElementsByTagName("string")
                        for (index in 0 until entries.length) {
                            destination.documentElement.appendChild(
                                destination.importNode(entries.item(index), true),
                            )
                        }
                    }
                }
            }
        }
        val slotLayout = "layout/voidhack_sing_slot.xml"
        checkNotNull(PlaybackProcessors::class.java.getResourceAsStream("/applemusic/sing/$slotLayout")).use { input ->
            get("res/$slotLayout", false).outputStream().use { input.copyTo(it) }
        }
    }
}

private object PlaybackProcessors : Fingerprint(
    definingClass = RENDERER,
    name = "createAudioProcessors",
    parameters = emptyList(),
    returnType = AUDIO_PROCESSORS,
)

private object PlaybackSinkConstructor : Fingerprint(
    definingClass = AUDIO_SINK,
    name = "<init>",
    parameters = listOf(
        "Lcom/google/android/exoplayer2/audio/AudioCapabilities;", AUDIO_PROCESSORS, "Z", "Z",
    ),
    returnType = "V",
)

@Suppress("unused")
val vocalSeparationPatch = bytecodePatch(
    name = "On-device vocal separation",
    description = "Adds a vocal and accompaniment mix slider to the lyrics screen. Requires a one-time model download and compatible stereo playback.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            name = checkNotNull(appleMusicCompatibility.name),
            packageName = checkNotNull(appleMusicCompatibility.packageName),
            apkFileType = appleMusicCompatibility.apkFileType,
            appIconColor = appleMusicCompatibility.appIconColor,
            targets = listOf(
                AppTarget(version = "7.0.3", versionCodes = mapOf(SupportedAbi.ARM64_V8A to 1626)),
            ),
        ),
    )
    dependsOn(singStrings, singRuntimeResources)

    execute {
        mutableClassDefBy(SING_PROCESSOR).bindSingProcessor()

        val createProcessors = PlaybackProcessors.method
        val originalName = createProcessors.name
        val nativeName = "voidhackNativeAudioProcessors"
        createProcessors.name = nativeName
        PlaybackProcessors.classDef.addSingMethod(
            name = originalName,
            parameters = emptyList(),
            returnType = AUDIO_PROCESSORS,
            registers = 2,
            accessFlags = createProcessors.accessFlags,
            body = """
                invoke-direct {p0}, $RENDERER->$nativeName()$AUDIO_PROCESSORS
                move-result-object v0
                invoke-static {v0}, $SING_PROCESSOR->appendTo($AUDIO_PROCESSORS)$AUDIO_PROCESSORS
                move-result-object v0
                return-object v0
            """,
        )

        val sinkConstructor = PlaybackSinkConstructor.method
        val sinkImplementation = checkNotNull(sinkConstructor.implementation)
        val sinkReturn = sinkImplementation.instructions.last()
        check(sinkImplementation.registerCount == 6 && sinkReturn.opcode == Opcode.RETURN_VOID)
        // Only the patched renderer supplies a processor list ending in Sing.
        // The float chain needs its own instance after Apple's integer-to-float converter.
        sinkConstructor.addInstructionsWithLabels(
            sinkImplementation.instructions.lastIndex,
            """
                if-eqz p3, :finish
                array-length v0, p2
                if-eqz v0, :finish
                add-int/lit8 v0, v0, -0x1
                aget-object v0, p2, v0
                instance-of v0, v0, $SING_PROCESSOR
                if-eqz v0, :finish
                iget-object v0, p0, $AUDIO_SINK->toFloatPcmAvailableAudioProcessors:$AUDIO_PROCESSORS
                invoke-static {v0}, $SING_PROCESSOR->appendTo($AUDIO_PROCESSORS)$AUDIO_PROCESSORS
                move-result-object v0
                iput-object v0, p0, $AUDIO_SINK->toFloatPcmAvailableAudioProcessors:$AUDIO_PROCESSORS
            """,
            ExternalLabel("finish", sinkReturn),
        )

        val lyrics = mutableClassDefBy(LYRICS)
        val parent = checkNotNull(lyrics.superclass)
        lyrics.bindSingControlsFade(parent)

        val timer = mutableClassDefBy(parent.removeSuffix(";") + "\$b;")
        val owner = timer.instanceFields.single { it.type == parent }
        val hideControls = timer.methods.single {
            it.name == "run" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        hideControls.addInstructionsWithLabels(
            0,
            """
                iget-object v0, p0, $owner
                invoke-virtual {v0}, $parent->getView()Landroid/view/View;
                move-result-object v0
                invoke-static {v0}, $CONTROLS->isMixerOpen(Landroid/view/View;)Z
                move-result v0
                if-eqz v0, :native_fade
                return-void
            """,
            ExternalLabel("native_fade", hideControls.getInstruction(0)),
        )

        check(lyrics.methods.none { it.name == "onViewCreated" && it.parameterTypes == viewCreatedParameters })
        val viewCreated = viewCreatedParameters.joinToString("")
        lyrics.addSingMethod(
            name = "onViewCreated",
            parameters = viewCreatedParameters,
            returnType = "V",
            registers = 3,
            body = """
                invoke-super {p0, p1, p2}, $parent->onViewCreated($viewCreated)V
                invoke-static {p1, p0}, $CONTROLS->attach(Landroid/view/View;$PLAYER_CONTROLS)V
                return-void
            """,
        )
    }
}

private fun MutableClass.bindSingControlsFade(parent: String) {
    interfaces.add(PLAYER_CONTROLS)
    addSingMethod(
        name = "voidhackShowControls",
        parameters = emptyList(),
        returnType = "V",
        registers = 3,
        body = """
            invoke-virtual {p0}, $parent->O1()V
            const/4 v0, 0x0
            filled-new-array {v0}, [I
            move-result-object v1
            invoke-virtual {p0, v0, v1}, $parent->N1(I[I)V
            return-void
        """,
    )
    addSingMethod(
        name = "voidhackResumeControlsFade",
        parameters = emptyList(),
        returnType = "V",
        registers = 1,
        body = """
            invoke-virtual {p0}, $parent->O1()V
            invoke-virtual {p0}, $parent->a2()V
            return-void
        """,
    )
}

private fun MutableClass.bindSingProcessor() {
    setSuperClass(BASE_PROCESSOR)
    methods.single { it.name == "<init>" }.replaceInstruction(
        0, "invoke-direct {p0}, $BASE_PROCESSOR-><init>()V",
    )

    addSingMethod(
        name = "appendTo",
        parameters = listOf(AUDIO_PROCESSORS),
        returnType = AUDIO_PROCESSORS,
        registers = 4,
        accessFlags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        body = """
            array-length v0, p0
            add-int/lit8 v1, v0, 0x1
            invoke-static {p0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;
            move-result-object v1
            check-cast v1, $AUDIO_PROCESSORS
            new-instance v2, $SING_PROCESSOR
            invoke-direct {v2}, $SING_PROCESSOR-><init>()V
            aput-object v2, v1, v0
            return-object v1
        """,
    )

    addSingMethod(
        name = "onConfigure",
        parameters = listOf(AUDIO_FORMAT),
        returnType = AUDIO_FORMAT,
        registers = 5,
        // The sink uses the last processor's configure result as its AudioTrack format.
        // Unsupported PCM is copied through by queueInput, so keep that format intact.
        body = """
            iget v0, p1, $AUDIO_FORMAT->sampleRate:I
            iget v1, p1, $AUDIO_FORMAT->channelCount:I
            iget v2, p1, $AUDIO_FORMAT->encoding:I
            invoke-static {v0, v1, v2}, $PLAYBACK->supportsFormat(III)Z
            return-object p1
        """,
    )
    addSingMethod(
        name = "queueInput",
        parameters = listOf(BUFFER),
        returnType = "V",
        registers = 6,
        body = """
            iget-object v0, p0, $BASE_PROCESSOR->inputAudioFormat:$AUDIO_FORMAT
            iget v1, v0, $AUDIO_FORMAT->sampleRate:I
            iget v2, v0, $AUDIO_FORMAT->channelCount:I
            iget v3, v0, $AUDIO_FORMAT->encoding:I
            invoke-static {p0, p1, v1, v2, v3}, $PLAYBACK->queueInput(Ljava/lang/Object;${BUFFER}III)$BUFFER
            move-result-object v0
            if-nez v0, :write
            move-object v0, p1
            :write
            invoke-direct {p0, v0}, $SING_PROCESSOR->voidhackWriteSingOutput($BUFFER)V
            return-void
        """,
    )
    addSingMethod(
        name = "onFlush",
        parameters = emptyList(),
        returnType = "V",
        registers = 1,
        body = """
            invoke-static {p0}, $PLAYBACK->flush(Ljava/lang/Object;)V
            return-void
        """,
    )
    addSingMethod(
        name = "onQueueEndOfStream",
        parameters = emptyList(),
        returnType = "V",
        registers = 1,
        body = """
            invoke-static {p0}, $PLAYBACK->finish(Ljava/lang/Object;)V
            return-void
        """,
    )
    addSingMethod(
        name = "voidhackWriteSingOutput",
        parameters = listOf(BUFFER),
        returnType = "V",
        registers = 4,
        accessFlags = AccessFlags.PRIVATE.value,
        body = """
            invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I
            move-result v0
            if-eqz v0, :done
            invoke-virtual {p0, v0}, $BASE_PROCESSOR->replaceOutputBuffer(I)$BUFFER
            move-result-object v1
            invoke-virtual {v1, p1}, $BUFFER->put($BUFFER)$BUFFER
            invoke-virtual {v1}, Ljava/nio/Buffer;->flip()Ljava/nio/Buffer;
            :done
            return-void
        """,
    )
    addSingMethod(
        name = "getOutput",
        parameters = emptyList(),
        returnType = BUFFER,
        registers = 3,
        body = """
            invoke-super {p0}, $BASE_PROCESSOR->getOutput()$BUFFER
            move-result-object v0
            invoke-virtual {v0}, Ljava/nio/Buffer;->hasRemaining()Z
            move-result v1
            if-nez v1, :native_output
            invoke-static {p0}, $PLAYBACK->drain(Ljava/lang/Object;)$BUFFER
            move-result-object v1
            if-eqz v1, :native_output
            return-object v1
            :native_output
            return-object v0
        """,
    )

    addSingMethod(
        name = "isEnded",
        parameters = emptyList(),
        returnType = "Z",
        registers = 2,
        body = """
            invoke-super {p0}, $BASE_PROCESSOR->isEnded()Z
            move-result v0
            if-eqz v0, :done
            invoke-static {p0}, $PLAYBACK->hasPendingOutput(Ljava/lang/Object;)Z
            move-result v0
            xor-int/lit8 v0, v0, 0x1
            :done
            return v0
        """,
    )
}

private fun MutableClass.addSingMethod(
    name: String,
    parameters: List<String>,
    returnType: String,
    registers: Int,
    accessFlags: Int = AccessFlags.PUBLIC.value,
    body: String,
) {
    val method = ImmutableMethod(
        type,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        accessFlags,
        null,
        null,
        MutableMethodImplementation(registers),
    ).toMutable()
    method.addInstructionsWithLabels(0, body)
    methods.add(method)
}

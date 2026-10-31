package app.fluffydiscord.patches.screenrecorder

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addFreeRegisters
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField

private val FRAME_RATES = listOf(15, 24, 30, 48, 60, 90, 120, 144, 165, 185)
private const val RENDER_FRAME_MESSAGE = 1
private const val KEEP_ALIVE_MESSAGE = 3
private const val KEEP_ALIVE_MILLISECONDS = 100
private const val NANOSECONDS_PER_MILLISECOND = 1_000_000
private const val PRESENTATION_TIME_PARAMETER_REGISTERS = 3
private const val LAST_FRAME_FIELD_NAME = "patchedLastFrameNanoseconds"
private const val FIRST_FRAME_FIELD_NAME = "patchedFirstFrameNanoseconds"
private const val HAS_FIRST_FRAME_FIELD_NAME = "patchedHasFirstFrame"

@Suppress("unused")
val highFrameRatePatch = bytecodePatch(
    name = "Unlock high frame rates",
    description = "Adds 120, 144, 165 and 185 fps, encodes every new screen frame with its own timestamp, " +
        "and installs the recorder as a separate app next to the stock one.",
    default = true,
) {
    compatibleWith(SCREEN_RECORDER_COMPATIBILITY)

    dependsOn(separateAppPatch, addTilePatch)

    execute {
        extendFrameRateList()
        encodeEachNewFrame()
        replaceRenderTimerWithKeepAlive()
        useFrameTimestamps()
        requestKeyframeUntilMuxerStarts()
    }
}

context(patchContext: BytecodePatchContext)
private fun extendFrameRateList() {
    FrameRateListFingerprint.let { fingerprint ->
        val frameRateArray = fingerprint.instructionMatches[0]
            .getInstruction<ReferenceInstruction>().reference as FieldReference
        val frameRateArrayField = "${frameRateArray.definingClass}->${frameRateArray.name}:${frameRateArray.type}"

        fingerprint.method.apply {
            val registers = getFreeRegisterProvider(0, 3)
            val arrayRegister = registers.getFreeRegister4Bit()
            val valueRegister = registers.getFreeRegister4Bit()
            val indexRegister = registers.getFreeRegister4Bit()

            val fillArray = FRAME_RATES.mapIndexed { index, frameRate ->
                """
                    const/16 v$valueRegister, $frameRate
                    const/16 v$indexRegister, $index
                    aput v$valueRegister, v$arrayRegister, v$indexRegister
                """
            }.joinToString("\n")

            addInstructions(
                0,
                """
                    const/16 p0, ${FRAME_RATES.last()}
                    const/16 v$indexRegister, ${FRAME_RATES.size}
                    new-array v$arrayRegister, v$indexRegister, [I
                    $fillArray
                    sput-object v$arrayRegister, $frameRateArrayField
                """,
            )
        }
    }
}

context(patchContext: BytecodePatchContext)
private fun encodeEachNewFrame() {
    val rendererClass = FrameAvailableFingerprint.originalClassDef
    val handlerField = rendererClass.fields.first { field ->
        patchContext.classDefByOrNull(field.type)?.superclass == "Landroid/os/Handler;"
    }
    val handlerFieldReference = "${rendererClass.type}->${handlerField.name}:${handlerField.type}"

    FrameAvailableFingerprint.method.apply {
        val returnIndex = implementation!!.instructions.size - 1

        addInstructionsWithLabels(
            returnIndex,
            """
                iget-object p1, p0, $handlerFieldReference
                if-eqz p1, :no_render_thread
                const/4 p0, $RENDER_FRAME_MESSAGE
                invoke-virtual {p1, p0}, Landroid/os/Handler;->sendEmptyMessage(I)Z
                :no_render_thread
                nop
            """,
        )
    }
}

context(patchContext: BytecodePatchContext)
private fun replaceRenderTimerWithKeepAlive() {
    RenderLoopFingerprint.let { fingerprint ->
        val readMessage = fingerprint.instructionMatches[0]
        val rescheduleRender = fingerprint.instructionMatches[2]
        val reschedule = rescheduleRender.getInstruction<FiveRegisterInstruction>()
        val handlerRegister = reschedule.registerC
        val messageRegister = reschedule.registerD
        val delayRegister = reschedule.registerE
        val delayUpperRegister = reschedule.registerF

        fingerprint.method.apply {
            removeInstruction(rescheduleRender.index)
            addInstructions(
                rescheduleRender.index,
                """
                    const/4 v$messageRegister, $KEEP_ALIVE_MESSAGE
                    invoke-virtual {v$handlerRegister, v$messageRegister}, Landroid/os/Handler;->removeMessages(I)V
                    const-wide/16 v$delayRegister, $KEEP_ALIVE_MILLISECONDS
                    invoke-virtual {v$handlerRegister, v$messageRegister, v$delayRegister, v$delayUpperRegister}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z
                    const/4 v$messageRegister, $RENDER_FRAME_MESSAGE
                """,
            )

            val messageWhatRegister = readMessage.getInstruction<TwoRegisterInstruction>().registerA
            val aliasIndex = readMessage.index + 1
            val compareRegister = findFreeRegister(aliasIndex, messageWhatRegister)

            addInstructionsWithLabels(
                aliasIndex,
                """
                    const/4 v$compareRegister, $KEEP_ALIVE_MESSAGE
                    if-ne v$messageWhatRegister, v$compareRegister, :not_keep_alive
                    const/4 v$messageWhatRegister, $RENDER_FRAME_MESSAGE
                    :not_keep_alive
                    nop
                """,
            )
        }
    }
}

context(patchContext: BytecodePatchContext)
private fun useFrameTimestamps() {
    val rendererClass = PresentationTimeFingerprint.classDef
    val surfaceTextureField = rendererClass.fields.first { it.type == "Landroid/graphics/SurfaceTexture;" }
    val startOffsetField = rendererClass.fields.first { field ->
        field.type == "J" && AccessFlags.FINAL.isSet(field.accessFlags)
    }

    fun fieldReference(name: String, type: String) = "${rendererClass.type}->$name:$type"

    listOf(
        LAST_FRAME_FIELD_NAME to "J",
        FIRST_FRAME_FIELD_NAME to "J",
        HAS_FIRST_FRAME_FIELD_NAME to "Z",
    ).forEach { (name, type) ->
        rendererClass.instanceFields.add(
            ImmutableField(rendererClass.type, name, type, AccessFlags.PRIVATE.value, null, null, null).toMutable(),
        )
    }

    val surfaceTexture = fieldReference(surfaceTextureField.name, surfaceTextureField.type)
    val startOffset = fieldReference(startOffsetField.name, startOffsetField.type)
    val lastFrame = fieldReference(LAST_FRAME_FIELD_NAME, "J")
    val firstFrame = fieldReference(FIRST_FRAME_FIELD_NAME, "J")
    val hasFirstFrame = fieldReference(HAS_FIRST_FRAME_FIELD_NAME, "Z")

    val originalRegisterCount = PresentationTimeFingerprint.method.implementation!!.registerCount
    val thisRegister = originalRegisterCount - PRESENTATION_TIME_PARAMETER_REGISTERS
    val timestampRegister = thisRegister + 1
    val temporaryRegister = originalRegisterCount
    val wideRegister = originalRegisterCount + 1
    val factorRegister = originalRegisterCount + 3
    val (method, addedInstructions) = PresentationTimeFingerprint.method.addFreeRegisters(5)

    method.addInstructionsWithLabels(
        addedInstructions,
        """
            iget-object v$temporaryRegister, v$thisRegister, $surfaceTexture
            invoke-virtual {v$temporaryRegister}, Landroid/graphics/SurfaceTexture;->getTimestamp()J
            move-result-wide v$timestampRegister
            iget-wide v$wideRegister, v$thisRegister, $lastFrame
            cmp-long v$temporaryRegister, v$timestampRegister, v$wideRegister
            if-gtz v$temporaryRegister, :new_frame
            invoke-static {}, Ljava/lang/System;->nanoTime()J
            move-result-wide v$timestampRegister
            :new_frame
            iput-wide v$timestampRegister, v$thisRegister, $lastFrame
            iget-boolean v$temporaryRegister, v$thisRegister, $hasFirstFrame
            if-nez v$temporaryRegister, :has_first_frame
            iput-wide v$timestampRegister, v$thisRegister, $firstFrame
            const/4 v$temporaryRegister, 0x1
            iput-boolean v$temporaryRegister, v$thisRegister, $hasFirstFrame
            :has_first_frame
            iget-wide v$wideRegister, v$thisRegister, $firstFrame
            sub-long/2addr v$timestampRegister, v$wideRegister
            iget-wide v$wideRegister, v$thisRegister, $startOffset
            const-wide/32 v$factorRegister, $NANOSECONDS_PER_MILLISECOND
            mul-long/2addr v$wideRegister, v$factorRegister
            add-long/2addr v$timestampRegister, v$wideRegister
        """,
    )
}

context(patchContext: BytecodePatchContext)
private fun requestKeyframeUntilMuxerStarts() {
    val encoderClass = MuxerNotStartedFingerprint.originalClassDef
    val codecField = encoderClass.fields.first { it.type == "Landroid/media/MediaCodec;" }
    val codec = "${encoderClass.type}->${codecField.name}:${codecField.type}"

    MuxerNotStartedFingerprint.let { fingerprint ->
        val insertIndex = fingerprint.instructionMatches[0].index

        fingerprint.method.apply {
            val registers = getFreeRegisterProvider(insertIndex, 4)
            val codecRegister = registers.getFreeRegister4Bit()
            val parametersRegister = registers.getFreeRegister4Bit()
            val keyRegister = registers.getFreeRegister4Bit()
            val valueRegister = registers.getFreeRegister4Bit()

            addInstructions(
                insertIndex,
                """
                    iget-object v$codecRegister, p0, $codec
                    new-instance v$parametersRegister, Landroid/os/Bundle;
                    invoke-direct {v$parametersRegister}, Landroid/os/Bundle;-><init>()V
                    const-string v$keyRegister, "request-sync"
                    const/4 v$valueRegister, 0x0
                    invoke-virtual {v$parametersRegister, v$keyRegister, v$valueRegister}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V
                    invoke-virtual {v$codecRegister, v$parametersRegister}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V
                """,
            )
        }
    }
}

package app.xperia.patches.sony.stream

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.xperia.patches.sony.SONY_CAMERA

private const val EXTENSION_CLASS = "Lapp/xperia/extension/sony/camera/RawStreamer;"
private const val MANAGER = "Ljp/co/sony/mc/camera/rtmp/RtmpManager;"
private const val BYTE_BUFFER = "Ljava/nio/ByteBuffer;"
private const val BUFFER_INFO = "Landroid/media/MediaCodec\$BufferInfo;"

/** RtmpManager method → (parameters, registers handed to the extension, extension method signature). */
private class Hook(val name: String, val parameters: List<String>, val args: String, val call: String)

private val hooks = listOf(
    Hook(
        "connect", listOf("I", "Z", "I", "I", "Ljava/lang/String;", "Ljava/lang/String;", "Z"),
        "p0, p5, p6", "connect(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Z",
    ),
    Hook("setVideoInfo", listOf(BYTE_BUFFER, BYTE_BUFFER, BYTE_BUFFER), "p1, p2, p3", "setVideoInfo($BYTE_BUFFER$BYTE_BUFFER$BYTE_BUFFER)Z"),
    Hook("sendVideo", listOf(BYTE_BUFFER, BUFFER_INFO), "p1, p2", "sendVideo($BYTE_BUFFER$BUFFER_INFO)Z"),
    Hook("sendAudio", listOf(BYTE_BUFFER, BUFFER_INFO), "p1, p2", "sendAudio($BYTE_BUFFER$BUFFER_INFO)Z"),
    Hook("disconnect", emptyList(), "", "disconnect()Z"),
)

/**
 * Sony's live streaming drives com.pedro RtmpClient through RtmpManager (connect / setVideoInfo /
 * sendVideo / sendAudio / disconnect). Each entry point first asks RawStreamer whether it owns the
 * session (connect mode PC via USB / PC via Wi-Fi, see RawConnectModePatch); if so the original RTMP
 * code is skipped.
 */
@Suppress("unused")
val rawH264StreamPatch = bytecodePatch(
    name = "Raw H.264 stream",
    description = "Low-latency transport for Live streaming: the encoded H.264 is sent to the PC as a plain " +
            "TCP stream instead of RTMP (~0.2 s glass-to-glass with Standard stabilization). Receive with " +
            "gst-launch-1.0 tcpserversrc port=6970 ! h264parse ! avdec_h264 ! ... Video only.",
) {
    compatibleWith(SONY_CAMERA)

    extendWith("extensions/sony-camera.mpe")

    execute {
        hooks.forEach { hook ->
            val method = Fingerprint(
                definingClass = MANAGER,
                name = hook.name,
                parameters = hook.parameters,
                returnType = "V",
            ).method
            val first = method.getInstruction(0)
            method.addInstructionsWithLabels(
                0,
                """
                    invoke-static { ${hook.args} }, $EXTENSION_CLASS->${hook.call}
                    move-result v0
                    if-eqz v0, :original
                    return-void
                """,
                ExternalLabel("original", first),
            )
        }
    }
}

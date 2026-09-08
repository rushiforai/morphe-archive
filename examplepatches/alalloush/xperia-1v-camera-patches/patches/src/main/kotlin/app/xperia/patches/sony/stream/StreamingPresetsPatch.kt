package app.xperia.patches.sony.stream

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.xperia.patches.sony.SONY_CAMERA
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/xperia/extension/sony/camera/StreamEncoder;"
private const val PARAMETERS = "Ljp/co/sony/mc/camera/configuration/parameters/"
private const val CAPTURING_MODE = "${PARAMETERS}CapturingMode;"
private const val CAMERA_ID = "Ljp/co/sony/mc/camera/device/CameraInfo\$CameraId;"
private const val DIALOG_ID = "Ljp/co/sony/mc/camera/view/messagedialog/DialogId;"
private const val RECORDING_PROFILE = "Ljp/co/sony/mc/camera/recorder/RecordingProfile;"

/**
 * Live streaming is pinned to 720p/1080p at 30 fps by three app-side checks; the camera pipeline and
 * encoder behind them already handle 60/120 fps and 4K (same code as recording). This patch turns the
 * checks off, so the Video size / Frame rate settings offer whatever the camera supports, and sets the
 * encoder bitrate/GOP for the chosen mode.
 */
@Suppress("unused")
val streamingPresetsPatch = bytecodePatch(
    name = "Streaming presets",
    description = "Unlocks 1080p60/120 and 4K30/60 in Live streaming (camera-capability filtered) and sets " +
            "the streaming encoder bitrate and keyframe interval.",
) {
    compatibleWith(SONY_CAMERA)

    extendWith("extensions/sony-camera.mpe")

    val bitrateKbps by intOption(
        key = "streamingBitrateKbps",
        default = 0,
        title = "Streaming bitrate (kbit/s)",
        description = "0 = automatic: 0.1 bit per pixel per frame (1080p30 6 Mbit/s, 1080p60 12, 4K30 25, 4K60 50).",
    )
    val keyframeSeconds by intOption(
        key = "streamingKeyframeSeconds",
        default = 1,
        title = "Streaming keyframe interval (s)",
        description = "Seconds between keyframes. 1 keeps recovery from a lost packet short; Sony uses 2.",
    )

    execute {
        // 1. Video size / frame rate option lists: the `isStreaming()` checks that replace the capability
        //    list with [HD, FULL_HD] / [30] read as false.
        listOf(
            Fingerprint(definingClass = "${PARAMETERS}VideoSize;", name = "getOptions",
                parameters = listOf(CAPTURING_MODE, CAMERA_ID, "Ljp/co/sony/mc/camera/configuration/Configurations;"),
                returnType = "[${PARAMETERS}VideoSize;"),
            Fingerprint(definingClass = "${PARAMETERS}VideoFps\$Companion;", name = "getOptions",
                parameters = listOf(CAPTURING_MODE, CAMERA_ID, "${PARAMETERS}VideoSize;"),
                returnType = "[${PARAMETERS}VideoFps;"),
        ).forEach { fingerprint ->
            fingerprint.method.apply {
                val call = instructions.indexOfFirst { insn ->
                    insn.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((insn as ReferenceInstruction).reference as MethodReference).let {
                            it.definingClass == CAPTURING_MODE && it.name == "isStreaming"
                        }
                }
                if (call < 0) throw PatchException("isStreaming() not found in ${fingerprint.definingClass}")
                val result = getInstruction(call + 1)
                if (result.opcode != Opcode.MOVE_RESULT) throw PatchException("Unexpected ${result.opcode} after isStreaming()")
                val register = (result as OneRegisterInstruction).registerA
                replaceInstruction(call + 1, "const/4 v$register, 0x0")
            }
        }

        // 2. The "selected due to streaming" dialog that vetoes 60/120 fps and 4K: never.
        Fingerprint(
            definingClass = "Ljp/co/sony/mc/camera/setting/SettingAppearanceChecker;",
            name = "getKeyDialogForStreaming",
            parameters = listOf("Ljp/co/sony/mc/camera/setting/CameraSettingsHolder;"),
            returnType = DIALOG_ID,
        ).method.apply {
            val body = instructions.size
            addInstructions(
                0,
                """
                    sget-object p0, $DIALOG_ID->DLG_INVALID:$DIALOG_ID
                    return-object p0
                """,
            )
            removeInstructions(instructions.size - body, body)
        }

        // 3. Encoder format: bitrate / GOP / low-latency keys for streaming profiles.
        Fingerprint(
            definingClass = RECORDING_PROFILE,
            name = "createMediaFormat",
            parameters = listOf(RECORDING_PROFILE, "I"),
            returnType = "Landroid/media/MediaFormat;",
        ).method.apply {
            val returns = instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
            if (returns.isEmpty()) throw PatchException("createMediaFormat has no return")
            returns.reversed().forEach { index ->
                val register = (getInstruction(index) as OneRegisterInstruction).registerA
                addInstructions(index, "invoke-static { p0, v$register }, $EXTENSION_CLASS->tune(Ljava/lang/Object;Landroid/media/MediaFormat;)V")
            }
        }

        // 4. Bake the options into the extension.
        mapOf(
            "bitrateKbpsOption" to (bitrateKbps ?: 0),
            "keyframeIntervalOption" to (keyframeSeconds ?: 1),
        ).forEach { (name, value) ->
            Fingerprint(definingClass = EXTENSION_CLASS, name = name, parameters = emptyList(), returnType = "I").method.apply {
                val body = instructions.size
                addInstructions(
                    0,
                    """
                        const v0, $value
                        return v0
                    """,
                )
                removeInstructions(instructions.size - body, body)
            }
        }
    }
}

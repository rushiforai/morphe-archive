package app.morphe.patches.all.screeny

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private val LISTENER_INTERFACES = setOf(
    "Landroid/hardware/display/DisplayManager\$DisplayListener;",
    "Landroid/view/Window\$ScreenRecordingCallback;",
    "Landroid/media/projection/MediaProjection\$Callback;",
)

private val CALLBACK_METHODS = setOf(
    "onDisplayAdded",
    "onDisplayRemoved",
    "onDisplayChanged",
    "onStart",
    "onStop",
    "onCapturedContentResize",
    "onCapturedContentVisibilityChanged",
)

private val DETECTION_TOKENS = listOf(
    "screen_record",
    "screenrecord",
    "isrecording",
    "screen_mirror",
    "com.miui.screenrecorder",
    "com.samsung.app.screenrecorder",
)

@Suppress("unused")
val bypassScreenRecordingDetectionPatch = bytecodePatch(
    name = "Bypass screen recording detection",
    description = "Blinds display/recording callbacks and recorder-package checks.",
    default = false,
) {
    execute {
        classDefForEach { classDef ->
            val mc by lazy { mutableClassDefBy(classDef) }

            // 1. Framework callback implementations (virtual display / recording events).
            if (classDef.interfaces.any { it in LISTENER_INTERFACES }) {
                classDef.methods
                    .filter { it.name in CALLBACK_METHODS && it.returnType == "V" && it.implementation != null }
                    .forEach { mc.findMutableMethodOf(it).returnEarly() }
                return@classDefForEach
            }

            // 2. Boolean detectors checking known recorder packages / recording flags.
            classDef.methods.forEach { method ->
                if (method.returnType != "Z") return@forEach
                val impl = method.implementation ?: return@forEach

                val hit = impl.instructions.any { ins ->
                    ins.opcode == Opcode.CONST_STRING &&
                        ins.getReference<StringReference>()?.string?.lowercase()?.let { s ->
                            DETECTION_TOKENS.any { it in s }
                        } == true
                }
                if (hit) mc.findMutableMethodOf(method).returnEarly(false)
            }
        }
    }
}

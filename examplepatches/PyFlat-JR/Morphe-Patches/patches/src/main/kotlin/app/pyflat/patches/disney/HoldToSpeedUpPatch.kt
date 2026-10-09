package app.pyflat.patches.disney

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.pyflat.patches.shared.findFieldStore
import app.pyflat.patches.shared.holdToSpeedUpPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/pyflat/extension/disney/HoldToSpeedUpPatch;"

private const val SCALE_DETECTOR_ON_TOUCH =
    "Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z"
private const val GESTURE_DETECTOR_ON_TOUCH =
    "Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z"

internal val COMPATIBILITY_DISNEY = Compatibility(
    name = "Disney+",
    packageName = "com.disney.disneyplus",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x0E1A40,
    targets = listOf(
        AppTarget(version = "26.18.0+rc5-2026.10.05"),
    ),
)

// Attaches the main content ExoPlayer to the playback engine.
internal object AttachPlayerFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("] attachPlayer: "),
)

// Player surface touch listener, forwards to the pinch to zoom and tap/double tap detectors.
internal object PlayerTouchListenerFingerprint : Fingerprint(
    name = "onTouch",
    returnType = "Z",
    parameters = listOf("Landroid/view/View;", "Landroid/view/MotionEvent;"),
    custom = { method, _ ->
        method.indexOfCall(SCALE_DETECTOR_ON_TOUCH) >= 0 && method.indexOfCall(GESTURE_DETECTOR_ON_TOUCH) >= 0
    },
)

private fun Method.indexOfCall(method: String) = implementation?.instructions?.indexOfFirst { instruction ->
    (instruction as? ReferenceInstruction)?.reference?.let { (it as? MethodReference)?.toString() } == method
} ?: -1

@Suppress("unused")
val holdToSpeedUpPatch = holdToSpeedUpPatch(COMPATIBILITY_DISNEY, EXTENSION_CLASS) {
    AttachPlayerFingerprint.method.apply {
        // After the "already acquired" check, so ignored players are never picked up.
        val (index, playerRegister) = findFieldStore("Landroidx/media3/exoplayer/ExoPlayer;")

        addInstruction(
            index + 1,
            "invoke-static { v$playerRegister }, $EXTENSION_CLASS->setPlayer(Ljava/lang/Object;)V",
        )
    }

    PlayerTouchListenerFingerprint.method.apply {
        val scaleIndex = indexOfCall(SCALE_DETECTOR_ON_TOUCH)
        val gestureIndex = indexOfCall(GESTURE_DETECTOR_ON_TOUCH)
        if (gestureIndex != scaleIndex + 1) throw PatchException("Unexpected touch listener layout")

        val instructions = implementation!!.instructions
        val scaleCall = instructions.elementAt(scaleIndex) as FiveRegisterInstruction
        val gestureCall = instructions.elementAt(gestureIndex) as FiveRegisterInstruction
        val scaleRegister = scaleCall.registerC
        val eventRegister = scaleCall.registerD
        val gestureRegister = gestureCall.registerC

        // The switch selecting this listener's case is dead in that case, reuse it for the view
        // because p1 is usually out of range for invoke-static.
        val viewRegister = instructions
            .first { it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH }
            .let { (it as OneRegisterInstruction).registerA }
        val registers = listOf(viewRegister, eventRegister, scaleRegister, gestureRegister)
        if (registers.distinct().size != 4 || registers.any { it > 15 }) {
            throw PatchException("Unexpected touch listener registers: $registers")
        }

        removeInstructions(scaleIndex, 2)
        addInstructions(
            scaleIndex,
            """
                move-object/from16 v$viewRegister, p1
                invoke-static { v$viewRegister, v$eventRegister, v$scaleRegister, v$gestureRegister }, $EXTENSION_CLASS->onTouch(Landroid/view/View;Landroid/view/MotionEvent;Landroid/view/ScaleGestureDetector;Landroid/view/GestureDetector;)V
            """,
        )
    }
}

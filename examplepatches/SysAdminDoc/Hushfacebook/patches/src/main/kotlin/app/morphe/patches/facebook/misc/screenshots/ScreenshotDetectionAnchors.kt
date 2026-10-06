/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.screenshots

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * Where Facebook learns of a screenshot or a screen recording, on the 577, 580 and 581 builds.
 *
 * Its screenshot detectors (the feed, Reels, chats, Instant Games, Marketplace, ads and a few
 * more, all on one base class) share one ScreenshotContentObserver, a kept name, which watches the
 * phone's photo library and, in its onChange, looks at each new picture to see whether it's a
 * screenshot and tells the detectors. A check goes first in that onChange and returns on a yes.
 *
 * On Android 14 and newer an activity can ask to be told of screenshots taken of it
 * (registerScreenCaptureCallback, called on Activity, androidx's FragmentActivity and Facebook's
 * cloud streaming activity), and on Android 15 and newer WindowManager reports whether the screen
 * is being recorded (addScreenRecordingCallback, with removeScreenRecordingCallback to stop).
 * Those are framework calls, so each one outside the extension becomes a static call of the
 * extension on the same registers, which makes the call or doesn't.
 */
internal const val DETECTION_PATCH = "Block screenshot detection"

internal const val SCREENSHOT_OBSERVER = "Lcom/facebook/screenshot/ScreenshotContentObserver;"
internal const val ACTIVITY = "Landroid/app/Activity;"
private const val WINDOW_MANAGER = "Landroid/view/WindowManager;"
private const val EXECUTOR = "Ljava/util/concurrent/Executor;"
private const val CONSUMER = "Ljava/util/function/Consumer;"
private const val CAPTURE_CALLBACK = "Landroid/app/Activity\$ScreenCaptureCallback;"

private const val DETECTION = "$EXTENSION_PACKAGE/misc/ScreenshotDetection;"
internal const val IGNORES_CHANGE = "$DETECTION->ignoresChange()Z"
internal const val REGISTER_CAPTURE = "$DETECTION->registerScreenCaptureCallback($ACTIVITY$EXECUTOR$CAPTURE_CALLBACK)V"
internal const val ADD_RECORDING = "$DETECTION->addScreenRecordingCallback($WINDOW_MANAGER$EXECUTOR$CONSUMER)I"
internal const val REMOVE_RECORDING = "$DETECTION->removeScreenRecordingCallback($WINDOW_MANAGER$CONSUMER)V"

/** The kinds of framework call the patch sends to the extension. */
internal enum class DetectionCall(val method: String, val parameters: String, val returnType: String, val own: String) {
    CAPTURE("registerScreenCaptureCallback", "$EXECUTOR$CAPTURE_CALLBACK", "V", REGISTER_CAPTURE),
    ADD("addScreenRecordingCallback", "$EXECUTOR$CONSUMER", "I", ADD_RECORDING),
    REMOVE("removeScreenRecordingCallback", CONSUMER, "V", REMOVE_RECORDING),
}

/** Whether [method] is the screenshot observer's onChange(boolean, Uri). */
internal fun isObserverChange(method: Method): Boolean =
    method.definingClass == SCREENSHOT_OBSERVER && method.name == "onChange" && method.returnType == "V" &&
        method.parameterTypes.map(CharSequence::toString) == listOf("Z", "Landroid/net/Uri;")

/**
 * The kind of detection call [instruction] makes, or null. A screen capture registration is
 * matched on any class, since Activity's subclasses call it as their own, and [isActivity] says
 * whether that class is one; the recording calls are WindowManager's.
 */
internal fun detectionCall(instruction: Instruction, isActivity: (String) -> Boolean): DetectionCall? {
    val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    val kind = DetectionCall.entries.singleOrNull { kind ->
        call.name == kind.method && call.returnType == kind.returnType &&
            call.parameterTypes.joinToString("") == kind.parameters
    } ?: return null
    return when (kind) {
        DetectionCall.CAPTURE -> kind.takeIf {
            (instruction.opcode == Opcode.INVOKE_VIRTUAL || instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
                isActivity(call.definingClass)
        }
        else -> kind.takeIf {
            call.definingClass == WINDOW_MANAGER &&
                (instruction.opcode == Opcode.INVOKE_INTERFACE || instruction.opcode == Opcode.INVOKE_INTERFACE_RANGE)
        }
    }
}

/** Puts the extension's check first in the observer's onChange, returning on a yes. Uses one local. */
internal fun MutableMethod.ignoreChangesWhenBlocked() {
    if (localRegisterCount() < 1) throw PatchException("$DETECTION_PATCH: $definingClass->$name has no locals")
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $IGNORES_CHANGE
            move-result v0
            if-eqz v0, :change
            return-void
        """,
        ExternalLabel("change", getInstruction(0)),
    )
}

/** Sends each detection call in this method to the extension, on the same registers. Answers them by kind. */
internal fun MutableMethod.sendDetectionCalls(isActivity: (String) -> Boolean): List<DetectionCall> {
    val sites = (implementation ?: return emptyList()).instructions.withIndex()
        .mapNotNull { (index, instruction) -> detectionCall(instruction, isActivity)?.let { Triple(index, instruction, it) } }
        .toList()
    sites.asReversed().forEach { (index, instruction, kind) ->
        val arguments = when (instruction) {
            is RegisterRangeInstruction ->
                "invoke-static/range { v${instruction.startRegister} .. v${instruction.startRegister + instruction.registerCount - 1} }"
            is FiveRegisterInstruction -> "invoke-static { " + listOf(
                instruction.registerC, instruction.registerD, instruction.registerE,
            ).take(instruction.registerCount).joinToString { "v$it" } + " }"
            else -> throw PatchException("$DETECTION_PATCH: $definingClass->$name calls ${kind.method} in an unexpected form")
        }
        replaceInstruction(index, "$arguments, ${kind.own}")
    }
    return sites.map { it.third }
}

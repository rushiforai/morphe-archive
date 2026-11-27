package app.morphe.patches.all.misc.screenshot

import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.util.formatCount
import app.morphe.patches.util.patchLogger
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.util.MethodUtil
import app.morphe.util.getReference

private val registerScreenCaptureCallbackMethodReference = ImmutableMethodReference(
    "Landroid/app/Activity;",
    "registerScreenCaptureCallback",
    listOf(
        "Ljava/util/concurrent/Executor;",
        "Landroid/app/Activity\$ScreenCaptureCallback;",
    ),
    "V",
)

private val unregisterScreenCaptureCallbackMethodReference = ImmutableMethodReference(
    "Landroid/app/Activity;",
    "unregisterScreenCaptureCallback",
    listOf(
        "Landroid/app/Activity\$ScreenCaptureCallback;",
    ),
    "V",
)

@Suppress("unused")
val preventScreenshotDetectionPatch = bytecodePatch(
    name = "Prevent screenshot detection",
    description = "Removes the registration of all screen capture callbacks. This prevents the app from detecting screenshots.",
    default = false,
) {
    category("Screenshots")

    execute {
        var removedCount = 0

        classDefForEach { classDef ->
            val mutableClass by lazy {
                mutableClassDefBy(classDef)
            }

            classDef.methods.forEach { method ->
                if (method.implementation == null) return@forEach

                val mutableMethod by lazy {
                    mutableClass.findMutableMethodOf(method)
                }

                val indicesToRemove = mutableListOf<Int>()

                method.implementation!!.instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@forEachIndexed

                    val reference = instruction.getReference<com.android.tools.smali.dexlib2.iface.reference.MethodReference>()
                        ?: return@forEachIndexed

                    if (
                        MethodUtil.methodSignaturesMatch(reference, registerScreenCaptureCallbackMethodReference) ||
                        MethodUtil.methodSignaturesMatch(reference, unregisterScreenCaptureCallbackMethodReference)
                    ) {
                        indicesToRemove.add(index)
                    }
                }

                indicesToRemove.asReversed().forEach { index ->
                    mutableMethod.removeInstruction(index)
                    removedCount++
                }
            }
        }

        if (removedCount == 0) {
            patchLogger.warning("No screen capture callback registrations found to remove")
        } else {
            patchLogger.info(
                "Removed ${formatCount(removedCount, "screen capture callback registration", "screen capture callback registrations")}",
            )
        }
    }
}

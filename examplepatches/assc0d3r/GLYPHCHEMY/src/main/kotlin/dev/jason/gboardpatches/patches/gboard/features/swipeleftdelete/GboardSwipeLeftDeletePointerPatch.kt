package dev.jason.gboardpatches.patches.gboard.features.swipeleftdelete

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerFeature
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerFeatureSpec
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerTransformationAdapter
import dev.jason.gboardpatches.patches.gboard.shared.gboardPointerOwnerFeaturePatch
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.pointerOwnerEntryCleanupCount
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId

private const val TOUCH_EVENT_TYPE = "Landroid/view/MotionEvent;"

internal val gboardSwipeLeftDeletePointerTransformation =
    GboardPointerOwnerTransformationAdapter { context ->
        val ownerMethod = context.pointerOwnerMethod
        val captureReference = RuntimeAbiCatalog
            .abi(RuntimeCallId.SWIPE_LEFT_DELETE_RUNTIME_CAPTURE_KEY)
            .reference
        if (ownerMethod.implementation?.instructions
                ?.any { instruction -> instruction.isMethodReference(captureReference) } == true
        ) {
            return@GboardPointerOwnerTransformationAdapter
        }

        val captureDelegate = RuntimeCallEmitter.invoke(
            RuntimeCallId.SWIPE_LEFT_DELETE_RUNTIME_CAPTURE_KEY,
            "v15",
        )
        ownerMethod.addInstructions(ownerMethod.entryCopyOffset(), captureDelegate)

        val finishDelegate = RuntimeCallEmitter.invoke(
            RuntimeCallId.SWIPE_LEFT_DELETE_RUNTIME_ON_POINTER_FINISH,
            "",
        )
        val resetDelegate = RuntimeCallEmitter.invoke(
            RuntimeCallId.SWIPE_LEFT_DELETE_RUNTIME_RESET,
            "",
        )
        // Appended after the existing cleanup entry chain so the family's ordered cleanup checks
        // keep seeing the other features' delegates first.
        context.pointerResetMethod.addInstructions(
            context.pointerResetMethod.pointerOwnerEntryCleanupCount(context.targets),
            resetDelegate,
        )
        // The pre-reset runs at the end of every pointer session, right after the release is
        // dispatched, so the stray committed key is removed there.
        val preReset = context.targets.pointerPreReset.resolve(context.ownerClass)
        preReset.addInstructions(0, resetDelegate)
        preReset.addInstructions(0, finishDelegate)

        val updateTargetView = context.ownerClass.methods.firstOrNull { method ->
            method.name == context.targets.updateTargetViewName &&
                method.returnType == "V" &&
                method.parameterTypes == listOf(TOUCH_EVENT_TYPE, "I")
        } ?: error("Unable to find the Gboard pointer target update method")

        updateTargetView.addInstructions(
            0,
            """
                ${RuntimeCallEmitter.invoke(
                    RuntimeCallId.SWIPE_LEFT_DELETE_RUNTIME_HANDLE_TOUCH,
                    "p0, p1, p2",
                )}

                move-result v0

                if-eqz v0, :jasondev_swipe_left_touch_continue

                return-void

                :jasondev_swipe_left_touch_continue

                nop
            """.trimIndent(),
        )

        context.pointerCancelMethod.addInstructions(
            context.pointerCancelMethod.pointerOwnerEntryCleanupCount(context.targets),
            resetDelegate,
        )
    }

/**
 * The long-press feature expands the pointer owner and copies its parameters into the legacy
 * registers at the very start of the method. Insert after those copies so the verification of the
 * expanded entry stays intact.
 */
private fun MutableMethod.entryCopyOffset(): Int {
    val instructions = implementation?.instructions ?: return 0
    val expected = listOf(
        Triple(Opcode.MOVE_OBJECT_FROM16, 14, 21),
        Triple(Opcode.MOVE_OBJECT_FROM16, 15, 22),
        Triple(Opcode.MOVE_FROM16, 16, 23),
        Triple(Opcode.MOVE_FROM16, 17, 24),
        Triple(Opcode.MOVE_WIDE_FROM16, 18, 25),
        Triple(Opcode.MOVE_FROM16, 20, 27),
    )
    val present = expected.withIndex().all { (index, copy) ->
        val instruction = instructions.getOrNull(index) as? TwoRegisterInstruction
            ?: return@all false
        instruction.opcode == copy.first &&
            instruction.registerA == copy.second &&
            instruction.registerB == copy.third
    }
    return if (present) expected.size else 0
}

private val gboardSwipeLeftDeletePointerSpec = GboardPointerOwnerFeatureSpec(
    feature = GboardPointerOwnerFeature.SWIPE_LEFT_DELETE,
    transformation = gboardSwipeLeftDeletePointerTransformation,
)

internal val gboardSwipeLeftDeletePointerPatch = gboardPointerOwnerFeaturePatch(
    description = "在 pointer-owner 家族攔截向左滑動手勢並轉為刪除。",
    spec = gboardSwipeLeftDeletePointerSpec,
)

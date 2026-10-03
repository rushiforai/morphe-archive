/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.patches.facebook.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import app.morphe.patches.facebook.shared.Constants
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val extensionPatch = sharedExtensionPatch("facebook", false)

private const val OPTIMIZER =
    "Lapp/morphe/extension/facebook/PerformanceOptimizer;"
private const val HAPTIC_ONE =
    "$OPTIMIZER->performHapticFeedback(Landroid/view/View;I)Z"
private const val HAPTIC_TWO =
    "$OPTIMIZER->performHapticFeedback(Landroid/view/View;II)Z"
private const val VIEW_HAPTIC_ONE =
    "Landroid/view/View;->performHapticFeedback(I)Z"
private const val VIEW_HAPTIC_TWO =
    "Landroid/view/View;->performHapticFeedback(II)Z"

private fun Instruction.hapticOverride(): String? {
    val reference = (this as? ReferenceInstruction)?.reference
        as? MethodReference ?: return null
    return when (reference.toString()) {
        VIEW_HAPTIC_ONE -> HAPTIC_ONE
        VIEW_HAPTIC_TWO -> HAPTIC_TWO
        else -> null
    }
}

private fun MutableMethod.rerouteHaptics(): Int {
    val sites = (implementation ?: return 0).instructions.withIndex()
        .filter { (_, instruction) -> instruction.hapticOverride() != null }
    sites.asReversed().forEach { (index, instruction) ->
        val target = requireNotNull(instruction.hapticOverride())
        val registers = when (instruction) {
            is RegisterRangeInstruction ->
                (instruction.startRegister until
                    instruction.startRegister + instruction.registerCount).toList()
            is FiveRegisterInstruction ->
                listOf(
                    instruction.registerC,
                    instruction.registerD,
                    instruction.registerE,
                    instruction.registerF,
                    instruction.registerG,
                ).take(instruction.registerCount)
            else -> error("Unsupported haptic call form ${instruction.opcode}")
        }
        val replacement = if (registers.all { it < 16 }) {
            "invoke-static {${registers.joinToString(", ") { "v$it" }}}, $target"
        } else {
            "invoke-static/range {v${registers.first()} .. v${registers.last()}}, $target"
        }
        replaceInstruction(index, replacement)
    }
    return sites.size
}

@Suppress("unused")
val optimizeFacebookPatch = bytecodePatch(
    name = "Optimize Facebook",
    description = "Suppresses explicit GC stalls, trims extension caches under memory pressure, and reduces render-time reflection.",
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(extensionPatch)

    execute {
        val onCreate = OptimizeFacebookApplicationOnCreateFingerprint.method
        val returnIndex = onCreate.implementation!!.instructions
            .indexOfLast { instruction -> instruction.opcode == Opcode.RETURN_VOID }
        check(returnIndex >= 0) {
            "FacebookApplication.onCreate return was not resolved"
        }
        onCreate.addInstructions(
            returnIndex,
            """
                invoke-static {p0}, $OPTIMIZER->initialize(Landroid/app/Application;)V
            """.trimIndent(),
        )

        var explicitGcCalls = 0
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lapp/morphe/extension/")) {
                return@classDefForEach
            }

            classDef.methods.forEach methodLoop@{ method ->
                val implementation = method.implementation ?: return@methodLoop
                val gcCallIndices = implementation.instructions.withIndex()
                    .filter { (_, instruction) ->
                        val reference =
                            (instruction as? ReferenceInstruction)
                                ?.reference as? MethodReference
                                ?: return@filter false
                        reference.name == "gc" &&
                            reference.parameterTypes.isEmpty() &&
                            reference.returnType == "V" &&
                            (
                                reference.definingClass == "Ljava/lang/System;" ||
                                    reference.definingClass == "Ljava/lang/Runtime;"
                                )
                    }
                    .map { (index, _) -> index }
                if (gcCallIndices.isEmpty()) return@methodLoop

                val mutableMethod = mutableClassDefBy(classDef)
                    .findMutableMethodOf(method)
                gcCallIndices.forEach { index ->
                    mutableMethod.replaceInstruction(
                        index,
                        "invoke-static {}, $OPTIMIZER->requestExplicitGc()V",
                    )
                    explicitGcCalls++
                }
            }
        }
        check(explicitGcCalls > 0) {
            "No explicit Facebook GC call sites were found"
        }
        println("[OptimizeFacebook] guardedExplicitGcCalls=$explicitGcCalls")

        var hapticSites = 0
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lapp/morphe/extension/")) {
                return@classDefForEach
            }
            classDef.methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                if (implementation.instructions.none { it.hapticOverride() != null }) {
                    return@forEach
                }
                hapticSites += mutableClassDefBy(classDef)
                    .findMutableMethodOf(method)
                    .rerouteHaptics()
            }
        }
        check(hapticSites > 0) {
            "No Facebook haptic feedback call sites were found"
        }
        println("[OptimizeFacebook] reroutedHaptics=$hapticSites")
    }
}

object OptimizeFacebookApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/katana/app/FacebookApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

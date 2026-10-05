package dev.jason.gboardpatches.patches.gboard.features.frostedglass

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.shared.applyVoidExitLifecycleDelegate
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.methodCallIndices
import dev.jason.gboardpatches.patches.gboard.shared.mutableClass
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val OWNER = "Loup;"
private val onConfigureWindow = GboardMethodTarget(OWNER, "onConfigureWindow", listOf("Landroid/view/Window;", "Z", "Z"), "V")
private val onWindowShown = GboardMethodTarget(OWNER, "onWindowShown", emptyList(), "V")
private val onWindowHidden = GboardMethodTarget(OWNER, "onWindowHidden", emptyList(), "V")

internal val gboardFrostedGlassLifecyclePatch = bytecodePatch(description = "在 Gboard IME Window lifecycle 加入 Frosted Glass runtime delegate。") {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)
    execute {
        findMutableMethodOrThrow(onWindowShown).addInstructions(0, RuntimeCallEmitter.invoke(RuntimeCallId.FROSTED_GLASS_RUNTIME_ON_INPUT_VIEW_STARTED, "p0 .. p0"))
        findMutableMethodOrThrow(onWindowHidden).applyVoidExitLifecycleDelegate(RuntimeCallId.FROSTED_GLASS_RUNTIME_ON_INPUT_WINDOW_HIDDEN, "p0")
        val configure = findMutableMethodOrThrow(onConfigureWindow)
        val patched = configure.applyFrostedGlassConfigureDelegate()
        if (patched !== configure) {
            val methods = mutableClass(OWNER).methods
            check(methods.remove(configure) && methods.add(patched)) {
                "Could not replace expanded $FROSTED_CONFIGURE_DESCRIPTOR"
            }
        }
    }
}

private fun MutableMethod.applyFrostedGlassConfigureDelegate(): MutableMethod {
    val implementation = implementation ?: error("$FROSTED_CONFIGURE_DESCRIPTOR has no implementation")
    if (implementation.registerCount == FROSTED_CONFIGURE_PATCHED_REGISTERS) {
        check(implementation.instructions.count { it.isMethodReference(FROSTED_CONFIGURE_RUNTIME_DESCRIPTOR) } == 1)
        return this
    }
    check(implementation.registerCount == FROSTED_CONFIGURE_STOCK_REGISTERS) {
        "Unexpected register count in $FROSTED_CONFIGURE_DESCRIPTOR: ${implementation.registerCount}"
    }
    val expanded = ImmutableMethod(
        definingClass, name, parameters, returnType, accessFlags, annotations, hiddenApiRestrictions,
        ImmutableMethodImplementation(
            FROSTED_CONFIGURE_PATCHED_REGISTERS,
            implementation.instructions, implementation.tryBlocks, implementation.debugItems,
        ),
    ).toMutable()
    expanded.addInstructions(0, FROSTED_CONFIGURE_ENTRY_COPIES)
    val layoutCalls = expanded.methodCallIndices("Landroid/view/Window;", "setLayout", "V", listOf("I", "I"))
    check(layoutCalls.size == 1) { "Expected exactly one Window.setLayout in $FROSTED_CONFIGURE_DESCRIPTOR" }
    expanded.addInstructions(layoutCalls.single() + 1, FROSTED_CONFIGURE_RUNTIME_DELEGATE)
    return expanded
}

private const val FROSTED_CONFIGURE_STOCK_REGISTERS = 11
private const val FROSTED_CONFIGURE_PATCHED_REGISTERS = 17
private const val FROSTED_CONFIGURE_DESCRIPTOR = "Loup;->onConfigureWindow(Landroid/view/Window;ZZ)V"
private val FROSTED_CONFIGURE_RUNTIME_DESCRIPTOR =
    RuntimeAbiCatalog.abi(RuntimeCallId.FROSTED_GLASS_RUNTIME_AFTER_CONFIGURE_WINDOW).reference
private val FROSTED_CONFIGURE_ENTRY_COPIES = """
    move-object/from16 v7, p0
    move-object/from16 v8, p1
    move/from16 v9, p2
    move/from16 v10, p3
    move/from16 v11, p2
    move/from16 v12, p3
""".trimIndent()
private val FROSTED_CONFIGURE_RUNTIME_DELEGATE =
    RuntimeCallEmitter.invoke(RuntimeCallId.FROSTED_GLASS_RUNTIME_AFTER_CONFIGURE_WINDOW, "p1, v11, v12")

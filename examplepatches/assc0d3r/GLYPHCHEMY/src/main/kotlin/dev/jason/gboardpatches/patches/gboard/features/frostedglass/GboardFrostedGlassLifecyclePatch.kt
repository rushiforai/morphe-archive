package dev.jason.gboardpatches.patches.gboard.features.frostedglass

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.applyVoidExitLifecycleDelegate
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardCompatibility18_8
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.methodCallIndices
import dev.jason.gboardpatches.patches.gboard.shared.mutableClass
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId

internal val gboardFrostedGlassLifecyclePatch = bytecodePatch(description = "Add the Frosted Glass runtime delegate to the Gboard IME window lifecycle.") {
    compatibleWith(gboardCompatibility18_8())
    dependsOn(gboardPatchesExtensionCarrierPatch)
    execute {
        // Resolve admitted bindings only when this contribution executes. A sparse build
        // must still be able to load the patch class when Frosted Glass is unselected.
        val targets = frostedGlassTargets(this)
        val modelType = targets.navParamsConstructor.ownerDescriptor
        findMutableMethodOrThrow(targets.shown).addInstructions(0, RuntimeCallEmitter.invoke(RuntimeCallId.FROSTED_GLASS_RUNTIME_ON_INPUT_VIEW_STARTED, "p0 .. p0"))
        findMutableMethodOrThrow(targets.hidden).applyVoidExitLifecycleDelegate(RuntimeCallId.FROSTED_GLASS_RUNTIME_ON_INPUT_WINDOW_HIDDEN, "p0")
        val configure = findMutableMethodOrThrow(targets.configure)
        val patched = configure.applyFrostedGlassConfigureDelegate(targets.configure.reference)
        if (patched !== configure) {
            val methods = mutableClass(targets.configure.ownerDescriptor).methods
            check(methods.remove(configure) && methods.add(patched)) {
                "Could not replace expanded ${targets.configure.reference}"
            }
        }
        val nav = targets.navApply.resolve(this)
        check(nav.accessFlags and AccessFlags.STATIC.value == 0 && nav.returnType == "V"
            && nav.parameterTypes == listOf("Landroid/view/Window;", modelType))
        targets.navParamsConstructor.resolve(this)
        listOf(targets.navColor, targets.navDivider, targets.navBody, targets.navHeader,
            targets.navLight).forEach { binding ->
            val field = binding.resolve(this)
            check(field.accessFlags and AccessFlags.FINAL.value != 0
                && field.accessFlags and AccessFlags.STATIC.value == 0)
        }
        nav.applySeamlessNavBarDelegates(modelType)
    }
}

/** Replaces the applied model at entry and lets the runtime re-style the Window at exit. */
internal fun MutableMethod.applySeamlessNavBarDelegates(modelType: String) {
    val implementation = implementation ?: error("Navigation method has no implementation")
    val instructions = implementation.instructions.toList()
    val entry = RuntimeAbiCatalog.abi(RuntimeCallId.FROSTED_GLASS_RUNTIME_ON_APPLY_NAV_BAR_ENTRY).reference
    if (instructions.any { it.isMethodReference(entry) }) return
    val modelRegister = implementation.registerCount - 1
    check(instructions.any { it.opcode == Opcode.RETURN_VOID }) { "Navigation method has no void exit" }
    check(instructions.none {
        it is OneRegisterInstruction && it.opcode.setsRegister() &&
            (it.registerA == modelRegister || it.opcode.setsWideRegister() && it.registerA + 1 == modelRegister)
    }) { "Navigation model register is overwritten; exit delegate would receive an invalid model" }
    addInstructions(0, navBarEntryDelegate(modelType))
    applyVoidExitLifecycleDelegate(RuntimeCallId.FROSTED_GLASS_RUNTIME_ON_APPLY_NAV_BAR_EXIT, "p2")
}

private fun navBarEntryDelegate(modelType: String) = """
    ${RuntimeCallEmitter.invoke(RuntimeCallId.FROSTED_GLASS_RUNTIME_ON_APPLY_NAV_BAR_ENTRY, "p1, p0, p2")}
    move-result-object p2
    check-cast p2, $modelType
""".trimIndent()

private fun MutableMethod.applyFrostedGlassConfigureDelegate(descriptor: String): MutableMethod {
    val implementation = implementation ?: error("$descriptor has no implementation")
    if (implementation.registerCount == FROSTED_CONFIGURE_PATCHED_REGISTERS) {
        check(implementation.instructions.count { it.isMethodReference(FROSTED_CONFIGURE_RUNTIME_DESCRIPTOR) } == 1)
        return this
    }
    check(implementation.registerCount == FROSTED_CONFIGURE_STOCK_REGISTERS) {
        "Unexpected register count in $descriptor: ${implementation.registerCount}"
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
    check(layoutCalls.size == 1) { "Expected exactly one Window.setLayout in $descriptor" }
    expanded.addInstructions(layoutCalls.single() + 1, FROSTED_CONFIGURE_RUNTIME_DELEGATE)
    return expanded
}

private const val FROSTED_CONFIGURE_STOCK_REGISTERS = 11
private const val FROSTED_CONFIGURE_PATCHED_REGISTERS = 17
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

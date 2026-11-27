package app.morphe.patches.all.misc.screenshot

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.util.formatCount
import app.morphe.patches.util.patchLogger
import app.morphe.patches.util.transformation.InvocationReplacement
import app.morphe.patches.util.transformation.findInvokeVirtualIndices
import app.morphe.patches.util.transformation.replaceInvokeVirtualWithExtension
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS_DESCRIPTOR_PREFIX =
    "Lapp/morphe/extension/all/misc/screenshot/removerestriction/RemoveScreenshotRestrictionPatch"
private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_CLASS_DESCRIPTOR_PREFIX;"

private const val WINDOW_CLASS = "Landroid/view/Window;"
private const val LAYOUT_PARAMS_CLASS = "Landroid/view/WindowManager\$LayoutParams;"

@Suppress("unused")
val removeScreenshotRestrictionPatch = bytecodePatch(
    name = "Remove screenshot restriction",
    description = "Removes the restriction of taking screenshots in apps that normally wouldn't allow it.",
    default = false,
) {
    extendWith("extensions/all/misc/screenshot/remove-screenshot-restriction.mpe")

    category("Screenshots")

    execute {
        var interceptedCount = 0
        var flagWriteCount = 0

        classDefForEach { classDef ->
            // Skip the extension class itself to avoid infinite recursion.
            if (classDef.type.startsWith(EXTENSION_CLASS_DESCRIPTOR_PREFIX)) return@classDefForEach

            val mutableClass by lazy { mutableClassDefBy(classDef) }

            classDef.methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach

                val mutableMethod by lazy { mutableClass.findMutableMethodOf(method) }

                // Replace Window#addFlags / Window#setFlags with extension stubs.
                MethodCall.entries.forEach { call ->
                    val indices = method.findInvokeVirtualIndices(call)
                    if (indices.isNotEmpty()) {
                        mutableMethod.replaceInvokeVirtualWithExtension(
                            EXTENSION_CLASS_DESCRIPTOR,
                            call,
                            indices,
                        )
                        interceptedCount += indices.size
                    }
                }

                // Strip FLAG_SECURE from direct IPUT writes to LayoutParams#flags.
                val flagWriteIndices = layoutParamsIputIndices(implementation)
                flagWriteIndices.forEach { index ->
                    val register =
                        (implementation.instructions.elementAt(index) as Instruction22c).registerA
                    mutableMethod.addInstructions(
                        index,
                        "and-int/lit16 v$register, v$register, -0x2001",
                    )
                }
                flagWriteCount += flagWriteIndices.size
            }
        }

        if (interceptedCount == 0 && flagWriteCount == 0) {
            patchLogger.warning("No screenshot restrictions found to remove")
        } else {
            if (interceptedCount > 0) {
                patchLogger.info("Intercepted ${formatCount(interceptedCount, "call", "calls")}")
            }
            if (flagWriteCount > 0) {
                patchLogger.info(
                    "Removed FLAG_SECURE from ${formatCount(flagWriteCount, "flag write", "flag writes")}",
                )
            }
        }
    }
}

private fun layoutParamsIputIndices(
    implementation: MethodImplementation,
): List<Int> = implementation.instructions
    .withIndex()
    .filter { (_, instruction) ->
        if (instruction.opcode != Opcode.IPUT) return@filter false

        val reference = (instruction as Instruction22c).reference as? FieldReference
            ?: return@filter false

        reference.definingClass == LAYOUT_PARAMS_CLASS &&
            reference.name == "flags" &&
            reference.type == "I"
    }
    .map { it.index }
    .asReversed()

// Information about method calls we want to replace.
@Suppress("unused")
private enum class MethodCall(
    override val definedClassName: String,
    override val methodName: String,
    override val methodParams: Array<String>,
    override val returnType: String,
) : InvocationReplacement {
    AddFlags(
        WINDOW_CLASS,
        "addFlags",
        arrayOf("I"),
        "V",
    ),
    SetFlags(
        WINDOW_CLASS,
        "setFlags",
        arrayOf("I", "I"),
        "V",
    ),
}

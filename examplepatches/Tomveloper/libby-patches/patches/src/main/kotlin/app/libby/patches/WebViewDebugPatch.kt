package app.libby.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.libby.patches.Constants.COMPATIBILITY_LIBBY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private val SET_WEB_CONTENTS_DEBUGGING = ImmutableMethodReference(
    "Landroid/webkit/WebView;",
    "setWebContentsDebuggingEnabled",
    listOf("Z"),
    "V",
)

@Suppress("unused")
val enableWebViewDebuggingPatch = bytecodePatch(
    name = "Enable WebView debugging",
    description = "Lets you inspect Libby's WebViews with chrome://inspect.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_LIBBY)

    execute {
        // The setting is process-wide, so both call sites must be forced to true.
        forceDebuggingOn(ReaderWebViewConstructorFingerprint.method)
        forceDebuggingOn(AuthWebViewFragmentFingerprint.method)
    }
}

/**
 * Inserts `const/4 v<reg>, 0x1` immediately before the
 * setWebContentsDebuggingEnabled call.
 *
 * The register is read from the call instruction itself, so this does not depend
 * on whether the app used p1, v0, or something else.
 */
private fun forceDebuggingOn(method: MutableMethod) {
    val instructions = method.instructions
    val index = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_STATIC &&
            instruction is BuilderInstruction35c &&
            instruction.reference == SET_WEB_CONTENTS_DEBUGGING
    }

    check(index >= 0) {
        "No setWebContentsDebuggingEnabled call in ${method.definingClass}->${method.name}"
    }

    val register = (instructions[index] as BuilderInstruction35c).registerC
    method.addInstructions(index, "const/4 v$register, 0x1")
}

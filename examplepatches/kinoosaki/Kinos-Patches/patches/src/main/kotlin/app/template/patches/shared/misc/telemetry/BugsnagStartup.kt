package app.template.patches.shared.misc.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Bugsnag (com.bugsnag.android) starts itself from this ContentProvider during application
// startup, and the provider's onCreate holds the only call to the SDK's start helper (a static
// void taking the Application). The class is a stable library name; the helper it calls is
// R8-renamed, so the call is located by shape.

/** The Bugsnag startup provider. */
internal const val BUGSNAG_PROVIDER = "Lcom/bugsnag/android/internal/BugsnagContentProvider;"

/**
 * Replaces the single start call in [BUGSNAG_PROVIDER]'s onCreate with nop. The provider still
 * loads and returns true, so startup is unaffected, but Bugsnag never initialises: no crash
 * reports, no session data and no network calls to Bugsnag. Fails loudly when the provider or the
 * call shape is missing.
 */
fun BytecodePatchContext.disableBugsnagStartup() {
    val provider = mutableClassDefBy(BUGSNAG_PROVIDER)
    val onCreate = provider.methods.singleOrNull {
        it.name == "onCreate" && it.returnType == "Z" && it.parameterTypes.isEmpty() &&
            it.implementation != null
    } ?: throw PatchException("$BUGSNAG_PROVIDER->onCreate()Z not found")
    val start = onCreate.implementation!!.instructions.withIndex().singleOrNull { (_, insn) ->
        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
        insn.opcode == Opcode.INVOKE_STATIC && ref != null && ref.returnType == "V" &&
            ref.parameterTypes.map(CharSequence::toString) == listOf("Landroid/app/Application;")
    } ?: throw PatchException("no Bugsnag start call in $BUGSNAG_PROVIDER->onCreate")
    onCreate.replaceInstruction(start.index, "nop")
}

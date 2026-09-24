package app.lchanc3.patches.jptt.shared

import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_CONTEXT_CLASS
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Merges the extension classes into the app and hands them the application
 * context. Has no name on purpose: it is a dependency, not something to pick in
 * Morphe Manager.
 */
internal val extensionHookPatch = bytecodePatch {

    extendWith("extensions/jptt.mpe")

    execute {
        // `p0` is the JpttApplication instance. Injecting before super.onCreate()
        // is fine, the base context is attached before onCreate runs.
        JpttApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CONTEXT_CLASS->setApplication(Landroid/app/Application;)V",
        )
    }
}

/**
 * Fails unless [count] local registers are free at the top of [method].
 *
 * Injected code that writes to v0 is only safe when the method has a local to
 * spare. R8 compiles a short method down to its parameter registers alone, and v0
 * is then p0: writing to it overwrites `this`, which the patch applies happily
 * and the runtime verifier rejects the first time the class is loaded. Anything
 * injected into a method that might be that short belongs in a method of its own
 * instead, with registers of its own.
 */
internal fun requireFreeLocals(method: MutableMethod, count: Int) {
    val implementation = method.implementation
        ?: throw PatchException("${method.definingClass}->${method.name}() has no body.")

    // Parameters take the highest registers, and an instance method has `this`
    // ahead of them. A long or a double takes two.
    val parameters = method.parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
    val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
    val locals = implementation.registerCount - parameters - if (isStatic) 0 else 1

    if (locals < count) {
        throw PatchException(
            "${method.definingClass}->${method.name}() has $locals local register(s), " +
                "fewer than the $count this patch writes to. It has been compiled down " +
                "since this patch was written, so the code belongs in a method of its own.",
        )
    }
}

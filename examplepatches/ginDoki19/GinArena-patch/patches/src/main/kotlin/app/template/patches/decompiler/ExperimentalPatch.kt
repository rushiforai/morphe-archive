package app.template.patches.decompiler

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val LICENSE = "Lcom/pairip/licensecheck/LicenseClient;"
private const val WRAPPER = "Lcom/pairip/application/Application;"
private const val STATE = "LOoOOoo00oOoOooO/O0ooOOOO00OOOOO;"
private const val RUNTIME = "Lcom/apktools/decompile/runtime/o0o0oOO0O00O00o;"
private const val NATIVE = "Lcom/apktools/decompile/runtime/N;"

private object AppAttach : Fingerprint(definingClass = WRAPPER, name = "attachBaseContext", returnType = "V", parameters = listOf("Landroid/content/Context;"))
private object LicenseCheck : Fingerprint(definingClass = LICENSE, name = "checkLicense", returnType = "V", parameters = listOf("Landroid/content/Context;"))
private object TrialEnd : Fingerprint(definingClass = LICENSE, name = "stopTrial", returnType = "V", parameters = listOf("Landroid/content/Context;"))
private object StateConstructor : Fingerprint(definingClass = STATE, name = "<init>", returnType = "V", parameters = listOf("Landroid/os/Bundle;"))
private object StatePremium : Fingerprint(definingClass = STATE, name = "O0OO00O0oooo0o", returnType = "Z", parameters = emptyList())
private object RunWrapper : Fingerprint(definingClass = RUNTIME, name = "o00O0Oo0o0O", returnType = "V", parameters = listOf("Landroid/content/Context;", "Ljava/lang/Runnable;"))
private object CallWrapper : Fingerprint(definingClass = RUNTIME, name = "o0o0oOO0O00O00o", returnType = "Ljava/lang/Object;", parameters = listOf("Landroid/content/Context;", "Ljava/util/concurrent/Callable;"))

private fun Method.hasMethodReference(owner: String, name: String): Boolean = instructions.any {
    val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
    ref?.definingClass == owner && ref.name == name
}

private fun requireMatch(condition: Boolean, detail: String) {
    if (!condition) throw PatchException("APK Decompiler 4.12.0 structural check failed: $detail")
}

private fun MutableClass.replaceBody(method: MutableMethod, locals: Int, smali: String) {
    requireMatch(!AccessFlags.NATIVE.isSet(method.accessFlags) && !AccessFlags.ABSTRACT.isSet(method.accessFlags), "unexpected native or abstract method ${method.name}")
    val params = method.parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
    val receiver = if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
    val replacement = ImmutableMethod(
        method.definingClass, method.name, method.parameters, method.returnType,
        method.accessFlags, method.annotations, method.hiddenApiRestrictions,
        MutableMethodImplementation(params + receiver + locals)
    ).toMutable()
    replacement.addInstructionsWithLabels(0, smali.trimIndent())
    methods.remove(method)
    methods.add(replacement)
}

// Internal implementation shared by the public patch card.
internal val decompilerCorePatch = bytecodePatch {
    execute {
        // Fail closed if any version-specific structural precondition differs.
        requireMatch(AppAttach.method.hasMethodReference(LICENSE, "checkLicense"), "license startup call")
        requireMatch(AppAttach.classDef.superclass == "Lcom/apktools/decompile/App;" &&
            AppAttach.method.hasMethodReference(WRAPPER, "attachBaseContext") &&
            AppAttach.method.instructions.any { it.opcode == Opcode.INVOKE_SUPER }, "application superclass init")
        requireMatch(LicenseCheck.method.hasMethodReference(LICENSE, "isIsolatedProcess"), "license check implementation")
        requireMatch(TrialEnd.method.hasMethodReference(LICENSE, "isIsolatedProcess"), "trial implementation")
        requireMatch(RunWrapper.method.hasMethodReference(NATIVE, "a"), "native runnable wrapper")
        requireMatch(CallWrapper.method.hasMethodReference(NATIVE, "b"), "native callable wrapper")
        val ctor = StateConstructor.method
        val returns = ctor.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        requireMatch(returns.size == 1, "state constructor return count")
        requireMatch(ctor.implementation?.registerCount == 8, "state constructor registers")
        val fields = ctor.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
        requireMatch(fields.any { it.definingClass == STATE && it.name == "o00O0Oo0o0O" && it.type == "Z" }, "lifetime field")
        requireMatch(fields.any { it.definingClass == STATE && it.name == "O0ooOOOO00OOOOO" && it.type == "Z" }, "premium aggregate field")
        requireMatch(StatePremium.method.instructions.any { (it as? ReferenceInstruction)?.reference is FieldReference }, "state predicate")

        // Preserve the Application superclass path. Disable only the check and its
        // separate trial-end trigger, leaving the wrapper and manifest in place.
        LicenseCheck.classDef.replaceBody(LicenseCheck.method, 0, "return-void")
        TrialEnd.classDef.replaceBody(TrialEnd.method, 0, "return-void")

        // Set lifetime and the derived aggregate consistently in each constructed
        // local state object; do not mutate purchase tokens or Play billing data.
        ctor.addInstructions(returns.single().index, """
            const/4 v0, 0x1
            iput-boolean v0, p0, $STATE->o00O0Oo0o0O:Z
            iput-boolean v0, p0, $STATE->O0ooOOOO00OOOOO:Z
        """.trimIndent())

        // The native wrappers mediate execution of the
        // supplied callbacks. Direct invocation avoids a re-signing restriction
        // but may omit unknown native side effects. Must be validated on device.
        RunWrapper.classDef.replaceBody(RunWrapper.method, 0, """
            invoke-interface {p1}, Ljava/lang/Runnable;->run()V
            return-void
        """)
        CallWrapper.classDef.replaceBody(CallWrapper.method, 1, """
            invoke-interface {p1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """)
    }
}

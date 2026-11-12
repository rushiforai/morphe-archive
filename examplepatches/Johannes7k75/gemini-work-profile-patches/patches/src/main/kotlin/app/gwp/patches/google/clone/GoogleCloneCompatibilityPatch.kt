package app.gwp.patches.google.clone

import app.gwp.patches.shared.Constants.GOOGLE_CLONE_PACKAGE
import app.gwp.patches.shared.Constants.GOOGLE_PACKAGE
import app.gwp.patches.shared.Constants.CLONE_SUFFIX
import app.gwp.patches.shared.addMethod
import app.gwp.patches.shared.clonePackagePatch
import app.gwp.patches.shared.replaceStringConstants
import app.gwp.patches.shared.standaloneInstallPatch
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

private val logger = Logger.getLogger("GoogleCloneCompatibilityPatch")

private const val GOOGLEAPP_PROCESS = "$GOOGLE_PACKAGE:googleapp"
private const val MAIN_PROCESS_LOG = "More than 1 custom main process specified"
private const val GET_PROCESS_NAME = "Landroid/app/Application;->getProcessName()Ljava/lang/String;"
private const val STRIP_HELPER = "gwpStripCloneSuffix"

private fun Method.stringCalls(): List<MethodReference> =
    implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        ?.filter { it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" } ?: emptyList()

private fun MethodReference.resolve(): Method? = classDefByOrNull(definingClass)?.methods?.firstOrNull {
    it.name == name && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
}

/** True if the static ()String method returns Application.getProcessName(), directly or via one R8 outline. */
private fun isProcessNameProvider(reference: MethodReference): Boolean {
    val calls = reference.resolve()?.stringCalls() ?: return false
    if (calls.any { it.toString() == GET_PROCESS_NAME }) return true
    return calls.any { inner -> inner.resolve()?.stringCalls()?.any { it.toString() == GET_PROCESS_NAME } == true }
}

/**
 * The Google app runs several processes (":googleapp", ":search", ...) and picks its dependency-injection
 * component with a compiled `switch (processName)` on the original names. In the clone the processes are
 * called "<clone package>:search", so the switch would pick the wrong component and crash.
 *
 * - The cached process-name provider strips the clone suffix (like the original app sees it).
 * - The "main process" check of the account store keeps using the real process name, otherwise ":search"
 *   binds its own account sync service and loops.
 */
private fun fixProcessNames() {
    val providers = mutableSetOf<MethodReference>()
    for (classDef in classDefByStrings(GOOGLEAPP_PROCESS, StringComparisonType.EQUALS)) {
        for (method in classDef.methods) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            if (instructions.none { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == GOOGLEAPP_PROCESS }) continue
            instructions.filter { it.opcode == Opcode.INVOKE_STATIC }
                .mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
                .filter { it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" && isProcessNameProvider(it) }
                .forEach { providers += it }
        }
    }
    val provider = providers.distinctBy { it.toString() }.singleOrNull()
        ?: throw PatchException("Expected one process name provider, found ${providers.map { it.toString() }}")

    val providerClass = mutableClassDefBy(provider.definingClass)
    providerClass.addMethod(
        STRIP_HELPER, listOf("Ljava/lang/String;"), "Ljava/lang/String;",
        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, locals = 2, """
            if-eqz p0, :done
            const-string v0, "$CLONE_SUFFIX"
            const-string v1, ""
            invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
            move-result-object p0
            :done
            return-object p0
        """
    )
    val providerMethod = providerClass.methods.single {
        it.name == provider.name && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
    }
    val returns = providerMethod.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
    if (returns.isEmpty()) throw PatchException("Process name provider has no return")
    returns.reversed().forEach { index ->
        val register = (providerMethod.instructions[index] as OneRegisterInstruction).registerA
        providerMethod.addInstructions(index, """
            invoke-static/range {v$register .. v$register}, ${providerClass.type}->$STRIP_HELPER(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$register
        """)
    }

    var mainChecks = 0
    for (classDef in classDefByStrings(MAIN_PROCESS_LOG, StringComparisonType.EQUALS)) {
        for (method in mutableClassDefBy(classDef).methods) {
            if (method.returnType != "Z" || method.parameterTypes.isNotEmpty() || method.implementation == null) continue
            method.instructions.toList().forEachIndexed { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@forEachIndexed
                if (instruction.opcode == Opcode.INVOKE_STATIC && reference.toString() == provider.toString()) {
                    method.replaceInstruction(index, "invoke-static {}, $GET_PROCESS_NAME")
                    mainChecks++
                }
            }
        }
    }
    if (mainChecks != 1) throw PatchException("Expected one main-process check, found $mainChecks")
    logger.info("Process name provider $provider sanitized, main-process check uses the real process name")
}

/** Internal: makes the Google app work under the clone package name. */
internal val googleCloneCompatibilityPatch = patch {
    dependsOn(clonePackagePatch, standaloneInstallPatch)

    execute {
        // Exact references to the own package (intents, components, services) point to the clone.
        val replaced = replaceStringConstants(GOOGLE_PACKAGE, GOOGLE_CLONE_PACKAGE)
        if (replaced == 0) throw PatchException("No package references found")
        logger.info("Redirected $replaced package references to $GOOGLE_CLONE_PACKAGE")
        fixProcessNames()
    }
}

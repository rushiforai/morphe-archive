package app.morphe.patches.dialer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.dialer.DialerConstants.COMPATIBILITY_GOOGLE_DIALER
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val DROIDGUARD_SERVICE = "com.google.android.gms.droidguard.internal.IDroidGuardService"
internal const val BROKER_SERVICE = "com.google.android.gms.common.internal.IGmsServiceBroker"
internal const val VERIFICATION_DENIED = "PackageVerificationRslt: not allowed:"
internal const val DROIDGUARD_REJECTION_LOG = "Rejected DroidGuard connection; reporting DEVELOPER_ERROR"

internal fun Instruction.stringValue() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
internal fun Method.exactStrings() = implementation?.instructions?.mapNotNull { it.stringValue() }?.toSet().orEmpty()

/**
 * Intercepts DroidGuard broker SecurityException on renamed/cloned Google Phone packages
 * and reports DEVELOPER_ERROR instead of crashing with FATAL EXCEPTION: DG.
 * Based on Balu100's proven connection repair.
 */
@Suppress("unused")
val droidGuardConnectionPatch = bytecodePatch(
    name = "Fix Cloned DroidGuard Crash",
    description = "Prevents Google Phone from crashing on launch when running as a cloned package on non-rooted devices.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GOOGLE_DIALER)

    execute {
        println("Checking DroidGuard broker connection handler...")
        val target = Fingerprint(
            returnType = "V",
            filters = listOf(string(BROKER_SERVICE)),
            custom = { method, _ -> "IGmsServiceBroker.getService failed" in method.exactStrings() }
        ).matchAllOrNull().orEmpty().singleOrNull()

        if (target == null) {
            println("DroidGuard broker method not found or ambiguous; skipping.")
            return@execute
        }

        val client = Fingerprint(
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
            filters = listOf(string(DROIDGUARD_SERVICE))
        ).matchAllOrNull().orEmpty().singleOrNull()

        if (client == null) {
            println("DroidGuard service client not found; skipping.")
            return@execute
        }

        val intermediate = classDefBy(client.originalClassDef.superclass ?: return@execute)
        if (intermediate.superclass != target.originalClassDef.type ||
            client.originalClassDef.methods.none { "com.google.android.gms.droidguard.service.START" in it.exactStrings() }) {
            println("DroidGuard client hierarchy did not match; skipping.")
            return@execute
        }

        try {
            insertDroidGuardFailureHandling(target.method, client.originalClassDef.type)
            println("DroidGuard connection failure handling successfully injected!")
        } catch (e: Exception) {
            println("Could not inject DroidGuard handler: ${e.message}")
        }
    }
}

internal fun securityHandlerIndex(method: Method): Int {
    val body = method.implementation ?: throw PatchException("DroidGuard: no broker implementation")
    if (AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != "V" ||
        method.parameterTypes.size != 2 || method.parameterTypes[1] != "Ljava/util/Set;") {
        throw PatchException("DroidGuard: unexpected broker signature")
    }
    val handlers = body.tryBlocks.flatMap { it.exceptionHandlers }
        .filter { it.exceptionType == "Ljava/lang/SecurityException;" }.map { it.handlerCodeAddress }.distinct()
    val address = handlers.singleOrNull() ?: throw PatchException("DroidGuard: missing or ambiguous security handler")
    val instructions = body.instructions.toList()
    var current = 0
    val index = instructions.indices.singleOrNull { i -> (current == address).also { current += instructions[i].codeUnits } }
        ?: throw PatchException("DroidGuard: invalid handler address")
    val move = instructions[index] as? OneRegisterInstruction
    val rethrow = instructions.getOrNull(index + 1) as? OneRegisterInstruction
    if (move?.opcode != Opcode.MOVE_EXCEPTION || rethrow?.opcode != Opcode.THROW ||
        move.registerA != rethrow.registerA || move.registerA > 15 ||
        body.tryBlocks.any { address >= it.startCodeAddress && address < it.startCodeAddress + it.codeUnitCount }) {
        throw PatchException("DroidGuard: expected an isolated move-exception/rethrow handler")
    }
    return index
}

internal fun insertDroidGuardFailureHandling(method: MutableMethod, clientType: String) {
    val handler = securityHandlerIndex(method)
    val body = method.implementation!!
    val exceptionRegister = (body.instructions[handler] as OneRegisterInstruction).registerA
    val localCount = body.registerCount - 3
    val scratch = (0 until minOf(localCount, 16)).filter { it != exceptionRegister }.take(5)
    if (scratch.size != 5) throw PatchException("DroidGuard: insufficient local registers")
    val (receiver, flag, message, text, generation) = scratch
    val references = body.instructions.filterIsInstance<ReferenceInstruction>().map { it.reference }
    val failure = references.filterIsInstance<MethodReference>().distinctBy { it.toString() }.singleOrNull {
        it.definingClass == method.definingClass && it.returnType == "V" &&
            it.parameterTypes == listOf("I", "Landroid/os/IBinder;", "Landroid/os/Bundle;", "I")
    } ?: throw PatchException("DroidGuard: missing or ambiguous post-init failure callback")
    val epoch = references.filterIsInstance<FieldReference>().distinctBy { it.toString() }.singleOrNull {
        it.definingClass == method.definingClass && it.type == "Ljava/util/concurrent/atomic/AtomicInteger;"
    } ?: throw PatchException("DroidGuard: missing or ambiguous connection generation")
    val originalThrow = body.instructions[handler + 1]
    method.addInstructionsWithLabels(handler + 1, """
        move-object/from16 v$receiver, p0
        instance-of v$flag, v$receiver, $clientType
        if-eqz v$flag, :original_rethrow
        invoke-virtual {v$exceptionRegister}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
        move-result-object v$message
        if-eqz v$message, :original_rethrow
        const-string v$text, "$VERIFICATION_DENIED"
        invoke-virtual {v$message, v$text}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
        move-result v$flag
        if-eqz v$flag, :original_rethrow
        const-string v$message, "GooglePhone.CloneRepair"
        const-string v$text, "$DROIDGUARD_REJECTION_LOG"
        invoke-static {v$message, v$text}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
        iget-object v$generation, v$receiver, $epoch
        invoke-virtual {v$generation}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I
        move-result v$generation
        const/16 v$flag, 0xa
        const/4 v$message, 0x0
        invoke-virtual {v$receiver, v$flag, v$message, v$message, v$generation}, $failure
        return-void
    """.trimIndent(), ExternalLabel("original_rethrow", originalThrow))
}

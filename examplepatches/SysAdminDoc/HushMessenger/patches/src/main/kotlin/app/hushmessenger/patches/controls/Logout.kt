package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val LOGOUT_ROUTE = "$HOST_SCREENS->logoutRoute()Ljava/lang/String;"
internal const val ACCOUNT_LOGIN_ACTIVITY = "Lcom/facebook/messaging/accountlogin/AccountLoginActivity;"
private const val CONTEXT = "Landroid/content/Context;"
private const val LOGOUT_INTENT = "(${CONTEXT}Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;"
private const val START_INTENT = "(${CONTEXT}Landroid/content/Intent;)Z"

private fun Method.code() = implementation?.instructions?.toList().orEmpty()
private fun Method.strings() = code().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }

/**
 * #88: Messenger's own Log out, the static (Context)V its account switcher calls. It starts AccountLoginActivity's
 * logout flow from the entry point "entry_point_logout" with "ACCOUNT_SWITCHER" as the source, and that screen runs
 * Messenger's real auth_logout. Exact shape only: straight line, those two strings in that order, the logout intent
 * built from the method's own Context and started from it. Anything else is no route, so settings show the row as
 * unavailable instead of starting something else.
 */
internal fun Method.isLogoutLauncher(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || parameterTypes.map { it.toString() } != listOf(CONTEXT)) return false
    val code = code()
    val registers = implementation?.registerCount ?: return false
    if (code.isEmpty() || code.last().opcode != Opcode.RETURN_VOID || code.any { it is OffsetInstruction }) return false
    if (strings() != listOf("entry_point_logout", "ACCOUNT_SWITCHER")) return false
    fun constant(value: String) = code.single { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value }
        .let { (it as OneRegisterInstruction).registerA }
    val context = registers - 1
    val calls = code.filter { it.opcode == Opcode.INVOKE_STATIC }
    val build = calls.filter { ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
        ref.definingClass == ACCOUNT_LOGIN_ACTIVITY && "(${ref.parameterTypes.joinToString("")})${ref.returnType}" == LOGOUT_INTENT } }
    val call = build.singleOrNull() as? FiveRegisterInstruction ?: return false
    if (call.registerCount != 3 || call.registerC != context || call.registerD != constant("entry_point_logout") ||
        call.registerE != constant("ACCOUNT_SWITCHER")) return false
    val at = code.indexOf(call as Instruction)
    val result = code.getOrNull(at + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } as? OneRegisterInstruction ?: return false
    val start = code.getOrNull(at + 2)?.takeIf { it.opcode == Opcode.INVOKE_STATIC } as? FiveRegisterInstruction ?: return false
    val started = (start as ReferenceInstruction).reference as MethodReference
    return "(${started.parameterTypes.joinToString("")})${started.returnType}" == START_INTENT &&
        start.registerCount == 2 && start.registerC == context && start.registerD == result.registerA
}

/** The one logout launcher in [classes], or null when there's none or more than one. */
internal fun findLogoutRoute(classes: Iterable<ClassDef>): String? =
    classes.flatMap { owner -> owner.methods.filter { it.strings().contains("entry_point_logout") && it.isLogoutLauncher() } }
        .singleOrNull()?.hookId()

/** Writes [route] as what HostScreens.logoutRoute returns. Its stock body is one constant string and the return. */
internal fun MutableMethod.writeLogoutRoute(route: String) {
    val instructions = implementation?.instructions?.toList().orEmpty()
    val constant = instructions.getOrNull(0) as? OneRegisterInstruction
    val exit = instructions.getOrNull(1) as? OneRegisterInstruction
    if (hookId() != LOGOUT_ROUTE || !AccessFlags.STATIC.isSet(accessFlags) || instructions.size != 2 ||
        instructions[0].opcode != Opcode.CONST_STRING || instructions[1].opcode != Opcode.RETURN_OBJECT || constant == null ||
        constant.registerA != exit?.registerA || ((instructions[0] as? ReferenceInstruction)?.reference as? StringReference)?.string != "") {
        throw PatchException("Messenger controls: the extension's log out route differs from this patch version")
    }
    replaceInstruction(0, "const-string v${constant.registerA}, \"$route\"")
}

/** Points settings' Log out at Messenger's own, or leaves it empty with a warning so the row says it's unavailable. */
internal fun resolveLogoutRoute(classes: Iterable<ClassDef>, stub: MutableMethod?) {
    stub ?: throw PatchException("Messenger controls: the extension's log out route differs from this patch version")
    val route = findLogoutRoute(classes)
    if (route == null) {
        java.util.logging.Logger.getLogger("").warning(
            "Messenger controls: Messenger's own log out wasn't found in this build, so settings show Log out as unavailable")
        return
    }
    stub.writeLogoutRoute(route)
}

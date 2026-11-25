package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * #204: Messenger's own "is this user an AI bot", the check its search labels a person's row with. Search files a
 * verified bot under pages before it looks at what it is, and a result read back from the search cache keeps only a
 * flag, so neither the row's type nor the user's type name says it every time. This check does: it reads the user's
 * own flag, then compares the user's type name with "AiBot". The patch writes its name into the extension, which puts
 * the person a search row holds to it.
 *
 * Exact shape only: an instance method of User that takes nothing and answers yes or no, names "AiBot" and no other
 * string, reads one flag and one string off its own user and nothing else, and calls only the comparison. Anything
 * else is no route, and Hide Meta AI then goes by the row and thread types alone.
 */
internal const val AI_USER_ROUTE = "$HOST_SCREENS->aiUserRoute()Ljava/lang/String;"
internal const val MESSENGER_USER = "Lcom/facebook/user/model/User;"
internal const val AI_USER_TYPE = "AiBot"

internal fun Method.isAiUserCheck(): Boolean {
    if (definingClass != MESSENGER_USER || AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z" || parameterTypes.isNotEmpty()) return false
    val code = implementation?.instructions?.toList().orEmpty()
    val self = (implementation?.registerCount ?: return false) - 1
    val references = code.mapNotNull { (it as? ReferenceInstruction)?.reference }
    if (references.filterIsInstance<StringReference>().map { it.string } != listOf(AI_USER_TYPE)) return false
    val reads = code.filter { (it as? ReferenceInstruction)?.reference is FieldReference }
    if (reads.any { (it.opcode != Opcode.IGET_BOOLEAN && it.opcode != Opcode.IGET_OBJECT) || (it as TwoRegisterInstruction).registerB != self }) return false
    val fields = reads.map { (it as ReferenceInstruction).reference as FieldReference }
    if (fields.any { it.definingClass != MESSENGER_USER } || fields.map { it.type }.sorted() != listOf("Ljava/lang/String;", "Z")) return false
    val call = references.filterIsInstance<MethodReference>().singleOrNull() ?: return false
    return call.returnType == "Z" && (call.name == "equals" || call.name == "equal") && !call.definingClass.startsWith("LX/")
}

/** The one AI bot check User has, or null when there's none or more than one. */
internal fun findAiUserRoute(classes: Iterable<ClassDef>): String? =
    classes.firstOrNull { it.type == MESSENGER_USER }?.methods?.singleOrNull { it.isAiUserCheck() }?.hookId()

/** Writes [route] as what HostScreens.aiUserRoute returns. Its stock body is one empty string and the return. */
internal fun MutableMethod.writeAiUserRoute(route: String) {
    val instructions = implementation?.instructions?.toList().orEmpty()
    val constant = instructions.getOrNull(0) as? OneRegisterInstruction
    val exit = instructions.getOrNull(1) as? OneRegisterInstruction
    if (hookId() != AI_USER_ROUTE || !AccessFlags.STATIC.isSet(accessFlags) || instructions.size != 2 ||
        instructions[0].opcode != Opcode.CONST_STRING || instructions[1].opcode != Opcode.RETURN_OBJECT || constant == null ||
        constant.registerA != exit?.registerA || ((instructions[0] as? ReferenceInstruction)?.reference as? StringReference)?.string != "") {
        throw PatchException("Messenger controls: the extension's AI bot check route differs from this patch version")
    }
    replaceInstruction(0, "const-string v${constant.registerA}, \"$route\"")
}

/** Points search's Hide Meta AI at Messenger's own check, or leaves it empty with a warning so rows go by their types. */
internal fun resolveAiUserRoute(classes: Iterable<ClassDef>, stub: MutableMethod?) {
    stub ?: throw PatchException("Messenger controls: the extension's AI bot check route differs from this patch version")
    val route = findAiUserRoute(classes)
    if (route == null) {
        java.util.logging.Logger.getLogger("").warning(
            "Messenger controls: Messenger's own AI bot check wasn't found in this build, so Hide Meta AI goes by search's row types alone")
        return
    }
    stub.writeAiUserRoute(route)
}

package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val UNREAD_BADGE = "unread_badge"

/** The trace Messenger's badge count opens with, which Redex leaves as it is on every build. */
internal const val BADGE_COUNT_TRACE = "UnreadInboxItemsCalculator.updateBadgeUnreadCount"
internal val BADGE_COUNT_PARAMETERS = listOf("Ljava/lang/String;", "Ljava/lang/String;", "I", "I", "I", "I", "I")
internal const val BADGE_TOTAL_HELPER =
    "Lapp/hushmessenger/extension/UnreadBadge;->total(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;IIIII)I"

/** The unread total comes fourth, after what set the count off, where the count came from and the group chats in it. */
internal const val BADGE_TOTAL_PARAMETER = 3

/** The count logs its total right after this, which is how the patch knows which parameter the total is. */
internal const val BADGE_TOTAL_LOG = " total="
private val BADGE_COPIES = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)

private fun Method.badgeCode() = implementation?.instructions?.toList().orEmpty()

private fun Instruction.badgeString() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

/** Whether the register is the one the count logs as its total, copied out within a few instructions of the label. */
private fun Method.logsTotalFrom(register: Int): Boolean {
    val code = badgeCode()
    val at = code.indexOfFirst { it.badgeString() == BADGE_TOTAL_LOG }
    return at >= 0 && code.drop(at + 1).take(3).any { it.opcode in BADGE_COPIES && (it as TwoRegisterInstruction).registerB == register }
}

private fun Method.hasBadgeCountShape() = !AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
    parameterTypes.map { it.toString() } == BADGE_COUNT_PARAMETERS

/**
 * The method the badge on Messenger's icon and its Chats tab both come from. It takes the unread chats Messenger
 * counted, adds its own extras, and stores and posts the result, so a total cut here reaches both.
 */
internal fun Method.isBadgeCount(): Boolean = hasBadgeCountShape() &&
    badgeCode().any { it.badgeString() == BADGE_COUNT_TRACE }

/**
 * The one badge count. The extension counts again by calling it once more with Messenger's own total, and finds it by
 * its shape, so it has to be the only method of that shape on its class.
 */
internal fun findUnreadBadge(classes: Iterable<ClassDef>): List<Method> {
    val found = classes.flatMap { owner ->
        val shaped = owner.methods.filter { it.hasBadgeCountShape() }
        shaped.filter { shaped.size == 1 && it.isBadgeCount() }
    }
    return if (found.size == 1) found else emptyList()
}

/** Both read-here patches ask for the badge too: whichever patches first puts the hook in, and the other finds it there. */
internal fun Method.unreadBadgeHooked() =
    badgeCode().any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString() == BADGE_TOTAL_HELPER }

private fun badgeRequire(condition: Boolean, detail: String) {
    if (!condition) throw PatchException("Messenger controls: the unread badge count changed ($detail)")
}

/**
 * The hook goes in first thing, where the parameters still hold what the caller passed, so nothing can branch onto
 * that spot and no try block can cover it. Returns the first parameter's register.
 */
internal fun MutableMethod.validateUnreadBadge(): Int {
    badgeRequire(isBadgeCount(), "badge count")
    val first = implementation!!.registerCount - (BADGE_COUNT_PARAMETERS.size + 1)
    badgeRequire(first >= 0, "parameters")
    badgeRequire(logsTotalFrom(first + 1 + BADGE_TOTAL_PARAMETER), "total parameter")
    badgeRequire(0 !in jumpTargets(), "entry")
    badgeRequire(!ReadFlow(this).protected(0), "unprotected entry")
    return first
}

/** Messenger's own total goes to the extension along with the rest, and the count goes on with what it answers. */
internal fun MutableMethod.injectUnreadBadge() {
    if (unreadBadgeHooked()) return
    val first = validateUnreadBadge()
    val last = first + BADGE_COUNT_PARAMETERS.size
    addInstructions(0, """
        invoke-static/range {v$first .. v$last}, $BADGE_TOTAL_HELPER
        move-result v${first + 1 + BADGE_TOTAL_PARAMETER}
    """.trimIndent())
}

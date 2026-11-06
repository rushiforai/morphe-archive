package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Meta AI's offer to sum up a chat's unread messages: the "Summarize N unread messages" pill over the chat, the
 * Summarize link on the unread divider and the inbox's summary pill. Every one of them first asks the same eligibility
 * check (chat type, capability and Meta's server flags) and shows nothing when it says no.
 */
internal const val AI_SUMMARY = "ai_summary"

/** The name the floating summary pill's event handler logs itself under. */
internal const val AI_SUMMARY_PILL = "AiSummaryFloatingPillEventHandler"

/** The eligibility check's parameters: the chat, its capabilities, the newest unread timestamp and two chat states. */
internal val AI_SUMMARY_PARAMETERS = listOf(THREAD_KEY_TYPE, CAPABILITIES, "J", "Z", "Z")

private fun summaryChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the Meta AI summary check moved ($detail)")

private fun Method.namesSummaryPill() = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == AI_SUMMARY_PILL
} == true

private fun MethodReference.isSummaryCheck() =
    returnType == "Z" && parameterTypes.map { it.toString() } == AI_SUMMARY_PARAMETERS

/**
 * The check the floating pill's handler asks before it shows the pill: the one class that names the handler, and the
 * one (ThreadKey, Capabilities, J, Z, Z)Z method it calls, defined with code in these classes. Anything else finds
 * nothing, so the control stays unapplied.
 */
internal fun findAiSummary(classes: Iterable<ClassDef>): List<Method> {
    val list = classes.toList()
    val handler = list.filter { cls -> cls.methods.any { it.namesSummaryPill() } }.singleOrNull() ?: return emptyList()
    val check = handler.methods.flatMap { method ->
        method.implementation?.instructions?.toList().orEmpty().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
    }.filter { it.isSummaryCheck() }.map { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        .distinct().singleOrNull() ?: return emptyList()
    val method = list.firstOrNull { it.type == check.substringBefore("->") }?.methods?.firstOrNull { it.hookId() == check }
    return if (method?.implementation != null) listOf(method) else emptyList()
}

/** The switch answers no in place of the whole check, so it needs the check's exact shape and a free local. */
internal fun MutableMethod.validateAiSummary() {
    if (returnType != "Z" || parameterTypes.map { it.toString() } != AI_SUMMARY_PARAMETERS || implementation == null) {
        summaryChanged("unexpected check ${hookId()}")
    }
    validateScratch()
}

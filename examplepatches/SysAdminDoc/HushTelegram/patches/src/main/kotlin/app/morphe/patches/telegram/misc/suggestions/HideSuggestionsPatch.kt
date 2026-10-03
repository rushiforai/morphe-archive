/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.suggestions

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.handleTargets
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Hide promotional banners"
private const val SUGGESTIONS = "$EXTENSION_PACKAGE/misc/Suggestions;"
internal const val PENDING_SUGGESTIONS = "Lorg/telegram/messenger/MessagesController;->pendingSuggestions:Ljava/util/Set;"
internal const val DISMISSED_SUGGESTIONS = "Lorg/telegram/messenger/MessagesController;->dismissedSuggestions:Ljava/util/Set;"
private const val SET_CONTAINS = "Ljava/util/Set;->contains(Ljava/lang/Object;)Z"
private const val SET_ITERATOR = "Ljava/util/Set;->iterator()Ljava/util/Iterator;"
internal const val SUGGESTION_FILL = "Lorg/telegram/messenger/ApplicationLoader;->onSuggestionFill(Ljava/lang/String;[Ljava/lang/CharSequence;[Z)Z"

/**
 * DialogsActivity's suggestion renderer. The UI class and method are renamed, but its call to
 * ApplicationLoader.onSuggestionFill is kept. No other no-argument UI method calls it in 12.10.6.
 */
internal object ChatListSuggestionsFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    custom = { method, _ ->
        method.definingClass.startsWith("Lorg/telegram/ui/") &&
            method.implementation?.instructions?.any { it.reference() == SUGGESTION_FILL } == true
    },
)

/**
 * Reads presentation copies instead of changing MessagesController's stored sets. Birthday gift
 * prompts use the dismissed set rather than pendingSuggestions, so their local contains result
 * has a separate guard. Neither hook calls removeSuggestion or help.dismissSuggestion.
 */
@Suppress("unused")
val hideSuggestionsPatch = bytecodePatch(
    name = PATCH,
    description = "Hides Premium, birthday and low Stars balance banners in the chat list. " +
        "Account security notices and other suggestions remain. Nothing is dismissed for you.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("hidePromotionalBanners")
        requireStatusMethod("promotionalSuggestions")
        requireStatusMethod("birthdayGiftBanner")
        val renderer = ChatListSuggestionsFingerprint.methodOrNull
        handleTargets(PATCH, "chat-list banner targets", BannerTarget.entries) { target ->
            if (renderer == null) "no chat-list renderer calls $SUGGESTION_FILL"
            else when (target) {
                BannerTarget.PENDING -> renderer.filterPresentationReads().also {
                    if (it == null) enableCapability("promotionalSuggestions")
                }
                BannerTarget.BIRTHDAY_GIFT -> renderer.guardBirthdayGiftBanner().also {
                    if (it == null) enableCapability("birthdayGiftBanner")
                }
            }
        }
        enableStatus("hidePromotionalBanners")
    }
}

private enum class BannerTarget { PENDING, BIRTHDAY_GIFT }

/** All pending-set reads must be membership checks or iteration, never a write or an escape. */
private fun MutableMethod.filterPresentationReads(): String? {
    val body = implementation?.instructions?.toList().orEmpty()
    val reads = body.indices.filter { body[it].opcode == Opcode.IGET_OBJECT && body[it].reference() == PENDING_SUGGESTIONS }
    if (reads.isEmpty()) return "chat-list suggestion rendering has no read of $PENDING_SUGGESTIONS"
    val flow = ControlFlow.of(this)
    for (index in reads) {
        val register = (body[index] as OneRegisterInstruction).registerA
        val next = body.getOrNull(index + 1)
        val hasKey = next?.opcode == Opcode.CONST_STRING || next?.opcode == Opcode.CONST_STRING_JUMBO
        val use = body.getOrNull(index + if (hasKey) 2 else 1)
        val call = use as? FiveRegisterInstruction
        if (use?.opcode != Opcode.INVOKE_INTERFACE || call == null || call.registerC != register ||
            use.reference() !in setOf(SET_CONTAINS, SET_ITERATOR) ||
            (hasKey && (next as OneRegisterInstruction).registerA == register)
        ) return "chat-list pending suggestions escape their membership check or iterator at instruction $index"
        if (flow.hasOtherEntry(index + 1, index)) {
            return "chat-list pending suggestions have a path around the field read at instruction $index"
        }
        if (!flow.keepsPresentationLocal(index)) {
            return "chat-list suggestion value escapes presentation after instruction $index"
        }
    }
    // Reverse order keeps each unmodified field-read index stable. The same register still holds
    // a Set afterward, so no scratch register or parameter is borrowed.
    for (index in reads.asReversed()) {
        val register = (body[index] as OneRegisterInstruction).registerA
        addInstructions(
            index + 1,
            """
                invoke-static/range {v$register .. v$register}, $SUGGESTIONS->filterChatList(Ljava/util/Set;)Ljava/util/Set;
                move-result-object v$register
            """,
        )
    }
    return null
}

/** Only BIRTHDAY_CONTACTS_TODAY's dismissed membership result may be forced true locally. */
private fun MutableMethod.guardBirthdayGiftBanner(): String? {
    val body = implementation?.instructions?.toList().orEmpty()
    val keys = body.indices.filter { (body[it] as? ReferenceInstruction)?.reference.let { it as? StringReference }?.string == "BIRTHDAY_CONTACTS_TODAY" }
    if (keys.size != 1) return "chat-list rendering has no single BIRTHDAY_CONTACTS_TODAY membership check"
    val key = keys.single()
    val read = body.getOrNull(key - 1)
    val contains = body.getOrNull(key + 1)
    val result = body.getOrNull(key + 2)
    val branch = body.getOrNull(key + 3)
    val call = contains as? FiveRegisterInstruction
    if (read?.opcode != Opcode.IGET_OBJECT || read.reference() != DISMISSED_SUGGESTIONS ||
        contains?.opcode != Opcode.INVOKE_INTERFACE || contains.reference() != SET_CONTAINS ||
        call == null || call.registerCount != 2 ||
        call.registerC != (read as OneRegisterInstruction).registerA ||
        call.registerD != (body[key] as OneRegisterInstruction).registerA ||
        result?.opcode != Opcode.MOVE_RESULT || branch?.opcode != Opcode.IF_NEZ ||
        (result as OneRegisterInstruction).registerA != (branch as OneRegisterInstruction).registerA
    ) return "chat-list birthday gift rendering doesn't test the dismissed key before its banner"
    val flow = ControlFlow.of(this)
    if (flow.hasOtherEntry(key + 3, key + 2)) {
        return "chat-list birthday gift rendering has a path around its membership result"
    }
    val register = result.registerA
    addInstructions(
        key + 3,
        """
            invoke-static/range {v$register .. v$register}, $SUGGESTIONS->birthdayGiftBannerDismissed(Z)Z
            move-result v$register
        """,
    )
    return null
}

private fun Instruction.reference(): String? = (this as? ReferenceInstruction)?.reference?.toString()

/** Track Set/Iterator aliases through their complete normal and exceptional lifetimes. */
private fun ControlFlow.keepsPresentationLocal(source: Int): Boolean {
    val setValue = 1
    val iteratorValue = 2
    val states = arrayOfNulls<Map<Int, Int>>(instructions.size)
    val pending = ArrayDeque<Int>()
    fun enqueue(at: Int, values: Map<Int, Int>) {
        val previous = states[at]
        val merged = previous.orEmpty().toMutableMap()
        values.forEach { (register, kind) -> merged[register] = (merged[register] ?: 0) or kind }
        if (previous == null || previous != merged) {
            states[at] = merged
            pending += at
        }
    }
    enqueue(source, emptyMap())
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        val before = states[at]!!
        val instruction = instructions[at]
        val registers = instruction.namedRegisters()
        val move = instruction.opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
        val cast = instruction.opcode == Opcode.CHECK_CAST
        val reads = if (instruction.opcode.setsRegister() && !cast) registers.drop(1) else registers
        val tagged = reads.filter { (before[it] ?: 0) != 0 }
        var iteratorResult: Int? = null
        if (tagged.isNotEmpty()) {
            val receiverKind = registers.firstOrNull()?.let { before[it] } ?: 0
            val interfaceCall = instruction.opcode in setOf(Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE)
            val membership = interfaceCall && receiverKind == setValue && registers.size == 2 &&
                tagged == listOf(registers.first()) && instruction.reference() == SET_CONTAINS
            val iteration = interfaceCall && receiverKind == iteratorValue && registers.size == 1 &&
                instruction.reference() in setOf("Ljava/util/Iterator;->hasNext()Z", "Ljava/util/Iterator;->next()Ljava/lang/Object;")
            val iterator = interfaceCall && receiverKind == setValue && registers.size == 1 && instruction.reference() == SET_ITERATOR
            val nullCheck = instruction.opcode in setOf(Opcode.IF_EQZ, Opcode.IF_NEZ) && registers.size == 1
            val safeCast = cast && ((receiverKind == setValue && instruction.reference() == "Ljava/util/Set;") ||
                (receiverKind == iteratorValue && instruction.reference() == "Ljava/util/Iterator;"))
            if (!move && !membership && !iteration && !iterator && !nullCheck && !safeCast) return false
            if (iterator) {
                val result = at + 1
                if (instructions.getOrNull(result)?.opcode != Opcode.MOVE_RESULT_OBJECT ||
                    normal[at] != listOf(result) || hasOtherEntry(result, at)) return false
                iteratorResult = result
            }
        }
        val after = before.toMutableMap()
        if (instruction.opcode.setsRegister()) {
            val destination = registers.first()
            after.remove(destination)
            if (instruction.opcode.setsWideRegister()) after.remove(destination + 1)
            val kind = when {
                at == source -> setValue
                move -> before[registers[1]] ?: 0
                cast -> before[destination] ?: 0
                else -> 0
            }
            if (kind != 0) after[destination] = kind
        }
        if (iteratorResult != null) {
            // Only this call enters its result instruction; the result itself cannot throw.
            after[instructions[iteratorResult].namedRegisters().single()] = iteratorValue
            normal[iteratorResult].forEach { enqueue(it, after) }
            exceptional[iteratorResult].forEach { enqueue(it, after) }
        } else normal[at].forEach { enqueue(it, after) }
        exceptional[at].forEach { enqueue(it, before) }
    }
    return true
}

/** Refuse a shared join rather than applying a filter to a value from an unverified path. */
private fun ControlFlow.hasOtherEntry(next: Int, previous: Int): Boolean =
    normal.indices.any { it != previous && next in normal[it] } || exceptional.any { next in it }

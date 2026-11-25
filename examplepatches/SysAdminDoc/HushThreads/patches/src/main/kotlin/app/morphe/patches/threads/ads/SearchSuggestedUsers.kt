/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 451 (2026-10-14).
 */
package app.morphe.patches.threads.ads

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.classesNoted
import app.morphe.patches.threads.misc.extension.freeLocalsAt
import app.morphe.patches.threads.misc.extension.parameterRegisterNumber
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.util.RegisterLiveness
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.argumentRegister
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.namedRegisters
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Hide suggested users"

/** The key Search's screen adds its Follow suggestions carousel to its list under. Threads keeps it from build to build. */
internal const val SEARCH_CAROUSEL_KEY = "standalone_suggested_users"

/** How every Compose note of Search's own screen begins. */
internal const val DISCOVERY_UI = "com.instagram.barcelona.search.discovery.ui."

/** Search's screen's source file, as its notes name it. */
internal const val DISCOVERY_FILE = "DiscoveryContent.kt"

internal const val SEARCH_SUGGESTIONS = "$EXTENSION_PACKAGE/search/SearchSuggestions;"
internal const val SHOW_SEARCH_CAROUSEL = "$SEARCH_SUGGESTIONS->showCarousel()Z"

private val INVOKES = setOf(
    Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE,
    Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE, Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE,
)

/**
 * Search's Follow suggestions carousel. [calls] is every call to the suggested accounts row under a
 * [DISCOVERY_FILE] note, and [row] the one the carousel draws with. In Search's list builder
 * [method], the read at [read] puts the carousel's list in [list], the emptiness check at [guard] is
 * the only way to the code from [start] that builds the carousel and adds it under [key], and
 * [away] is where the check goes for an empty list. [lambda] is the class that draws the carousel,
 * built at [init], and the hook may use register [free].
 */
internal class SearchCarousel(
    val calls: List<RowCall>, val row: RowCall, val method: MutableMethod, val read: Int, val list: Int,
    val guard: Int, val start: Int, val away: Int, val key: Int, val lambda: String, val init: Int, val free: Int,
)

/**
 * Finds where Search decides to show its Follow suggestions carousel, and refuses unless that place
 * is exactly what was read.
 *
 * Search's screen builds its list in one method, adding each part under a key of its own. The
 * carousel's key, [SEARCH_CAROUSEL_KEY], is in that method alone, past one check: that the
 * suggestions list it read isn't empty, Threads' own path for a Search without suggestions. Past the
 * check the method builds one lambda and adds it under the key, and the lambda draws the suggested
 * accounts row under a [DISCOVERY_FILE] note, handing it the list it was built with: the one that
 * was checked. Search's other call to the row draws suggestions mixed into its trends list, and
 * other screens' calls sit under their own notes, so neither is touched.
 */
internal fun BytecodePatchContext.searchSuggestionTargets(): SearchCarousel {
    val suggested = suggestedRow()
    val calls = classesNoted(DISCOVERY_UI)
        .filterNot { it.type == suggested.method.definingClass }
        .flatMap { it.methods }
        .distinctBy { it.descriptor() }
        .flatMap { it.rowCalls(suggested.entries) }
        .filter { it.note.isNoteOf(DISCOVERY_UI, DISCOVERY_FILE) }

    val builder = classDefByStrings(SEARCH_CAROUSEL_KEY, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_ROOT) }
        .flatMap { it.methods }
        .filter { method -> method.code().let { code -> code.indices.any { code.addsKeyAt(it) } } }
        .distinctBy { it.descriptor() }
        .singleOrPatchException("$PATCH: the method that adds Search's \"$SEARCH_CAROUSEL_KEY\" item")
    // Read through the mutable copy, so what's checked is what the hook goes into.
    val method = mutableClassDefBy(builder.definingClass).findMutableMethodOf(builder)
    val code = method.code()
    val key = code.indices.filter { code.addsKeyAt(it) }
        .singleOrPatchException("$PATCH: \"$SEARCH_CAROUSEL_KEY\" in ${method.descriptor()}")
    val entry = method.soleEntry(key, "Search's Follow suggestions carousel")

    // The check reads whether the list it was handed is empty, and leaves only an empty one behind.
    val guard = code[entry.guard]
    val into = when (guard.opcode) {
        Opcode.IF_NEZ -> entry.start == entry.guard + 1
        Opcode.IF_EQZ -> entry.start != entry.guard + 1
        else -> false
    }
    val result = (guard as? OneRegisterInstruction)?.let { method.sourceOrNull(entry.guard, it.registerA) }
        ?.at?.takeIf { it > 0 && code[it].opcode == Opcode.MOVE_RESULT }
    val asked = result?.minus(1)?.takeIf { code[it].isEmptyCheck() }
    val receiver = asked?.let { at -> code[at].namedRegisters().singleOrNull()?.let { at to it } }
    val read = receiver?.let { (at, register) -> method.sourceOrNull(at, register) }?.at?.takeIf { it >= 0 }
    val field = read?.let { code[it] }?.takeIf { it.opcode == Opcode.IGET_OBJECT }?.getReference<FieldReference>()
    if (!into || read == null || field == null) {
        throw PatchException("$PATCH: ${method.descriptor()} doesn't add its carousel only past a check that the list it reads isn't empty")
    }
    val list = (code[read] as TwoRegisterInstruction).registerA

    // Past the check it builds one lambda, and the item the key names draws that lambda.
    val allocation = (entry.start until key).filter { code[it].opcode == Opcode.NEW_INSTANCE }
        .singleOrPatchException("$PATCH: the carousel built in ${method.descriptor()}")
    val lambda = code[allocation].getReference<TypeReference>()!!.type
    val init = (allocation + 1 until key).filter { at ->
        code[at].opcode in setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE) &&
            code[at].getReference<MethodReference>()?.let { it.definingClass == lambda && it.name == "<init>" } == true &&
            method.sourceOrNull(at, code[at].argumentRegister(0)!!)?.at == allocation
    }.singleOrPatchException("$PATCH: the construction of the carousel ${method.descriptor()} allocates at $allocation")
    val item = (key + 1).takeIf { it < code.size && code[it].opcode in INVOKES }
    val keyRegister = (code[key] as OneRegisterInstruction).registerA
    if (item == null || keyRegister !in code[item].namedRegisters() ||
        code[item].namedRegisters().none { method.draws(item, it, allocation) }
    ) {
        throw PatchException("$PATCH: ${method.descriptor()} doesn't add the carousel it builds at $allocation under \"$SEARCH_CAROUSEL_KEY\"")
    }

    // The lambda draws the row once under a Search note, handing it the list it was built with.
    val lambdaClass = mutableClassDefBy(lambda)
    val row = lambdaClass.methods.flatMap { it.rowCalls(suggested.entries) }
        .filter { it.note.isNoteOf(DISCOVERY_UI, DISCOVERY_FILE) }
        .singleOrPatchException("$PATCH: the suggested accounts row $lambda draws under a $DISCOVERY_FILE note")
    val handed = row.listParameters(lambdaClass.methods.toList())
    val constructor = code[init].getReference<MethodReference>()!!
    val checked = handed.filter { parameter ->
        val register = code[init].argumentRegister(1 + constructor.wordOffset(parameter.constructorIndex))
        register != null && method.sourceOrNull(init, register) == Source(read, list) &&
            row.callee.parameterTypes[parameter.rowIndex].toString() == field.type
    }
    checked.singleOrPatchException("$PATCH: the list $lambda hands the row, the one ${method.descriptor()} checks at ${entry.guard}")

    // Leaving by the check's other side has to look to Threads as if the check went that way, so
    // nothing past it may read what the check compared.
    val live = RegisterLiveness.of(method).liveInto(entry.away)
    val compared = guard.namedRegisters().filter { it in live }
    if (compared.isNotEmpty()) {
        throw PatchException(
            "$PATCH: ${method.descriptor()} reads ${compared.joinToString { "v$it" }} again past its check at " +
                "${entry.guard}, so leaving the carousel's path there wouldn't match Threads' own",
        )
    }
    val free = method.freeLocalsAt(PATCH, entry.start, 1, listOf(entry.away), highest = 255).single()
    return SearchCarousel(calls, row, method, read, list, entry.guard, entry.start, entry.away, key, lambda, init, free)
}

/** Puts the hook in. Call only with what [searchSuggestionTargets] found, before anything else changes that method. */
internal fun hookSearchSuggestions(carousel: SearchCarousel) {
    val method = carousel.method
    val free = carousel.free
    // Labels stay on the instruction they were on, so a branch into the carousel's path still reaches the hook.
    method.addInstructionsAtControlFlowLabel(
        carousel.start,
        """
            invoke-static { }, $SHOW_SEARCH_CAROUSEL
            move-result v$free
            if-eqz v$free, :away
        """,
        ExternalLabel("away", method.getInstruction(carousel.away)),
    )
}

private fun Instruction.isKey() =
    (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
        getReference<StringReference>()?.string == SEARCH_CAROUSEL_KEY

/**
 * Whether [at] loads the carousel's key and hands it straight to a call that adds an item under it.
 * From 452 Search also compares each item's key with it, through `equals`, when it logs how far the
 * list was scrolled, and that method adds nothing.
 */
private fun List<Instruction>.addsKeyAt(at: Int): Boolean {
    if (!this[at].isKey()) return false
    val next = getOrNull(at + 1)?.takeIf { it.opcode in INVOKES } ?: return false
    val call = next.getReference<MethodReference>() ?: return false
    return !(call.name == "equals" && call.returnType == "Z" && call.parameterTypes.size == 1)
}

/** A call of a list's own `isEmpty()`, on nothing but the list. */
private fun Instruction.isEmptyCheck(): Boolean {
    val call = getReference<MethodReference>() ?: return false
    return opcode in INVOKES && opcode != Opcode.INVOKE_STATIC && opcode != Opcode.INVOKE_STATIC_RANGE &&
        call.name == "isEmpty" && call.returnType == "Z" && call.parameterTypes.isEmpty()
}

/**
 * Whether [register] holds, at [at], the lambda allocated at [allocation], as it is or as Compose's
 * wrapper made it from the lambda.
 */
private fun Method.draws(at: Int, register: Int, allocation: Int): Boolean {
    val source = sourceOrNull(at, register) ?: return false
    if (source.at == allocation) return true
    val code = code()
    if (source.at < 1 || code[source.at].opcode != Opcode.MOVE_RESULT_OBJECT) return false
    val wrap = code[source.at - 1]
    if (wrap.opcode != Opcode.INVOKE_STATIC && wrap.opcode != Opcode.INVOKE_STATIC_RANGE) return false
    return wrap.namedRegisters().any { sourceOrNull(source.at - 1, it)?.at == allocation }
}

/** A list the row is handed at its parameter [rowIndex], which its lambda's constructor took as parameter [constructorIndex]. */
private class Handed(val rowIndex: Int, val constructorIndex: Int)

/**
 * The row's object arguments the lambda reads from its own fields, each traced to the one constructor
 * parameter that fills that field and nothing else writes.
 */
private fun RowCall.listParameters(methods: List<Method>): List<Handed> {
    val owner = method.definingClass
    val self = method.thisRegister()
    val code = method.code()
    return callee.parameterTypes.indices.filter { callee.parameterTypes[it].startsWith("L") }.mapNotNull { index ->
        val register = code[call].argumentRegister(callee.wordOffset(index)) ?: return@mapNotNull null
        val source = method.sourceOrNull(call, register)?.takeIf { it.at >= 0 } ?: return@mapNotNull null
        val read = code[source.at]
        val field = read.getReference<FieldReference>()
        if (read.opcode != Opcode.IGET_OBJECT || field == null || field.definingClass != owner ||
            method.sourceOrNull(source.at, (read as TwoRegisterInstruction).registerB) != Source(-1, self)
        ) {
            return@mapNotNull null
        }
        val stores = methods.flatMap { candidate ->
            val body = candidate.implementation?.instructions?.toList().orEmpty()
            body.indices.filter { body[it].opcode == Opcode.IPUT_OBJECT && body[it].getReference<FieldReference>()?.toString() == field.toString() }
                .map { candidate to it }
        }
        val (constructor, store) = stores.singleOrNull()?.takeIf { it.first.name == "<init>" } ?: return@mapNotNull null
        val stored = constructor.code()[store] as TwoRegisterInstruction
        if (constructor.sourceOrNull(store, stored.registerB) != Source(-1, constructor.thisRegister())) return@mapNotNull null
        val parameter = constructor.parameterTypes.indices.singleOrNull {
            constructor.sourceOrNull(store, stored.registerA) == Source(-1, constructor.parameterRegisterNumber(it))
        } ?: return@mapNotNull null
        Handed(index, parameter)
    }
}

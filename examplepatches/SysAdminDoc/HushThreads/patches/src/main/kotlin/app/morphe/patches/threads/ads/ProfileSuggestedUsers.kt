/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 450 (2026-10-09).
 */
package app.morphe.patches.threads.ads

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.threads.feed.reaching
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.freeLocalsAt
import app.morphe.patches.threads.misc.extension.localRegisterCount
import app.morphe.patches.threads.misc.extension.parameterRegisterNumber
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterLiveness
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.argumentRegister
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.namedRegisters
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.util.EnumSet

private const val PATCH = "Hide suggested users"

/** The Compose source note of Threads' suggested accounts row, the one Search, Activity and profiles share. */
internal const val SUGGESTED_ROW_NOTE = "com.instagram.barcelona.suggestedusers.ui.SuggestedUsersRow (SuggestedUsersRow.kt:"

/** How every Compose note of the profile's own screens begins. */
internal const val PROFILE_UI = "com.instagram.barcelona.profile.ui."

/** The profile screen's source file, as its notes name it. */
internal const val PROFILE_SCREEN_FILE = "ProfileScreen.kt"

/** The source file of the rows above a profile's tabs, as its notes name it. */
internal const val PROFILE_INFO_ROWS_FILE = "ProfileInfoRows.kt"

/** Threads keeps this class's name. It builds the list of rows above a profile's tabs. */
internal const val PROFILE_VIEW_MODEL = "Lcom/instagram/barcelona/profile/viewmodel/ProfileViewModel;"

internal const val PROFILE_SUGGESTIONS = "$EXTENSION_PACKAGE/profile/ProfileSuggestions;"
internal const val CAROUSEL = "$PROFILE_SUGGESTIONS->carousel(Ljava/lang/Object;)Ljava/lang/Object;"
internal const val SHOW_ROW = "$PROFILE_SUGGESTIONS->showRow()Z"

/** A Compose source note, `<function> (<File>.kt:<line>)`, which Threads keeps from build to build. */
private val NOTE = Regex("""^[^ ()]+ \(([A-Za-z0-9_]+\.kt):\d+\)$""")

private val CONDITIONALS = EnumSet.of(
    Opcode.IF_EQ, Opcode.IF_NE, Opcode.IF_LT, Opcode.IF_GE, Opcode.IF_GT, Opcode.IF_LE,
    Opcode.IF_EQZ, Opcode.IF_NEZ, Opcode.IF_LTZ, Opcode.IF_GEZ, Opcode.IF_GTZ, Opcode.IF_LEZ,
)

private val OBJECT_MOVES = EnumSet.of(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

/** One call to the suggested accounts row, and the Compose note governing it, if any. */
internal class RowCall(val method: Method, val call: Int, val callee: MethodReference, val note: String?)

/**
 * The profile screen's carousel check: in [method], the field read at [read] that puts the
 * carousel's list in [register], and the null check right after it at [guard] that builds the
 * carousel only when there is a list. The hook goes in at [guard].
 */
internal class ProfileCarousel(
    val method: MutableMethod, val read: Int, val guard: Int, val register: Int, val list: FieldReference,
)

/**
 * The profile view model's suggestions row: in [method], the check at [guard] that is the only way
 * to the code from [start] that adds the row, the place [away] that check goes otherwise, and a
 * register [free] the hook may use there.
 */
internal class ProfileRow(val method: MutableMethod, val guard: Int, val start: Int, val away: Int, val free: Int)

/**
 * Everything the profile part of Hide suggested users needs: the row composable [row], every call
 * to it in the profile's classes [calls], the two that belong to profiles, and their two checks.
 */
internal class ProfileSuggestionTargets(
    val row: Method, val calls: List<RowCall>, val screen: RowCall, val infoRows: RowCall,
    val carousel: ProfileCarousel, val headerRow: ProfileRow,
)

/**
 * Finds where a profile decides to show suggested accounts, and refuses unless each place is
 * exactly what was read.
 *
 * Threads draws suggested accounts with one row composable, found by its kept source note. Search,
 * Activity, topic pages and profiles all call it, often from lambdas Redex has merged into one class
 * with a switch, so each call belongs to the nearest Compose note above it that can reach it, never
 * to its class. Exactly one call has to sit under a [PROFILE_SCREEN_FILE] note and one under a
 * [PROFILE_INFO_ROWS_FILE] note.
 *
 * The profile screen's call is in a lambda that hands the row a list it was built with. The screen
 * builds that lambda in one place, from a list it reads out of the profile's state, and only past a
 * null check on that list: Threads' own path for a profile without suggestions. The hook goes
 * between the read and the check.
 *
 * The info rows' call hands the row a list it reads from a row object. The profile view model makes
 * that row in one place, and only past one check, whose other side is Threads' own path for
 * suggestions that aren't ready. The hook goes at the start of the row's path and leaves by that
 * other side.
 */
internal fun BytecodePatchContext.profileSuggestionTargets(): ProfileSuggestionTargets {
    val row = classDefByStrings(SUGGESTED_ROW_NOTE, StringComparisonType.STARTS_WITH)
        .filterNot { it.type.startsWith(EXTENSION_ROOT) }
        .flatMap { it.methods }
        .filter { method -> method.implementation?.instructions?.any { it.note()?.startsWith(SUGGESTED_ROW_NOTE) == true } == true }
        .distinctBy { it.descriptor() }
        .singleOrPatchException("$PATCH: Threads' suggested accounts row, the method holding \"$SUGGESTED_ROW_NOTE\"")
    if (!AccessFlags.STATIC.isSet(row.accessFlags)) throw PatchException("$PATCH: the suggested accounts row ${row.descriptor()} isn't static")
    // The default-argument overloads the row's own class keeps next to it, which callers use instead.
    val entries = (listOf(row) + classDefBy(row.definingClass).methods.filter { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.descriptor() != row.descriptor() &&
            method.implementation?.instructions?.any { it.getReference<MethodReference>()?.descriptor() == row.descriptor() } == true
    }).map { it.descriptor() }.toSet()

    val profile = classDefByStrings(PROFILE_UI, StringComparisonType.STARTS_WITH)
        .filterNot { it.type.startsWith(EXTENSION_ROOT) || it.type == row.definingClass }
        .flatMap { it.methods }
        .distinctBy { it.descriptor() }
    val calls = profile.flatMap { it.rowCalls(entries) }
    val screen = calls.filter { it.note.isProfileNote(PROFILE_SCREEN_FILE) }
        .singleOrPatchException("$PATCH: the suggested accounts row under a $PROFILE_SCREEN_FILE note")
    val infoRows = calls.filter { it.note.isProfileNote(PROFILE_INFO_ROWS_FILE) }
        .singleOrPatchException("$PATCH: the suggested accounts row under a $PROFILE_INFO_ROWS_FILE note")

    val (list, rowType) = infoRows.rowData()
    val carousel = carousel(screen, list, profile)
    val headerRow = headerRow(rowType)
    return ProfileSuggestionTargets(row, calls, screen, infoRows, carousel, headerRow)
}

/** Puts both hooks in. Call only with what [profileSuggestionTargets] found, before anything else changes those methods. */
internal fun hookProfileSuggestions(targets: ProfileSuggestionTargets) {
    val carousel = targets.carousel
    val list = carousel.register
    // The list goes through the extension and back into its own register, as the type it was read as.
    carousel.method.addInstructions(
        carousel.guard,
        """
            invoke-static/range { v$list .. v$list }, $CAROUSEL
            move-result-object v$list
            check-cast v$list, ${carousel.list.type}
        """,
    )
    val row = targets.headerRow
    val free = row.free
    // Labels stay on the instruction they were on, so a branch into the row's path still reaches the hook.
    row.method.addInstructionsAtControlFlowLabel(
        row.start,
        """
            invoke-static { }, $SHOW_ROW
            move-result v$free
            if-eqz v$free, :away
        """,
        ExternalLabel("away", row.method.getInstruction(row.away)),
    )
}

/** The note this instruction loads, when it loads a Compose source note. */
private fun Instruction.note(): String? =
    if (opcode != Opcode.CONST_STRING && opcode != Opcode.CONST_STRING_JUMBO) null
    else getReference<StringReference>()?.string?.takeIf { NOTE.matches(it) }

/** Whether this is a note of the profile's own screens from [file]. */
private fun String?.isProfileNote(file: String): Boolean =
    this != null && startsWith(PROFILE_UI) && NOTE.matchEntire(this)?.groupValues?.get(1) == file

private fun MethodReference.descriptor() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList()
    ?: throw PatchException("$PATCH: ${descriptor()} has no body")

/** How many registers come before parameter [index] in a call, `this` aside. */
private fun MethodReference.wordOffset(index: Int): Int =
    parameterTypes.take(index).sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }

private fun Method.thisRegister(): Int {
    if (AccessFlags.STATIC.isSet(accessFlags)) throw PatchException("$PATCH: ${descriptor()} is static, so it has no this")
    return localRegisterCount()
}

/** Whether [to] can run after [from], along branches, switches and handlers. */
private fun ControlFlow.reaches(from: Int, to: Int): Boolean {
    val seen = BooleanArray(instructions.size)
    val pending = ArrayDeque<Int>()
    seen[from] = true
    pending += from
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == to) return true
        (normal[at] + exceptional[at]).forEach { if (!seen[it]) { seen[it] = true; pending += it } }
    }
    return false
}

/**
 * The Compose note nearest above [at], when it can reach [at]. A note further up, or one that can't
 * reach it, belongs to another lambda Redex merged into the same method.
 */
private fun ControlFlow.governingNote(at: Int): String? {
    for (index in at - 1 downTo 0) {
        val note = instructions[index].note() ?: continue
        return note.takeIf { reaches(index, at) }
    }
    return null
}

private fun Method.rowCalls(entries: Set<String>): List<RowCall> {
    val body = implementation?.instructions?.toList() ?: return emptyList()
    val sites = body.indices.filter { at ->
        (body[at].opcode == Opcode.INVOKE_STATIC || body[at].opcode == Opcode.INVOKE_STATIC_RANGE) &&
            body[at].getReference<MethodReference>()?.descriptor() in entries
    }
    if (sites.isEmpty()) return emptyList()
    val flow = ControlFlow.of(this)
    return sites.map { RowCall(this, it, body[it].getReference<MethodReference>()!!, flow.governingNote(it)) }
}

/** Where a value was made: the instruction at [at] that wrote it into [register], or at -1 the method's own [register] on entry. */
private data class Source(val at: Int, val register: Int)

/**
 * Where the value [register] holds at [at] was made, followed back through object moves and casts.
 * Null when more than one write can reach it, or a write and the method's entry.
 */
private fun Method.sourceOrNull(at: Int, register: Int): Source? {
    val code = code()
    var index = at
    var held = register
    repeat(code.size) {
        val reaching = reaching(index, setOf(held))
        if (reaching.writes.isEmpty()) return if (reaching.fromEntry) Source(-1, held) else null
        if (reaching.fromEntry || reaching.writes.size != 1) return null
        val write = reaching.writes.single()
        when (code[write].opcode) {
            Opcode.CHECK_CAST -> index = write
            in OBJECT_MOVES -> {
                index = write
                held = (code[write] as TwoRegisterInstruction).registerB
            }
            else -> return Source(write, held)
        }
    }
    return null
}

/**
 * The info rows' call hands the row a list it reads from a row object, `((Row) this.row).list`:
 * answers that list's type and the row's type. Exactly one argument may come that way.
 */
private fun RowCall.rowData(): Pair<String, String> {
    val owner = method.definingClass
    val self = method.thisRegister()
    val code = method.code()
    val found = callee.parameterTypes.indices.filter { callee.parameterTypes[it].startsWith("L") }.mapNotNull { index ->
        val register = code[call].argumentRegister(callee.wordOffset(index)) ?: return@mapNotNull null
        val source = method.sourceOrNull(call, register)?.takeIf { it.at >= 0 } ?: return@mapNotNull null
        val read = code[source.at]
        val field = read.getReference<FieldReference>()
        if (read.opcode != Opcode.IGET_OBJECT || field == null || field.definingClass == owner) return@mapNotNull null
        // The row object is this lambda's own captured row, cast to the row's type.
        val holder = (read as TwoRegisterInstruction).registerB
        val cast = method.reaching(source.at, setOf(holder)).takeIf { !it.fromEntry }?.writes?.singleOrNull()
            ?: return@mapNotNull null
        if (code[cast].opcode != Opcode.CHECK_CAST || code[cast].getReference<TypeReference>()?.type != field.definingClass) {
            return@mapNotNull null
        }
        val captured = method.sourceOrNull(cast, holder)?.takeIf { it.at >= 0 } ?: return@mapNotNull null
        val capture = code[captured.at]
        if (capture.opcode != Opcode.IGET_OBJECT || capture.getReference<FieldReference>()?.definingClass != owner ||
            method.sourceOrNull(captured.at, (capture as TwoRegisterInstruction).registerB) != Source(-1, self)
        ) {
            return@mapNotNull null
        }
        Triple(index, field.type, field.definingClass)
    }
    val (index, list, rowType) = found.singleOrPatchException(
        "$PATCH: the list ${method.descriptor()} reads from its own row for the suggested accounts row",
    )
    if (callee.parameterTypes[index].toString() != list) {
        throw PatchException("$PATCH: ${callee.descriptor()} takes a ${callee.parameterTypes[index]} where the profile's row hands it a $list")
    }
    return list to rowType
}

/**
 * The profile screen's carousel: the lambda holding the screen's row call hands the row a list it
 * keeps in a field, its constructor fills that field from one parameter, and the screen builds the
 * lambda once, from a list it reads out of a field and checks for null right away.
 */
private fun BytecodePatchContext.carousel(screen: RowCall, list: String, profile: List<Method>): ProfileCarousel {
    val lambda = screen.method
    val owner = lambda.definingClass
    val index = screen.callee.parameterTypes.indices.filter { screen.callee.parameterTypes[it].toString() == list }
        .singleOrPatchException("$PATCH: the list among ${screen.callee.descriptor()}'s parameters")
    val code = lambda.code()
    val argument = code[screen.call].argumentRegister(screen.callee.wordOffset(index))
        ?: throw PatchException("$PATCH: ${lambda.descriptor()} hands the row no list")
    val source = lambda.sourceOrNull(screen.call, argument)?.takeIf { it.at >= 0 }
        ?: throw PatchException("$PATCH: ${lambda.descriptor()} sets the list it hands the row on more than one path")
    val captured = code[source.at].takeIf { it.opcode == Opcode.IGET_OBJECT }?.getReference<FieldReference>()
        ?.takeIf { it.definingClass == owner }
        ?: throw PatchException("$PATCH: ${lambda.descriptor()} doesn't hand the row a list it was built with")
    if (lambda.sourceOrNull(source.at, (code[source.at] as TwoRegisterInstruction).registerB) != Source(-1, lambda.thisRegister())) {
        throw PatchException("$PATCH: ${lambda.descriptor()} reads the row's list from something other than itself")
    }

    // One constructor parameter goes into that field, and nothing else writes it.
    val stores = classDefBy(owner).methods.flatMap { method ->
        val body = method.implementation?.instructions?.toList().orEmpty()
        body.indices.filter { body[it].opcode == Opcode.IPUT_OBJECT && body[it].getReference<FieldReference>()?.toString() == captured.toString() }
            .map { method to it }
    }
    val (constructor, store) = stores.singleOrPatchException("$PATCH: the one write of $captured")
    val stored = constructor.code()[store] as TwoRegisterInstruction
    val parameter = constructor.parameterTypes.indices.singleOrNull {
        constructor.sourceOrNull(store, stored.registerA) == Source(-1, constructor.parameterRegisterNumber(it))
    }
    if (constructor.name != "<init>" || parameter == null ||
        constructor.sourceOrNull(store, stored.registerB) != Source(-1, constructor.thisRegister())
    ) {
        throw PatchException("$PATCH: ${constructor.descriptor()} doesn't fill $captured from one of its own parameters")
    }

    // The screen builds that lambda once, under a profile screen note.
    val built = profile.filter { method ->
        val body = method.implementation?.instructions?.toList().orEmpty()
        val allocations = body.indices.filter { body[it].allocates(owner) }
        allocations.isNotEmpty() && ControlFlow.of(method).let { flow -> allocations.any { flow.governingNote(it).isProfileNote(PROFILE_SCREEN_FILE) } }
    }.singleOrPatchException("$PATCH: the $PROFILE_SCREEN_FILE method that builds the suggested accounts carousel")
    // Read through the mutable copy, so what's checked is what the hook goes into.
    val method = mutableClassDefBy(built.definingClass).findMutableMethodOf(built)
    val flow = ControlFlow.of(method)
    val body = flow.instructions
    val allocation = body.indices.filter { body[it].allocates(owner) && flow.governingNote(it).isProfileNote(PROFILE_SCREEN_FILE) }
        .singleOrPatchException("$PATCH: the carousel built in ${method.descriptor()}")
    val init = (allocation + 1 until body.size).firstOrNull { at ->
        (body[at].opcode == Opcode.INVOKE_DIRECT || body[at].opcode == Opcode.INVOKE_DIRECT_RANGE) &&
            body[at].getReference<MethodReference>()?.descriptor() == constructor.descriptor() &&
            method.sourceOrNull(at, body[at].argumentRegister(0)!!)?.at == allocation
    } ?: throw PatchException("$PATCH: ${method.descriptor()} never constructs the carousel it allocates at $allocation")
    val handed = body[init].argumentRegister(1 + constructor.wordOffset(parameter))
        ?: throw PatchException("$PATCH: ${method.descriptor()} hands the carousel no list")
    val read = method.sourceOrNull(init, handed)?.at?.takeIf { it >= 0 }
        ?: throw PatchException("$PATCH: ${method.descriptor()} sets the carousel's list on more than one path")
    val field = body[read].takeIf { it.opcode == Opcode.IGET_OBJECT }?.getReference<FieldReference>()?.takeIf { it.type == list }
        ?: throw PatchException("$PATCH: ${method.descriptor()} doesn't hand the carousel a list it reads from a field")
    val register = (body[read] as TwoRegisterInstruction).registerA

    // The read is followed straight away by the null check that is the only way to the carousel.
    val entry = method.soleEntry(allocation, "the suggested accounts carousel")
    val guard = body[entry.guard]
    val into = when (guard.opcode) {
        Opcode.IF_NEZ -> entry.start != entry.guard + 1
        Opcode.IF_EQZ -> entry.start == entry.guard + 1
        else -> false
    }
    if (!into || (guard as OneRegisterInstruction).registerA != register || entry.guard != read + 1 ||
        entry.into(entry.guard) != listOf(read)
    ) {
        throw PatchException("$PATCH: ${method.descriptor()} doesn't build its carousel only past a null check of the list it reads at $read")
    }
    if (register > 255) throw PatchException("$PATCH: ${method.descriptor()} keeps the carousel's list in v$register, past move-result's reach")
    // The hook casts the list back to its own type, which the screen's class has to be able to see.
    if (field.type.substringBeforeLast('/') != method.definingClass.substringBeforeLast('/') &&
        classDefByOrNull(field.type)?.let { AccessFlags.PUBLIC.isSet(it.accessFlags) } != true
    ) {
        throw PatchException("$PATCH: ${method.definingClass} can't name the list type ${field.type}")
    }
    return ProfileCarousel(method, read, entry.guard, register, field)
}

/**
 * The profile view model's suggestions row: the one method of [PROFILE_VIEW_MODEL] that makes a
 * [rowType], the check that is the only way there, and a register free at the start of that path.
 */
private fun BytecodePatchContext.headerRow(rowType: String): ProfileRow {
    val viewModel = classDefByOrNull(PROFILE_VIEW_MODEL)
        ?: throw PatchException("$PATCH: Threads carries no profile view model $PROFILE_VIEW_MODEL")
    val builder = viewModel.methods.filter { method -> method.implementation?.instructions?.any { it.allocates(rowType) } == true }
        .singleOrPatchException("$PATCH: the profile view model's method that adds the suggested accounts row")
    val method = mutableClassDefBy(viewModel.type).findMutableMethodOf(builder)
    val code = method.code()
    val allocation = code.indices.filter { code[it].allocates(rowType) }
        .singleOrPatchException("$PATCH: the suggested accounts row made in ${method.descriptor()}")
    val entry = method.soleEntry(allocation, "the suggested accounts row")
    // Leaving by the check's other side has to look to Threads as if the check went that way, so
    // nothing past it may read what the check compared.
    val live = RegisterLiveness.of(method).liveInto(entry.away)
    val compared = code[entry.guard].namedRegisters().filter { it in live }
    if (compared.isNotEmpty()) {
        throw PatchException(
            "$PATCH: ${method.descriptor()} reads ${compared.joinToString { "v$it" }} again past its check at " +
                "${entry.guard}, so leaving the row's path there wouldn't match Threads' own",
        )
    }
    val free = method.freeLocalsAt(PATCH, entry.start, 1, listOf(entry.away), highest = 255).single()
    return ProfileRow(method, entry.guard, entry.start, entry.away, free)
}

private fun Instruction.allocates(type: String) =
    opcode == Opcode.NEW_INSTANCE && getReference<TypeReference>()?.type == type

/** The check at [guard] that is the only way into the code from [start], and where it goes otherwise, [away]. */
private class SoleEntry(val guard: Int, val start: Int, val away: Int, private val predecessors: Array<List<Int>>) {
    fun into(index: Int): List<Int> = predecessors[index]
}

/**
 * Walks back from [target] while each instruction is reached only by falling from the one above,
 * and answers the conditional branch that is then the single way in. Refuses anything else: a jump,
 * a switch or a handler into the stretch, or a stretch reached from more than one place.
 */
private fun Method.soleEntry(target: Int, what: String): SoleEntry {
    val flow = ControlFlow.of(this)
    val code = flow.instructions
    val into = Array(code.size) { mutableListOf<Int>() }
    for (from in code.indices) (flow.normal[from] + flow.exceptional[from]).forEach { into[it] += from }
    var start = target
    while (start > 0 && into[start] == listOf(start - 1) && code[start - 1].opcode !in CONDITIONALS) start--
    val guard = into[start].singleOrNull()
    if (guard == null || code[guard].opcode !in CONDITIONALS) {
        throw PatchException("$PATCH: $what in ${descriptor()} is reached from ${into[start]} at instruction $start, not through one check")
    }
    val away = flow.normal[guard].filter { it != start }.singleOrNull()
        ?: throw PatchException("$PATCH: the check at $guard in ${descriptor()} has no way past $what")
    return SoleEntry(guard, start, away, Array(code.size) { into[it].toList() })
}

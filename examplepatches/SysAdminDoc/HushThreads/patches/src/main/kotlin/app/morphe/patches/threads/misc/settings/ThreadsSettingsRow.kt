/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 449 and 448 (2026-10-05).
 */
package app.morphe.patches.threads.misc.settings

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.writeStub
import app.morphe.patches.threads.misc.theme.holdsNote
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "HushThreads settings"

internal const val SETTINGS_ROW = "$EXTENSION_PACKAGE/settings/ThreadsSettingsRow;"
internal const val SETTINGS_ROW_CLICK = "$EXTENSION_PACKAGE/settings/ThreadsSettingsRow\$Click;"
internal const val ADD_SETTINGS_ROW = "$SETTINGS_ROW->add(Ljava/lang/Object;)V"

internal const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"

/** Compose's note in Threads' settings row. It names the source file, so it survives Redex. */
internal const val ROW_NOTE = "com.instagram.barcelona.settings.SettingsRow (SettingsScreen.kt:"

/**
 * Compose's note in the row Threads draws Accounts Center with, which takes its title and subtitle
 * as text. Threads looks every string id up in its downloaded string packs before its resources,
 * so a label added to its resources would show whatever string the packs hold for that id.
 */
internal const val ACCOUNTS_ROW_NOTE = "com.instagram.barcelona.settings.AccountsCenterRow (SettingsScreen.kt:"

/** Compose's note in the lambda that draws each entry of Threads' settings list. */
internal const val LIST_NOTE = "com.instagram.barcelona.settings.SettingsScreen.<anonymous>"

/** The entry of Threads' settings list the row goes above. Redex keeps an enum constant's name. */
internal const val MORE_ENTRY = "MORE"

/**
 * Where the row goes: the list lambda, the index of the goto that ends its More settings case, the
 * composer's register there, the row Threads draws Accounts Center with, and the modifier the
 * shared run passes Threads' settings row.
 */
internal data class SettingsRowSite(
    val list: Method,
    val hookAt: Int,
    val composer: Int,
    val row: Method,
    val modifier: FieldReference,
)

/**
 * Puts a HushThreads row just above More settings in Threads' own settings. Threads draws it with
 * the row it draws Accounts Center with, so it looks, scales and reads to TalkBack like its
 * neighbors, and a tap opens the HushThreads screen through SettingsEntry like the other ways in.
 */
internal fun BytecodePatchContext.addThreadsSettingsRow() {
    val site = settingsRowSite()
    implementFunction0(SETTINGS_ROW_CLICK)
    val composerType = site.row.parameterTypes[0]
    val modifier = "${site.modifier.definingClass}->${site.modifier.name}:${site.modifier.type}"
    // Every argument given, so no default applies, and nothing marked unchanged, so Compose
    // compares each. The last flag draws a badge dot beside the title; the row has none.
    writeStub(SETTINGS_ROW, "showRow", 14, """
        move-object/from16 v0, p0
        check-cast v0, $composerType
        sget-object v1, $modifier
        move-object/from16 v2, p2
        move-object/from16 v3, p3
        move-object/from16 v4, p1
        check-cast v4, $FUNCTION0
        move/from16 v5, p4
        const/4 v6, 0x0
        const/4 v7, 0x0
        const/4 v8, 0x0
        invoke-static/range { v0 .. v8 }, ${site.row.signature()}
        return-void
    """)
    mutableClassDefBy(site.list.definingClass).findMutableMethodOf(site.list).addInstruction(
        site.hookAt,
        "invoke-static/range { v${site.composer} .. v${site.composer} }, $ADD_SETTINGS_ROW",
    )
}

/** Makes the extension's [type] a Kotlin Function0, which it already answers with invoke(). */
internal fun BytecodePatchContext.implementFunction0(type: String, patch: String = PATCH) {
    val function0 = classDefByOrNull(FUNCTION0)
        ?: throw PatchException("$patch: Threads carries no $FUNCTION0")
    if (!AccessFlags.INTERFACE.isSet(function0.accessFlags) ||
        function0.methods.none { it.name == "invoke" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/Object;" }
    ) throw PatchException("$patch: $FUNCTION0 isn't an interface with invoke()")
    val click = mutableClassDefBy(type)
    if (click.methods.none {
            it.name == "invoke" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/Object;" &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
        }
    ) throw PatchException("$patch: $type has no public invoke()")
    if (FUNCTION0 !in click.interfaces) click.interfaces.add(FUNCTION0)
}

/**
 * Reads where the row goes and refuses a build where any of it differs from what was read on 449
 * and 448: one settings row taking (composer, modifier, Integer, Function0, int, int, int, int,
 * boolean); one Accounts Center row taking (composer, modifier, String, String, Function0, int,
 * int, int, boolean); one list lambda that switches on its entry enum's ordinal and draws More
 * settings with a case that starts the entry's group on the composer, sets its click, label and
 * icon and goes to a straight run, shared with other entries, that loads the modifier and two
 * literals and calls the settings row.
 */
internal fun BytecodePatchContext.settingsRowSite(): SettingsRowSite {
    val row = classDefByStrings(ROW_NOTE, StringComparisonType.STARTS_WITH).flatMap { it.methods }
        .filter { it.holdsNote(ROW_NOTE) }
        .distinctBy { it.signature() }
        .singleOrPatchException("$PATCH: Threads' settings row, the method holding \"$ROW_NOTE\"")
    val params = row.parameterTypes.map { it.toString() }
    if (!AccessFlags.STATIC.isSet(row.accessFlags) || row.returnType != "V" || params.size != 9 ||
        params[2] != "Ljava/lang/Integer;" || params[3] != FUNCTION0 ||
        params.subList(4, 8).any { it != "I" } || params[8] != "Z"
    ) throw PatchException("$PATCH: Threads' settings row has changed shape: ${row.signature()}")
    val rowSignature = row.signature()
    val accountsRow = classDefByStrings(ACCOUNTS_ROW_NOTE, StringComparisonType.STARTS_WITH).flatMap { it.methods }
        .filter { it.holdsNote(ACCOUNTS_ROW_NOTE) }
        .distinctBy { it.signature() }
        .singleOrPatchException("$PATCH: Threads' Accounts Center row, the method holding \"$ACCOUNTS_ROW_NOTE\"")
    val accountsParams = accountsRow.parameterTypes.map { it.toString() }
    if (!AccessFlags.STATIC.isSet(accountsRow.accessFlags) || accountsRow.returnType != "V" ||
        accountsParams != listOf(params[0], params[1], "Ljava/lang/String;", "Ljava/lang/String;", FUNCTION0, "I", "I", "I", "Z")
    ) throw PatchException("$PATCH: Threads' Accounts Center row has changed shape: ${accountsRow.signature()}")

    val lists = classDefByStrings(LIST_NOTE, StringComparisonType.STARTS_WITH).flatMap { it.methods }
        .filter { it.holdsNote(LIST_NOTE) && it.body().any { i -> i.method()?.signature() == rowSignature } }
        .filter { it.body().any { i -> i.opcode == Opcode.PACKED_SWITCH } }
        .distinctBy { it.signature() }
    val list = lists.singleOrPatchException("$PATCH: Threads' settings list, the lambda holding \"$LIST_NOTE\" that switches and draws settings rows")
    val body = list.body()
    val address = addresses(body)

    val switches = body.indices.filter { body[it].opcode == Opcode.PACKED_SWITCH }
    val switchAt = switches.singleOrNull()
        ?: throw PatchException("$PATCH: Threads' settings list has ${switches.size} packed switches, not one")
    val switchRegister = (body[switchAt] as OneRegisterInstruction).registerA
    val ordinalAt = lastWrite(body, switchAt, switchRegister)
    if (ordinalAt < 1 || body[ordinalAt].opcode != Opcode.MOVE_RESULT ||
        body[ordinalAt - 1].method()?.let { it.name == "ordinal" && it.parameterTypes.isEmpty() && it.returnType == "I" } != true
    ) throw PatchException("$PATCH: Threads' settings list doesn't switch on an enum's ordinal")
    val receiver = (body[ordinalAt - 1] as? FiveRegisterInstruction)?.registerC
        ?: throw PatchException("$PATCH: Threads' settings list asks for the ordinal with a range call")
    val castAt = lastWrite(body, ordinalAt - 1, receiver)
    val entries = body.getOrNull(castAt)?.takeIf { it.opcode == Opcode.CHECK_CAST }
        ?.getReference<TypeReference>()?.type
        ?: throw PatchException("$PATCH: Threads' settings list switches on an ordinal of no known type")
    val ordinal = enumOrdinals(entries)[MORE_ENTRY]
        ?: throw PatchException("$PATCH: $entries has no $MORE_ENTRY entry")

    val payloadAt = indexAt(address, address[switchAt] + (body[switchAt] as OffsetInstruction).codeOffset)
    val element = (body[payloadAt] as SwitchPayload).switchElements.singleOrNull { it.key == ordinal }
        ?: throw PatchException("$PATCH: Threads' settings list has no case for $MORE_ENTRY")
    val caseAt = indexAt(address, address[switchAt] + element.offset)
    val gotoAt = (caseAt until body.size).first { body[it].isBranchOrExit() }
    if (body[gotoAt].opcode !in GOTOS) {
        throw PatchException("$PATCH: Threads' $MORE_ENTRY case runs ${body[gotoAt].opcode.name} before it goes to the settings row")
    }
    val targets = branchTargets(body, address)
    if (targets.any { it in caseAt + 1..gotoAt }) {
        throw PatchException("$PATCH: Threads' settings list branches into its $MORE_ENTRY case")
    }
    val tailAt = indexAt(address, address[gotoAt] + (body[gotoAt] as OffsetInstruction).codeOffset)
    val callAt = (tailAt until body.size).first { body[it].isBranchOrExit() || body[it].method()?.signature() == rowSignature }
    val call = body[callAt] as? RegisterRangeInstruction
    if (call == null || body[callAt].opcode != Opcode.INVOKE_STATIC_RANGE) {
        throw PatchException("$PATCH: Threads' $MORE_ENTRY case reaches ${body[callAt].opcode.name} before the settings row")
    }

    val case = (caseAt until gotoAt).toList()
    val tail = (tailAt until callAt).toList()
    val composerType = params[0]
    val starts = case.filter { body[it].opcode == Opcode.INVOKE_INTERFACE && body[it].method()?.definingClass == composerType }
    val startAt = starts.singleOrNull()
        ?: throw PatchException("$PATCH: Threads' $MORE_ENTRY case calls its composer ${starts.size} times, not once")
    val composer = (body[startAt] as FiveRegisterInstruction).registerC

    // Each of the row's arguments, by the last instruction on the case's path that writes it.
    val path = case + tail
    fun writer(register: Int, before: Int): Int? = path.subList(0, before).lastOrNull { body[it].writes(register) }
    fun source(argument: Int): Int = writer(call.startRegister + argument, path.size)
        ?: throw PatchException("$PATCH: Threads' $MORE_ENTRY case doesn't set argument $argument of the settings row")
    // The same, followed back through the copies the shared run makes.
    fun origin(argument: Int): Int {
        var at = source(argument)
        while (body[at].opcode in MOVES) {
            at = writer((body[at] as TwoRegisterInstruction).registerB, path.indexOf(at))
                ?: throw PatchException("$PATCH: Threads' $MORE_ENTRY case doesn't set argument $argument of the settings row")
        }
        return at
    }
    val composerAt = source(0)
    val composerMove = body[composerAt]
    if (composerMove !is TwoRegisterInstruction || composerMove.opcode !in OBJECT_MOVES ||
        composerMove.registerB != composer
    ) throw PatchException("$PATCH: Threads' settings row isn't passed the composer the $MORE_ENTRY case starts its group on")
    // The hook reads the composer at the case's goto, so nothing after the group starts may change it.
    if (path.subList(path.indexOf(startAt) + 1, path.indexOf(composerAt)).any { body[it].writes(composer) }) {
        throw PatchException("$PATCH: Threads' $MORE_ENTRY case overwrites its composer, v$composer")
    }
    val modifierAt = origin(1)
    // Compose's Modifier companion, whose own type Threads' code passes as the modifier, so the
    // stub's call verifies as the shared run's does.
    val modifier = body[modifierAt].takeIf { it.opcode == Opcode.SGET_OBJECT }?.getReference<FieldReference>()
        ?.takeIf { modifierAt in tail }
        ?: throw PatchException("$PATCH: Threads' settings row isn't passed a modifier from a static field")
    for ((argument, what) in listOf(3 to "click", 4 to "label", 5 to "icon")) {
        if (origin(argument) !in case) throw PatchException("$PATCH: Threads' $MORE_ENTRY case doesn't set its own $what")
    }
    for (argument in listOf(4, 5)) {
        if (body[origin(argument)].literal() == null) throw PatchException("$PATCH: Threads' $MORE_ENTRY case sets argument $argument from no literal")
    }
    if (listOf(6, 7).any { body[origin(it)].literal() == null || origin(it) !in tail }) {
        throw PatchException("$PATCH: Threads' settings row isn't passed two literals by the run its entries share")
    }
    return SettingsRowSite(list, gotoAt, composer, accountsRow, modifier)
}

private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

private val OBJECT_MOVES = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

private val MOVES = OBJECT_MOVES + setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)

private val EXITS = setOf(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW)

/** Each constant of [type] by name, with the ordinal its static initializer gives it. */
private fun BytecodePatchContext.enumOrdinals(type: String): Map<String, Int> {
    val classDef = classDefByOrNull(type) ?: throw PatchException("$PATCH: Threads carries no $type")
    if (classDef.superclass != "Ljava/lang/Enum;") throw PatchException("$PATCH: $type isn't an enum")
    val initializer = classDef.methods.singleOrNull { it.name == "<clinit>" }
        ?: throw PatchException("$PATCH: $type has no static initializer")
    val strings = HashMap<Int, String>()
    val literals = HashMap<Int, Int>()
    val ordinals = HashMap<String, Int>()
    for (instruction in initializer.body()) {
        val method = instruction.method()
        if (method != null && method.definingClass == type && method.name == "<init>" &&
            method.parameterTypes.take(2).map { it.toString() } == listOf("Ljava/lang/String;", "I")
        ) {
            val registers = when (instruction) {
                is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE)
                is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + 3).toList()
                else -> continue
            }
            val name = strings[registers[1]] ?: continue
            val ordinal = literals[registers[2]] ?: continue
            if (ordinals.put(name, ordinal) != null) throw PatchException("$PATCH: $type builds $name twice")
            continue
        }
        val destination = (instruction as? OneRegisterInstruction)?.registerA ?: continue
        if (!instruction.opcode.setsRegister()) continue
        strings.remove(destination)
        literals.remove(destination)
        instruction.getReference<StringReference>()?.let { strings[destination] = it.string }
        instruction.literal()?.let { literals[destination] = it }
    }
    return ordinals
}

/** The index of the last instruction before [before] that writes [register], reading the code in order. */
private fun lastWrite(body: List<Instruction>, before: Int, register: Int): Int =
    (before - 1 downTo 0).firstOrNull { body[it].writes(register) } ?: -1

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val destination = (this as? OneRegisterInstruction)?.registerA ?: return false
    return destination == register || (opcode.setsWideRegister() && destination + 1 == register)
}

private fun Instruction.literal(): Int? = when (opcode) {
    Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16 -> (this as NarrowLiteralInstruction).narrowLiteral
    else -> null
}

private fun Instruction.isBranchOrExit(): Boolean = this is OffsetInstruction || opcode in EXITS

private fun Instruction.method(): MethodReference? = getReference<MethodReference>()

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun addresses(body: List<Instruction>): IntArray {
    var address = 0
    return IntArray(body.size) { i -> address.also { address += body[i].codeUnits } }
}

private fun indexAt(address: IntArray, target: Int): Int = address.indexOfFirst { it == target }
    .takeIf { it >= 0 } ?: throw PatchException("$PATCH: Threads' settings list branches between instructions")

/** Every index a branch or switch case of [body] lands on. */
private fun branchTargets(body: List<Instruction>, address: IntArray): Set<Int> {
    val targets = HashSet<Int>()
    for ((index, instruction) in body.withIndex()) {
        if (instruction !is OffsetInstruction) continue
        val target = address[index] + instruction.codeOffset
        if (instruction.opcode == Opcode.PACKED_SWITCH || instruction.opcode == Opcode.SPARSE_SWITCH) {
            val payload = body[indexAt(address, target)] as SwitchPayload
            payload.switchElements.forEach { targets.add(indexAt(address, address[index] + it.offset)) }
        } else if (instruction.opcode != Opcode.FILL_ARRAY_DATA) {
            targets.add(indexAt(address, target))
        }
    }
    return targets
}

private fun MethodReference.signature(): String = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.contactsblock

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val CONTACTS_BLOCK = "$EXTENSION_PACKAGE/misc/ContactsBlock;"
internal const val TELEGRAM_CONTACTS = "Lorg/telegram/messenger/ContactsController;->contacts:Ljava/util/ArrayList;"
internal const val FOLDERS_DIALOG_COUNT = "Lorg/telegram/messenger/MessagesController;->getAllFoldersDialogsCount()I"
private const val LIST_COPY = "Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V"
private const val LIST_SORT = "Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V"

@Suppress("unused")
val hideContactsBlockPatch = bytecodePatch(
    name = "Hide contacts on Telegram",
    description = "Adds a switch, off by default, that hides the Your contacts on Telegram list under a short chat list, with its heading and loading rows. Chats, folders, contact sync and search keep their usual behavior.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val methods = resolveContactsBlock()
        // Every hook is assembled on a copy first, so a refusal leaves the app untouched.
        methods.forEach { it.insert(MutableMethod(ImmutableMethod.of(it.method))) }
        methods.forEach { it.insert(it.method) }
        enableStatus("hideContactsBlock")
    }
}

/** One read the block's presentation branches on: the contacts copy, or the "still syncing" flag. */
internal data class ContactsBlockRead(val index: Int, val register: Int, val rows: Boolean)

internal class ContactsBlockMethod(val method: MutableMethod, val reads: List<ContactsBlockRead>) {
    fun insert(target: MutableMethod) = reads.sortedByDescending { it.index }.forEach { read ->
        val hook = if (read.rows) "rows(Ljava/util/ArrayList;)Ljava/util/ArrayList;" else "placeholder(Z)Z"
        val result = if (read.rows) "move-result-object" else "move-result"
        target.addInstructions(read.index + 1, """
            invoke-static/range {v${read.register} .. v${read.register}}, $CONTACTS_BLOCK->$hook
            $result v${read.register}
        """)
    }
}

/**
 * Telegram's chat-list adapter copies ContactsController.contacts into a list of its own when the
 * chat list is short, and keeps a flag for the time contacts are still syncing. Every place that
 * shows the block, its heading, its loading rows, the empty-list picture that makes room for it, or
 * the space it takes under the list asks one of those two fields whether it's there with a null or
 * false test. Those tests read through the hooks. The adapter's own work on the copy (building,
 * pruning, sorting) and the gate that decides when to build it keep reading the fields directly, so
 * switching back restores the very rows Telegram kept.
 */
internal fun BytecodePatchContext.resolveContactsBlock(): List<ContactsBlockMethod> {
    requireStatusMethod("hideContactsBlock")
    controlHook(CONTACTS_BLOCK, "rows", listOf("Ljava/util/ArrayList;"), "Ljava/util/ArrayList;")
    controlHook(CONTACTS_BLOCK, "placeholder", listOf("Z"), "Z")

    val builders = mutableListOf<Method>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.filterTo(builders) { method -> method.controlBody().let { body ->
            body.any { it.controlRef() == FOLDERS_DIALOG_COUNT } && body.any { it.controlRef() == TELEGRAM_CONTACTS }
        } }
    }
    val builder = builders.filter { method -> method.controlBody().any { it.controlRef() == LIST_COPY } }.controlSingle("chat-list contacts builder")
    val adapter = builder.definingClass
    val body = builder.controlBody()

    // new ArrayList(ContactsController.contacts), stored straight into the adapter's own field.
    val copy = body.indices.filter { body[it].controlRef() == LIST_COPY && body.getOrNull(it - 1)?.controlRef() == TELEGRAM_CONTACTS }
        .controlSingle("contacts copy")
    val store = body.getOrNull(copy + 1)
    val rowsField = store?.controlField()
    controlShape(store?.opcode == Opcode.IPUT_OBJECT && rowsField != null && rowsField.definingClass == adapter &&
        rowsField.type == "Ljava/util/ArrayList;" && body[copy].namedRegisters().let { args ->
            args.size == 2 && args[1] == (body[copy - 1] as OneRegisterInstruction).registerA && args[0] == store.namedRegisters().first()
        }, "the contacts copy no longer goes straight into the adapter")

    // The gate right before the folder count: while contacts sync, the copy isn't rebuilt.
    val count = body.indices.filter { body[it].controlRef() == FOLDERS_DIALOG_COUNT }.controlSingle("folder dialog count")
    val gate = body.getOrNull(count - 2)
    val updatingField = gate?.controlField()
    controlShape(gate?.opcode == Opcode.IGET_BOOLEAN && updatingField != null && updatingField.definingClass == adapter &&
        updatingField.type == "Z" && body[count - 1].opcode == Opcode.IF_NEZ &&
        body[count - 1].namedRegisters() == listOf((gate as OneRegisterInstruction).registerA),
        "the contacts sync gate changed")

    val rowReads = fieldReads(rowsField!!, Opcode.IGET_OBJECT)
    val updatingReads = fieldReads(updatingField!!, Opcode.IGET_BOOLEAN)

    // Sorting is the one other method that may test the copy: it leaves presentation alone.
    val sorters = rowReads.keys.filter { method -> method.controlBody().any { it.controlRef() == LIST_SORT } }
    val sorter = sorters.controlSingle("contacts sort")
    controlShape(sorter.definingClass == adapter && sorter.returnType == "V", "the contacts sort moved")

    val presentation = mutableMapOf<Method, MutableList<ContactsBlockRead>>()
    for ((method, reads) in rowReads) {
        if (method == sorter) continue
        val methodBody = method.controlBody()
        val tests = reads.filter { methodBody.nullTest(it) }
        if (method == builder) {
            // One test decides whether the block goes in; the rest read the copy it just built.
            controlShape(tests.size == 1, "the contacts block decision has ${tests.size} null tests")
        } else {
            // Any other read must follow its own null test, which the hook answers first, and none may
            // run on the way the test sends Telegram when the block is absent.
            controlShape(tests.size == 1 && reads.all { it >= tests.single() }, "a contacts reader skips its null test")
            val absent = ControlFlow.of(method).absentPath(tests.single())
            controlShape(reads.none { it in absent }, "a contacts reader reads the rows where the block is absent")
        }
        presentation.getOrPut(method) { mutableListOf() } += ContactsBlockRead(tests.single(), methodBody.register(tests.single()), rows = true)
    }
    controlShape(presentation.size == 4, "contacts block readers changed (${presentation.size} found)")

    var placeholders = 0
    for ((method, reads) in updatingReads) {
        val methodBody = method.controlBody()
        val gates = reads.filter { it == count - 2 && method == builder }
        val tests = reads.filter { it !in gates && methodBody.getOrNull(it + 1)?.opcode == Opcode.IF_EQZ &&
            methodBody[it + 1].namedRegisters() == listOf(methodBody.register(it)) }
        controlShape(gates.size + tests.size == reads.size, "a contacts sync reader isn't a gate or a test")
        tests.forEach { presentation.getOrPut(method) { mutableListOf() } += ContactsBlockRead(it, methodBody.register(it), rows = false) }
        placeholders += tests.size
    }
    controlShape(placeholders == 3, "contacts loading rows readers changed ($placeholders found)")

    return presentation.map { (method, reads) ->
        val mutable = mutableClassDefBy(method.definingClass).methods.filter { it.toString() == method.toString() }
            .controlSingle("contacts reader ${method.name}")
        val flow = ControlFlow.of(mutable)
        reads.forEach { read ->
            controlShape(!flow.hasOtherEntry(read.index + 1, read.index), "a jump lands between a contacts read and its test")
        }
        ContactsBlockMethod(mutable, reads)
    }
}

/** Every method outside the extension that reads [field], with the indices of its reads. */
private fun BytecodePatchContext.fieldReads(field: FieldReference, opcode: Opcode): Map<Method, List<Int>> {
    val found = linkedMapOf<Method, List<Int>>()
    val key = field.toString()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.forEach { method ->
            val body = method.controlBody()
            val reads = body.indices.filter { body[it].controlRef() == key && body[it].opcode in FIELD_READS }
            if (reads.isNotEmpty()) {
                controlShape(reads.all { body[it].opcode == opcode }, "${field.name} is read with an unexpected opcode")
                found[method] = reads
            }
        }
    }
    return found
}

private fun List<Instruction>.register(at: Int) = (this[at] as OneRegisterInstruction).registerA
private fun List<Instruction>.nullTest(at: Int) = getOrNull(at + 1)?.opcode == Opcode.IF_EQZ &&
    this[at + 1].namedRegisters() == listOf(register(at))

/** Every instruction reachable once the null test at [test] finds no block, until the method asks again. */
private fun ControlFlow.absentPath(test: Int): Set<Int> {
    val seen = mutableSetOf<Int>()
    val queue = ArrayDeque(normal[test + 1].filter { it != test + 2 })
    while (queue.isNotEmpty()) {
        val at = queue.removeFirst()
        if (at == test || !seen.add(at)) continue
        queue += normal[at]
        queue += exceptional[at]
    }
    return seen
}

/** True when an instruction other than [previous] can reach [next]. */
private fun ControlFlow.hasOtherEntry(next: Int, previous: Int): Boolean =
    normal.indices.any { it != previous && next in normal[it] } || exceptional.any { next in it }

private val FIELD_READS = setOf(Opcode.IGET, Opcode.IGET_WIDE, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN,
    Opcode.IGET_BYTE, Opcode.IGET_CHAR, Opcode.IGET_SHORT)

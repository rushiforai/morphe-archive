/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.comments.options

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.comments.summaries.PluginSocket
import app.morphe.patches.facebook.comments.summaries.descriptor
import app.morphe.patches.facebook.comments.summaries.isNameTable
import app.morphe.patches.facebook.comments.summaries.switchKeys
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.feed.methodsHolding
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.facebook.misc.extension.requireStatusMethod
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Comment sheet options"

/** The name the comment box's attachment button socket gives itself, in the method that goes through its plugins. */
internal const val BUTTON_SOCKET = "CommentComposerAttachmentButtonSocket"

/** The comment box's GIF button, a kept class name the socket's name table loads. */
internal const val GIF_BUTTON =
    "com.facebook.feedback.comments.plugins.commentcomposer.attachmentbutton.gif.GifAttachmentButtonPlugin"

/** The comment box's sticker button, in the same name table. */
internal const val STICKER_BUTTON =
    "com.facebook.feedback.comments.plugins.commentcomposer.attachmentbutton.sticker.StickerAttachmentButtonPlugin"

/** The name the reaction picker's popup logs itself under, in the method that opens it. */
internal const val DOCK_NAME = "reactions_dock"

/** The reaction picker the Like button's long press opens, a kept class. */
internal const val UFI_DOCK = "Lcom/facebook/feedback/sharedcomponents/reactions/dock/RopeStyleUFIDockView;"

/**
 * The name the comment section gives itself in its constructor. It draws one comment and, under
 * it, either the collapsed View replies row or the open reply thread.
 */
internal const val COMMENT_SECTION = "CommentSection"

/** The state update a tap on View replies sends the comment section, named where it's sent. */
internal const val EXPAND_REPLIES = "updateState:CommentSection.expandReplySection"

private const val VIEW = "Landroid/view/View;"

private const val OBJECTS = "[Ljava/lang/Object;"

internal const val COMMENT_SHEET_OPTIONS = "$EXTENSION_PACKAGE/comments/CommentSheetOptions;"
internal const val HOLDS_BUTTON = "$COMMENT_SHEET_OPTIONS->holdsButton(Ljava/lang/String;)Z"
internal const val SKIP_PICKER = "$COMMENT_SHEET_OPTIONS->skipReactionPicker()Z"
internal const val OPEN_REPLY_THREADS = "$COMMENT_SHEET_OPTIONS->openReplyThreads(Z)Z"

/**
 * Three switches for comments and reactions, all off until turned on.
 *
 * Hide GIF and sticker buttons: the comment box draws its buttons through a plugin socket, the one
 * that names itself [BUTTON_SOCKET] in the method going through its plugins (581
 * `LX/A4X;->A0I`, 580 `LX/AXw;->A02`, 577 `LX/AbP;->A02`). A static (I)String name table turns a
 * plugin's number into its class name (581 `LX/A4X;->A0J`, 580 `LX/AXw;->A03`, 577
 * `LX/AbP;->A03`), and a static check that the socket calls with the plugin's number last decides
 * whether the button shows (581 `LX/2Ap;->A25`, 580 `LX/25t;->A22`, 577 `LX/1xW;->A21`). Unlike the
 * comment summaries' sockets, the check sits in another class, so it's found as the one static
 * boolean the socket calls with an int last and a switch over the table's numbers. The extension
 * goes first in it with the plugin's name, and while the switch is on the GIF and sticker buttons
 * get a no. Photo, mention and every other button stay.
 *
 * Like only: a long press on Like opens the reaction picker through one method that builds
 * [UFI_DOCK] in a popup and logs [DOCK_NAME] (581 `LX/3FO;->A06`, 580 `LX/333;->A06`, 577
 * `LX/34y;->A06`, each an instance (View, View)V method). The extension goes first there, and while
 * the switch is on the method returns before anything opens, so a tap on Like still likes.
 *
 * Open every reply thread: the comment section, which names itself [COMMENT_SECTION] in its
 * constructor (581 `LX/AeN`, 580 `LX/B9p`, 577 `LX/Afk`), keeps whether its reply thread is open in
 * a boolean of its state class (581 `LX/AeO;->A06`, 580 `LX/B9u;->A06`, 577 `LX/Afl;->A06`). Its
 * initial-state method writes it false (581 `A0n`, 580 `A1W`, 577 `A3j`), a tap on View replies
 * sends the [EXPAND_REPLIES] update that sets it true, and the method drawing the comment's
 * children reads it: open draws the ExpandedReplySection, which loads the thread through its own
 * paginated replies list, and closed draws the CollapsedReplySection with the View replies row.
 * The flag is found through the update: the number the update is built with picks the arm of the
 * state's update switch, and that arm's first boolean write is the flag. Just before the
 * initial-state method returns, the extension is handed the flag and its answer is written back,
 * so with the switch on every comment starts the way a tap on View replies leaves it.
 *
 * Off in the default selection.
 */
@Suppress("unused")
val commentSheetOptionsPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Comment sheet options",
    description = "Adds three switches under Comments, all off to start. Like only stops a long press on Like " +
        "from opening the reactions, another takes the GIF and sticker buttons out of the comment box, and Open " +
        "every reply thread shows each comment's replies without a tap on View replies. A row there opens " +
        "Facebook's own settings, where Reaction preferences can hide reaction counts.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, facebookExtensionPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        // Everything is found before anything changes, so a build missing one part is left as it was.
        requireStatusMethod("commentSheetOptions")
        val buttons = buttonSocket(
            holders(GIF_BUTTON),
            holders(BUTTON_SOCKET).flatMap { methodsHolding(it, BUTTON_SOCKET) },
        ) { types -> types.mapNotNull { classDefByOrNull(it) }.associateBy { it.type } }
        val dock = reactionPicker(holders(DOCK_NAME))
        val threads = replyThreads(
            holders(COMMENT_SECTION),
            holders(EXPAND_REPLIES).flatMap { methodsHolding(it, EXPAND_REPLIES) },
        ) { types -> types.mapNotNull { classDefByOrNull(it) }.associateBy { it.type } }

        mutableClassDefBy(buttons.check.definingClass).methods.single { it.descriptor() == buttons.check.descriptor() }
            .holdButtons(buttons.table)
        mutableClassDefBy(dock.definingClass).methods.single { it.descriptor() == dock.descriptor() }
            .skipPicker()
        mutableClassDefBy(threads.initialState.definingClass).methods
            .single { it.descriptor() == threads.initialState.descriptor() }
            .openReplyThreads(threads)
        enableStatus("commentSheetOptions")
    }
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

private fun BytecodePatchContext.holders(string: String) =
    classDefByStrings(string, StringComparisonType.EQUALS).filterNot { it.type.startsWith(EXTENSION_CLASSES) }

private fun calls(method: Method): List<MethodReference> =
    method.implementation?.instructions?.toList().orEmpty().mapNotNull { instruction ->
        if (!instruction.opcode.name.startsWith("invoke")) return@mapNotNull null
        (instruction as ReferenceInstruction).reference as? MethodReference
    }

/**
 * The comment box's button socket, from [holders], the classes loading [GIF_BUTTON], and
 * [sockets], the methods loading [BUTTON_SOCKET]. [classes] reads the classes of the types it's
 * given, so the check can be looked at in whichever class holds it.
 *
 * The table is the one name table naming both buttons. The check is the one static boolean method
 * a socket method calls along with the table, with an int last, a switch over the same numbers as
 * the table's and a local register for the hook. Refuses unless there's exactly one of each.
 */
internal fun buttonSocket(
    holders: List<ClassDef>,
    sockets: List<Method>,
    classes: (Set<String>) -> Map<String, ClassDef>,
): PluginSocket {
    val tables = holders.flatMap { methodsHolding(it, GIF_BUTTON) }.filter(::isNameTable).distinctBy { it.descriptor() }
    val table = tables.singleOrNull() ?: refuse("expected one name table naming $GIF_BUTTON, found ${tables.size}")
    if (!holdsString(table, STICKER_BUTTON)) refuse("${table.descriptor()} names the GIF button but not $STICKER_BUTTON")
    val numbers = switchKeys(table).singleOrNull() ?: refuse("${table.descriptor()} has more than one switch")

    val tableCall = table.descriptor()
    val callers = sockets.filter { socket -> calls(socket).any { it.descriptor() == tableCall } }
    if (callers.isEmpty()) refuse("no method naming $BUTTON_SOCKET calls $tableCall")
    val called = callers.flatMap(::calls).filter { call ->
        call.returnType == "Z" && call.parameterTypes.lastOrNull()?.toString() == "I"
    }.associateBy { it.descriptor() }
    val owners = classes(called.values.map { it.definingClass }.toSet())
    val checks = called.keys.mapNotNull { descriptor ->
        owners[called.getValue(descriptor).definingClass]?.methods?.singleOrNull { it.descriptor() == descriptor }
    }.filter { method -> AccessFlags.STATIC.isSet(method.accessFlags) && numbers in switchKeys(method) }
    val check = checks.singleOrNull() ?: refuse(
        "expected one check of $tableCall's buttons, found ${checks.size}: ${checks.joinToString { it.descriptor() }}",
    )
    if (check.localRegisterCount() < 1) refuse("${check.descriptor()} has no local register for the hook")
    return PluginSocket(table, check)
}

/** Whether [method] opens the reaction picker: an instance (View, View)V method building [UFI_DOCK] and logging [DOCK_NAME]. */
internal fun isReactionPicker(method: Method): Boolean {
    if (AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != "V") return false
    if (method.parameterTypes.map(CharSequence::toString) != listOf(VIEW, VIEW)) return false
    if (!holdsString(method, DOCK_NAME)) return false
    return method.implementation?.instructions?.any { instruction ->
        instruction.opcode == Opcode.NEW_INSTANCE &&
            ((instruction as ReferenceInstruction).reference as? TypeReference)?.type == UFI_DOCK
    } == true
}

/** The one method among [holders], the classes loading [DOCK_NAME], that opens the reaction picker. */
internal fun reactionPicker(holders: List<ClassDef>): Method {
    val pickers = holders.flatMap { methodsHolding(it, DOCK_NAME) }.filter(::isReactionPicker).distinctBy { it.descriptor() }
    val picker = pickers.singleOrNull() ?: refuse(
        "expected one method opening $UFI_DOCK that logs \"$DOCK_NAME\", found ${pickers.size}",
    )
    if (picker.localRegisterCount() < 1) refuse("${picker.descriptor()} has no local register for the hook")
    return picker
}

/**
 * First thing in the button check: get the button's name from [table] with the check's own number,
 * ask the extension, and answer no when it holds that button. Otherwise the check runs from its
 * first instruction. The number is the last register, so the calls take it as a range.
 */
internal fun MutableMethod.holdButtons(table: Method) {
    val number = implementation!!.registerCount - 1
    addInstructionsWithLabels(
        0,
        """
            invoke-static/range { v$number .. v$number }, ${table.descriptor()}
            move-result-object v0
            invoke-static { v0 }, $HOLDS_BUTTON
            move-result v0
            if-eqz v0, :check
            const/4 v0, 0x0
            return v0
        """,
        ExternalLabel("check", getInstruction(0)),
    )
}

/** First thing where the reaction picker opens: while the extension says so, return before it does. */
internal fun MutableMethod.skipPicker() {
    addInstructionsWithLabels(
        0,
        """
            invoke-static {}, $SKIP_PICKER
            move-result v0
            if-eqz v0, :open
            return-void
        """,
        ExternalLabel("open", getInstruction(0)),
    )
}

/**
 * The comment section's [initialState] method and the open flag of its state, [flag], which the
 * method writes false at instruction [write] before its one return-void at [end].
 */
internal class ReplyThreads(val initialState: Method, val flag: FieldReference, val write: Int, val end: Int)

private fun Instruction.methodCall() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun FieldReference.sameAs(other: FieldReference) =
    definingClass == other.definingClass && name == other.name && type == other.type

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister() || this !is OneRegisterInstruction) return false
    return registerA == register || (opcode.setsWideRegister() && registerA + 1 == register)
}

/** The literal the nearest instruction before [index] that writes [register] puts there, or null. */
private fun literalBefore(code: List<Instruction>, index: Int, register: Int): Int? =
    (index - 1 downTo 0).map { code[it] }.firstOrNull { it.writes(register) }
        .let { (it as? NarrowLiteralInstruction)?.narrowLiteral }

private val UPDATE_FACTORIES = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)
private val UPDATE_CONSTRUCTORS = setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE)

/**
 * The update [update] sends: its type and its number, read from the last call before
 * [EXPAND_REPLIES] that builds something from an Object[] and an int, a static factory on 577 and
 * 581 and a constructor on 580. The number is the int, and it has to be a literal.
 */
internal fun expandUpdate(update: Method): Pair<String, Int> {
    val code = update.implementation?.instructions?.toList().orEmpty()
    val named = code.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == EXPAND_REPLIES }
    if (named < 0) refuse("${update.descriptor()} doesn't name \"$EXPAND_REPLIES\"")
    val build = (named - 1 downTo 0).firstOrNull { index ->
        val call = code[index].methodCall() ?: return@firstOrNull false
        call.parameterTypes.map(CharSequence::toString) == listOf(OBJECTS, "I") && when (code[index].opcode) {
            in UPDATE_FACTORIES -> call.returnType.startsWith("L")
            in UPDATE_CONSTRUCTORS -> call.name == "<init>"
            else -> false
        }
    } ?: refuse("${update.descriptor()} builds no update from an Object[] and a number before \"$EXPAND_REPLIES\"")
    val call = code[build].methodCall()!!
    val type = if (code[build].opcode in UPDATE_FACTORIES) call.returnType else call.definingClass
    val number = literalBefore(code, build, code[build].namedRegisters().last())
        ?: refuse("${update.descriptor()} builds its update with a number that isn't a literal")
    return type to number
}

/**
 * The boolean on [state] that the arm for update [number] of its one update method, an instance
 * ([type])V method with a switch, writes first. Refuses unless there's exactly one such method,
 * an arm for the number, and a boolean write on [state] in that arm before it leaves.
 */
internal fun openFlag(state: ClassDef, type: String, number: Int): FieldReference {
    val methods = state.methods.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(type)
    }
    val apply = methods.singleOrNull() ?: refuse("expected one update method on ${state.type}, found ${methods.size}")
    val code = apply.implementation?.instructions?.toList().orEmpty()
    val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    val switch = code.indexOfFirst { it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH }
    if (switch < 0) refuse("${apply.descriptor()} has no switch")
    val payload = code.getOrNull(addresses.indexOf(addresses[switch] + (code[switch] as OffsetInstruction).codeOffset))
        as? SwitchPayload ?: refuse("${apply.descriptor()}'s switch has no payload")
    val arm = payload.switchElements.singleOrNull { it.key == number }
        ?: refuse("${apply.descriptor()} has no arm for update $number")
    val start = addresses.indexOf(addresses[switch] + arm.offset)
    if (start < 0) refuse("${apply.descriptor()}'s arm for update $number lands between instructions")
    return code.drop(start)
        .takeWhile { !it.opcode.name.startsWith("return") && it.opcode != Opcode.THROW }
        .firstOrNull { it.opcode == Opcode.IPUT_BOOLEAN && it.field()?.definingClass == state.type }
        ?.field() ?: refuse("${apply.descriptor()}'s arm for update $number writes no boolean on ${state.type}")
}

/**
 * The comment section's reply flag and the method that starts it, from [sections], the classes
 * loading [COMMENT_SECTION], and [updates], the methods loading [EXPAND_REPLIES]. [classes] reads
 * the state class.
 *
 * The section is the one class whose constructor names itself [COMMENT_SECTION]. Its state is the
 * one class its no-argument methods make, and the flag is the boolean [EXPAND_REPLIES]'s update
 * sets on it ([openFlag]). The initial-state method is the section's one instance (x)V method that
 * writes the flag without reading it. It must write it once, from a literal false, then run
 * straight to its one return-void with nothing jumping in and the state's register kept, so the
 * hook just before that return still has the state and a free register to work with.
 */
internal fun replyThreads(
    sections: List<ClassDef>,
    updates: List<Method>,
    classes: (Set<String>) -> Map<String, ClassDef>,
): ReplyThreads {
    val named = sections.filter { section ->
        section.methods.any { it.name == "<init>" && holdsString(it, COMMENT_SECTION) }
    }.distinctBy { it.type }
    val section = named.singleOrNull()
        ?: refuse("expected one class naming itself \"$COMMENT_SECTION\", found ${named.size}")
    val sent = updates.distinctBy { it.descriptor() }
    val update = sent.singleOrNull() ?: refuse("expected one method sending \"$EXPAND_REPLIES\", found ${sent.size}")
    val (type, number) = expandUpdate(update)

    val made = section.methods.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.isEmpty() && it.returnType.startsWith("L")
    }.flatMap { method ->
        method.implementation?.instructions?.toList().orEmpty().filter { it.opcode == Opcode.NEW_INSTANCE }
            .map { ((it as ReferenceInstruction).reference as TypeReference).type }
    }.toSet()
    val stateType = made.singleOrNull() ?: refuse("expected one state class made by ${section.type}, found ${made.size}")
    val state = classes(setOf(stateType))[stateType] ?: refuse("$stateType isn't in this APK")
    val flag = openFlag(state, type, number)

    fun touching(method: Method, opcode: Opcode) = method.implementation?.instructions?.toList().orEmpty()
        .withIndex().filter { (_, instruction) -> instruction.opcode == opcode && instruction.field()?.sameAs(flag) == true }
        .map { it.index }
    val starters = section.methods.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" && it.parameterTypes.size == 1 &&
            touching(it, Opcode.IPUT_BOOLEAN).isNotEmpty() && touching(it, Opcode.IGET_BOOLEAN).isEmpty()
    }
    val start = starters.singleOrNull()
        ?: refuse("expected one method of ${section.type} starting its reply flag, found ${starters.size}")
    val where = start.descriptor()
    val write = touching(start, Opcode.IPUT_BOOLEAN).singleOrNull() ?: refuse("$where writes the reply flag more than once")
    val code = start.implementation!!.instructions.toList()
    val put = code[write] as TwoRegisterInstruction
    if (literalBefore(code, write, put.registerA) != 0) refuse("$where doesn't start the reply flag false")
    val end = code.indices.singleOrNull { code[it].opcode == Opcode.RETURN_VOID }
        ?: refuse("$where doesn't have exactly one return-void")
    if (end < write || code.indices.any { code[it].opcode.name.startsWith("return") && it != end }) {
        refuse("$where doesn't end at one return-void after the reply flag")
    }
    val flow = ControlFlow.of(start)
    for (index in code.indices) {
        for (next in flow.normal[index] + flow.exceptional[index]) {
            if (next in write + 1..end && next != index + 1) refuse("$where has a jump to instruction $next, after the reply flag")
        }
    }
    if ((write + 1 until end).any { flow.normal[it] != listOf(it + 1) || code[it].writes(put.registerB) }) {
        refuse("$where doesn't run straight from the reply flag to its return with the state kept")
    }
    if (freeRegister(put.registerB) >= start.localRegisterCount()) refuse("$where has no local register for the hook")
    return ReplyThreads(start, flag, write, end)
}

/** The register the reply hook borrows: any but the state's, every register being free at the return. */
internal fun freeRegister(state: Int) = if (state == 0) 1 else 0

/**
 * Just before the initial-state method returns, hand the extension the reply flag as Facebook
 * left it and write back its answer. The state's register is the one the flag was written
 * through, and the call takes the flag as a range.
 */
internal fun MutableMethod.openReplyThreads(threads: ReplyThreads) {
    val state = getInstruction<TwoRegisterInstruction>(threads.write).registerB
    val field = threads.flag.let { "${it.definingClass}->${it.name}:${it.type}" }
    val free = freeRegister(state)
    addInstructions(
        threads.end,
        """
            iget-boolean v$free, v$state, $field
            invoke-static/range { v$free .. v$free }, $OPEN_REPLY_THREADS
            move-result v$free
            iput-boolean v$free, v$state, $field
        """,
    )
}

/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.actions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.ads.feedListHoldersHooked
import app.morphe.patches.pinterest.ads.feedListHookPatch
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.localRegisterCount
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.extension.requireThisIntact
import app.morphe.patches.pinterest.misc.extension.writeStub
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.pinterest.ui.instructions
import app.morphe.patches.pinterest.ui.methodsWithString
import app.morphe.patches.pinterest.ui.mutable
import app.morphe.patches.pinterest.ui.one
import app.morphe.patches.pinterest.ui.strings
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Download board"

internal const val BOARD_DOWNLOADS = "$EXTENSION_PACKAGE/actions/BoardDownloads;"
internal const val BOARD_MENU_HOOK = "$BOARD_DOWNLOADS->menu(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"

/** The extra a board screen puts its board id under. Its presenter is found by holding it. */
internal const val BOARD_ID_EXTRA = "com.pinterest.EXTRA_BOARD_ID"

/** The view that shows and closes Pinterest's sheets. Its name is kept too. */
internal const val MODAL_CONTAINER = "Lcom/pinterest/component/modal/ModalContainer;"

/** Pinterest's own string resource that's nothing but "%1$s", so a row titled with it shows its substitution. */
internal const val PLAIN_TEXT = "generic_plain_text"

private const val GROUP_TEXT = "OptionGroup(label="
private const val ROW_TEXT = "OptionItem(titleRes="
private const val ROW_SUBSTITUTION = ", titleResVariableSubstitution="
private const val LIST = "Ljava/util/List;"
private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
private const val STRING = "Ljava/lang/String;"

/** The board menu's options, by the names Pinterest's enum keeps for them. */
private val BOARD_OPTIONS = setOf("Edit", "Merge", "Archive", "Unarchive", "PreviewBoard")

/** The extension's stubs this patch writes. */
private val STUBS = listOf("menuItems", "menuHandler", "menuCopy", "menuRow", "titleResource", "boardId", "dismissMenu")

private fun FieldReference.smali() = "$definingClass->$name:$type"
private fun MethodReference.smali() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
private fun CharSequence.wide() = toString() == "J" || toString() == "D"
private val Instruction.field get() = (this as? ReferenceInstruction)?.reference as? FieldReference
private val Instruction.call get() = (this as? ReferenceInstruction)?.reference as? MethodReference
private val Instruction.type get() = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

/**
 * Everything the board menu hook and the extension's stubs use, found by shape and checked before
 * anything changes.
 *
 * @property method the presenter's method that builds the board menu
 * @property insert where the hook goes: right after the menu is moved into [menu]
 * @property self the register holding `this` there
 * @property title the row constructor's parameter for its title resource; [index] and [text] likewise
 */
internal class BoardMenu(
    val presenter: String,
    val method: Method,
    val insert: Int,
    val menu: Int,
    val self: Int,
    val group: String,
    val groupInit: Method,
    val label: FieldReference,
    val items: FieldReference,
    val handler: FieldReference,
    val row: String,
    val rowInit: Method,
    val title: Int,
    val index: Int,
    val text: Int,
    val titleResource: Field,
    val boardId: FieldReference,
    val events: Field,
    val dismiss: Method,
)

@Suppress("unused")
val downloadBoardPatch = bytecodePatch(
    name = PATCH,
    description = "Adds Download board to a board's menu. It saves every pin Pinterest has loaded for that board and " +
        "skips ones already in Download history, so you can keep a board without picking pins one at a time. " +
        "Needs Download pins on too. Starts off. Turn it on in HushPinterest settings > Pin actions.",
) {
    category("Downloads")
    dependsOn(settingsPatch, pinterestExtensionPatch, feedListHookPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("downloadBoard")
        requireStatusMethod("boardMenu")
        requireStatusMethod("boardPins")
        if (feedListHoldersHooked == 0) throw PatchException("$PATCH: no list holder was hooked, so no board's pins can be kept")
        val board = boardMenu()
        val extension = mutableClassDefBy(BOARD_DOWNLOADS)
        for (name in STUBS) {
            if (extension.methods.count { it.name == name && AccessFlags.STATIC.isSet(it.accessFlags) } != 1) {
                throw PatchException("$PATCH: missing extension stub $name")
            }
        }
        val target = mutable(board.method)
        if ((target.implementation!!.instructions[board.insert] as BuilderInstruction).location.labels.isNotEmpty()) {
            throw PatchException("$PATCH: the instruction after the board menu is built is also a branch target")
        }

        writeStub(BOARD_DOWNLOADS, "menuItems", 2, """
            check-cast p0, ${board.group}
            iget-object v0, p0, ${board.items.smali()}
            return-object v0
        """)
        writeStub(BOARD_DOWNLOADS, "menuHandler", 2, """
            check-cast p0, ${board.group}
            iget-object v0, p0, ${board.handler.smali()}
            return-object v0
        """)
        writeStub(BOARD_DOWNLOADS, "menuCopy", 5, """
            check-cast p0, ${board.group}
            iget-object v0, p0, ${board.label.smali()}
            check-cast p2, $FUNCTION1
            new-instance v1, ${board.group}
            invoke-direct { v1, v0, p1, p2 }, ${board.groupInit.smali()}
            return-object v1
        """)
        val arguments = board.rowInit.parameterTypes.size
        val values = (0 until arguments).joinToString("\n") { at ->
            when (at) {
                board.title -> "move/from16 v${at + 1}, p0"
                board.index -> "move/from16 v${at + 1}, p1"
                board.text -> "move-object/from16 v${at + 1}, p2"
                else -> "const/16 v${at + 1}, 0x0"
            }
        }
        writeStub(BOARD_DOWNLOADS, "menuRow", arguments + 4, """
            new-instance v0, ${board.row}
            $values
            invoke-direct/range { v0 .. v$arguments }, ${board.rowInit.smali()}
            return-object v0
        """)
        writeStub(BOARD_DOWNLOADS, "titleResource", 1, """
            sget v0, ${board.titleResource.smali()}
            return v0
        """)
        writeStub(BOARD_DOWNLOADS, "boardId", 2, """
            check-cast p0, ${board.presenter}
            iget-object v0, p0, ${board.boardId.smali()}
            return-object v0
        """)
        writeStub(BOARD_DOWNLOADS, "dismissMenu", 2, """
            check-cast p0, ${board.presenter}
            iget-object v0, p0, ${board.events.smali()}
            if-eqz v0, :hush_no_events
            invoke-static { v0 }, ${board.dismiss.smali()}
            :hush_no_events
            return-void
        """)
        // The menu goes through the extension and comes back as itself or as a copy with one more row.
        // It borrows nothing: the menu's own register takes the answer, and this is only read.
        target.addInstructions(board.insert, """
            invoke-static { v${board.menu}, v${board.self} }, $BOARD_MENU_HOOK
            move-result-object v${board.menu}
            check-cast v${board.menu}, ${board.group}
        """)
        enableCapability("boardMenu")
        enableCapability("boardPins")
        enableStatus("downloadBoard")
    }
}

/** Finds and checks every part of [BoardMenu]. Throws naming the part that isn't there exactly once. */
internal fun BytecodePatchContext.boardMenu(): BoardMenu {
    val titles = mutableListOf<Field>()
    val posts = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.fields.filterTo(titles) { it.name == PLAIN_TEXT && it.type == "I" && AccessFlags.STATIC.isSet(it.accessFlags) }
        owner.methods.filterTo(posts) { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && method.parameterTypes.size == 1 &&
                method.implementation?.instructions?.let { it.count() == 4 && it.first().opcode == Opcode.NEW_INSTANCE } == true
        }
    }
    val group = methodsWithString(GROUP_TEXT).filter { it.name == "toString" }.map { it.definingClass }.distinct()
        .one("$PATCH: option group")

    // The board screen's presenter, found by what it does rather than by the name one build gave it:
    // the one class that holds the board id extra and builds the board menu in an instance method of
    // its own. Other screens build the same menu from methods that take arguments.
    val builders = mutableMapOf<String, List<Method>>()
    val presenters = classDefByStrings(BOARD_ID_EXTRA).distinctBy { it.type }.filter { owner ->
        !owner.type.startsWith(EXTENSION_ROOT) && !AccessFlags.INTERFACE.isSet(owner.accessFlags) &&
            owner.methods.any { BOARD_ID_EXTRA in it.strings() }
    }.map { owner -> owner to menuBuilds(owner, group, builders) }.filter { (_, found) -> found.isNotEmpty() }
    val (presenter, calls) = presenters.one("$PATCH: board screen presenter")
    val (method, call) = calls.one("$PATCH: board menu builder call")
    val body = method.instructions()
    val kept = body.getOrNull(call + 1)
    if (kept?.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("$PATCH: the board menu isn't kept once it's built")
    val menu = (kept as OneRegisterInstruction).registerA
    val insert = call + 2
    if (insert >= body.size) throw PatchException("$PATCH: nothing follows the board menu's build")
    val self = method.localRegisterCount()
    if (menu > 15 || self > 15 || menu == self) {
        throw PatchException("$PATCH: the board menu (v$menu) and its screen (v$self) aren't both in a call's reach")
    }
    method.requireThisIntact(PATCH, listOf(insert))

    val groupClass = classDefByOrNull(group) ?: throw PatchException("$PATCH: no option group class $group")
    val groupInit = groupClass.methods.filter { init ->
        init.name == "<init>" && init.parameterTypes.size == 3 && init.parameterTypes[1].toString() == LIST &&
            init.parameterTypes[2].toString() == FUNCTION1
    }.one("$PATCH: option group constructor")
    val stored = groupInit.stores()
    val label = stored[0]?.singleOrNull { it.type == groupInit.parameterTypes[0].toString() }
        ?: throw PatchException("$PATCH: the option group doesn't keep its label")
    val items = stored[1]?.firstOrNull { it.type == LIST } ?: throw PatchException("$PATCH: the option group doesn't keep its rows")
    val handler = stored[2]?.singleOrNull { it.type == FUNCTION1 } ?: throw PatchException("$PATCH: the option group doesn't keep its handler")

    // The row class: the one the builder makes that describes itself as an option item with a substitution.
    val row = builders.getValue(body[call].call!!.definingClass).flatMap { it.instructions() }
        .filter { it.opcode == Opcode.NEW_INSTANCE }.mapNotNull { it.type }.distinct()
        .filter { type -> classDefByOrNull(type)?.methods?.any { it.name == "toString" && ROW_TEXT in it.strings() && ROW_SUBSTITUTION in it.strings() } == true }
        .one("$PATCH: board menu row")
    val rowClass = classDefByOrNull(row)!!
    val rowInit = rowClass.methods.filter { it.name == "<init>" }.one("$PATCH: board menu row constructor")
    if (rowInit.parameterTypes.any { it.wide() } || rowInit.parameterTypes.size > 14) {
        throw PatchException("$PATCH: the board menu row's constructor takes ${rowInit.parameterTypes}")
    }
    val rowStores = rowInit.stores()
    fun parameterOf(field: FieldReference, what: String): Int = rowStores.filter { (_, fields) ->
        fields.any { it.name == field.name && it.type == field.type }
    }.keys.toList().one("$PATCH: board menu row $what parameter")
    val indexField = rowClass.methods.singleOrNull { it.name == "getIndex" && it.parameterTypes.isEmpty() && it.returnType == "I" }
        ?.instructions()?.singleOrNull { it.opcode == Opcode.IGET }?.field?.takeIf { it.definingClass == row && it.type == "I" }
        ?: throw PatchException("$PATCH: the board menu row has no index getter")
    val index = parameterOf(indexField, "index")
    val title = rowStores.filter { (at, fields) ->
        at != index && rowInit.parameterTypes[at].toString() == "I" && fields.any { it.type == "I" }
    }.keys.toList().one("$PATCH: board menu row title parameter")
    val described = rowClass.methods.single { it.name == "toString" && ROW_TEXT in it.strings() }.instructions()
    val named = described.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == ROW_SUBSTITUTION }
    val textField = described.drop(named + 1).firstOrNull { it.opcode == Opcode.IGET_OBJECT }?.field
        ?.takeIf { it.definingClass == row && it.type == STRING }
        ?: throw PatchException("$PATCH: the board menu row doesn't describe its substitution")
    val text = parameterOf(textField, "substitution")
    if (setOf(title, index, text).size != 3) throw PatchException("$PATCH: the board menu row's title, index and text share a parameter")

    val titleResource = titles.one("$PATCH: Pinterest's $PLAIN_TEXT string")

    // Pinterest's own way of closing the open sheet: a static helper posting a new dismiss event,
    // the ModalContainer event with a constructor taking nothing and one taking a flag.
    val container = classDefByOrNull(MODAL_CONTAINER) ?: throw PatchException("$PATCH: no $MODAL_CONTAINER")
    val event = container.methods.filter { it.parameterTypes.size == 1 && !AccessFlags.STATIC.isSet(it.accessFlags) }
        .map { it.parameterTypes[0].toString() }.distinct().filter { type ->
            val constructors = classDefByOrNull(type)?.methods?.filter { it.name == "<init>" }.orEmpty()
            constructors.any { it.parameterTypes.isEmpty() } && constructors.any { it.parameterTypes.map(CharSequence::toString) == listOf("Z") }
        }.one("$PATCH: sheet dismiss event")
    val dismiss = posts.filter { it.postsNew(event) }.one("$PATCH: sheet dismiss helper")
    val bus = dismiss.parameterTypes[0].toString()
    val events = presenter.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == bus }
        .one("$PATCH: board screen event manager")

    // The board the screen shows: the one id field the presenter puts under the board id extra.
    val boardId = presenter.methods.filter { BOARD_ID_EXTRA in it.strings() }.flatMap { owner ->
        owner.instructions().filter { it.opcode == Opcode.IGET_OBJECT }.mapNotNull { it.field }
            .filter { it.definingClass == presenter.type && it.type == STRING }
    }.distinctBy { it.name }.one("$PATCH: board id field")

    val publicFields = listOf(label, items, handler, boardId).map { it.definingClass to it.name } +
        listOf(titleResource, events).map { it.definingClass to it.name }
    for ((owner, name) in publicFields) {
        val declared = classDefByOrNull(owner)
        val field = declared?.fields?.singleOrNull { it.name == name }
        if (declared == null || field == null || !AccessFlags.PUBLIC.isSet(declared.accessFlags) || !AccessFlags.PUBLIC.isSet(field.accessFlags)) {
            throw PatchException("$PATCH: $owner->$name isn't public")
        }
    }
    for (callee in listOf(groupInit, rowInit, dismiss)) {
        val declared = classDefByOrNull(callee.definingClass)
        if (declared == null || !AccessFlags.PUBLIC.isSet(declared.accessFlags) || !AccessFlags.PUBLIC.isSet(callee.accessFlags)) {
            throw PatchException("$PATCH: ${callee.smali()} isn't public")
        }
    }
    if (!AccessFlags.PUBLIC.isSet(presenter.accessFlags)) throw PatchException("$PATCH: ${presenter.type} isn't public")

    return BoardMenu(
        presenter.type, method, insert, menu, self, group, groupInit, label, items, handler,
        row, rowInit, title, index, text, titleResource, boardId, events, dismiss,
    )
}

private fun MethodReference.startsWithOptions() =
    parameterTypes.size >= 2 && parameterTypes[0].toString() == LIST && parameterTypes[1].toString() == FUNCTION1

/**
 * Where [owner] builds a board menu: each instance method taking nothing that makes a static call
 * into a class that also lists the board's options, answering an option group ([group]) for a list
 * of options and a handler, with the call's index. [builders] caches each callee class's builders.
 */
private fun BytecodePatchContext.menuBuilds(
    owner: ClassDef,
    group: String,
    builders: MutableMap<String, List<Method>>,
): List<Pair<Method, Int>> = owner.methods.filter { method ->
    !AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.isEmpty() && method.returnType == "V" &&
        method.implementation != null
}.flatMap { method ->
    method.instructions().withIndex().filter { (_, instruction) ->
        val call = instruction.call
        (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE) && call != null &&
            call.returnType == group && call.startsWithOptions() &&
            builders.getOrPut(call.definingClass) { boardBuilders(call.definingClass, group) }.isNotEmpty()
    }.map { method to it.index }
}

/** The static methods of [type] that build an option group from the board's options. */
private fun BytecodePatchContext.boardBuilders(type: String, group: String): List<Method> {
    val owner = classDefByOrNull(type) ?: return emptyList()
    val options = mutableMapOf<String, Boolean>()
    return owner.methods.filter { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == group && method.startsWithOptions() &&
            method.instructions().any { instruction ->
                val field = instruction.field
                instruction.opcode == Opcode.SGET_OBJECT && field != null && field.type == field.definingClass &&
                    options.getOrPut(field.definingClass) { isBoardOptions(field.definingClass) }
            }
    }
}

/** True for an enum with a constant for every one of [BOARD_OPTIONS]. */
private fun BytecodePatchContext.isBoardOptions(type: String): Boolean {
    val owner = classDefByOrNull(type) ?: return false
    if (owner.superclass != "Ljava/lang/Enum;") return false
    return owner.fields.filter { AccessFlags.STATIC.isSet(it.accessFlags) && it.type == type }.map { it.name }.containsAll(BOARD_OPTIONS)
}

/**
 * For a constructor taking only one-register values: each parameter, by its index, and the fields of
 * its own class it's stored in, read straight from the parameter's register.
 */
private fun Method.stores(): Map<Int, List<FieldReference>> {
    val self = localRegisterCount()
    val stored = mutableMapOf<Int, MutableList<FieldReference>>()
    for (instruction in instructions()) {
        if (instruction.opcode != Opcode.IPUT && instruction.opcode != Opcode.IPUT_OBJECT) continue
        val field = instruction.field ?: continue
        val put = instruction as TwoRegisterInstruction
        val at = put.registerA - self - 1
        if (put.registerB != self || field.definingClass != definingClass || at !in parameterTypes.indices) continue
        stored.getOrPut(at) { mutableListOf() } += field
    }
    return stored
}

/**
 * True for `static void m(Bus bus) { bus.post(new [event]()); }`, Pinterest's helper for closing the
 * sheet on top.
 */
private fun Method.postsNew(event: String): Boolean {
    val code = instructions()
    if (code.size != 4) return false
    val (create, init, post, done) = code
    val held = (create as? OneRegisterInstruction)?.registerA ?: return false
    val bus = implementation!!.registerCount - 1
    val made = init.call
    val posted = post.call
    return create.opcode == Opcode.NEW_INSTANCE && create.type == event &&
        init.opcode == Opcode.INVOKE_DIRECT && made != null && made.definingClass == event && made.name == "<init>" &&
        made.parameterTypes.isEmpty() && (init as FiveRegisterInstruction).registerCount == 1 && init.registerC == held &&
        post.opcode == Opcode.INVOKE_VIRTUAL && posted != null && posted.definingClass == parameterTypes[0].toString() &&
        posted.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;") && posted.returnType == "V" &&
        (post as FiveRegisterInstruction).registerCount == 2 && post.registerC == bus && post.registerD == held &&
        done.opcode == Opcode.RETURN_VOID
}

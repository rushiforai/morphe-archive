/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.ControlFlow
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

internal const val SELECT_BETWEEN = "$EXTENSION_PACKAGE/misc/SelectBetween;"
internal const val SELECT_ADD_ITEM = "$SELECT_BETWEEN->addItem(Ljava/lang/Object;)V"
internal const val SELECT_CLICKED = "$SELECT_BETWEEN->clicked(Ljava/lang/Object;I)I"
internal const val SELECT_SELECTING = "$SELECT_BETWEEN->selecting(Ljava/lang/Object;Ljava/lang/Object;)V"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val LIST = "Ljava/util/ArrayList;"
private const val SPARSE_ARRAYS = "[Landroid/util/SparseArray;"
private const val MESSAGE = "Lorg/telegram/messenger/MessageObject;"
private const val DRAWABLES = "Lorg/telegram/messenger/R\$drawable;"
private const val STRINGS = "Lorg/telegram/messenger/R\$string;"
private const val SET_CLICK = "setActionBarMenuOnItemClick"
private const val INDEX_OF_KEY = "Landroid/util/SparseArray;->indexOfKey(I)I"

/** The icons and label only the selection bar's builder loads together. */
private val BAR_ICONS = listOf("msg_edit", "msg_fave", "msg_copy", "msg_forward", "msg_shareout", "msg_delete").map { "$DRAWABLES->$it:I" }
private const val BAR_LABEL = "$STRINGS->SaveToMusic:I"

/**
 * Where the chat's selection bar takes the Select between button, or [missing], why this build's
 * can't: the bar's builder [create] and the index [at] its hook goes in at, the bar's click
 * handler [click] and the chat screen field it reads, the chat's select method [select] and
 * everything the stubs reach (see [writeStubs]).
 */
internal class SelectBetweenSites(
    val missing: String?,
    private val chat: String = "",
    private val create: MutableMethod? = null,
    private val at: Int = 0,
    private val click: MutableMethod? = null,
    private val owner: String = "",
    private val ownerField: String = "",
    private val select: MutableMethod? = null,
    private val wrapper: String = "",
    private val selectedField: String = "",
    private val adapterField: String = "",
    private val adapterMessages: String = "",
    private val barGetter: String = "",
    private val menuRef: String = "",
    private val addRef: String = "",
    /** The stub's registers (menu, ID, icon, label, width) in the add call's parameter order. */
    private val addArgs: String = "p0, p1, p2, p3, p4",
    /** What Telegram's tap runs after selecting: the bar's count, then the rows' checks (given false). */
    private val title: String = "",
    private val rows: String = "",
) {
    /** The same edits on copies, so a smali problem refuses before the app is touched. */
    fun rehearse() = edit { MutableMethod(ImmutableMethod.of(it)) }

    fun apply(context: BytecodePatchContext) {
        edit { it }
        context.writeStubs()
    }

    private fun edit(into: (MutableMethod) -> MutableMethod) {
        val create = into(create!!)
        val self = create.implementation!!.registerCount - 1
        create.addInstructions(at, "invoke-static/range {v$self .. v$self}, $SELECT_ADD_ITEM")
        val click = into(click!!)
        val clickLocals = click.localRegisterCount()
        // v0 and v1 are free at the first instruction. The bar's id comes back as itself, or as the number Telegram's switch ignores.
        click.addInstructions(0, """
            move-object/from16 v1, v$clickLocals
            iget-object v0, v1, $ownerField
            move/from16 v1, v${clickLocals + 1}
            invoke-static {v0, v1}, $SELECT_CLICKED
            move-result v${clickLocals + 1}
        """)
        val select = into(select!!)
        val selectSelf = select.implementation!!.registerCount - 1 - select.parameterTypes.size
        select.addInstructions(0, "invoke-static/range {v$selectSelf .. v${selectSelf + 1}}, $SELECT_SELECTING")
    }

    private fun BytecodePatchContext.writeStubs() {
        writeStub(SELECT_BETWEEN, "selected", 2, """
            check-cast p0, $chat
            iget-object v0, p0, $selectedField
            return-object v0
        """)
        writeStub(SELECT_BETWEEN, "messages", 2, """
            check-cast p0, $chat
            iget-object v0, p0, $adapterField
            if-eqz v0, :none
            invoke-virtual {v0}, $adapterMessages
            move-result-object v0
            return-object v0
            :none
            const/4 v0, 0x0
            return-object v0
        """)
        writeStub(SELECT_BETWEEN, "pick", 3, """
            check-cast p0, $chat
            check-cast p1, $MESSAGE
            const/4 v0, 0x0
            invoke-virtual {p0, p1, v0}, $wrapper
            return-void
        """)
        writeStub(SELECT_BETWEEN, "refresh", 2, """
            check-cast p0, $chat
            invoke-virtual {p0}, $title
            const/4 v0, 0x0
            invoke-virtual {p0, v0}, $rows
            return-void
        """)
        writeStub(SELECT_BETWEEN, "menu", 3, """
            check-cast p0, $chat
            invoke-virtual {p0}, $barGetter
            move-result-object v0
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, $menuRef
            move-result-object v0
            return-object v0
        """)
        writeStub(SELECT_BETWEEN, "addMenuItem", 5, """
            check-cast p0, ${menuRef.substringAfter(")")}
            invoke-virtual {$addArgs}, $addRef
            return-void
        """)
        writeStub(SELECT_BETWEEN, "icon", 1, "sget v0, $DRAWABLES->msg_select:I\nreturn v0")
        writeStub(SELECT_BETWEEN, "messageId", 2, """
            check-cast p0, $MESSAGE
            invoke-virtual {p0}, $MESSAGE->getId()I
            move-result v0
            return v0
        """)
        writeStub(SELECT_BETWEEN, "contentType", 2, """
            check-cast p0, $MESSAGE
            iget v0, p0, $MESSAGE->contentType:I
            return v0
        """)
    }
}

/**
 * The chat screen's selection bar is built once by a method that adds Edit, Favorites, Copy,
 * Forward, Share and Delete and then sets which of them show. The button goes in just before its
 * last call, which nothing else jumps to. The bar's click handler is the class the chat gives
 * setActionBarMenuOnItemClick, its tap on a number the extension owns answered first. Selecting a
 * message is the chat's two-argument select, a thin wrapper over the method that records it,
 * whose first read of the chat's per-dialog selection arrays is the selection itself. The messages
 * the chat shows come from the list adapter's own getter, which hands back the frozen, filtered or
 * full list, whichever is on screen.
 */
internal fun BytecodePatchContext.resolveSelectBetween(chat: String): SelectBetweenSites = try {
    selectBetween(chat).also { it.rehearse() }
} catch (refused: PatchException) {
    SelectBetweenSites(refused.message ?: "the selection bar can't be read")
} catch (failed: RuntimeException) {
    SelectBetweenSites("the selection bar doesn't compile (${failed.javaClass.simpleName}: ${failed.message})")
}

private fun BytecodePatchContext.selectBetween(chat: String): SelectBetweenSites {
    requireStatusMethod("selectBetween")
    controlHook(SELECT_BETWEEN, "addItem", listOf(OBJECT), "V")
    controlHook(SELECT_BETWEEN, "clicked", listOf(OBJECT, "I"), "I")
    controlHook(SELECT_BETWEEN, "selecting", listOf(OBJECT, OBJECT), "V")
    controlHook(SELECT_BETWEEN, "selected", listOf(OBJECT), SPARSE_ARRAYS)
    controlHook(SELECT_BETWEEN, "messages", listOf(OBJECT), LIST)
    controlHook(SELECT_BETWEEN, "pick", listOf(OBJECT, OBJECT), "V")
    controlHook(SELECT_BETWEEN, "refresh", listOf(OBJECT), "V")
    controlHook(SELECT_BETWEEN, "menu", listOf(OBJECT), OBJECT)
    controlHook(SELECT_BETWEEN, "addMenuItem", listOf(OBJECT, "I", "I", STRING, "I"), "V")
    controlHook(SELECT_BETWEEN, "icon", listOf(), "I")
    controlHook(SELECT_BETWEEN, "messageId", listOf(OBJECT), "I")
    controlHook(SELECT_BETWEEN, "contentType", listOf(OBJECT), "I")
    controlMembers(DRAWABLES, "static msg_select:I")
    controlMembers(MESSAGE, "getId()I", "contentType:I")
    val chatClass = tgMutableClassDefBy(chat)
    fun Method.instance() = !AccessFlags.STATIC.isSet(accessFlags)

    // The bar's builder.
    val create = chatClass.methods.filter { m ->
        m.instance() && m.origReturnType == "V" && m.parameterTypes.isEmpty() && m.controlBody().let { body ->
            BAR_ICONS.all { icon -> body.any { it.controlRef() == icon } } && body.any { it.controlRef() == BAR_LABEL }
        }
    }.controlSingle("the selection bar's builder")
    val body = create.controlBody()
    val last = body.size - 1
    controlShape(body[last].opcode == Opcode.RETURN_VOID && body.count { it.opcode == Opcode.RETURN_VOID } == 1 && last >= 2,
        "the selection bar's builder no longer ends in its one return")
    // Telegram's bar object comes from the chat's action bar, and its buttons through one add call.
    val barRead = body.indexOfFirst { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.origName == "actionBar" }
    // A null title is loaded between the field read and the call.
    val menuCall = if (barRead < 0) null else body.drop(barRead + 1).take(3).firstOrNull { it.opcode == Opcode.INVOKE_VIRTUAL }
    val menuMethod = menuCall?.call()
    controlShape(barRead >= 0 && menuCall?.opcode == Opcode.INVOKE_VIRTUAL && menuMethod != null &&
        menuMethod.origParameterTypes == listOf(STRING) && menuMethod.origReturnType.startsWith("L"),
        "the selection bar's menu is no longer taken from the action bar")
    // ID, icon, label, width; Play's 13.2 build takes the width before the label.
    val addShapes = listOf(listOf("I", "I", STRING, "I"), listOf("I", "I", "I", STRING))
    val addCalls = body.mapNotNull { it.call() }.filter {
        it.origDefiningClass == menuMethod!!.origReturnType && it.origParameterTypes in addShapes
    }.distinctBy { it.toString() }
    val adds = addCalls.map { it.toString() }
    controlShape(adds.size == 1, "the selection bar's buttons are no longer added through one call")
    val addArgs = if (addCalls.single().origParameterTypes[2] == STRING) "p0, p1, p2, p3, p4" else "p0, p1, p2, p4, p3"
    // The field is protected, so the extension goes through the screen's public getter.
    val barFieldRef = body[barRead].controlField()!!
    val barGetter = tgMutableClassDefBy(barFieldRef.definingClass).methods.filter { m ->
        m.instance() && AccessFlags.PUBLIC.isSet(m.accessFlags) && m.parameterTypes.isEmpty() && m.origReturnType == barFieldRef.origType &&
            m.controlBody().map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT) && m.controlBody()[0].controlRef() == body[barRead].controlRef()
    }.controlSingle("the action bar's getter").toString()
    requireReachable(barGetter, false)
    requireReachable(menuMethod.toString(), false)
    requireReachable(adds.single(), false)
    val self = create.implementation!!.registerCount - 1
    controlShape(self in 0..255 && body.none { it.writes(self) }, "the selection bar's builder changes its own receiver")
    val flow = try {
        ControlFlow.of(create)
    } catch (failed: IllegalArgumentException) {
        throw PatchException("the selection bar's builder can't be read (${failed.message})")
    }
    // Before the last call, which only the call before it runs into.
    val at = last - 1
    controlShape(flow.normal.withIndex().none { (index, next) -> at in next && index != at - 1 } && flow.exceptional.none { at in it },
        "something jumps into the end of the selection bar's builder")

    // The bar's click handler: a class of its own, handed to the action bar, holding the chat.
    val handlers = mutableListOf<String>()
    for (method in chatClass.methods) {
        val method0 = method.controlBody()
        method0.forEachIndexed { index, instruction ->
            val target = instruction.call()
            if (instruction.opcode == Opcode.INVOKE_VIRTUAL && target?.origName == SET_CLICK && target.parameterTypes.size == 1) {
                val argument = instruction.namedRegisters().last()
                val made = (index - 1 downTo 0).firstOrNull { (method0[it] as? OneRegisterInstruction)?.registerA == argument && method0[it].opcode.setsRegister() }
                if (made != null && method0[made].opcode == Opcode.NEW_INSTANCE) handlers += method0[made].controlRef()!!
            }
        }
    }
    val handlerType = handlers.distinct().controlSingle("the selection bar's click handler")
    val handlerClass = tgMutableClassDefBy(handlerType)
    val click = handlerClass.methods.filter { m ->
        m.instance() && m.origReturnType == "V" && m.origParameterTypes == listOf("I") &&
            m.controlBody().any { it.controlField()?.origType == chat }
    }.controlSingle("the selection bar's click method")
    val ownerFields = handlerClass.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.origType == chat }
        .controlSingle("the click handler's chat field")
    val ownerField = "$handlerType->${ownerFields.name}:${ownerFields.type}"
    controlShape(AccessFlags.PUBLIC.isSet(ownerFields.accessFlags), "the click handler's chat field is inaccessible")
    val clickFlow = ControlFlow.of(click)
    controlShape(clickFlow.normal.none { 0 in it } && clickFlow.exceptional.none { 0 in it }, "something jumps back to the start of the bar's click method")
    val clickLocals = click.localRegisterCount()
    controlShape(clickLocals >= 2, "the bar's click method has no free registers")

    // Selecting: the chat's (message, Z) wrapper over the three-argument method that records the selection.
    val wrappers = chatClass.methods.filter { m ->
        m.instance() && m.origReturnType == "V" && m.origParameterTypes == listOf(MESSAGE, "Z") &&
            m.controlBody().let { b ->
                b.size <= 4 && b.count { it.opcode == Opcode.INVOKE_VIRTUAL } == 1 && b.first { it.opcode == Opcode.INVOKE_VIRTUAL }.call().let { c ->
                    c != null && c.origDefiningClass == chat && c.origParameterTypes == listOf(MESSAGE, "Z", "Z") && c.origReturnType == "V"
                }
            }
    }
    val wrapper = wrappers.controlSingle("the chat's select method")
    val recorder = wrapper.controlBody().first { it.opcode == Opcode.INVOKE_VIRTUAL }.call()!!
    val selectMethod = chatClass.methods.filter { it.toString() == recorder.toString() }.controlSingle("the chat's selection recorder")
    controlShape(AccessFlags.PUBLIC.isSet(wrapper.accessFlags), "the chat's select method is inaccessible")
    val selectFlow = ControlFlow.of(selectMethod)
    controlShape(selectFlow.normal.none { 0 in it } && selectFlow.exceptional.none { 0 in it }, "something jumps back to the start of the selection recorder")
    val selectBody = selectMethod.controlBody()
    val firstArrayRead = selectBody.indexOfFirst { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.let { f -> f.origDefiningClass == chat && f.origType == SPARSE_ARRAYS } == true }
    controlShape(firstArrayRead >= 0 && selectBody.drop(firstArrayRead + 1).take(8).any { it.controlRef() == INDEX_OF_KEY },
        "the selection recorder no longer starts from the selected messages")
    val selectedField = selectBody[firstArrayRead].controlField()!!.let { "$chat->${it.origName}:${it.origType}" }
    controlShape(chatClass.fields.any { "$chat->${it.origName}:${it.origType}" == selectedField && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "the selected messages field is inaccessible")

    // The redraw: wherever the chat's tap selects a message, it next calls the chat's no-argument
    // count update, then its rows update with one boolean. The recorder alone leaves both stale.
    val redraws = chatClass.methods.flatMap { m ->
        val b = m.controlBody()
        b.indices.mapNotNull { i ->
            if (b[i].call()?.toString() != recorder.toString()) return@mapNotNull null
            val next = b.drop(i + 1).filter { it.opcode != Opcode.CONST_4 }.take(2).map { it.opcode to it.call() }
            val (count, rowsCall) = next.getOrNull(0) to next.getOrNull(1)
            if (count?.first != Opcode.INVOKE_VIRTUAL || rowsCall?.first != Opcode.INVOKE_VIRTUAL) return@mapNotNull null
            val c = count.second ?: return@mapNotNull null
            val r = rowsCall.second ?: return@mapNotNull null
            if (c.origDefiningClass != chat || c.origParameterTypes.isNotEmpty() || c.origReturnType != "V") return@mapNotNull null
            if (r.origDefiningClass != chat || r.origParameterTypes != listOf("Z") || r.origReturnType != "V") return@mapNotNull null
            c.toString() to r.toString()
        }
    }.distinct()
    val (titleRef, rowsRef) = redraws.controlSingle("the redraw after a tap selects")
    requireReachable(titleRef, false)
    requireReachable(rowsRef, false)

    // The list adapter's getter: frozen, filtered or the chat's own full list.
    val getters = chatClass.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.origType.startsWith("L") }.mapNotNull { field ->
        val adapter = tgClassDefByOrNull(field.type) ?: return@mapNotNull null
        val getter = adapter.methods.filter { m -> m.instance() && m.parameterTypes.isEmpty() && m.origReturnType == LIST && m.isMessagesGetter(chat) }
        if (getter.size == 1 && chatClass.fields.count { it.origType == field.origType } == 1) Triple(field, adapter.type, getter.single()) else null
    }
    val (adapterField, adapterType, getter) = getters.controlSingle("the chat's list adapter")
    controlShape(AccessFlags.PUBLIC.isSet(adapterField.accessFlags), "the chat's list adapter field is inaccessible")
    val getterRef = getter.toString()
    requireReachable(getterRef, false)
    val adapterRef = "$chat->${adapterField.name}:${adapterField.type}"
    controlShape(adapterType == adapterField.origType, "the chat's list adapter changed")
    return SelectBetweenSites(null, chat, create, at, click, handlerType, ownerField, selectMethod, wrapper.toString(), selectedField,
        adapterRef, getterRef, barGetter, menuMethod.toString(), adds.single(), addArgs, titleRef, rowsRef)
}

/** Whether this is the adapter's getter: the frozen list, the filtered list, then the chat's full list. */
internal fun Method.isMessagesGetter(chat: String): Boolean {
    val body = controlBody()
    return body.map { it.opcode } == listOf(
        Opcode.IGET_BOOLEAN, Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT,
        Opcode.IGET_BOOLEAN, Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT,
        Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT,
    ) && body[8].controlField()?.origType == chat && body[9].controlField()?.let { it.origDefiningClass == chat && it.origType == LIST } == true &&
        body[2].controlField()?.origType == LIST && body[6].controlField()?.origType == LIST
}

private fun Instruction.writes(register: Int): Boolean {
    val target = (this as? OneRegisterInstruction)?.registerA ?: return false
    return opcode.setsRegister() && (target == register || opcode.setsWideRegister() && target + 1 == register)
}

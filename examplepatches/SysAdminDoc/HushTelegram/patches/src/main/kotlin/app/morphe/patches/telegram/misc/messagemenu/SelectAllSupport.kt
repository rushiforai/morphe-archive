/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.util.names.addInstructions
import app.morphe.util.names.origParameterTypes
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.ControlFlow
import app.morphe.util.call
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

internal const val SELECT_ALL = "$EXTENSION_PACKAGE/misc/SelectAll;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val LIST = "Ljava/util/ArrayList;"
private const val CONTEXT = "Landroid/content/Context;"
private const val VIEW = "Landroid/view/View;"
private const val LINEAR = "Landroid/widget/LinearLayout;"
private const val SPARSE_ARRAYS = "[Landroid/util/SparseArray;"
private const val RECYCLER = "Landroidx/recyclerview/widget/RecyclerView;"
private const val MESSAGE = "Lorg/telegram/messenger/MessageObject;"
private const val DRAWABLES = "Lorg/telegram/messenger/R\$drawable;"
private const val ICON = "$DRAWABLES->abc_ic_menu_selectall_mtrl_alpha:I"

/** Select all's icon, which the chat's bar and shared media's share. */
internal fun BytecodePatchContext.writeSelectAllIcon() {
    writeStub(SELECT_ALL, "icon", 1, "sget v0, $ICON\nreturn v0")
}

/**
 * The chat half of Select all rides Select between's bar hooks, so all it adds is its icon, or
 * [missing], why this build can't show it.
 */
internal class SelectAllSites(val missing: String?) {
    fun apply(context: BytecodePatchContext) = context.writeSelectAllIcon()
}

internal fun BytecodePatchContext.resolveSelectAll(): SelectAllSites = try {
    requireStatusMethod("selectAll")
    controlHook(SELECT_ALL, "icon", listOf(), "I")
    controlMembers(DRAWABLES, "static abc_ic_menu_selectall_mtrl_alpha:I")
    SelectAllSites(null)
} catch (refused: PatchException) {
    SelectAllSites(refused.message ?: "Select all's icon can't be read")
}

/**
 * Where shared media's selection bar takes the Select all button, or [missing], why this build's
 * can't: the bar's show and hide method [toggle], hooked at its start, and everything the stubs
 * reach (see [writeStubs]).
 */
internal class SharedMediaSelectAllSites(
    val missing: String?,
    private val toggle: MutableMethod? = null,
    private val layout: String = "",
    private val modeField: String = "",
    private val selectedField: String = "",
    private val pagesField: String = "",
    private val dataField: String = "",
    private val dataMessages: String = "",
    private val closestTab: String = "",
    private val addItem: String = "",
    private val click: String = "",
    private val getAdapter: String = "",
    private val notify: String = "",
) {
    /** The same edit on a copy, so a smali problem refuses before the app is touched. */
    fun rehearse() = edit(MutableMethod(ImmutableMethod.of(toggle!!)))

    fun apply(context: BytecodePatchContext) {
        edit(toggle!!)
        context.writeStubs()
    }

    private fun edit(method: MutableMethod) {
        method.addInstructions(0, "invoke-static/range {p0 .. p1}, $SELECT_ALL->showing(${OBJECT}Z)V")
    }

    private fun BytecodePatchContext.writeStubs() {
        writeStub(SELECT_ALL, "addButton", 5, """
            check-cast p0, $layout
            invoke-virtual {p0}, $VIEW->getContext()$CONTEXT
            move-result-object v0
            invoke-virtual {p0, v0, p1, p2, p3}, $addItem
            move-result-object v0
            return-object v0
        """)
        writeStub(SELECT_ALL, "actionMode", 2, """
            check-cast p0, $layout
            iget-boolean v0, p0, $modeField
            return v0
        """)
        writeStub(SELECT_ALL, "tab", 2, """
            check-cast p0, $layout
            invoke-virtual {p0}, $closestTab
            move-result v0
            return v0
        """)
        writeStub(SELECT_ALL, "tabMessages", 4, """
            check-cast p0, $layout
            iget-object v0, p0, $dataField
            if-eqz v0, :none
            if-ltz p1, :none
            array-length v1, v0
            if-ge p1, v1, :none
            aget-object v0, v0, p1
            if-eqz v0, :none
            invoke-virtual {v0}, $dataMessages
            move-result-object v0
            return-object v0
            :none
            const/4 v0, 0x0
            return-object v0
        """)
        writeStub(SELECT_ALL, "selected", 2, """
            check-cast p0, $layout
            iget-object v0, p0, $selectedField
            return-object v0
        """)
        writeStub(SELECT_ALL, "pick", 5, """
            check-cast p0, $layout
            check-cast p1, $MESSAGE
            const/4 v0, 0x0
            const/4 v1, 0x0
            invoke-virtual {p0, v0, v1, p1, p2}, $click
            return-void
        """)
        writeStub(SELECT_ALL, "pages", 2, """
            check-cast p0, $layout
            iget-object v0, p0, $pagesField
            return-object v0
        """)
        writeStub(SELECT_ALL, "notifyList", 2, """
            instance-of v0, p0, $RECYCLER
            if-eqz v0, :none
            check-cast p0, $RECYCLER
            invoke-virtual {p0}, $getAdapter
            move-result-object v0
            if-eqz v0, :none
            invoke-virtual {v0}, $notify
            :none
            return-void
        """)
        writeStub(SELECT_ALL, "messageId", 2, """
            check-cast p0, $MESSAGE
            invoke-virtual {p0}, $MESSAGE->getId()I
            move-result v0
            return v0
        """)
        writeSelectAllIcon()
    }
}

/**
 * Shared media is the one view with Telegram's kept getClosestTab and getSelectedTab. Its
 * selection bar's items come from one public (Context, id, icon, label) factory that adds them to
 * the bar's LinearLayout, and the bar shows and hides through the one (Z)V method that starts by
 * comparing a flag against its argument, storing it and reading that same LinearLayout. A tap on a
 * row in selection mode is the public (index, view, message, tab) method, which reads the one
 * SparseArray[] the selection lives in. Each tab's messages come from the element class of the
 * one array field whose getter hands back the frozen list or the live one. The pages are the
 * array getClosestTab reads first, and their lists redraw through RecyclerView's adapter.
 */
internal fun BytecodePatchContext.resolveSharedMediaSelectAll(): SharedMediaSelectAllSites = try {
    sharedMediaSelectAll().also { it.rehearse() }
} catch (refused: PatchException) {
    SharedMediaSelectAllSites(refused.message ?: "shared media's selection bar can't be read")
} catch (failed: RuntimeException) {
    SharedMediaSelectAllSites("shared media's selection bar doesn't compile (${failed.javaClass.simpleName}: ${failed.message})")
}

private fun BytecodePatchContext.sharedMediaSelectAll(): SharedMediaSelectAllSites {
    requireStatusMethod("sharedMediaSelectAll")
    controlHook(SELECT_ALL, "showing", listOf(OBJECT, "Z"), "V")
    controlHook(SELECT_ALL, "addButton", listOf(OBJECT, "I", "I", STRING), OBJECT)
    controlHook(SELECT_ALL, "actionMode", listOf(OBJECT), "Z")
    controlHook(SELECT_ALL, "tab", listOf(OBJECT), "I")
    controlHook(SELECT_ALL, "tabMessages", listOf(OBJECT, "I"), LIST)
    controlHook(SELECT_ALL, "selected", listOf(OBJECT), SPARSE_ARRAYS)
    controlHook(SELECT_ALL, "pick", listOf(OBJECT, OBJECT, "I"), "V")
    controlHook(SELECT_ALL, "pages", listOf(OBJECT), "[$OBJECT")
    controlHook(SELECT_ALL, "notifyList", listOf(OBJECT), "V")
    controlHook(SELECT_ALL, "messageId", listOf(OBJECT), "I")
    controlHook(SELECT_ALL, "icon", listOf(), "I")
    controlMembers(DRAWABLES, "static abc_ic_menu_selectall_mtrl_alpha:I")
    controlMembers(MESSAGE, "getId()I")
    fun Method.publicInstance() = AccessFlags.PUBLIC.isSet(accessFlags) && !AccessFlags.STATIC.isSet(accessFlags)

    val found = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.origType.startsWith("Lapp/hushtelegram/extension/")) return@classDefForEach
        if (listOf("getClosestTab", "getSelectedTab").all { name -> classDef.methods.any { it.origName == name && it.parameterTypes.isEmpty() && it.origReturnType == "I" } } &&
            classDef.fields.any { it.origType == SPARSE_ARRAYS }) found += classDef
    }
    val layout = found.controlSingle("shared media").type
    val layoutClass = tgMutableClassDefBy(layout)
    controlShape(AccessFlags.PUBLIC.isSet(layoutClass.accessFlags), "shared media is inaccessible")
    fun field(ref: FieldReference?, what: String): String {
        controlShape(ref != null && ref.definingClass == layout, "$what isn't shared media's own")
        val held = layoutClass.fields.filter { it.name == ref!!.name && it.type == ref.type && !AccessFlags.STATIC.isSet(it.accessFlags) }
            .controlSingle(what)
        controlShape(AccessFlags.PUBLIC.isSet(held.accessFlags), "$what is inaccessible")
        return "$layout->${held.name}:${held.type}"
    }

    // The bar's item factory and the LinearLayout it adds to.
    val factory = layoutClass.methods.filter { m ->
        m.publicInstance() && m.origParameterTypes == listOf(CONTEXT, "I", "I", STRING) && m.origReturnType.startsWith("L")
    }.controlSingle("shared media's bar item factory")
    val factoryBody = factory.controlBody()
    val barField = factoryBody.filter { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.origType == LINEAR }
        .map { it.controlField().toString() }.distinct().controlSingle("shared media's selection bar")
    controlShape(factoryBody.any { it.call()?.let { c -> c.origName == "setOnClickListener" } == true },
        "shared media's bar items no longer take a click listener")

    // Show and hide: compare the flag, store it, then the bar.
    val toggles = layoutClass.methods.filter { m ->
        val b = m.controlBody()
        AccessFlags.PUBLIC.isSet(m.accessFlags) && !AccessFlags.STATIC.isSet(m.accessFlags) && m.origParameterTypes == listOf("Z") && m.origReturnType == "V" &&
            b.size > 4 && b.take(4).map { it.opcode } == listOf(Opcode.IGET_BOOLEAN, Opcode.IF_NE, Opcode.GOTO, Opcode.IPUT_BOOLEAN) &&
            b[0].controlField().toString() == b[3].controlField().toString() && b.any { it.controlField()?.toString() == barField }
    }
    val toggle = toggles.controlSingle("shared media's selection bar toggle")
    val flow = try {
        ControlFlow.of(toggle)
    } catch (failed: IllegalArgumentException) {
        throw PatchException("shared media's selection bar toggle can't be read (${failed.message})")
    }
    controlShape(flow.normal.none { 0 in it } && flow.exceptional.none { 0 in it }, "something jumps back to the start of shared media's selection bar toggle")
    val modeField = field(toggle.controlBody()[0].controlField(), "shared media's selection flag")

    // A row tap while selecting, and the selection it records.
    val click = layoutClass.methods.filter { m ->
        m.publicInstance() && m.origParameterTypes == listOf("I", VIEW, MESSAGE, "I") && m.origReturnType == "V"
    }.controlSingle("shared media's row tap")
    val selected = layoutClass.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.origType == SPARSE_ARRAYS }
        .controlSingle("shared media's selection")
    val selectedField = "$layout->${selected.name}:${selected.type}"
    controlShape(AccessFlags.PUBLIC.isSet(selected.accessFlags), "shared media's selection is inaccessible")
    controlShape(click.controlBody().any { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.toString() == selectedField },
        "shared media's row tap no longer records the selection")

    // The pages, the first array getClosestTab reads.
    val closest = layoutClass.methods.single { it.origName == "getClosestTab" && it.parameterTypes.isEmpty() && it.origReturnType == "I" }
    controlShape(closest.publicInstance(), "shared media's tab getter is inaccessible")
    val pagesRead = closest.controlBody().firstOrNull { it.opcode == Opcode.IGET_OBJECT }?.controlField()
    controlShape(pagesRead != null && pagesRead.type.startsWith("[L"), "shared media's pages changed")
    val pagesField = field(pagesRead, "shared media's pages")

    // Each tab's messages: the getter on the element class of one of the layout's arrays.
    val data = layoutClass.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type.startsWith("[L") }.mapNotNull { f ->
        val element = tgClassDefByOrNull(f.type.removePrefix("[")) ?: return@mapNotNull null
        val getter = element.methods.filter { m -> m.publicInstance() && m.parameterTypes.isEmpty() && m.origReturnType == LIST && m.isFrozenOrLive() }
        if (getter.size == 1 && AccessFlags.PUBLIC.isSet(element.accessFlags)) f to getter.single() else null
    }
    val (dataHeld, dataGetter) = data.controlSingle("shared media's messages")
    val dataField = "$layout->${dataHeld.name}:${dataHeld.type}"
    controlShape(AccessFlags.PUBLIC.isSet(dataHeld.accessFlags), "shared media's messages are inaccessible")

    // The page lists redraw through their adapter's notifyDataSetChanged.
    val recycler = tgClassDefByOrNull(RECYCLER)
    controlShape(recycler != null && AccessFlags.PUBLIC.isSet(recycler.accessFlags), "RecyclerView is missing")
    val getAdapter = recycler!!.methods.filter { it.origName == "getAdapter" && it.parameterTypes.isEmpty() && it.publicInstance() }
        .controlSingle("RecyclerView's adapter getter")
    val adapter = tgClassDefByOrNull(getAdapter.returnType)
    controlShape(adapter != null && AccessFlags.PUBLIC.isSet(adapter.accessFlags), "RecyclerView's adapter is missing")
    val notify = adapter!!.methods.filter { m ->
        val b = m.controlBody()
        m.publicInstance() && m.name != "<init>" && m.parameterTypes.isEmpty() && m.returnType == "V" &&
            b.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID) &&
            b[0].controlField()?.definingClass == adapter.type && b[1].call()?.let { it.parameterTypes.isEmpty() && it.returnType == "V" } == true
    }.controlSingle("the adapter's notifyDataSetChanged")

    for (method in listOf(factory, click, closest, dataGetter, getAdapter, notify)) requireReachable(method.toString(), false)
    return SharedMediaSelectAllSites(null, toggle, layout, modeField, selectedField, pagesField, dataField, dataGetter.toString(),
        closest.toString(), factory.toString(), click.toString(), getAdapter.toString(), notify.toString())
}

/** Whether this is a tab's message getter: the frozen list while it's frozen, otherwise the live one. */
private fun Method.isFrozenOrLive(): Boolean {
    val body = controlBody()
    return body.map { it.opcode } == listOf(
        Opcode.IGET_BOOLEAN, Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT, Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT,
    ) && body[2].controlField()?.origType == LIST && body[4].controlField()?.origType == LIST
}

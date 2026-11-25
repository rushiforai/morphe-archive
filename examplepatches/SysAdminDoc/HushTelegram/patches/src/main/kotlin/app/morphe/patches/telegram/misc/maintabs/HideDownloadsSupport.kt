/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.maintabs

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.loadsInt
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val DOWNLOADS_BUTTON = "$MAIN_TABS->downloadsButton(F)F"
internal const val DOWNLOADS_DRAWN = "$MAIN_TABS->downloadsDrawn(Ljava/lang/Object;Ljava/lang/Object;)V"
internal const val DOWNLOADS_WANTED = "$MAIN_TABS->downloadsWanted(I)I"
internal const val DOWNLOADS_KEPT = "$MAIN_TABS->downloadsKept(I)I"
internal const val DOWNLOADS_TABS = "Lorg/telegram/messenger/R\$string;->DownloadsTabs:I"

/**
 * The chat list's one animated visibility call for its Downloads button, or [missing], why this
 * build can't have the switch. [at] is that call in [method], [factor] the register holding how
 * visible Telegram wants the button, and [button] the chat list's field holding it. [view] is
 * the register the call takes the button in. [redrawMissing] is why the settings closing can't
 * have the chat list draw its button again, or null when it can: then the chat list is passed on
 * with its button right after the factor, and [redrawStub] runs [method] on it.
 */
internal class DownloadsButton(val method: MutableMethod?, val at: Int, val factor: Int, val missing: String?,
    val button: String? = null, val view: Int = 0) {
    private val self = method?.localRegisterCount() ?: 0

    val redrawMissing: String? = when {
        method == null -> missing
        AccessFlags.PRIVATE.isSet(method.accessFlags) || method.parameterTypes.isNotEmpty() || method.returnType != "V" ->
            "the Downloads button's method can't be run from outside the chat list"
        view == self -> "the chat list's Downloads button is read over the chat list itself"
        self > 15 || view > 15 -> "the Downloads button's method keeps the chat list in a register a call can't name"
        else -> null
    }

    /** The same edit on a copy, so a smali problem refuses before the app is touched. */
    fun rehearse() {
        if (method != null) insert(MutableMethod(ImmutableMethod.of(method)))
    }

    fun apply() {
        if (method != null) insert(method)
    }

    /** The body of the runtime's stub that has a chat list draw its Downloads button again. */
    fun redrawStub(): String? {
        if (method == null || redrawMissing != null) return null
        return """
            check-cast p0, ${method.definingClass}
            invoke-virtual {p0}, ${method.definingClass}->${method.name}()V
            return-void
        """
    }

    private fun insert(target: MutableMethod) {
        val drawn = if (redrawMissing == null) "invoke-static {v$self, v$view}, $DOWNLOADS_DRAWN" else ""
        target.addInstructionsAtControlFlowLabel(at, """
            invoke-static/range {v$factor .. v$factor}, $DOWNLOADS_BUTTON
            move-result v$factor
            $drawn
        """)
    }
}

/**
 * The chat list labels its Downloads button once, as it builds its top bar, and from then on shows
 * or hides it through one call that takes the button and a factor from 0 to 1 (whether a download
 * runs or waits, times the search, side and Done animations). The runtime answers that factor, so
 * a hidden button fades out the way Telegram fades it, and nothing else on the bar is touched.
 */
internal fun BytecodePatchContext.resolveDownloadsButton(): DownloadsButton {
    controlHook(MAIN_TABS, "downloadsButton", listOf("F"), "F")
    controlHook(MAIN_TABS, "downloadsDrawn", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "V")
    fun missing(why: String) = DownloadsButton(null, 0, 0, why)

    val fields = mutableMapOf<String, String>()
    forEachClassMentioning(Mention.reference(DOWNLOADS_TABS)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        for (m in cls.methods) {
            if (AccessFlags.STATIC.isSet(m.accessFlags) || m.implementation == null) continue
            val body = m.controlBody()
            // Play and Plus copy this out of its parameter register at the top of createView, so the
            // label is tied to the class's own field rather than to the register the button is read through.
            for (index in body.indices) {
                if (!body[index].loadsInt() || body[index].controlRef() != DOWNLOADS_TABS) continue
                val read = body.getOrNull(index - 1) ?: continue
                val field = read.controlField() ?: continue
                val registers = read.namedRegisters()
                if (read.opcode != Opcode.IGET_OBJECT || field.origDefiningClass != m.origDefiningClass) continue
                val labeled = body.subList(index + 1, minOf(body.size, index + 5)).any { next ->
                    val call = next.call()
                    next.opcode == Opcode.INVOKE_VIRTUAL && call?.origName == "setContentDescription" &&
                        call.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/CharSequence;") &&
                        next.namedRegisters().first() == registers[0]
                }
                if (labeled) fields[field.toString()] = cls.type
            }
        }
    }
    if (fields.size != 1) return missing("the chat list no longer labels one Downloads button (${fields.size})")
    val (field, owner) = fields.entries.single()

    val sites = mutableListOf<Pair<MutableMethod, Int>>()
    for (m in tgMutableClassDefBy(owner).methods) {
        if (AccessFlags.STATIC.isSet(m.accessFlags) || m.implementation == null) continue
        val body = m.controlBody()
        val self = m.localRegisterCount()
        for (index in 0 until body.size - 1) {
            val read = body[index]
            if (read.opcode != Opcode.IGET_OBJECT || read.controlField()?.toString() != field || read.namedRegisters()[1] != self) continue
            val shown = body[index + 1]
            val call = shown.call() ?: continue
            if (shown.opcode == Opcode.INVOKE_STATIC && call.returnType == "V" &&
                call.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/View;", "F") &&
                shown.namedRegisters().first() == read.namedRegisters()[0]) {
                sites += m to index + 1
            }
        }
    }
    if (sites.size != 1) return missing("the Downloads button no longer shows through one animated visibility call (${sites.size})")
    val (method, at) = sites.single()
    val (view, factor) = method.controlBody()[at].namedRegisters()
    if (view == factor) return missing("the Downloads button's visibility factor shares a register with the button")
    if (factor > 255) return missing("the Downloads button's visibility factor sits in a register a call can't name")
    try {
        method.requireThisIntact("Downloads button", listOf(at - 1))
    } catch (changed: PatchException) {
        return missing("the Downloads button is no longer read from the chat list itself")
    }
    return DownloadsButton(method, at, factor, null, field, view)
}

/**
 * Where Always show Downloads button goes in, or [missing], why this build can't have it. [wanted]
 * is the instruction after the one read of the chat list's own flag in [method], the button's
 * method, and [flag] the register that read fills. [writer] is the one method that works the flag
 * out, [kept] the instruction after it reads the button's visibility, and [visibility] the
 * register that lands in.
 */
internal class DownloadsShown(
    val method: MutableMethod?,
    val wanted: Int,
    val flag: Int,
    val writer: MutableMethod?,
    val kept: Int,
    val visibility: Int,
    val missing: String?,
) {
    /** The same edits on copies, so a smali problem refuses before the app is touched. */
    fun rehearse() {
        if (method != null && writer != null) insert(MutableMethod(ImmutableMethod.of(method)), MutableMethod(ImmutableMethod.of(writer)))
    }

    /** After [DownloadsButton.apply]: its call sits further down the same method, so this one doesn't move it. */
    fun apply() {
        if (method != null && writer != null) insert(method, writer)
    }

    private fun insert(shows: MutableMethod, keeps: MutableMethod) {
        shows.addInstructionsAtControlFlowLabel(wanted, """
            invoke-static/range {v$flag .. v$flag}, $DOWNLOADS_WANTED
            move-result v$flag
        """)
        keeps.addInstructionsAtControlFlowLabel(kept, """
            invoke-static/range {v$visibility .. v$visibility}, $DOWNLOADS_KEPT
            move-result v$visibility
        """)
    }
}

/**
 * The button's factor starts from one flag of the chat list's own, yes while a file downloads or
 * one you haven't opened waits: Telegram turns it into 1 or 0 and multiplies that by the search,
 * side and Done animations. The runtime answers the flag right after it's read, so a button the
 * switch keeps up still goes away under search the way a download's does. The flag's one writer
 * also keeps a button that's up at full strength, by its visibility, until the next forced look;
 * the runtime answers that visibility too, so a button up only for the switch isn't kept by its
 * own showing once the switch goes off. A build where the flag has another reader, or more than
 * one writer, would show the button while that code thinks it's hidden, so it doesn't get the switch.
 */
internal fun BytecodePatchContext.resolveDownloadsShown(button: DownloadsButton): DownloadsShown {
    controlHook(MAIN_TABS, "downloadsWanted", listOf("I"), "I")
    controlHook(MAIN_TABS, "downloadsKept", listOf("I"), "I")
    fun missing(why: String) = DownloadsShown(null, 0, 0, null, 0, 0, why)
    val method = button.method ?: return missing(button.missing ?: "the Downloads button wasn't found")
    val buttonField = button.button ?: return missing("the Downloads button wasn't found")

    val body = method.controlBody()
    val self = method.localRegisterCount()
    val reads = (0 until button.at).filter { index ->
        val field = body[index].controlField()
        body[index].opcode == Opcode.IGET_BOOLEAN && field?.origDefiningClass == method.origDefiningClass &&
            body[index].namedRegisters()[1] == self
    }
    if (reads.size != 1) return missing("the Downloads button's method no longer reads one flag of the chat list's own (${reads.size})")
    val read = reads.single()
    val flag = body[read].namedRegisters()[0]
    val flagField = body[read].controlField().toString()
    // The flag decides the factor: the next instruction to name its register tests it.
    val test = (read + 1 until button.at).firstOrNull { flag in body[it].namedRegisters() }
    if (test == null || body[test].opcode !in FLAG_TESTS || body[test].namedRegisters() != listOf(flag)) {
        return missing("the chat list's flag no longer decides the Downloads button")
    }
    if (method.reachedByJump(read + 1)) return missing("the chat list's code jumps past its read of the Downloads flag")
    try {
        method.requireThisIntact("Always show Downloads button", listOf(read))
    } catch (changed: PatchException) {
        return missing("the Downloads flag is no longer read from the chat list itself")
    }

    // The field is public, so any class could read or write it: the whole app is asked.
    var readers = 0
    val writers = mutableSetOf<String>()
    forEachClassMentioning(Mention.reference(flagField)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        for (m in cls.methods) for (instruction in m.controlBody()) {
            if (instruction.controlField()?.toString() != flagField) continue
            if (instruction.opcode == Opcode.IPUT_BOOLEAN) writers += memberKey(cls.type, m) else readers++
        }
    }
    if (readers != 1) return missing("the chat list's Downloads flag has other readers now ($readers)")
    val writer = tgMutableClassDefBy(method.definingClass).methods.filter { memberKey(method.definingClass, it) in writers }
        .singleOrNull()?.takeIf { writers.size == 1 }
        ?: return missing("the chat list's Downloads flag is no longer worked out in one method of its own (${writers.size})")
    if (writer === method || AccessFlags.STATIC.isSet(writer.accessFlags)) {
        return missing("the chat list's Downloads flag is no longer worked out in one method of its own (${writers.size})")
    }

    // Telegram keeps a button that's up at full strength unless it's asked to look again.
    val written = writer.controlBody()
    val writerSelf = writer.localRegisterCount()
    val looks = (0 until written.size - 3).filter { index ->
        val read = written[index]
        val call = written[index + 1].call()
        read.opcode == Opcode.IGET_OBJECT && read.controlField()?.toString() == buttonField && read.namedRegisters()[1] == writerSelf &&
            written[index + 1].opcode == Opcode.INVOKE_VIRTUAL && call?.origName == "getVisibility" && call.parameterTypes.isEmpty() &&
            call.returnType == "I" && written[index + 1].namedRegisters() == listOf(read.namedRegisters()[0]) &&
            written[index + 2].opcode == Opcode.MOVE_RESULT
    }
    if (looks.size != 1) return missing("the chat list no longer checks once whether its Downloads button is up (${looks.size})")
    val look = looks.single()
    val visibility = written[look + 2].namedRegisters()[0]
    val kept = look + 3
    if (written[kept].opcode !in FLAG_TESTS || written[kept].namedRegisters() != listOf(visibility)) {
        return missing("the chat list no longer keeps its Downloads button by whether it's up")
    }
    if (writer.reachedByJump(kept)) return missing("the chat list's code jumps onto its check of the Downloads button")
    try {
        writer.requireThisIntact("Always show Downloads button", listOf(look))
    } catch (changed: PatchException) {
        return missing("the Downloads button is no longer checked on the chat list itself")
    }
    return DownloadsShown(method, read + 1, flag, writer, kept, visibility, null)
}

private val FLAG_TESTS = setOf(Opcode.IF_EQZ, Opcode.IF_NEZ)

private fun memberKey(owner: String, method: Method) =
    "$owner->${method.name}(${method.parameterTypes.joinToString("") { it.toString() }})${method.returnType}"

/**
 * Whether anything but falling through from the instruction before reaches [index]: a branch, a
 * switch arm or a handler. Code put in front of it would run on that path too, with whatever the
 * registers hold there.
 */
private fun Method.reachedByJump(index: Int): Boolean {
    val flow = try {
        ControlFlow.of(this)
    } catch (unreadable: IllegalArgumentException) {
        return true
    }
    if (flow.exceptional.any { index in it }) return true
    return flow.normal.indices.any { from ->
        val fallsThrough = from == index - 1 && flow.instructions[from].opcode.canContinue()
        flow.normal[from].count { it == index } > (if (fallsThrough) 1 else 0)
    }
}

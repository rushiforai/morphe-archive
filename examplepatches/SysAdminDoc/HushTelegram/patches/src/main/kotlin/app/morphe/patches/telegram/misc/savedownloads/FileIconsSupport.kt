/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.savedownloads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.ControlFlow
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.TelegramNames
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val FILE_ICONS = "$EXTENSION_PACKAGE/misc/FileIcons;"
internal const val FILE_ICONS_SHARED_HOOK = "$FILE_ICONS->sharedIcon(Landroid/widget/ImageView;I)V"
internal const val FILE_ICONS_BUBBLE_HOOK = "$FILE_ICONS->bubble(Ljava/lang/Object;Landroid/graphics/Canvas;)V"
internal const val ICONS_SET_IMAGE = "Landroid/widget/ImageView;->setImageResource(I)V"
internal const val ICONS_RADIAL = "Lorg/telegram/ui/Components/RadialProgress2;"
internal const val ICONS_RADIAL_DRAW = "$ICONS_RADIAL->draw(Landroid/graphics/Canvas;)V"
/** The string only Shared media's file cell loads, the filter of its thumbnail's blurred placeholder. */
internal const val ICONS_SHARED_FILTER = "40_40_b"
internal const val ICONS_HAS_THUMB = "$MESSAGE_OBJECT->isDocumentHasThumb($DOCUMENT)Z"
internal const val ICONS_PATH_TO_MESSAGE = "$FILE_LOADER->getPathToMessage($TL_MESSAGE)Ljava/io/File;"
internal const val ICONS_DOCUMENT_ID = "$DOCUMENT->id:J"
internal const val ICONS_MIME = "$DOCUMENT->mime_type:Ljava/lang/String;"
internal const val ICONS_ATTACH_PATH = "$TL_MESSAGE->attachPath:Ljava/lang/String;"
/** MediaActionDrawable's file icon, which the extension's ICON_FILE matches. */
internal const val ICONS_FILE_ICON = 5
private const val ICONS_OBJECT = "Ljava/lang/Object;"
private const val ICONS_STRING = "Ljava/lang/String;"
private const val ICONS_FILE = "Ljava/io/File;"
private const val ICONS_VIEW = "Landroid/view/View;"
private const val ICONS_IMAGE_VIEW = "Landroid/widget/ImageView;"
private const val ICONS_TEXT_VIEW = "Landroid/widget/TextView;"
private const val ICONS_CANVAS = "Landroid/graphics/Canvas;"
private const val ICONS_RECT = "Landroid/graphics/RectF;"
private const val ICONS_SET_TEXT = "Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V"

/** Every entry the patch calls and every stub it writes, as this build of the extension declares them. */
internal fun BytecodePatchContext.requireFileIconsRuntime() {
    controlHook(FILE_ICONS, "sharedIcon", listOf(ICONS_IMAGE_VIEW, "I"), "V")
    controlHook(FILE_ICONS, "bubble", listOf(ICONS_OBJECT, ICONS_CANVAS), "V")
    for ((name, result) in listOf("sharedMessage" to ICONS_OBJECT, "sharedLabel" to ICONS_OBJECT, "cellMessage" to ICONS_OBJECT,
        "progressIcon" to "I", "progressParent" to ICONS_OBJECT, "progressRect" to ICONS_RECT, "document" to ICONS_OBJECT,
        "attachPath" to ICONS_STRING, "cachePath" to ICONS_FILE, "documentId" to "J", "hasThumb" to "Z",
        "fileName" to ICONS_STRING, "mime" to ICONS_STRING)) {
        controlHook(FILE_ICONS, name, listOf(ICONS_OBJECT), result)
    }
}

/** One stub body: its name in FileIcons, its registers in all and its smali. */
internal class FileIconStub(val name: String, val registers: Int, val smali: String)

/**
 * The stubs that read a message's document the way Telegram does, which both halves share. Each
 * one checks what it's given, so a cell or message of any other kind reads as nothing.
 */
private fun fileIconCommonStubs(): List<FileIconStub> = listOf(
    FileIconStub("document", 2, """
        instance-of v0, p0, $MESSAGE_OBJECT
        if-eqz v0, :hush_none
        check-cast p0, $MESSAGE_OBJECT
        invoke-virtual {p0}, $GET_DOCUMENT
        move-result-object v0
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """),
    FileIconStub("attachPath", 2, """
        instance-of v0, p0, $MESSAGE_OBJECT
        if-eqz v0, :hush_none
        check-cast p0, $MESSAGE_OBJECT
        iget-object v0, p0, $MESSAGE_OWNER
        if-eqz v0, :hush_none
        iget-object v0, v0, $ICONS_ATTACH_PATH
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """),
    FileIconStub("cachePath", 2, """
        instance-of v0, p0, $MESSAGE_OBJECT
        if-eqz v0, :hush_none
        check-cast p0, $MESSAGE_OBJECT
        iget-object v0, p0, $MESSAGE_OWNER
        if-eqz v0, :hush_none
        invoke-static {v0}, $ICONS_PATH_TO_MESSAGE
        move-result-object v0
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """),
    FileIconStub("documentId", 3, """
        instance-of v0, p0, $DOCUMENT
        if-eqz v0, :hush_none
        check-cast p0, $DOCUMENT
        iget-wide v0, p0, $ICONS_DOCUMENT_ID
        return-wide v0
        :hush_none
        const-wide/16 v0, 0x0
        return-wide v0
    """),
    FileIconStub("hasThumb", 2, """
        instance-of v0, p0, $DOCUMENT
        if-eqz v0, :hush_none
        check-cast p0, $DOCUMENT
        invoke-static {p0}, $ICONS_HAS_THUMB
        move-result v0
        return v0
        :hush_none
        const/4 v0, 0x0
        return v0
    """),
    FileIconStub("fileName", 2, """
        instance-of v0, p0, $DOCUMENT
        if-eqz v0, :hush_none
        check-cast p0, $DOCUMENT
        invoke-static {p0}, $DOCUMENT_NAME
        move-result-object v0
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """),
    FileIconStub("mime", 2, """
        instance-of v0, p0, $DOCUMENT
        if-eqz v0, :hush_none
        check-cast p0, $DOCUMENT
        iget-object v0, p0, $ICONS_MIME
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """),
)

/** A stub that hands back [field] of [owner] when it's given one, otherwise null. */
private fun fileIconFieldStub(name: String, owner: String, field: String) = FileIconStub(name, 2, """
    instance-of v0, p0, $owner
    if-eqz v0, :hush_none
    check-cast p0, $owner
    iget-object v0, p0, $field
    return-object v0
    :hush_none
    const/4 v0, 0x0
    return-object v0
""")

/** Throws unless the common stubs can reach what they call and read from the extension's package. */
private fun BytecodePatchContext.requireFileIconCommonReach() {
    for ((reference, static) in listOf(GET_DOCUMENT to false, MESSAGE_OWNER to false, ICONS_ATTACH_PATH to false,
        ICONS_PATH_TO_MESSAGE to true, ICONS_DOCUMENT_ID to false, ICONS_HAS_THUMB to true, DOCUMENT_NAME to true,
        ICONS_MIME to false)) {
        requireReachable(reference, static)
    }
}

/** [stubs] put into this build's names, which throws on a name the build doesn't have. */
private fun rehearseFileIconStubs(stubs: List<FileIconStub>) {
    for (stub in stubs) TelegramNames.tg(stub.smali)
}

/**
 * Writes [stubs] into the extension, before any of Telegram's code is touched, and gives back why
 * not when one of them would fail Android's verifier. A stub that's written while its hook isn't
 * placed is never called.
 */
private fun BytecodePatchContext.writeFileIconStubs(stubs: List<FileIconStub>): String? = try {
    for (stub in stubs) writeStub(FILE_ICONS, stub.name, stub.registers, stub.smali)
    null
} catch (refused: PatchException) {
    refused.message ?: "the file icon stubs can't be written"
}

/** The call in place of [at]'s, with the same registers, to [hook]. */
private fun fileIconCall(at: Instruction, hook: String): String {
    val registers = at.namedRegisters()
    val operands = if (at is RegisterRangeInstruction) "invoke-static/range {v${registers.first()} .. v${registers.last()}}"
    else "invoke-static {${registers.joinToString { "v$it" }}}"
    return "$operands, $hook"
}

/** Whether every path from the start of the method to [use] runs [source] first. */
private fun ControlFlow.fileIconsDominates(source: Int, use: Int): Boolean {
    val pending = ArrayDeque<Int>()
    val visited = mutableSetOf<Int>()
    pending += 0
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == source || !visited.add(at)) continue
        if (at == use) return false
        pending.addAll(normal[at] + exceptional[at])
    }
    return true
}

/** The instruction before [before] that last wrote [register], read straight up the code, or null. */
private fun List<Instruction>.fileIconWriteBefore(register: Int, before: Int): Instruction? {
    for (i in before - 1 downTo 0) {
        val written = this[i]
        if (!written.opcode.setsRegister()) continue
        val destination = (written as? OneRegisterInstruction)?.registerA ?: continue
        if (destination == register || written.opcode.setsWideRegister() && destination + 1 == register) return written
    }
    return null
}

private fun Instruction.fileIconVirtualCall() = opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_VIRTUAL_RANGE

private fun Method.fileIconFlow(what: String): ControlFlow = try {
    ControlFlow.of(this)
} catch (failed: IllegalArgumentException) {
    throw PatchException("$what can't be read (${failed.message})")
}

/**
 * Shared media's file cell, where it sets a file's icon, or [missing], why this build's can't take
 * file icons: the bind method [method]'s setImageResource at [site], swapped for the extension's,
 * and the cell's own message and extension label, which the stubs read off the icon's parent.
 */
internal class SharedFileIcons(
    val missing: String?,
    private val method: MutableMethod? = null,
    private val site: Int = -1,
    private val stubs: List<FileIconStub> = emptyList(),
) {
    /** The same edit on a copy, and the stubs in the build's names, so a problem refuses before the app is touched. */
    fun rehearse() {
        edit(MutableMethod(ImmutableMethod.of(method!!)))
        rehearseFileIconStubs(stubs)
    }

    /** Null once the icon is hooked, otherwise why not, with Telegram's code as it was. */
    fun apply(context: BytecodePatchContext): String? {
        context.writeFileIconStubs(stubs)?.let { return it }
        edit(method!!)
        return null
    }

    private fun edit(target: MutableMethod) {
        target.replaceInstruction(site, fileIconCall(target.controlBody()[site], FILE_ICONS_SHARED_HOOK))
    }
}

internal fun BytecodePatchContext.resolveSharedFileIcons(): SharedFileIcons = try {
    sharedFileIcons().also { it.rehearse() }
} catch (refused: PatchException) {
    SharedFileIcons(refused.message ?: "Shared media's file icon can't be read")
} catch (failed: RuntimeException) {
    SharedFileIcons("Shared media's file icon doesn't compile (${failed.javaClass.simpleName}: ${failed.message})")
}

/**
 * Shared media's file cell is the one class that loads its thumbnail's blurred filter. Its bind
 * method, public (MessageObject, boolean), stores the message first, shows the icon and the
 * extension label over it, then sets the icon Telegram picks from the file's name, then the label's
 * text. A file with a server thumbnail gets it drawn over both afterwards.
 */
private fun BytecodePatchContext.sharedFileIcons(): SharedFileIcons {
    requireFileIconCommonReach()
    val cells = mutableListOf<ClassDef>()
    forEachClassMentioning(Mention.string(ICONS_SHARED_FILTER)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        if (cls.methods.any { m -> m.controlBody().any { it.controlString() == ICONS_SHARED_FILTER } }) cells += cls
    }
    val cell = cells.controlSingle("Shared media's file cell").type
    val cellClass = tgMutableClassDefBy(cell)
    controlShape(AccessFlags.PUBLIC.isSet(cellClass.accessFlags), "Shared media's file cell is inaccessible")
    fun field(ref: FieldReference?, what: String): String {
        controlShape(ref != null && ref.definingClass == cell, "$what isn't the file cell's own")
        val held = cellClass.fields.filter { it.name == ref!!.name && it.type == ref.type && !AccessFlags.STATIC.isSet(it.accessFlags) }
            .controlSingle(what)
        controlShape(AccessFlags.PUBLIC.isSet(held.accessFlags), "$what is inaccessible")
        return "$cell->${held.name}:${held.type}"
    }

    val bind = cellClass.methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.origParameterTypes == listOf(MESSAGE_OBJECT, "Z") && m.origReturnType == "V"
    }.controlSingle("Shared media's file binding")
    val body = bind.controlBody()
    val site = body.indices.filter { body[it].fileIconVirtualCall() && body[it].controlRef() == ICONS_SET_IMAGE }
        .controlSingle("Shared media's file icon")
    val (image, resource) = body[site].namedRegisters().let { it.first() to it.last() }
    val picked = if (site >= 2) body[site - 2].call() else null
    controlShape(site >= 2 && body[site - 1].opcode == Opcode.MOVE_RESULT && (body[site - 1] as OneRegisterInstruction).registerA == resource &&
        picked != null && picked.returnType == "I" &&
        (body[site - 2].opcode == Opcode.INVOKE_STATIC || body[site - 2].opcode == Opcode.INVOKE_STATIC_RANGE),
        "Shared media's file icon no longer comes from the file's name")
    val icon = body.fileIconWriteBefore(image, site)
    controlShape(icon != null && icon.opcode == Opcode.IGET_OBJECT && icon.controlField()?.type == ICONS_IMAGE_VIEW,
        "Shared media's file icon isn't the cell's own")
    field(icon!!.controlField(), "Shared media's file icon")

    // The label: shown just before the icon, given its text just after.
    val shown = (maxOf(0, site - 4) until site).filter { i ->
        val call = body[i].call()
        body[i].fileIconVirtualCall() && call != null && call.name == "setVisibility" && call.parameterTypes.map { it.toString() } == listOf("I") &&
            body[i].namedRegisters().first() != image
    }.controlSingle("the file's extension label")
    val label = body[shown].namedRegisters().first()
    val labelRead = body.fileIconWriteBefore(label, shown)
    controlShape(labelRead != null && labelRead.opcode == Opcode.IGET_OBJECT && labelRead.controlField()?.type == ICONS_TEXT_VIEW,
        "the file's extension label isn't the cell's own")
    val labelField = field(labelRead!!.controlField(), "the file's extension label")
    val labelUse = (site + 1 until body.size).firstOrNull { label in body[it].namedRegisters() }
    controlShape(labelUse != null && body[labelUse].fileIconVirtualCall() && body[labelUse].controlRef() == ICONS_SET_TEXT &&
        body[labelUse].namedRegisters().first() == label, "the file's extension label no longer gets its text after the icon")

    // The message the cell shows, stored before the icon on every path.
    val flow = bind.fileIconFlow("Shared media's file binding")
    val stored = body.indices.filter { i ->
        body[i].opcode == Opcode.IPUT_OBJECT && body[i].controlField()?.let { it.definingClass == cell && it.origType == MESSAGE_OBJECT } == true
    }.controlSingle("the file cell's message")
    controlShape(flow.fileIconsDominates(stored, site), "the file cell's message is stored after its icon")
    val given = bind.parameterRegisterNumber(0)
    controlShape(body[stored].namedRegisters().first() == given || body.fileIconWriteBefore(body[stored].namedRegisters().first(), stored)?.let { move ->
        move.opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) && move.namedRegisters().getOrNull(1) == given
    } == true,
        "the file cell no longer stores the message it's given")
    val messageField = field(body[stored].controlField(), "the file cell's message")

    val stubs = fileIconCommonStubs() + fileIconFieldStub("sharedMessage", cell, messageField) +
        fileIconFieldStub("sharedLabel", cell, labelField)
    return SharedFileIcons(null, bind, site, stubs)
}

/**
 * The chat cell's file circle, where it draws it, or [missing], why this build's can't take file
 * icons: right after [method]'s draw of the cell's own circle at [draw], the extension's draw goes
 * in, handed the circle and the canvas.
 */
internal class ChatFileIcons(
    val missing: String?,
    private val method: MutableMethod? = null,
    private val draw: Int = -1,
    private val stubs: List<FileIconStub> = emptyList(),
) {
    fun rehearse() {
        edit(MutableMethod(ImmutableMethod.of(method!!)))
        rehearseFileIconStubs(stubs)
    }

    /** Null once the draw is hooked, otherwise why not, with Telegram's code as it was. */
    fun apply(context: BytecodePatchContext): String? {
        context.writeFileIconStubs(stubs)?.let { return it }
        edit(method!!)
        return null
    }

    private fun edit(target: MutableMethod) {
        target.addInstructions(draw + 1, fileIconCall(target.controlBody()[draw], FILE_ICONS_BUBBLE_HOOK))
    }
}

internal fun BytecodePatchContext.resolveChatFileIcons(): ChatFileIcons = try {
    chatFileIcons().also { it.rehearse() }
} catch (refused: PatchException) {
    ChatFileIcons(refused.message ?: "the chat cell's file circle can't be read")
} catch (failed: RuntimeException) {
    ChatFileIcons("the chat cell's file circle doesn't compile (${failed.javaClass.simpleName}: ${failed.message})")
}

/**
 * The chat message cell is the one class with Telegram's kept getRadialProgress. Its public
 * (Canvas) method that starts by reading the message it shows draws that circle first, inside the
 * layer it saves for it. RadialProgress2's kept setIcon reads the icon off its main drawable and
 * redraws the view the circle sits in; the circle's own rect is its one RectF.
 */
private fun BytecodePatchContext.chatFileIcons(): ChatFileIcons {
    requireFileIconCommonReach()
    val cells = mutableListOf<ClassDef>()
    forEachClassMentioning(Mention.type(ICONS_RADIAL)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        if (cls.methods.any { it.origName == "getRadialProgress" && it.parameterTypes.isEmpty() && it.origReturnType == ICONS_RADIAL &&
                !AccessFlags.STATIC.isSet(it.accessFlags) }) cells += cls
    }
    val cell = cells.controlSingle("the chat message cell").type
    val cellClass = tgMutableClassDefBy(cell)
    controlShape(AccessFlags.PUBLIC.isSet(cellClass.accessFlags), "the chat message cell is inaccessible")
    val getter = cellClass.methods.single { it.origName == "getRadialProgress" && it.parameterTypes.isEmpty() }
    val circleField = getter.controlBody().firstOrNull { it.opcode == Opcode.IGET_OBJECT }?.controlField()
    controlShape(circleField != null && circleField.definingClass == cell && circleField.type == ICONS_RADIAL,
        "the chat cell's file circle isn't its own")
    // The file circle shows MediaActionDrawable's file icon once the file is there.
    val state = cellClass.methods.filter { it.origName == "getIconForCurrentState" && it.parameterTypes.isEmpty() && it.origReturnType == "I" }
        .controlSingle("the chat cell's icon state")
    controlShape(state.controlBody().any { (it as? NarrowLiteralInstruction)?.narrowLiteral == ICONS_FILE_ICON && it.opcode == Opcode.CONST_4 },
        "the chat cell's icons no longer include the file icon")

    val draws = cellClass.methods.filter { m ->
        val body = m.controlBody()
        AccessFlags.PUBLIC.isSet(m.accessFlags) && !AccessFlags.STATIC.isSet(m.accessFlags) &&
            m.origParameterTypes == listOf(ICONS_CANVAS) && m.origReturnType == "V" && body.isNotEmpty() &&
            body[0].opcode == Opcode.IGET_OBJECT && body[0].controlField()?.let { it.definingClass == cell && it.origType == MESSAGE_OBJECT } == true &&
            body.any { it.fileIconVirtualCall() && it.controlRef() == ICONS_RADIAL_DRAW }
    }
    val method = draws.controlSingle("the chat cell's file circle drawing")
    val body = method.controlBody()
    val draw = body.indexOfFirst { it.fileIconVirtualCall() && it.controlRef() == ICONS_RADIAL_DRAW }
    val circle = body.fileIconWriteBefore(body[draw].namedRegisters().first(), draw)
    controlShape(draw >= 0 && circle != null && circle.opcode == Opcode.IGET_OBJECT && circle.controlField()?.toString() == circleField.toString(),
        "the chat cell no longer draws its own file circle first")
    controlShape(draw + 1 < body.size, "the chat cell's file circle is drawn last")
    val flow = method.fileIconFlow("the chat cell's file circle drawing")
    controlShape(flow.normal.withIndex().none { (from, to) -> from != draw && draw + 1 in to } && flow.exceptional.none { draw + 1 in it },
        "something jumps right past the chat cell's file circle")
    val messageRead = body[0].controlField()!!
    val messageField = cellClass.fields.filter { it.name == messageRead.name && it.type == messageRead.type && !AccessFlags.STATIC.isSet(it.accessFlags) }
        .controlSingle("the chat cell's message")
    controlShape(AccessFlags.PUBLIC.isSet(messageField.accessFlags), "the chat cell's message is inaccessible")

    // What the circle shows, where it's drawn and the view it's drawn in.
    val radial = tgClassDefByOrNull(ICONS_RADIAL)
    controlShape(radial != null && AccessFlags.PUBLIC.isSet(radial.accessFlags), "RadialProgress2 is missing")
    val setIcon = radial!!.methods.filter { it.origName == "setIcon" && it.origParameterTypes == listOf("I", "Z", "Z") && it.origReturnType == "V" }
        .controlSingle("RadialProgress2's setIcon")
    val iconBody = setIcon.controlBody()
    val drawableRead = iconBody.firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.definingClass == ICONS_RADIAL }?.controlField()
    controlShape(drawableRead != null, "RadialProgress2's icon drawable changed")
    val iconAt = iconBody.indexOfFirst { it.opcode == Opcode.IGET && it.controlField()?.let { f -> f.definingClass == drawableRead!!.type && f.type == "I" } == true }
    controlShape(iconAt >= 0 && iconAt + 1 < iconBody.size && iconBody[iconAt + 1].opcode in listOf(Opcode.IF_NE, Opcode.IF_EQ) &&
        iconBody[iconAt + 1].namedRegisters().toSet() == setOf(setIcon.parameterRegisterNumber(0), (iconBody[iconAt] as OneRegisterInstruction).registerA),
        "RadialProgress2 no longer compares the icon it shows")
    val iconRead = iconBody[iconAt].controlField()!!
    fun instanceField(owner: String, type: String, what: String): String {
        val holder = tgClassDefByOrNull(owner)
        controlShape(holder != null && AccessFlags.PUBLIC.isSet(holder.accessFlags), "$what's class is inaccessible")
        val held = holder!!.fields.filter { it.type == type && !AccessFlags.STATIC.isSet(it.accessFlags) }.controlSingle(what)
        controlShape(AccessFlags.PUBLIC.isSet(held.accessFlags), "$what is inaccessible")
        return "$owner->${held.name}:${held.type}"
    }
    fun namedField(ref: FieldReference, what: String): String {
        val holder = tgClassDefByOrNull(ref.definingClass)
        controlShape(holder != null && AccessFlags.PUBLIC.isSet(holder.accessFlags), "$what's class is inaccessible")
        val held = holder!!.fields.filter { it.name == ref.name && it.type == ref.type && !AccessFlags.STATIC.isSet(it.accessFlags) }.controlSingle(what)
        controlShape(AccessFlags.PUBLIC.isSet(held.accessFlags), "$what is inaccessible")
        return "${ref.definingClass}->${held.name}:${held.type}"
    }
    val drawable = namedField(drawableRead!!, "RadialProgress2's icon drawable")
    val shownIcon = namedField(iconRead, "RadialProgress2's icon")
    val rect = instanceField(ICONS_RADIAL, ICONS_RECT, "RadialProgress2's rect")
    val parent = instanceField(ICONS_RADIAL, ICONS_VIEW, "RadialProgress2's view")
    controlShape(iconBody.any { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.toString() == parent }, "RadialProgress2 no longer redraws its view")

    val stubs = fileIconCommonStubs() + fileIconFieldStub("cellMessage", cell, "$cell->${messageField.name}:${messageField.type}") +
        fileIconFieldStub("progressParent", ICONS_RADIAL, parent) +
        FileIconStub("progressRect", 2, """
            instance-of v0, p0, $ICONS_RADIAL
            if-eqz v0, :hush_none
            check-cast p0, $ICONS_RADIAL
            iget-object v0, p0, $rect
            return-object v0
            :hush_none
            const/4 v0, 0x0
            return-object v0
        """) +
        FileIconStub("progressIcon", 2, """
            instance-of v0, p0, $ICONS_RADIAL
            if-eqz v0, :hush_none
            check-cast p0, $ICONS_RADIAL
            iget-object v0, p0, $drawable
            if-eqz v0, :hush_none
            iget v0, v0, $shownIcon
            return v0
            :hush_none
            const/4 v0, -0x1
            return v0
        """)
    return ChatFileIcons(null, method, draw, stubs)
}

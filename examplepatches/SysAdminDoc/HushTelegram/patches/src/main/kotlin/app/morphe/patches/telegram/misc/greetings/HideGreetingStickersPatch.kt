/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.greetings

import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origSuperclass
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

internal const val GREETING_STICKERS = "$EXTENSION_PACKAGE/misc/GreetingStickers;"
internal const val GREETINGS_STICKER = "Lorg/telegram/messenger/MediaDataController;->getGreetingsSticker()Lorg/telegram/tgnet/TLRPC\$Document;"
private const val GREETINGS_FIELD = "Lorg/telegram/messenger/MediaDataController;->greetingsSticker:Lorg/telegram/tgnet/TLRPC\$Document;"
private const val PRELOAD_NEXT = "Lorg/telegram/messenger/MediaDataController;->preloadNextGreetingsSticker()V"

/**
 * Whether this body asks for the greeting sticker: through getGreetingsSticker, or the copy of it
 * 13.2 inlines, which reads the field and then preloads the next sticker.
 */
internal fun Method.asksGreetingsSticker(): Boolean {
    val body = controlBody()
    return body.indices.any { i -> body[i].controlRef() == GREETINGS_STICKER || body[i].opcode == Opcode.IGET_OBJECT &&
        body[i].controlRef() == GREETINGS_FIELD && body.getOrNull(i + 1)?.controlRef() == PRELOAD_NEXT }
}
private const val LINEAR_LAYOUT = "Landroid/widget/LinearLayout;"
private const val FRAME_LAYOUT = "Landroid/widget/FrameLayout;"
private const val SUPER_MEASURE = "Landroid/widget/LinearLayout;->onMeasure(II)V"
private const val ADD_VIEW = "Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup\$LayoutParams;)V"
private const val FRAME_INIT = "Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V"
private const val SET_ON_CLICK = "Landroid/view/View;->setOnClickListener(Landroid/view/View\$OnClickListener;)V"
private const val DOCUMENT = "Lorg/telegram/tgnet/TLRPC\$Document;"

@Suppress("unused")
val hideGreetingStickersPatch = bytecodePatch(
    name = "Hide greeting stickers",
    description = "Hides the sticker that an empty private chat offers to send as a greeting. Starts off. Turn it on in" +
        " HushTelegram settings > Conversations.",
    default = true,
) {
    category("Conversations")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveGreetingStickers()
        site.insert(MutableMethod(ImmutableMethod.of(site.method)))
        site.insert(site.method)
        enableStatus("hideGreetingStickers")
    }
}

/**
 * The greeting's onMeasure, just after it starts ignoring layout requests: [stickers] is the frame
 * the greeting sticker sits in and [listener] what a tap on that sticker sends it through.
 */
internal class GreetingStickerSite(val method: MutableMethod, val index: Int, val self: Int,
    val stickers: FieldReference, val listener: FieldReference) {
    fun insert(target: MutableMethod) {
        val (frame, sends) = target.freeLocalsAt("Hide greeting stickers", index, 2)
        target.addInstructions(index, """
            iget-object v$frame, v$self, $stickers
            iget-object v$sends, v$self, $listener
            invoke-static {v$frame, v$sends}, $GREETING_STICKERS->measure(Landroid/view/View;Ljava/lang/Object;)V
        """)
    }
}

/**
 * Telegram's empty-chat greeting (ChatGreetingsView, renamed in every build) is the one
 * LinearLayout that asks MediaDataController for the greeting sticker both when it is made and when
 * it is attached. Its sticker frame is written once, in the constructor, and read once, where the
 * greeting adds it under its text, a business introduction's included; the Premium and
 * paid-message notice adds other views instead. The frame holds only the view setSticker loads and
 * makes tappable, plus its stand-in of the same kind. A tap hands the sticker to the greeting's
 * listener, which a chat sets as soon as it makes the greeting and the business introduction
 * editor's own preview never does.
 */
internal fun BytecodePatchContext.resolveGreetingStickers(): GreetingStickerSite {
    requireStatusMethod("hideGreetingStickers")
    controlHook(GREETING_STICKERS, "measure", listOf("Landroid/view/View;", "Ljava/lang/Object;"), "V")

    val owners = mutableListOf<ClassDef>()
    classDefForEach { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/") || cls.origSuperclass != LINEAR_LAYOUT) return@classDefForEach
        val asks = cls.methods.filter { it.asksGreetingsSticker() }
        if (asks.any { it.origName == "<init>" && it.parameterTypes.getOrNull(2)?.toString() == "Lorg/telegram/tgnet/TLRPC\$Document;" } &&
            asks.any { it.origName == "onAttachedToWindow" && it.parameterTypes.isEmpty() }) owners += cls
    }
    val owner = tgMutableClassDefBy(owners.controlSingle("greeting view").type)

    // The sticker frame: the one FrameLayout field, made in the constructor.
    val frameFields = owner.fields.filter { it.origType == FRAME_LAYOUT && !AccessFlags.STATIC.isSet(it.accessFlags) }
    val frame = frameFields.controlSingle("greeting sticker frame")
    val frameKey = "${owner.type}->${frame.name}:${frame.type}"
    val frameWrites = owner.methods.flatMap { m -> m.controlBody().filter { it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == frameKey }.map { m } }
    controlShape(frameWrites.size == 1 && frameWrites.single().origName == "<init>", "the sticker frame is no longer made only by the constructor")
    val children = frameChildren(frameWrites.single(), frameKey, owner.type)

    // setSticker(Document), which dispatchDraw calls on the first draw, makes one of those views
    // send the sticker when tapped. Hiding the frame hides that view and its stand-in, nothing else.
    val setSticker = owner.methods.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.origReturnType == "V" &&
        it.origParameterTypes == listOf(DOCUMENT) }.controlSingle("greeting setSticker")
    val draw = owner.methods.filter { it.origName == "dispatchDraw" && it.origParameterTypes == listOf("Landroid/graphics/Canvas;") }
        .controlSingle("greeting dispatchDraw")
    val setStickerKey = "${setSticker.origDefiningClass}->${setSticker.origName}($DOCUMENT)V"
    controlShape(draw.controlBody().any { it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef() == setStickerKey },
        "the greeting no longer loads its sticker when it first draws")
    val stickerBody = setSticker.controlBody()
    val tapped = stickerBody.indices.filter { stickerBody[it].controlRef() == SET_ON_CLICK }
        .map { stickerBody.fieldFeeding(it, stickerBody[it].namedRegisters().first(), setSticker.localRegisterCount(), owner.type) }
    val sticker = tapped.singleOrNull()
    controlShape(sticker != null && sticker in children && children.all { it.substringAfter(':') == sticker.substringAfter(':') },
        "the sticker a tap sends no longer sits in the frame with only its own kind")

    // Where the plain greeting adds the frame: right after reading it, with nothing else using it.
    val frameReaders = readers(frameKey)
    val layout = frameReaders.keys.controlSingleList("greeting layout")
    controlShape(layout.origDefiningClass == owner.origType, "the sticker frame is read outside the greeting")
    val layoutBody = layout.controlBody()
    val frameRead = frameReaders.getValue(layout).controlSingle("sticker frame read")
    val add = layoutBody.getOrNull(frameRead + 1)
    controlShape(add?.controlRef() == ADD_VIEW && add.namedRegisters().getOrNull(1) == layoutBody[frameRead].namedRegisters().first() &&
        layoutBody.first().call()?.origName == "removeAllViews", "the greeting no longer lays the sticker frame out under its text")

    // onMeasure: stop layout requests, then measure twice with LinearLayout's own pass.
    val measure = owner.methods.filter { it.origName == "onMeasure" && it.origParameterTypes == listOf("I", "I") && it.origReturnType == "V" }
        .controlSingle("greeting onMeasure")
    val body = measure.controlBody()
    val self = measure.localRegisterCount()
    val quiet = body.getOrNull(1)?.controlField()
    controlShape(body.firstOrNull()?.opcode == Opcode.CONST_4 && (body[0] as NarrowLiteralInstruction).narrowLiteral == 1 &&
        body[1].opcode == Opcode.IPUT_BOOLEAN && quiet != null && quiet.origDefiningClass == owner.origType &&
        body[1].namedRegisters() == listOf(body[0].namedRegisters().first(), self) &&
        body.count { it.controlRef() == SUPER_MEASURE } == 2 && body.last().opcode == Opcode.RETURN_VOID,
        "the greeting no longer quiets layout requests before it measures")
    controlShape(self <= 15 && (0..1).none { at -> body[at].opcode.setsRegister() && body[at].namedRegisters().first() == self },
        "the greeting's receiver changes before the hook or is out of the hook's reach")
    val quietKey = quiet.toString()
    val requestLayout = owner.methods.filter { it.origName == "requestLayout" && it.parameterTypes.isEmpty() }.controlSingle("greeting requestLayout")
    controlShape(requestLayout.controlBody().firstOrNull()?.controlRef() == quietKey, "the greeting no longer ignores layout requests while measuring")

    // The listener: the one field a tap reads and hands the sticker to. Telegram's chat sets it right
    // after making the greeting, for the plain greeting and a business introduction alike, while the
    // introduction editor's preview of your own greeting never does. A preview flag can't tell those
    // apart: a business introduction in a chat raises it too.
    val listeners = owner.fields.filter { field -> !AccessFlags.STATIC.isSet(field.accessFlags) && field.type.startsWith("L") &&
        !field.origType.startsWith("Landroid/") && !field.origType.startsWith("Ljava/") && field.origType != DOCUMENT &&
        readers("${owner.type}->${field.name}:${field.type}").any { (m, reads) -> val b = m.controlBody(); reads.any { b.handsTheSticker(it, field.type) } } }
    val listener = listeners.controlSingle("greeting sticker listener")
    val listenerKey = "${owner.type}->${listener.name}:${listener.type}"
    // Set only by the greeting's one setter that takes it, so a set listener is the chat's.
    val setters = mutableListOf<Method>()
    var setElsewhere = false
    forEachClassMentioning(Mention.reference(listenerKey)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.forEach { m ->
            if (m.controlBody().none { it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == listenerKey }) return@forEach
            if (m.origDefiningClass == owner.origType && !AccessFlags.STATIC.isSet(m.accessFlags) &&
                m.parameterTypes.map { it.toString() } == listOf(listener.type)) setters += m else setElsewhere = true
        }
    }
    controlShape(!setElsewhere && setters.size == 1, "the greeting's sticker listener is set somewhere new")

    // Every greeting subclass that measures itself runs the greeting's own pass, so the hook sees
    // every measure. A subclass that skips that pass names nothing to search for, so every class is
    // checked by its superclass and only the subclasses' code is read.
    var measuresAlone = false
    val ownMeasure = "${owner.type}->onMeasure(II)V"
    classDefForEach { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/") || cls.origSuperclass != owner.origType) return@classDefForEach
        cls.methods.forEach { m ->
            if (m.origName == "onMeasure" && m.origParameterTypes == listOf("I", "I") &&
                m.controlBody().none { it.opcode == Opcode.INVOKE_SUPER && it.controlRef() == ownMeasure }) measuresAlone = true
        }
    }
    controlShape(!measuresAlone, "a greeting subclass measures without the greeting's own pass")
    val flow = ControlFlow.of(measure)
    controlShape(flow.normal.indices.none { it != 1 && 2 in flow.normal[it] } && flow.exceptional.none { 2 in it },
        "a jump lands where the hook goes")

    val frameRef = layoutBody[frameRead].controlField()!!
    return GreetingStickerSite(measure, 2, self, frameRef, ImmutableFieldReference(owner.type, listener.name, listener.type))
}

/**
 * Whether the read at [at] fetches a [type] listener that, within the next few instructions, is
 * handed a sticker through its one (Document) method: the tap's "if (listener != null)
 * listener.onGreetings(sticker)".
 */
private fun List<Instruction>.handsTheSticker(at: Int, type: String): Boolean {
    if (this[at].opcode != Opcode.IGET_OBJECT) return false
    val held = this[at].namedRegisters().first()
    for (next in at + 1 until minOf(size, at + 5)) {
        val call = (this[next] as? ReferenceInstruction)?.reference as? MethodReference
        if (this[next].opcode == Opcode.INVOKE_INTERFACE && call != null && call.definingClass == type &&
            call.controlShape(listOf(DOCUMENT), "V") && this[next].namedRegisters().first() == held) return true
        if (this[next].opcode.setsRegister() && this[next].namedRegisters().first() == held) return false
    }
    return false
}

private fun BytecodePatchContext.readers(key: String): Map<Method, List<Int>> {
    val found = linkedMapOf<Method, List<Int>>()
    forEachClassMentioning(Mention.reference(key)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.forEach { m ->
            val body = m.controlBody()
            val reads = body.indices.filter { body[it].opcode in FIELD_READS && body[it].controlRef() == key }
            if (reads.isNotEmpty()) found[m] = reads
        }
    }
    return found
}

/**
 * The fields of [owner] whose views the constructor adds to the sticker frame. The frame has to be a
 * new FrameLayout that the constructor stores and only fills; anything else it does refuses.
 */
private fun frameChildren(init: Method, frameKey: String, owner: String): List<String> {
    val body = init.controlBody()
    val self = init.localRegisterCount()
    val store = body.indexOfFirst { it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == frameKey }
    val frame = body[store].namedRegisters().first()
    val made = (store - 1 downTo 0).firstOrNull { body[it].opcode.setsRegister() && body[it].namedRegisters().first() == frame }
    controlShape(made != null && body[made].opcode == Opcode.NEW_INSTANCE && body[made].controlRef() == FRAME_LAYOUT,
        "the sticker frame is no longer a new FrameLayout")
    val children = mutableListOf<String?>()
    for (at in made!! + 1 until body.size) {
        val regs = body[at].namedRegisters()
        if (body[at].opcode.setsRegister() && regs.first() == frame) break
        if (frame !in regs || at == store) continue
        when {
            body[at].opcode == Opcode.INVOKE_DIRECT && body[at].controlRef() == FRAME_INIT && regs.first() == frame -> {}
            body[at].controlRef() == ADD_VIEW && regs.first() == frame && regs.count { it == frame } == 1 ->
                children += body.fieldFeeding(at, regs[1], self, owner)
            else -> controlShape(false, "the constructor does more with the sticker frame than fill it")
        }
    }
    controlShape(children.isNotEmpty() && children.none { it == null }, "the sticker frame holds a view that isn't the greeting's own")
    return children.filterNotNull()
}

/** The [owner] field that [register] was last read from before [at], or null when it came from anywhere else. */
private fun List<Instruction>.fieldFeeding(at: Int, register: Int, self: Int, owner: String): String? {
    val source = (at - 1 downTo 0).firstOrNull { this[it].opcode.setsRegister() && this[it].namedRegisters().firstOrNull() == register }
        ?: return null
    val read = this[source]
    return read.controlRef().takeIf { read.opcode == Opcode.IGET_OBJECT && read.namedRegisters()[1] == self && read.controlField()?.origDefiningClass == owner }
}

private fun Collection<Method>.controlSingleList(why: String) = toList().controlSingle(why)

private val FIELD_READS = setOf(Opcode.IGET, Opcode.IGET_WIDE, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN,
    Opcode.IGET_BYTE, Opcode.IGET_CHAR, Opcode.IGET_SHORT)

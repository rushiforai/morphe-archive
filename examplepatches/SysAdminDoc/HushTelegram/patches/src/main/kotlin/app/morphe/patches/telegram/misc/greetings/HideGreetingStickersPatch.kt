/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.greetings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
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
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlCall
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val GREETING_STICKERS = "$EXTENSION_PACKAGE/misc/GreetingStickers;"
internal const val GREETINGS_STICKER = "Lorg/telegram/messenger/MediaDataController;->getGreetingsSticker()Lorg/telegram/tgnet/TLRPC\$Document;"
private const val LINEAR_LAYOUT = "Landroid/widget/LinearLayout;"
private const val FRAME_LAYOUT = "Landroid/widget/FrameLayout;"
private const val SUPER_MEASURE = "Landroid/widget/LinearLayout;->onMeasure(II)V"
private const val ADD_VIEW = "Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup\$LayoutParams;)V"
private const val FRAME_INIT = "Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V"
private const val SET_ON_CLICK = "Landroid/view/View;->setOnClickListener(Landroid/view/View\$OnClickListener;)V"
private const val DOCUMENT = "Lorg/telegram/tgnet/TLRPC\$Document;"
private val TWO_TEXTS = listOf("Ljava/lang/CharSequence;", "Ljava/lang/CharSequence;")

@Suppress("unused")
val hideGreetingStickersPatch = bytecodePatch(
    name = "Hide greeting stickers",
    description = "Adds a switch, off by default, that hides the sticker an empty private chat offers to send as a greeting. The empty chat's text, business introductions, Premium and paid-message notices, the sticker picker and sending keep their usual behavior.",
    default = true,
) {
    category("Chats")
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
 * the greeting sticker sits in and [introduction] the flag a business introduction or preview sets.
 */
internal class GreetingStickerSite(val method: MutableMethod, val index: Int, val self: Int,
    val stickers: FieldReference, val introduction: FieldReference) {
    fun insert(target: MutableMethod) {
        val (frame, flag) = target.freeLocalsAt("Hide greeting stickers", index, 2)
        target.addInstructions(index, """
            iget-object v$frame, v$self, $stickers
            iget-boolean v$flag, v$self, $introduction
            invoke-static {v$frame, v$flag}, $GREETING_STICKERS->measure(Landroid/view/View;Z)V
        """)
    }
}

/**
 * Telegram's empty-chat greeting (ChatGreetingsView, renamed in every build) is the one
 * LinearLayout that asks MediaDataController for the greeting sticker both when it is made and when
 * it is attached. Its sticker frame is written once, in the constructor, and read once, where the
 * plain greeting adds it under its text; the Premium and paid-message notice adds other views
 * instead. The frame holds only the view setSticker loads and makes tappable, plus its stand-in of
 * the same kind. Its introduction flag is raised only by the method that shows a business
 * introduction or a preview, and read only by onMeasure, which every greeting subclass runs.
 */
internal fun BytecodePatchContext.resolveGreetingStickers(): GreetingStickerSite {
    requireStatusMethod("hideGreetingStickers")
    controlHook(GREETING_STICKERS, "measure", listOf("Landroid/view/View;", "Z"), "V")

    val owners = mutableListOf<ClassDef>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/") || cls.superclass != LINEAR_LAYOUT) return@classDefForEach
        val asks = cls.methods.filter { m -> m.controlBody().any { it.controlRef() == GREETINGS_STICKER } }
        if (asks.any { it.name == "<init>" && it.parameterTypes.getOrNull(2)?.toString() == "Lorg/telegram/tgnet/TLRPC\$Document;" } &&
            asks.any { it.name == "onAttachedToWindow" && it.parameterTypes.isEmpty() }) owners += cls
    }
    val owner = mutableClassDefBy(owners.controlSingle("greeting view").type)

    // The sticker frame: the one FrameLayout field, made in the constructor.
    val frameFields = owner.fields.filter { it.type == FRAME_LAYOUT && !AccessFlags.STATIC.isSet(it.accessFlags) }
    val frame = frameFields.controlSingle("greeting sticker frame")
    val frameKey = "${owner.type}->${frame.name}:${frame.type}"
    val frameWrites = owner.methods.flatMap { m -> m.controlBody().filter { it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == frameKey }.map { m } }
    controlShape(frameWrites.size == 1 && frameWrites.single().name == "<init>", "the sticker frame is no longer made only by the constructor")
    val children = frameChildren(frameWrites.single(), frameKey, owner.type)

    // setSticker(Document), which dispatchDraw calls on the first draw, makes one of those views
    // send the sticker when tapped. Hiding the frame hides that view and its stand-in, nothing else.
    val setSticker = owner.methods.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
        it.parameterTypes.map(CharSequence::toString) == listOf(DOCUMENT) }.controlSingle("greeting setSticker")
    val draw = owner.methods.filter { it.name == "dispatchDraw" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/graphics/Canvas;") }
        .controlSingle("greeting dispatchDraw")
    val setStickerKey = "${owner.type}->${setSticker.name}($DOCUMENT)V"
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
    controlShape(layout.definingClass == owner.type, "the sticker frame is read outside the greeting")
    val layoutBody = layout.controlBody()
    val frameRead = frameReaders.getValue(layout).controlSingle("sticker frame read")
    val add = layoutBody.getOrNull(frameRead + 1)
    controlShape(add?.controlRef() == ADD_VIEW && add.namedRegisters().getOrNull(1) == layoutBody[frameRead].namedRegisters().first() &&
        layoutBody.first().controlCall()?.name == "removeAllViews", "the greeting no longer lays the sticker frame out under its text")

    // onMeasure: stop layout requests, then measure twice with LinearLayout's own pass.
    val measure = owner.methods.filter { it.name == "onMeasure" && it.parameterTypes.map(CharSequence::toString) == listOf("I", "I") && it.returnType == "V" }
        .controlSingle("greeting onMeasure")
    val body = measure.controlBody()
    val self = measure.localRegisterCount()
    val quiet = body.getOrNull(1)?.controlField()
    controlShape(body.firstOrNull()?.opcode == Opcode.CONST_4 && (body[0] as NarrowLiteralInstruction).narrowLiteral == 1 &&
        body[1].opcode == Opcode.IPUT_BOOLEAN && quiet != null && quiet.definingClass == owner.type &&
        body[1].namedRegisters() == listOf(body[0].namedRegisters().first(), self) &&
        body.count { it.controlRef() == SUPER_MEASURE } == 2 && body.last().opcode == Opcode.RETURN_VOID,
        "the greeting no longer quiets layout requests before it measures")
    controlShape(self <= 15 && (0..1).none { at -> body[at].opcode.setsRegister() && body[at].namedRegisters().first() == self },
        "the greeting's receiver changes before the hook or is out of the hook's reach")
    val quietKey = quiet.toString()
    val requestLayout = owner.methods.filter { it.name == "requestLayout" && it.parameterTypes.isEmpty() }.controlSingle("greeting requestLayout")
    controlShape(requestLayout.controlBody().firstOrNull()?.controlRef() == quietKey, "the greeting no longer ignores layout requests while measuring")

    // The introduction flag: set true by one (CharSequence, CharSequence) method, read only here.
    val introductions = owner.fields.filter { field -> field.type == "Z" && !AccessFlags.STATIC.isSet(field.accessFlags) &&
        "${owner.type}->${field.name}:Z".let { key -> owner.methods.any { m -> m.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/lang/CharSequence;", "Ljava/lang/CharSequence;") && m.controlBody().any { it.opcode == Opcode.IPUT_BOOLEAN && it.controlRef() == key } } &&
            body.any { it.opcode == Opcode.IGET_BOOLEAN && it.controlRef() == key } } }
    val introduction = introductions.controlSingle("greeting introduction flag")
    val introductionKey = "${owner.type}->${introduction.name}:Z"
    controlShape(readers(introductionKey).keys.all { it.definingClass == owner.type && it.name == "onMeasure" },
        "the introduction flag is read outside the greeting's onMeasure")

    // Every write raises the flag to true in that one setter, and every greeting subclass that
    // measures itself runs the greeting's own pass, so the hook sees every measure.
    val raisers = mutableSetOf<String>()
    var loweredOrElsewhere = false
    var measuresAlone = false
    val ownMeasure = "${owner.type}->onMeasure(II)V"
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.forEach { m ->
            val b = m.controlBody()
            b.indices.filter { b[it].opcode == Opcode.IPUT_BOOLEAN && b[it].controlRef() == introductionKey }.forEach { i ->
                val one = b.getOrNull(i - 1)
                val raised = one?.opcode == Opcode.CONST_4 && (one as NarrowLiteralInstruction).narrowLiteral == 1 &&
                    one.namedRegisters().first() == b[i].namedRegisters().first()
                if (raised && m.definingClass == owner.type && m.parameterTypes.map(CharSequence::toString) == TWO_TEXTS) {
                    raisers += "${m.name}(${m.parameterTypes.joinToString("")})"
                } else loweredOrElsewhere = true
            }
            if (cls.superclass == owner.type && m.name == "onMeasure" && m.parameterTypes.map(CharSequence::toString) == listOf("I", "I") &&
                b.none { it.opcode == Opcode.INVOKE_SUPER && it.controlRef() == ownMeasure }) measuresAlone = true
        }
    }
    controlShape(!loweredOrElsewhere && raisers.size == 1, "the introduction flag is set somewhere new or to another value")
    controlShape(!measuresAlone, "a greeting subclass measures without the greeting's own pass")
    val flow = ControlFlow.of(measure)
    controlShape(flow.normal.indices.none { it != 1 && 2 in flow.normal[it] } && flow.exceptional.none { 2 in it },
        "a jump lands where the hook goes")

    val frameRef = layoutBody[frameRead].controlField()!!
    val flagRef = body.first { it.opcode == Opcode.IGET_BOOLEAN && it.controlRef() == introductionKey }.controlField()!!
    return GreetingStickerSite(measure, 2, self, frameRef, flagRef)
}

private fun BytecodePatchContext.readers(key: String): Map<Method, List<Int>> {
    val found = linkedMapOf<Method, List<Int>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
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
    return read.controlRef().takeIf { read.opcode == Opcode.IGET_OBJECT && read.namedRegisters()[1] == self && read.controlField()?.definingClass == owner }
}

private fun Collection<Method>.controlSingleList(why: String) = toList().controlSingle(why)

private val FIELD_READS = setOf(Opcode.IGET, Opcode.IGET_WIDE, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN,
    Opcode.IGET_BYTE, Opcode.IGET_CHAR, Opcode.IGET_SHORT)

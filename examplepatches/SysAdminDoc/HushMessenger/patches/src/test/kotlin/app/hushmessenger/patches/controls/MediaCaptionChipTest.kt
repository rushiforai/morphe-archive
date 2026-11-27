package app.hushmessenger.patches.controls

import app.hushmessenger.patches.CompatMirror
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

private const val CHIP_CAPABILITIES = "Lcom/facebook/xapp/messaging/capability/vector/Capabilities;"
private const val CHIP_EDIT_EVENT = "Lcom/facebook/xapp/messaging/composer/attachmentpreview/events/EditAttachmentEvent;"
private const val CHIP_REMOVE_EVENT = "Lcom/facebook/xapp/messaging/composer/attachmentpreview/events/RemoveAttachmentEvent;"
private const val CHIP_MEDIA = "Lcom/facebook/ui/media/attachments/model/MediaResource;"

/** The attachment preview plugin mediaCaptionChipFixture builds, the holder of the composer's text it keeps, and the composer's bus. */
private const val CHIP_PLUGIN = "LX/Q7p;"
private const val CHIP_TEXT = "LX/Q7t;"
private const val CHIP_BUS = "LX/Q7b;"
private const val CHIP_STATE = "LX/Q7s;"

/** The camera plugin's batch send of the editor's result. */
private const val CHIP_BATCH = "LX/Q7x;"
internal const val SYNTHETIC_MEDIA_CAPTION_CHIP = "$CHIP_PLUGIN->Diu($CHIP_CAPABILITIES$CHIP_STATE$CHIP_BUS$COMPOSER_EVENT)V"
internal const val SYNTHETIC_MEDIA_CAPTION_CHIP_SEND = "$CHIP_BATCH->invoke()Ljava/lang/Object;"
private const val CHIP_TEXT_FIELD = "$CHIP_PLUGIN->A0G:$CHIP_TEXT"
private const val CHIP_BUS_FIELD = "$CHIP_BATCH->A00:$CHIP_BUS"
private const val CHIP_MEDIA_FIELD = "$CHIP_BATCH->A01:Ljava/util/List;"
private const val CHIP_OPEN = "LX/Q7o;->A08($CHIP_EDIT_EVENT$CHIP_BUS)V"
private const val CHIP_MEDIA_SEND = "LX/Q7m;->A00(${CHIP_BUS}Ljava/util/List;Ljava/util/List;Ljava/util/Map;)V"
private const val CHIP_POST = "LX/Q7q;->A03($CHIP_BUS$COMPOSER_EVENT)V"
private const val CHIP_HELPER_CALL = "$CHIP_PLUGIN->$MEDIA_CAPTION_CHIP_HELPER($CHIP_PLUGIN$CHIP_CAPABILITIES$CHIP_STATE$CHIP_BUS$COMPOSER_EVENT)V"
private const val CHIP_SEND_HELPER_CALL = "$CHIP_BATCH->$MEDIA_CAPTION_CHIP_SEND_HELPER($CHIP_BATCH)V"

private const val EDIT_CHECK = "instance-of v1, v0, $CHIP_EDIT_EVENT"
private const val OPEN_CALL = "invoke-static {v0, p3}, $CHIP_OPEN"

/**
 * The plugin's event handler as 588 writes it (`LX/B6i;->Diu`), cut down to the chip: an EditAttachmentEvent goes with
 * the composer's bus to the opening of the editor (8 registers, p0 is v3 and the event p4 is v7).
 */
private val CHIP_BODY = """
    move-object v0, p4
    $EDIT_CHECK
    if-eqz v1, :other
    check-cast v0, $CHIP_EDIT_EVENT
    $OPEN_CALL
    return-void
    :other
    return-void
""".trimIndent()

private const val BUS_READ = "iget-object v0, p0, $CHIP_BUS_FIELD"
private const val MEDIA_READ = "iget-object v1, p0, $CHIP_MEDIA_FIELD"
private const val MEDIA_SEND_CALL = "invoke-static {v0, v1, v2, v3}, $CHIP_MEDIA_SEND"
private const val REMOVE_NEW = "new-instance v3, $CHIP_REMOVE_EVENT"
private const val POST_CALL = "invoke-static {v0, v3}, $CHIP_POST"

/**
 * The batch send as 588 writes it (`LX/732;->invoke`): the captured bus and media, the media send, then a
 * RemoveAttachmentEvent posted for each photo (8 registers, p0 is v7).
 */
private val BATCH_BODY = """
    $BUS_READ
    $MEDIA_READ
    const/4 v2, 0x0
    const/4 v3, 0x0
    $MEDIA_SEND_CALL
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v1
    :loop
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :done
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, $CHIP_MEDIA
    $REMOVE_NEW
    invoke-direct {v3, v2}, $CHIP_REMOVE_EVENT-><init>($CHIP_MEDIA)V
    $POST_CALL
    goto :loop
    :done
    sget-object v0, Lkotlin/Unit;->A00:Lkotlin/Unit;
    return-object v0
""".trimIndent()

private fun chipHandler(body: String = CHIP_BODY, id: String = SYNTHETIC_MEDIA_CAPTION_CHIP, flags: Int = AccessFlags.PUBLIC.value) =
    fixtureMethod(id, body, 8, flags)

private fun batchSend(body: String = BATCH_BODY, id: String = SYNTHETIC_MEDIA_CAPTION_CHIP_SEND, flags: Int = AccessFlags.PUBLIC.value) =
    fixtureMethod(id, body, 8, flags)

/** [body] with each first `from` swapped for the `to` after it, every swap checked to change something. */
private fun swapped(body: String, vararg swaps: String) = swaps.toList().chunked(2).fold(body) { text, (from, to) ->
    text.replaceFirst(from, to).also { check(it != text) { "no $from" } }
}

private fun field(owner: String, name: String, type: String) = ImmutableField(owner, name, type, AccessFlags.PUBLIC.value, null, null, null)

private fun textHolder(type: String = CHIP_TEXT, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value,
    returns: String = "Ljava/lang/CharSequence;"): MutableClass =
    fixtureClass(type, listOf(ImmutableMethod(type, "getText", emptyList(), returns,
        AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value, null, null, null)), flags = flags)

private fun sendTextEvent(init: String = SEND_TEXT_EVENT_INIT): MutableClass = fixtureClass(SEND_TEXT_EVENT, listOf(
    fixtureMethod(init, "return-void", 9, AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value)))

/**
 * The msys composer's two plugins the editor the attachment chip opens goes through (#236): the preview plugin, which keeps
 * the composer's text and opens the editor, the text's holder, the camera plugin's batch send of the result and the
 * composer's SendTextEvent.
 */
internal fun mediaCaptionChipFixture(
    handler: Method? = chipHandler(),
    batch: Method? = batchSend(),
    pluginFields: List<ImmutableField> = listOf(field(CHIP_PLUGIN, "A0G", CHIP_TEXT)),
    holder: MutableClass? = textHolder(),
    event: MutableClass? = sendTextEvent(),
    batchFields: List<ImmutableField> = listOf(field(CHIP_BATCH, "A00", CHIP_BUS), field(CHIP_BATCH, "A01", "Ljava/util/List;")),
): List<MutableClass> = listOfNotNull(
    fixtureClass(CHIP_PLUGIN, listOfNotNull(handler), extraFields = pluginFields),
    holder,
    fixtureClass(CHIP_BATCH, listOfNotNull(batch), extraFields = batchFields),
    event,
)

private fun Method.code() = implementation!!.instructions.toList()

private fun List<Instruction>.withoutPadding() = filter { it.opcode != Opcode.NOP }

private fun Instruction.called() = ((this as? ReferenceInstruction)?.reference as? MethodReference)
    ?.let { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }

private fun Instruction.field() = ((this as? ReferenceInstruction)?.reference as? FieldReference)?.let { "${it.definingClass}->${it.name}:${it.type}" }

private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> error("not a call: $opcode")
}

private val TABLES = setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH, Opcode.FILL_ARRAY_DATA)

/** Each branch's landing, as the instruction it lands on, so a check survives the hook moving indexes. */
private fun Method.landings(): List<Instruction> = code().let { code ->
    code.filterIsInstance<BuilderOffsetInstruction>().filter { it.opcode !in TABLES }.map { code[it.target.location.index] }
}

private fun List<Instruction>.landing(at: Int) = this[(this[at] as BuilderOffsetInstruction).target.location.index]

class MediaCaptionChipTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>, key: String) = mirroredControls(classes).getValue(key).map { it.hookId() }.toSet()

    private fun handlerOf(classes: List<MutableClass>) = classes.single { it.type == CHIP_PLUGIN }.methods.single() as MutableMethod

    private fun batchOf(classes: List<MutableClass>) = classes.single { it.type == CHIP_BATCH }.methods.single() as MutableMethod

    @Test fun theChipsHandlerAndTheBatchSendAreFoundByBothFinders() {
        val classes = mediaCaptionChipFixture()
        assertEquals(setOf(SYNTHETIC_MEDIA_CAPTION_CHIP), found(classes, MEDIA_CAPTION_CHIP))
        assertEquals(setOf(SYNTHETIC_MEDIA_CAPTION_CHIP_SEND), found(classes, MEDIA_CAPTION_CHIP_SEND))
        val compat = CompatMirror.controls(classes)
        assertEquals(listOf(SYNTHETIC_MEDIA_CAPTION_CHIP), compat.getValue(MEDIA_CAPTION_CHIP))
        assertEquals(listOf(SYNTHETIC_MEDIA_CAPTION_CHIP_SEND), compat.getValue(MEDIA_CAPTION_CHIP_SEND))
        validateControls(mirroredControls(classes), setOf(MEDIA_CAPTION_CHIP, MEDIA_CAPTION_CHIP_SEND))
        // The handler answers the bus, the plugin the field holding the composer's text, and the batch send its own
        // fields and the bus post it uses.
        assertEquals(CHIP_BUS, handlerOf(classes).mediaCaptionChipSite())
        assertEquals(CHIP_TEXT_FIELD, classes.first().chipTextField { type -> classes.firstOrNull { it.type == type } })
        val site = assertNotNull(batchOf(classes).mediaCaptionChipSendSite())
        assertEquals(listOf(CHIP_BUS_FIELD, CHIP_MEDIA_FIELD, CHIP_BUS, CHIP_POST), listOf(site.bus, site.media, site.busType, site.post))
        // 588 reads its bus and media in either order, and a range open of the editor is the same open.
        val reordered = batchSend(swapped(BATCH_BODY, "$BUS_READ\n$MEDIA_READ", "$MEDIA_READ\n$BUS_READ"))
        assertEquals(setOf(SYNTHETIC_MEDIA_CAPTION_CHIP_SEND), found(mediaCaptionChipFixture(batch = reordered), MEDIA_CAPTION_CHIP_SEND))
        val ranged = chipHandler(swapped(CHIP_BODY, OPEN_CALL, "move-object v1, p3\ninvoke-static/range {v0 .. v1}, $CHIP_OPEN"))
        assertEquals(setOf(SYNTHETIC_MEDIA_CAPTION_CHIP), found(mediaCaptionChipFixture(handler = ranged), MEDIA_CAPTION_CHIP))
    }

    // #236: the editor the chip opens hands its photo back as an activity result, and the camera plugin's batch send put
    // it out without reading the box, so the words stayed behind.
    @Test fun bothHooksGoInAtTheEntryAndLeaveTheStockCodeAlone() {
        val classes = mediaCaptionChipFixture()
        val handler = handlerOf(classes)
        val batch = batchOf(classes)
        val handlerBefore = handler.code()
        val batchBefore = batch.code()
        val handlerLandings = handler.landings()
        val batchLandings = batch.landings()
        injectControl(MEDIA_CAPTION, mapOf(MEDIA_CAPTION_CHIP to listOf(handler), MEDIA_CAPTION_CHIP_SEND to listOf(batch)))
        val handlerCode = handler.code()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, handlerCode[0].opcode)
        assertEquals(CHIP_HELPER_CALL, handlerCode[0].called())
        // p0 to p4: the plugin, the capabilities, the state, the bus and the event, before anything writes them.
        assertEquals((3..7).toList(), handlerCode[0].registers())
        assertStockKept(handlerBefore, handlerCode.drop(1), "handler")
        assertEquals(handlerLandings, handler.landings())
        assertTrue(0 !in handler.jumpTargets())
        val batchCode = batch.code()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, batchCode[0].opcode)
        assertEquals(CHIP_SEND_HELPER_CALL, batchCode[0].called())
        assertEquals(listOf(7), batchCode[0].registers())
        // Ahead of the media send, so the words go first.
        assertTrue(batchCode.indexOfFirst { it.called() == CHIP_MEDIA_SEND } > 0)
        assertStockKept(batchBefore, batchCode.drop(1), "batch send")
        assertEquals(batchLandings, batch.landings())
        assertTrue(batchCode.landing(batchCode.indexOfFirst { it.opcode == Opcode.GOTO }) === batchBefore.first { it.called()?.endsWith("hasNext()Z") == true })
        assertTrue(0 !in batch.jumpTargets())
        assertTrue(handler.chipOpeningHooked() && batch.chipSendingHooked())
    }

    @Test fun theChipsHelperHandsOverTheBusAndTheTextOnlyWhenTheChipOpensTheEditor() {
        val shape = listOf(CHIP_CAPABILITIES, CHIP_STATE, CHIP_BUS, COMPOSER_EVENT)
        val helper = mediaCaptionChipHelper(CHIP_PLUGIN, shape, CHIP_TEXT_FIELD)
        assertEquals(CHIP_HELPER_CALL, helper.hookId())
        assertTrue(AccessFlags.STATIC.isSet(helper.accessFlags))
        // Six registers: v0 for the check and the text, p0 the plugin (v1), p3 the bus (v4) and p4 the event (v5).
        assertEquals(6, helper.implementation!!.registerCount)
        val code = helper.code()
        assertEquals(listOf(Opcode.INSTANCE_OF, Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.RETURN_VOID), code.map { it.opcode })
        assertEquals(CHIP_EDIT_EVENT, (code[0] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(0, 5), (code[0] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertTrue(code.landing(1) === code[4])
        assertEquals(CHIP_TEXT_FIELD, code[2].field())
        assertEquals(listOf(0, 1), (code[2] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals(CHIP_OPENING_CALL, code[3].called())
        assertEquals(listOf(4, 0), code[3].registers())
    }

    @Test fun theBatchSendsHelperPostsWhatTheSendButtonPostsAheadOfThePhoto() {
        val site = assertNotNull(batchSend().mediaCaptionChipSendSite())
        val helper = mediaCaptionChipSendHelper(CHIP_BATCH, site)
        assertEquals(CHIP_SEND_HELPER_CALL, helper.hookId())
        assertTrue(AccessFlags.STATIC.isSet(helper.accessFlags))
        assertEquals(10, helper.implementation!!.registerCount)
        val code = helper.code()
        assertEquals(listOf(Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.INVOKE_STATIC,
            Opcode.MOVE_RESULT_WIDE, Opcode.CONST_16, Opcode.CONST_4, Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT, Opcode.NEW_INSTANCE,
            Opcode.INVOKE_DIRECT_RANGE, Opcode.INVOKE_STATIC, Opcode.RETURN_VOID), code.map { it.opcode })
        // The bus into v0 and the media into v1 from the batch send (p0, v9), and the extension's answer.
        assertEquals(listOf(CHIP_BUS_FIELD, CHIP_MEDIA_FIELD), listOf(code[0].field(), code[1].field()))
        assertEquals(listOf(0, 9, 1, 9), listOf(code[0], code[1]).flatMap { (it as TwoRegisterInstruction).let { i -> listOf(i.registerA, i.registerB) } })
        assertEquals(CHIP_SENDING_CALL, code[2].called())
        assertEquals(listOf(0, 1), code[2].registers())
        assertEquals(1, (code[3] as OneRegisterInstruction).registerA)
        assertEquals(1, (code[4] as OneRegisterInstruction).registerA)
        assertTrue(code.landing(4) === code.last())
        // The send button's event: no text of its own, its defaults and the time, through the batch send's own post.
        assertEquals("Ljava/lang/System;->nanoTime()J", code[5].called())
        assertEquals(7, (code[6] as OneRegisterInstruction).registerA)
        assertEquals(listOf(6, SEND_BUTTON_DEFAULTS), (code[7] as OneRegisterInstruction).registerA.let { listOf(it, (code[7] as NarrowLiteralInstruction).narrowLiteral) })
        assertEquals(listOf(2, 0), listOf((code[8] as OneRegisterInstruction).registerA, (code[8] as NarrowLiteralInstruction).narrowLiteral))
        assertEquals(listOf(3, 2, 4, 2, 5, 2), code.subList(9, 12).flatMap { (it as TwoRegisterInstruction).let { i -> listOf(i.registerA, i.registerB) } })
        assertEquals(SEND_TEXT_EVENT, (code[12] as ReferenceInstruction).reference.toString())
        assertEquals(1, (code[12] as OneRegisterInstruction).registerA)
        assertEquals(SEND_TEXT_EVENT_INIT, code[13].called())
        assertEquals((1..8).toList(), code[13].registers())
        assertEquals(CHIP_POST, code[14].called())
        assertEquals(listOf(0, 1), code[14].registers())
    }

    @Test fun aSecondPassLeavesBothHooksAlone() {
        val handler = chipHandler()
        val batch = batchSend()
        handler.injectMediaCaptionChip()
        batch.injectMediaCaptionChipSend()
        val handlerHooked = handler.code()
        val batchHooked = batch.code()
        handler.validateHook(MEDIA_CAPTION_CHIP)
        batch.validateHook(MEDIA_CAPTION_CHIP_SEND)
        handler.injectMediaCaptionChip()
        batch.injectMediaCaptionChipSend()
        assertEquals(handlerHooked, handler.code())
        assertEquals(batchHooked, batch.code())
        assertEquals(1, handler.code().count { it.called() == CHIP_HELPER_CALL })
        assertEquals(1, batch.code().count { it.called() == CHIP_SEND_HELPER_CALL })
    }

    @Test fun anyOtherShapeGetsNoHook() {
        val static = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
        val handlers = mapOf(
            "no check for the edit event" to mediaCaptionChipFixture(chipHandler(swapped(CHIP_BODY, EDIT_CHECK, "instance-of v1, v0, $CHIP_REMOVE_EVENT"))),
            "no opening of the editor" to mediaCaptionChipFixture(chipHandler(swapped(CHIP_BODY, OPEN_CALL, "nop"))),
            "two openings" to mediaCaptionChipFixture(chipHandler(swapped(CHIP_BODY, OPEN_CALL, "$OPEN_CALL\ninvoke-static {v0, p3}, LX/Q7o;->A09($CHIP_EDIT_EVENT$CHIP_BUS)V"))),
            "an opening without the bus" to mediaCaptionChipFixture(chipHandler(swapped(CHIP_BODY, OPEN_CALL, "invoke-static {v0, p2}, LX/Q7o;->A08($CHIP_EDIT_EVENT$CHIP_STATE)V"))),
            "a virtual opening" to mediaCaptionChipFixture(chipHandler(swapped(CHIP_BODY, OPEN_CALL, "invoke-virtual {p0, v0, p3}, $CHIP_PLUGIN->A08($CHIP_EDIT_EVENT$CHIP_BUS)V"))),
            "a jump onto the entry" to mediaCaptionChipFixture(chipHandler(swapped(CHIP_BODY, "move-object v0, p4", ":again\nmove-object v0, p4",
                "return-void\n:other", "return-void\n:other\nif-nez v1, :again"))),
            "a static handler" to mediaCaptionChipFixture(chipHandler(id = "$CHIP_PLUGIN->Diu($CHIP_CAPABILITIES$CHIP_STATE$CHIP_BUS$COMPOSER_EVENT$CHIP_BUS)V", flags = static)),
            "another first argument" to mediaCaptionChipFixture(chipHandler(id = SYNTHETIC_MEDIA_CAPTION_CHIP.replace(CHIP_CAPABILITIES, "Ljava/lang/Object;"))),
            "another last argument" to mediaCaptionChipFixture(chipHandler(id = SYNTHETIC_MEDIA_CAPTION_CHIP.replace(COMPOSER_EVENT, "Ljava/lang/Object;"))),
            "a handler that answers something" to mediaCaptionChipFixture(chipHandler(CHIP_BODY.replace("return-void", "const/4 v0, 0x0\nreturn v0"),
                SYNTHETIC_MEDIA_CAPTION_CHIP.replace(")V", ")Z"))),
            "a plugin holding no text" to mediaCaptionChipFixture(pluginFields = emptyList()),
            "a plugin holding two texts" to mediaCaptionChipFixture(pluginFields = listOf(field(CHIP_PLUGIN, "A0G", CHIP_TEXT), field(CHIP_PLUGIN, "A0H", CHIP_TEXT))),
            "a text holder that is a class" to mediaCaptionChipFixture(holder = textHolder(flags = AccessFlags.PUBLIC.value)),
            "a holder whose getText answers a String" to mediaCaptionChipFixture(holder = textHolder(returns = "Ljava/lang/String;")),
            "a holder outside the app" to mediaCaptionChipFixture(holder = null),
        )
        for ((case, classes) in handlers) {
            // The batch send goes with the chip: no handler means no bus to find it on.
            assertTrue(found(classes, MEDIA_CAPTION_CHIP).isEmpty(), case)
            assertTrue(found(classes, MEDIA_CAPTION_CHIP_SEND).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(MEDIA_CAPTION_CHIP)) }
        }
        val batches = mapOf(
            "no remove event" to mediaCaptionChipFixture(batch = batchSend(swapped(BATCH_BODY, REMOVE_NEW, "new-instance v3, $CHIP_EDIT_EVENT"))),
            "no post" to mediaCaptionChipFixture(batch = batchSend(swapped(BATCH_BODY, POST_CALL, "nop"))),
            "two posts" to mediaCaptionChipFixture(batch = batchSend(swapped(BATCH_BODY, POST_CALL, "$POST_CALL\ninvoke-static {v0, v3}, LX/Q7q;->A04($CHIP_BUS$COMPOSER_EVENT)V"))),
            "no media send" to mediaCaptionChipFixture(batch = batchSend(swapped(BATCH_BODY, MEDIA_SEND_CALL, "nop"))),
            "two media sends" to mediaCaptionChipFixture(batch = batchSend(swapped(BATCH_BODY, MEDIA_SEND_CALL,
                "$MEDIA_SEND_CALL\ninvoke-static {v0, v1, v2, v3}, LX/Q7m;->A01(${CHIP_BUS}Ljava/util/List;Ljava/util/List;Ljava/util/Map;)V"))),
            "a media send taking one list" to mediaCaptionChipFixture(batch = batchSend(swapped(BATCH_BODY, MEDIA_SEND_CALL,
                "invoke-static {v0, v1, v3}, LX/Q7m;->A00(${CHIP_BUS}Ljava/util/List;Ljava/util/Map;)V"))),
            "no bus of its own" to mediaCaptionChipFixture(batch = batchSend(swapped(BATCH_BODY, BUS_READ, "sget-object v0, LX/Q7y;->A00:$CHIP_BUS"))),
            "two buses of its own" to mediaCaptionChipFixture(batch = batchSend(swapped(BATCH_BODY, BUS_READ, "$BUS_READ\niget-object v0, p0, $CHIP_BATCH->A02:$CHIP_BUS"))),
            "no media of its own" to mediaCaptionChipFixture(batch = batchSend(swapped(BATCH_BODY, MEDIA_READ, "sget-object v1, LX/Q7y;->A01:Ljava/util/List;"))),
            "two lists of its own" to mediaCaptionChipFixture(batch = batchSend(swapped(BATCH_BODY, MEDIA_READ, "$MEDIA_READ\niget-object v2, p0, $CHIP_BATCH->A03:Ljava/util/List;"))),
            "a jump onto the entry" to mediaCaptionChipFixture(batch = batchSend(swapped(BATCH_BODY, BUS_READ, ":again\n$BUS_READ", "goto :loop", "goto :again"))),
            "another name" to mediaCaptionChipFixture(batch = batchSend(id = "$CHIP_BATCH->run()Ljava/lang/Object;")),
            "an invoke taking an argument" to mediaCaptionChipFixture(batch = batchSend(id = "$CHIP_BATCH->invoke(Ljava/lang/Object;)Ljava/lang/Object;")),
            "a static invoke" to mediaCaptionChipFixture(batch = batchSend(swapped(BATCH_BODY, "iget-object v0, p0,", "sget-object v0,", "iget-object v1, p0,", "sget-object v1,"), flags = static)),
            "a batch send on another bus" to mediaCaptionChipFixture(batch = batchSend(BATCH_BODY.replace(CHIP_BUS, "LX/Q7c;")),
                batchFields = listOf(field(CHIP_BATCH, "A00", "LX/Q7c;"), field(CHIP_BATCH, "A01", "Ljava/util/List;"))),
            "no SendTextEvent" to mediaCaptionChipFixture(event = null),
            "a SendTextEvent without the button's constructor" to mediaCaptionChipFixture(event = sendTextEvent(SEND_TEXT_EVENT_INIT.replace("IJ)V", "I)V"))),
        )
        for ((case, classes) in batches) {
            assertTrue(found(classes, MEDIA_CAPTION_CHIP_SEND).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(MEDIA_CAPTION_CHIP_SEND)) }
            // The chip's own hook stays when only the batch send changed.
            assertEquals(setOf(SYNTHETIC_MEDIA_CAPTION_CHIP), found(classes, MEDIA_CAPTION_CHIP), case)
        }
    }

    @Test fun anUnusableHandlerOrBatchSendRefusesTheSwitchBeforeAnyEdit() {
        val handler = chipHandler()
        val batch = batchSend(swapped(BATCH_BODY, REMOVE_NEW, "new-instance v3, $CHIP_EDIT_EVENT"))
        val handlerBefore = handler.code()
        val batchBefore = batch.code()
        assertFailsWith<PatchException> {
            injectControl(MEDIA_CAPTION, mapOf(MEDIA_CAPTION_CHIP to listOf(handler), MEDIA_CAPTION_CHIP_SEND to listOf(batch)))
        }
        assertEquals(handlerBefore, handler.code())
        assertEquals(batchBefore, batch.code())
        val broken = chipHandler(swapped(CHIP_BODY, OPEN_CALL, "nop"))
        val good = batchSend()
        val brokenBefore = broken.code()
        val goodBefore = good.code()
        assertFailsWith<PatchException> {
            injectControl(MEDIA_CAPTION, mapOf(MEDIA_CAPTION_CHIP to listOf(broken), MEDIA_CAPTION_CHIP_SEND to listOf(good)))
        }
        assertEquals(brokenBefore, broken.code())
        assertEquals(goodBefore, good.code())
    }

    @Test fun everySupportedBuildSendsTheWordsBeforeThePhotoTheChipsEditorSends() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        val families = mutableSetOf<String>()
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val byType = classes.associateBy { it.type }
            val chips = findMediaCaptionChip(classes)
            val sends = findMediaCaptionChipSend(classes, chips)
            assertEquals(activeProfile.hooks.getValue(MEDIA_CAPTION_CHIP), chips.map { it.hookId() }.toSet(), code)
            assertEquals(activeProfile.hooks.getValue(MEDIA_CAPTION_CHIP_SEND), sends.map { it.hookId() }.toSet(), code)
            assertEquals(listOf(1, 1), listOf(chips.size, sends.size), code)
            validateControls(mapOf(MEDIA_CAPTION_CHIP to chips, MEDIA_CAPTION_CHIP_SEND to sends), setOf(MEDIA_CAPTION_CHIP, MEDIA_CAPTION_CHIP_SEND))
            families += chips.single().hookId() + " " + sends.single().hookId()
            // The handler's plugin holds the composer's text in an interface with getText(), and the batch send is on the
            // handler's bus, posting through the build's own post.
            val handler = MutableMethod(chips.single())
            val host = byType.getValue(handler.definingClass)
            val text = assertNotNull(host.chipTextField { byType[it] }, code)
            assertTrue(byType.getValue(text.substringAfter(':')).declaresTypedText(), code)
            val bus = assertNotNull(handler.mediaCaptionChipSite(), code)
            val batch = MutableMethod(sends.single())
            val site = assertNotNull(batch.mediaCaptionChipSendSite(), code)
            assertEquals(bus, site.busType, code)
            assertEquals(listOf(bus, bus), listOf(site.bus.substringAfter(':'), handler.parameterTypes[2].toString()), code)
            assertEquals("Ljava/util/List;", site.media.substringAfter(':'), code)
            assertTrue(site.post.endsWith("($bus$COMPOSER_EVENT)V"), code)
            assertTrue(byType.getValue(SEND_TEXT_EVENT).methods.any { it.hookId() == SEND_TEXT_EVENT_INIT }, code)
            // ComposerEvent is an interface, so the verifier takes a SendTextEvent for it.
            assertTrue(AccessFlags.INTERFACE.isSet(byType.getValue(COMPOSER_EVENT).accessFlags), code)
            for ((method, helper, count) in listOf(Triple(handler, "${handler.definingClass}->$MEDIA_CAPTION_CHIP_HELPER(${handler.definingClass}" +
                handler.parameterTypes.joinToString("") + ")V", 5), Triple(batch, "${batch.definingClass}->$MEDIA_CAPTION_CHIP_SEND_HELPER(${batch.definingClass})V", 1))) {
                val before = method.code()
                val landings = method.landings()
                if (method === handler) method.injectMediaCaptionChip() else method.injectMediaCaptionChipSend()
                val after = method.code()
                assertEquals(Opcode.INVOKE_STATIC_RANGE, after[0].opcode, code)
                assertEquals(helper, after[0].called(), code)
                val registers = method.implementation!!.registerCount
                assertEquals((registers - count until registers).toList(), after[0].registers(), code)
                assertStockKept(before.withoutPadding(), after.drop(1).withoutPadding(), "$code ${method.name}")
                val moved = method.landings()
                assertEquals(landings.size, moved.size, code)
                landings.zip(moved).forEach { (old, new) -> assertTrue(old === new, "$code: a branch moved to ${new.opcode}") }
                assertTrue(0 !in method.jumpTargets(), code)
                // A second pass leaves it alone.
                if (method === handler) method.injectMediaCaptionChip() else method.injectMediaCaptionChipSend()
                assertEquals(after, method.code(), code)
            }
            // Both helpers build against this build's names.
            val chipHelper = mediaCaptionChipHelper(handler.definingClass, handler.parameterTypes.map { it.toString() }, text)
            assertEquals(text, chipHelper.code().single { it.opcode == Opcode.IGET_OBJECT }.field(), code)
            val sendHelper = mediaCaptionChipSendHelper(batch.definingClass, site)
            assertEquals(site.post, sendHelper.code().single { it.called()?.endsWith("($bus$COMPOSER_EVENT)V") == true }.called(), code)
        }
        // The 503 and 497 families each resolve to their own pair.
        assertEquals(controlProfiles.values.toSet().size, families.size)
    }
}

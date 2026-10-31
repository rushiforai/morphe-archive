/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.channelbar

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.commerce.COMMERCE
import app.morphe.patches.telegram.misc.commerce.hideCommercePatch
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** A channel's bottom bar, the chat screen that fills it, the Recent actions log that reuses it, and the runtime. */
class HideChannelBarButtonsFixtureTest {
    @Test fun `the chat screen hands each bar button to the extension and Recent actions keeps its own Search`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveChannelBarButtons()
            // Search 0, Direct messages 2 and Info 3; Gift, 1, stays with Hide Premium, gifts and Stars.
            assertEquals("$name: side buttons", 1 or (1 shl 2) or (1 shl 3), plan.mask)
            val before = ImmutableMethod.of(plan.update).controlBody()
            val elsewhere = placeCallers(context, plan.place) - signature(plan.update)
            assertTrue("$name: Recent actions places a button of the same bar", elsewhere.isNotEmpty())
            val stockShare = ImmutableMethod.of(shareDecision(context)).controlBody()
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideChannelBarButtonsPatch.execute(context) })

            val afterAll = plan.update.controlBody()
            val hooks = setOf(MUTE_BEGIN, MUTE_LABELLED, MUTE_FINISH)
            // The Mute switch adds four calls and nothing else. Padding nops come and go with a payload, so neither side counts them.
            assertEquals("$name: the Mute switch's calls", listOf(MUTE_BEGIN, MUTE_LABELLED, MUTE_LABELLED, MUTE_FINISH),
                afterAll.mapNotNull { it.controlRef() }.filter { it in hooks }.sortedBy { listOf(MUTE_BEGIN, MUTE_LABELLED, MUTE_FINISH).indexOf(it) })
            val after = afterAll.filter { it.controlRef() !in hooks && it.opcode != Opcode.NOP }
            val stock = before.filter { it.opcode != Opcode.NOP }
            val calls = plan.calls.map { at -> before.take(at).count { it.opcode != Opcode.NOP } }
            assertEquals("$name: one for one", stock.size, after.size)
            assertEquals("$name: all four buttons", 4, plan.calls.size)
            for (i in stock.indices) {
                if (i in calls) {
                    assertEquals("$name: $i", Opcode.INVOKE_STATIC, after[i].opcode)
                    assertEquals("$name: $i", SET_BUTTON, after[i].controlRef())
                    assertEquals("$name: $i keeps its operands", stock[i].namedRegisters(), after[i].namedRegisters())
                } else {
                    assertEquals("$name: stock $i", listOf(stock[i].opcode, stock[i].namedRegisters(), stock[i].controlRef()),
                        listOf(after[i].opcode, after[i].namedRegisters(), after[i].controlRef()))
                }
            }
            // Begin leads the update, the labelled call follows each Mute and Unmute text call, and the
            // bar goes to finish right after its last button.
            assertEquals("$name: begin first", MUTE_BEGIN, afterAll.first().controlRef())
            val finishAt = afterAll.indexOfFirst { it.controlRef() == MUTE_FINISH }
            assertEquals("$name: finish follows the last button", SET_BUTTON, afterAll[finishAt - 1].controlRef())
            assertEquals("$name: finish gets the bar the last button was set on", afterAll[finishAt - 1].namedRegisters().first(), afterAll[finishAt].namedRegisters().single())
            for (labelled in afterAll.indices.filter { afterAll[it].controlRef() == MUTE_LABELLED }) {
                assertTrue("$name: $labelled follows the text call", afterAll[labelled - 1].controlRef()!!.endsWith("(Ljava/lang/String;Z)V"))
            }
            val visible = mutableListOf<Method>()
            context.classDefForEach { cls ->
                if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
                cls.methods.filterTo(visible) { m -> m.name == "setVisibility" && m.controlBody().firstOrNull()?.controlRef() == MUTE_VISIBILITY }
            }
            assertEquals("$name: one bar setVisibility hooked", 1, visible.size)
            val visibility = visible.single().controlBody()
            assertEquals("$name: the bar's setVisibility asks the extension first",
                listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT), visibility.take(2).map { it.opcode })
            // The bubble behind the bar asks too: its flag goes through the extension between its read and its test.
            val drawn = mutableListOf<Method>()
            context.classDefForEach { cls ->
                if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
                cls.methods.filterTo(drawn) { m -> m.controlBody().any { it.controlRef() == MUTE_BUBBLE } }
            }
            assertEquals("$name: one bubble draw hooked", listOf("dispatchDraw"), drawn.map { it.name })
            val draw = drawn.single().controlBody()
            val asked = draw.indexOfFirst { it.controlRef() == MUTE_BUBBLE }
            val self = drawn.single().implementation!!.registerCount - 2
            assertEquals("$name: the flag is read first", Opcode.IGET_BOOLEAN, draw[asked - 1].opcode)
            val flag = draw[asked - 1].namedRegisters().first()
            assertEquals("$name: the holder and its flag", listOf(self, flag), draw[asked].namedRegisters())
            assertEquals("$name: the answer replaces the flag", listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ), draw.subList(asked + 1, asked + 3).map { it.opcode })
            assertEquals("$name: the guard tests the answer", listOf(flag, flag), listOf(draw[asked + 1], draw[asked + 2]).map { it.namedRegisters().single() })
            assertEquals("$name: the guard keeps the bubble's draw", "Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V", draw[asked + 4].controlRef())
            val muteStatus = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideChannelMute" }.controlBody()
            assertEquals("$name: the Mute capability", 1L, (muteStatus.first() as WideLiteralInstruction).wideLiteral)
            // The share button's decision asks Telegram's own answer, kept whole and private, before the switch and the extension.
            val asks = shareDecision(context).controlBody().mapNotNull { it.controlRef() }
            assertEquals("$name: the share decision's order", listOf("$SHARE_MESSAGE->$STOCK_SHARE()Z", SHARE_ON, SHARE_SHOWN),
                asks.filter { it == "$SHARE_MESSAGE->$STOCK_SHARE()Z" || it.startsWith(CHANNEL_SHARE) })
            assertEquals("$name: asked first", "$SHARE_MESSAGE->$STOCK_SHARE()Z", asks.first())
            val kept = context.mutableClassDefBy(SHARE_MESSAGE).methods.single { it.name == STOCK_SHARE }
            assertTrue("$name: the copy is private", AccessFlags.PRIVATE.isSet(kept.accessFlags))
            assertEquals("$name: the copy keeps Telegram's code", shape(stockShare), shape(kept.controlBody()))
            val shareStatus = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideChannelShare" }.controlBody()
            assertEquals("$name: the share capability", 1L, (shareStatus.first() as WideLiteralInstruction).wideLiteral)
            assertEquals("$name: Recent actions untouched", elsewhere, placeCallers(context, plan.place) - signature(plan.update))

            val sides = stub(context, "sideButtons")
            assertEquals(plan.mask, (sides[0] as NarrowLiteralInstruction).narrowLiteral)
            val place = stub(context, "place")
            assertEquals(listOf(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID), place.map { it.opcode })
            assertEquals(plan.bar, place[0].controlRef())
            assertEquals(plan.place, place[1].controlRef())
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideChannelButtons" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a build whose Mute sites changed keeps the side buttons and logs why`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveChannelBarButtons()
            val body = plan.update.controlBody()
            // The update names a joined channel's button Unmute nowhere now.
            for (at in body.indices.filter { body[it].controlRef() == "Lorg/telegram/messenger/R\$string;->ChannelUnmuteNoCaps:I" }) {
                plan.update.replaceInstruction(at, "const/16 v${body[at].namedRegisters().first()}, 0x0")
            }
            val warnings = PatchLogCapture.warnings { hideChannelBarButtonsPatch.execute(context) }
            assertEquals("${build.name}: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), warnings.single().endsWith("The patch goes on without the Mute switch."))
            val after = plan.update.controlBody()
            assertEquals(4, after.count { it.controlRef() == SET_BUTTON })
            assertTrue(after.none { it.controlRef() in setOf(MUTE_BEGIN, MUTE_LABELLED, MUTE_FINISH) })
            val side = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideChannelButtons" }.controlBody()
            assertEquals(1L, (side.first() as WideLiteralInstruction).wideLiteral)
            val mute = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideChannelMute" }.controlBody()
            assertEquals(0L, (mute.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a build whose share decision reads differently keeps the button and logs why`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val decision = shareDecision(context)
            val body = decision.controlBody()
            // The decision no longer reads whether the message is in Saved Messages.
            for (at in body.indices.filter { body[it].controlRef() == "$SHARE_MESSAGE->isSaved:Z" }) {
                decision.replaceInstruction(at, "const/16 v${body[at].namedRegisters().first()}, 0x0")
            }
            val warnings = PatchLogCapture.warnings { hideChannelBarButtonsPatch.execute(context) }
            assertEquals("${build.name}: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), warnings.single().endsWith("The patch goes on without the share button switch."))
            assertTrue(shareDecision(context).controlBody().none { it.controlRef()?.startsWith(CHANNEL_SHARE) == true })
            assertTrue(context.mutableClassDefBy(SHARE_MESSAGE).methods.none { it.name == STOCK_SHARE })
            val share = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideChannelShare" }.controlBody()
            assertEquals(0L, (share.first() as WideLiteralInstruction).wideLiteral)
            val mute = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideChannelMute" }.controlBody()
            assertEquals(1L, (mute.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `Hide Premium's Gift guard and this patch both land in either order`() {
        for (build in Fixtures.declaredBuilds()) {
            for (commerceFirst in listOf(true, false)) {
                val name = "${build.name} commerce first=$commerceFirst"
                val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
                val plan = context.resolveChannelBarButtons()
                if (commerceFirst) PatchLogCapture.warnings { hideCommercePatch.execute(context) }
                assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideChannelBarButtonsPatch.execute(context) })
                if (!commerceFirst) PatchLogCapture.warnings { hideCommercePatch.execute(context) }
                val placer = context.mutableClassDefBy(plan.bar).methods.single { "${it.definingClass}->${it.name}(IZZ)V" == plan.place }
                assertTrue("$name: Gift guard", placer.controlBody().take(2).any { it.controlRef() == "$COMMERCE->showChannelGiftButton(IZ)Z" })
                assertEquals("$name: bar calls", 4, plan.update.controlBody().count { it.controlRef() == SET_BUTTON })
            }
        }
    }

    /** The bar's classes and every class that places one of its buttons. */
    private fun hosts(build: File): List<ClassDef> {
        val bars = FixtureDex.classesWhere(build, { true }) { m ->
            m.parameterTypes.map { it.toString() } == listOf("I", "Z", "Z") && m.controlBody().any { it.controlRef() in SIDE_LABELS }
        }
        val places = bars.flatMap { bar -> bar.methods.filter { it.parameterTypes.map { p -> p.toString() } == listOf("I", "Z", "Z") } }
            .map { "${it.definingClass}->${it.name}(IZZ)V" }.toSet()
        val users = FixtureDex.classesWhere(build, { true }) { m -> m.controlBody().any { it.controlRef() in places } }
        // The chat screen's bar is a field of one of those users, and its class has a setVisibility of its own.
        val fieldTypes = users.flatMap { it.methods }.flatMap { it.controlBody() }.mapNotNull { it.controlField()?.type }.toSet()
        val views = FixtureDex.classesWhere(build, { true }) { m -> m.name == "setVisibility" && m.definingClass in fieldTypes }
        // The view holding the bar draws the bubble behind it.
        val holder = FixtureDex.classesWhere(build, { true }) { m -> m.name == "getInputIslandBubbleContainer" }
        // A message decides whether it gets the round share button.
        val message = FixtureDex.classesWhere(build, { true }) { m -> m.definingClass == SHARE_MESSAGE && m.name == SHARE_DECISION }
        return (bars + users + views + holder + message).distinctBy { it.type }
    }

    private fun shareDecision(context: BytecodePatchContext) =
        context.mutableClassDefBy(SHARE_MESSAGE).methods.single { it.name == SHARE_DECISION }

    /** Each instruction's opcode, registers and reference, padding nops left out. */
    private fun shape(body: List<Instruction>) =
        body.filter { it.opcode != Opcode.NOP }.map { listOf(it.opcode, it.namedRegisters(), it.controlRef()) }

    private fun placeCallers(context: BytecodePatchContext, place: String): Set<String> {
        val found = mutableSetOf<String>()
        context.classDefForEach { cls ->
            if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
            cls.methods.filter { m -> m.controlBody().any { it.controlRef() == place } }.forEach { found += signature(it) }
        }
        return found
    }

    private fun signature(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    private fun stub(context: BytecodePatchContext, name: String) =
        context.mutableClassDefBy(CHANNEL_BUTTONS).methods.single { it.name == name }.controlBody()
}

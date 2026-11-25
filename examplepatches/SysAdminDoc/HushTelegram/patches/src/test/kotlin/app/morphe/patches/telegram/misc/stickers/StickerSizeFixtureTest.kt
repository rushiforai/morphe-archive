/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.stickers

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.hostsOf
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.replaceInstruction
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origRef
import app.morphe.util.names.loadsInt
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

/** The message bubble's content setter, Telegram's message model and the runtime. */
class StickerSizeFixtureTest {
    private val contentLabel = "Lorg/telegram/messenger/R\$string;->SponsoredMessageAdWhatIsThis:I"

    @Test fun `the extension gets a sticker's largest side right after the bubble works it out`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of((ExtensionDex.classes() + sizeHosts(build) + cacheHosts(build) + panelHosts(build))
                .distinctBy { it.type })
            val plan = context.resolveStickerSize()
            val old = ImmutableMethod.of(plan.method)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { stickerSizePatch.execute(context) })

            val before = old.controlBody()
            val after = plan.method.controlBody()
            val at = plan.multiply
            assertEquals("$name: two instructions", before.size + 2, after.size)
            assertEquals(Opcode.MUL_FLOAT_2ADDR, after[at].opcode)
            // Plus Messenger adds its own size setting to the 0.5 right before the multiply.
            val entry = if (after[at - 1].opcode == Opcode.ADD_FLOAT_2ADDR) at - 1 else at
            assertEquals(Opcode.CONST_HIGH16, after[entry - 1].opcode)
            assertEquals(SIZE_HOOK, after[at + 1].controlRef())
            assertEquals("$name: the message and the size", listOf(plan.message, plan.size), after[at + 1].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT, after[at + 2].opcode)
            assertEquals(listOf(plan.size), after[at + 2].namedRegisters())
            assertEquals("$name: Telegram rounds what the extension answers", Opcode.FLOAT_TO_INT, after[at + 3].opcode)
            assertEquals(plan.size, after[at + 3].namedRegisters().last())
            for (i in before.indices) {
                val shift = if (i > at) 2 else 0
                assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), before[i].origRef()),
                    listOf(after[i + shift].opcode, after[i + shift].namedRegisters(), after[i + shift].origRef()))
            }
            // The phone's share falls into the multiply and the tablet's jumps to it, so both reach the hook.
            val flow = ControlFlow.of(plan.method)
            assertEquals("$name: the phone and the tablet", 2, flow.normal.indices.count { entry in flow.normal[it] })
            if (entry != at) assertEquals("$name: and only the add reaches the multiply", listOf(entry), flow.normal.indices.filter { at in flow.normal[it] })
            assertEquals("$name: only the multiply reaches the hook", listOf(at), flow.normal.indices.filter { at + 1 in flow.normal[it] })

            val stub = context.tgMutableClassDefBy(STICKER_SIZE).methods.single { it.origName == "emoji" }.controlBody().map { it.controlRef() }
            assertTrue("$name: the stub asks about animated emoji", "$MESSAGE_OBJECT->isAnimatedEmoji()Z" in stub)
            assertTrue("$name: and about dice", "$MESSAGE_OBJECT->isDice()Z" in stub)
            assertEquals(1L, statusOf(context, "stickerSize"))
            assertEquals(1L, statusOf(context, "keepStickerCache"))
            assertEquals(1L, statusOf(context, "stickerPanelSize"))
        }
    }

    @Test fun `the sticker panel and its search ask the runtime for their columns, cell height and sticker size`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of((ExtensionDex.classes() + panelHosts(build)).distinctBy { it.type })
            val plan = context.resolveStickerPanel()
            assertNull("$name: ${plan.missing}", plan.missing)
            val methods = plan.edits.map { it.method }.distinct()
            val stockBodies = methods.associateWith { it.controlBody() }
            val stock = methods.associateWith { m -> m.controlBody().map(::operands) }
            val stockFlow = methods.associateWith { ControlFlow.of(it) }
            plan.rehearse()
            for (m in methods) assertEquals("$name: a rehearsal edits nothing", stock.getValue(m), m.controlBody().map(::operands))
            plan.apply()

            val columns = mutableListOf<String>()
            val cells = mutableListOf<String>()
            val cellTypes = mutableSetOf<String>()
            var heights = 0
            var caps = 0
            for (m in methods) {
                val after = m.controlBody()
                val hooks = after.indices.filter { after[it].controlRef() in PANEL_HOOKS }
                // Every hook but the cell's hands its answer back through a move-result right after it.
                val added = hooks.flatMap { if (after[it].controlRef() == PANEL_CELL) listOf(it) else listOf(it, it + 1) }.toSet()
                // Telegram's own instructions, payload alignment aside, line up one for one.
                val stockReal = stockBodies.getValue(m).indices.filter { stockBodies.getValue(m)[it].opcode != Opcode.NOP }
                val kept = after.indices.filter { it !in added && after[it].opcode != Opcode.NOP }
                assertEquals("$name: ${m.definingClass}->${m.name} keeps Telegram's code in order",
                    stockReal.map { kind(stockBodies.getValue(m)[it]) }, kept.map { kind(after[it]) })
                val moved = stockReal.zip(kept).toMap()
                for (at in hooks) {
                    val registers = after[at].namedRegisters()
                    when (after[at].controlRef()) {
                        PANEL_COLUMN -> {
                            columns += m.definingClass
                            assertDp(name, after, at, COLUMN_DP, registers.single())
                            val divide = after[at + 2]
                            assertTrue("$name: the width divides the panel", divide.opcode == Opcode.DIV_INT_2ADDR || divide.opcode == Opcode.DIV_INT)
                            assertEquals("$name: by the answer", registers.single(), divide.namedRegisters().last())
                            assertEquals("$name: into the column count", Opcode.IPUT, after[at + 3].opcode)
                        }
                        PANEL_CELL -> {
                            cells += m.definingClass
                            val init = (after[at - 1] as ReferenceInstruction).reference as MethodReference
                            assertEquals("$name: right after the cell is built", listOf("<init>", registers.single()),
                                listOf(init.name, after[at - 1].namedRegisters().first()))
                            cellTypes += init.definingClass
                        }
                        PANEL_HEIGHT -> {
                            heights++
                            assertEquals("$name: while the cell measures itself", "onMeasure", m.name)
                            assertEquals("$name: the cell and its height", m.localRegisterCount(), registers.first())
                            assertDp(name, after, at, HEIGHT_DP, registers.last())
                        }
                        PANEL_CAP -> {
                            caps++
                            assertEquals("$name: the cell and its cap", m.localRegisterCount(), registers.first())
                            assertDp(name, after, at, CAP_DP, registers.last())
                            assertEquals("$name: before the cell's measured size", listOf(MEASURED_HEIGHT_REF, listOf(registers.first())),
                                listOf(after[at + 2].controlRef(), after[at + 2].namedRegisters()))
                        }
                    }
                }
                // A hook runs only on the way from the instruction before it, and whatever jumped to
                // Telegram's instruction still lands on it, past the hook.
                val flow = ControlFlow.of(m)
                for (at in hooks) assertEquals("$name: ${m.name} $at", listOf(at - 1), flow.normal.indices.filter { at in flow.normal[it] })
                val before = stockFlow.getValue(m)
                for (p in before.normal.indices) for (s in before.normal[p]) {
                    val from = moved[p] ?: continue
                    val to = moved[s] ?: continue
                    val hooked = to - 1 in added
                    if (hooked && s == p + 1) {
                        assertEquals("$name: ${m.name} $p falls into the hook", listOf(from + 1), flow.normal[from])
                    } else {
                        assertTrue("$name: ${m.name} $p still goes to $s", to in flow.normal[from])
                    }
                }
            }
            assertEquals("$name: the grid counts its columns in two places, both in one class", 2, columns.size)
            assertEquals(name, 1, columns.toSet().size)
            assertEquals("$name: the grid and its search each hand over their cells", 2, cells.toSet().size)
            assertTrue("$name: the grid is one of them", columns.first() in cells)
            assertEquals("$name: both make the same cell class", 1, cellTypes.size)
            assertTrue("$name: its height, in every branch", heights >= 1)
            assertEquals("$name: and the one cap", 1, caps)
            // Every dp(82) the cell class measures with goes through the runtime.
            val measure = context.tgMutableClassDefBy(cellTypes.single()).methods.single { it.name == "onMeasure" }
            assertEquals(name, heights, measure.controlBody().count { it.isLiteral(HEIGHT_DP) })
        }
    }

    @Test fun `a sticker cell that no longer caps its sticker leaves only Sticker panel size out`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val others = sizeHosts(build) + cacheHosts(build)
            // The bubble that sizes chat stickers also sizes things with dp(72) on some builds, and its hook still goes in.
            val hosts = panelHosts(build).filter { cls -> others.none { it.type == cls.type } }
            val context = PatchContexts.of((ExtensionDex.classes() + others + hosts).distinctBy { it.type })
            // StickerEmojiCell's draw: dp(66), then the smaller of that and the cell's measured size.
            fun capAt(body: List<Instruction>) = body.indices.firstOrNull { body[it].isLiteral(CAP_DP) && body.getOrNull(it + 3)?.controlRef() == MEASURED_HEIGHT_REF }
            val cap = hosts.flatMap { cls -> context.tgMutableClassDefBy(cls.type).methods.filter { m -> capAt(m.controlBody()) != null } }
                .single { m -> m.controlBody().any { it.controlRef() == SET_IMAGE_COORDS_REF } }
            val at = capAt(cap.controlBody())!!
            cap.replaceInstruction(at, "const/high16 v${cap.controlBody()[at].namedRegisters().single()}, 0x42800000")
            val stock = hosts.associate { cls -> cls.type to context.tgMutableClassDefBy(cls.type).methods.map { m -> m.controlBody().map(::operands) } }

            assertEquals(name, listOf("Change sticker size: a sticker cell no longer caps its sticker in one place (0). " +
                "The patch goes on without Sticker panel size."), PatchLogCapture.warnings { stickerSizePatch.execute(context) })
            assertEquals(1L, statusOf(context, "stickerSize"))
            assertEquals(1L, statusOf(context, "keepStickerCache"))
            assertEquals(0L, statusOf(context, "stickerPanelSize"))
            for (cls in hosts) {
                assertEquals("$name: ${cls.type} stays as it was", stock.getValue(cls.type),
                    context.tgMutableClassDefBy(cls.type).methods.map { m -> m.controlBody().map(::operands) })
            }
        }
    }

    @Test fun `the cache cleanup asks the runtime whether each file is in use`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + cacheHosts(build))
            val plan = context.resolveStickerCache()
            assertNull("$name: ${plan.missing}", plan.missing)
            val methods = plan.sites.map { it.first }.distinct()
            val stock = methods.associateWith { m -> m.controlBody().map(::operands) }
            plan.rehearse()
            for (m in methods) assertEquals("$name: a rehearsal edits nothing", stock.getValue(m), m.controlBody().map(::operands))
            plan.apply()
            var walks = 0
            var passes = 0
            for (m in methods) {
                val before = stock.getValue(m)
                val after = m.controlBody().map(::operands)
                assertEquals(name, before.size, after.size)
                val changed = before.indices.filter { before[it] != after[it] }
                for (at in changed) {
                    assertEquals("$name: ${m.name} $at", listOf(Opcode.INVOKE_INTERFACE, SET_CONTAINS_REF), listOf(before[at][0], before[at][2]))
                    assertEquals("$name: ${m.name} $at", listOf(Opcode.INVOKE_STATIC, before[at][1], CACHE_KEPT), after[at])
                    assertEquals("$name: the answer lands where Telegram's did", Opcode.MOVE_RESULT, after[at + 1][0])
                }
                if (m.isWalk()) walks += changed.size else passes += changed.size
            }
            // AutoDeleteMediaTask: once as the size limit's walk lists a file, and twice in the daily
            // pass, before it lists a file and again before it deletes one.
            assertEquals("$name: the size limit's walk", 1, walks)
            assertEquals("$name: the daily pass", 2, passes)
            // Every one of them asks about the same set, the one the walk reads.
            val sets = methods.flatMap { m -> m.controlBody().filter { it.opcode == Opcode.SGET_OBJECT && it.origRef()?.endsWith(":Ljava/util/Set;") == true }
                .map { it.origRef() } }.toSet()
            val walkSet = methods.single { it.isWalk() }.controlBody().single { it.opcode == Opcode.SGET_OBJECT }.origRef()
            assertTrue("$name: $sets", walkSet in sets && methods.all { m -> m.controlBody().any { it.origRef() == walkSet } })
        }
    }

    @Test fun `a cleanup walk that no longer asks about files in use leaves only Keep downloaded stickers out`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = cacheHosts(build)
            val context = PatchContexts.of((ExtensionDex.classes() + sizeHosts(build) + hosts + panelHosts(build))
                .distinctBy { it.type })
            val walk =hosts.flatMap { cls -> context.tgMutableClassDefBy(cls.type).methods.filter { it.isWalk() } }.single()
            val ask = walk.controlBody().indexOfFirst { it.controlRef() == SET_CONTAINS_REF }
            val (set, path) = walk.controlBody()[ask].namedRegisters()
            walk.replaceInstruction(ask, "invoke-interface {v$set, v$path}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z")
            val stock = hosts.associate { cls -> cls.type to context.tgMutableClassDefBy(cls.type).methods.map { m -> m.controlBody().map(::operands) } }

            assertEquals(name, listOf("Change sticker size: the cache cleanup's walk no longer asks once whether a file is in use (0). " +
                "The patch goes on without Keep downloaded stickers."), PatchLogCapture.warnings { stickerSizePatch.execute(context) })
            assertEquals(1L, statusOf(context, "stickerSize"))
            assertEquals(0L, statusOf(context, "keepStickerCache"))
            assertEquals(1L, statusOf(context, "stickerPanelSize"))
            for (cls in hosts) {
                assertEquals("$name: ${cls.type} stays as it was", stock.getValue(cls.type),
                    context.tgMutableClassDefBy(cls.type).methods.map { m -> m.controlBody().map(::operands) })
            }
        }
    }

    private fun sizeHosts(build: File) = FixtureDex.classesWhere(build, { true }) { m ->
        m.origDefiningClass == MESSAGE_OBJECT ||
            // 13.2 loads the label's id as a number, without the R field.
            m.controlBody().any { it.loadsInt() && it.controlRef() == contentLabel }
    }.map(ImmutableClassDef::of)

    /** AutoDeleteMediaTask's classes: the daily pass reads each Keep media time, and the walk passes over .nomedia. */
    private fun cacheHosts(build: File) = FixtureDex.classesWhere(build, { true }) { m ->
        m.controlBody().any { it.controlString() == "keep_media_type_" || it.controlString() == ".nomedia" }
    }.map(ImmutableClassDef::of)

    /**
     * The sticker panel and what looks like it: every class sizing something with dp(72), dp(82) or
     * dp(66) (the panel's grid, the masks sheet's and another sheet's, the panel's cells and the
     * sticker cell they extend), the grid's own "trend2", and then every class that builds one of
     * that sticker cell's subclasses (the panel's search and the masks sheet's adapters too).
     */
    private fun panelHosts(build: File): List<ClassDef> = panelSlices.hostsOf(build) {
        val sized = FixtureDex.classesWhere(build, { true }) { m ->
            val body = m.controlBody()
            body.any { it.controlString() == "trend2" } || body.indices.any { i ->
                PANEL_LITERALS.any { body[i].isLiteral(it) } && body.getOrNull(i + 1)?.controlRef() == DP_REF
            }
        }
        val capping = sized.filter { cls -> cls.methods.any { m -> m.controlBody().any { it.controlRef() == SET_IMAGE_COORDS_REF } } }.map { it.type }.toSet()
        val cells = sized.filter { it.superclass in capping }.map { it.type }.toSet()
        val building = FixtureDex.classesWhere(build, { true }) { m ->
            m.controlBody().any { it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type in cells }
        }
        (sized + building).distinctBy { it.type }
    }

    /** [operands], with a goto an insert pushed out of reach and widened read as the goto it was. */
    private fun kind(instruction: Instruction): List<Any?> = operands(instruction).let { shape ->
        if (instruction.opcode == Opcode.GOTO_16 || instruction.opcode == Opcode.GOTO_32) listOf(Opcode.GOTO) + shape.drop(1) else shape
    }

    private fun Instruction.isLiteral(value: Int) = opcode == Opcode.CONST_HIGH16 && (this as NarrowLiteralInstruction).narrowLiteral == value

    /** const/high16 [literal], dp, its move-result, then the hook on that register, which hands its answer back to it. */
    private fun assertDp(name: String, after: List<Instruction>, at: Int, literal: Int, register: Int) {
        assertTrue("$name: dp(${java.lang.Float.intBitsToFloat(literal)}) before the hook at $at", after[at - 3].isLiteral(literal))
        assertEquals(name, DP_REF, after[at - 2].controlRef())
        assertEquals(name, listOf(Opcode.MOVE_RESULT, listOf(register)), listOf(after[at - 1].opcode, after[at - 1].namedRegisters()))
        assertEquals(name, listOf(Opcode.MOVE_RESULT, listOf(register)), listOf(after[at + 1].opcode, after[at + 1].namedRegisters()))
    }

    private fun statusOf(context: BytecodePatchContext, flag: String) =
        (context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.controlBody().first() as WideLiteralInstruction).wideLiteral

    private fun operands(instruction: Instruction): List<Any?> = listOf(instruction.opcode, instruction.namedRegisters(), instruction.origRef())

    /** fillFilesRecursive(File, ArrayList). */
    private fun Method.isWalk() = AccessFlags.STATIC.isSet(accessFlags) &&
        parameterTypes.map(CharSequence::toString) == listOf("Ljava/io/File;", "Ljava/util/ArrayList;") &&
        controlBody().any { it.controlString() == ".nomedia" }

    private companion object {
        const val SET_CONTAINS_REF = "Ljava/util/Set;->contains(Ljava/lang/Object;)Z"
        const val DP_REF = "Lorg/telegram/messenger/AndroidUtilities;->dp(F)I"
        const val SET_IMAGE_COORDS_REF = "Lorg/telegram/messenger/ImageReceiver;->setImageCoords(FFFF)V"
        const val MEASURED_HEIGHT_REF = "Landroid/view/View;->getMeasuredHeight()I"
        val PANEL_LITERALS = listOf(COLUMN_DP, HEIGHT_DP, CAP_DP)
        val PANEL_HOOKS = setOf(PANEL_COLUMN, PANEL_CELL, PANEL_HEIGHT, PANEL_CAP)
        val panelSlices = mutableMapOf<File, List<ClassDef>>()
    }
}

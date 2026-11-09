/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.recommendations

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.ads.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.readsAfter
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

/** Real vendor methods prove request coverage, empty-result semantics and unchanged stock paths. */
class HideRecommendationsFixtureTest {
    private val hooks = "Lapp/hushtelegram/extension/telegram/misc/Recommendations;"
    private val targets = mapOf("getChannelRecommendations" to "channelRecommendations", "getCachedChannelRecommendations" to "cachedRecommendations")

    @Test
    fun `each declared build hides both request types and cached results while retaining every stock instruction`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val classes = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER, CHANNEL_RECOMMENDATIONS))
            assertEquals("$where: both host classes", setOf(MESSAGES_CONTROLLER, CHANNEL_RECOMMENDATIONS), classes.keys)
            val controller = classes.getValue(MESSAGES_CONTROLLER)
            val request = controller.methods.single { it.origName == "getChannelRecommendations" && it.origParameterTypes == listOf("J") }
            val cached = controller.methods.singleOrNull { it.origName == "getCachedChannelRecommendations" && it.origParameterTypes == listOf("J") }
            assertEquals(CHANNEL_RECOMMENDATIONS, request.origReturnType)
            if (cached != null) assertEquals(CHANNEL_RECOMMENDATIONS, cached.origReturnType)
            val requests = request.instructions().filter { it.opcode == Opcode.NEW_INSTANCE }.map { (it as ReferenceInstruction).reference.origString() }
            assertTrue("$where: similar channels use the shared getter", GET_CHANNEL_RECOMMENDATIONS in requests)
            assertTrue("$where: similar bots use the shared getter", GET_BOT_RECOMMENDATIONS in requests)
            // 13.2's R8 inlined the cache getter into its two callers, so each inlined copy carries the guard.
            val readers = cacheReaders(build)
            val inlined = readers.flatMap { reader -> reader.methods.map { it to inlinedCasts(it) } }.filter { it.second.isNotEmpty() }
            if (cached == null) assertEquals("$where: both callers of the inlined cache getter", 2, inlined.sumOf { it.second.size })
            assertEmptyResultContract(where, classes.getValue(CHANNEL_RECOMMENDATIONS), inlined)

            val keyboards = keyboards(build, classes)
            val context = PatchContexts.of((ExtensionDex.classes() + classes.values + keyboards + readers).distinctBy { it.type })
            val warnings = PatchLogCapture.warnings { hideRecommendationsPatch.execute(context) }
            assertEquals("$where: complete coverage has no warnings", emptyList<String>(), warnings)
            val patched = context.tgMutableClassDefBy(MESSAGES_CONTROLLER)
            assertGuard(where, request, patched.methods.single { it.origName == request.origName }, "skipRecommendations", listOf(Opcode.CONST_4, Opcode.RETURN_OBJECT))
            if (cached != null) {
                assertGuard(where, cached, patched.methods.single { it.origName == cached.origName }, "skipCachedRecommendations", listOf(Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.RETURN_OBJECT))
            } else for ((stock, casts) in inlined) {
                val hooked = context.tgMutableClassDefBy(stock.definingClass).methods.single { it.toString() == stock.toString() }
                assertInlinedGuard("$where ${stock.definingClass}->${stock.name}", stock, hooked, casts.single())
            }
            assertFlags(context, true, true, true)
        }
    }

    @Test
    fun `each declared build copies an empty list into both keyboards right after their one featured read`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val classes = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER, CHANNEL_RECOMMENDATIONS))
            val keyboards = keyboards(build, classes)
            val (tab, grid) = keyboardPasses(where, keyboards)
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values + keyboards)
            PatchLogCapture.warnings { hideRecommendationsPatch.execute(context) }
            for ((stock, featured) in listOf(tab to Featured.STICKERS, grid to Featured.EMOJI)) {
                val patched = context.tgMutableClassDefBy(stock.definingClass).methods.single { it.toString() == stock.toString() }
                val before = stock.controlBody().filter { it.opcode != Opcode.NOP }
                val after = patched.controlBody().filter { it.opcode != Opcode.NOP }
                val read = readEnd("$where ${stock.name}", before, featured)
                val kept = (before[read] as OneRegisterInstruction).registerA
                assertEquals("$where: the wrap calls the extension", KEYBOARD_FEATURED, after[read + 1].controlRef())
                assertEquals("$where: the wrap reads the kept list", Opcode.INVOKE_STATIC_RANGE, after[read + 1].opcode)
                assertEquals("$where: the wrap reads the kept list", listOf(kept), after[read + 1].namedRegisters())
                assertEquals("$where: the copy goes on from the same register", Opcode.MOVE_RESULT_OBJECT, after[read + 2].opcode)
                assertEquals("$where: the copy goes on from the same register", kept, (after[read + 2] as OneRegisterInstruction).registerA)
                assertEquals("$where: one wrap in ${stock.name}", 1, after.count { it.controlRef() == KEYBOARD_FEATURED })
                assertEquals("$where: every stock instruction of ${stock.name} remains", before.map { it.opcode to it.controlRef() },
                    after.filterIndexed { i, _ -> i != read + 1 && i != read + 2 }.map { it.opcode to it.controlRef() })
            }
            assertEquals("$where: nothing else reads through the switch", 2, context.methodsCalling(KEYBOARD_FEATURED))
        }
    }

    @Test
    fun `a keyboard without its Trending tab or emoji grid keeps both stock and drops only the trending packs switch`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER, CHANNEL_RECOMMENDATIONS))
            val keyboards = keyboards(build, classes)
            val (tab, grid) = keyboardPasses(build.name, keyboards)
            val others = (keyboards + cacheReaders(build)).distinctBy { it.type }
            for (missingTab in listOf(true, false)) {
                val context = PatchContexts.of(ExtensionDex.classes() + classes.values + others)
                if (missingTab) {
                    val method = context.tgMutableClassDefBy(tab.definingClass).methods.single { it.toString() == tab.toString() }
                    method.replaceInstruction(method.controlBody().indexOfFirst { it.controlString() == TRENDING_HIDDEN }, "nop")
                } else {
                    context.tgMutableClassDefBy(grid.definingClass).fields.removeAll { it.origType == tab.origDefiningClass }
                }
                val stock = listOf(tab, grid).associate { m -> m.toString() to context.opcodes(m) }
                val warnings = PatchLogCapture.warnings { hideRecommendationsPatch.execute(context) }
                assertEquals(1, warnings.size)
                assertTrue(warnings.single(), warnings.single().contains("without the trending packs switch"))
                assertTrue(warnings.single(), warnings.single().contains(if (missingTab) "Trending tab" else "pack list"))
                for (m in listOf(tab, grid)) assertEquals("${m.name} stays stock", stock.getValue(m.toString()), context.opcodes(m))
                assertEquals(0, context.methodsCalling(KEYBOARD_FEATURED))
                assertFlags(context, true, true, false)
            }
        }
    }

    @Test
    fun `either missing request anchor retains only cache coverage and names the missing target`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER, CHANNEL_RECOMMENDATIONS))
            val others = (keyboards(build, classes) + cacheReaders(build)).distinctBy { it.type }
            for (missing in listOf(GET_CHANNEL_RECOMMENDATIONS, GET_BOT_RECOMMENDATIONS)) {
                val context = PatchContexts.of(ExtensionDex.classes() + classes.values + others)
                val method = context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.origName == "getChannelRecommendations" }
                val at = method.instructions().indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && (it as ReferenceInstruction).reference.origString() == missing }
                assertTrue("${build.name}: request anchor $missing", at >= 0)
                method.replaceInstruction(at, "nop")
                val before = method.instructions().map { it.opcode }
                val warnings = PatchLogCapture.warnings { hideRecommendationsPatch.execute(context) }
                assertEquals(1, warnings.size)
                assertTrue(warnings.single(), warnings.single().contains("both channel and bot recommendations"))
                assertEquals("the unsupported request getter stays untouched", before, method.instructions().map { it.opcode })
                assertFlags(context, false, true, true)
            }
        }
    }

    @Test
    fun `a missing cache getter or unsafe empty constructor retains request coverage without claiming cached coverage`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER, CHANNEL_RECOMMENDATIONS))
            val readers = cacheReaders(build)
            val others = (keyboards(build, classes) + readers).distinctBy { it.type }
            for (missingGetter in listOf(true, false)) {
                val context = PatchContexts.of(ExtensionDex.classes() + classes.values + others)
                val controller = context.tgMutableClassDefBy(MESSAGES_CONTROLLER)
                val kept = controller.methods.any { it.origName == "getCachedChannelRecommendations" }
                if (missingGetter && kept) controller.methods.removeAll { it.origName == "getCachedChannelRecommendations" }
                else if (missingGetter) {
                    // 13.2's R8 inlined the getter, so one inlined copy losing its cast is the missing getter.
                    val (stock, casts) = readers.flatMap { reader -> reader.methods.map { it to inlinedCasts(it) } }.first { it.second.isNotEmpty() }
                    context.tgMutableClassDefBy(stock.definingClass).methods.single { it.toString() == stock.toString() }.replaceInstruction(casts.first(), "nop")
                }
                else context.tgMutableClassDefBy(CHANNEL_RECOMMENDATIONS).methods.removeAll { it.origName == "<init>" && it.parameterTypes.isEmpty() }
                val stockCached = controller.methods.singleOrNull { it.origName == "getCachedChannelRecommendations" }?.instructions()?.map { it.opcode }
                val stockReaders = readers.flatMap { it.methods }.associate { it.toString() to context.opcodes(it) }
                val warnings = PatchLogCapture.warnings { hideRecommendationsPatch.execute(context) }
                assertEquals(1, warnings.size)
                assertTrue(warnings.single(), warnings.single().contains(if (missingGetter) "cache getter" else "constructor"))
                if (stockCached != null) assertEquals(stockCached, controller.methods.single { it.origName == "getCachedChannelRecommendations" }.instructions().map { it.opcode })
                for (m in readers.flatMap { it.methods }) assertEquals("${m.name} stays stock", stockReaders.getValue(m.toString()), context.opcodes(m))
                assertFlags(context, true, false, true)
            }
        }
    }

    @Test
    fun `no surviving target refuses without claiming the family`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER, CHANNEL_RECOMMENDATIONS))
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
            context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.removeAll { it.origName in targets }
            val failure = assertThrows(PatchException::class.java) { hideRecommendationsPatch.execute(context) }
            assertTrue(failure.message, failure.message.orEmpty().contains("none of the 2 recommendation targets"))
            assertFlags(context, false, false, false)
        }
    }

    @Test
    fun `every missing status stub refuses before either host method changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER, CHANNEL_RECOMMENDATIONS))
            val readers = cacheReaders(build)
            for (missing in listOf("hideRecommendations", "channelRecommendations", "cachedRecommendations", "keyboardFeatured")) {
                val context = PatchContexts.of(ExtensionDex.classes() + classes.values + readers)
                context.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == missing }
                val failure = assertThrows(PatchException::class.java) { hideRecommendationsPatch.execute(context) }
                assertTrue(failure.message, failure.message.orEmpty().contains("no boolean method $missing()"))
                val patched = context.tgMutableClassDefBy(MESSAGES_CONTROLLER)
                // 13.2's R8 inlined the cache getter, so the build has the request getter alone and the getter's callers.
                for (original in classes.getValue(MESSAGES_CONTROLLER).methods.filter { it.origName in targets.keys }) {
                    val name = original.origName
                    assertEquals("$name remains stock after a stub failure", original.instructions().map { it.opcode }, patched.methods.single { it.origName == name }.instructions().map { it.opcode })
                }
                for (m in readers.flatMap { it.methods }) {
                    assertEquals("${m.name} remains stock after a stub failure", m.instructions().map { it.opcode }, context.opcodes(m))
                }
            }
        }
    }

    private fun assertGuard(where: String, original: Method, patched: Method, name: String, earlyReturn: List<Opcode>) {
        val before = original.instructions()
        val after = patched.instructions()
        val head = earlyReturn.size + 3
        assertEquals("$where: $name instruction count", before.size + head, after.size)
        assertEquals("$where: $name guard", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ), after.take(3).map { it.opcode })
        assertEquals("$hooks->$name()Z", (after[0] as ReferenceInstruction).reference.origString())
        assertEquals(earlyReturn, after.subList(3, head).map { it.opcode })
        if (name == "skipRecommendations") assertEquals("request getter answers null", 0, (after[3] as NarrowLiteralInstruction).narrowLiteral)
        else {
            assertEquals(CHANNEL_RECOMMENDATIONS, (after[3] as ReferenceInstruction).reference.origString())
            assertEquals("$CHANNEL_RECOMMENDATIONS-><init>()V", (after[4] as ReferenceInstruction).reference.origString())
        }
        assertEquals("$where: stock register allocation", original.implementation!!.registerCount, patched.implementation!!.registerCount)
        assertEquals("$where: every stock opcode remains", before.map { it.opcode }, after.drop(head).map { it.opcode })
        assertEquals("$where: every stock reference remains", before.references(), after.drop(head).references())
        val oldFlow = ControlFlow.of(original)
        val newFlow = ControlFlow.of(patched)
        assertEquals("$where: false resumes at the untouched first instruction", setOf(3, head), newFlow.normal[2].toSet())
        assertEquals("$where: the hidden result returns before any cache access", emptyList<Int>(), newFlow.normal[head - 1])
        for (index in before.indices) {
            assertEquals("$where: stock branch $index", oldFlow.normal[index], newFlow.normal[index + head].map { it - head })
            assertEquals("$where: stock handler $index", oldFlow.exceptional[index], newFlow.exceptional[index + head].map { it - head })
        }
    }

    private fun assertEmptyResultContract(where: String, result: ClassDef, inlined: List<Pair<Method, List<Int>>>) {
        assertTrue("$where: the empty result type is accessible", AccessFlags.PUBLIC.isSet(result.accessFlags))
        val constructor = result.methods.single { it.origName == "<init>" && it.parameterTypes.isEmpty() }
        assertTrue("$where: the result constructor is callable", AccessFlags.PUBLIC.isSet(constructor.accessFlags))
        assertEquals("$where: the constructor only creates its empty chats list",
            listOf("Ljava/lang/Object;-><init>()V", "Ljava/util/ArrayList;", "Ljava/util/ArrayList;-><init>()V", "$CHANNEL_RECOMMENDATIONS->chats:Ljava/util/ArrayList;"),
            constructor.instructions().references())
        val predicate = result.methods.singleOrNull { it.origName == "hasRecommendations" && it.origParameterTypes == listOf(CHANNEL_RECOMMENDATIONS) }
        if (predicate == null) {
            // 13.2's R8 inlined the check into each caller of the inlined cache getter: a missing answer
            // skips, and a present one goes on from its chats' emptiness or size, so empty shows nothing.
            assertTrue("$where: the inlined callers check their answers", inlined.isNotEmpty())
            for ((method, casts) in inlined) for (cast in casts) {
                val body = method.controlBody()
                val answer = (body[cast] as OneRegisterInstruction).registerA
                assertEquals("$where: a missing answer is no recommendations", Opcode.IF_EQZ to listOf(answer), body[cast + 1].opcode to body[cast + 1].namedRegisters())
                val chats = (cast + 2..cast + 4).first { body[it].controlRef() == "$CHANNEL_RECOMMENDATIONS->chats:Ljava/util/ArrayList;" }
                assertEquals("$where: the chats are the answer's", answer, body[chats].namedRegisters()[1])
                assertTrue("$where: an empty answer is no recommendations",
                    body[chats + 1].controlRef() in setOf("Ljava/util/ArrayList;->isEmpty()Z", "Ljava/util/ArrayList;->size()I") &&
                        body[chats + 1].namedRegisters() == listOf(body[chats].namedRegisters()[0]))
            }
            return
        }
        val body = predicate.instructions()
        assertEquals("$where: the host checks null and empty separately",
            listOf(Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN),
            body.map { it.opcode })
        assertEquals("$CHANNEL_RECOMMENDATIONS->chats:Ljava/util/ArrayList;", (body[1] as ReferenceInstruction).reference.origString())
        assertEquals("Ljava/util/ArrayList;->isEmpty()Z", (body[2] as ReferenceInstruction).reference.origString())
        val flow = ControlFlow.of(predicate)
        assertTrue("$where: null reaches false", 7 in flow.normal[0])
        assertTrue("$where: empty reaches false", 7 in flow.normal[4])
        assertEquals("$where: empty and null mean no recommendations", 0, (body[7] as NarrowLiteralInstruction).narrowLiteral)
    }

    /**
     * One inlined copy of the guard: the flag, a hidden result as a fresh empty one in the cast's register,
     * and the cast again, where the map's answer and the missing map's null meet. Everything else stays.
     */
    private fun assertInlinedGuard(where: String, stock: Method, patched: Method, cast: Int) {
        val at = cast + 1
        val before = stock.controlBody()
        val after = patched.controlBody()
        val result = (before[cast] as OneRegisterInstruction).registerA
        assertEquals("$where: guard", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT_RANGE, Opcode.CHECK_CAST),
            after.subList(at, at + 6).map { it.opcode })
        assertEquals("$where: guard references", listOf("$hooks->skipCachedRecommendations()Z", CHANNEL_RECOMMENDATIONS, "$CHANNEL_RECOMMENDATIONS-><init>()V", CHANNEL_RECOMMENDATIONS),
            listOf(0, 3, 4, 5).map { after[at + it].controlRef() })
        for (i in 3..5) assertEquals("$where: the empty result lands in the cast's register", listOf(result), after[at + i].namedRegisters())
        val flag = (after[at + 1] as OneRegisterInstruction).registerA
        assertEquals("$where: the guard tests its flag", listOf(flag), after[at + 2].namedRegisters())
        assertTrue("$where: the flag isn't the result", flag != result)
        assertEquals("$where: nothing reads the flag's register after the cast", emptyList<Int>(), stock.readsAfter(cast, flag))
        assertEquals("$where: stock register allocation", stock.implementation!!.registerCount, patched.implementation!!.registerCount)
        fun Opcode.kind() = if (this == Opcode.GOTO_16 || this == Opcode.GOTO_32) Opcode.GOTO else this
        assertEquals("$where: every stock instruction remains", before.filter { it.opcode != Opcode.NOP }.map { it.opcode.kind() to it.controlRef() },
            after.filterIndexed { i, _ -> i !in at until at + 6 }.filter { it.opcode != Opcode.NOP }.map { it.opcode.kind() to it.controlRef() })
        val oldFlow = ControlFlow.of(stock)
        val newFlow = ControlFlow.of(patched)
        assertEquals("$where: a shown result skips only the empty one", setOf(at + 3, at + 5), newFlow.normal[at + 2].toSet())
        assertEquals("$where: the cast goes on to the stock check", listOf(at + 6), newFlow.normal[at + 5])
        // Both the cast and the missing map's jump now reach the guard; everything past it moved by six.
        fun index(i: Int) = if (i >= at) i + 6 else i
        fun target(i: Int) = if (i > at) i + 6 else i
        val code = before.indexOfFirst { it.opcode == Opcode.NOP }.let { if (it < 0) before.size else it }
        for (i in 0 until code) {
            assertEquals("$where: stock branch $i", oldFlow.normal[i].map(::target).sorted(), newFlow.normal[index(i)].sorted())
            assertEquals("$where: stock handler $i", oldFlow.exceptional[i].map(::target).sorted(), newFlow.exceptional[index(i)].sorted())
        }
    }

    /** Every class outside the controller that reads its recommendation cache map, where R8 inlined the getter. */
    private fun cacheReaders(build: File) = FixtureDex.classesWhere(build, { true }) { m ->
        m.controlBody().map { it.controlRef() }.let { CACHED_RECOMMENDATIONS in it && MAP_GET in it }
    }.filter { it.origType != MESSAGES_CONTROLLER }

    /** The casts of an inlined cache getter here: the map read, its get, and the cast of the answer. */
    private fun inlinedCasts(method: Method): List<Int> {
        val body = method.controlBody()
        return body.indices.filter { cast ->
            body[cast].opcode == Opcode.CHECK_CAST && body[cast].controlRef() == CHANNEL_RECOMMENDATIONS &&
                (cast - 3..cast - 2).any { body.getOrNull(it)?.controlRef() == MAP_GET } &&
                (maxOf(0, cast - 12) until cast).any { body[it].opcode == Opcode.IGET_OBJECT && body[it].controlRef() == CACHED_RECOMMENDATIONS }
        }
    }

    /**
     * Where the one read of [featured] leaves its list: the getter's result, or in 13.2, where R8 inlined
     * both getters, the load of its slot from the array they returned from.
     */
    private fun readEnd(where: String, body: List<Instruction>, featured: Featured): Int {
        val call = body.indexOfFirst { it.controlRef() == featured.call }
        if (call >= 0) {
            assertEquals("$where: ${featured.call} is kept", Opcode.MOVE_RESULT_OBJECT, body[call + 1].opcode)
            return call + 1
        }
        val loads = body.indices.filter { at ->
            val load = body[at]
            load.opcode == Opcode.AGET_OBJECT && (at - 2 until at).any { from ->
                from >= 0 && body[from].opcode == Opcode.IGET_OBJECT && body[from].controlRef() == FEATURED_SETS &&
                    (body[from] as OneRegisterInstruction).registerA == (load as ThreeRegisterInstruction).registerB
            } && slotOf(body, at) == featured.slot
        }
        assertEquals("$where: one read of the ${featured.name.lowercase()} slot", 1, loads.size)
        return loads.single()
    }

    /** The constant last written to the index register of the array load at [at], reading back in order. */
    private fun slotOf(body: List<Instruction>, at: Int): Int? {
        val index = (body[at] as ThreeRegisterInstruction).registerC
        val write = (at - 1 downTo 0).firstOrNull { body[it].opcode.setsRegister() && body[it].namedRegisters().firstOrNull() == index } ?: return null
        return (body[write] as? NarrowLiteralInstruction)?.narrowLiteral
    }

    /** The classes that read either featured list, so the keyboards and every other reader are on hand. */
    private fun keyboards(build: File, hosts: Map<String, ClassDef>) = FixtureDex.classesWhere(build, { true }) { m ->
        // 13.2's R8 reads the array both getters return from in their place.
        m.controlBody().any { it.controlRef() == FEATURED_STICKERS || it.controlRef() == FEATURED_EMOJI || it.controlRef() == FEATURED_SETS }
    }.filter { it.origType !in hosts.keys }

    /** The sticker keyboard's tab pass and the emoji grid's pass, found from the stock code alone. */
    private fun keyboardPasses(where: String, keyboards: List<ClassDef>): Pair<Method, Method> {
        fun Method.pass() = !AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" && parameterTypes.map { it.toString() } == listOf("Z")
        val tabs = keyboards.flatMap { it.methods }.filter { m ->
            m.pass() && m.controlBody().any { it.controlRef() == TRENDING_TAB } && m.controlBody().any { it.controlString() == TRENDING_HIDDEN }
        }
        assertEquals("$where: one Trending tab pass", 1, tabs.size)
        val tab = tabs.single()
        val grids = keyboards.filter { c -> c.fields.any { it.origType == tab.origDefiningClass } }.flatMap { it.methods }.filter { m ->
            m.pass() && m.controlBody().count { it.controlRef() == FEATURED_EMOJI || (it.opcode == Opcode.IGET_OBJECT && it.controlRef() == FEATURED_SETS) } == 1
        }
        assertEquals("$where: one emoji grid pass", 1, grids.size)
        return tab to grids.single()
    }

    private fun BytecodePatchContext.opcodes(stock: Method) =
        tgMutableClassDefBy(stock.definingClass).methods.single { it.toString() == stock.toString() }.instructions().map { it.opcode }

    private fun BytecodePatchContext.methodsCalling(call: String): Int {
        val types = mutableListOf<String>()
        classDefForEach { if (!it.origType.startsWith("Lapp/hushtelegram/")) types += it.type }
        return types.sumOf { type -> tgMutableClassDefBy(type).methods.count { m -> m.controlBody().any { it.controlRef() == call } } }
    }

    private fun assertFlags(context: BytecodePatchContext, request: Boolean, cache: Boolean, keyboard: Boolean) {
        for ((name, expected) in mapOf("hideRecommendations" to (request || cache), "channelRecommendations" to request,
            "cachedRecommendations" to cache, "keyboardFeatured" to keyboard)) {
            val body = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.instructions()
            assertEquals("$name is an immutable build fact", Opcode.CONST_4, body[0].opcode)
            assertEquals("$name coverage", if (expected) 1 else 0, (body[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, body[1].opcode)
        }
    }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun List<Instruction>.references() = filterIsInstance<ReferenceInstruction>().map { it.reference.origString() }
}

/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.recommendations

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.ads.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

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
            val request = controller.methods.single { it.name == "getChannelRecommendations" && it.parameterTypes == listOf("J") }
            val cached = controller.methods.single { it.name == "getCachedChannelRecommendations" && it.parameterTypes == listOf("J") }
            assertEquals(CHANNEL_RECOMMENDATIONS, request.returnType)
            assertEquals(CHANNEL_RECOMMENDATIONS, cached.returnType)
            val requests = request.instructions().filter { it.opcode == Opcode.NEW_INSTANCE }.map { (it as ReferenceInstruction).reference.toString() }
            assertTrue("$where: similar channels use the shared getter", GET_CHANNEL_RECOMMENDATIONS in requests)
            assertTrue("$where: similar bots use the shared getter", GET_BOT_RECOMMENDATIONS in requests)
            assertEmptyResultContract(where, classes.getValue(CHANNEL_RECOMMENDATIONS))

            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
            val warnings = PatchLogCapture.warnings { hideRecommendationsPatch.execute(context) }
            assertEquals("$where: complete coverage has no warnings", emptyList<String>(), warnings)
            val patched = context.mutableClassDefBy(MESSAGES_CONTROLLER)
            assertGuard(where, request, patched.methods.single { it.name == request.name }, "skipRecommendations", listOf(Opcode.CONST_4, Opcode.RETURN_OBJECT))
            assertGuard(where, cached, patched.methods.single { it.name == cached.name }, "skipCachedRecommendations", listOf(Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.RETURN_OBJECT))
            assertFlags(context, true, true)
        }
    }

    @Test
    fun `either missing request anchor retains only cache coverage and names the missing target`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER, CHANNEL_RECOMMENDATIONS))
            for (missing in listOf(GET_CHANNEL_RECOMMENDATIONS, GET_BOT_RECOMMENDATIONS)) {
                val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
                val method = context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.name == "getChannelRecommendations" }
                val at = method.instructions().indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && (it as ReferenceInstruction).reference.toString() == missing }
                assertTrue("${build.name}: request anchor $missing", at >= 0)
                method.replaceInstruction(at, "nop")
                val before = method.instructions().map { it.opcode }
                val warnings = PatchLogCapture.warnings { hideRecommendationsPatch.execute(context) }
                assertEquals(1, warnings.size)
                assertTrue(warnings.single(), warnings.single().contains("both channel and bot recommendations"))
                assertEquals("the unsupported request getter stays untouched", before, method.instructions().map { it.opcode })
                assertFlags(context, false, true)
            }
        }
    }

    @Test
    fun `a missing cache getter or unsafe empty constructor retains request coverage without claiming cached coverage`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER, CHANNEL_RECOMMENDATIONS))
            for (missingGetter in listOf(true, false)) {
                val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
                val controller = context.mutableClassDefBy(MESSAGES_CONTROLLER)
                if (missingGetter) controller.methods.removeAll { it.name == "getCachedChannelRecommendations" }
                else context.mutableClassDefBy(CHANNEL_RECOMMENDATIONS).methods.removeAll { it.name == "<init>" && it.parameterTypes.isEmpty() }
                val stockCached = controller.methods.singleOrNull { it.name == "getCachedChannelRecommendations" }?.instructions()?.map { it.opcode }
                val warnings = PatchLogCapture.warnings { hideRecommendationsPatch.execute(context) }
                assertEquals(1, warnings.size)
                assertTrue(warnings.single(), warnings.single().contains(if (missingGetter) "cache getter" else "constructor"))
                if (stockCached != null) assertEquals(stockCached, controller.methods.single { it.name == "getCachedChannelRecommendations" }.instructions().map { it.opcode })
                assertFlags(context, true, false)
            }
        }
    }

    @Test
    fun `no surviving target refuses without claiming the family`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER, CHANNEL_RECOMMENDATIONS))
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
            context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.removeAll { it.name in targets }
            val failure = assertThrows(PatchException::class.java) { hideRecommendationsPatch.execute(context) }
            assertTrue(failure.message, failure.message.orEmpty().contains("none of the 2 recommendation targets"))
            assertFlags(context, false, false)
        }
    }

    @Test
    fun `every missing status stub refuses before either host method changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER, CHANNEL_RECOMMENDATIONS))
            for (missing in listOf("hideRecommendations", "channelRecommendations", "cachedRecommendations")) {
                val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
                context.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == missing }
                val failure = assertThrows(PatchException::class.java) { hideRecommendationsPatch.execute(context) }
                assertTrue(failure.message, failure.message.orEmpty().contains("no boolean method $missing()"))
                val patched = context.mutableClassDefBy(MESSAGES_CONTROLLER)
                for (name in targets.keys) {
                    val original = classes.getValue(MESSAGES_CONTROLLER).methods.single { it.name == name }
                    assertEquals("$name remains stock after a stub failure", original.instructions().map { it.opcode }, patched.methods.single { it.name == name }.instructions().map { it.opcode })
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
        assertEquals("$hooks->$name()Z", (after[0] as ReferenceInstruction).reference.toString())
        assertEquals(earlyReturn, after.subList(3, head).map { it.opcode })
        if (name == "skipRecommendations") assertEquals("request getter answers null", 0, (after[3] as NarrowLiteralInstruction).narrowLiteral)
        else {
            assertEquals(CHANNEL_RECOMMENDATIONS, (after[3] as ReferenceInstruction).reference.toString())
            assertEquals("$CHANNEL_RECOMMENDATIONS-><init>()V", (after[4] as ReferenceInstruction).reference.toString())
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

    private fun assertEmptyResultContract(where: String, result: ClassDef) {
        assertTrue("$where: the empty result type is accessible", AccessFlags.PUBLIC.isSet(result.accessFlags))
        val constructor = result.methods.single { it.name == "<init>" && it.parameterTypes.isEmpty() }
        assertTrue("$where: the result constructor is callable", AccessFlags.PUBLIC.isSet(constructor.accessFlags))
        assertEquals("$where: the constructor only creates its empty chats list",
            listOf("Ljava/lang/Object;-><init>()V", "Ljava/util/ArrayList;", "Ljava/util/ArrayList;-><init>()V", "$CHANNEL_RECOMMENDATIONS->chats:Ljava/util/ArrayList;"),
            constructor.instructions().references())
        val predicate = result.methods.single { it.name == "hasRecommendations" && it.parameterTypes == listOf(CHANNEL_RECOMMENDATIONS) }
        val body = predicate.instructions()
        assertEquals("$where: the host checks null and empty separately",
            listOf(Opcode.IF_EQZ, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN),
            body.map { it.opcode })
        assertEquals("$CHANNEL_RECOMMENDATIONS->chats:Ljava/util/ArrayList;", (body[1] as ReferenceInstruction).reference.toString())
        assertEquals("Ljava/util/ArrayList;->isEmpty()Z", (body[2] as ReferenceInstruction).reference.toString())
        val flow = ControlFlow.of(predicate)
        assertTrue("$where: null reaches false", 7 in flow.normal[0])
        assertTrue("$where: empty reaches false", 7 in flow.normal[4])
        assertEquals("$where: empty and null mean no recommendations", 0, (body[7] as NarrowLiteralInstruction).narrowLiteral)
    }

    private fun assertFlags(context: BytecodePatchContext, request: Boolean, cache: Boolean) {
        for ((name, expected) in mapOf("hideRecommendations" to (request || cache), "channelRecommendations" to request, "cachedRecommendations" to cache)) {
            val body = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.instructions()
            assertEquals("$name is an immutable build fact", Opcode.CONST_4, body[0].opcode)
            assertEquals("$name coverage", if (expected) 1 else 0, (body[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, body[1].opcode)
        }
    }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun List<Instruction>.references() = filterIsInstance<ReferenceInstruction>().map { it.reference.toString() }
}

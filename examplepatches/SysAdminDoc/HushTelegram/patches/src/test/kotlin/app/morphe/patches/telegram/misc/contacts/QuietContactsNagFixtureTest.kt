/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.contacts

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

/** The Contacts tab's class, the badge's class and the runtime are the whole context. */
class QuietContactsNagFixtureTest {
    @Test
    fun `the Contacts tab prompt and its badge are gated and keep their stock flow`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            val sites = context.resolveContactsNagSites()
            val ask = ImmutableMethod.of(sites.ask)
            val badge = ImmutableMethod.of(sites.badge)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { quietContactsNagPatch.execute(context) })
            val name = build.name
            assertEquals("$name: Telegram's own settings getter", "getGlobalNotificationsSettings", sites.prefs.name)

            // The Contacts tab: permission missing, quiet returns where a granted permission does.
            val askAfter = sites.ask.instructions()
            val gate = sites.askGate
            assertEquals("$name: prompt hook", HOOK, askAfter.subList(gate, gate + 5).map { it.opcode })
            assertEquals("$name: prompt reads the flags from", sites.prefs.toString(), askAfter[gate].reference())
            assertEquals("$name: prompt asks", "$CONTACTS_NAG->skipAsk($PREFS)Z", askAfter[gate + 2].reference())
            val askMoved = assertKeepsStock("$name: Contacts tab", ask, sites.ask, gate, 5)
            assertEquals("$name: quiet leaves as a grant does; otherwise asks", setOf(gate + 5, askMoved.getValue(sites.askDone)),
                ControlFlow.of(sites.ask).normal[gate + 4].toSet())
            val askStock = ask.instructions()
            assertEquals("$name: a grant leaves there in stock", setOf(gate, sites.askDone), ControlFlow.of(ask).normal[gate - 1].toSet())
            assertEquals("$name: and it's a return", Opcode.RETURN_VOID, askStock[sites.askDone].opcode)
            // The gate stands after the one-time flag clears, so a quiet visit still uses up its turn.
            val once = askStock.indexOfFirst { it.opcode == Opcode.IPUT_BOOLEAN }
            assertTrue("$name: the visit's flag clears before the gate", once in 0 until gate)
            // Every dialog and request in the method sits behind the gate.
            val askFlow = ControlFlow.of(sites.ask)
            for ((index, instruction) in askAfter.withIndex()) {
                val call = instruction.reference() ?: continue
                if (call.contains("->showDialog(") || call.contains("->shouldShowRequestPermissionRationale(") ||
                    (instruction.opcode == Opcode.INVOKE_VIRTUAL && call.startsWith(sites.ask.definingClass) && call.endsWith("(Z)V"))) {
                    assertFalse("$name: $call is reached around the gate", index in reachable(askFlow, 0, gate + 4))
                }
            }

            // The badge: the "!" waits on the gate, quiet goes to the clear a grant takes.
            val badgeAfter = sites.badge.instructions()
            val badgeGate = sites.badgeGate
            assertEquals("$name: badge hook", HOOK, badgeAfter.subList(badgeGate, badgeGate + 5).map { it.opcode })
            assertEquals("$name: badge asks", "$CONTACTS_NAG->hideBadge($PREFS)Z", badgeAfter[badgeGate + 2].reference())
            val badgeMoved = assertKeepsStock("$name: badge", badge, sites.badge, badgeGate, 5)
            assertEquals("$name: quiet clears; otherwise marks", setOf(badgeGate + 5, badgeMoved.getValue(sites.badgeClear)),
                ControlFlow.of(sites.badge).normal[badgeGate + 4].toSet())
            val mark = badgeAfter.indexOfFirst { it.string() == "!" }
            assertFalse("$name: the mark is reached around the gate", mark in reachable(ControlFlow.of(sites.badge), 0, badgeGate + 4))
            // In stock, a grant reaches the clear without the mark.
            val badgeStock = badge.instructions()
            val grant = badgeStock.indexOfFirst { it.reference()?.endsWith("->hasContactsPermission()Z") == true }
            assertTrue("$name: a grant reaches the clear in stock", sites.badgeClear in reachable(ControlFlow.of(badge), grant, sites.badgeGate))
            // The clear passes null where the mark passes "!".
            val clearCall = (sites.badgeClear until badgeStock.size).first { badgeStock[it].opcode == Opcode.INVOKE_VIRTUAL }
            val clearText = badgeStock[clearCall].namedRegisters()[1]
            assertTrue("$name: the clear passes null", badgeStock[clearCall - 1].let { it.opcode == Opcode.CONST_4 &&
                it.namedRegisters()[0] == clearText && (it as NarrowLiteralInstruction).narrowLiteral == 0 })

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "quietContactsNag" }.instructions()
            assertEquals("$name: build fact", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
        }
    }

    @Test
    fun `only the Contacts tab and its badge act on the Contacts tab's prompt flag`() {
        for (build in Fixtures.declaredBuilds()) {
            // Every reader of the flag Telegram sets on a Contacts tab "Not now" is the badge.
            val readers = FixtureDex.methodsWhere(build, { true }) { method -> method.instructions().let { body ->
                body.any { it.string() == ASKED_IN_CONTACTS } && body.any { it.isGetBoolean() } } }
            assertEquals("${build.name}: one reader of the Contacts tab's flag", 1, readers.size)
            // The class writing both flags checks contacts in two places: on becoming visible, the
            // automatic one, and in the request it shares with the tab's own buttons, left stock.
            val checks = FixtureDex.methodsWhere(build, { true }) { method -> method.instructions().any { it.string() == READ_CONTACTS } &&
                method.instructions().any { it.reference()?.contains("->checkSelfPermission(") == true } }
            val owners = FixtureDex.classes(build, checks.map { it.definingClass }.toSet())
            val inTab = checks.filter { method -> owners.getValue(method.definingClass).methods.flatMap { it.instructions() }
                .mapNotNull { it.string() }.containsAll(listOf(ASKED_ANYWHERE, ASKED_IN_CONTACTS)) }
            val visible = inTab.single { it.name == "onBecomeFullyVisible" }
            val request = visible.instructions().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                .single { it.definingClass == visible.definingClass && it.parameterTypes.map(CharSequence::toString) == listOf("Z") }
            assertEquals("${build.name}: the Contacts tab's contacts checks", setOf("onBecomeFullyVisible" to "()V", request.name to "(Z)V"),
                inTab.map { it.name to "(${it.parameterTypes.joinToString("")})${it.returnType}" }.toSet())
            assertTrue("${build.name}: the request asks Android", inTab.single { it.name == request.name }.instructions()
                .any { it.reference()?.contains("->requestPermissions(") == true })
        }
    }

    @Test
    fun `changed contacts prompt geometry refuses before any partial mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            val changes: List<Pair<String, (BytecodePatchContext, ContactsNagSites) -> Unit>> = listOf(
                "the badge marks with something else" to { _, sites ->
                    val mark = sites.badge.instructions().indexOfFirst { it.string() == "!" }
                    val register = sites.badge.instructions()[mark].namedRegisters()[0]
                    sites.badge.replaceInstruction(mark, "const-string v$register, \"?\"")
                },
                "the badge clears with text" to { _, sites ->
                    val body = sites.badge.instructions()
                    val clear = (sites.badgeClear until body.size).first { body[it].opcode == Opcode.CONST_4 }
                    sites.badge.replaceInstruction(clear, "const/4 v${body[clear].namedRegisters()[0]}, 0x1")
                },
                "the prompt writes another field" to { _, sites ->
                    val body = sites.ask.instructions()
                    val request = body.indices.last { body[it].opcode == Opcode.INVOKE_VIRTUAL && body[it].reference()!!.endsWith("(Z)V") }
                    sites.ask.addInstructions(request, "iput-boolean v0, p0, ${sites.ask.definingClass}->i0:Z")
                },
                "the tab checks another permission" to { _, sites ->
                    val body = sites.ask.instructions()
                    val text = body.indexOfFirst { it.string() == READ_CONTACTS }
                    sites.ask.replaceInstruction(text, "const-string v${body[text].namedRegisters()[0]}, \"android.permission.CAMERA\"")
                },
                "a second badge reader" to { context, sites ->
                    val other = context.mutableClassDefBy(sites.badge.definingClass).methods.first { it != sites.badge &&
                        (it.implementation?.registerCount ?: 0) > 2 }
                    other.addInstructions(0, """
                        const-string v0, "$ASKED_IN_CONTACTS"
                        invoke-static {}, ${sites.prefs}
                        move-result-object v1
                        invoke-interface {v1, v0, v0}, $PREFS->getBoolean(Ljava/lang/String;Z)Z
                    """.trimIndent())
                },
            )
            for ((case, change) in changes) {
                val context = contextFor(build)
                change(context, context.resolveContactsNagSites())
                assertRefusedUntouched(build, case, context)
            }
            assertRefusedUntouched(build, "no runtime", contextFor(build, runtime = false))
        }
    }

    private fun assertRefusedUntouched(file: java.io.File, case: String, context: BytecodePatchContext) {
        val build = file.name
        val owners = owners(file).map { it.type }
        val before = owners.associateWith { type -> context.mutableClassDefBy(type).methods.map { it.instructions().map(::operation) } }
        try {
            quietContactsNagPatch.execute(context)
            fail("$build: $case was accepted")
        } catch (expected: PatchException) {
            assertTrue("$build: $case: ${expected.message}", expected.message.orEmpty().contains("before editing"))
        }
        assertEquals("$build: $case doesn't partly mutate the Contacts tab or its badge", before,
            owners.associateWith { type -> context.mutableClassDefBy(type).methods.map { it.instructions().map(::operation) } })
        val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "quietContactsNag" }.instructions()
        assertEquals("$build: $case leaves the build fact false", 0, (status[0] as NarrowLiteralInstruction).narrowLiteral)
    }

    /**
     * The edited method holds the stock one's operations outside the [size] instructions inserted
     * at [at], switch padding aside, and every stock jump still goes where it went, a jump to the
     * hooked instruction now landing on the hook. Returns where each stock index moved.
     */
    private fun assertKeepsStock(what: String, original: Method, after: Method, at: Int, size: Int): Map<Int, Int> {
        val old = original.instructions()
        val now = after.instructions()
        val kept = old.indices.filterNot { old.isPadding(it) }
        val moved = now.indices.filterNot { now.isPadding(it) || it in at until at + size }
        assertEquals("$what keeps every stock operation", kept.map { operation(old[it]) }, moved.map { operation(now[it]) })
        val to = kept.zip(moved).toMap()
        val oldFlow = ControlFlow.of(original)
        val newFlow = ControlFlow.of(after)
        for (index in kept) {
            assertEquals("$what keeps stock flow from $index", oldFlow.normal[index].map { if (it == at) at else to.getValue(it) },
                newFlow.normal[to.getValue(index)])
        }
        return to
    }

    /** The badge's class and the Contacts tab's class. */
    private fun owners(build: java.io.File): List<ClassDef> {
        val badge = FixtureDex.classesWhere(build, { true }) { method -> method.instructions().let { body ->
            body.any { it.string() == ASKED_IN_CONTACTS } && body.any { it.isGetBoolean() } } }
        val tab = FixtureDex.classesWhere(build, { true }) { method -> method.name == "onBecomeFullyVisible" &&
            method.instructions().any { it.string() == READ_CONTACTS } }
        assertEquals("${build.name}: the badge", 1, badge.size)
        assertEquals("${build.name}: the Contacts tab", 1, tab.size)
        return badge + tab
    }

    private fun contextFor(build: java.io.File, runtime: Boolean = true): BytecodePatchContext {
        val extension = ExtensionDex.classes().filter { runtime || it.type != CONTACTS_NAG }
        return PatchContexts.of(extension + owners(build))
    }

    private fun reachable(flow: ControlFlow, from: Int, blocked: Int): Set<Int> {
        val found = mutableSetOf<Int>()
        val pending = ArrayDeque<Int>()
        pending.add(from)
        while (pending.isNotEmpty()) {
            val index = pending.removeFirst()
            if (index == blocked || !found.add(index)) continue
            pending.addAll(flow.normal[index])
            pending.addAll(flow.exceptional[index])
        }
        return found
    }

    private companion object {
        val HOOK = listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ)
    }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun List<Instruction>.isPadding(index: Int) = this[index].opcode == Opcode.NOP && getOrNull(index + 1)?.opcode in
        setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD)
    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun Instruction.string(): String? =
        if (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) ((this as ReferenceInstruction).reference as? StringReference)?.string else null
    private fun Instruction.isGetBoolean() = opcode == Opcode.INVOKE_INTERFACE &&
        ((this as ReferenceInstruction).reference as? MethodReference)?.let { it.definingClass == PREFS && it.name == "getBoolean" } == true
    private fun operation(instruction: Instruction) = instruction.opcode to instruction.reference()
}

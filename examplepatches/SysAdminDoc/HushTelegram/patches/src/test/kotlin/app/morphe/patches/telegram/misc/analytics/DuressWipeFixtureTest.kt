/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.analytics

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.hostsOf
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.folders.APP_PASSCODE
import app.morphe.patches.telegram.misc.folders.CHECK_PASSCODE
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap

private val DURESS_WIPE_HOST_CACHE = ConcurrentHashMap<String, List<ClassDef>>()
private val DURESS_SHARED_CONFIG = CHECK_PASSCODE.substringBefore("->")
private const val DURESS_MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
private const val DURESS_FILE_LOADER = "Lorg/telegram/messenger/FileLoader;"

/**
 * SharedConfig, whose passcode check the patch wraps, and the two classes the wipe calls into.
 * A test that runs Disable analytics over a build's classes and expects nothing to warn about adds
 * these, or the patch says it goes on without Duress passcode.
 */
internal fun duressWipeHosts(build: File): List<ClassDef> = DURESS_WIPE_HOST_CACHE.hostsOf(build.path) {
    FixtureDex.classes(build, setOf(DURESS_SHARED_CONFIG, DURESS_MESSAGES_CONTROLLER, DURESS_FILE_LOADER)).values.toList()
}

/**
 * Duress passcode on each declared build (#25): SharedConfig.checkPasscode hands what was typed to
 * the extension first and its answer to the extension before every return, so the extension sees
 * every no Telegram gives, including the ones a branch jumps to.
 */
class DuressWipeFixtureTest {
    @Test
    fun `each declared build hands the typed passcode and every answer of Telegram's check to the extension`() {
        var landed = 0
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val hosts = duressWipeHosts(build)
            assertEquals(where, 3, hosts.size)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val site = context.resolveDuressWipe()
            assertEquals(where, DURESS_SHARED_CONFIG, site.method.origDefiningClass)
            assertEquals(where, "checkPasscode", site.method.origName)

            val before = site.method.code()
            val stockReturns = before.indices.filter { before[it].opcode == Opcode.RETURN }
            assertTrue("$where: Telegram's check returns", stockReturns.isNotEmpty())
            assertEquals(where, stockReturns, site.returns.map { it.first })
            assertEquals(where, stockReturns.map { (before[it] as OneRegisterInstruction).registerA }, site.returns.map { it.second })
            val stockTargets = targets(before)
            landed += stockTargets.values.count { it in stockReturns }
            val parameter = site.method.implementation!!.registerCount - 1

            context.applyDuressWipe(site)
            val after = site.method.code()
            assertEquals(where, before.size + 1 + 2 * stockReturns.size, after.size)

            val enter = after[0]
            assertEquals("$where: what was typed goes first", Opcode.INVOKE_STATIC_RANGE, enter.opcode)
            assertEquals(DURESS_ENTER, (enter as ReferenceInstruction).reference.origString())
            assertEquals("$where: the typed passcode", parameter, (enter as RegisterRangeInstruction).startRegister)
            assertEquals(1, enter.registerCount)

            val returns = after.indices.filter { after[it].opcode == Opcode.RETURN }
            assertEquals("$where: every return is still there", stockReturns.size, returns.size)
            val hooks = mutableSetOf(0)
            for ((k, at) in returns.withIndex()) {
                val register = (after[at] as OneRegisterInstruction).registerA
                assertEquals("$where: return $k keeps its register", site.returns[k].second, register)
                val call = after[at - 2]
                assertEquals("$where: return $k is hooked", Opcode.INVOKE_STATIC_RANGE, call.opcode)
                assertEquals(DURESS_AFTER_CHECK, (call as ReferenceInstruction).reference.origString())
                assertEquals("$where: return $k hands over its answer", register, (call as RegisterRangeInstruction).startRegister)
                assertEquals(1, call.registerCount)
                assertEquals(Opcode.MOVE_RESULT, after[at - 1].opcode)
                assertEquals("$where: return $k returns the extension's answer", register, (after[at - 1] as OneRegisterInstruction).registerA)
                hooks += at - 2
                hooks += at - 1
            }
            val stock = after.indices.filter { it !in hooks }
            assertEquals("$where: stock code kept in order", before.filter(::counted).map(::kind),
                stock.map { after[it] }.filter(::counted).map(::kind))

            // A branch that went to a return now goes to its hook, and every other branch where it went.
            val afterTargets = targets(after)
            for ((from, to) in stockTargets) {
                val landing = afterTargets.getValue(stock[from])
                if (to in stockReturns) assertEquals("$where: the branch at $from runs the hook", stock[to] - 2, landing)
                else assertEquals("$where: the branch at $from", stock[to], landing)
            }
        }
        assertTrue("a pinned build branches onto one of the check's returns", landed > 0)
    }

    @Test
    fun `the whole patch claims Duress passcode, and a build missing a part goes on without it, unedited`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val metrics = FixtureDex.classesWhere(build, { true }) { method ->
                method.code().any { it.opcode == Opcode.NEW_INSTANCE &&
                    (it as ReferenceInstruction).reference.origString() == REPORT_READ_METRICS }
            }
            val context = PatchContexts.of(ExtensionDex.classes() + (metrics + duressWipeHosts(build)).distinctBy { it.type })
            val warnings = PatchLogCapture.warnings { disableAnalyticsPatch.execute(context) }
            assertTrue("$where: $warnings", warnings.none { "Duress passcode" in it })
            assertFlag(context, "duressWipe", true)
            val check = checkPasscode(context).code()
            val stockReturns = checkPasscode(duressWipeHosts(build)).code().count { it.opcode == Opcode.RETURN }
            assertEquals(where, 1, check.count { it.calls() == DURESS_ENTER })
            assertEquals(where, stockReturns, check.count { it.calls() == DURESS_AFTER_CHECK })
            val matches = context.tgMutableClassDefBy(APP_PASSCODE).methods.single { it.origName == "passcodeMatches" }.code()
            assertEquals("$where: the settings row asks Telegram", CHECK_PASSCODE, matches.firstNotNullOf { it.calls() })

            val without = PatchContexts.of(ExtensionDex.classes() + metrics)
            val missing = PatchLogCapture.warnings { disableAnalyticsPatch.execute(without) }
            assertTrue("$where: $missing", missing.any { "without Duress passcode" in it })
            assertFlag(without, "duressWipe", false)

            val noLogOut = duressWipeHosts(build).filter { it.origType != DURESS_MESSAGES_CONTROLLER }
            val partial = PatchContexts.of(ExtensionDex.classes() + (metrics + noLogOut).distinctBy { it.type })
            val stock = checkPasscode(noLogOut).code().map(::kind)
            val refused = PatchLogCapture.warnings { disableAnalyticsPatch.execute(partial) }
            assertTrue("$where: $refused", refused.any { DURESS_MESSAGES_CONTROLLER in it && "without Duress passcode" in it })
            assertFlag(partial, "duressWipe", false)
            assertEquals("$where: the check is left as it was", stock, checkPasscode(partial).code().map(::kind))
        }
    }

    private fun checkPasscode(context: BytecodePatchContext): Method =
        context.tgMutableClassDefBy(DURESS_SHARED_CONFIG).methods.single { it.origName == "checkPasscode" }

    private fun checkPasscode(classes: List<ClassDef>): Method =
        classes.single { it.origType == DURESS_SHARED_CONFIG }.methods.single { it.origName == "checkPasscode" }

    private fun assertFlag(context: BytecodePatchContext, name: String, expected: Boolean) {
        val body = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.code()
        assertEquals(name, if (expected) 1 else 0, (body[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, body[1].opcode)
    }

    /** Each branch's index and the index it lands on. Switches and array data jump through their payloads. */
    private fun targets(code: List<Instruction>): Map<Int, Int> {
        var address = 0
        val addresses = code.map { instruction -> address.also { address += instruction.codeUnits } }
        return code.indices.filter { code[it] is OffsetInstruction && code[it].opcode !in PAYLOAD_USERS }.associateWith {
            addresses.indexOf(addresses[it] + (code[it] as OffsetInstruction).codeOffset).also { to -> assertTrue(to >= 0) }
        }
    }

    private fun Instruction.calls(): String? =
        if (opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE) (this as ReferenceInstruction).reference.origString() else null

    private fun counted(instruction: Instruction) = instruction.opcode != Opcode.NOP && !instruction.opcode.format.isPayloadFormat

    private fun kind(instruction: Instruction) =
        if (instruction.opcode == Opcode.GOTO_16 || instruction.opcode == Opcode.GOTO_32) Opcode.GOTO else instruction.opcode

    private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private companion object {
        val PAYLOAD_USERS = setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH, Opcode.FILL_ARRAY_DATA)
    }
}

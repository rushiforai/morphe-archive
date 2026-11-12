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
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap

private val INSTANT_LOCK_HOST_CACHE = ConcurrentHashMap<String, List<ClassDef>>()

/**
 * Every class of [build] with a method that reads the Auto-lock delay: the lock checks Instant lock
 * hooks, and the passcode screen and SharedConfig, which it leaves alone. A test that runs Disable
 * analytics over a build's classes and expects nothing to warn about adds these, or the patch says
 * it goes on without Instant lock.
 */
internal fun instantLockHosts(build: File): List<ClassDef> = INSTANT_LOCK_HOST_CACHE.hostsOf(build.path) {
    FixtureDex.classesWhere(build, { true }) { method ->
        method.implementation?.instructions?.any { it.opcode == Opcode.SGET && it.origRef() == AUTO_LOCK_IN } == true
    }
}

/**
 * Instant lock on each declared build (#71): the passcode check, LaunchActivity's pause timer, the
 * bubble and share screens' onPause and the media service's check each read the Auto-lock delay
 * and the pause time, and every one of their reads of the delay goes through the extension right
 * after it loads. The passcode screen, which shows the delay, and SharedConfig, which stores it,
 * keep the user's choice.
 */
class InstantLockFixtureTest {
    @Test
    fun `each declared build has its five lock checks, and every Auto-lock read in them asks the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val hosts = instantLockHosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val checks = context.resolveInstantLock()
            val named = checks.map { "${it.method.origDefiningClass}->${it.method.origName}" }
            assertTrue("$where: $named", "Lorg/telegram/messenger/AndroidUtilities;->needShowPasscode" in named)
            assertEquals("$where: $named", 1, named.count { it.startsWith(LAUNCH_ACTIVITY) })
            assertTrue("$where: $named", "Lorg/telegram/ui/BubbleActivity;->onPause" in named)
            assertTrue("$where: $named", "Lorg/telegram/ui/ExternalActionActivity;->onPause" in named)
            // The fifth is the media service's copy of the check, which R8 moved out to a class of its own.
            assertEquals("$where: $named", 5, checks.size)

            checks.forEach { it.apply() }
            var hookedReads = 0
            var keptReads = 0
            for (owner in hosts) {
                val patched = context.tgMutableClassDefBy(owner.type)
                for (method in owner.methods) {
                    val before = method.instructions()
                    val after = patched.methods.single { it.sameSignatureAs(method) }.instructions()
                    val reads = before.indices.filter { before[it].opcode == Opcode.SGET && before[it].origRef() == AUTO_LOCK_IN }
                    val label = "$where: ${owner.origType}->${method.name}"
                    if (checks.none { it.method.definingClass == owner.type && it.method.sameSignatureAs(method) }) {
                        assertEquals("$label is untouched", before.map { it.opcode }, after.map { it.opcode })
                        keptReads += reads.size
                        continue
                    }
                    assertEquals("$label: two instructions per read", before.size + 2 * reads.size, after.size)
                    val inserted = mutableSetOf<Int>()
                    for ((earlier, read) in reads.withIndex()) {
                        val at = read + 2 * earlier
                        val register = (before[read] as OneRegisterInstruction).registerA
                        assertEquals("$label: the read", AUTO_LOCK_IN, after[at].origRef())
                        val call = after[at + 1]
                        assertEquals("$label: the hook follows the read", Opcode.INVOKE_STATIC_RANGE, call.opcode)
                        assertEquals(INSTANT_LOCK_HOOK, (call as ReferenceInstruction).reference.origString())
                        assertEquals("$label: the hook gets the delay just read", register, (call as RegisterRangeInstruction).startRegister)
                        assertEquals(1, call.registerCount)
                        assertEquals(Opcode.MOVE_RESULT, after[at + 2].opcode)
                        assertEquals("$label: the answer replaces the delay", register, (after[at + 2] as OneRegisterInstruction).registerA)
                        inserted += at + 1
                        inserted += at + 2
                    }
                    assertEquals("$label: stock code kept in order", before.map { it.opcode },
                        after.filterIndexed { index, _ -> index !in inserted }.map { it.opcode })
                    hookedReads += reads.size
                }
            }
            assertTrue("$where: no read hooked", hookedReads >= 8)
            assertTrue("$where: the passcode screen and SharedConfig still read the real delay", keptReads >= 2)
        }
    }

    @Test
    fun `the whole patch claims Instant lock, and a build without LaunchActivity's timer goes on without it`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val metrics = FixtureDex.classesWhere(build, { true }) { method ->
                method.instructions().any { it.opcode == Opcode.NEW_INSTANCE &&
                    (it as ReferenceInstruction).reference.origString() == REPORT_READ_METRICS }
            }
            val context = PatchContexts.of(ExtensionDex.classes() + (metrics + instantLockHosts(build)).distinctBy { it.type })
            val warnings = PatchLogCapture.warnings { disableAnalyticsPatch.execute(context) }
            assertTrue("$where: $warnings", warnings.none { "Instant lock" in it })
            assertFlag(context, "instantLock", true)

            val stock = instantLockHosts(build).filter { it.origType != LAUNCH_ACTIVITY }
            val without = PatchContexts.of(ExtensionDex.classes() + (metrics + stock).distinctBy { it.type })
            val missing = PatchLogCapture.warnings { disableAnalyticsPatch.execute(without) }
            assertTrue("$where: $missing", missing.any { "LaunchActivity has 0 lock timers" in it && "without Instant lock" in it })
            assertFlag(without, "instantLock", false)
            for (owner in stock) {
                val patched = without.tgMutableClassDefBy(owner.type)
                assertTrue("$where: ${owner.origType} was hooked anyway", patched.methods.none { method ->
                    method.instructions().any { (it as? ReferenceInstruction)?.reference?.origString() == INSTANT_LOCK_HOOK }
                })
            }
        }
    }

    private fun assertFlag(context: BytecodePatchContext, name: String, expected: Boolean) {
        val body = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.instructions()
        assertEquals(name, if (expected) 1 else 0, (body[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, body[1].opcode)
    }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.sameSignatureAs(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }
}

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
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
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

private val QUIET_SIGN_UP_HOST_CACHE = ConcurrentHashMap<String, List<ClassDef>>()

/**
 * Every class of [build] with a method that reads the sign-up request's quiet flag: the request
 * itself. A test that runs Disable analytics over a build's classes and expects nothing to warn
 * about adds these, or the patch says it goes on without Don't notify contacts.
 */
internal fun quietSignUpHosts(build: File): List<ClassDef> = QUIET_SIGN_UP_HOST_CACHE.hostsOf(build.path) {
    FixtureDex.classesWhere(build, { true }) { method ->
        method.implementation?.instructions?.any { it.opcode == Opcode.IGET_BOOLEAN && it.origRef() == NO_JOINED_NOTIFICATIONS } == true
    }
}

/**
 * Don't notify contacts on each declared build (#71): TL_auth_signUp.serializeToStream reads
 * no_joined_notifications once, on its way into the request's flags, and that read goes through the
 * extension before the flags take it.
 */
class QuietSignUpFixtureTest {
    @Test
    fun `each declared build hands the sign-up request's quiet flag to the extension before it is sent`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val hosts = quietSignUpHosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val site = context.resolveQuietSignUp()
            assertEquals(where, SIGN_UP, site.method.origDefiningClass)
            assertEquals(where, "serializeToStream", site.method.origName)
            val before = site.method.instructions()
            val flags = before[site.index + 1]
            assertTrue("$where: the flag goes straight into the flags",
                (flags as? FiveRegisterInstruction)?.let { site.register in listOf(it.registerC, it.registerD, it.registerE) } == true)
            var offset = 0
            val offsets = before.map { instruction -> offset.also { offset += instruction.codeUnits } }
            val targets = before.indices.filter { before[it] is OffsetInstruction }
                .map { offsets[it] + (before[it] as OffsetInstruction).codeOffset }
            assertTrue("$where: nothing branches onto the instruction after the read", offsets[site.index + 1] !in targets)

            site.apply()
            val after = site.method.instructions()
            assertEquals(where, before.size + 2, after.size)
            assertEquals(where, NO_JOINED_NOTIFICATIONS, after[site.index].origRef())
            val call = after[site.index + 1]
            assertEquals("$where: the hook follows the read", Opcode.INVOKE_STATIC_RANGE, call.opcode)
            assertEquals(QUIET_SIGN_UP_HOOK, (call as ReferenceInstruction).reference.origString())
            assertEquals("$where: the hook gets the flag just read", site.register, (call as RegisterRangeInstruction).startRegister)
            assertEquals(1, call.registerCount)
            assertEquals(Opcode.MOVE_RESULT, after[site.index + 2].opcode)
            assertEquals("$where: the answer replaces the flag", site.register, (after[site.index + 2] as OneRegisterInstruction).registerA)
            assertEquals("$where: stock code kept in order", before.map { it.opcode },
                after.filterIndexed { index, _ -> index != site.index + 1 && index != site.index + 2 }.map { it.opcode })
        }
    }

    @Test
    fun `the whole patch claims Don't notify contacts, and a build without the sign-up request goes on without it`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val metrics = FixtureDex.classesWhere(build, { true }) { method ->
                method.instructions().any { it.opcode == Opcode.NEW_INSTANCE &&
                    (it as ReferenceInstruction).reference.origString() == REPORT_READ_METRICS }
            }
            val context = PatchContexts.of(ExtensionDex.classes() + (metrics + quietSignUpHosts(build)).distinctBy { it.type })
            val warnings = PatchLogCapture.warnings { disableAnalyticsPatch.execute(context) }
            assertTrue("$where: $warnings", warnings.none { "Don't notify contacts" in it })
            assertFlag(context, "quietSignUp", true)

            val without = PatchContexts.of(ExtensionDex.classes() + metrics)
            val missing = PatchLogCapture.warnings { disableAnalyticsPatch.execute(without) }
            assertTrue("$where: $missing", missing.any { "the sign-up request is missing" in it && "without Don't notify contacts" in it })
            assertFlag(without, "quietSignUp", false)
        }
    }

    private fun assertFlag(context: BytecodePatchContext, name: String, expected: Boolean) {
        val body = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.instructions()
        assertEquals(name, if (expected) 1 else 0, (body[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, body[1].opcode)
    }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
}

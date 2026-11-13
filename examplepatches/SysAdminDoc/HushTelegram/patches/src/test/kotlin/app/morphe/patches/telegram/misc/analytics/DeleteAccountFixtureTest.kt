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
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.origString
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap

private val DELETE_ACCOUNT_HOST_CACHE = ConcurrentHashMap<String, List<ClassDef>>()
private const val SEND_REQUEST =
    "Lorg/telegram/tgnet/ConnectionsManager;->sendRequest(Lorg/telegram/tgnet/TLObject;${REQUEST_CALLBACK}I)I"

/**
 * The classes of [build] Delete account's stubs reach: the request, the callback Telegram answers
 * through and its error. A test that runs Disable analytics over a build's classes and expects
 * nothing to warn about adds these and [ghostModeHosts], or the patch goes on without Delete account.
 */
internal fun deleteAccountHosts(build: File): List<ClassDef> = DELETE_ACCOUNT_HOST_CACHE.hostsOf(build.path) {
    FixtureDex.classes(build, setOf(DELETE_ACCOUNT_REQUEST, REQUEST_CALLBACK, REQUEST_ERROR)).values.toList()
}

/**
 * Delete account on each declared build (#71): the request carries only its reason, it leaves
 * through ConnectionsManager's public send with the callback the extension made, and Telegram's
 * refusal reaches the extension as its text.
 */
class DeleteAccountFixtureTest {
    @Test
    fun `each declared build gets the delete request written into the extension, and a build without it goes on without Delete account`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val metrics = FixtureDex.classesWhere(build, { true }) { method ->
                method.instructions().any { it.opcode == Opcode.NEW_INSTANCE &&
                    (it as ReferenceInstruction).reference.origString() == REPORT_READ_METRICS }
            }
            val hosts = deleteAccountHosts(build)
            assertEquals(where, 3, hosts.size)
            val context = PatchContexts.of(ExtensionDex.classes() + (metrics + ghostModeHosts(build) + hosts).distinctBy { it.type })
            val warnings = PatchLogCapture.warnings { disableAnalyticsPatch.execute(context) }
            assertTrue("$where: $warnings", warnings.none { "Delete account" in it })
            assertFlag(context, "deleteAccount", true)

            val request = stub(context, "request")
            assertEquals("$where: a new request", listOf(Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.IPUT_OBJECT, Opcode.RETURN_OBJECT),
                request.map { it.opcode })
            assertEquals(where, DELETE_ACCOUNT_REQUEST, request[0].origRef())
            assertEquals("$where: only the reason is set", DELETE_REASON, request[2].origRef())
            assertEquals(where, REQUEST_CALLBACK, stub(context, "requestDelegate")[0].origRef())
            val sends = stub(context, "sendRequest").filter { it.opcode == Opcode.INVOKE_VIRTUAL }
            assertEquals("$where: one send", listOf(SEND_REQUEST), sends.map { it.origRef() })
            val error = stub(context, "errorText")
            assertEquals(where, Opcode.IGET_OBJECT, error[1].opcode)
            assertEquals(where, "$REQUEST_ERROR->text:Ljava/lang/String;", error[1].origRef())

            val without = PatchContexts.of(ExtensionDex.classes() +
                (metrics + ghostModeHosts(build) + hosts.filter { it.type != DELETE_ACCOUNT_REQUEST }).distinctBy { it.type })
            val missing = PatchLogCapture.warnings { disableAnalyticsPatch.execute(without) }
            assertTrue("$where: $missing", missing.any { "deleteAccount" in it && "without Delete account" in it })
            assertFlag(without, "deleteAccount", false)
            assertEquals("$where: the stub stays empty", Opcode.CONST_4, stub(without, "request")[0].opcode)
        }
    }

    private fun stub(context: BytecodePatchContext, name: String): List<Instruction> =
        context.tgMutableClassDefBy(DELETE_ACCOUNT).methods.single { it.origName == name }.instructions()

    private fun assertFlag(context: BytecodePatchContext, name: String, expected: Boolean) {
        val body = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.instructions()
        assertEquals(name, if (expected) 1 else 0, (body[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, body[1].opcode)
    }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
}

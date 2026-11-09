/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Test
import java.io.File
import app.morphe.util.names.origName
import app.morphe.util.names.origString
import app.morphe.util.names.tgMutableClassDefBy

/** Both pinned builds' SharedConfig, which the passcode stubs read. */
class AppPasscodeFixtureTest {
    private fun hosts(build: File) = (ExtensionDex.classes() + launchFolderHosts(build)).distinctBy { it.type }

    @Test fun `the passcode stubs read Telegram's own passcode and have it do the checking`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(hosts(build))
            context.requireAppPasscodeRuntime()
            context.writeAppPasscodeStubs()
            val classDef = context.tgMutableClassDefBy(APP_PASSCODE)
            fun body(method: String) = classDef.methods.single { it.origName == method }.implementation!!.instructions.toList()
            fun refs(method: String) = body(method).filterIsInstance<ReferenceInstruction>().map { it.reference.origString() }

            assertEquals("$name: set", listOf(PASSCODE_HASH, "Ljava/lang/String;->length()I"), refs("passcodeSet"))
            assertEquals("$name: type", listOf(PASSCODE_TYPE), refs("passcodePin"))
            val check = body("passcodeMatches")
            assertEquals("$name: check", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.RETURN), check.map { it.opcode })
            assertEquals("$name: Telegram's check", CHECK_PASSCODE, (check[0] as ReferenceInstruction).reference.origString())
        }
    }
}

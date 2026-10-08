/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.ids

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import org.junit.Assert.assertEquals
import org.junit.Test

/** The data center row's two lookups, against each build's own cached users, chats and photos. */
class ProfileDataCenterFixtureTest {
    @Test fun `each lookup reads the cached peer's photo data center and answers zero without one`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val telegram = FixtureDex.classes(build, PROFILE_DC_TYPES)
            assertEquals("$name: every class the lookups read", PROFILE_DC_TYPES, telegram.keys)
            val context = PatchContexts.of(ExtensionDex.classes() + telegram.values)
            context.resolveProfileDc()
            context.writeProfileDc()
            for ((stub, peer, photo) in listOf(Triple("userPhotoDc", DC_USER, DC_USER_PHOTO), Triple("chatPhotoDc", DC_CHAT, DC_CHAT_PHOTO))) {
                val method = context.mutableClassDefBy(PROFILE_DC).methods.single { it.name == stub }
                assertEquals("$name: $stub registers", 4, method.implementation!!.registerCount)
                val body = method.controlBody()
                assertEquals("$name: $stub", listOf(Opcode.SGET, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC,
                    Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.IGET_OBJECT,
                    Opcode.IF_EQZ, Opcode.IGET, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN), body.map { it.opcode })
                val lookup = if (peer == DC_USER) "getUser" else "getChat"
                assertEquals("$name: $stub references", listOf("$DC_ACCOUNTS->selectedAccount:I", "$DC_PEERS->getInstance(I)$DC_PEERS",
                    "Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;", "$DC_PEERS->$lookup(Ljava/lang/Long;)$peer",
                    "$peer->photo:$photo", "$photo->dc_id:I"), body.mapNotNull { it.controlRef() })
                // The id is the long parameter in p0 and p1, the last two of four registers.
                assertEquals("$name: $stub reads the id", listOf(2, 3), body[3].namedRegisters())
                val flow = ControlFlow.of(method)
                assertEquals("$name: $stub answers zero without a peer", listOf(8, 12), flow.normal[7].sorted())
                assertEquals("$name: $stub answers zero without a photo", listOf(10, 12), flow.normal[9].sorted())
            }
        }
    }
}

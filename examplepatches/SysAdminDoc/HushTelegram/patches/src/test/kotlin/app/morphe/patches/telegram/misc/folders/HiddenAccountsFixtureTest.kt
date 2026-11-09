/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.FixtureDex
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.chattypefolders.CLIENT_ACTIVATED
import app.morphe.patches.telegram.misc.chattypefolders.CLIENT_USER_ID
import app.morphe.patches.telegram.misc.chattypefolders.USER_CONFIG
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import app.morphe.util.names.origRef
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

private const val ADD_ACCOUNT = "Lorg/telegram/messenger/R\$string;->AddAccount:I"

/** The classes with an account list: a method that adds the Add account row and asks who is signed in. */
internal fun accountListHosts(build: File) = FixtureDex.classesWhere(build, { true }) { m ->
    val refs = m.implementation?.instructions?.mapNotNull { it.origRef() }.orEmpty()
    ADD_ACCOUNT in refs && CLIENT_ACTIVATED in refs
}

/** Both pinned builds' account lists, which the account hider swaps the signed-in question in. */
class HiddenAccountsFixtureTest {
    private fun hosts(build: File) = (ExtensionDex.classes() + launchFolderHosts(build) + accountListHosts(build)).distinctBy { it.type }

    @Test fun `every account list asks the extension instead of the signed in check`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(hosts(build))
            val result = context.resolveHiddenAccounts()
            assertNull("$name: ${result.missing}", result.missing)
            val plan = result.plan!!
            assertTrue("$name: the switcher and the Settings list", plan.calls.size >= 2)
            val before = plan.calls.map { (method, at) -> at.size to method.implementation!!.instructions.count { it.opcode != Opcode.NOP } }
            context.writeHiddenAccountsStubs()
            applyHiddenAccounts(plan)
            plan.calls.forEachIndexed { i, (method, at) ->
                val body = method.implementation!!.instructions.filter { it.opcode != Opcode.NOP }
                assertEquals("$name: same length", before[i].second, body.size)
                val refs = body.map { it.origRef() }
                assertEquals("$name: no stock question left", 0, refs.count { it == CLIENT_ACTIVATED })
                assertEquals("$name: each question handed over", at.size, refs.count { it == "$HIDDEN_ACCOUNTS->activated(Ljava/lang/Object;)Z" })
                body.filter { it.origRef()?.startsWith(HIDDEN_ACCOUNTS) == true }
                    .forEach { assertEquals("$name: a static call", Opcode.INVOKE_STATIC, it.opcode) }
            }
        }
    }

    @Test fun `the stubs ask the config whether it is signed in and for its user`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(hosts(build))
            context.writeHiddenAccountsStubs()
            val classDef = context.tgMutableClassDefBy(HIDDEN_ACCOUNTS)
            fun refs(method: String): List<String?> = classDef.methods.single { it.origName == method }.implementation!!.instructions
                .filter { it.opcode != Opcode.NOP }.map { it.origRef() }
            assertEquals("${build.name} isActive", listOf(USER_CONFIG, CLIENT_ACTIVATED, null, null), refs("isActive"))
            assertEquals("${build.name} userIdOf", listOf(USER_CONFIG, CLIENT_USER_ID, null, null), refs("userIdOf"))
        }
    }

    @Test fun `a build without an account list is refused and left alone`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of((ExtensionDex.classes() + launchFolderHosts(build)).distinctBy { it.type })
            val result = context.resolveHiddenAccounts()
            assertNull(result.plan)
            assertTrue("${build.name}: ${result.missing}", result.missing.orEmpty().contains("account lists are missing"))
        }
    }
}

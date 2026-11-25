/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.api

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * An API ID typed into the app: on each declared build the connection manager's per-account
 * constructor asks the extension right after its super constructor, before it reads
 * BuildVars.APP_ID, and runs the build number it hands init through the extension, and the
 * constructor's own code stays as it was.
 */
class SavedApiCredentialsFixtureTest {
    @Test
    fun `the connection manager puts a saved API ID in place and tags its build number on each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classes(build, setOf(CONNECTIONS))
            val stock = hosts.getValue(CONNECTIONS).methods.filter { it.savedApiCredentialsSites() != null }
            assertEquals("$name: one per-account constructor", 1, stock.size)
            val sites = stock.single().savedApiCredentialsSites()!!
            val before = stock.single().controlBody()
            val read = before.indexOfFirst { it.opcode == Opcode.SGET && it.controlRef() == "$BUILD_VARS->APP_ID:I" }
            assertTrue("$name: the API ID is read after the super call", read >= sites.apply)
            assertTrue("$name: and before init", read < sites.initCall)
            val init = before[sites.initCall] as RegisterRangeInstruction
            assertEquals("$name: the build number is init's first argument", init.startRegister + 1, sites.version)

            val context = PatchContexts.of(ExtensionDex.classes() + hosts.values)
            assertEquals("$name: no warning", emptyList<String>(), PatchLogCapture.warnings { savedApiCredentialsPatch.execute(context) })

            val after = context.tgMutableClassDefBy(CONNECTIONS).methods.single { it.isPerAccountConstructor() }.controlBody()
            assertEquals("$name: three instructions", before.size + 3, after.size)
            assertEquals(Opcode.INVOKE_STATIC, after[sites.apply].opcode)
            assertEquals(APPLY_SAVED_API_CREDENTIALS, after[sites.apply].controlRef())
            assertEquals("$name: it takes nothing", 0, (after[sites.apply] as FiveRegisterInstruction).registerCount)

            val tag = sites.initCall + 1
            assertEquals(Opcode.INVOKE_STATIC_RANGE, after[tag].opcode)
            assertEquals(SAVED_API_NATIVE_VERSION, after[tag].controlRef())
            assertEquals(listOf(sites.version, 1), (after[tag] as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
            assertEquals(Opcode.MOVE_RESULT, after[tag + 1].opcode)
            assertEquals("$name: the answer goes back in its slot", sites.version, (after[tag + 1] as OneRegisterInstruction).registerA)
            assertEquals("$name: then init", before[sites.initCall].controlRef(), after[tag + 2].controlRef())
            assertTrue("$name: the hook runs before the API ID read",
                after.indexOfFirst { it.opcode == Opcode.SGET && it.controlRef() == "$BUILD_VARS->APP_ID:I" } > sites.apply)

            val added = setOf(sites.apply, tag, tag + 1)
            assertEquals("$name: stock code stays", before.map { it.opcode to it.controlRef() },
                after.filterIndexed { i, _ -> i !in added }.map { it.opcode to it.controlRef() })
        }
    }

    @Test
    fun `a build without the connection manager patches on and says the typed API ID isn't used`() {
        val context = PatchContexts.of(ExtensionDex.classes())
        val warnings = PatchLogCapture.warnings { savedApiCredentialsPatch.execute(context) }
        assertEquals(warnings.toString(), 1, warnings.size)
        assertTrue(warnings.toString(), warnings.single().startsWith("Sign-in help:"))
    }

    @Test
    fun `sign-in help carries it`() {
        assertTrue(savedApiCredentialsPatch in signInHelpPatch.dependencies)
    }

    private fun Method.isPerAccountConstructor() = origName == "<init>" && parameterTypes.map { it.toString() } == listOf("I")
}

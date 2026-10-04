/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.misc.optimizer

import app.morphe.Fixtures
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder

/** Applies the real patch. Shape-only optimizer tests did not detect push shutdown under All. */
class BackgroundPushSetupTest {
    @get:Rule val temporary = TemporaryFolder()

    @Test
    fun `old selections gain an optional push choice that stays off under All`() {
        assertEquals("Limit background traffic", networkTrafficGovernorPatch.name)
        assertFalse(networkTrafficGovernorPatch.default)
        val option = networkTrafficGovernorPatch.options["skipPushSetup"]
        assertEquals(false, option.default)
        assertFalse(option.required)
        option.reset()
        assertEquals(false, option.value)
    }

    @Test
    fun `missing false and null options keep complete push setup on every declared host`() {
        val option = networkTrafficGovernorPatch.options.values.singleOrNull { it.name == "skipPushSetup" }
        try {
            for (value in listOf("missing", "false", "null")) {
                option?.reset()
                if (value == "false") networkTrafficGovernorPatch.options.set("skipPushSetup", false)
                if (value == "null") networkTrafficGovernorPatch.options.set<Boolean>("skipPushSetup", null)
                Fixtures.forEachDeclared { apk ->
                    val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
                    val original = container.dexEntryNames.asSequence()
                        .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
                        .single { it.type == PUSH_OWNER }
                    val before = encoded(original)
                    var checked = false
                    val probe = bytecodePatch(name = "push setup preservation probe") {
                        dependsOn(networkTrafficGovernorPatch)
                        execute {
                            assertArrayEquals("${apk.name}: push setup changed with $value", before,
                                encoded(classDefBy(PUSH_OWNER)))
                            val buffer = BufferPreloadGateFingerprint.method.implementation!!.instructions.toList()
                            assertEquals(Opcode.CONST_4, buffer[0].opcode)
                            assertEquals(0, (buffer[0] as NarrowLiteralInstruction).narrowLiteral)
                            assertEquals(Opcode.RETURN, buffer[1].opcode)
                            checked = true
                        }
                    }
                    Patcher(PatcherConfig(apk, temporary.newFolder())).use { patcher ->
                        patcher += setOf(probe)
                        runBlocking { patcher().collect { result -> result.exception?.let { throw it } } }
                    }
                    assertTrue("${apk.name}: preservation probe never ran", checked)
                }
            }
        } finally {
            option?.reset()
        }
    }

    @Test
    fun `push shutdown requires an explicit true option on every declared host`() {
        val option = networkTrafficGovernorPatch.options.values.singleOrNull { it.name == "skipPushSetup" }
        try {
            networkTrafficGovernorPatch.options.set("skipPushSetup", true)
            Fixtures.forEachDeclared { apk ->
                var checked = false
                val probe = bytecodePatch(name = "explicit push shutdown probe") {
                    dependsOn(networkTrafficGovernorPatch)
                    execute {
                        val push = InitPushTaskFingerprint.method.implementation!!.instructions.toList()
                        assertEquals(Opcode.RETURN_VOID, push.first().opcode)
                        assertTrue("the original task body was erased", push.size > 1)
                        val buffer = BufferPreloadGateFingerprint.method.implementation!!.instructions.toList()
                        assertEquals(Opcode.CONST_4, buffer[0].opcode)
                        assertEquals(0, (buffer[0] as NarrowLiteralInstruction).narrowLiteral)
                        assertEquals(Opcode.RETURN, buffer[1].opcode)
                        checked = true
                    }
                }
                Patcher(PatcherConfig(apk, temporary.newFolder())).use { patcher ->
                    patcher += setOf(probe)
                    runBlocking { patcher().collect { result -> result.exception?.let { throw it } } }
                }
                assertTrue("${apk.name}: shutdown probe never ran", checked)
            }
        } finally {
            option?.reset()
        }
    }

    private fun encoded(classDef: ClassDef): ByteArray {
        val output = MemoryDataStore()
        try {
            DexPool(Opcodes.getDefault()).apply { internClass(classDef) }.writeTo(output)
            return output.data
        } finally {
            output.close()
        }
    }

    private companion object {
        const val PUSH_OWNER = "Lcom/ss/android/ugc/aweme/legoImp/task/InitPushTask;"
    }
}


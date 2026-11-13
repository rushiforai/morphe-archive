/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.sim

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.threads.misc.extension.PatchLogCapture
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Spoof SIM region on each declared build: Threads reads its SIM's country and network code, and
 * after the patch every kept answer of those reads goes through the extension and lands back in
 * the register Threads read it into, with nothing else in those methods moved.
 */
class SpoofSimRegionFixtureTest {
    private fun String.isTelephony() = this == TELEPHONY || this == SUBSCRIPTION || startsWith(CELL)

    @Test
    fun `each hook the reads name takes and answers its own type`() {
        val extension = ExtensionDex.classDef(SIM_REGION)
        for (read in TELEPHONY_READS + SUBSCRIPTION_READS + CELL_READS) {
            val hook = extension.methods.single { it.name == read.hook && it.returnType == read.type }
            assertTrue(read.hook, AccessFlags.STATIC.isSet(hook.accessFlags) && AccessFlags.PUBLIC.isSet(hook.accessFlags))
            assertEquals(read.hook, listOf(read.type), hook.parameterTypes.map { it.toString() })
        }
    }

    @Test
    fun `each declared build reads its SIM, and every kept answer goes through the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val classes = FixtureDex.classesWhere(build, { dex -> dex.typeSection.any { it.toString().isTelephony() } }) { method ->
                simReads(method).isNotEmpty()
            }
            val readers = classes.flatMap { it.methods }.filter { simReads(it).isNotEmpty() }
            val names = readers.flatMap { simReads(it) }.map { (_, read) -> read.name }.toSet()
            for (name in listOf("getSimCountryIso", "getNetworkCountryIso", "getSimOperator", "getNetworkOperator")) {
                assertTrue("$where: Threads keeps the answer of $name", name in names)
            }

            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val warnings = PatchLogCapture.warnings { spoofSimRegionPatch.execute(context) }
            assertEquals("$where: the patch log", emptyList<String>(), warnings)

            var hooks = 0
            for (reader in readers) {
                val reads = simReads(reader)
                val now = context.mutableClassDefBy(reader.definingClass).methods
                    .single { it.name == reader.name && it.params() == reader.params() && it.returnType == reader.returnType }
                    .instructions()
                // Payload alignment nops move when code grows, so they're left out of both counts.
                assertEquals("$where: ${reader.name}: two added per read",
                    reader.instructions().count { it.opcode != Opcode.NOP } + 2 * reads.size, now.count { it.opcode != Opcode.NOP })
                val answered = now.indices.filter { now[it].isSimHook() }
                assertEquals("$where: ${reader.name}: reads answered", reads.size, answered.size)
                for (index in answered) {
                    val kept = now[index - 1] as OneRegisterInstruction
                    val read = simRead((now[index - 2] as ReferenceInstruction).reference as MethodReference)!!
                    val call = now[index] as RegisterRangeInstruction
                    assertEquals("$where: ${reader.name} at $index: the hook for ${read.name}",
                        "$SIM_REGION->${read.hook}(${read.type})${read.type}", (call as ReferenceInstruction).reference.toString())
                    assertEquals("$where: ${reader.name} at $index: it reads what Threads kept", kept.registerA, call.startRegister)
                    assertEquals(1, call.registerCount)
                    val back = now[index + 1]
                    assertEquals("$where: ${reader.name} at $index: then its answer", (kept as Instruction).opcode, back.opcode)
                    assertEquals("$where: ${reader.name} at $index: back in the same register", kept.registerA, (back as OneRegisterInstruction).registerA)
                }
                hooks += answered.size
            }
            assertEquals("$where: every hook the patch added", readers.sumOf { simReads(it).size }, hooks)
            // The extension calls SimRegion itself, so its own calls are counted before and after.
            val ownCalls = ExtensionDex.classes().sumOf { classDef ->
                classDef.methods.sumOf { method -> method.instructions().count { it.isSimHook() } }
            }
            val extensionCalls = ExtensionDex.classes().sumOf { classDef ->
                context.mutableClassDefBy(classDef.type).methods.sumOf { method -> method.instructions().count { it.isSimHook() } }
            }
            assertEquals("$where: hooks put into the extension", ownCalls, extensionCalls)

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "spoofSimRegion" }.instructions()
            assertEquals("$where: SettingsStatus.spoofSimRegion() answers true", Opcode.CONST_4, status[0].opcode)
            assertEquals(1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
        }
    }

    @Test
    fun `a build with no SIM read left refuses and changes nothing`() {
        val context = PatchContexts.of(ExtensionDex.classes())
        val thrown = assertThrows(PatchException::class.java) { spoofSimRegionPatch.execute(context) }
        assertTrue(thrown.message.orEmpty(), thrown.message.orEmpty().contains("reads no SIM"))
        val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "spoofSimRegion" }.instructions()
        assertEquals("the switch stays hidden", 0, (status[0] as NarrowLiteralInstruction).narrowLiteral)
    }

    private fun Instruction.isSimHook(): Boolean =
        (opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE) &&
            ((this as ReferenceInstruction).reference as? MethodReference)?.definingClass == SIM_REGION

    private fun Method.params(): List<String> = parameterTypes.map { it.toString() }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList() ?: emptyList()
}

/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.mature

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

@Category(FixtureTests::class)
class MatureContentFixtureTest {
    private val types = setOf(MATURE_USER, "Lcom/tumblr/rumblr/model/UserInfo;", MATURE_AGE,
        MATURE_AGE.removeSuffix(";") + "JsonAdapter;", MATURE_GATE, "Ls7n;", MATURE_REPOSITORY,
        MATURE_NATIVE_SERVICE, MATURE_PERMISSION, MATURE_PERMISSION.removeSuffix(";") + "JsonAdapter;",
        MATURE_API_RESPONSE, MATURE_METADATA, "Lox5;", "Lo68;", "Lu3b;", "Lw3b;")

    @Test
    fun `only native cover returns change and every branch reaches the account gate`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, types)
            assertEquals(types, classes.keys)
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
            val plan = context.resolveMatureReveal()
            val cover = plan.cover.instructionList().map(ImmutableInstruction::of)
            val parser = plan.ageParser.instructionList().map(ImmutableInstruction::of)
            val permissionParser = plan.permissionParser.instructionList().map(ImmutableInstruction::of)
            val repository = plan.repository.instructionList().map(::fingerprint)
            val unchanged = classes.filterKeys { it !in setOf(MATURE_GATE, MATURE_AGE.removeSuffix(";") + "JsonAdapter;", MATURE_PERMISSION.removeSuffix(";") + "JsonAdapter;", MATURE_REPOSITORY) }
                .flatMap { (_, owner) -> owner.methods.map { method -> method.toString() to method.instructionList().map(::fingerprint) } }.toMap()
            revealAllowedMatureContentPatch.execute(context)
            assertOnlyInserted(cover, plan.cover.instructionList(), MATURE_COVER, 2)
            assertEquals(4, plan.cover.instructionList().count { it.methodRef()?.toString() == MATURE_COVER })
            assertOnlyInserted(parser, plan.ageParser.instructionList(), MATURE_AGE_PARSED, 1)
            val ageHooks = plan.ageParser.instructionList().filter { it.methodRef()?.toString() == MATURE_AGE_PARSED }
            assertEquals(listOf(listOf(14, 9), listOf(4, 9)), ageHooks.map { it.namedRegisters() })
            assertOnlyInserted(permissionParser, plan.permissionParser.instructionList(), MATURE_PERMISSION_PARSED, 1)
            assertEquals(listOf(listOf(2, 11), listOf(3, 11)), plan.permissionParser.instructionList().filter {
                it.methodRef()?.toString() == MATURE_PERMISSION_PARSED }.map { it.namedRegisters() })
            val ctor = plan.repository.instructionList()
            assertEquals(repository.dropLast(1), ctor.take(13).map(::fingerprint))
            assertEquals(Opcode.NEW_INSTANCE, ctor[13].opcode)
            assertEquals(listOf(0), ctor[13].namedRegisters())
            assertEquals("$MATURE_REQUESTER-><init>(Ljava/lang/Object;)V", ctor[14].methodRef().toString())
            assertEquals(listOf(0, 8), ctor[14].namedRegisters())
            assertEquals(MATURE_SERVICE_CAPTURE, ctor[15].methodRef().toString())
            assertEquals(repository.last(), fingerprint(ctor.last()))
            for ((descriptor, original) in unchanged) {
                val owner = descriptor.substringBefore("->")
                assertEquals(descriptor, original, context.mutableClassDefBy(owner).methods.single { it.toString() == descriptor }
                    .instructionList().map(::fingerprint))
            }
            for (bridge in plan.bridges) assertTrue(bridge.contract in context.mutableClassDefBy(bridge.methods.first().definingClass).interfaces)
            assertEquals("$MATURE_PERMISSION->f()Ljava/lang/Boolean;", context.mutableClassDefBy(MATURE_PERMISSION).methods.single {
                it.name == "hushShowMatureContent"
            }.instructionList().first().methodRef().toString())
            assertEquals("$MATURE_PERMISSION->b()Ljava/lang/Boolean;", context.mutableClassDefBy(MATURE_PERMISSION).methods.single {
                it.name == "hushCanEditMatureContent"
            }.instructionList().first().methodRef().toString())
            status(context, 1)
        }
    }

    @Test
    fun `native requester handles immediate and suspended GET results without invoking any setter`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, types)
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
            revealAllowedMatureContentPatch.execute(context)
            val fetch = context.mutableClassDefBy(MATURE_REQUESTER).methods.single { it.name == "hushFetchMaturePermission" }
            val body = fetch.instructionList()
            assertEquals(6, fetch.implementation!!.registerCount)
            assertEquals(listOf(Opcode.IGET_OBJECT, Opcode.CHECK_CAST, Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT,
                Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT,
                Opcode.IF_EQ, Opcode.INVOKE_STATIC, Opcode.RETURN_VOID), body.map { it.opcode })
            assertEquals("$MATURE_NATIVE_SERVICE->getCommunityLabelUserConfig(Lox5;)Ljava/lang/Object;", body[4].methodRef().toString())
            assertEquals(listOf(0, 1), body[4].namedRegisters())
            assertEquals("Lu3b;->g()Ljava/lang/Object;", body[6].methodRef().toString())
            assertEquals(10, target(body, 8))
            assertEquals(MATURE_RECEIVED, body[9].methodRef().toString())
            assertEquals(listOf(5, 2), body[9].namedRegisters())
            assertFalse(body.any { it.methodRef()?.name == "setCommunityLabelUserConfig" })
            val continuation = context.mutableClassDefBy(MATURE_CONTINUATION)
            assertTrue("Lox5;" in continuation.interfaces)
            val coroutineContext = continuation.methods.single { it.name == "getContext" }
            assertEquals("Ll86;", coroutineContext.returnType)
            assertEquals("Lo68;->a:Lo68;", coroutineContext.instructionList().first().fieldRef().toString())
        }
    }

    @Test
    fun `missing raw permission getter age mask NSFW gate or GET refuses before mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, types)
            val faults: List<(BytecodePatchContext) -> Unit> = listOf(
                { context ->
                    val writer = context.mutableClassDefBy(MATURE_PERMISSION.removeSuffix(";") + "JsonAdapter;").methods.single { it.name == "toJson" }
                    val body = writer.instructionList()
                    val key = body.indexOfFirst { it.stringRef() == "show_mature_content" }
                    val getter = body.indices.first { it > key && body[it].methodRef()?.definingClass == MATURE_PERMISSION }
                    writer.replaceInstruction(getter, "nop")
                },
                { context -> context.mutableClassDefBy(MATURE_AGE.removeSuffix(";") + "JsonAdapter;").methods.single {
                    it.name == "fromJson"
                }.replaceInstruction(65, "and-int/lit8 v9, v9, -0x3") },
                { context ->
                    val owner = context.mutableClassDefBy(MATURE_NATIVE_SERVICE)
                    owner.methods.removeAll { it.name == "getCommunityLabelUserConfig" }
                },
                { context -> context.mutableClassDefBy("Ls7n;").methods.single { it.name == "b" }
                    .replaceInstruction(5, "const/4 v0, 0x0") },
                { context -> context.mutableClassDefBy("Lcom/tumblr/rumblr/model/UserInfo;").methods.single {
                    it.name == "<init>" && it.parameterTypes.size == 46
                }.replaceInstruction(25, "move v15, v4") },
                { context -> context.mutableClassDefBy(MATURE_PERMISSION.removeSuffix(";") + "JsonAdapter;").methods.single {
                    it.name == "fromJson"
                }.replaceInstruction(41, "and-int/lit8 v11, v11, -0x21") },
            )
            for (fault in faults) {
                val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
                fault(context)
                assertThrows(PatchException::class.java) { revealAllowedMatureContentPatch.execute(context) }
                assertFalse("Lapp/hushtumblr/extension/tumblr/mature/HushMatureAccount;" in context.mutableClassDefBy(MATURE_USER).interfaces)
                assertFalse("Lox5;" in context.mutableClassDefBy(MATURE_CONTINUATION).interfaces)
                assertFalse(context.mutableClassDefBy(MATURE_GATE).methods.single { it.name == "k" }.instructionList()
                    .any { it.methodRef()?.toString() == MATURE_COVER })
                status(context, 0)
            }
        }
    }

    private fun status(context: BytecodePatchContext, value: Int) {
        for (name in listOf("revealAllowedMatureContent", "accountSafeMatureReveal")) assertEquals(value,
            (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.instructionList().first()
                as NarrowLiteralInstruction).narrowLiteral)
    }
    private fun fingerprint(instruction: Instruction): String = listOf(instruction.opcode, instruction.namedRegisters(),
        instruction.methodRef()?.toString(), instruction.fieldRef()?.toString(), instruction.stringRef(),
        (instruction as? NarrowLiteralInstruction)?.narrowLiteral).toString()
    private fun target(body: List<Instruction>, index: Int): Int {
        val addresses = body.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        return addresses.indexOf(addresses[index] + (body[index] as OffsetInstruction).codeOffset)
    }
    private fun assertOnlyInserted(clean: List<Instruction>, changed: List<Instruction>, hook: String, length: Int) {
        val projected = mutableListOf<Instruction>()
        val originalIndex = mutableMapOf<Int, Int>()
        var index = 0
        while (index < changed.size) {
            originalIndex[index] = projected.size
            if (changed[index].methodRef()?.toString() == hook) index += length
            else { projected += changed[index]; index++ }
        }
        assertEquals(clean.map(::fingerprint), projected.map(::fingerprint))
        for ((changedIndex, cleanIndex) in originalIndex) {
            if (changed[changedIndex] !is OffsetInstruction) continue
            assertEquals("branch at native instruction $cleanIndex", target(clean, cleanIndex), originalIndex[target(changed, changedIndex)])
        }
    }
}

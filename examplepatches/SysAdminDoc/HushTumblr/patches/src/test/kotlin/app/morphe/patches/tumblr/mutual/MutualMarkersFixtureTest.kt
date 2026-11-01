/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.mutual

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.tumblr.lookup.*
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction
import org.junit.Assert.*
import org.junit.Test
import org.junit.experimental.categories.Category

@Category(FixtureTests::class)
class MutualMarkersFixtureTest {
    private val types = setOf(MUTUAL_HEADER, MUTUAL_USER, MUTUAL_PRIMARY, MUTUAL_SHORT, "Lcom/tumblr/rumblr/model/blog/BlogInfo;",
        MUTUAL_BLOG, MUTUAL_FOLLOWER, MUTUAL_PAGE, MUTUAL_PAGINATION, MUTUAL_LINK, MUTUAL_RESPONSE, MUTUAL_METADATA,
        MUTUAL_SERVICE, "Lcom/tumblr/ui/fragment/FollowerFragment;", "Lcom/tumblr/CoreApp;", "Lretrofit2/Call;", "Lretrofit2/Response;", "Lvsl;") +
        listOf(MUTUAL_PRIMARY, MUTUAL_SHORT, MUTUAL_FOLLOWER, MUTUAL_PAGE, MUTUAL_PAGINATION).map { it.removeSuffix(";") + "JsonAdapter;" }

    @Test fun `native name badges follow actions and accessibility remain intact around three hooks`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, types); assertEquals(types, classes.keys)
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
            val plan = context.resolveMutualMarkers()
            val watched = listOf(plan.bind, plan.fullBind, plan.detach).associate { it.toString() to it.instructionList().map(ImmutableInstruction::of) }
            val untouched = classes.values.flatMap { it.methods }.filter { it.toString() !in watched }.associate {
                it.toString() to it.instructionList().map(::fingerprint)
            }
            showMutualMarkersPatch.execute(context)
            for ((descriptor, original) in watched) {
                val actual = context.mutableClassDefBy(descriptor.substringBefore("->")).methods.single { it.toString() == descriptor }.instructionList()
                assertOnlyHook(original, actual, if (descriptor == plan.bind.toString()) MUTUAL_BIND else MUTUAL_CLEAR)
            }
            assertEquals(listOf(0, 5, 13), plan.bind.instructionList()[106].namedRegisters())
            assertEquals(MUTUAL_CLEAR, plan.fullBind.instructionList().first().methodRef().toString())
            assertEquals(listOf(16), plan.fullBind.instructionList().first().namedRegisters())
            assertEquals(MUTUAL_CLEAR, plan.detach.instructionList().first().methodRef().toString())
            for ((descriptor, original) in untouched) assertEquals(descriptor, original,
                context.mutableClassDefBy(descriptor.substringBefore("->")).methods.single { it.toString() == descriptor }.instructionList().map(::fingerprint))
            for (bridge in plan.bridges) assertTrue(bridge.contract in context.mutableClassDefBy(bridge.owner).interfaces)
            status(context, 1)
        }
    }
    @Test fun `only GET followers are read with bounded native timeout and explicit cancel`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, types).values)
            showMutualMarkersPatch.execute(context)
            val source = context.mutableClassDefBy(MUTUAL_SOURCE)
            for ((name, native) in listOf("first" to "followers", "next" to "followersPagination")) {
                val method = source.methods.single { it.name == name }; val code = method.instructionList()
                assertEquals(4, method.implementation!!.registerCount); assertEquals(6, code.size)
                assertEquals("Lcom/tumblr/CoreApp;->Z()$MUTUAL_SERVICE", code[0].methodRef().toString())
                assertEquals(Opcode.INVOKE_INTERFACE, code[3].opcode)
                assertEquals("$MUTUAL_SERVICE->$native(Ljava/lang/String;Ljava/lang/String;)Lretrofit2/Call;", code[3].methodRef().toString())
                assertEquals(listOf(0, 3, 1), code[3].namedRegisters())
            }
            val execute = source.methods.single { it.name == "execute" }; val body = execute.instructionList()
            assertEquals(8, execute.implementation!!.registerCount); assertEquals(16, body.size)
            assertEquals("Lvsl;->timeout(JLjava/util/concurrent/TimeUnit;)Lvsl;", body[5].methodRef().toString())
            assertEquals(listOf(1, 6, 7, 2), body[5].namedRegisters())
            assertEquals("Lretrofit2/Call;->execute()Lretrofit2/Response;", body[6].methodRef().toString())
            assertEquals(14, target(body, 10))
            assertEquals("Lretrofit2/Response;->body()Ljava/lang/Object;", body[11].methodRef().toString())
            val cancel = source.methods.single { it.name == "cancel" }.instructionList()
            assertEquals(3, cancel.size); assertEquals(Opcode.INVOKE_INTERFACE, cancel[1].opcode)
            assertEquals("Lretrofit2/Call;->cancel()V", cancel[1].methodRef().toString())
            assertTrue(source.methods.flatMap { it.instructionList() }.mapNotNull { it.methodRef() }
                .none { it.name in setOf("follow", "unfollow", "mutePost", "block") })
        }
    }
    @Test fun `missing account fields unsafe defaults name provenance or read ABI refuses before mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, types)
            val faults: List<(BytecodePatchContext) -> Unit> = listOf(
                { c -> c.mutableClassDefBy(MUTUAL_HEADER).methods.single { it.name == "t2" }.replaceInstruction(104,
                    "iget-object v0, v15, $MUTUAL_HEADER->H:Landroid/widget/TextView;") },
                { c -> c.mutableClassDefBy(MUTUAL_USER).methods.single { it.name == "<init>" && it.parameterTypes == listOf("Lcom/tumblr/rumblr/response/UserInfoResponse;") }
                    .replaceInstruction(41, "iput-object v0, p0, $MUTUAL_USER->j:Ljava/util/List;") },
                { c -> c.mutableClassDefBy(MUTUAL_PRIMARY).methods.single { it.name == "<init>" && AccessFlags.SYNTHETIC.isSet(it.accessFlags) }
                    .replaceInstruction(201, "move/from16 v49, v2") },
                { c -> val method = c.mutableClassDefBy(MUTUAL_PRIMARY).methods.single { it.name == "<init>" && AccessFlags.SYNTHETIC.isSet(it.accessFlags) }
                    val body = method.implementation as MutableMethodImplementation
                    body.replaceInstruction(200, BuilderInstruction21t(Opcode.IF_EQZ, 0, body.newLabelForIndex(204))) },
                { c -> c.mutableClassDefBy(MUTUAL_PRIMARY).methods.single { it.name == "<init>" && !AccessFlags.SYNTHETIC.isSet(it.accessFlags) }
                    .replaceInstruction(58, "move/from16 v1, v95") },
                { c -> c.mutableClassDefBy(MUTUAL_FOLLOWER).methods.single { it.name == "<init>" && it.parameterTypes.size == 7 }
                    .replaceInstruction(12, "const/4 v6, 0x1") },
                { c -> val method = c.mutableClassDefBy(MUTUAL_FOLLOWER).methods.single { it.name == "<init>" && AccessFlags.SYNTHETIC.isSet(it.accessFlags) }
                    val body = method.implementation as MutableMethodImplementation
                    body.replaceInstruction(11, BuilderInstruction21t(Opcode.IF_EQZ, 9, body.newLabelForIndex(16))) },
                { c -> c.mutableClassDefBy(MUTUAL_BLOG).methods.single { it.name == "W0" }.replaceInstruction(39,
                    "invoke-virtual { p0 }, $MUTUAL_SHORT->m()Ljava/lang/String;") },
                { c -> c.mutableClassDefBy(MUTUAL_SERVICE).methods.removeAll { it.name == "followersPagination" } },
                { c -> c.mutableClassDefBy("Lvsl;").methods.removeAll { it.name == "timeout" } },
            )
            for (fault in faults) {
                val context = PatchContexts.of(ExtensionDex.classes() + classes.values); fault(context)
                assertThrows(PatchException::class.java) { showMutualMarkersPatch.execute(context) }
                assertFalse("Lapp/hushtumblr/extension/tumblr/mutual/HushMutualHeader;" in context.mutableClassDefBy(MUTUAL_HEADER).interfaces)
                assertFalse(context.mutableClassDefBy(MUTUAL_HEADER).methods.single { it.name == "t2" }.instructionList().any { it.methodRef()?.toString() == MUTUAL_BIND })
                status(context, 0)
            }
        }
    }
    private fun status(context: BytecodePatchContext, expected: Int) {
        for (name in listOf("showMutualMarkers", "primaryBlogMutuals")) assertEquals(expected,
            (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }
    private fun fingerprint(i: Instruction): String = listOf(i.opcode, i.namedRegisters(), i.methodRef()?.toString(), i.fieldRef()?.toString(), i.stringRef(),
        (i as? NarrowLiteralInstruction)?.narrowLiteral).toString()
    private fun target(body: List<Instruction>, index: Int): Int {
        val addresses = body.runningFold(0) { address, i -> address + i.codeUnits }
        return addresses.indexOf(addresses[index] + (body[index] as OffsetInstruction).codeOffset)
    }
    private fun assertOnlyHook(clean: List<Instruction>, changed: List<Instruction>, hook: String) {
        val projected = mutableListOf<Instruction>(); val nativeIndex = mutableMapOf<Int, Int>()
        for ((index, instruction) in changed.withIndex()) { nativeIndex[index] = projected.size; if (instruction.methodRef()?.toString() != hook) projected += instruction }
        assertEquals(clean.map(::fingerprint), projected.map(::fingerprint))
        for ((changedIndex, cleanIndex) in nativeIndex) if (changed[changedIndex] is OffsetInstruction)
            assertEquals("native branch $cleanIndex", target(clean, cleanIndex), nativeIndex[target(changed, changedIndex)])
    }
}

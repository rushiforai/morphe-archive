/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.drafts

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

/** The builders' classes and the classes they hand work to are the whole context; nothing else is a target. */
class DisableDraftPreviewsFixtureTest {
    @Test
    fun `every compose builder is gated before its request and keeps its stock flow`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            val hooks = context.resolveDraftPreviewHooks()
            assertEquals("${build.name}: complete compose coverage", DraftPreviewTarget.entries.toSet(), hooks.keys)
            val before = hooks.mapValues { ImmutableMethod.of(it.value.method) }
            val excluded = context.excludedBuilders().associateWith { it.instructions().map(::operation) }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { disableDraftPreviewsPatch.execute(context) })

            for ((target, hook) in hooks) {
                val original = before.getValue(target)
                val old = original.instructions()
                val after = hook.method.instructions()
                val guard = after.subList(hook.index, hook.index + hook.size)
                assertEquals("${build.name}: $target guard method", "$DRAFT_PREVIEWS->${target.hook}()Z", guard[0].reference())
                // dexlib2 adds or drops the nop that aligns a switch table when a hook's length is odd,
                // as the bot share guard's is, so the stock code is matched with that padding left out.
                val kept = old.indices.filterNot { old.isPadding(it) }
                val now = after.indices.filterNot { after.isPadding(it) || it in hook.index until hook.index + hook.size }
                assertEquals("${build.name}: $target keeps every original operation", kept.map { operation(old[it]) },
                    now.map { operation(after[it]) })
                val oldFlow = ControlFlow.of(original)
                val newFlow = ControlFlow.of(hook.method)
                val movedTo = kept.zip(now).toMap()
                fun moved(index: Int) = movedTo.getValue(index)
                for (index in kept) {
                    assertEquals("${build.name}: $target keeps stock flow from $index",
                        oldFlow.normal[index].map { if (it == hook.index) hook.index else moved(it) }, newFlow.normal[moved(index)])
                }
                if (target == DraftPreviewTarget.BOT_SHARE) {
                    assertEquals("${build.name}: bot share guard", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
                        Opcode.MOVE_OBJECT_FROM16, Opcode.CONST_4, Opcode.INVOKE_VIRTUAL, Opcode.GOTO_16, Opcode.NOP), guard.map { it.opcode })
                    val callback = old.subList(0, hook.index).last { it.opcode == Opcode.NEW_INSTANCE }
                    assertEquals("${build.name}: a skip hands the callback no preview", "${callback.reference()}->run(Ljava/lang/Object;)V", guard[5].reference())
                    assertEquals("${build.name}: false fetches as before", listOf(hook.index + 7), newFlow.normal[hook.index + 2].filter { it != hook.index + 3 })
                    assertEquals("${build.name}: a skip leaves through the request's own exit", listOf(moved(hook.finish)), newFlow.normal[hook.index + 6])
                } else if (target == DraftPreviewTarget.CHAT || target == DraftPreviewTarget.SHARE) {
                    // A skip leaves the found links as a draft with none leaves them: null in chat,
                    // an emptied list on the share sheet, the same field the builder stores them in.
                    val forget = if (target == DraftPreviewTarget.CHAT) listOf(Opcode.CONST_4, Opcode.IPUT_OBJECT)
                        else listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL)
                    assertEquals("${build.name}: $target exact guard", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ) + forget +
                        listOf(Opcode.GOTO_16, Opcode.NOP), guard.map { it.opcode })
                    val stored = old.filter { (it.opcode == Opcode.IPUT_OBJECT || it.opcode == Opcode.IGET_OBJECT) &&
                        (it as ReferenceInstruction).reference.let { field -> field is FieldReference && field.definingClass == original.definingClass &&
                            field.type == "Ljava/util/ArrayList;" } }.map { it.reference() }.distinct()
                    val forgotten = guard[if (target == DraftPreviewTarget.CHAT) 4 else 3].reference()
                    assertEquals("${build.name}: $target forgets the links it stored", listOf(forgotten), stored)
                    if (target == DraftPreviewTarget.SHARE) {
                        assertEquals("${build.name}: share empties that list", "Ljava/util/ArrayList;->clear()V", guard[4].reference())
                    }
                    assertEquals("${build.name}: $target false fetches as before", listOf(hook.index + 6), newFlow.normal[hook.index + 2].filter { it != hook.index + 3 })
                    assertEquals("${build.name}: $target skip leaves through the no-preview exit", listOf(moved(hook.finish)), newFlow.normal[hook.index + 5])
                } else {
                    assertEquals("${build.name}: $target exact guard", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ),
                        guard.map { it.opcode })
                    assertTrue("${build.name}: $target true reaches the no-preview exit", moved(hook.finish) in newFlow.normal[hook.index + 2])
                    assertTrue("${build.name}: $target false reaches the original code", hook.index + 3 in newFlow.normal[hook.index + 2])
                }
                // The skip goes where the builder already goes for a draft it doesn't fetch for.
                val request = requestOf(target, original)
                assertTrue("${build.name}: $target skip target is a stock no-request path",
                    hook.finish in reachable(oldFlow, 0, request))
                assertFalse("${build.name}: $target reaches its request without passing its guard",
                    moved(request) in reachable(newFlow, 0, hook.index))
            }
            for ((method, operations) in excluded) {
                assertEquals("${build.name}: leaves ${method.definingClass}->${method.name} alone", operations,
                    context.mutableClassDefBy(method.definingClass).methods.single { it.sameSignature(method) }.instructions().map(::operation))
            }
            for (flag in listOf("disableDraftPreviews") + DraftPreviewTarget.entries.map { it.capability }) {
                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.instructions()
                assertEquals("${build.name}: $flag build fact", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals(Opcode.RETURN, status[1].opcode)
            }
        }
    }

    @Test
    fun `the census has five compose builders, Browser and the received-preview refresh`() {
        for (build in Fixtures.declaredBuilds()) {
            val builders = FixtureDex.methodsWhere(build, { true }) { it.constructs(WEB_PAGE_PREVIEW) }
            assertEquals("${build.name}: every preview request builder", 7, builders.size)
            assertEquals("${build.name}: received previews refresh", 1, builders.count {
                it.definingClass == "Lorg/telegram/messenger/MessagesController;" && it.name == "reloadWebPages" })
            assertEquals("${build.name}: Browser opens a tapped link", 1, builders.count {
                it.parameterTypes.take(2).map(CharSequence::toString) == listOf("Landroid/content/Context;", "Landroid/net/Uri;") })
        }
    }

    @Test
    fun `the story request runs only from the runnable its URL check posts`() {
        for (build in Fixtures.declaredBuilds()) {
            val story = FixtureDex.methodsWhere(build, { true }) { it.constructs(WEB_PAGE_PREVIEW) &&
                it.parameterTypes.map(CharSequence::toString) == listOf(it.definingClass) }.single()
            val callers = FixtureDex.methodsWhere(build, { true }) { method -> method.instructions().any { it.call()?.let { call ->
                call.definingClass == story.definingClass && call.name == story.name } == true } }
            val runnable = callers.single().definingClass
            assertEquals("${build.name}: only a run() calls the story request", "run", callers.single().name)
            val check = FixtureDex.methodsWhere(build, { true }) { method -> method.definingClass == story.definingClass &&
                method.parameterTypes.map(CharSequence::toString) == listOf(story.definingClass, "Ljava/lang/String;") &&
                method.instructions().any { it.call()?.name == "cancelRunOnUIThread" } }.single()
            val field = check.instructions().map { (it as? ReferenceInstruction)?.reference }.filterIsInstance<FieldReference>()
                .single { it.type == runnable }
            val readers = FixtureDex.methodsWhere(build, { true }) { method -> method.instructions().any { it.opcode == Opcode.IGET_OBJECT &&
                (it as ReferenceInstruction).reference.let { read -> read is FieldReference && read.definingClass == field.definingClass &&
                    read.name == field.name } } }
            assertEquals("${build.name}: only the URL check reads the runnable it posts", listOf(check.name),
                readers.map { it.name })
        }
    }

    @Test
    fun `changed builder geometry refuses every target before any partial mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            for (changed in DraftPreviewTarget.entries) {
                val context = contextFor(build)
                val hooks = context.resolveDraftPreviewHooks()
                val invalid = hooks.getValue(changed)
                invalid.method.replaceInstruction(if (changed == DraftPreviewTarget.STORY) invalid.index - 1 else invalid.finish, "nop")
                assertRefusedUntouched(build.name, "changed $changed", context, hooks)
            }
            // A new compose surface building the request is caught, not left ungated.
            val context = contextFor(build)
            val hooks = context.resolveDraftPreviewHooks()
            val bot = hooks.getValue(DraftPreviewTarget.BOT_SHARE).method.instructions()
            val callback = bot.subList(0, hooks.getValue(DraftPreviewTarget.BOT_SHARE).index).last { it.opcode == Opcode.NEW_INSTANCE }.reference()!!
            context.mutableClassDefBy(callback).methods.single { it.name == "run" }.addInstructions(0, "new-instance v0, $WEB_PAGE_PREVIEW")
            assertRefusedUntouched(build.name, "unknown builder", context, hooks)
        }
    }

    private fun assertRefusedUntouched(build: String, case: String, context: BytecodePatchContext, hooks: Map<DraftPreviewTarget, DraftPreviewHook>) {
        val before = hooks.mapValues { it.value.method.instructions().map(::operation) }
        try {
            disableDraftPreviewsPatch.execute(context)
            fail("$build: $case was accepted")
        } catch (expected: PatchException) {
            assertTrue(expected.message.orEmpty().contains("before editing"))
        }
        for ((target, hook) in hooks) assertEquals("$build: $case doesn't partly mutate $target",
            before.getValue(target), hook.method.instructions().map(::operation))
        for (flag in listOf("disableDraftPreviews") + DraftPreviewTarget.entries.map { it.capability }) {
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.instructions()
            assertEquals("$build: $case leaves $flag false", 0, (status[0] as NarrowLiteralInstruction).narrowLiteral)
        }
    }

    /** Builder classes plus every class their builders and URL checks construct or read, so callbacks and runnables resolve. */
    private fun contextFor(build: java.io.File): BytecodePatchContext {
        val owners = FixtureDex.classesWhere(build, { true }) { it.constructs(WEB_PAGE_PREVIEW) }
        val helpers = owners.flatMap { owner -> owner.methods.filter { method -> method.constructs(WEB_PAGE_PREVIEW) ||
            method.instructions().any { it.call()?.name == "cancelRunOnUIThread" } } }
            .flatMap { method -> method.instructions().mapNotNull { instruction -> when {
                instruction.opcode == Opcode.NEW_INSTANCE -> instruction.reference()
                instruction.opcode == Opcode.IGET_OBJECT -> ((instruction as ReferenceInstruction).reference as FieldReference).type
                else -> null
            } } }
            .filter { it.startsWith("L") && it !in owners.map(ClassDef::getType) }.toSet()
        return PatchContexts.of(ExtensionDex.classes() + owners + FixtureDex.classes(build, helpers).values)
    }

    private fun BytecodePatchContext.excludedBuilders(): List<Method> {
        val found = mutableListOf<Method>()
        classDefForEach { classDef -> classDef.methods.filterTo(found) { method -> method.constructs(WEB_PAGE_PREVIEW) &&
            (method.name == "reloadWebPages" || method.parameterTypes.take(2).map(CharSequence::toString) ==
                listOf("Landroid/content/Context;", "Landroid/net/Uri;")) } }
        assertEquals("both left-alone builders are in the context", 2, found.size)
        return found.map { ImmutableMethod.of(it) }
    }

    private fun requestOf(target: DraftPreviewTarget, method: Method): Int {
        val body = method.instructions()
        return if (target == DraftPreviewTarget.STORY) body.indexOfFirst { it.call()?.let { call ->
            call.name == "runOnUIThread" && call.parameterTypes.size == 2 } == true }
        else body.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.reference() == WEB_PAGE_PREVIEW }
    }

    private fun reachable(flow: ControlFlow, from: Int, blocked: Int): Set<Int> {
        val found = mutableSetOf<Int>()
        val pending = ArrayDeque<Int>()
        pending.add(from)
        while (pending.isNotEmpty()) {
            val index = pending.removeFirst()
            if (index == blocked || !found.add(index)) continue
            pending.addAll(flow.normal[index])
            pending.addAll(flow.exceptional[index])
        }
        return found
    }
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun List<Instruction>.isPadding(index: Int) = this[index].opcode == Opcode.NOP && getOrNull(index + 1)?.opcode in
        setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD)
    private fun Method.constructs(type: String) = instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.reference() == type }
    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun operation(instruction: Instruction) = instruction.opcode to instruction.reference()
    private fun Method.sameSignature(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }
}

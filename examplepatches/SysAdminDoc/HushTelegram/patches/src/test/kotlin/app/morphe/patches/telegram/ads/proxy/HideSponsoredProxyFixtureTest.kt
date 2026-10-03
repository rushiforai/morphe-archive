/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.ads.proxy

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableArrayPayload
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test
import java.io.File

/** Two presentation decisions on official fixtures. Shared requests and cached host objects stay stock. */
class HideSponsoredProxyFixtureTest {
    @Test
    fun `all declared builds filter only cached proxy reinsertion and folder membership`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val plan = context.resolveProxyHooks()
            assertEquals(ProxyTarget.entries.toSet(), plan.hooks.map { it.target }.toSet())
            assertEquals(1, plan.hooks.map { it.method }.distinct().size)
            val original = ImmutableMethod.of(plan.hooks.first().method)
            val before = original.instructions()
            val oldFlow = ControlFlow.of(original)
            hideSponsoredProxyPatch.execute(context)
            val after = plan.hooks.first().method.instructions()
            val newFlow = ControlFlow.of(plan.hooks.first().method)
            val sizes = mapOf(ProxyTarget.CHAT_LIST to 3, ProxyTarget.FILTERS to 2)
            fun start(hook: ProxyHook) = hook.index + plan.hooks.filter { it.index < hook.index }.sumOf { sizes.getValue(it.target) }
            val oldToNew = before.indices.associateWith { old -> old + plan.hooks.filter { it.index <= old }
                .sumOf { sizes.getValue(it.target) } }
            fun destination(old: Int) = plan.hooks.singleOrNull { it.index == old }?.let(::start) ?: oldToNew.getValue(old)
            assertEquals("${build.name}: only five instructions added", before.size + 5, after.size)
            for (old in before.indices) {
                val shifted = oldToNew.getValue(old)
                assertEquals("${build.name}: original instruction $old", operation(before[old]), operation(after[shifted]))
                assertEquals("${build.name}: original flow $old", oldFlow.normal[old].map(::destination), newFlow.normal[shifted])
                assertEquals("${build.name}: original exception flow $old",
                    oldFlow.exceptional[old].map(::destination), newFlow.exceptional[shifted])
            }

            val cached = plan.hooks.single { it.target == ProxyTarget.CHAT_LIST }
            val cachedAt = start(cached)
            val cachedJump = cached.jump ?: error("cached guard has no merge")
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ),
                after.subList(cachedAt, cachedAt + 3).map { it.opcode })
            assertEquals("$PROXY_PROMOTIONS->hideCachedProxyDialog(Ljava/lang/Object;Ljava/lang/Object;)Z", after[cachedAt].reference())
            val stockPromoRead = before[cached.index - 4].namedRegisters()
            assertEquals(listOf(stockPromoRead[1], stockPromoRead[0]), after[cachedAt].namedRegisters())
            assertEquals(after[cachedAt + 1].namedRegisters(), after[cachedAt + 2].namedRegisters())
            assertFalse("${build.name}: cache result keeps the controller and dialog intact",
                after[cachedAt + 1].namedRegisters().single() in after[cachedAt].namedRegisters())
            assertEquals(listOf(oldToNew.getValue(cachedJump), cachedAt + 3), newFlow.normal[cachedAt + 2])
            // The original null and left-channel guards still skip the complete insertion block.
            assertEquals(Opcode.IF_EQZ, before[cached.index - 3].opcode)
            assertEquals(Opcode.IF_EQZ, before[cached.index - 1].opcode)
            assertEquals("$MESSAGES_CONTROLLER->promoDialog:$PROXY_DIALOG", before[cached.index - 4].reference())
            assertEquals("$MESSAGES_CONTROLLER->isLeftPromoChannel:Z", before[cached.index - 2].reference())
            assertTrue(oldFlow.normal[cached.index - 3].contains(cachedJump))
            assertTrue(oldFlow.normal[cached.index - 1].contains(cachedJump))

            val filters = plan.hooks.single { it.target == ProxyTarget.FILTERS }
            val filterAt = start(filters)
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT), after.subList(filterAt, filterAt + 2).map { it.opcode })
            assertEquals("$PROXY_PROMOTIONS->showSelectedDialog(ZLjava/lang/Object;Ljava/lang/Object;)Z", after[filterAt].reference())
            assertEquals(before[filters.index].namedRegisters(), after[filterAt + 1].namedRegisters())
            assertEquals(before[filters.index].namedRegisters().single(), after[filterAt].namedRegisters().first())
            assertEquals(before[filters.index - 4].namedRegisters().single(), after[filterAt].namedRegisters()[1])
            assertEquals(before[filters.index - 2].namedRegisters().last(), after[filterAt].namedRegisters()[2])
            assertEquals(Opcode.IF_EQZ, after[filterAt + 2].opcode)
            assertTrue(newFlow.normal[filterAt + 2].contains(oldToNew.getValue(filters.index + 6)))
            for (hook in plan.hooks) {
                val at = start(hook)
                val count = sizes.getValue(hook.target)
                assertFalse("${build.name}: no external edge bypasses ${hook.target}", newFlow.normal.indices.any { source ->
                    source !in at until at + count && source != at + count - 1 &&
                        (newFlow.normal[source] + newFlow.exceptional[source]).contains(at + count)
                })
            }

            val scope = context.mutableClassDefBy(PROXY_PROMOTIONS).methods.single { it.name == "isSponsoredProxyDialog" }
            val scopeBody = scope.instructions()
            assertEquals(6, scope.implementation!!.registerCount)
            assertEquals("${build.name}: scope contains only the read-only predicate", 27, scopeBody.size)
            assertEquals(listOf(Opcode.INSTANCE_OF, Opcode.IF_EQZ, Opcode.INSTANCE_OF, Opcode.IF_EQZ,
                Opcode.CHECK_CAST, Opcode.CHECK_CAST), scopeBody.take(6).map { it.opcode })
            assertEquals(MESSAGES_CONTROLLER, scopeBody[0].reference())
            assertEquals(PROXY_DIALOG, scopeBody[2].reference())
            assertEquals("$MESSAGES_CONTROLLER->promoDialogType:I", scopeBody[6].reference())
            assertEquals("$MESSAGES_CONTROLLER->PROMO_TYPE_PROXY:I", scopeBody[7].reference())
            assertEquals(Opcode.IF_NE, scopeBody[8].opcode)
            assertEquals("$PROXY_DIALOG->id:J", scopeBody[9].reference())
            assertEquals(Opcode.IF_GEZ, scopeBody[12].opcode)
            assertEquals(0L, (scopeBody[13] as WideLiteralInstruction).wideLiteral)
            assertEquals("$MESSAGES_CONTROLLER->isPromoDialog(JZ)Z", scopeBody[14].reference())
            assertEquals(listOf(4, 0, 1, 2), scopeBody[14].namedRegisters())
            assertEquals(Opcode.IF_EQZ, scopeBody[16].opcode)
            assertEquals(Opcode.NEG_LONG, scopeBody[17].opcode)
            assertEquals("$MESSAGES_CONTROLLER->getChat(Ljava/lang/Long;)$PROXY_CHAT", scopeBody[20].reference())
            assertEquals(listOf(4, 0), scopeBody[20].namedRegisters())
            assertEquals(Opcode.IF_EQZ, scopeBody[22].opcode)
            assertEquals("$PROXY_CHAT->left:Z", scopeBody[23].reference())
            assertEquals(Opcode.RETURN, scopeBody[24].opcode)
            assertEquals(0L, (scopeBody[25] as WideLiteralInstruction).wideLiteral)
            val scopeFlow = ControlFlow.of(scope)
            for (guard in listOf(1, 3, 8, 12, 16, 22)) {
                assertEquals("${build.name}: scope guard $guard fails open", listOf(25, guard + 1), scopeFlow.normal[guard])
            }
            for (index in listOf(6, 7, 9, 23)) {
                val field = (scopeBody[index] as ReferenceInstruction).reference as FieldReference
                val definition = hosts.single { it.type == field.definingClass }.fields.single { it.name == field.name && it.type == field.type }
                assertTrue("${build.name}: bridge uses public ${field.name}", AccessFlags.PUBLIC.isSet(definition.accessFlags))
            }
            for (flag in FLAGS) assertEquals("${build.name}: $flag enabled only after insertion", 1L,
                (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.instructions()[0] as WideLiteralInstruction).wideLiteral)

            val controller = hosts.single { it.type == MESSAGES_CONTROLLER }
            val sharedRequest = controller.methods.single { method -> method.instructions().any {
                it.opcode == Opcode.NEW_INSTANCE && it.reference() == SHARED_PROMO_REQUEST
            } }
            assertTrue(sharedRequest.instructions().any { it.reference() == "proxy_enabled" })
            for (host in hosts) for (method in host.methods) {
                if (host.type == MESSAGES_CONTROLLER && method.signature() == original.signature()) continue
                val current = context.mutableClassDefBy(host.type).methods.single { it.signature() == method.signature() }
                assertEquals("${build.name}: unchanged $method", method.instructions().map(::operation), current.instructions().map(::operation))
            }
            val protocol = hosts.single { it.type == SHARED_PROMO_REQUEST }
            assertTrue("${build.name}: request has no sponsor-only parameter", protocol.fields.all { AccessFlags.STATIC.isSet(it.accessFlags) })
            assertEquals(listOf(Opcode.CONST, Opcode.INVOKE_INTERFACE, Opcode.RETURN_VOID),
                protocol.methods.single { it.name == "serializeToStream" }.instructions().map { it.opcode })
        }
    }

    @Test
    fun `changed cached left-channel guard refuses before either site or scope changes`() = refusal { context, plan ->
        val cached = plan.hooks.single { it.target == ProxyTarget.CHAT_LIST }
        cached.method.replaceInstruction(cached.index - 1, "nop")
    }

    @Test
    fun `cached dialog overwritten by the left flag refuses before either hook changes`() = refusal { context, plan ->
        val cached = plan.hooks.single { it.target == ProxyTarget.CHAT_LIST }
        val promoRead = cached.method.instructions()[cached.index - 4].namedRegisters()
        cached.method.replaceInstruction(cached.index - 2,
            "iget-boolean v${promoRead[0]}, v${promoRead[1]}, $MESSAGES_CONTROLLER->isLeftPromoChannel:Z")
    }

    @Test
    fun `changed folder false branch refuses before either site or scope changes`() = refusal { context, plan ->
        val filters = plan.hooks.single { it.target == ProxyTarget.FILTERS }
        filters.method.replaceInstruction(filters.index, "nop")
    }

    @Test
    fun `changed controller alias refuses rather than scoping another object`() = refusal { context, plan ->
        val sort = plan.hooks.first().method
        val registers = sort.instructions()[0].namedRegisters()
        sort.replaceInstruction(0, "move-object/from16 v${registers[0]}, v${registers[1] + 1}")
    }

    @Test
    fun `ambiguous sorting anchor refuses before any presentation decision changes`() = refusal { context, plan ->
        val method = plan.hooks.first().method
        context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.add(ImmutableMethod(method.definingClass,
            "ambiguousSortingFixture", method.parameters, method.returnType, method.accessFlags,
            method.annotations, method.hiddenApiRestrictions, method.implementation).toMutable())
    }

    @Test
    fun `missing native scope stub refuses before any host hook or build fact changes`() = refusal { context, plan ->
        context.mutableClassDefBy(PROXY_PROMOTIONS).methods.removeAll { it.name == "isSponsoredProxyDialog" }
    }

    @Test
    fun `each missing runtime guard refuses before either hook or scope changes`() {
        for (name in listOf("hideCachedProxyDialog", "showSelectedDialog")) refusal { context, plan ->
            context.mutableClassDefBy(PROXY_PROMOTIONS).methods.removeAll { it.name == name }
        }
    }

    @Test
    fun `each missing build fact refuses before any host or native scope changes`() {
        for (flag in FLAGS) refusal { context, plan ->
            context.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == flag }
        }
    }

    @Test
    fun `static promo type refuses before any host scope or build flag changes`() = refusal { context, _ ->
        val field = context.mutableClassDefBy(MESSAGES_CONTROLLER).fields.single { it.name == "promoDialogType" }
        field.accessFlags = field.accessFlags or AccessFlags.STATIC.value
    }

    @Test
    fun `inaccessible runtime class refuses before any host scope or build flag changes`() = refusal { context, _ ->
        val runtime = context.mutableClassDefBy(PROXY_PROMOTIONS)
        runtime.accessFlags = runtime.accessFlags and AccessFlags.PUBLIC.value.inv()
    }

    @Test
    fun `each instance status method refuses before any host scope or build flag changes`() {
        for (name in FLAGS) refusal { context, _ ->
            val method = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }
            method.accessFlags = method.accessFlags and AccessFlags.STATIC.value.inv()
        }
    }

    @Test
    fun `all remaining instance fields refuse static reads before any mutation`() {
        for ((type, name) in listOf(MESSAGES_CONTROLLER to "promoDialog", MESSAGES_CONTROLLER to "isLeftPromoChannel",
            MESSAGES_CONTROLLER to "allDialogs", PROXY_DIALOG to "id", PROXY_CHAT to "left")) refusal { context, _ ->
            val field = context.mutableClassDefBy(type).fields.single { it.name == name }
            field.accessFlags = field.accessFlags or AccessFlags.STATIC.value
        }
    }

    @Test
    fun `uncallable extension methods refuse before any mutation`() {
        for (name in listOf("hideCachedProxyDialog", "showSelectedDialog", "isSponsoredProxyDialog")) {
            for (flag in listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.ABSTRACT, AccessFlags.NATIVE)) {
                refusal { context, _ ->
                    val method = context.mutableClassDefBy(PROXY_PROMOTIONS).methods.single { it.name == name }
                    method.accessFlags = if (flag in listOf(AccessFlags.PUBLIC, AccessFlags.STATIC))
                        method.accessFlags and flag.value.inv() else method.accessFlags or flag.value
                }
            }
        }
    }

    @Test
    fun `empty cached-dialog runtime refuses before host scope or facts change`() =
        runtimeRefusal("hideCachedProxyDialog", body = emptyList())

    @Test
    fun `empty selected-dialog runtime refuses before host scope or facts change`() =
        runtimeRefusal("showSelectedDialog", body = emptyList())

    @Test
    fun `empty proxy-scope runtime refuses before host scope or facts change`() =
        runtimeRefusal("isSponsoredProxyDialog", body = emptyList())

    @Test
    fun `undersized cached-dialog parameters refuse before host scope or facts change`() =
        runtimeRefusal("hideCachedProxyDialog", registers = 1)

    @Test
    fun `undersized selected-dialog parameters refuse before host scope or facts change`() =
        runtimeRefusal("showSelectedDialog", registers = 2)

    @Test
    fun `undersized proxy-scope parameters refuse before host scope or facts change`() =
        runtimeRefusal("isSponsoredProxyDialog", registers = 1)

    @Test
    fun `data payloads cannot substitute for executable proxy runtime instructions`() {
        for (name in RUNTIME_WORDS.keys) runtimeRefusal(name, body = listOf(ImmutableArrayPayload(4, listOf(1L))))
    }

    @Test
    fun `inaccessible status class and uncallable build flags refuse before any mutation`() {
        refusal { context, _ ->
            val status = context.mutableClassDefBy(SETTINGS_STATUS)
            status.accessFlags = status.accessFlags and AccessFlags.PUBLIC.value.inv()
        }
        for (name in FLAGS) for (flag in listOf(AccessFlags.PUBLIC, AccessFlags.ABSTRACT, AccessFlags.NATIVE)) {
            refusal { context, _ ->
                val method = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }
                method.accessFlags = if (flag == AccessFlags.PUBLIC) method.accessFlags and flag.value.inv()
                    else method.accessFlags or flag.value
            }
        }
    }

    @Test
    fun `empty build facts refuse before any host scope or build flag changes`() {
        for (name in FLAGS) refusal { context, _ ->
            val owner = context.mutableClassDefBy(SETTINGS_STATUS)
            val method = owner.methods.single { it.name == name }
            owner.methods.remove(method)
            owner.methods.add(ImmutableMethod(method.definingClass, method.name, emptyList(), method.returnType,
                method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                ImmutableMethodImplementation(method.implementation!!.registerCount, emptyList(), emptyList(), emptyList())).toMutable())
        }
    }

    private fun runtimeRefusal(name: String, registers: Int? = null, body: List<Instruction>? = null) = refusal { context, _ ->
        val owner = context.mutableClassDefBy(PROXY_PROMOTIONS)
        val method = owner.methods.single { it.name == name }
        val implementation = method.implementation!!
        assertEquals("$name: exact one-word parameter budget", RUNTIME_WORDS.getValue(name), method.parameterTypes.size)
        assertTrue("$name: stock budget is valid", implementation.registerCount >= RUNTIME_WORDS.getValue(name))
        owner.methods.remove(method)
        owner.methods.add(ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
            method.accessFlags, method.annotations, method.hiddenApiRestrictions,
            ImmutableMethodImplementation(registers ?: implementation.registerCount, body ?: implementation.instructions,
                if (body == null) implementation.tryBlocks else emptyList(),
                if (body == null) implementation.debugItems else emptyList())).toMutable())
    }

    private fun refusal(change: (BytecodePatchContext, ProxyPlan) -> Unit) {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val plan = context.resolveProxyHooks()
            change(context, plan)
            val types = hosts.map { it.type } + listOf(PROXY_PROMOTIONS, SETTINGS_STATUS)
            val before = types.associateWith { type -> context.mutableClassDefBy(type).methods.associate {
                it.signature() to it.state()
            } }
            val classBefore = types.associateWith { context.mutableClassDefBy(it).state() }
            try {
                hideSponsoredProxyPatch.execute(context)
                fail("${build.name}: incompatible shape accepted")
            } catch (expected: PatchException) {
                assertTrue(expected.message.orEmpty().isNotBlank())
            }
            for (type in types) assertEquals("${build.name}: no partial edit to $type", before.getValue(type),
                context.mutableClassDefBy(type).methods.associate { it.signature() to it.state() })
            assertEquals("${build.name}: no class, field, method or scope mutation", classBefore,
                types.associateWith { context.mutableClassDefBy(it).state() })
            for (flag in FLAGS) {
                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.singleOrNull { it.name == flag } ?: continue
                val instructions = status.instructions()
                if (instructions.isEmpty()) {
                    assertEquals("${build.name}: invalid empty $flag remains empty", emptyList<Instruction>(), instructions)
                } else {
                    assertEquals("${build.name}: $flag remains false", 0L, (instructions[0] as WideLiteralInstruction).wideLiteral)
                }
            }
        }
    }

    private fun hosts(build: File): List<ClassDef> = FixtureDex.classes(build,
        setOf(MESSAGES_CONTROLLER, PROXY_DIALOG, PROXY_CHAT, SHARED_PROMO_REQUEST,
            MESSAGES_CONTROLLER.dropLast(1) + "\$DialogFilter;")).values.toList()
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Method.signature() = name + parameterTypes.joinToString(prefix = "(", postfix = ")") + returnType
    private fun Method.state(): List<Any?> {
        val flow = implementation?.takeIf { instructions().isNotEmpty() }?.let { ControlFlow.of(this) }
        return listOf(accessFlags, implementation?.registerCount, instructions().map(::operation),
            flow?.normal?.toList(), flow?.exceptional?.toList(),
            instructions().map { listOf(it.codeUnits, (it as? OffsetInstruction)?.codeOffset,
                (it as? SwitchPayload)?.switchElements?.map { element -> element.key to element.offset },
                (it as? ArrayPayload)?.elementWidth, (it as? ArrayPayload)?.arrayElements) },
            implementation?.tryBlocks?.map { listOf(it.startCodeAddress, it.codeUnitCount,
                it.exceptionHandlers.map { handler -> handler.exceptionType to handler.handlerCodeAddress }) })
    }
    private fun ClassDef.state() = listOf(accessFlags,
        fields.map { listOf(it.name, it.type, it.accessFlags, it.initialValue) },
        methods.map { it.signature() to it.state() })
    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun operation(instruction: Instruction) = listOf(instruction.opcode, instruction.namedRegisters(),
        instruction.reference(), (instruction as? WideLiteralInstruction)?.wideLiteral)
    private companion object {
        val FLAGS = listOf("hideSponsoredProxy", "cachedProxyDialog", "cachedProxyFilters")
        val RUNTIME_WORDS = mapOf("hideCachedProxyDialog" to 2, "showSelectedDialog" to 3, "isSponsoredProxyDialog" to 2)
    }
}

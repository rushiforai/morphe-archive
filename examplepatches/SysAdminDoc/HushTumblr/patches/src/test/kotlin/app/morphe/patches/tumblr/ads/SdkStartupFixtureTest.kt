/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ads

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.misc.extension.localRegisterCount
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/**
 * The SDK launch entries in each declared build (the manifest's providers and initializer, and the
 * static start methods Tumblr's application also calls) and the question put in front of each
 * one's first instruction: a provider returns its answer at once when asked to skip, and an entry
 * taking a Context gets back the one it's handed or nothing, or returns the SDK's own fallback.
 */
@Category(FixtureTests::class)
class SdkStartupFixtureTest {
    private val guards = AD_SDK_STARTUP_GUARDS + LIVERAMP_STARTUP_GUARDS
    private val types = guards.flatMap { listOfNotNull(it.target, it.fallback) }.map { it.substringBefore("->") }.toSet()

    private fun Instruction.called() =
        methodRef()?.let { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }

    private fun BytecodePatchContext.target(target: String): Method {
        val signature = target.substringAfter("->")
        return mutableClassDefBy(target.substringBefore("->")).methods
            .single { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == signature }
    }

    private fun Method.opcodes() = instructionList().map { it.opcode }

    @Test
    fun `each declared build asks first thing before every ad and identity SDK starts`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, types)
            assertEquals("${build.name}: every SDK launch entry is in the build", types, classes.keys)
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
            val before = guards.associate { it.target to context.target(it.target).opcodes() }

            assertTrue(build.name, context.guardStartups("Hide ads", AD_SDK_STARTUP_GUARDS))
            assertTrue(build.name, context.guardStartups("Disable analytics", LIVERAMP_STARTUP_GUARDS))

            for (guard in guards) {
                val method = context.target(guard.target)
                val body = method.instructionList()
                val id = "${build.name}: ${guard.target}"
                // The fallback's call (three code units), its result and the return.
                val added = if (guard.fallback == null) 4 else 6
                assertEquals("$id: $added instructions added", before.getValue(guard.target).size + added, body.size)
                assertEquals("$id: the extension is asked", guard.hook, body[0].called())
                val asked = (body[0] as FiveRegisterInstruction).registerC
                val answer = (body[1] as OneRegisterInstruction).registerA
                assertEquals("$id: the answer is what's tested", answer, (body[2] as OneRegisterInstruction).registerA)
                assertEquals("$id: a false answer goes on to Tumblr's first instruction",
                    if (guard.fallback == null) 3 else 7, (body[2] as OffsetInstruction).codeOffset)
                if (guard.hook.endsWith(")Z")) {
                    assertEquals("$id: the provider itself is asked", method.localRegisterCount(), asked)
                    assertEquals(id, Opcode.MOVE_RESULT, body[1].opcode)
                    assertEquals(id, Opcode.IF_EQZ, body[2].opcode)
                    assertEquals("$id: true is returned at once", Opcode.RETURN, body[3].opcode)
                    assertEquals(id, answer, (body[3] as OneRegisterInstruction).registerA)
                } else {
                    val context = method.localRegisterCount() + if (method.isStatic()) 0 else 1
                    assertEquals("$id: the context is asked and takes the answer", context, asked)
                    assertEquals(id, asked, answer)
                    assertEquals(id, Opcode.MOVE_RESULT_OBJECT, body[1].opcode)
                    assertEquals(id, Opcode.IF_NEZ, body[2].opcode)
                    if (guard.fallback != null) {
                        assertEquals("$id: no context hands out the SDK's fallback", guard.fallback, body[3].called())
                        assertEquals(id, Opcode.MOVE_RESULT_OBJECT, body[4].opcode)
                        assertEquals(id, answer, (body[4] as OneRegisterInstruction).registerA)
                        assertEquals(id, Opcode.RETURN_OBJECT, body[5].opcode)
                        assertEquals(id, answer, (body[5] as OneRegisterInstruction).registerA)
                    } else if (method.returnType == "V") {
                        assertEquals("$id: no context returns at once", Opcode.RETURN_VOID, body[3].opcode)
                    } else {
                        assertEquals("$id: no context returns nothing", Opcode.RETURN_OBJECT, body[3].opcode)
                        assertEquals(id, answer, (body[3] as OneRegisterInstruction).registerA)
                    }
                }
                assertEquals("$id: what follows is Tumblr's own code", before.getValue(guard.target), body.drop(added).map { it.opcode })
            }
        }
    }

    @Test
    fun `a launch entry its guard doesn't fit leaves every entry as it was`() {
        val build = Fixtures.declaredBuilds().first()
        val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, types).values)
        val vungle = AD_SDK_STARTUP_GUARDS.single { it.target.startsWith("Lcom/vungle/") }
        val audience = AD_SDK_STARTUP_GUARDS.single { it.target.contains("DynamicLoaderFactory;->initialize(") }
        val before = listOf(vungle, audience).associate { it.target to context.target(it.target).opcodes() }

        // Vungle's onCreate takes no Context, so a Context guard can't go in front of it.
        assertFalse(context.guardStartups("Hide ads", listOf(audience, StartupGuard(vungle.target, audience.hook))))
        // Audience Network's start method is static, so it has no provider to ask.
        assertFalse(context.guardStartups("Hide ads", listOf(vungle, StartupGuard(audience.target, vungle.hook))))

        for ((target, opcodes) in before) assertEquals(target, opcodes, context.target(target).opcodes())
    }

    @Test
    fun `a fallback that can't stand in for the entry's result leaves every entry as it was`() {
        val build = Fixtures.declaredBuilds().first()
        val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, types).values)
        val loader = AD_SDK_STARTUP_GUARDS.single { it.fallback != null }
        val nimbus = AD_SDK_STARTUP_GUARDS.single { it.target.startsWith("Lcom/tumblr/startup/") }
        val audience = AD_SDK_STARTUP_GUARDS.single { it.target.contains("DynamicLoaderFactory;->initialize(") }
        val factory = loader.target.substringBefore("->")
        val before = listOf(loader, nimbus, audience).associate { it.target to context.target(it.target).opcodes() }

        // A fallback the build doesn't have.
        assertFalse(context.guardStartups("Hide ads",
            listOf(loader.copy(fallback = loader.fallback!!.replace("makeFallbackLoader", "makeMissingLoader")))))
        // Nimbus's create returns an Object from another package, which the loader's fallback isn't
        // reachable from or typed as.
        assertFalse(context.guardStartups("Hide ads", listOf(loader, nimbus.copy(fallback = loader.fallback))))
        // The SDK's public makeLoader(Context) has the loader's type but wants a context, which the
        // guard has none of to give.
        assertFalse(context.guardStartups("Hide ads", listOf(loader.copy(
            fallback = "$factory->makeLoader(Landroid/content/Context;)Lcom/facebook/ads/internal/dynamicloading/DynamicLoader;"))))
        // initialize returns nothing, and a static no-argument void method (the factory's own
        // <clinit>) has no result the guard could hand out.
        assertFalse(context.guardStartups("Hide ads", listOf(audience.copy(fallback = "$factory-><clinit>()V"))))

        for ((target, opcodes) in before) assertEquals(target, opcodes, context.target(target).opcodes())
    }

    @Test
    fun `a build without an SDK skips it and guards the rest`() {
        val build = Fixtures.declaredBuilds().first()
        val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, types).values)
        val vungle = AD_SDK_STARTUP_GUARDS.single { it.target.startsWith("Lcom/vungle/") }
        val before = context.target(vungle.target).opcodes()

        assertTrue(context.guardStartups("Hide ads", listOf(StartupGuard("Lcom/example/AbsentProvider;->onCreate()Z", vungle.hook), vungle)))

        assertEquals("Vungle is guarded", before.size + 4, context.target(vungle.target).opcodes().size)
    }
}

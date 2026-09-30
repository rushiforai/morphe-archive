/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.analytics

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.PatchLogCapture
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Disable analytics on each declared build: all three kinds of address site are there, and after
 * the patch every address Threads gets from them has been through the extension, with nothing
 * else in those methods moved.
 */
class DisableAnalyticsFixtureTest {
    private val endpoint = "$EXTENSION_PACKAGE/misc/Analytics;->endpoint(Ljava/lang/String;)Ljava/lang/String;"
    private val loggingUrl = "https://graph.facebook.com/logging_client_events"
    private val markers = setOf(loggingUrl, "/pigeon_nest", "analytics_endpoint")

    @Test
    fun `the extension's endpoint takes and answers a string, and never names the real address`() {
        val analytics = ExtensionDex.classDef("$EXTENSION_PACKAGE/misc/Analytics;")
        val method = analytics.methods.single { it.name == "endpoint" }
        assertTrue(AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags))
        assertEquals(listOf("Ljava/lang/String;"), method.parameterTypes.map { it.toString() })
        assertEquals("Ljava/lang/String;", method.returnType)
        val strings = ExtensionDex.classes().flatMap { it.methods }.flatMap { it.instructions() }.mapNotNull { it.string() }
        assertTrue("the extension loads $loggingUrl, which the patch would wrap too", loggingUrl !in strings)
    }

    @Test
    fun `each declared build has all three address sites, and each address goes through the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val classes = FixtureDex.classesWhere(build, { dex -> markers.any { it in dex.stringSection } }) { method ->
                method.instructions().any { it.string() in markers }
            }
            val methods = classes.flatMap { it.methods }
            val pigeon = methods.filter { it.isPigeonBuilder() }
            assertEquals("$where: the Pigeon logger's address builders", 1, pigeon.size)
            val mqtt = methods.filter { it.isMqttSettings() }
            assertEquals("$where: the MQTT settings constructors", 1, mqtt.size)
            val defaults = methods.associateWith { it.defaultAnswers() }.filterValues { it.isNotEmpty() }
            assertEquals(
                "$where: methods answering $loggingUrl as it is (a provider and the shared-string pool)",
                2, defaults.values.sumOf { it.size },
            )

            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            // Every kind of site is on the declared build, so the patch has nothing to warn about.
            // A found site once still read as missing, and this is where that shows.
            val warnings = PatchLogCapture.warnings { disableAnalyticsPatch.execute(context) }
            assertEquals("$where: the patch log", emptyList<String>(), warnings)

            fun after(method: Method): List<Instruction> = context.mutableClassDefBy(method.definingClass).methods
                .single { it.name == method.name && it.params() == method.params() && it.returnType == method.returnType }
                .instructions()

            val builder = after(pigeon.single())
            val returns = pigeon.single().instructions().count { it.opcode == Opcode.RETURN_OBJECT }
            assertEquals("$where: every return of the Pigeon builder is wrapped", returns, builder.count { it.isEndpointCall() })
            builder.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.forEach { (index, answer) ->
                assertWrapped("$where: the Pigeon builder's return at $index", builder, index - 2, (answer as OneRegisterInstruction).registerA)
            }

            defaults.forEach { (method, loads) ->
                val now = after(method)
                assertEquals("$where: ${method.name}: two added per answer", method.instructions().size + 2 * loads.size, now.size)
                val wrapped = now.indices.filter { now[it].string() == loggingUrl && now.getOrNull(it + 1)?.isEndpointCall() == true }
                assertEquals("$where: ${method.name}: answers wrapped", loads.size, wrapped.size)
                wrapped.forEach { index ->
                    val register = (now[index] as OneRegisterInstruction).registerA
                    assertWrapped("$where: ${method.name}'s answer at $index", now, index + 1, register)
                    assertEquals(Opcode.RETURN_OBJECT, now[index + 3].opcode)
                    assertEquals(register, (now[index + 3] as OneRegisterInstruction).registerA)
                }
            }

            val settings = after(mqtt.single())
            val key = settings.indexOfFirst { it.string() == "analytics_endpoint" }
            val read = (key until settings.size).first { settings[it].opcode == Opcode.MOVE_RESULT_OBJECT }
            assertWrapped("$where: the MQTT analytics address", settings, read + 1, (settings[read] as OneRegisterInstruction).registerA)
            assertEquals("$where: one call in the MQTT settings", 1, settings.count { it.isEndpointCall() })

            val appCalls = classes.flatMap { it.methods }.sumOf { method -> after(method).count { it.isEndpointCall() } }
            assertEquals("$where: every call the patch added, and no others", returns + 2 + 1, appCalls)
            val extensionCalls = ExtensionDex.classes().sumOf { classDef -> context.mutableClassDefBy(classDef.type).callCount() }
            assertEquals("$where: calls put into the extension", 0, extensionCalls)

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods
                .single { it.name == "disableAnalytics" }.instructions()
            assertEquals("$where: SettingsStatus.disableAnalytics() answers true", Opcode.CONST_4, status[0].opcode)
            assertEquals(1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, status[1].opcode)
        }
    }

    /** At [index], the endpoint call on [register] and its result back into the same register. */
    private fun assertWrapped(where: String, instructions: List<Instruction>, index: Int, register: Int) {
        val call = instructions[index]
        assertTrue("$where: ${call.opcode} ${(call as? ReferenceInstruction)?.reference}", call.isEndpointCall())
        assertEquals("$where: the call reads the address", register, (call as RegisterRangeInstruction).startRegister)
        assertEquals(1, call.registerCount)
        assertEquals("$where: then its result", Opcode.MOVE_RESULT_OBJECT, instructions[index + 1].opcode)
        assertEquals("$where: back in the same register", register, (instructions[index + 1] as OneRegisterInstruction).registerA)
    }

    private fun Method.isPigeonBuilder(): Boolean {
        if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "Ljava/lang/String;") return false
        if (params() != listOf("Ljava/lang/String;", "Z")) return false
        val strings = instructions().mapNotNull { it.string() }.toSet()
        return "/pigeon_nest" in strings && "/logging_client_events" in strings
    }

    private fun Method.isMqttSettings(): Boolean {
        if (name != "<init>" || params() != listOf("Lorg/json/JSONObject;")) return false
        val strings = instructions().mapNotNull { it.string() }.toSet()
        return "analytics_endpoint" in strings && loggingUrl in strings
    }

    /** The indexes where this method loads the default address and returns it at once. */
    private fun Method.defaultAnswers(): List<Int> {
        val instructions = instructions()
        return (1 until instructions.size).filter { index ->
            val load = instructions[index - 1]
            val answer = instructions[index]
            answer.opcode == Opcode.RETURN_OBJECT && load.string() == loggingUrl &&
                (load as OneRegisterInstruction).registerA == (answer as OneRegisterInstruction).registerA
        }
    }

    private fun ClassDef.callCount(): Int = methods.sumOf { method -> method.instructions().count { it.isEndpointCall() } }

    private fun Instruction.isEndpointCall(): Boolean =
        (opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE) &&
            (this as ReferenceInstruction).reference.toString() == endpoint

    private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun Method.params(): List<String> = parameterTypes.map { it.toString() }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
}

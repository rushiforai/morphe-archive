/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.analytics

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.ads.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Firebase Crashlytics and Sessions on each declared build. Telegram Beta carries both and the
 * regular build neither. Where they're carried, Disable analytics stops Telegram's own Crashlytics
 * start and error report and answers Sessions' override, and nothing in either SDK changes.
 */
class FirebaseReportersFixtureTest {
    private val strings = setOf(CRASHLYTICS_COLLECTION, CRASHLYTICS_PREFS, SESSIONS_OVERRIDE)

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
    private fun Method.key() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    private fun isBeta(build: File) = build.name.contains("beta")

    /** The classes naming either SDK's switches, and Telegram's ApplicationLoader pair. */
    private fun reporterClasses(build: File): List<ClassDef> = FixtureDex.classesWhere(build, { true }) { method ->
        method.name == "startAppCenterInternal" || method.name == "appCenterLogInternal" || method.body().any { it.string() in strings }
    }

    /** What the rest of Disable analytics hooks, so the whole patch runs as it does when patching. */
    private fun usageReportClasses(build: File): List<ClassDef> =
        FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER)).values.toList() +
            FixtureDex.classesWhere(build, { true }) { method -> method.body().any {
                it.opcode == Opcode.NEW_INSTANCE && it.ref() in setOf(REPORT_READ_METRICS, SAVE_APP_LOG)
            } }

    private fun context(classes: List<ClassDef>) = PatchContexts.of(ExtensionDex.classes() + classes.distinctBy { it.type })

    private fun flag(context: BytecodePatchContext, name: String): Int {
        val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.body()
        assertEquals("$name is a constant build fact", Opcode.CONST_4, status[0].opcode)
        return (status[0] as NarrowLiteralInstruction).narrowLiteral
    }

    private fun snapshot(context: BytecodePatchContext, types: Collection<String>) = types.flatMap { type ->
        context.mutableClassDefBy(type).methods.map { method -> method.key() to method.body().map { it.opcode to it.ref() } }
    }.toMap()

    @Test
    fun `the beta carries both reporters where the patch can stop them and the regular build carries neither`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(reporterClasses(build))
            val crash = context.resolveCrashReporter()
            val sessions = context.resolveSessions()
            if (isBeta(build)) {
                assertTrue("${build.name}: $crash", crash is Carried.Hookable)
                assertTrue("${build.name}: $sessions", sessions is Carried.Hookable)
                val hooks = (crash as Carried.Hookable).hook
                assertEquals("startAppCenterInternal", hooks.start.name)
                assertEquals("appCenterLogInternal", hooks.errors.name)
                assertEquals(APPLICATION_LOADER, context.classDefByOrNull(hooks.start.definingClass)?.superclass)
                val reader = (sessions as Carried.Hookable).hook
                assertEquals("Ljava/lang/Boolean;", reader.method.returnType)
                assertTrue(reader.method.body().any { it.string() == SESSIONS_OVERRIDE })
                assertEquals("${build.name}: the override answers from two places", 2, reader.returns.size)
            } else {
                assertEquals(build.name, Carried.Absent, crash)
                assertEquals(build.name, Carried.Absent, sessions)
            }
        }
    }

    @Test
    fun `the whole patch stops both reporters on the beta and leaves every SDK method alone`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val reporters = reporterClasses(build)
            val context = context(reporters + usageReportClasses(build))
            val crash = context.resolveCrashReporter()
            val sessions = context.resolveSessions()
            val hooked = buildSet {
                (crash as? Carried.Hookable)?.hook?.let { add(it.start.key()); add(it.errors.key()) }
                (sessions as? Carried.Hookable)?.hook?.let { add(it.method.key()) }
            }
            val reporterTypes = reporters.map { it.type }.distinct()
            val before = snapshot(context, reporterTypes)
            val originals = before.filterKeys { it in hooked }

            assertEquals("$where: the patch log", emptyList<String>(), PatchLogCapture.warnings { disableAnalyticsPatch.execute(context) })
            val after = snapshot(context, reporterTypes)
            assertEquals("$where: nothing but the three hooks changed", before.filterKeys { it !in hooked }, after.filterKeys { it !in hooked })
            assertEquals(where, if (isBeta(build)) 1 else 0, flag(context, "crashReports"))
            assertEquals(where, if (isBeta(build)) 1 else 0, flag(context, "sessionReports"))
            assertEquals(where, 1, flag(context, "disableAnalytics"))
            if (!isBeta(build)) {
                assertEquals("$where: nothing to hook", emptySet<String>(), hooked)
                continue
            }

            val loader = context.mutableClassDefBy((crash as Carried.Hookable).hook.start.definingClass)
            for ((name, hook) in listOf("startAppCenterInternal" to SKIP_CRASH_REPORTER_START, "appCenterLogInternal" to SKIP_ERROR_REPORT)) {
                val method = loader.methods.single { it.name == name }
                val body = method.body()
                val stock = originals.getValue(method.key())
                assertEquals("$where: $name asks first", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID),
                    body.take(4).map { it.opcode })
                assertEquals(hook, body[0].ref())
                assertEquals("$where: $name borrows a local for the answer", listOf(0), body[1].namedRegisters())
                assertEquals("$where: a no runs $name as Telegram has it", setOf(3, 4), ControlFlow.of(method).normal[2].toSet())
                assertEquals("$where: $name otherwise stock", stock, body.drop(4).map { it.opcode to it.ref() })
            }

            val reader = (sessions as Carried.Hookable).hook.method
            val body = reader.body()
            val stock = originals.getValue(reader.key())
            assertEquals("$where: two questions", stock.size + 4, body.size)
            val returns = body.indices.filter { body[it].opcode == Opcode.RETURN_OBJECT }
            assertEquals(2, returns.size)
            for (at in returns) {
                val answer = body[at].namedRegisters().single()
                assertEquals(Opcode.INVOKE_STATIC_RANGE, body[at - 2].opcode)
                assertEquals(SESSIONS_ENABLED, body[at - 2].ref())
                assertEquals("$where: the answer found goes to the extension", listOf(answer), body[at - 2].namedRegisters())
                assertEquals(Opcode.MOVE_RESULT_OBJECT, body[at - 1].opcode)
                assertEquals(listOf(answer), body[at - 1].namedRegisters())
            }
            val unhooked = body.filterIndexed { index, _ -> returns.none { index == it - 2 || index == it - 1 } }
            assertEquals("$where: the override lookup stays stock", stock, unhooked.map { it.opcode to it.ref() })
            // Whatever jumped to a return now reaches the question first.
            val flow = ControlFlow.of(reader)
            for (at in returns) assertTrue(flow.normal.indices.none { from -> from != at - 1 && at in flow.normal[from] })
        }
    }

    @Test
    fun `a beta whose crash reporter start can't be proven goes on without it and changes nothing there`() {
        val build = Fixtures.declaredBuilds().single(::isBeta)
        val reporters = reporterClasses(build).filter { it.superclass != APPLICATION_LOADER }
        val context = context(reporters + usageReportClasses(build))
        val before = snapshot(context, reporters.map { it.type }.distinct())
        val sessions = (context.resolveSessions() as Carried.Hookable).hook.method.key()
        val warnings = PatchLogCapture.warnings { disableAnalyticsPatch.execute(context) }
        assertEquals(warnings.toString(), 1, warnings.size)
        assertTrue(warnings.single(), warnings.single().contains("Firebase crash reports are in this app, but 0 classes extend Telegram's ApplicationLoader"))
        assertTrue(warnings.single(), warnings.single().endsWith("The patch goes on without them."))
        assertEquals(0, flag(context, "crashReports"))
        assertEquals(1, flag(context, "sessionReports"))
        assertEquals(1, flag(context, "disableAnalytics"))
        val after = snapshot(context, reporters.map { it.type }.distinct())
        assertEquals("only the Sessions override reader changed", before.filterKeys { it != sessions }, after.filterKeys { it != sessions })
    }
}

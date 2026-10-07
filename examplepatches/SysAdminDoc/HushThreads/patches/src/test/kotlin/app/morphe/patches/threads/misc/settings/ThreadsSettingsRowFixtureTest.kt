/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.settings

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.threads.misc.extension.THREADS_APPLICATION
import app.morphe.patches.threads.misc.extension.patchLog
import app.morphe.patches.threads.misc.theme.holdsNote
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.util.logging.Handler
import java.util.logging.Level
import java.util.logging.LogRecord

/**
 * The HushThreads row in Threads' own settings, on each declared build: the More settings case of
 * Threads' settings list asks the extension for the row just before it goes to draw its own, the
 * extension's stub calls Threads' settings row the way that case does, and its click is a Function0.
 */
class ThreadsSettingsRowFixtureTest {
    @Test
    fun `the extension's row takes the composer and its stub and click have the shapes the patch writes against`() {
        val row = ExtensionDex.classDef(SETTINGS_ROW)
        val add = row.methods.single { it.name == "add" }
        assertTrue(AccessFlags.STATIC.isSet(add.accessFlags) && AccessFlags.PUBLIC.isSet(add.accessFlags))
        assertEquals(ADD_SETTINGS_ROW, "${add.definingClass}->add(${add.parameterTypes.joinToString("")})${add.returnType}")
        val stub = row.methods.single { it.name == "showRow" }
        assertTrue(AccessFlags.STATIC.isSet(stub.accessFlags))
        assertEquals(listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/String;", "Ljava/lang/String;", "I"),
            stub.parameterTypes.map { it.toString() })
        val click = ExtensionDex.classDef(SETTINGS_ROW_CLICK)
        assertTrue(click.interfaces.isEmpty())
        val invoke = click.methods.single { it.name == "invoke" }
        assertTrue(AccessFlags.PUBLIC.isSet(invoke.accessFlags) && !AccessFlags.STATIC.isSet(invoke.accessFlags))
        assertEquals("Ljava/lang/Object;", invoke.returnType)
        assertTrue(invoke.parameterTypes.isEmpty())
    }

    @Test
    fun `each declared build asks for the row in its More settings case, just before it goes to draw that row`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val fixture = fixture(build)
            val stock = fixture.list.body()
            val more = moreCase(fixture, stock)
            val start = (more.case until more.goto).single {
                stock[it].opcode == Opcode.INVOKE_INTERFACE && stock[it].method()?.definingClass == fixture.composerType
            }
            val composer = (stock[start] as FiveRegisterInstruction).registerC

            val context = context(fixture)
            context.addThreadsSettingsRow()

            val patched = context.list(fixture).body()
            // The hook is three code units, so the patcher may add or drop the nop that aligns the
            // switch's table. That padding is left out of the comparison.
            assertEquals("$where: one instruction added", stock.code().size + 1, patched.code().size)
            assertEquals("$where: no new registers", fixture.list.implementation!!.registerCount,
                context.list(fixture).implementation!!.registerCount)
            val hook = patched[more.goto] as RegisterRangeInstruction
            assertEquals("$where: the hook", Opcode.INVOKE_STATIC_RANGE, patched[more.goto].opcode)
            assertEquals(ADD_SETTINGS_ROW, patched[more.goto].method().toString())
            assertEquals("$where: the composer the case starts its group on", composer, hook.startRegister)
            assertEquals(1, hook.registerCount)
            assertEquals("$where: the case's goto follows the hook", stock[more.goto].opcode, patched[more.goto + 1].opcode)
            assertEquals("$where: the rest is the stock list", stock.code().map { it.opcode },
                patched.filterIndexed { index, _ -> index != more.goto }.code().map { it.opcode })
            assertEquals("$where: one call in the list", 1, patched.count { it.method()?.toString() == ADD_SETTINGS_ROW })
            // The switch still sends More settings to the same instruction, now followed by the hook.
            assertEquals("$where: the case still starts where it did", more.case, moreCase(fixture, patched).case)

            // The stub calls Threads' Accounts Center row with the modifier of the run the case goes to,
            // the extension's text, click and icon, and zero for the changed and defaults words and the badge.
            val stub = context.mutableClassDefBy(SETTINGS_ROW).methods.single { it.name == "showRow" }.body()
            val call = stub.single { it.opcode == Opcode.INVOKE_STATIC_RANGE } as RegisterRangeInstruction
            assertEquals("$where: Threads' Accounts Center row", fixture.accountsRow, call.method().toString())
            assertEquals(9, call.registerCount)
            for (argument in listOf(6, 7, 8)) {
                val literal = stub.last { (it as? OneRegisterInstruction)?.registerA == call.startRegister + argument }
                assertEquals("$where: argument $argument", 0, (literal as NarrowLiteralInstruction).narrowLiteral)
            }
            val tail = stock.subList(more.tail, more.call)
            val threadsCall = stock[more.call] as RegisterRangeInstruction
            val modifier = tail.last { (it as? OneRegisterInstruction)?.registerA == threadsCall.startRegister + 1 }
            assertEquals("$where: the modifier", modifier.getReference<FieldReference>().toString(),
                stub.single { it.opcode == Opcode.SGET_OBJECT }.getReference<FieldReference>().toString())
            assertEquals("$where: the composer is cast to Threads' composer", fixture.composerType,
                stub.first { it.opcode == Opcode.CHECK_CAST }.getReference<TypeReference>()!!.type)
            assertEquals(Opcode.RETURN_VOID, stub.last().opcode)

            val click = context.mutableClassDefBy(SETTINGS_ROW_CLICK)
            assertEquals("$where: the click is a Function0", listOf(FUNCTION0), click.interfaces.toList())
        }
    }

    /**
     * Each way the More settings case could stop being the straight run that was read refuses the
     * build: a write to the composer after its group starts, a branch into the case, an entry enum
     * without More settings, and literals the shared run no longer loads.
     */
    @Test
    fun `a settings list that differs from the one read is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val stock = fixture.list.body()
            val more = moreCase(fixture, stock)
            val start = (more.case until more.goto).single {
                stock[it].opcode == Opcode.INVOKE_INTERFACE && stock[it].method()?.definingClass == fixture.composerType
            }
            val composer = (stock[start] as FiveRegisterInstruction).registerC
            val threadsCall = stock[more.call] as RegisterRangeInstruction
            val changedAt = (more.tail until more.call).last {
                (stock[it] as? OneRegisterInstruction)?.registerA == threadsCall.startRegister + 6
            }
            val cases = listOf<Pair<String, (BytecodePatchContext) -> Unit>>(
                "overwrites its composer" to { context ->
                    context.list(fixture).addInstructions(more.goto, "const/16 v$composer, 0x0")
                },
                "branches into its MORE case" to { context ->
                    // A branch from the top of the method to the instruction after the case's first.
                    val list = context.list(fixture)
                    list.addInstructionsWithLabels(0, "if-eqz v0, :inside", ExternalLabel("inside", list.getInstruction(more.case + 1)))
                },
                "has no MORE entry" to { context ->
                    val enum = context.mutableClassDefBy(fixture.entries).methods.single { it.name == "<clinit>" }
                    val at = enum.body().indexOfFirst { it.getReference<StringReference>()?.string == "MORE" }
                    val register = (enum.body()[at] as OneRegisterInstruction).registerA
                    enum.replaceInstruction(at, "const-string v$register, \"LESS\"")
                },
                "isn't passed two literals" to { context ->
                    context.list(fixture).replaceInstruction(changedAt, "add-int/lit8 v${threadsCall.startRegister + 6}, v$composer, 0x1")
                },
            )
            for ((expected, mutate) in cases) {
                val context = context(fixture)
                mutate(context)
                val error = assertThrows("${build.name}: $expected", PatchException::class.java) { context.settingsRowSite() }
                    .message.orEmpty()
                assertTrue("${build.name}: $error", error.contains(expected))
            }
        }
    }

    /** A second list lambda or a second settings row would leave the patch guessing, so either refuses the build. */
    @Test
    fun `a second settings list or a second settings row is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val row = fixture.classes.flatMap { it.methods }.single { it.holdsNote(ROW_NOTE) }
            for ((what, method) in listOf("settings list" to fixture.list, "settings row" to row)) {
                val context = context(fixture)
                context.mutableClassDefBy(method.definingClass).methods.add(MutableMethod(ImmutableMethod(
                    method.definingClass, "copyOf${method.name}", method.parameters, method.returnType,
                    method.accessFlags, null, null, ImmutableMethodImplementation.of(method.implementation),
                )))
                val error = assertThrows("${build.name}: $what", PatchException::class.java) { context.settingsRowSite() }.message.orEmpty()
                assertTrue("${build.name}: $error", error.contains("Threads' $what") && error.contains("found 2"))
            }
        }
    }

    /**
     * Every patch depends on the settings patch, and HushThreads opens from its launcher shortcut
     * and App info without the row, so a build the row doesn't fit still gets the settings patch,
     * with one warning in the patch log naming why the row was left out, and no part of the row.
     */
    @Test
    fun `a build the row doesn't fit gets the rest of the settings patch and a warning`() {
        val screen = "Lfixture/SettingsScreen;"
        val hosts = SettingsPatchHosts.all()
        assertTrue(hosts.any { it.type == screen })
        val context = PatchContexts.of(hosts.filter { it.type != screen })
        val warnings = mutableListOf<String>()
        val handler = object : Handler() {
            override fun publish(record: LogRecord) {
                if (record.level == Level.WARNING) warnings += record.message
            }
            override fun flush() {}
            override fun close() {}
        }
        patchLog.addHandler(handler)
        try {
            settingsPatch.execute(context)
        } finally {
            patchLog.removeHandler(handler)
        }

        assertEquals(warnings.toString(), 1, warnings.size)
        assertTrue(warnings.single(), warnings.single().contains("Threads' settings row") && warnings.single().contains("left out"))
        val onCreate = context.mutableClassDefBy(THREADS_APPLICATION).methods.single { it.name == "onCreate" }.body()
        assertTrue("the application still starts HushThreads", onCreate.any { it.method()?.name == "onApplicationCreate" })
        val stub = context.mutableClassDefBy(SETTINGS_ROW).methods.single { it.name == "showRow" }.body()
        assertEquals("the row's stub is left empty", listOf(Opcode.RETURN_VOID), stub.map { it.opcode })
    }

    /** Where the switch sends More settings, the goto that ends that case, the run it goes to and the row call there. */
    private data class MoreCase(val case: Int, val goto: Int, val tail: Int, val call: Int)

    /** Read apart from the patch: the enum's own MORE ordinal, then the switch's case for it. */
    private fun moreCase(fixture: Fixture, body: List<Instruction>): MoreCase {
        val enum = fixture.classes.single { it.type == fixture.entries }.methods.single { it.name == "<clinit>" }.body()
        val named = enum.indexOfFirst { it.getReference<StringReference>()?.string == "MORE" }
        val init = (named until enum.size).first { enum[it].method()?.name == "<init>" }
        val ordinalRegister = (enum[init] as FiveRegisterInstruction).registerE
        val ordinal = (enum.subList(0, init).last { (it as? OneRegisterInstruction)?.registerA == ordinalRegister } as NarrowLiteralInstruction).narrowLiteral

        var address = 0
        val at = IntArray(body.size) { i -> address.also { address += body[i].codeUnits } }
        fun index(target: Int) = at.indexOfFirst { it == target }
        val switch = body.indices.single { body[it].opcode == Opcode.PACKED_SWITCH }
        val payload = body[index(at[switch] + (body[switch] as OffsetInstruction).codeOffset)] as SwitchPayload
        val case = index(at[switch] + payload.switchElements.single { it.key == ordinal }.offset)
        val goto = (case until body.size).first { body[it] is OffsetInstruction }
        assertTrue(body[goto].opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32))
        val tail = index(at[goto] + (body[goto] as OffsetInstruction).codeOffset)
        val call = (tail until body.size).first { body[it].method()?.toString() == fixture.row }
        return MoreCase(case, goto, tail, call)
    }

    private data class Fixture(
        val classes: Collection<ClassDef>,
        val list: Method,
        val row: String,
        val accountsRow: String,
        val composerType: String,
        val entries: String,
    )

    private fun fixture(build: File): Fixture = fixtures.getOrPut(build) {
        val noted = FixtureDex.classesWhere(build, { true }) {
            it.holdsNote(ROW_NOTE) || it.holdsNote(ACCOUNTS_ROW_NOTE) || it.holdsNote(LIST_NOTE)
        }
        fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
        val rowSignature = noted.flatMap { it.methods }.single { it.holdsNote(ROW_NOTE) }.let { it.signature() }
        val accountsRow = noted.flatMap { it.methods }.single { it.holdsNote(ACCOUNTS_ROW_NOTE) }
        val list = noted.flatMap { it.methods }.single { method ->
            method.holdsNote(LIST_NOTE) && method.body().any { it.opcode == Opcode.PACKED_SWITCH } &&
                method.body().any { it.method()?.toString() == rowSignature }
        }
        val casts = list.body().filter { it.opcode == Opcode.CHECK_CAST }.mapNotNull { it.getReference<TypeReference>()?.type }.toSet()
        val read = FixtureDex.classes(build, casts + FUNCTION0)
        val entries = casts.single { type -> read[type]?.superclass == "Ljava/lang/Enum;" }
        Fixture((noted + read.values).distinctBy { it.type }, list, rowSignature, accountsRow.signature(),
            accountsRow.parameterTypes[0].toString(), entries)
    }

    private fun context(fixture: Fixture) = PatchContexts.of(ExtensionDex.classes() + fixture.classes)

    private fun BytecodePatchContext.list(fixture: Fixture) =
        mutableClassDefBy(fixture.list.definingClass).methods.single {
            it.name == fixture.list.name &&
                it.parameterTypes.map { p -> p.toString() } == fixture.list.parameterTypes.map { p -> p.toString() }
        }

    private fun Instruction.method(): MethodReference? = getReference<MethodReference>()

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun List<Instruction>.code() = filter { it.opcode != Opcode.NOP }

    private companion object {
        val fixtures = HashMap<File, Fixture>()
    }
}

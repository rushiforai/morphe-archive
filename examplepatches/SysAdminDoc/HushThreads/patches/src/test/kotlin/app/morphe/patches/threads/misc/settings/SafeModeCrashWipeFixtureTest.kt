/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.settings

import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.RepoFiles
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.Reference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Safe mode has to act before Threads' own crash-loop remedy (Facebook's CatchMeIfYouCan). At each
 * start that remedy counts the crashes of the last four hours that came soon after a process
 * start, and at its second level it deletes Threads' data folder: the account is signed out and
 * the HushThreads settings are gone. HushThreads pauses after CRASHES_TO_SAFE_MODE young crashes in
 * a row, so that count has to stay below the wipe level on every declared build, and its own
 * window has to cover the remedy's, or a crash the remedy counts could slip past safe mode.
 *
 * The thresholds are read from each build, not copied here. Threads logs them as it starts, with
 * one format string, from three no-argument getters that each return a constant, and the window
 * from a static field. The test follows that call back to those values by the code's own shape,
 * never by an obfuscated name, and fails when any step of it no longer reads.
 */
class SafeModeCrashWipeFixtureTest {
    @Test
    fun `safe mode pauses Threads before its crash-loop remedy wipes the data on each declared build`() {
        val pause = File(RepoFiles.root, PAUSE_SOURCE).readText()
        val crashes = constant(pause, "int", "CRASHES_TO_SAFE_MODE").toInt()
        val window = constant(pause, "long", "START_WINDOW_MS").removeSuffix("L").replace("_", "").toLong()
        for (build in Fixtures.declaredBuilds()) {
            val remedy = remedy(build)
            val where = "${build.name}: Threads' crash-loop remedy $remedy"
            assertTrue("$where: the levels no longer rise", remedy.cacheClear in 1 until remedy.wipe && remedy.wipe < remedy.disable)
            assertTrue(
                "$where: safe mode waits for $crashes crashes in a row, so the remedy wipes Threads' data first",
                crashes < remedy.wipe,
            )
            assertTrue(
                "$where: safe mode only counts crashes within $window ms of a start, so it misses some the remedy counts",
                window >= remedy.windowMs,
            )
        }
    }

    @Test
    fun `each safe mode constant is declared once in the source the payload is built from`() {
        val pause = File(RepoFiles.root, PAUSE_SOURCE).readText()
        for ((type, name) in listOf("int" to "CRASHES_TO_SAFE_MODE", "long" to "START_WINDOW_MS")) {
            assertEquals("$PAUSE_SOURCE declarations of $name", 1, declaration(type, name).findAll(pause).count())
        }
    }

    /** What Threads' remedy does at each count of young crashes, and how young a crash has to be. */
    private data class Remedy(val cacheClear: Int, val wipe: Int, val disable: Int, val windowMs: Int) {
        override fun toString() = "(cache clear at $cacheClear, data wipe at $wipe, app disabled at $disable, window $windowMs ms)"
    }

    private fun remedy(build: File): Remedy {
        val loggers = FixtureDex.methodsWhere(build, { dex -> FORMAT in dex.stringSection }) { method ->
            method.instructions().any { it.string() == FORMAT }
        }
        if (loggers.size != 1) cannot(build, "${loggers.size} methods log \"$FORMAT\"")
        val code = loggers.single().instructions()
        val text = code.indexOfFirst { it.string() == FORMAT }
        val textRegister = (code[text] as OneRegisterInstruction).registerA
        val format = (text + 1 until code.size).firstOrNull { index ->
            code[index].method() == STRING_FORMAT && (code[index] as FiveRegisterInstruction).registerD == textRegister
        } ?: cannot(build, "\"$FORMAT\" no longer goes to String.format")
        val arguments = arrayElements(build, code, format, (code[format] as FiveRegisterInstruction).registerE)
        if (arguments.size != 4) cannot(build, "the log has ${arguments.size} values, not three levels and a window")
        val sources = arguments.map { (at, register) -> intSource(build, code, at, register) }
        val classes = FixtureDex.classes(build, sources.map { it.definingClass }.toSet())
        val (cacheClear, wipe, disable, window) = sources.map { value(build, classes, it) }
        return Remedy(cacheClear, wipe, disable, window)
    }

    /** The registers a filled-new-array put in the Object[] that [register] holds at [at], each with where it was read. */
    private fun arrayElements(build: File, code: List<Instruction>, at: Int, register: Int): List<Pair<Int, Int>> {
        val write = lastWrite(build, code, at, register)
        if (code[write].opcode != Opcode.MOVE_RESULT_OBJECT) cannot(build, "the log's arguments come from ${code[write].opcode}")
        val made = code[write - 1]
        return when {
            made.opcode == Opcode.FILLED_NEW_ARRAY -> with(made as FiveRegisterInstruction) {
                listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount).map { write - 1 to it }
            }
            made.method() == ARRAYS_COPY_OF -> arrayElements(build, code, write - 1, (made as FiveRegisterInstruction).registerC)
            else -> cannot(build, "the log's arguments come from ${made.opcode}")
        }
    }

    /** Where a boxed log argument's int comes from: a no-argument static getter, or a static field. */
    private fun intSource(build: File, code: List<Instruction>, at: Int, register: Int): Reference {
        val write = lastWrite(build, code, at, register)
        val instruction = code[write]
        return when (instruction.opcode) {
            Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_RESULT -> {
                val call = code[write - 1]
                val method = (call as? ReferenceInstruction)?.reference as? MethodReference
                when {
                    call.method() == INTEGER_VALUE_OF -> intSource(build, code, write - 1, (call as FiveRegisterInstruction).registerC)
                    call.opcode == Opcode.INVOKE_STATIC && method != null && method.parameterTypes.isEmpty() &&
                        method.returnType == "I" -> method
                    else -> cannot(build, "a remedy level comes from ${call.opcode} $method")
                }
            }
            Opcode.SGET -> (instruction as ReferenceInstruction).reference as FieldReference
            Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16 ->
                intSource(build, code, write, (instruction as TwoRegisterInstruction).registerB)
            else -> cannot(build, "a remedy level comes from ${instruction.opcode}")
        }
    }

    /** A getter's constant, from its body of one const and its return, or a static field's first value. */
    private fun value(build: File, classes: Map<String, ClassDef>, source: Reference): Int = when (source) {
        is MethodReference -> {
            val body = classes[source.definingClass]?.methods
                ?.singleOrNull { it.name == source.name && it.parameterTypes.isEmpty() && it.returnType == "I" }
                ?.instructions() ?: cannot(build, "the level getter $source is not in the build")
            val literal = body.firstOrNull()
            if (body.size != 2 || literal !is NarrowLiteralInstruction || body[1].opcode != Opcode.RETURN ||
                (body[1] as OneRegisterInstruction).registerA != (literal as OneRegisterInstruction).registerA
            ) {
                cannot(build, "the level getter $source no longer returns a constant")
            }
            literal.narrowLiteral
        }
        is FieldReference -> (classes[source.definingClass]?.staticFields
            ?.singleOrNull { it.name == source.name && it.type == source.type }?.initialValue as? IntEncodedValue)?.value
            ?: cannot(build, "the window $source starts with no int")
        else -> cannot(build, "a remedy level comes from $source")
    }

    /** The index of the last instruction before [at] that writes [register]. The logger runs straight through here. */
    private fun lastWrite(build: File, code: List<Instruction>, at: Int, register: Int): Int =
        (at - 1 downTo 0).firstOrNull { index ->
            code[index].opcode.setsRegister() && (code[index] as? OneRegisterInstruction)?.registerA == register
        } ?: cannot(build, "nothing writes v$register before the remedy's log")

    /** The value a `static final` field of [type] is declared with in the Java source. */
    private fun constant(source: String, type: String, name: String): String =
        declaration(type, name).find(source)?.groupValues?.get(1)
            ?: throw AssertionError("$PAUSE_SOURCE declares no static final $type $name")

    private fun declaration(type: String, name: String) =
        Regex("""static\s+final\s+$type\s+$name\s*=\s*([0-9_]+L?)\s*;""")

    private fun cannot(build: File, why: String): Nothing =
        throw AssertionError("${build.name}: Threads' crash-loop remedy levels can't be read, because $why")

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun Instruction.method(): String? = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

    private val Reference.definingClass: String
        get() = when (this) {
            is MethodReference -> definingClass
            is FieldReference -> definingClass
            else -> ""
        }

    private companion object {
        const val PAUSE_SOURCE = "extensions/shared/library/src/main/java/app/morphe/extension/shared/settings/HushThreadsPause.java"
        const val FORMAT = "instacrash config l1 %d l2 %d l3 %d interval %d"
        const val STRING_FORMAT = "Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;"
        const val ARRAYS_COPY_OF = "Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;"
        const val INTEGER_VALUE_OF = "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;"
    }
}

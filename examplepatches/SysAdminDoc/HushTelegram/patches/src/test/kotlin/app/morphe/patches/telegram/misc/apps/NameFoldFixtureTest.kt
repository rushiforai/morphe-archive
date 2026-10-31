/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.apps

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap

/** Both pinned builds' LocaleController, where search's transliteration takes the name fold. */
class NameFoldFixtureTest {
    @Test fun `every transliteration starts with the fold and then runs as Telegram's`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + nameFoldHosts(build))
            val plan = context.resolveNameFold()
            assertNull("$name: ${plan.missing}", plan.missing)
            val method = plan.translit!!
            val stock = method.body().map(::operands)
            val registers = method.implementation!!.registerCount
            plan.apply()
            val body = method.body()
            assertEquals("$name: the fold is two instructions", stock.size + NAME_FOLD_SIZE, body.size)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, body[0].opcode)
            assertEquals("$NAME_FOLD->fold(Ljava/lang/String;ZZ)Ljava/lang/String;", body[0].ref())
            // src, ru and onlyEnglish, in that order, and the folded name back into src.
            assertEquals(listOf(registers - 3, registers - 2, registers - 1), body[0].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT_OBJECT, body[1].opcode)
            assertEquals(listOf(registers - 3), body[1].namedRegisters())
            assertEquals("$name: Telegram's own transliteration follows unchanged", stock, body.drop(NAME_FOLD_SIZE).map(::operands))
            // The shorter overloads, where they're still there, call this one, so they're folded too.
            for (other in context.mutableClassDefBy(LOCALE_CONTROLLER).methods.filter { it.name == TRANSLIT && it !== method }) {
                assertTrue("$name: ${other.parameterTypes}", other.body().any { it.ref() == TRANSLIT_FULL })
            }
        }
    }

    @Test fun `a build whose transliteration changed leaves the switch out and the method as it was`() {
        class Case(val name: String, val reason: String, val hosts: (List<ClassDef>) -> List<ClassDef> = { it },
                   val context: (BytecodePatchContext) -> Unit = {})
        val cases = listOf(
            Case("no LocaleController", "LocaleController is missing", hosts = { hosts -> hosts.filter { it.type != LOCALE_CONTROLLER } }),
            Case("an overload with its own body", "another transliteration doesn't go through the full one", context = { context ->
                val short = context.mutableClassDefBy(LOCALE_CONTROLLER).methods.first { it.name == TRANSLIT && it.parameterTypes.size == 1 }
                val call = short.body().indexOfFirst { it.ref() == TRANSLIT_FULL }
                val registers = short.body()[call].namedRegisters().joinToString { "v$it" }
                short.replaceInstruction(call, "invoke-virtual {$registers}, $LOCALE_CONTROLLER->other(Ljava/lang/String;ZZ)Ljava/lang/String;")
            }),
            Case("no case-keeping flag", "case-keeping flag changed", context = { context ->
                val full = context.full()
                val lower = full.body().indexOfFirst { it.ref() == "Ljava/lang/String;->toLowerCase()Ljava/lang/String;" }
                full.replaceInstruction(lower, "invoke-virtual {v${full.body()[lower].namedRegisters().single()}}, Ljava/lang/String;->trim()Ljava/lang/String;")
            }),
            // A branch back to the first instruction would skip the fold, since the label stays on Telegram's.
            Case("jump to the start", "something jumps back to the start", context = { context ->
                val full = context.full()
                full.addInstructionsWithLabels(full.body().size, "goto/16 :hush_back", ExternalLabel("hush_back", full.getInstruction(0)))
            }),
            Case("too many registers", "keeps its name past register 255", context = { context ->
                val owner = context.mutableClassDefBy(LOCALE_CONTROLLER)
                val full = context.full()
                owner.methods.remove(full)
                owner.methods.add(padded(full, 256))
            }),
        )
        for (build in Fixtures.declaredBuilds()) for (case in cases) {
            val where = "${build.name} ${case.name}"
            val context = PatchContexts.of(ExtensionDex.classes() + case.hosts(nameFoldHosts(build)))
            case.context(context)
            val before = context.translits()
            val plan = context.resolveNameFold()
            assertTrue("$where: ${plan.missing}", plan.missing.orEmpty().contains(case.reason))
            assertNull(where, plan.translit)
            plan.apply()
            assertEquals("$where: nothing is edited", before, context.translits())
        }
    }

    /** smali drops an instruction it can't build and only logs it; the rehearsal counts what went in. */
    @Test fun `a fold that can't reach its register is caught by the rehearsal`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + nameFoldHosts(build))
            val method = padded(context.full(), 256)
            val stock = method.body().map(::operands)
            val failed = assertThrows(build.name, Exception::class.java) { NameFoldPlan(method, null).rehearse() }
            // The count catches it, not a register guard or anything else on the way.
            assertTrue("${build.name}: ${failed.message}", failed.message.orEmpty().contains("didn't compile whole"))
            assertEquals("${build.name}: the rehearsal works on a copy", stock, method.body().map(::operands))
        }
    }

    /** Past the last register a range call can name, smali refuses the snippet outright: a reason, not a crash of the patch. */
    @Test fun `a fold smali refuses outright is caught by the rehearsal`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + nameFoldHosts(build))
            val method = padded(context.full(), 70_000)
            val stock = method.body().map(::operands)
            val failed = assertThrows(build.name, Exception::class.java) { NameFoldPlan(method, null).rehearse() }
            assertTrue("${build.name}: ${failed.message}", failed.message.orEmpty().startsWith("the name fold doesn't compile"))
            assertEquals("${build.name}: the rehearsal works on a copy", stock, method.body().map(::operands))
        }
    }

    @Test fun `without the shape the rest of Hide popular apps goes in with a warning`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = popularAppsOwners(build) + myChatsSearchHosts(build) + newChatsHosts(build)
            val context = PatchContexts.of((ExtensionDex.classes() + hosts).distinctBy { it.type })
            val warnings = PatchLogCapture.warnings { hidePopularAppsPatch.execute(context) }
            assertEquals(build.name, 1, warnings.size)
            assertTrue(warnings.single(), warnings.single().contains("LocaleController is missing") &&
                warnings.single().contains("without finding names in styled letters"))
            assertEquals(1, statusOf(context, "hidePopularApps"))
            assertEquals(1, statusOf(context, "myChatsSearch"))
            assertEquals(0, statusOf(context, "nameFold"))
        }
    }

    private fun BytecodePatchContext.full() = mutableClassDefBy(LOCALE_CONTROLLER).methods.single {
        it.name == TRANSLIT && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Z", "Z")
    }

    private fun BytecodePatchContext.translits() = mutableClassDefByOrNull(LOCALE_CONTROLLER)?.methods.orEmpty()
        .filter { it.name == TRANSLIT }.associate { it.parameterTypes.joinToString("") to it.body().map(::operands) }

    /** [method] with [extra] more registers, so its parameters sit that much higher. */
    private fun padded(method: Method, extra: Int): MutableMethod {
        val implementation = method.implementation!!
        return MutableMethod(ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
            method.accessFlags, method.annotations, method.hiddenApiRestrictions,
            ImmutableMethodImplementation(implementation.registerCount + extra, implementation.instructions,
                implementation.tryBlocks, implementation.debugItems)))
    }

    private fun statusOf(context: BytecodePatchContext, flag: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.body()[0] as NarrowLiteralInstruction).narrowLiteral

    private fun operands(instruction: Instruction): List<Any?> = listOf(instruction.opcode, instruction.namedRegisters(), instruction.ref())
}

private val NAME_FOLD_HOSTS = ConcurrentHashMap<String, List<ClassDef>>()

/** LocaleController, whose transliteration takes the fold. */
internal fun nameFoldHosts(build: File): List<ClassDef> = NAME_FOLD_HOSTS.getOrPut(build.path) {
    FixtureDex.classes(build, setOf(LOCALE_CONTROLLER)).values.toList().also {
        assertEquals("${build.name}: LocaleController", 1, it.size)
    }
}

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference?.toString()

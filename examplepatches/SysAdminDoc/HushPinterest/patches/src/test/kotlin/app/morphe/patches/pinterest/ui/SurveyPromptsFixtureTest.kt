/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/**
 * Pinterest's survey invite launcher, its Maybe later handler, the alert, the alert's dismiss
 * reasons and the listeners it stores, plus the launcher's caller that opens sponsored polls and
 * the classes it builds, in each declared APK.
 */
@Category(FixtureTests::class)
class SurveyPromptsFixtureTest {
    private class Build(val name: String, val owner: ClassDef, val decline: ClassDef, val runner: ClassDef, val others: List<ClassDef>) {
        val classes get() = listOf(owner, decline, runner) + others
        val launcher get() = owner.methods.single { it.isSurveyLauncher() }
        val poll get() = runner.methods.single { it.sponsoredPollArms().isNotEmpty() }

        /** The classes that build the sponsored poll's own view. */
        val pollModals get() = others.filter { it.methods.any { method -> method.buildsPollView() } }.map { it.type }
    }

    @Test
    fun `each declared original APK turns the survey invite down through Maybe later and skips sponsored polls`() {
        for (build in Fixtures.declaredBuilds().map(::read)) {
            val context = PatchContexts.of(ExtensionDex.classes() + build.classes)
            hideSurveyPromptsPatch.execute(context)
            for (flag in listOf("hideSurveyPrompts", "surveyPrompts")) {
                assertEquals("${build.name}: $flag", 1, flag(context, flag))
            }
            val original = build.launcher.implementation!!.instructions.toList()
            val body = patched(context, build.launcher)
            val at = body.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == SURVEY_HOOK }
            assertEquals("${build.name}: one hook", 1, body.count { (it as? ReferenceInstruction)?.reference?.toString() == SURVEY_HOOK })
            // The store right above it, untouched, is the alert's dismiss listener: a Function1
            // field of the class the hook's notifier belongs to, built new just before.
            val store = at - 1
            assertEquals("${build.name}: the store stays", original[store].opcode, body[store].opcode)
            assertEquals("${build.name}: the store stays", (original[store] as ReferenceInstruction).reference.toString(),
                (body[store] as ReferenceInstruction).reference.toString())
            val put = original[store] as TwoRegisterInstruction
            val field = (put as ReferenceInstruction).reference as FieldReference
            assertEquals(build.name, Opcode.IPUT_OBJECT, original[store].opcode)
            assertEquals(build.name, FUNCTION1, field.type)
            assertEquals(build.name, Opcode.NEW_INSTANCE, original[store - 2].opcode)
            assertEquals("${build.name}: the listener is new", put.registerA, (original[store - 2] as OneRegisterInstruction).registerA)
            val alert = put.registerB
            val alertType = field.definingClass
            val hook = body[at]
            assertEquals("${build.name}: the hook takes nothing", 0, (hook as FiveRegisterInstruction).registerCount)
            assertEquals(build.name, Opcode.MOVE_RESULT, body[at + 1].opcode)
            val scratch = (body[at + 1] as OneRegisterInstruction).registerA
            assertNotEquals("${build.name}: the answer keeps the alert", alert, scratch)
            assertTrue("${build.name}: v$scratch is a local", scratch < build.launcher.implementation!!.registerCount - parameterSlots(build.launcher))
            assertEquals(build.name, Opcode.IF_EQZ, body[at + 2].opcode)
            assertEquals(build.name, scratch, (body[at + 2] as OneRegisterInstruction).registerA)
            assertEquals("${build.name}: off goes on to the original next instruction",
                address(body, at + 6), address(body, at + 2) + (body[at + 2] as OffsetInstruction).codeOffset)
            assertEquals(build.name, Opcode.SGET_OBJECT, body[at + 3].opcode)
            assertEquals(build.name, scratch, (body[at + 3] as OneRegisterInstruction).registerA)
            assertEquals(build.name, "$ALERT_DISMISS_REASON->$ALERT_CANCEL:$ALERT_DISMISS_REASON",
                (body[at + 3] as ReferenceInstruction).reference.toString())
            assertEquals(build.name, Opcode.INVOKE_VIRTUAL, body[at + 4].opcode)
            val notifier = (body[at + 4] as ReferenceInstruction).reference as MethodReference
            assertEquals(build.name, alertType, notifier.definingClass)
            assertEquals(build.name, listOf(ALERT_DISMISS_REASON), notifier.parameterTypes.map(CharSequence::toString))
            assertEquals("${build.name}: the alert and the cancel reason", listOf(alert, scratch), registers(body[at + 4]))
            assertEquals(build.name, Opcode.RETURN_VOID, body[at + 5].opcode)
            // Payload alignment nops come and go with the layout, so they aren't compared.
            assertEquals("${build.name}: everything but the hook stays", original.map { it.opcode }.filter { it != Opcode.NOP },
                body.filterIndexed { k, _ -> k !in at until at + 6 }.map { it.opcode }.filter { it != Opcode.NOP })

            // The sponsored poll hook opens the arm the launcher's caller takes for a poll.
            val runner = build.poll
            val (start, skipped) = runner.sponsoredPollArms().single()
            val runnerBefore = runner.implementation!!.instructions.toList()
            val runnerAfter = patched(context, runner)
            assertEquals("${build.name}: one poll hook, first in the poll arm", listOf(start),
                runnerAfter.indices.filter { (runnerAfter[it] as? ReferenceInstruction)?.reference?.toString() == SPONSORED_POLL_HOOK })
            assertEquals("${build.name}: the poll hook takes nothing", 0, (runnerAfter[start] as FiveRegisterInstruction).registerCount)
            assertEquals(build.name, Opcode.MOVE_RESULT, runnerAfter[start + 1].opcode)
            val answer = (runnerAfter[start + 1] as OneRegisterInstruction).registerA
            assertTrue("${build.name}: v$answer is a local", answer < runner.implementation!!.registerCount - parameterSlots(runner))
            assertEquals(build.name, Opcode.IF_EQZ, runnerAfter[start + 2].opcode)
            assertEquals(build.name, answer, (runnerAfter[start + 2] as OneRegisterInstruction).registerA)
            assertEquals("${build.name}: off goes on into the poll arm",
                address(runnerAfter, start + 4), address(runnerAfter, start + 2) + (runnerAfter[start + 2] as OffsetInstruction).codeOffset)
            assertEquals(build.name, Opcode.RETURN_VOID, runnerAfter[start + 3].opcode)
            assertEquals("${build.name}: every other survey still skips the poll arm, hook and all",
                address(runnerAfter, skipped + 4), address(runnerAfter, start - 1) + (runnerAfter[start - 1] as OffsetInstruction).codeOffset)
            assertEquals("${build.name}: everything but the poll hook stays", runnerBefore.map { it.opcode }.filter { it != Opcode.NOP },
                runnerAfter.filterIndexed { k, _ -> k !in start until start + 4 }.map { it.opcode }.filter { it != Opcode.NOP })
        }
    }

    @Test
    fun `a missing handler, launcher, listener, poll check or status stub refuses before any change`() {
        val build = read(Fixtures.declaredBuilds().last())
        val extension = ExtensionDex.classes()
        val launcher = build.launcher
        // The listener built right above the store the hook follows.
        val listener = PatchContexts.of(extension + build.classes).surveyPrompt().let { found ->
            ((found.launcher.implementation!!.instructions[found.at - 3] as ReferenceInstruction).reference as TypeReference).type
        }
        val secondLauncher = ImmutableClassDef(build.owner.type, build.owner.accessFlags, build.owner.superclass, build.owner.interfaces,
            build.owner.sourceFile, build.owner.annotations, build.owner.fields, build.owner.methods + ImmutableMethod(build.owner.type,
                "launchAgain", launcher.parameters, launcher.returnType, launcher.accessFlags, null, null, launcher.implementation))
        val movedHandler = rename(build.decline, "Lapp/hushpinterest/test/MovedDecline;")
        // Each case and the refusal it has to give, so none passes on another check's account.
        val cases = linkedMapOf(
            "missing Maybe later handler" to (extension + build.classes - build.decline to "Maybe later handler: expected one exact target, found 0"),
            "two launchers" to (extension + listOf(secondLauncher, build.decline, build.runner) + build.others to "survey invite launcher: expected one exact target, found 2"),
            "launcher builds another handler" to (extension + build.classes - build.decline + movedHandler to "no longer builds the Maybe later handler"),
            "listener missing" to (extension + build.classes.filterNot { it.type == listener } to "no longer tells its primary button from the rest"),
            "no sponsored poll check" to (extension + build.classes - build.runner to "advertiser sponsored poll check: expected one exact target, found 0"),
            "poll arm opens no poll" to (extension + build.classes.filterNot { it.type in build.pollModals } to "no longer opens the poll's own pop-up"),
            "missing status stub" to (build.classes + extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
                ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
                    owner.annotations, owner.fields, owner.methods.filterNot { it.name == "surveyPrompts" }) }
                to "no boolean method surveyPrompts()"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(input)
            val before = snapshot(context, input)
            val refusal = assertThrows(reason, PatchException::class.java) { hideSurveyPromptsPatch.execute(context) }
            assertTrue("$reason refused for another reason: ${refusal.message}", refusal.message.orEmpty().contains(message))
            assertArrayEquals("$reason left retained edits", before, snapshot(context, input))
            assertEquals("$reason left the family flag set", 0, flag(context, "hideSurveyPrompts"))
        }
    }

    private fun flag(context: BytecodePatchContext, name: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.implementation!!.instructions.first()
            as NarrowLiteralInstruction).narrowLiteral

    private fun snapshot(context: BytecodePatchContext, classes: List<ClassDef>): ByteArray {
        val pool = DexPool(Opcodes.getDefault())
        classes.forEach { pool.internClass(context.mutableClassDefBy(it.type)) }
        val store = MemoryDataStore()
        try {
            pool.writeTo(store)
            return store.data
        } finally {
            store.close()
        }
    }

    private fun patched(context: BytecodePatchContext, method: Method) =
        context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
        }.implementation!!.instructions.toList()

    private fun registers(instruction: Instruction): List<Int> {
        val call = instruction as FiveRegisterInstruction
        return listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG).take(call.registerCount)
    }

    /** The registers [method]'s parameters and its receiver take. */
    private fun parameterSlots(method: Method) =
        1 + method.parameterTypes.map { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }.sum()

    /** The code unit address of instruction [at]. */
    private fun address(instructions: List<Instruction>, at: Int) = instructions.take(at).sumOf { it.codeUnits }

    private fun rename(owner: ClassDef, type: String) = ImmutableClassDef(type, owner.accessFlags, owner.superclass, owner.interfaces,
        owner.sourceFile, owner.annotations, emptyList(), owner.methods.map { method ->
            ImmutableMethod(type, method.name, method.parameters, method.returnType, method.accessFlags, method.annotations,
                method.hiddenApiRestrictions, method.implementation)
        })

    /** A Maybe later handler's method: it names the counter format and reads [SURVEY_DECLINE] off its enum. */
    private fun Method.isSurveyDecline(): Boolean {
        val body = instructions()
        return body.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == SURVEY_DECLINE_COUNTER } &&
            fields().any { it.name == SURVEY_DECLINE && it.type == it.definingClass }
    }

    /**
     * The launcher's class, the one class holding Maybe later's handler, the classes the launcher
     * stores Function1 fields into, the listeners it builds for them, and the dismiss reasons. Then
     * the one class whose method checks for a sponsored poll and also calls the launcher, and every
     * class that method builds.
     */
    private fun read(build: File): Build {
        val owners = mutableListOf<ClassDef>()
        val declines = mutableListOf<ClassDef>()
        val pollChecks = mutableListOf<ClassDef>()
        FixtureDex.forEach(build) { dex ->
            val names = dex.fieldSection.any { it.name == SURVEY_DECLINE }
            val polls = dex.fieldSection.any { it.name == SPONSORED_POLL }
            for (classDef in dex.classes) {
                if (classDef.methods.any { it.isSurveyLauncher() }) owners += ImmutableClassDef.of(classDef)
                if (names && classDef.methods.any { it.isSurveyDecline() }) declines += ImmutableClassDef.of(classDef)
                if (polls && classDef.methods.any { it.sponsoredPollArms().isNotEmpty() }) pollChecks += ImmutableClassDef.of(classDef)
            }
        }
        val owner = owners.singleOrNull() ?: error("${build.name}: ${owners.size} survey invite launcher classes")
        val decline = declines.singleOrNull() ?: error("${build.name}: ${declines.size} Maybe later handlers")
        val launcher = owner.methods.single { it.isSurveyLauncher() }
        val runners = pollChecks.filter { candidate ->
            candidate.methods.any { method ->
                method.sponsoredPollArms().isNotEmpty() && method.calls().any { call ->
                    call.definingClass == launcher.definingClass && call.name == launcher.name &&
                        call.parameters() == launcher.parameters() && call.returnType == launcher.returnType
                }
            }
        }
        val runner = runners.singleOrNull() ?: error("${build.name}: ${runners.size} classes check for a sponsored poll and launch the invite")
        val body = launcher.implementation!!.instructions.toList()
        val related = mutableSetOf(ALERT_DISMISS_REASON)
        for ((at, instruction) in body.withIndex()) {
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: continue
            if (instruction.opcode != Opcode.IPUT_OBJECT || field.type != FUNCTION1) continue
            related += field.definingClass
            ((body.getOrNull(at - 2) as? ReferenceInstruction)?.reference as? TypeReference)?.let { related += it.type }
        }
        for (method in runner.methods) for (instruction in method.instructions()) {
            if (instruction.opcode == Opcode.NEW_INSTANCE) related += ((instruction as ReferenceInstruction).reference as TypeReference).type
        }
        related -= setOf(owner.type, decline.type, runner.type)
        val classes = FixtureDex.classes(build, related)
        check(ALERT_DISMISS_REASON in classes) { "${build.name}: no $ALERT_DISMISS_REASON" }
        val built = Build(build.name, owner, decline, runner, classes.values.toList())
        check(built.pollModals.isNotEmpty()) { "${build.name}: nothing the sponsored poll check builds makes $POLL_VIEW" }
        return built
    }

    private companion object {
        const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
    }
}

/** True when this method builds the sponsored poll's own view. */
private fun Method.buildsPollView() = instructions().any {
    it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == POLL_VIEW
}

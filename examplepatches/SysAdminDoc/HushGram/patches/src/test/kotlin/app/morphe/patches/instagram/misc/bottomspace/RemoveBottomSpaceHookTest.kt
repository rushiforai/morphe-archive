/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.bottomspace

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class RemoveBottomSpaceHookTest {
    @Test
    fun theHookIsInTheExtension() {
        val declared = ExtensionDex.classDef(NAVIGATION_BAR_HEIGHT.substringBefore("->")).methods
            .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
            .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("$NAVIGATION_BAR_HEIGHT is not in the extension: $declared", NAVIGATION_BAR_HEIGHT.substringAfter("->") in declared)
    }

    @Test
    fun theGuessPassesThroughTheSwitch() {
        val context = PatchContexts.of(listOf(listenerClass(), dimensionsClass()))

        val guess = context.findGuessedNavigationBar()
        assertEquals(LISTENER, guess.type)
        assertEquals(3, guess.at)
        assertEquals(1, guess.register)
        context.dropGuessedNavigationBar(guess)

        assertDropped("stand-in", context.mutableClassDefBy(LISTENER).methods.single { it.name == "onInsets" })
    }

    @Test
    fun aListenerReadingTheGuessTwiceFailsThePatch() {
        val context = PatchContexts.of(listOf(listenerClass(reads = 2), dimensionsClass()))
        assertThrows(PatchException::class.java) { context.findGuessedNavigationBar() }
    }

    /** A Context-to-int helper that doesn't load the dimension is some other size. */
    @Test
    fun aHelperNotReadingTheDimensionFailsThePatch() {
        val context = PatchContexts.of(listOf(listenerClass(), dimensionsClass(dimension = "status_bar_height")))
        assertThrows(PatchException::class.java) { context.findGuessedNavigationBar() }
    }

    @Test
    fun noListenerFailsThePatch() {
        val context = PatchContexts.of(listOf(listenerClass(notFound = false), dimensionsClass()))
        assertThrows(PatchException::class.java) { context.findGuessedNavigationBar() }
    }

    /** In each declared build the insets listener is found and its one guess goes through the switch. */
    @Test
    fun eachDeclaredBuildDropsTheGuess() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        var checked = 0
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                val holders = mutableListOf<ClassDef>()
                FixtureDex.forEach(bundle) { dex ->
                    for (classDef in dex.classes) {
                        if (classDef.methods.any { it.loads(SHOW_NAVIGATION_BAR) }) holders += ImmutableClassDef.of(classDef)
                    }
                }
                val context = PatchContexts.of(holders.distinctBy { it.type })

                val guess = context.findGuessedNavigationBar()
                context.dropGuessedNavigationBar(guess)
                val method = context.mutableClassDefBy(guess.type).methods.single {
                    it.name == guess.name && it.parameterTypes.map(CharSequence::toString) == guess.parameters
                }
                assertDropped("${bundle.name} ${guess.type}->${guess.name}", method)
                checked++
            }
        }
        assertTrue("no fixture of a declared build", checked > 0)
    }

    /**
     * One hook, right after the move-result of a static Context-to-int call, passing and getting
     * back that register, and no branch in the method lands on it.
     */
    private fun assertDropped(what: String, method: Method) {
        val code = method.implementation!!.instructions.toList()
        val hooks = code.withIndex().filter { (it.value as? ReferenceInstruction)?.reference?.toString() == NAVIGATION_BAR_HEIGHT }
        assertEquals("$what: hooks", 1, hooks.size)
        val (at, hook) = hooks.single()
        val read = code[at - 2]
        assertTrue("$what: a static call two before the hook", read.opcode == Opcode.INVOKE_STATIC || read.opcode == Opcode.INVOKE_STATIC_RANGE)
        assertEquals("$what: the call's parameters", listOf("Landroid/content/Context;"),
            ((read as ReferenceInstruction).reference as MethodReference).parameterTypes.map(CharSequence::toString))
        val moved = code[at - 1]
        assertEquals("$what: the height moved out before the hook", Opcode.MOVE_RESULT, moved.opcode)
        val register = (moved as OneRegisterInstruction).registerA
        assertEquals("$what: the hook's register", register, (hook as RegisterRangeInstruction).startRegister)
        assertEquals("$what: one register", 1, hook.registerCount)
        assertEquals("$what: the answer", Opcode.MOVE_RESULT, code[at + 1].opcode)
        assertEquals("$what: back into the register", register, (code[at + 1] as OneRegisterInstruction).registerA)

        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        for ((index, instruction) in code.withIndex()) {
            if (instruction !is OffsetInstruction) continue
            assertTrue("$what: the branch at $index lands on the hook", addresses[index] + instruction.codeOffset != addresses[at])
        }
    }

    private fun Method.loads(value: String) = implementation?.instructions?.any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
    } == true

    private companion object {
        const val LISTENER = "Lfixture/WindowInsets;"
        const val DIMENSIONS = "Lfixture/Dimensions;"

        val GUESS = ImmutableMethodReference(DIMENSIONS, "navigationBar", listOf("Landroid/content/Context;"), "I")

        /**
         * A static (Context)I shaped like the listener on 449: it loads the two strings, reads the
         * guess into v1 and answers it.
         *
         *     const-string v0, "config_showNavigationBar"
         *     const-string v0, "_hasNavigationBar_notFound"
         *     invoke-static {v3}, navigationBar(Context)I
         *     move-result v1
         *     return v1
         */
        fun listenerClass(reads: Int = 1, notFound: Boolean = true): ClassDef {
            val code = mutableListOf<Instruction>(
                ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(SHOW_NAVIGATION_BAR)),
                ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(if (notFound) NAVIGATION_BAR_NOT_FOUND else "_other")),
            )
            repeat(reads) {
                code += ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 3, 0, 0, 0, 0, GUESS)
                code += ImmutableInstruction11x(Opcode.MOVE_RESULT, 1)
            }
            code += ImmutableInstruction11x(Opcode.RETURN, 1)
            return stand(LISTENER, "onInsets", 4, code)
        }

        /** The helper the guess comes from: loads [dimension] and answers 0. */
        fun dimensionsClass(dimension: String = NAVIGATION_BAR_DIMENSION): ClassDef = stand(
            DIMENSIONS, GUESS.name, 2,
            listOf(
                ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(dimension)),
                ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                ImmutableInstruction11x(Opcode.RETURN, 0),
            ),
        )

        private fun stand(type: String, name: String, registers: Int, code: List<Instruction>): ClassDef {
            val method = ImmutableMethod(
                type, name, listOf(ImmutableMethodParameter("Landroid/content/Context;", null, null)), "I",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value, null, null,
                ImmutableMethodImplementation(registers, code, null, null),
            )
            return ImmutableClassDef(
                type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;",
                null, null, null, null, listOf(method),
            )
        }
    }
}

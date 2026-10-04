/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.direct.seen

import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.instagram.misc.extension.parameterRegisterNumber
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21s
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class VisualSeenHookTest {
    @Test fun theOptInPatchIsExcludedFromDefaultBuilds() {
        assertFalse(viewDmMediaAnonymouslyPatch.default)
    }

    @Test fun aHeldVisualMutationCompletesOnceAndOtherHandlersAreUnchanged() {
        val input = classes()
        val context = PatchContexts.of(input)
        val found = context.findVisualSeen()
        val before = input.associate { it.type to snapshot(it.methods) }
        context.holdBackVisualSeen()
        val patched = context.mutableClassDefBy(HANDLER).methods.single { it.name == "send" }
        assertVisualGuard(patched, found.complete.toString())
        for (candidate in input.filter { it.type != HANDLER }) {
            assertEquals("${candidate.type} changed", before[candidate.type], snapshot(context.mutableClassDefBy(candidate.type).methods))
        }
        assertEquals(1, traceGuard(patched, true).completed)
        assertEquals(0, traceGuard(patched, true).sent)
        assertEquals(0, traceGuard(patched, false).completed)
        assertEquals(1, traceGuard(patched, false).sent)
    }

    /** A restarted queued visual task calls completion again; other queued work remains. */
    @Test fun completionLeavesVoiceAndOrdinaryTasksForTheNativeQueue() {
        val disk = linkedSetOf("visual", "voice", "thread")
        val context = PatchContexts.of(classes())
        context.holdBackVisualSeen()
        val patched = context.mutableClassDefBy(HANDLER).methods.single { it.name == "send" }
        val queueAfterRestart = disk.toMutableSet()
        traceGuard(patched, true) {
            queueAfterRestart.remove("visual")
            disk.clear()
            disk.addAll(queueAfterRestart)
        }
        assertEquals(setOf("voice", "thread"), disk)
        assertFalse("a new process has no held visual task to resend", "visual" in disk.toMutableSet())
        assertEquals("a repeated handler still finishes once", 1, traceGuard(patched, true).completed)
    }

    @Test fun aVoiceOnlyCandidateIsRefused() = refuses(classes().filter { it.type != HANDLER })
    @Test fun duplicateVisualHandlersAreRefused() = refuses(classes() + handler("Lfixture/SecondVisualHandler;"))
    @Test fun aMissingExtensionIsRefused() = refuses(classes().filter { it.type != VISUAL_SEEN })
    @Test fun aNonPublicCompletionInterfaceIsRefused() = refuses(classes().map {
        if (it.type == CALLBACK) clazz(CALLBACK, it.methods.toList(), AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value) else it
    })

    @Test fun theWrongMutationCastIsRefused() = changed(HANDLER, "send") {
        it[0] = typed(Opcode.CHECK_CAST, 4, MUTATION)
    }
    @Test fun theWrongFactoryCallbackIsRefused() = changed(HANDLER, "send") {
        it[4] = call(Opcode.INVOKE_STATIC, listOf(0, 3), FACTORY, "make", listOf(USER_SESSION, CALLBACK), RESPONSE)
    }
    @Test fun aFactoryThatSubstitutesItsCallbackIsRefused() = changed(FACTORY, "make") {
        it[1] = call(Opcode.INVOKE_STATIC, listOf(0, 2, 0), FACTORY, "write", listOf(OBJECT, USER_SESSION, CALLBACK), RESPONSE)
    }
    @Test fun aFactoryThatOverwritesTheCallbackIsRefused() = changed(FACTORY, "make") {
        it.add(1, ImmutableInstruction11n(Opcode.CONST_4, 3, 0))
    }
    @Test fun aWriterThatStoresAnotherCallbackIsRefused() = changed(FACTORY, "write") {
        it[2] = ImmutableInstruction22c(Opcode.IPUT_OBJECT, 2, 1, CALLBACK_FIELD)
    }
    @Test fun aWriterThatReturnsAnotherObjectIsRefused() = changed(FACTORY, "write") {
        it[3] = ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)
    }
    @Test fun aWriterThatBypassesAllocationThroughAnExceptionHandlerIsRefused() {
        val input = classes().map { candidate ->
            if (candidate.type != FACTORY) candidate else clazz(FACTORY, candidate.methods.map { old ->
                if (old.name != "write") old else {
                    val code = mutableListOf<Instruction>(
                        typed(Opcode.NEW_INSTANCE, 1, RESPONSE), ImmutableInstruction10t(Opcode.GOTO, 0),
                        ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 0), ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
                        ImmutableInstruction22c(Opcode.IPUT_OBJECT, 4, 1, CALLBACK_FIELD), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1),
                    )
                    code[1] = ImmutableInstruction10t(Opcode.GOTO, offset(code, 1, 4))
                    ImmutableMethod(old.definingClass, old.name, old.parameters, old.returnType, old.accessFlags, null, null,
                        ImmutableMethodImplementation(5, code, listOf(ImmutableTryBlock(0, code[0].codeUnits,
                            listOf(ImmutableExceptionHandler("Ljava/lang/Exception;", code.take(2).sumOf { it.codeUnits })))), null))
                }
            })
        }
        refuses(input)
    }
    @Test fun aSuccessCallbackThatLosesItsReceiverIsRefused() = changed(RESPONSE, "success") {
        it.add(3, ImmutableInstruction11n(Opcode.CONST_4, 0, 0))
    }
    @Test fun aSuccessCallbackWithAWideHalfOverwriteIsRefused() = changed(RESPONSE, "success") {
        it.add(3, ImmutableInstruction21s(Opcode.CONST_WIDE_16, 0, 0))
    }
    @Test fun aRegistryThatSubstitutesItsProviderIsRefused() = changed(REGISTRY, "register") {
        it[7] = call(Opcode.INVOKE_DIRECT, listOf(3, 7, 1, 4, 0), "Lfixture/Descriptor;", "<init>", listOf(OBJECT, WRAPPER, WRAPPER, STRING), "V")
    }
    @Test fun aProviderThatReturnsAnotherObjectIsRefused() = changed(PROVIDER, "get") {
        it[2] = ImmutableInstruction11x(Opcode.RETURN_OBJECT, 1)
    }
    @Test fun theWrongClassNameSelectorIsRefused() = changed(BASE, "name") {
        it[0] = ImmutableInstruction22c(Opcode.INSTANCE_OF, 0, 1, com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference("Lfixture/VoiceMutation;"))
    }
    @Test fun aCreatorThatDispatchesAnotherMutationIsRefused() = changed(CREATOR, "open") {
        it[2] = call(Opcode.INVOKE_VIRTUAL, listOf(3, 1), MANAGER, "dispatch", listOf(BASE), "Z")
    }
    @Test fun aCreatorThatLosesItsVisualMutationIsRefused() = changed(CREATOR, "open") {
        it.add(2, ImmutableInstruction11n(Opcode.CONST_4, 0, 0))
    }

    private fun changed(type: String, name: String, change: (MutableList<Instruction>) -> Unit) = refuses(replace(classes(), type, name, change))
    private fun refuses(input: List<ClassDef>) {
        val context = PatchContexts.of(input)
        val before = input.associate { it.type to snapshot(it.methods) }
        assertThrows(PatchException::class.java) { context.holdBackVisualSeen() }
        input.forEach { assertEquals("${it.type} was edited before refusal", before[it.type], snapshot(context.mutableClassDefBy(it.type).methods)) }
    }

    companion object {
        internal fun assertVisualGuard(method: Method, completion: String) {
            val code = method.visualCode()
            assertEquals(1, code.count { it.visualReference()?.toString() == HOLD_VISUAL_SEEN })
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
                Opcode.MOVE_OBJECT_FROM16, Opcode.CONST_4, Opcode.INVOKE_INTERFACE, Opcode.RETURN_VOID), code.take(7).map { it.opcode })
            assertTrue(code[0].namedRegisters().isEmpty())
            assertEquals(HOLD_VISUAL_SEEN, code[0].visualReference().toString())
            assertEquals(method.parameterRegisterNumber(1), (code[3] as TwoRegisterInstruction).registerB)
            assertEquals(completion, code[5].visualReference().toString())
            assertEquals(listOf(1, 0, 0), code[5].namedRegisters())
            assertEquals(Opcode.CHECK_CAST, code[7].opcode)
            assertEquals("off branches directly to Instagram's original first instruction", setOf(3, 7), ControlFlow.of(method).normal[2].toSet())
        }

        internal fun snapshot(methods: Iterable<Method>) = methods.map { method ->
            method.toString() to method.visualCode().map { Triple(it.opcode, it.visualReference()?.toString(), it.namedRegisters()) }
        }

        internal data class Trace(val completed: Int, val sent: Int)
        /** Executes the injected instructions, with the app's callback supplied by the harness. */
        internal fun traceGuard(method: Method, held: Boolean, completion: () -> Unit = {}): Trace {
            val code = method.visualCode()
            val flow = ControlFlow.of(method)
            val registers = mutableMapOf<Int, Any?>()
            val callback = Any()
            registers[method.parameterRegisterNumber(1)] = callback
            var at = 0
            var completed = 0
            while (at < 7) {
                val instruction = code[at]
                when (instruction.opcode) {
                    Opcode.INVOKE_STATIC -> assertEquals(HOLD_VISUAL_SEEN, instruction.visualReference().toString())
                    Opcode.MOVE_RESULT -> registers[(instruction as OneRegisterInstruction).registerA] = held
                    Opcode.IF_EQZ -> if (registers[(instruction as OneRegisterInstruction).registerA] == false) {
                        at = flow.normal[at].single { it != at + 1 }
                        continue
                    }
                    Opcode.MOVE_OBJECT_FROM16 -> (instruction as TwoRegisterInstruction).let { registers[it.registerA] = registers[it.registerB] }
                    Opcode.CONST_4 -> registers[(instruction as OneRegisterInstruction).registerA] = null
                    Opcode.INVOKE_INTERFACE -> {
                        val args = instruction.namedRegisters().map { registers[it] }
                        assertEquals(listOf(callback, null, null), args)
                        completion()
                        completed++
                    }
                    Opcode.RETURN_VOID -> return Trace(completed, 0)
                    else -> error("unsupported guard instruction ${instruction.opcode}")
                }
                at++
            }
            assertEquals(7, at)
            return Trace(completed, 1)
        }
    }
}

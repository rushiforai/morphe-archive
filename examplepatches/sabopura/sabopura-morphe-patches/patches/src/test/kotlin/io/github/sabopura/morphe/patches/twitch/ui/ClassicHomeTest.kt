package io.github.sabopura.morphe.patches.twitch.ui

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

class ClassicHomeTest {
    private val prewarmer = "Ltv/twitch/android/feature/discovery/feed/rn/feed/TwitchRNFeedPrewarmer;"

    private fun call(owner: String, name: String, returnType: String, vararg parameters: String) =
        ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1 + parameters.size, 0, 1, 0, 0, 0,
            ImmutableMethodReference(owner, name, parameters.toList(), returnType))

    private fun built(type: String) = ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, ImmutableTypeReference(type))

    private fun method(owner: String, name: String, returnType: String, code: List<Instruction>?, registers: Int = 2,
                       parameters: List<String> = emptyList(), flags: Int = AccessFlags.PUBLIC.value) =
        ImmutableMethod(owner, name, parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, returnType, flags,
            emptySet(), emptySet(), code?.let { ImmutableMethodImplementation(registers, it, emptyList(), emptyList()) })

    /** 31.9.0's prewarmIfEnabled with platform boolean calls added around the decision. */
    private fun prewarm(vararg decisions: Instruction) = method(prewarmer, "prewarmIfEnabled", "V", listOf(
        call("Ljava/lang/Object;", "getClass", "Ljava/lang/Class;"),
        call("Landroid/content/Context;", "isRestricted", "Z"),
        call("Landroidx/fragment/app/Fragment;", "isAdded", "Z"),
        *decisions,
        call("Ltv/twitch/android/feature/discovery/feed/rn/runtime/TwitchRNHost;", "prewarm", "Z", "Landroid/content/Context;"),
        call("Ltv/twitch/android/feature/discovery/feed/rn/feed/TwitchRNFeedPreloadHolder;", "startPreload", "V"),
        ImmutableInstruction10x(Opcode.RETURN_VOID)), parameters = listOf("Landroid/content/Context;"))

    private fun failsWithContract(block: () -> Unit) {
        try {
            block()
            fail("expected a contract failure")
        } catch (expected: PatchException) {
            assertTrue(expected.message!!, "Classic home" in expected.message!!)
        }
    }

    @Test fun findsTheDecisionAmongPlatformAndArgumentCalls() {
        val found = ultralightDecisionCall(prewarm(call("Lf260;", "a", "Z")))
        assertEquals("Lf260;->a()Z", found.toString())
    }

    @Test fun theSameDecisionAskedTwiceIsStillOne() {
        val found = ultralightDecisionCall(prewarm(call("Lnt50;", "a", "Z"), call("Lnt50;", "a", "Z")))
        assertEquals("Lnt50;->a()Z", found.toString())
    }

    @Test fun twoCandidateDecisionsFailThePatch() {
        failsWithContract { ultralightDecisionCall(prewarm(call("Lf260;", "a", "Z"), call("Lyj50;", "n", "Z"))) }
    }

    @Test fun noDecisionFailsThePatch() {
        failsWithContract { ultralightDecisionCall(prewarm()) }
    }

    private val concreteBody = listOf(ImmutableInstruction11n(Opcode.CONST_4, 0, 1), ImmutableInstruction11x(Opcode.RETURN, 0))

    @Test fun aConcreteDecisionIsItsOwnBody() {
        val decision = method("Lf260;", "a", "Z", concreteBody)
        val owner = ImmutableClassDef("Lf260;", AccessFlags.PUBLIC.value, "Ljava/lang/Object;", listOf("Le260;"), null,
            emptySet(), emptyList(), listOf(decision))
        val (type, body) = decisionBody(ImmutableMethodReference("Lf260;", "a", emptyList(), "Z"), owner) {
            throw AssertionError("a concrete decision needs no lookup")
        }
        assertSame(owner, type)
        assertEquals("a", body.name)
    }

    @Test fun anInterfaceDecisionResolvesToItsOneImplementation() {
        val abstract = AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value
        val contract = ImmutableClassDef("Le260;", abstract or AccessFlags.INTERFACE.value, "Ljava/lang/Object;", emptyList(),
            null, emptySet(), emptyList(), listOf(method("Le260;", "a", "Z", null, flags = abstract)))
        val implementation = ImmutableClassDef("Lf260;", AccessFlags.PUBLIC.value, "Ljava/lang/Object;", listOf("Le260;"), null,
            emptySet(), emptyList(), listOf(method("Lf260;", "a", "Z", concreteBody), method("Lf260;", "b", "Z", concreteBody)))
        val unrelated = ImmutableClassDef("Lg260;", AccessFlags.PUBLIC.value, "Ljava/lang/Object;", listOf("Le260;"), null,
            emptySet(), emptyList(), listOf(method("Lg260;", "c", "Z", concreteBody)))
        val (type, body) = decisionBody(ImmutableMethodReference("Le260;", "a", emptyList(), "Z"), contract) {
            listOf(implementation, unrelated)
        }
        assertSame(implementation, type)
        assertEquals("Lf260;", body.definingClass)
    }

    @Test fun twoImplementationsFailThePatch() {
        val abstract = AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value
        val contract = ImmutableClassDef("Le260;", abstract or AccessFlags.INTERFACE.value, "Ljava/lang/Object;", emptyList(),
            null, emptySet(), emptyList(), listOf(method("Le260;", "a", "Z", null, flags = abstract)))
        val implementations = listOf("Lf260;", "Lg260;").map { type ->
            ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", listOf("Le260;"), null,
                emptySet(), emptyList(), listOf(method(type, "a", "Z", concreteBody)))
        }
        failsWithContract { decisionBody(ImmutableMethodReference("Le260;", "a", emptyList(), "Z"), contract) { implementations } }
    }

    private val destinations = setOf("Lxdr;", "Lvdr;")

    /** 31.9.0's ef90.f: the React Native home when the decision says yes, the native home otherwise. */
    private fun picker(vararg types: String): Method =
        method("Lef90;", "f", "Llgr;", listOf(call("Lf260;", "a", "Z")) + types.map(::built) + ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0))

    @Test fun theNativeHomeIsTheOtherDestinationThePickerBuilds() {
        assertEquals("Lvdr;", nativeHomeDestination(picker("Lxdr;", "Lsome/Lambda;", "Lvdr;"), "Lxdr;") { it in destinations })
    }

    @Test fun aPickerWithoutTheNativeHomeFailsThePatch() {
        failsWithContract { nativeHomeDestination(picker("Lxdr;", "Lsome/Lambda;"), "Lxdr;") { it in destinations } }
    }

    /** f260.a's start: v0 is overwritten before any read; p0 is v1. */
    private fun decision(registers: Int) = MutableMethod(method("Lf260;", "a", "Z", listOf(
        ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, registers - 1, ImmutableFieldReference("Lf260;", "e", "Lerg;")),
        ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
        ImmutableInstruction11x(Opcode.RETURN, 0)), registers))

    @Test fun answersNoWhenForcedAndOtherwiseRunsTwitchsCode() {
        val method = decision(registers = 2)
        method.answerNoForClassicHome()
        val code = method.instructions.toList()
        assertEquals("Lio/github/sabopura/morphe/extension/twitch/app/ClassicHome;->forced()Z",
            (code[0] as ReferenceInstruction).reference.toString())
        val scratch = (code[1] as OneRegisterInstruction).registerA
        assertTrue("scratch v$scratch must be a local, not p0", scratch < 1)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(listOf(Opcode.CONST_4, Opcode.RETURN), listOf(code[3].opcode, code[4].opcode))
        assertEquals(scratch, (code[3] as OneRegisterInstruction).registerA)
        assertEquals(scratch, (code[4] as OneRegisterInstruction).registerA)
        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        val target = addresses[2] + (code[2] as OffsetInstruction).codeOffset
        assertEquals(Opcode.IGET_OBJECT, code[addresses.indexOf(target)].opcode)
    }

    @Test fun aDecisionWithoutLocalsFailsThePatch() {
        failsWithContract { decision(registers = 1).answerNoForClassicHome() }
    }
}

/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.reels.tablayout

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
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
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/** Tab bar layout: every return of Instagram's newer tab bar gate hands its answer to the extension first (#356). */
class TabBarLayoutHookTest {
    private val session = "Lcom/instagram/common/session/UserSession;"
    private val configs = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;"
    private val gateType = "Lfixture/NavGate;"
    private val flagHex = NEW_TAB_BAR_FLAG.toString(16)

    /** The hook the patch writes is in the TabBarLayout the bundle ships, public and static. */
    @Test
    fun theHookIsInTheExtension() {
        val declared = ExtensionDex.classDef(TAB_BAR_LAYOUT).methods
            .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
            .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("$NEW_TAB_BAR is not in the extension: $declared", NEW_TAB_BAR.substringAfter("->") in declared)
    }

    /** Each return gets the call and its answer, a branch to a return goes through it, and nothing else changes. */
    @Test
    fun everyReturnOfTheGateIsAnswered() {
        val context = PatchContexts.of(classes())
        context.hookTabBarGate()
        val gate = context.mutableClassDefBy(gateType).methods.single { it.name == "A05" }
        assertAnswered("stand-in", gate, 3)
        assertEquals("what else was added", gateCode().size + 6, gate.code().size)
        val other = context.mutableClassDefBy(gateType).methods.single { it.name == "A03" }
        assertEquals("the string read stays as it is", 0, other.code().count { it.referenceText() == NEW_TAB_BAR })
    }

    /** A build the patch can't read fails at patch time, saying what it found, before anything is written. */
    @Test
    fun aBuildThePatchCantReadFailsBeforeAnythingChanges() {
        val cases = listOf(
            classes(flag = NEW_TAB_BAR_FLAG + 1) to "found 0",
            classes(twoGates = true) to "found 2",
            classes(parameters = listOf("Ljava/lang/Object;")) to "found 0",
            classes(boolean = false) to "found 0",
        )
        for ((classes, message) in cases) {
            val failure = assertThrows(PatchException::class.java) { PatchContexts.of(classes).hookTabBarGate() }
            assertTrue("${failure.message}", failure.message!!.contains("Tab bar layout: ") && failure.message!!.contains(message))
        }
    }

    /** On every 452 build: one gate, every return answered, and every branch that reached a return now reaches the call. */
    @Test
    fun eachBuildAnswersEveryReturnOfTheGate() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        val bundles = versions.flatMap { version -> Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") } } + Fixtures.otherBuilds()
        assertEquals("every 452 build: ${bundles.map { it.name }}", Fixtures.BUILDS, bundles.size)
        for (bundle in bundles) {
            val holders = mutableListOf<ClassDef>()
            FixtureDex.forEach(bundle) { dex ->
                for (classDef in dex.classes) {
                    if (classDef.methods.any { it.loadsFlag() }) holders += ImmutableClassDef.of(classDef)
                }
            }
            assertTrue("${bundle.name}: classes loading $flagHex: ${holders.map { it.type }}", holders.isNotEmpty())
            val context = PatchContexts.of(holders)
            val found = context.findTabBarGate()
            val returns = found.code().count { it.opcode == Opcode.RETURN }
            context.hookTabBarGate()
            val gate = context.mutableClassDefBy(found.definingClass).methods.single {
                it.name == found.name && it.parameterTypes.map(CharSequence::toString) == listOf(session)
            }
            assertAnswered(bundle.name, gate, returns)
        }
    }

    /** Right before each return: the range call with the returned register, and its answer back in it. No branch lands on a bare return. */
    private fun assertAnswered(what: String, method: Method, returns: Int) {
        val code = method.code()
        val rets = code.indices.filter { code[it].opcode == Opcode.RETURN }
        assertEquals("$what: returns", returns, rets.size)
        assertEquals("$what: hooks", returns, code.count { it.referenceText() == NEW_TAB_BAR })
        for (index in rets) {
            val register = (code[index] as OneRegisterInstruction).registerA
            assertEquals("$what: the call before $index", NEW_TAB_BAR, code[index - 2].referenceText())
            assertEquals("$what: what it's handed", register, (code[index - 2] as RegisterRangeInstruction).startRegister)
            assertEquals("$what: the answer", Opcode.MOVE_RESULT, code[index - 1].opcode)
            assertEquals("$what: the register", register, (code[index - 1] as OneRegisterInstruction).registerA)
        }
        val targets = code.withIndex().mapNotNull { (from, instruction) ->
            (instruction as? OffsetInstruction)?.let { code.indexAtUnits(code.unitsBefore(from) + it.codeOffset) }
        }
        for (target in targets) {
            assertTrue("$what: a branch lands on the return at $target, past the hook", code[target].opcode != Opcode.RETURN)
        }
    }

    private fun List<Instruction>.unitsBefore(index: Int): Int = take(index).sumOf { it.codeUnits }

    private fun List<Instruction>.indexAtUnits(units: Int): Int {
        var at = 0
        for ((index, instruction) in withIndex()) {
            if (at == units) return index
            at += instruction.codeUnits
        }
        error("no instruction at $units code units")
    }

    /** Shaped like 452's 07xk.A05: an override first, then the config, then a second gate, with a branch straight to a return. */
    private fun gateBody(flag: Long = NEW_TAB_BAR_FLAG, boolean: Boolean = true) = """
        const/4 v4, 0x0
        invoke-static {v5}, Lfixture/Override;->of($session)Ljava/lang/Object;
        move-result-object v1
        const/4 v3, 0x1
        if-eqz v1, :config
        sget-object v0, Lfixture/Override;->OPT_OUT:Ljava/lang/Object;
        if-eq v1, v0, :off
        :on
        return v3
        :config
        invoke-static {v5}, Lfixture/Configs;->of(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v2
        const-wide v0, 0x${flag.toString(16)}L
        check-cast v2, $configs
        invoke-interface {v2, v0, v1}, $configs->${if (boolean) "Bae(J)Z" else "Bah(J)J"}
        ${if (boolean) "move-result v0" else "move-result-wide v0"}
        if-nez v0, :on
        invoke-static {v5}, Lfixture/Second;->gate($session)Z
        move-result v0
        if-eqz v0, :off
        return v3
        :off
        return v4
    """.trimIndent()

    private fun gateCode(): List<Instruction> = method(gateType, "A05", listOf(session), "Z", 5, gateBody()).code()

    private fun classes(
        flag: Long = NEW_TAB_BAR_FLAG,
        twoGates: Boolean = false,
        parameters: List<String> = listOf(session),
        boolean: Boolean = true,
    ): List<ClassDef> {
        val stringRead = """
            invoke-static {v4}, Lfixture/Configs;->of(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v1
            const-wide v2, 0x${flag.toString(16)}L
            check-cast v1, $configs
            invoke-interface {v1, v2, v3}, $configs->BKE(J)Ljava/lang/String;
            move-result-object v0
            return-object v0
        """.trimIndent()
        val methods = listOfNotNull(
            method(gateType, "A05", parameters, "Z", 5, gateBody(flag, boolean)),
            method(gateType, "A03", listOf(session), "Ljava/lang/String;", 4, stringRead),
            if (twoGates) method(gateType, "A06", listOf(session), "Z", 5, gateBody(flag)) else null,
        )
        return listOf(ImmutableClassDef(gateType, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;", null, null, null, null, methods))
    }

    private fun method(owner: String, name: String, parameters: List<String>, returns: String, registers: Int, body: String): Method {
        val flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value
        val mutable = MutableMethod(
            ImmutableMethod(
                owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns, flags, null, null,
                ImmutableMethodImplementation(registers + parameters.size, emptyList(), null, null),
            ),
        )
        mutable.addInstructionsWithLabels(0, body.lines().filter { it.isNotBlank() }.joinToString("\n") { it.trim() })
        return ImmutableMethod.of(mutable)
    }

    private fun Method.loadsFlag(): Boolean = code().any {
        it.opcode == Opcode.CONST_WIDE && (it as WideLiteralInstruction).wideLiteral == NEW_TAB_BAR_FLAG
    }

    private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.referenceText(): String? = (this as? ReferenceInstruction)?.reference?.toString()
}

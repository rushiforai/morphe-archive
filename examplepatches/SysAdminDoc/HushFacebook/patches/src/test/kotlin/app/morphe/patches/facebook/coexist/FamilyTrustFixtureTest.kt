/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.coexist

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.util.MethodUtil
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

/**
 * The family-caller hook against each declared Facebook build. One evaluator judges all five of
 * Facebook's caller rules (anyone, a list of trusted apps, Meta's family signatures, a named Facebook
 * permission, and SameKey) for every guarded provider. The hook may widen only SameKey: the rule
 * that asks whether the caller carries Facebook's own key. Every other rule has to reach Facebook's
 * own code, unchanged, even for a caller that does carry this build's key.
 *
 * The evaluator's class and name and every rule's class are Redex's and differ between builds, so
 * the patch and this test both reach them through the real-named delegates.
 */
class FamilyTrustFixtureTest {
    private companion object {
        const val DELEGATES = "Lcom/facebook/secure/content/delegate/"

        /** The delegates of the four rules the hook must leave alone, each holding its own rule. */
        val OTHER_RULE_DELEGATES = listOf("ThirdParty", "TrustedApps", "Family", "FbPermission")
            .map { "$DELEGATES${it}ContentProviderDelegate;" }

        const val CONTEXT = "the provider's context"
        const val ACCEPTED = "accepted by the hook"
        const val FACEBOOK = "left to Facebook's own check"
    }

    private fun Instruction.reference() = (this as ReferenceInstruction).reference.toString()

    /**
     * The rule a delegate hands the evaluator, as the walk below tracks values: a static read of a
     * singleton, or a new instance of a rule class. Each delegate makes exactly one.
     */
    private fun ClassDef.rule(): String {
        val made = methods.flatMap { it.implementation?.instructions?.toList().orEmpty() }.mapNotNull {
            val reference = (it as? ReferenceInstruction)?.reference
            when {
                it.opcode == Opcode.SGET_OBJECT && reference is FieldReference &&
                    reference.type == reference.definingClass -> "field $reference"
                it.opcode == Opcode.NEW_INSTANCE -> "new $reference"
                else -> null
            }
        }.distinct()
        assertEquals("$type makes one rule", 1, made.size)
        return made.single()
    }

    /** An instruction as text, everything but its place: two bodies compare equal only if they are. */
    private fun Instruction.describe(): String = buildString {
        append(opcode.name)
        val self = this@describe
        if (self is OneRegisterInstruction) append(" a=").append(self.registerA)
        if (self is TwoRegisterInstruction) append(" b=").append(self.registerB)
        if (self is ThreeRegisterInstruction) append(" c=").append(self.registerC)
        if (self is FiveRegisterInstruction) {
            append(" regs=").append(listOf(self.registerC, self.registerD, self.registerE, self.registerF, self.registerG).take(self.registerCount))
        }
        if (self is RegisterRangeInstruction) append(" range=").append(self.startRegister).append('+').append(self.registerCount)
        if (self is ReferenceInstruction) append(" ref=").append(self.reference)
        if (self is WideLiteralInstruction) append(" literal=").append(self.wideLiteral)
        if (self is OffsetInstruction) append(" offset=").append(self.codeOffset)
    }

    /**
     * Runs the injected code of [patched] with p0 as the provider's context and p1 as [rule], until
     * it returns or reaches the first of Facebook's own instructions, at [prologue]. The extension
     * call is answered the way FamilySignatureTrust answers it (its tests pin this): true only when
     * the rule it's handed is the very SameKey singleton it's handed beside it and the caller carries
     * this build's key, which [sharesKey] says.
     */
    private fun walk(patched: Method, prologue: Int, rule: String, sharesKey: Boolean): String {
        val body = patched.implementation!!.instructions.toList()
        val addresses = body.runningFold(0) { address, it -> address + it.codeUnits }
        val parameters = patched.implementation!!.registerCount - MethodUtil.getParameterRegisterCount(patched)
        val registers = mutableMapOf(parameters to CONTEXT, parameters + 1 to rule)
        var result: String? = null
        var index = 0
        while (index != prologue) {
            val instruction = body[index]
            fun read(register: Int) = checkNotNull(registers[register]) { "v$register is read before it's written" }
            index += 1
            when (instruction.opcode) {
                Opcode.MOVE_OBJECT_FROM16 -> (instruction as TwoRegisterInstruction)
                    .let { registers[it.registerA] = read(it.registerB) }
                Opcode.SGET_OBJECT -> registers[(instruction as OneRegisterInstruction).registerA] = "field ${instruction.reference()}"
                Opcode.CONST_4 -> (instruction as OneRegisterInstruction)
                    .let { registers[it.registerA] = "int ${(instruction as WideLiteralInstruction).wideLiteral}" }
                Opcode.INVOKE_STATIC -> {
                    assertEquals("the only call is the extension's", ACCEPT_CALL, instruction.reference())
                    val call = instruction as FiveRegisterInstruction
                    val arguments = listOf(call.registerC, call.registerD, call.registerE).take(call.registerCount).map(::read)
                    assertEquals("the extension gets the context, the rule and SameKey", 3, arguments.size)
                    assertEquals("the extension gets the provider's context", CONTEXT, arguments[0])
                    result = (arguments[1] == arguments[2] && arguments[2].startsWith("field ") && sharesKey).toString()
                }
                Opcode.MOVE_RESULT -> registers[(instruction as OneRegisterInstruction).registerA] =
                    checkNotNull(result) { "move-result without a call" }.also { result = null }
                Opcode.IF_EQZ -> {
                    val branch = instruction as OneRegisterInstruction
                    if (read(branch.registerA) == "false") {
                        val target = addresses[index - 1] + (instruction as OffsetInstruction).codeOffset
                        index = addresses.indexOf(target).also { assertTrue("the branch lands on an instruction", it >= 0) }
                    }
                }
                Opcode.RETURN -> {
                    assertEquals("the hook answers true", "int 1", read((instruction as OneRegisterInstruction).registerA))
                    return ACCEPTED
                }
                else -> fail("the injected code runs ${instruction.opcode}")
            }
        }
        return FACEBOOK
    }

    @Test
    fun eachDeclaredBuildWidensOnlyTheSameKeyRule() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val delegates = FixtureDex.classes(bundle, setOf(TRUSTED_CALLER_DELEGATE, SAME_KEY_DELEGATE) + OTHER_RULE_DELEGATES)
                val delegate = checkNotNull(delegates[TRUSTED_CALLER_DELEGATE]) { "$name: no $TRUSTED_CALLER_DELEGATE" }
                val sameKeyDelegate = checkNotNull(delegates[SAME_KEY_DELEGATE]) { "$name: no $SAME_KEY_DELEGATE" }

                // The evaluator the delegate's two boolean checks share, resolved the way the patch does.
                val evaluator = delegate.methods
                    .filter { it.parameterTypes.isEmpty() && it.returnType == "Z" }
                    .mapNotNull { it.trustEvaluatorCall() }
                    .distinct()
                    .also { assertEquals("$name: one shared evaluator", 1, it.size) }
                    .single()

                // The SameKey rule, found the way the patch finds it, is the singleton that names itself so.
                val sameKey = sameKeyDelegate.sameKeyRule()
                val pool = FixtureDex.classes(bundle, setOf(evaluator.definingClass, sameKey.definingClass))
                val names = pool.getValue(sameKey.definingClass).methods.single { it.name == "toString" }
                    .implementation!!.instructions.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
                assertEquals("$name: $sameKey is Facebook's SameKey rule", listOf("SameKey"), names)

                val original = pool.getValue(evaluator.definingClass).methods.single { MethodUtil.methodSignaturesMatch(it, evaluator) }
                val originalBody = original.implementation!!.instructions.toList()

                // Each of the other four rules is one the evaluator judges, and none of them is SameKey.
                val others = OTHER_RULE_DELEGATES.map { type -> checkNotNull(delegates[type]) { "$name: no $type" }.rule() }
                for (rule in others) {
                    // A singleton rule is compared with its field, a rule with data is told by its class.
                    val (how, what) = rule.split(' ', limit = 2)
                    val opcode = if (how == "field") Opcode.SGET_OBJECT else Opcode.INSTANCE_OF
                    assertTrue("$name: the evaluator judges $rule",
                        originalBody.any { it.opcode == opcode && it.reference() == what })
                }
                assertEquals("$name: five distinct rules", 5, (others + "field $sameKey").distinct().size)

                val context = PatchContexts.of(listOf(delegate, sameKeyDelegate, pool.getValue(evaluator.definingClass)))
                context.trustSameKeyFamilyCallers()
                val patched = context.mutableClassDefBy(evaluator.definingClass).methods.single { MethodUtil.methodSignaturesMatch(it, evaluator) }
                val patchedBody = patched.implementation!!.instructions.toList()
                val prologue = patchedBody.size - originalBody.size

                // Facebook's own check follows the injected code instruction for instruction.
                assertEquals("$name: Facebook's own check is unchanged",
                    originalBody.map { it.describe() }, patchedBody.drop(prologue).map { it.describe() })

                // A caller carrying this build's key, such as a same-key Instagram, gets past the
                // evaluator early only under SameKey. The other four rules reach Facebook's own code.
                assertEquals("$name: SameKey widened for a same-key caller", ACCEPTED,
                    walk(patched, prologue, "field $sameKey", sharesKey = true))
                assertEquals("$name: SameKey is Facebook's to judge for any other caller", FACEBOOK,
                    walk(patched, prologue, "field $sameKey", sharesKey = false))
                for (rule in others) {
                    assertEquals("$name: $rule is Facebook's to judge", FACEBOOK,
                        walk(patched, prologue, rule, sharesKey = true))
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}

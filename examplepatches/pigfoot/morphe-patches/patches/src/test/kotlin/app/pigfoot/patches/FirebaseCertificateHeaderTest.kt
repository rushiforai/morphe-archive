package app.pigfoot.patches

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.pigfoot.patches.shared.firebase.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.instruction.*
import com.android.tools.smali.dexlib2.immutable.reference.*
import org.junit.Assert.*
import org.junit.Test

class FirebaseCertificateHeaderTest {
    private val sha1 = "0123456789abcdef0123456789abcdef01234567"
    private val contract = FirebaseCertificateHeaderContract(
        "Ltest/AuthTransport;->headers(Ljava/net/URLConnection;)V", "Ltest/Identity;", "packageName", "certificate",
        6, 0, 5, 2, 0, "Accept-Language")
    private fun string(value: String, register: Int) = ImmutableInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(value))
    private fun code(c: FirebaseCertificateHeaderContract): List<Instruction> {
        fun getter(name: String) = ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, c.identityRegister, 0, 0, 0, 0,
            ImmutableMethodReference(c.identityOwner, name, emptyList(), "Ljava/lang/String;"))
        fun set() = ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 3, c.connectionRegister, c.keyRegister, c.valueRegister, 0, 0,
            ImmutableMethodReference("Ljava/net/URLConnection;", "setRequestProperty", listOf("Ljava/lang/String;", "Ljava/lang/String;"), "V"))
        return listOf(getter(c.packageGetter), ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, c.valueRegister),
            string("X-Android-Package", c.keyRegister), set(), ImmutableInstruction10x(Opcode.NOP),
            getter(c.certificateGetter), ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, c.valueRegister),
            string("X-Android-Cert", c.keyRegister), set(), string(c.nextHeader, c.valueRegister),
            ImmutableInstruction10x(Opcode.RETURN_VOID))
    }
    private fun method(instructions: List<Instruction>, owner: String = "Ltest/AuthTransport;", registers: Int = contract.registerCount) =
        MutableMethod(ImmutableMethod(owner, "headers", listOf(ImmutableMethodParameter("Ljava/net/URLConnection;", emptySet(), null)),
            "V", 1, emptySet(), emptySet(), ImmutableMethodImplementation(registers, instructions, emptyList(), emptyList())))
    private fun snapshot(m: MutableMethod) = m.implementation!!.instructions.map {
        listOf(it.opcode, (it as? ReferenceInstruction)?.reference?.toString(), (it as? OneRegisterInstruction)?.registerA)
    }
    private fun reject(m: MutableMethod, c: FirebaseCertificateHeaderContract = contract, hash: String = sha1) {
        val before = snapshot(m)
        assertThrows(IllegalArgumentException::class.java) { restoreFirebaseCertificateHeader(m, hash, c) }
        assertEquals(before, snapshot(m))
    }

    @Test fun explicitNonPittContractPreservesAllOriginalInstructions() {
        val m = method(code(contract))
        val before = snapshot(m)
        restoreFirebaseCertificateHeader(m, sha1, contract)
        val after = snapshot(m)
        assertEquals(before, after.filterIndexed { i, _ -> i != 8 })
        assertEquals(listOf(Opcode.CONST_STRING, sha1.uppercase(java.util.Locale.ROOT), 0), after[8])
        assertEquals(6, m.implementation!!.registerCount)
    }

    @Test fun registerLayoutComesFromQualifiedAdapterNotHardcodedPittValues() {
        val c = contract.copy(registerCount = 8, identityRegister = 3, connectionRegister = 7, keyRegister = 4, valueRegister = 3)
        val m = method(code(c), registers = c.registerCount)
        restoreFirebaseCertificateHeader(m, sha1, c)
        assertEquals(3, (m.implementation!!.instructions.elementAt(8) as OneRegisterInstruction).registerA)
    }

    @Test fun unrelatedOwnerDoesNotBecomeEligibleFromHeaderStrings() {
        reject(method(code(contract), owner = "Lcom/google/firebase/installations/remote/FirebaseInstallationServiceClient;"))
    }

    @Test fun missingDuplicateReversedOrTruncatedHeadersRejectAtomically() {
        val original = code(contract)
        for (bad in listOf(original.filterIndexed { i, _ -> i != 7 }, original + string("X-Android-Cert", 2),
            original + string("X-Android-Package", 2), original.toMutableList().also {
                it[2] = string("X-Android-Cert", 2); it[7] = string("X-Android-Package", 2)
            }, original.take(9), emptyList())) reject(method(bad))
    }

    @Test fun wrongGetterKeyValueConnectionAndLifetimeRejectBeforeMutation() {
        val original = code(contract)
        val mutations = listOf(
            5 to ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 0, 0, 0, 0, 0,
                ImmutableMethodReference(contract.identityOwner, "other", emptyList(), "Ljava/lang/String;")),
            7 to string("X-Android-Cert", 1),
            6 to ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1),
            8 to ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 3, 4, 2, 0, 0, 0,
                ImmutableMethodReference("Ljava/net/URLConnection;", "setRequestProperty", listOf("Ljava/lang/String;", "Ljava/lang/String;"), "V")),
            9 to string("Accept-Language", 1),
            9 to string("Other-Header", 0)
        )
        for ((index, replacement) in mutations) reject(method(original.toMutableList().also { it[index] = replacement }))
        reject(method(original, registers = 7))
    }

    @Test fun reapplicationMalformedIdentityAndInvalidContractsRejectAtomically() {
        val m = method(code(contract))
        restoreFirebaseCertificateHeader(m, sha1, contract)
        reject(m)
        for (bad in listOf("", "g".repeat(40), sha1 + "00")) reject(method(code(contract)), hash = bad)
        reject(method(code(contract)), contract.copy(keyRegister = contract.valueRegister))
        reject(method(code(contract)), contract.copy(connectionRegister = 16))
    }
}

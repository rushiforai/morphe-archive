package app.pigfoot.patches

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.pigfoot.patches.bitwarden.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.instruction.*
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import org.junit.Assert.*
import org.junit.Test

class BitwardenPolicyTest {
    private val notAllowed = ImmutableFieldReference(BITWARDEN_NOT_ALLOWED, "a", BITWARDEN_NOT_ALLOWED)
    private val sigNotFound = ImmutableFieldReference(BITWARDEN_SIGNATURE_NOT_FOUND, "a", BITWARDEN_SIGNATURE_NOT_FOUND)
    private val params = listOf("Lnc1;", "Ljava/lang/String;", "Ljava/lang/String;", "Z").map { ImmutableMethodParameter(it, emptySet(), null) }

    private fun method(reads: List<ImmutableFieldReference>, owner: String = BITWARDEN_VALIDATOR, returnType: String = "Lmya;") =
        MutableMethod(ImmutableMethod(owner, "f", params, returnType, 9, emptySet(), emptySet(),
            ImmutableMethodImplementation(8,
                reads.mapIndexed { i, ref -> ImmutableInstruction21c(Opcode.SGET_OBJECT, i, ref) } +
                    listOf(ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)), emptyList(), emptyList())))

    @Test fun onlyTheQualifiedPackageVersionAndBuildAreEligible() {
        requireBitwardenTarget(BITWARDEN_PACKAGE, BITWARDEN_VERSION, BITWARDEN_CODE)
        for ((pkg, version, code) in listOf(Triple("other", BITWARDEN_VERSION, BITWARDEN_CODE),
            Triple(BITWARDEN_PACKAGE, "2026.9.0", BITWARDEN_CODE), Triple(BITWARDEN_PACKAGE, BITWARDEN_VERSION, "21985"),
            Triple(BITWARDEN_PACKAGE, BITWARDEN_VERSION, null))) {
            assertThrows(IllegalArgumentException::class.java) { requireBitwardenTarget(pkg, version, code) }
        }
    }

    @Test fun classPinsCoverTheValidatorBothResultsAndTheOriginSource() {
        assertEquals(setOf(BITWARDEN_VALIDATOR, BITWARDEN_NOT_ALLOWED, BITWARDEN_SIGNATURE_NOT_FOUND, BITWARDEN_ORIGIN_SOURCE), bitwardenClassPins.keys)
        assertTrue(bitwardenClassPins.values.all { it.matches(Regex("[0-9a-f]{64}")) })
        assertEquals(bitwardenClassPins.size, bitwardenClassPins.values.toSet().size)
    }

    @Test fun theSingleSignatureNotFoundReadBecomesNotAllowedKeepingItsRegister() {
        val m = method(listOf(notAllowed, sigNotFound))
        val before = m.implementation!!.instructions.toList()
        trustResignedBrowser(m, notAllowed, sigNotFound)
        val after = m.implementation!!.instructions.toList()
        assertEquals(before.size, after.size)
        assertEquals(before[0], after[0])
        assertEquals(before[2], after[2])
        val changed = after[1] as ReferenceInstruction
        assertEquals(Opcode.SGET_OBJECT, after[1].opcode)
        assertEquals(1, (after[1] as OneRegisterInstruction).registerA)
        assertEquals(BITWARDEN_NOT_ALLOWED, (changed.reference as FieldReference).definingClass)
        assertEquals(8, m.implementation!!.registerCount)
    }

    @Test fun missingOrMultipleSignatureNotFoundReadsRejectBeforeMutation() {
        for (reads in listOf(listOf(notAllowed), emptyList(), listOf(sigNotFound, sigNotFound))) {
            val m = method(reads);val before = m.implementation!!.instructions.toList()
            assertThrows(IllegalArgumentException::class.java) { trustResignedBrowser(m, notAllowed, sigNotFound) }
            assertEquals(before, m.implementation!!.instructions.toList())
        }
    }

    @Test fun wrongOwnerOrReturnTypeRejects() {
        for (m in listOf(method(listOf(sigNotFound), owner = "Lother;"), method(listOf(sigNotFound), returnType = "V"))) {
            val before = m.implementation!!.instructions.toList()
            assertThrows(IllegalArgumentException::class.java) { trustResignedBrowser(m, notAllowed, sigNotFound) }
            assertEquals(before, m.implementation!!.instructions.toList())
        }
    }
}

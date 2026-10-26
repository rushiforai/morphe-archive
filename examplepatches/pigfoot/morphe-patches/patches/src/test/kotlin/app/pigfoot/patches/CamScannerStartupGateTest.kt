package app.pigfoot.patches

import app.pigfoot.patches.camscanner.*
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.AnnotationVisibility
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.instruction.*
import org.junit.Assert.*
import org.junit.Test

class CamScannerStartupGateTest {
    private fun toast(owner: String = PIRATE_CONTROL, name: String = "Oo08", result: String = "V",
        parameter: String = "Landroid/content/Context;",
        flags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        registers: Int = 3, body: Boolean = true): Method = ImmutableMethod(owner, name,
        listOf(ImmutableMethodParameter(parameter, emptySet(), "context")), result, flags,
        setOf(ImmutableAnnotation(AnnotationVisibility.RUNTIME, "Ltest/Metadata;", emptySet())),
        emptySet(), if (body) ImmutableMethodImplementation(registers, listOf(
            ImmutableInstruction10x(Opcode.NOP), ImmutableInstruction10x(Opcode.RETURN_VOID)
        ), emptyList(), emptyList()) else null)

    @Test fun toastBodyIsCompletelyReplacedWithoutChangingItsContract() {
        val before = toast()
        val after = startupToastReplacement(before)
        assertEquals(listOf(Opcode.RETURN_VOID), after.implementation!!.instructions.map { it.opcode })
        assertEquals(3, after.implementation!!.registerCount)
        assertTrue(after.implementation!!.tryBlocks.isEmpty())
        assertFalse(after.implementation!!.debugItems.iterator().hasNext())
        assertEquals(before.definingClass, after.definingClass)
        assertEquals(before.name, after.name)
        assertEquals(before.signature(), after.signature())
        assertEquals(before.accessFlags, after.accessFlags)
        assertEquals(before.annotations, after.annotations)
        assertEquals(before.hiddenApiRestrictions, after.hiddenApiRestrictions)
        assertEquals(before.parameters.map { it.name }, after.parameters.map { it.name })
        assertEquals(2, before.implementation!!.instructions.count())
    }

    @Test fun unrelatedToastsAndUnsupportedBodiesAreRejected() {
        for (method in listOf(toast(owner = "Lother/Control;"), toast(name = "O8"),
                toast(result = "Z"), toast(parameter = "Ljava/lang/String;"),
                toast(flags = AccessFlags.PUBLIC.value), toast(registers = 2), toast(body = false))) {
            assertThrows(IllegalArgumentException::class.java) { startupToastReplacement(method) }
        }
    }

    private fun gate(owner: String = PIRATE_CONTROL, name: String = "O8", result: String = "Z",
        flags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        registers: Int = 6, body: Boolean = true): Method = ImmutableMethod(owner, name,
        listOf(ImmutableMethodParameter("Landroid/content/Context;", emptySet(), "context"),
            ImmutableMethodParameter("Lcom/intsig/callback/DialogDismissListener;", emptySet(), "listener")),
        result, flags, setOf(ImmutableAnnotation(AnnotationVisibility.RUNTIME, "Ltest/Metadata;", emptySet())),
        emptySet(), if (body) ImmutableMethodImplementation(registers, listOf(
            ImmutableInstruction10x(Opcode.NOP),
            ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
            ImmutableInstruction11x(Opcode.RETURN, 0)
        ), emptyList(), emptyList()) else null)

    @Test fun wholeBodyReplacementRemovesTheOldCodeInsteadOfPrefixingIt() {
        val before = gate()
        val after = startupGateReplacement(before)
        val code = after.implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.CONST_4, Opcode.RETURN), code.map { it.opcode })
        assertEquals(0L, (code[0] as WideLiteralInstruction).wideLiteral)
        assertEquals(0, (code[0] as OneRegisterInstruction).registerA)
        assertEquals(0, (code[1] as OneRegisterInstruction).registerA)
        assertEquals(6, after.implementation!!.registerCount)
        assertTrue(after.implementation!!.tryBlocks.isEmpty())
        assertFalse(after.implementation!!.debugItems.iterator().hasNext())
        // Constructing the replacement does not mutate the pristine method.
        assertEquals(3, before.implementation!!.instructions.count())
    }

    @Test fun methodContractAndMetadataArePreserved() {
        val before = gate()
        val after = startupGateReplacement(before)
        assertEquals(before.definingClass, after.definingClass)
        assertEquals(before.name, after.name)
        assertEquals(before.signature(), after.signature())
        assertEquals(before.accessFlags, after.accessFlags)
        assertEquals(before.annotations, after.annotations)
        assertEquals(before.hiddenApiRestrictions, after.hiddenApiRestrictions)
        assertEquals(before.parameters.map { it.name }, after.parameters.map { it.name })
    }

    @Test fun wrongTargetsAndUnsupportedBodiesAreRejected() {
        for (method in listOf(gate(owner = "Lother/Control;"), gate(name = "Oo08"),
                gate(result = "I"), gate(flags = AccessFlags.PUBLIC.value), gate(registers = 5), gate(body = false))) {
            assertThrows(IllegalArgumentException::class.java) { startupGateReplacement(method) }
        }
    }

    @Test fun namedFeaturesShareTheRequiredTrustRootNotASeparateStartupChoice() {
        assertEquals(setOf(camscannerInputPatch), camscannerSideloadStartupPatch.dependencies)
        assertNull(camscannerSideloadStartupPatch.name)
        assertTrue(camscannerSigningPatch.dependencies.contains(camscannerSideloadStartupPatch))
        for (patch in listOf(camscannerLocalFeaturesPatch, camscannerPrivacyPatch,
                camscannerAdsPatch, camscannerOfflinePatch)) {
            assertTrue(patch.dependencies.contains(camscannerSigningPatch))
        }
    }
}

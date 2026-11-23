package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.io.File
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test

/** Local original APK only: never ship publisher code or account data as test fixtures. */
class CosmeticUi2703Test {
    private data class Placement(
        val owner: String, val name: String, val parameters: List<String>,
        val markerReference: String, val booleanResult: Boolean,
        val apply: (MutableMethod) -> Unit,
    )
    private val placements = advertisingUi2703Targets.map {
        Placement(it.owner, it.name, emptyList(), it.reference, it.returnType == "Z", ::hideAdvertisingUi2703)
    } + premiumUi2703Targets.map {
        Placement(it.owner, it.name, it.parameters, it.reference, false, ::hidePremiumUi2703)
    }

    private fun original(placement: Placement): Method {
        val path = System.getenv("DEEZER_UI_27_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        return dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            .single { it.type == placement.owner }.methods.single {
                it.name == placement.name && it.parameterTypes.map(CharSequence::toString) == placement.parameters
            }
    }

    @Test
    fun bothChoicesKeepTheirNamesDefaultsAndBaseDependency() {
        assertEquals("Remove advertising", deezerRemoveAdvertising.name)
        assertEquals("Remove premium upsell UI", deezerRemovePremiumUi.name)
        for (patch in listOf(deezerRemoveAdvertising, deezerRemovePremiumUi)) {
            assertTrue(patch.default)
            val expected = if (patch == deezerRemovePremiumUi)
                setOf(deezerBase, deezerNativeOfferFilters) else setOf(deezerBase)
            assertEquals(expected, patch.dependencies.toSet())
        }
        assertEquals(listOf("9.0.27.3"), deezer.targets.map { it.version })
        assertEquals(setOf(9002703), deezer.targets.flatMap { it.versionCodes!!.values }.toSet())
    }

    @Test
    fun original27ChangesOnlyFourCosmeticEntriesWithoutInvokingCallbacks() {
        assertEquals(4, placements.size)
        for (placement in placements) {
            val method = MutableMethod(original(placement))
            val before = method.instructions.toList()
            val registers = method.implementation!!.registerCount
            val handlers = method.implementation!!.tryBlocks.map { block -> block.exceptionHandlers.map { it.exceptionType } }
            placement.apply(method)
            val after = method.instructions.toList()
            val added = if (placement.booleanResult) 2 else 1
            assertEquals(before.size + added, after.size)
            before.indices.forEach { assertSame(before[it], after[it + added]) }
            assertEquals(registers, method.implementation!!.registerCount)
            assertEquals(handlers, method.implementation!!.tryBlocks.map { block -> block.exceptionHandlers.map { it.exceptionType } })
            assertTrue("No synthetic completion, billing or playback call", after.take(added).none { it is ReferenceInstruction })
            if (placement.booleanResult) {
                assertEquals(Opcode.CONST_4, after[0].opcode)
                assertEquals(0, (after[0] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals(Opcode.RETURN, after[1].opcode)
                assertEquals((after[0] as OneRegisterInstruction).registerA,
                    (after[1] as OneRegisterInstruction).registerA)
            } else {
                assertEquals(Opcode.RETURN_VOID, after[0].opcode)
            }
        }
    }

    @Test
    fun reapplicationAndDriftFailBeforeMutation() {
        for (placement in placements) {
            val method = MutableMethod(original(placement))
            placement.apply(method)
            val patched = method.instructions.toList()
            assertThrows(IllegalStateException::class.java) { placement.apply(method) }
            assertEquals(patched, method.instructions.toList())

            val drifted = MutableMethod(original(placement))
            val marker = drifted.instructions.indexOfFirst {
                (it as? ReferenceInstruction)?.reference?.toString() == placement.markerReference
            }
            assertTrue(marker >= 0)
            drifted.replaceInstruction(marker, "nop")
            val drift = drifted.instructions.toList()
            assertThrows(IllegalStateException::class.java) { placement.apply(drifted) }
            assertEquals(drift, drifted.instructions.toList())
        }
    }

    @Test
    fun advertisingAndPromotionContractsRejectEachOthersMethods() {
        for (placement in placements) {
            val method = MutableMethod(original(placement))
            val before = method.instructions.toList()
            assertThrows(IllegalStateException::class.java) {
                if (placement.owner in advertisingUi2703Targets.map { it.owner }) hidePremiumUi2703(method)
                else hideAdvertisingUi2703(method)
            }
            assertEquals(before, method.instructions.toList())
        }
    }
}

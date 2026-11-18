package patches.gboard

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.ByteArrayInputStream
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assume.assumeNotNull
import org.junit.Test
import patches.gboard.features.amoleddark.AMOLED_DARK_COLOR
import patches.gboard.features.amoleddark.applyAmoledDarkPalette
import patches.gboard.shared.generated.GboardVersionBindings

/**
 * Supply GBOARD_ORIGINAL_APK locally (the base APK of 18.6.3.1002251336-release-arm64-v8a); the
 * Play artifact is not a CI fixture. The test assembles the patched constructor through a DexPool,
 * so a structurally invalid insertion fails here instead of on a device.
 */
class AmoledDynamicDarkPatchTest {
    private val isLight = GboardVersionBindings.dynamicDarkPaletteIsLightField.reference
    private val surfaceFields = listOf(
        GboardVersionBindings.dynamicDarkPaletteSurfaceDimField.reference,
        GboardVersionBindings.dynamicDarkPaletteSurfaceContainerField.reference,
        GboardVersionBindings.dynamicDarkPaletteSurfaceContainerLowField.reference,
        GboardVersionBindings.dynamicDarkPaletteSurfaceContainerLowestField.reference,
    )

    private fun classes(): List<ClassDef> {
        val path = System.getenv("GBOARD_ORIGINAL_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(26))
        return dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.toList()
    }

    private fun paletteConstructor(classes: List<ClassDef>): Method = classes
        .single { it.type == GboardVersionBindings.dynamicDarkPaletteConstructor.ownerDescriptor }
        .methods
        .single {
            it.name == "<init>" && it.parameterTypes == listOf("Landroid/content/Context;", "Z")
        }

    private fun replace(classes: List<ClassDef>, method: Method): ClassDef {
        val owner = classes.single { it.type == method.definingClass }
        return ImmutableClassDef(
            owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
            owner.annotations, owner.fields,
            owner.methods.map { if (it.toString() == method.toString()) method else it },
        )
    }

    private fun roundtrip(classes: List<ClassDef>, method: Method): Method {
        val pool = DexPool(Opcodes.forApi(26))
        pool.internClass(replace(classes, method))
        val memory = MemoryDataStore()
        val bytes = try {
            pool.writeTo(memory)
            memory.data
        } finally {
            memory.close()
        }
        return DexBackedDexFile.fromInputStream(Opcodes.forApi(26), ByteArrayInputStream(bytes))
            .classes
            .single()
            .methods
            .single { it.toString() == method.toString() }
    }

    private fun MutableMethod.patch() =
        applyAmoledDarkPalette(isLightField = isLight, surfaceFields = surfaceFields)

    @Test
    fun darkPaletteOverridesEveryPanelSurface() {
        val classes = classes()
        val original = paletteConstructor(classes)
        val patched = roundtrip(classes, MutableMethod(original).also { it.patch() })
        val code = patched.implementation!!.instructions.toList()
        val originalCode = original.implementation!!.instructions.toList()
        assertEquals(14, patched.implementation!!.registerCount)
        assertEquals(originalCode.size + 7, code.size)

        val guard = code.size - 8
        assertEquals(Opcode.IGET_BOOLEAN, code[guard].opcode)
        assertEquals(isLight, (code[guard] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.IF_NEZ, code[guard + 1].opcode)
        assertEquals(Opcode.CONST_HIGH16, code[guard + 2].opcode)
        assertEquals(
            AMOLED_DARK_COLOR.toLong() and 0xffffffffL,
            (code[guard + 2] as NarrowLiteralInstruction).narrowLiteral.toLong() and 0xffffffffL,
        )
        // 14 registers, 3 parameter registers (this, Context, boolean): v10 is the top local.
        val scratch = (code[guard + 2] as OneRegisterInstruction).registerA
        assertEquals(10, scratch)
        assertEquals(
            surfaceFields,
            (guard + 3 until guard + 7).map { index ->
                val instruction = code[index]
                assertEquals(Opcode.IPUT, instruction.opcode)
                assertEquals(scratch, (instruction as TwoRegisterInstruction).registerA)
                (instruction as ReferenceInstruction).reference.toString()
            },
        )
        assertEquals(Opcode.RETURN_VOID, code.last().opcode)

        // The guard must jump over the writes to the stock RETURN_VOID and nowhere else: a label
        // compiled inside the inserted snippet would point at a stale address (VerifyError).
        val addresses = code.runningFold(0) { address, instruction ->
            address + instruction.codeUnits
        }
        val branch = code[guard + 1] as OffsetInstruction
        assertEquals(
            "if-nez must target the stock return-void",
            addresses[code.lastIndex],
            addresses[guard + 1] + branch.codeOffset,
        )

        // Nothing else changed: each token keeps its stock writes and gains exactly ours.
        surfaceFields.forEach { field ->
            val stock = originalCode.count {
                it.opcode == Opcode.IPUT &&
                    (it as? ReferenceInstruction)?.reference?.toString() == field
            }
            val patchedWrites = code.count {
                it.opcode == Opcode.IPUT &&
                    (it as? ReferenceInstruction)?.reference?.toString() == field
            }
            assertTrue("$field was already written by stock code", stock >= 1)
            assertEquals(field, stock + 1, patchedWrites)
        }
    }

    @Test
    fun patchingTwiceKeepsASingleGuard() {
        val classes = classes()
        val once = roundtrip(classes, MutableMethod(paletteConstructor(classes)).also { it.patch() })
        val twice = MutableMethod(roundtrip(classes, once)).also { it.patch() }
        assertEquals(
            once.implementation!!.instructions.toList().size,
            twice.implementation!!.instructions.toList().size,
        )
        val onceCode = once.implementation!!.instructions.toList()
        val twiceCode = twice.implementation!!.instructions.toList()
        surfaceFields.forEach { field ->
            assertEquals(
                field,
                onceCode.count {
                    it.opcode == Opcode.IPUT &&
                        (it as? ReferenceInstruction)?.reference?.toString() == field
                },
                twiceCode.count {
                    it.opcode == Opcode.IPUT &&
                        (it as? ReferenceInstruction)?.reference?.toString() == field
                },
            )
        }
        assertEquals(
            1,
            twice.implementation!!.instructions.toList()
                .filter { it.opcode == Opcode.IGET_BOOLEAN }
                .count { (it as ReferenceInstruction).reference.toString() == isLight },
        )
    }
}

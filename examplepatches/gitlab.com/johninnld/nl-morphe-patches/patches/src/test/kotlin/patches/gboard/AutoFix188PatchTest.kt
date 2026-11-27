package patches.gboard

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.ByteArrayInputStream
import java.io.File
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import patches.gboard.features.writingtools.*
import patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import patches.gboard.shared.runtimeabi.RuntimeCallId

/** Uses an operator-supplied original; no APK or synthetic app fixture is committed. */
class AutoFix188PatchTest {
    private val opcodes = Opcodes.forApi(26)
    private fun classes(): List<ClassDef> {
        val path = System.getenv("GBOARD_ORIGINAL_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), opcodes)
        return dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.toList()
    }
    private fun refs(method: Method) = method.implementation!!.instructions.mapNotNull {
        (it as? ReferenceInstruction)?.reference?.toString()
    }
    private fun roundTrip(owner: ClassDef, method: Method): Method {
        val replacement = ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass,
            owner.interfaces, owner.sourceFile, owner.annotations, owner.fields,
            owner.methods.map { if (it.toString() == method.toString()) method else it })
        val store = MemoryDataStore()
        try {
            DexPool.writeTo(store, ImmutableDexFile(opcodes, listOf(replacement)))
            return DexBackedDexFile.fromInputStream(opcodes, ByteArrayInputStream(store.data))
                .classes.single().methods.single { it.toString() == method.toString() }
        } finally { store.close() }
    }

    @Test
    fun allThreeHooksAssembleAgainstTheOriginalAndKeepNativeCallsAndRegisters() {
        val classes = classes()
        val cases = listOf(
            Triple(autoFixAmbiguity188, MutableMethod::restoreAutoFixAcceptance188,
                RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_IS_AUTO_FIX_ROUTING_ENABLED),
            Triple(autoFixRoute188, MutableMethod::restoreAutoFixRoute188,
                RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_ALLOW_AUTO_FIX_ROUTE),
            Triple(autoFixDispatch188, MutableMethod::restoreAutoFixDispatch188,
                RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_IS_AUTO_FIX_ROUTING_ENABLED),
        )
        for ((target, transform, call) in cases) {
            val owner = classes.single { it.type == target.ownerDescriptor }
            val original = owner.methods.single { target.matches(it) }
            val changed = MutableMethod(original)
            transform(changed)
            val first = refs(changed)
            transform(changed)
            assertEquals("Transformation must be idempotent", first, refs(changed))
            val assembled = roundTrip(owner, changed)
            assertEquals(original.implementation!!.registerCount, assembled.implementation!!.registerCount)
            val references = refs(assembled)
            assertEquals(1, references.count { it == RuntimeAbiCatalog.abi(call).reference })
            for (reference in refs(original)) assertTrue("Stock reference lost: $reference", reference in references)
            for (instruction in assembled.implementation!!.instructions) {
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: continue
                val definingClass = classes.singleOrNull { it.type == field.definingClass } ?: continue
                assertTrue("Unresolved app field: $field", definingClass.fields.any {
                    it.name == field.name && it.type == field.type
                })
            }
        }
        val styles = classes.single { it.type == "Laeaj;" }
        assertTrue(styles.fields.any { it.name == "e" && it.type == "Laeaj;" })
    }
}

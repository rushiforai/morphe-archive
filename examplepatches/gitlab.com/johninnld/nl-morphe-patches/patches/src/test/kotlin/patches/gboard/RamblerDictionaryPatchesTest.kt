package patches.gboard

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

/** Mirrors the voice correction list's Import action in Gboard 18.6.3 (hqn.onClick). */
class RamblerDictionaryPatchesTest {
    private val modules = "Lcom/google/android/libraries/inputmethod/module/ModuleManager;"
    private val getInstance = ImmutableMethodReference(modules, "getInstance", listOf("Landroid/content/Context;"), modules)
    private val lookup = ImmutableMethodReference(modules, "b", listOf("Ljava/lang/Class;"), "Lqan;")
    private val museStats = ImmutableFieldReference("Lrxt;", "u", "Lrxt;")
    private val addWords = ImmutableMethodReference("Lfai;", "<init>", listOf("Ljava/lang/Object;", "I"), "V")
    private val update = ImmutableMethodReference("Lryi;", "n", listOf("Lrxt;", "Ljava/lang/Class;", "Lvzs;"), "V")

    private fun invoke(opcode: Opcode, ref: ImmutableMethodReference, vararg r: Int) = ImmutableInstruction35c(
        opcode, r.size, r.getOrElse(0) { 0 }, r.getOrElse(1) { 0 }, r.getOrElse(2) { 0 }, r.getOrElse(3) { 0 }, 0, ref,
    )

    private fun stock(mode: Int = 0, allocated: String = "Lfai;"): List<Instruction> = listOf(
        ImmutableInstruction11n(Opcode.CONST_4, 4, mode),
        invoke(Opcode.INVOKE_STATIC, getInstance, 13),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 12),
        ImmutableInstruction21c(Opcode.CONST_CLASS, 1, ImmutableTypeReference("Lryi;")),
        invoke(Opcode.INVOKE_VIRTUAL, lookup, 12, 1),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 12),
        ImmutableInstruction21c(Opcode.CHECK_CAST, 12, ImmutableTypeReference("Lryi;")),
        ImmutableInstruction21c(Opcode.SGET_OBJECT, 1, museStats),
        ImmutableInstruction21c(Opcode.NEW_INSTANCE, 2, ImmutableTypeReference(allocated)),
        invoke(Opcode.INVOKE_DIRECT, addWords, 2, 0, 4),
        ImmutableInstruction21c(Opcode.CONST_CLASS, 5, ImmutableTypeReference("Lrwn;")),
        invoke(Opcode.INVOKE_INTERFACE, update, 12, 1, 5, 2),
    )

    @Test
    fun resolvesEveryOperandOfTheImportCall() {
        val site = correctionListImport(stock())
        assertEquals("Lryi;", site.statsStore)
        assertEquals("u", site.statsKind.name)
        assertEquals("Lrwn;", site.statsClass)
        assertEquals("Lfai;", site.addWords.definingClass)
        assertEquals("b", site.moduleLookup.name)
        assertEquals("n", site.update.name)
    }

    @Test
    fun rejectsAnUpdateThatRemovesInsteadOfAdds() {
        assertThrows(PatchException::class.java) { correctionListImport(stock(mode = 1)) }
    }

    @Test
    fun rejectsAMismatchedUpdateObject() {
        assertThrows(PatchException::class.java) { correctionListImport(stock(allocated = "Lother;")) }
    }

    @Test
    fun rejectsTwoUpdates() {
        assertThrows(PatchException::class.java) { correctionListImport(stock() + stock()) }
    }

    private fun storeMethod(name: String, params: List<String>, returns: String) = ImmutableMethod(
        "Lryi;", name, params.map { ImmutableMethodParameter(it, null, null) }, returns,
        AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value, null, null, null,
    )

    private fun store(vararg methods: ImmutableMethod) = ImmutableClassDef(
        "Lryi;", AccessFlags.INTERFACE.value, null, null, null, null, null, methods.toList(),
    )

    /** UserFeatureCache's interface in Gboard 18.6.3: c reads, n/t update, p serializes. */
    private val stockStore = arrayOf(
        storeMethod("c", listOf("Lrxt;", "Ljava/lang/Class;"), "Laafn;"),
        storeMethod("n", listOf("Lrxt;", "Ljava/lang/Class;", "Lvzs;"), "V"),
        storeMethod("t", listOf("Lrxt;", "Ljava/lang/Class;", "Lvzs;"), "V"),
        storeMethod("p", listOf("Lrxt;"), "[B"),
        storeMethod("d", emptyList(), "Laafn;"),
    )

    @Test
    fun findsTheReadTheListScreenUses() {
        val read = correctionListRead(store(*stockStore), correctionListImport(stock()))
        assertEquals("Lryi;->c(Lrxt;Ljava/lang/Class;)Laafn;", "${read.definingClass}->${read.name}(${read.parameterTypes.joinToString("")})${read.returnType}")
    }

    @Test
    fun rejectsAStoreWithoutOneRead() {
        val site = correctionListImport(stock())
        assertThrows(PatchException::class.java) { correctionListRead(store(*stockStore.drop(1).toTypedArray()), site) }
        val second = storeMethod("e", listOf("Lrxt;", "Ljava/lang/Class;"), "Ljava/lang/Object;")
        assertThrows(PatchException::class.java) { correctionListRead(store(*stockStore, second), site) }
    }
}

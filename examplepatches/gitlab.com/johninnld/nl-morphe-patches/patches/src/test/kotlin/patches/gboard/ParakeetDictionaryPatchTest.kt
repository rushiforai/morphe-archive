package patches.gboard

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

/** Mirrors Gboard 18.6.3's list loader (fbi.run case 1) and its helper (VoiceCorrectionListFragment.aF). */
class ParakeetDictionaryPatchTest {
    private val fragment = CORRECTION_LIST_FRAGMENT
    private val helper = ImmutableMethodReference(fragment, "aF", listOf("Ljava/util/List;", "Ljava/util/Set;", "Ljava/util/Set;"), "V")
    private val word = ImmutableFieldReference("Lrwm;", "c", "Ljava/lang/String;")
    private val museStats = ImmutableFieldReference("Lrxt;", "u", "Lrxt;")
    private val site = CorrectionListImport(
        moduleLookup = ImmutableMethodReference(MODULE_MANAGER, "b", listOf("Ljava/lang/Class;"), "Lqan;"),
        statsStore = "Lryi;",
        statsKind = museStats,
        statsClass = "Lrwn;",
        addWords = ImmutableMethodReference("Lfai;", "<init>", listOf("Ljava/lang/Object;", "I"), "V"),
        update = ImmutableMethodReference("Lryi;", "n", listOf("Lrxt;", "Ljava/lang/Class;", "Lvzs;"), "V"),
    )

    private fun type(t: String) = ImmutableTypeReference(t)
    private fun list(name: String) = ImmutableFieldReference("Lrwn;", name, "Laaez;")
    private fun iget(a: Int, b: Int, f: ImmutableFieldReference) = ImmutableInstruction22c(Opcode.IGET_OBJECT, a, b, f)
    private fun callHelper() = ImmutableInstruction35c(Opcode.INVOKE_STATIC, 3, 0, 6, 7, 0, 0, helper)

    private val helperBody: List<Instruction> = listOf(
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
        ImmutableInstruction21c(Opcode.CHECK_CAST, 0, type("Lrwm;")),
        iget(0, 0, word),
    )

    private fun loader(lists: List<String> = listOf("d", "b", "e"), handedOver: Int = 2): List<Instruction> = buildList {
        add(ImmutableInstruction21c(Opcode.SGET_OBJECT, 1, museStats))
        add(ImmutableInstruction21c(Opcode.CONST_CLASS, 2, type("Lrwn;")))
        add(ImmutableInstruction21c(Opcode.CHECK_CAST, 3, type("Lrwn;")))
        add(iget(0, 3, list(lists[0])))
        add(ImmutableInstruction21c(Opcode.CHECK_CAST, 1, type("Lrwm;")))
        add(iget(2, 1, word))
        lists.drop(1).forEachIndexed { i, name ->
            add(iget(0, 3, list(name)))
            if (i < handedOver) add(callHelper())
        }
    }

    @Test
    fun findsTheEntryWord() {
        val (entry, field) = correctionListEntryWord(helperBody)
        assertEquals("Lrwm;", entry)
        assertEquals("c", field.name)
    }

    @Test
    fun findsAllThreeEntryLists() {
        val words = correctionListWords(loader(), helper, site, correctionListEntryWord(helperBody))
        assertEquals(listOf("d", "b", "e"), words.lists.map { it.name })
        assertEquals("Lrwm;", words.entryClass)
    }

    @Test
    fun rejectsAChangedNumberOfLists() {
        assertThrows(PatchException::class.java) {
            correctionListWords(loader(lists = listOf("d", "b")), helper, site, correctionListEntryWord(helperBody))
        }
    }

    @Test
    fun rejectsALoaderThatNoLongerHandsOverTwoLists() {
        assertThrows(PatchException::class.java) {
            correctionListWords(loader(handedOver = 1), helper, site, correctionListEntryWord(helperBody))
        }
    }

    @Test
    fun rejectsAHelperWithoutACastBeforeTheWord() {
        assertThrows(PatchException::class.java) { correctionListEntryWord(listOf(iget(0, 0, word))) }
    }
}

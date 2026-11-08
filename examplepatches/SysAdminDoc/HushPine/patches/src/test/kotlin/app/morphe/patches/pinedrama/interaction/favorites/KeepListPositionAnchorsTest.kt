package app.morphe.patches.pinedrama.interaction.favorites

import app.morphe.Fixtures
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Issue #2: every list page must hold the one gate the patch answers, or the fix covers History
 * and leaves the others jumping to the top.
 */
class KeepListPositionAnchorsTest {
    private val pagesWithTheGate = listOf(
        HISTORY_DRAMA_LIST_PAGE,
        "Lcom/ss/android/ugc/aweme/drama/profilehistory/subpage/post/HistoryPostListPage;",
        "Lcom/ss/android/ugc/aweme/series/favorite/assem/SeriesFavoriteListAssem;",
    )

    @Test
    fun theGateIsFoundAndEveryListPageHoldsIt() {
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val wanted = pagesWithTheGate.toSet()
            val pages = HashMap<String, ClassDef>()
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                    if (classDef.type in wanted) pages[classDef.type] = classDef
                }
            }

            val destroy = pages.getValue(HISTORY_DRAMA_LIST_PAGE).methods
                .single { it.name == "onDestroy" && it.parameterTypes.isEmpty() }
            val first = destroy.implementation!!.instructions.first { it.opcode == Opcode.IGET_OBJECT }
            val gateType = ((first as ReferenceInstruction).reference as FieldReference).type

            var gate: ClassDef? = null
            for (entry in container.dexEntryNames) {
                gate = gate ?: container.getEntry(entry)!!.dexFile.classes
                    .firstOrNull { it.type == gateType }
            }
            assertNotNull("$apk: gate class $gateType", gate)
            assertEquals("$apk: watch", 1, gate!!.methods.count { it.isRefreshGateWatch() })
            assertEquals("$apk: check", 1, gate.methods.count { it.isRefreshGateCheck() })
            assertEquals("$apk: dirty flag", 1, gate.refreshGateDirtyField().size)

            for (page in pagesWithTheGate) {
                val holder = pages[page]
                assertNotNull("$apk: $page", holder)
                assertTrue(
                    "$apk: $page no longer holds the gate",
                    holder!!.fields.any { it.type == gateType },
                )
            }
        }
    }
}

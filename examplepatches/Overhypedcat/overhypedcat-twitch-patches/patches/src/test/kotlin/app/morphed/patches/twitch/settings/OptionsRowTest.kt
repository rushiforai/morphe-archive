package app.morphed.patches.twitch.settings

import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/** The older Options sheet's row composable is told apart from the other composables by its shape. */
class OptionsRowTest {
    private fun reference(vararg parameters: String, returnType: String = "V") =
        ImmutableMethodReference("Ltij;", "h", parameters.toList(), returnType)

    private val row = arrayOf(
        "Ljava/lang/String;", "Llmq;", "Ljava/lang/String;", "Z", "Lcpi;",
        "Lkotlin/jvm/functions/Function2;", "Lkotlin/jvm/functions/Function2;", "Lb0a;", "I", "I",
    )

    @Test
    fun theRowComposableMatches() {
        assertTrue(isOptionsRow(reference(*row)))
    }

    @Test
    fun otherShapesDont() {
        assertFalse("returns something", isOptionsRow(reference(*row, returnType = "Ljava/lang/Object;")))
        assertFalse("one parameter less", isOptionsRow(reference(*row.copyOfRange(0, 9))))
        assertFalse("the Settings row", isOptionsRow(reference(
            "Ljava/lang/String;", "Ljava/lang/String;", "Lcpi;", "I", "Lx;", "Lb0a;", "I", "I")))
        val swapped = row.copyOf().also { it[5] = "Lkotlin/jvm/functions/Function1;" }
        assertFalse("no composable slots", isOptionsRow(reference(*swapped)))
    }
}

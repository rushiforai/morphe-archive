package app.morphe.patches.facebook.chats

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

/**
 * The search screen row's Meta AI gate. The hook goes right before the button's test, so the gate
 * is refused when a jump lands on that test: the path through the jump would skip the hook. And the
 * Meta AI tap that names the row, by the entry's literal or a string table's.
 */
class PickerButtonGateTest {
    private val tap = "Lfixture/Tap;"

    private fun smali(body: String) = MutableMethod(
        ImmutableMethod(
            "Lfixture/Row;", "render", listOf(ImmutableMethodParameter("Z", null, null)),
            "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(4, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, body.trimIndent()) }

    @Test
    fun `the flag's 1 and the button's test are found past the margin's test`() {
        val gate = pickerButtonGate(
            smali("""
                const/4 v0, 0x0
                if-eqz p0, :skip
                const/4 v0, 0x1
                :skip
                if-eqz v0, :nomargin
                const/4 v1, 0x2
                :nomargin
                const/4 v1, 0x3
                if-eqz v0, :done
                new-instance v2, $tap
                :done
                return-void
            """),
            tap,
        )
        // As on 582, the margin's test lands on the instruction before the button's test, not on it.
        assertEquals(listOf(2, 6, 0), listOf(gate?.set, gate?.test, gate?.register))
    }

    @Test
    fun `a jump landing on the button's test refuses the gate`() {
        val gate = pickerButtonGate(
            smali("""
                const/4 v0, 0x0
                if-eqz p0, :test
                const/4 v0, 0x1
                if-eqz v0, :nomargin
                const/4 v1, 0x2
                :nomargin
                const/4 v1, 0x3
                :test
                if-eqz v0, :done
                new-instance v2, $tap
                :done
                return-void
            """),
            tap,
        )
        assertNull(gate)
    }

    private val strings = "Lfixture/Strings;"

    /** A Meta AI tap reading the row's CallerContext, then the entry by [entry]'s lines, then calling the launcher. */
    private fun opener(vararg entry: String) = MutableMethod(
        ImmutableMethod(
            "Lfixture/Opener;", "invoke", listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)),
            "Ljava/lang/Object;", AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
            ImmutableMethodImplementation(4, emptyList(), null, null),
        ),
    ).apply {
        val lines = listOf("sget-object v0, Lfixture/Row;->A00:$CALLER_CONTEXT") + entry + listOf(
            "invoke-virtual {v2, v0, v1, v1}, $META_AI_LAUNCHER->A09(Landroid/content/Context;" +
                "Lcom/facebook/auth/usersession/FbUserSession;Lcom/facebook/messaginginblue/aibot/model/MetaAIThreadViewParam;)V",
            "return-object v0",
        )
        addInstructionsWithLabels(0, lines.joinToString("\n"))
    }

    /** A string table answering [literal] for 0x134, as 583's arm64 `DTM.A00` does for the entry. */
    private fun table(literal: String) = MutableMethod(
        ImmutableMethod(
            strings, "A00", listOf(ImmutableMethodParameter("I", null, null)), "Ljava/lang/String;",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, ImmutableMethodImplementation(2, emptyList(), null, null),
        ),
    ).apply {
        addInstructionsWithLabels(0, """
            packed-switch p0, :cases
            const-string v0, "unused"
            return-object v0
            :entry
            const-string v0, "$literal"
            return-object v0
            :cases
            .packed-switch 0x134
                :entry
            .end packed-switch
        """.trimIndent())
    }

    private fun owner(method: Method) =
        ImmutableClassDef("Lfixture/Opener;", AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null, listOf(method))

    private fun resolving(table: Method): (MethodReference) -> Method? =
        { call -> table.takeIf { call.definingClass == it.definingClass && call.name == it.name } }

    @Test
    fun `the search screen's Meta AI tap names its row by the entry's literal or a string table's`() {
        assertEquals("Lfixture/Row;", pickerRowOf(owner(opener("const-string v1, \"$PEOPLE_PICKER_ENTRY\""))))
        // 583's 64-bit build asks a string table for the entry.
        val asking = owner(opener("const/16 v1, 0x134", "invoke-static {v1}, $strings->A00(I)Ljava/lang/String;", "move-result-object v1"))
        assertNull(pickerRowOf(asking))
        assertEquals("Lfixture/Row;", pickerRowOf(asking, resolving(table(PEOPLE_PICKER_ENTRY))))
        assertNull(pickerRowOf(asking, resolving(table("messaging_inbox_in_blue:thread_list"))))
    }

    private val launch = "invoke-virtual {v1, v0, v1, v1}, $META_AI_LAUNCHER->A09(Landroid/content/Context;" +
        "Lcom/facebook/auth/usersession/FbUserSession;Lcom/facebook/messaginginblue/aibot/model/MetaAIThreadViewParam;)V"

    /** 585's merged tap: one lambda switching on [selector], the Meta AI case 0xe reading the row's AtomicBoolean. */
    private fun merged(selector: String) = MutableMethod(
        ImmutableMethod(
            "Lfixture/Opener;", "invoke", listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)),
            "Ljava/lang/Object;", AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
            ImmutableMethodImplementation(4, emptyList(), null, null),
        ),
    ).apply {
        addInstructionsWithLabels(0, """
            $selector
            packed-switch v0, :cases
            :other
            sget-object v1, Lfixture/Other;->A00:Ljava/util/concurrent/atomic/AtomicBoolean;
            return-object v1
            :meta
            sget-object v0, Lfixture/Row;->A0G:Ljava/util/concurrent/atomic/AtomicBoolean;
            const-string v0, "$PEOPLE_PICKER_ENTRY"
            $launch
            return-object v0
            :cases
            .packed-switch 0xd
                :other
                :meta
            .end packed-switch
        """.trimIndent())
    }

    @Test
    fun `585's merged tap names its row by the static its case reads, with the case`() {
        val tap = pickerTapOf(owner(merged("iget v0, p0, Lfixture/Opener;->t:I")))
        assertEquals(listOf<Any?>("Lfixture/Row;", 0xe), listOf(tap?.row, tap?.case))
        // A switch on anything but the lambda's own int isn't a merged lambda, and without a
        // CallerContext there's no row.
        assertNull(pickerTapOf(owner(merged("iget v0, p0, Lfixture/Elsewhere;->t:I"))))
        assertNull(pickerTapOf(owner(merged("const/4 v0, 0x1"))))
    }

    /** A row render building two [tap] actions, cases 0x3 and 0xe, the 0xe one behind the flag. */
    private val mergedRow = """
        const/4 v0, 0x0
        if-eqz p0, :skip
        const/4 v0, 0x1
        :skip
        const/4 v1, 0x3
        new-instance v2, $tap
        invoke-direct {v2, v1, v1, v1, v1}, $tap-><init>(ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
        if-eqz v0, :done
        const/16 v1, 0xe
        new-instance v2, $tap
        invoke-direct {v2, v1, v1, v1, v1}, $tap-><init>(ILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
        :done
        return-void
    """

    @Test
    fun `with a case only the tap built with it counts`() {
        assertNull(pickerButtonGate(smali(mergedRow), tap))
        val gate = pickerButtonGate(smali(mergedRow), tap, 0xe)
        assertEquals(listOf(2, 6, 0), listOf(gate?.set, gate?.test, gate?.register))
        assertNull(pickerButtonGate(smali(mergedRow), tap, 0x5))
    }
}

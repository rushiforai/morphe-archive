package local.moonreader.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class RegionalChecksTest {
    private fun method(prefix: Int = 0, date: String = "2027-10-10", comparison: String = "after", expiryMessage: String = EXPIRY_MESSAGE): MutableMethod {
        val method = MutableMethod(ImmutableMethod(
            "Lcom/flyersoft/moonreaderp/ActivityMain;", "onCreate", null, "V",
            AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(6),
        ))
        method.addInstructions(0, """
            ${List(prefix) { "nop" }.joinToString("\n")}
            invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;
            move-result-object v0
            invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;
            move-result-object v1
            const-string v2, "ru"
            invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
            move-result v3
            if-nez v3, :accepted_region
            const-string v2, "be"
            invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
            move-result v3
            if-nez v3, :accepted_region
            const-string v0, "$REGION_MESSAGE"
            invoke-static {v4, v0, v3}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V
            invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->finish()V
            return-void
            :accepted_region
            const-string v0, "$date"
            invoke-virtual {v0, v1}, Ljava/util/Date;->$comparison(Ljava/util/Date;)Z
            move-result v3
            if-eqz v3, :accepted_date
            const-string v0, "$expiryMessage"
            invoke-static {v4, v0, v3}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V
            invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->finish()V
            return-void
            :accepted_date
            return-void
        """.trimIndent())
        return method
    }

    private fun assertTwoAcceptBranches(method: MutableMethod) {
        val before = method.implementation!!.instructions.toList()
        val firstRegion = before.indexOfFirst { it.opcode == Opcode.IF_NEZ }
        val expiry = before.indexOfFirst { it.opcode == Opcode.IF_EQZ }
        val expectedTargets = listOf(firstRegion, expiry).map { (before[it] as BuilderOffsetInstruction).target.location.codeAddress }
        RegionalChecks.apply(method)
        val after = method.implementation!!.instructions
        assertEquals(before.size, after.size)
        assertEquals(listOf(firstRegion, expiry), before.indices.filter { before[it].opcode != after[it].opcode })
        assertEquals(listOf(Opcode.GOTO_16, Opcode.GOTO_16), listOf(after[firstRegion].opcode, after[expiry].opcode))
        assertEquals(expectedTargets, listOf(firstRegion, expiry).map { (after[it] as BuilderOffsetInstruction).target.location.codeAddress })
    }

    @Test fun patchesBothChecks() = assertTwoAcceptBranches(method())
    @Test fun supportsShiftedCodeAndLaterCutoff() = assertTwoAcceptBranches(method(prefix = 60, date = "2031-12-31"))
    @Test fun changedDateLogicFailsBeforeEitherMutation() {
        val method = method(comparison = "before")
        val before = method.implementation!!.instructions.map { it.opcode }
        assertFailsWith<IllegalArgumentException> { RegionalChecks.apply(method) }
        assertEquals(before, method.implementation!!.instructions.map { it.opcode })
    }
    @Test fun missingExpiryMessageFailsBeforeEitherMutation() {
        val method = method(expiryMessage = "Different warning")
        val before = method.implementation!!.instructions.map { it.opcode }
        assertFailsWith<IllegalArgumentException> { RegionalChecks.apply(method) }
        assertEquals(before, method.implementation!!.instructions.map { it.opcode })
    }
    @Test fun alreadyPatchedInputIsRejected() {
        val method = method()
        RegionalChecks.apply(method)
        assertFailsWith<IllegalArgumentException> { RegionalChecks.apply(method) }
    }
}

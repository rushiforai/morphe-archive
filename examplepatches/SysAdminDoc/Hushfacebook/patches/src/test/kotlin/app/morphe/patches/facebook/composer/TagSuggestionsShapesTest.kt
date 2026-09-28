/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.composer

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Tag suggestions only after @ over a stand-in mention box: which check counts as the gate for a
 * word without @, what the patch refuses, and the call it puts after the flag's read. Each rule has
 * a control that must fail it.
 */
class TagSuggestionsShapesTest {
    private val box = "Lfixture/MentionBox;"
    private val behaviour = "Lfixture/MentionBehaviour;"
    private val flag = "$behaviour->implicitOff:Z"

    /**
     * performFiltering as both builds write it, cut down: the word's first character is compared
     * with # and then with @, the behaviour's flag is read into v0 and tested, and the lookup reads
     * the text in v4, the behaviour in v5 and v2. Parts can change.
     */
    private fun filtering(
        owner: String = box,
        name: String = "performFiltering",
        literal: String = COMMON_WORDS_FAILURE,
        atSign: String = "0x40",
        compare: String = "if-eq v0, v2, :lookup",
        read: String = "iget-boolean v0, v5, $flag",
        skip: String = "if-eqz v0, :lookup",
        afterSkip: String = "return-void",
        jumpToSkip: Boolean = false,
        secondGate: Boolean = false,
        useEveryLocal: Boolean = false,
    ): MutableMethod = MutableMethod(
        ImmutableMethod(
            owner, name,
            listOf(ImmutableMethodParameter("Ljava/lang/CharSequence;", null, null), ImmutableMethodParameter("I", null, null)),
            "V", AccessFlags.PUBLIC.value, null, null,
            ImmutableMethodImplementation(10, emptyList(), null, null),
        ),
    ).apply {
        val gate = """
            invoke-virtual { v4, v3 }, Landroid/text/SpannableStringBuilder;->charAt(I)C
            move-result v0
            const/16 v2, $atSign
            $compare
            $read
            ${if (jumpToSkip) ":check" else ""}
            $skip
            $afterSkip
        """
        addInstructionsWithLabels(
            0,
            """
                const-string v0, "$literal"
                const/4 v6, 0x0
                iget-object v5, p0, $owner->behaviour:$behaviour
                invoke-virtual { p0 }, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;
                move-result-object v4
                check-cast v4, Landroid/text/SpannableStringBuilder;
                const/4 v3, 0x0
                invoke-virtual { v4, v3 }, Landroid/text/SpannableStringBuilder;->charAt(I)C
                move-result v1
                const/16 v2, 0x23
                if-eq v1, v2, :hashtag
                $gate
                ${if (secondGate) gate.replace(":check", "") else ""}
                :lookup
                iput-object v4, v5, $behaviour->query:Ljava/lang/CharSequence;
                invoke-virtual { v5, v2 }, $behaviour->filter(I)V
                ${if (useEveryLocal) "invoke-static { v1, v3, v6 }, Lfixture/Sink;->use(III)V" else ""}
                ${if (jumpToSkip) "if-nez v3, :check" else ""}
                return-void
                :hashtag
                return-void
            """,
        )
    }

    private fun boxClass(method: Method): ClassDef = ImmutableClassDef(
        method.definingClass, AccessFlags.PUBLIC.value, "Landroid/widget/AutoCompleteTextView;", null, null, null,
        listOf(ImmutableField(method.definingClass, "behaviour", behaviour, AccessFlags.PUBLIC.value, null, null, null)),
        listOf(method),
    )

    private fun behaviourClass(boxFields: Int = 1): ClassDef = ImmutableClassDef(
        behaviour, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null,
        listOf(
            ImmutableField(behaviour, "implicitOff", "Z", AccessFlags.PUBLIC.value, null, null, null),
            ImmutableField(behaviour, "query", "Ljava/lang/CharSequence;", AccessFlags.PUBLIC.value, null, null, null),
            // A static field of the box's type isn't the behaviour's own box.
            ImmutableField(behaviour, "last", box, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, null),
        ) + (0 until boxFields).map {
            ImmutableField(behaviour, "view$it", box, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, null)
        },
        emptyList(),
    )

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private val Instruction.reference: String get() = (this as ReferenceInstruction).reference.toString()

    private fun Instruction.registers(): List<Int> = (this as FiveRegisterInstruction).let {
        listOf(it.registerC, it.registerD, it.registerE, it.registerF, it.registerG).take(it.registerCount)
    }

    @Test
    fun `the gate is the flag read between the at-sign test and a return, both jumping to the lookup`() {
        val gate = wordGate(filtering())
        assertNotNull(gate)
        assertEquals(15, gate!!.flagRead)
        assertEquals(0, gate.flag)
        assertEquals(5, gate.behaviour)
        assertEquals(flag, gate.flagField.toString())
        assertTrue(isMentionFiltering(filtering()))

        assertNull("a # test", wordGate(filtering(atSign = "0x23")))
        assertNull("an if-ne", wordGate(filtering(compare = "if-ne v0, v2, :lookup")))
        assertNull("the test on another register", wordGate(filtering(compare = "if-eq v3, v2, :lookup")))
        assertNull("an int flag", wordGate(filtering(read = "iget v0, v5, $behaviour->count:I")))
        assertNull("a test of another register", wordGate(filtering(skip = "if-eqz v3, :lookup")))
        assertNull("the test jumps elsewhere", wordGate(filtering(skip = "if-eqz v0, :hashtag")))
        assertNull("no return after the test", wordGate(filtering(afterSkip = "nop")))
        assertNull("another way into the test", wordGate(filtering(jumpToSkip = true)))
        assertNull("two gates", wordGate(filtering(secondGate = true)))

        assertTrue(isMentionFiltering(filtering()))
        assertTrue("another method name", !isMentionFiltering(filtering(name = "filter")))
        assertTrue("without the log line", !isMentionFiltering(filtering(literal = "something else")))
    }

    @Test
    fun `the patch hands the flag and the box to the extension right after the read`() {
        val context = PatchContexts.of(listOf(boxClass(filtering()), behaviourClass(), ExtensionDex.classDef(SETTINGS_STATUS)))

        tagSuggestionsOnlyAfterAtPatch.execute(context)

        val body = context.mutableClassDefBy(box).methods.single().body()
        assertEquals(Opcode.IGET_BOOLEAN, body[15].opcode)
        val read = body[16]
        assertEquals(Opcode.IGET_OBJECT, read.opcode)
        assertEquals("$behaviour->view0:$box", read.reference)
        // v1 held the first character, which nothing reads after the # test.
        assertEquals(1, (read as TwoRegisterInstruction).registerA)
        assertEquals(5, read.registerB)
        val asks = body[17]
        assertEquals(Opcode.INVOKE_STATIC, asks.opcode)
        assertEquals(SKIPS_WORD, asks.reference)
        assertEquals(listOf(0, 1), asks.registers())
        assertEquals(Opcode.MOVE_RESULT, body[18].opcode)
        assertEquals(0, (body[18] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_EQZ, body[19].opcode)
        assertEquals(0, (body[19] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.RETURN_VOID, body[20].opcode)
        assertEquals("the method grew by more than the hook", filtering().body().size + 3, body.size)

        val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "tagSuggestions" }
        val answer = status.body().first { it is NarrowLiteralInstruction }
        assertEquals("the settings screen isn't told the patch is in", 1, (answer as NarrowLiteralInstruction).narrowLiteral)
    }

    @Test
    fun `a build whose gate or box can't be told apart is refused before anything changes`() {
        fun refusal(vararg classes: ClassDef): String {
            val context = PatchContexts.of(classes.toList() + ExtensionDex.classDef(SETTINGS_STATUS))
            return assertThrows(PatchException::class.java) { tagSuggestionsOnlyAfterAtPatch.execute(context) }.message!!
        }
        val none = refusal(boxClass(filtering(name = "filter")), behaviourClass())
        assertTrue(none, none.contains("found 0"))
        val two = refusal(boxClass(filtering()), boxClass(filtering(owner = "Lfixture/OtherBox;")), behaviourClass())
        assertTrue(two, two.contains("found 2"))
        val noGate = refusal(boxClass(filtering(atSign = "0x23")), behaviourClass())
        assertTrue(noGate, noGate.contains("has no single check that returns for a word without @"))
        val noBehaviour = refusal(boxClass(filtering()))
        assertTrue(noBehaviour, noBehaviour.contains("this build has no $behaviour"))
        val noBox = refusal(boxClass(filtering()), behaviourClass(boxFields = 0))
        assertTrue(noBox, noBox.contains("has no single field holding the $box"))
        val twoBoxes = refusal(boxClass(filtering()), behaviourClass(boxFields = 2))
        assertTrue(twoBoxes, twoBoxes.contains("has no single field holding the $box"))
        val noLocal = refusal(boxClass(filtering(useEveryLocal = true)), behaviourClass())
        assertTrue(noLocal, noLocal.contains("local register(s) up to v15 that nothing reads"))
    }
}

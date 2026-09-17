package app.morphe.patches.tiktok.interaction.sharesheet

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test

class ShareRecipientHooksTest {
    private val tools = "Lapp/morphe/extension/tiktok/share/ShareSheetTools;"
    private val function0 = "Lkotlin/jvm/functions/Function0;"
    private val viewHolder = "Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;"

    @Test
    fun `recipient binder is selected by stable model APIs and binds before its null branch`() {
        val method = recipientBinder(includeUid = true)
        assertTrue(method.isShareRecipientBinder())
        val original = method.implementation!!.instructions.toList()

        method.bindShareRecipient()

        val code = method.implementation!!.instructions.toList()
        assertEquals(27, method.implementation!!.registerCount)
        assertEquals(original.size + 1, code.size)
        original.take(6).forEachIndexed { index, instruction ->
            assertSame(instruction, code[index])
        }
        assertEquals(Opcode.INVOKE_STATIC, code[6].opcode)
        val call = code[6] as FiveRegisterInstruction
        assertEquals(2, call.registerCount)
        assertEquals(listOf(0, 3), listOf(call.registerC, call.registerD))
        assertMethod(
            code[6],
            tools,
            "bindRecipient",
            listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
            "V",
        )
        assertEquals(Opcode.IF_NEZ, code[7].opcode)
        val nullBranch = code[7] as OffsetInstruction
        assertEquals(
            code[9].location.codeAddress,
            code[7].location.codeAddress + nullBranch.codeOffset,
        )
    }

    @Test
    fun `binder selector refuses a lookalike without the stable user id API`() {
        assertFalse(recipientBinder(includeUid = false).isShareRecipientBinder())
    }

    @Test
    fun `native click dispatcher gates every activation without replacing its callback`() {
        val method = recipientClickDispatcher(extraInstruction = false)
        assertTrue(method.isShareRecipientClickDispatcher())
        val original = method.implementation!!.instructions.toList()

        method.interceptShareRecipientClick()

        val code = method.implementation!!.instructions.toList()
        assertEquals(3, method.implementation!!.registerCount)
        assertEquals(original.size + 4, code.size)
        assertMethod(
            code[0],
            tools,
            "allowRecipientClick",
            listOf("Landroid/view/View;"),
            "Z",
        )
        assertEquals(1, (code[0] as FiveRegisterInstruction).registerC)
        assertEquals(2, (code[1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_NEZ, code[2].opcode)
        assertEquals(2, (code[2] as OneRegisterInstruction).registerA)
        assertEquals(
            code[4].location.codeAddress,
            code[2].location.codeAddress + (code[2] as OffsetInstruction).codeOffset,
        )
        original.forEachIndexed { index, instruction ->
            assertSame(instruction, code[index + 4])
        }
        assertEquals(
            1,
            code.count { instruction ->
                val reference =
                    (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == function0 && reference.name == "invoke"
            },
        )
    }

    @Test
    fun `click selector refuses a longer dispatcher where the borrowed parameter may be live`() {
        assertFalse(recipientClickDispatcher(extraInstruction = true)
            .isShareRecipientClickDispatcher())
    }

    @Test
    fun `a dispatcher of its own is gated the same way with the view and string where they are`() {
        // 46.9.3 keeps the dispatcher as an ordinary (View, String)V on a listener class whose
        // component field is typed, so there is no cast and the body is five instructions. p0 is
        // this, p1 the view and p2 the string, so the hook lands on v2 and borrows v3.
        val method = ownClickDispatcher(typedComponent = true)
        assertTrue(method.isShareRecipientClickDispatcher())
        val original = method.implementation!!.instructions.toList()

        method.interceptShareRecipientClick()

        val code = method.implementation!!.instructions.toList()
        assertEquals(original.size + 4, code.size)
        assertMethod(code[0], tools, "allowRecipientClick", listOf("Landroid/view/View;"), "Z")
        assertEquals(2, (code[0] as FiveRegisterInstruction).registerC)
        assertEquals(3, (code[1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_NEZ, code[2].opcode)
        original.forEachIndexed { index, instruction -> assertSame(instruction, code[index + 4]) }
    }

    @Test
    fun `a dispatcher of its own still has to read its callback off the component it holds`() {
        // Without the cast the component's type comes from the field, so a field typed Object
        // whose callback is read off some other class is not the dispatcher.
        assertFalse(ownClickDispatcher(typedComponent = false).isShareRecipientClickDispatcher())
    }

    private fun recipientBinder(includeUid: Boolean): MutableMethod {
        val uid = if (includeUid) {
            """
                invoke-virtual { v3 }, Lcom/ss/android/ugc/aweme/im/common/model/BaseContact;->getUid()Ljava/lang/String;
                move-result-object v4
            """
        } else {
            ""
        }
        return mutableMethod(
            "Lfixture/ShareAdapter;",
            "onBindViewHolder",
            listOf(viewHolder, "I"),
            27,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            """
                move-object/from16 v0, p1
                move-object/from16 v2, p0
                move/from16 v1, p2
                invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
                move-result-object v3
                check-cast v3, Lcom/ss/android/ugc/aweme/im/contacts/api/model/IMContact;
                if-nez v3, :bound
                return-void
                :bound
                invoke-virtual { v3 }, Lcom/ss/android/ugc/aweme/im/common/model/BaseContact;->getDisplayName()Ljava/lang/String;
                move-result-object v4
                iget-object v1, v0, $viewHolder->itemView:Landroid/view/View;
                invoke-virtual { v1, v4 }, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V
                $uid
                check-cast v3, Lcom/ss/android/ugc/aweme/im/contacts/api/model/IMConversation;
                invoke-virtual { v3 }, Lcom/ss/android/ugc/aweme/im/contacts/api/model/IMConversation;->getConversationId()Ljava/lang/String;
                move-result-object v4
                return-void
            """,
        )
    }

    private fun recipientClickDispatcher(extraInstruction: Boolean): MutableMethod {
        val owner = "Lfixture/ClickDispatcher;"
        val extra = if (extraInstruction) "move-object v2, p2" else ""
        return mutableMethod(
            owner,
            "LIZ$3",
            listOf(owner, "Landroid/view/View;", "Ljava/lang/String;"),
            3,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value,
            """
                iget-object v0, p0, $owner->LIZ:Ljava/lang/Object;
                check-cast v0, Lfixture/RecipientComponent;
                iget-object v0, v0, Lfixture/RecipientComponent;->LJFF:$function0
                if-eqz v0, :done
                invoke-interface { v0 }, $function0->invoke()Ljava/lang/Object;
                $extra
                :done
                return-void
            """,
        )
    }

    private fun ownClickDispatcher(typedComponent: Boolean): MutableMethod {
        val owner = "Lfixture/OwnClickDispatcher;"
        val fieldType = if (typedComponent) "Lfixture/RecipientComponent;" else "Ljava/lang/Object;"
        return mutableMethod(
            owner,
            "LIZ",
            listOf("Landroid/view/View;", "Ljava/lang/String;"),
            4,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            """
                iget-object v0, p0, $owner->LIZ:$fieldType
                iget-object v0, v0, Lfixture/RecipientComponent;->LJFF:$function0
                if-eqz v0, :done
                invoke-interface { v0 }, $function0->invoke()Ljava/lang/Object;
                :done
                return-void
            """,
        )
    }

    private fun mutableMethod(
        owner: String,
        name: String,
        parameters: List<String>,
        registers: Int,
        flags: Int,
        body: String,
    ): MutableMethod = MutableMethod(
        ImmutableMethod(
            owner,
            name,
            parameters.map { ImmutableMethodParameter(it, null, null) },
            "V",
            flags,
            null,
            null,
            ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply {
        addInstructionsWithLabels(0, body)
    }

    private fun assertMethod(
        instruction: Any,
        owner: String,
        name: String,
        parameters: List<String>,
        result: String,
    ) {
        val reference = (instruction as ReferenceInstruction).reference as MethodReference
        assertEquals(owner, reference.definingClass)
        assertEquals(name, reference.name)
        assertEquals(parameters, reference.parameterTypes.map(CharSequence::toString))
        assertEquals(result, reference.returnType)
    }
}

/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.misc.inbox

import app.morphe.Fixtures
import app.morphe.takes
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

private const val TITLE_BAR = "Lcom/ss/android/ugc/aweme/im/chatroom/common/titlebar/BaseSingleChatTitleBarRightAssem;"
private const val TUX = "Lcom/bytedance/tux/icon/TuxIconView;"
private const val STICKER_BANNER =
    "Lcom/ss/android/ugc/aweme/im/sdk/chat/ui/base/assems/preshown/PreshownStickerBannerProtocol;"
private const val SUGGESTED_REPLY =
    "Lcom/ss/android/ugc/aweme/im/smartreply/impl/suggestedreply/protocol/IMUnifiedSuggestedReplyMsgProtocol;"
private const val REPLY_INTRO =
    "Lcom/ss/android/ugc/aweme/im/smartreply/impl/entrance/protocol/SmartReplyIntroBannerProtocol;"
private const val CONTROLS = "Lapp/morphe/extension/tiktok/inbox/InboxControls;"
private const val CHAT_TITLE_BAR = "Lapp/morphe/extension/tiktok/inbox/ChatTitleBar;"

/**
 * The chat switches in Hide inbox items: the title bar's two call buttons, the sticker banner,
 * and the suggested reply cells and their intro. Each anchor is held to every declared build,
 * and each hook is applied to the real method it would patch.
 */
class ChatDeclutterAnchorsTest {
    private val gates = listOf(
        Triple(ChatStickerBannerEnabledFingerprint, STICKER_BANNER, "shouldShowChatStickerBanner"),
        Triple(ChatSuggestedReplyEnabledFingerprint, SUGGESTED_REPLY, "shouldShowChatAiReplies"),
        Triple(ChatSmartReplyIntroEnabledFingerprint, REPLY_INTRO, "shouldShowChatAiReplies"),
    )

    @Test
    fun `each enable check is one method that answers true, and the gate wraps it on every build`() {
        Fixtures.forEachDeclared { apk ->
            val version = Fixtures.versionOf(apk)
            val classes = classesOf(apk, gates.map { it.second }.toSet())
            for ((fingerprint, owner, callback) in gates) {
                val classDef = classes[owner] ?: error("$version: no $owner")
                val taken = classDef.methods.filter { fingerprint.takes(it, classDef) }
                assertEquals("$version: $owner enable checks matched", 1, taken.size)
                val native = taken.single()
                assertTrue("$version: $owner is not a bare answer of true", answersTrue(native))

                val gated = MutableMethod(native)
                gated.hideInboxWidget(callback)
                val code = gated.implementation!!.instructions.toList()
                assertEquals(
                    "$version: $owner opcodes",
                    listOf(
                        Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.RETURN,
                        Opcode.CONST_4, Opcode.RETURN,
                    ),
                    code.map { it.opcode },
                )
                val call = code[0].getReference<MethodReference>()!!
                assertEquals(CONTROLS, call.definingClass)
                assertEquals(callback, call.name)
                assertEquals("Z", call.returnType)
                assertTrue(call.parameterTypes.isEmpty())
                // TikTok's own answer sits behind the gate, untouched.
                native.implementation!!.instructions.toList().forEachIndexed { index, original ->
                    assertEquals(original.opcode, code[index + 4].opcode)
                }
            }
        }
    }

    @Test
    fun `the title bar stores exactly two call buttons on every build and each is handed over before its store`() {
        Fixtures.forEachDeclared { apk ->
            val version = Fixtures.versionOf(apk)
            val classDef = classesOf(apk, setOf(TITLE_BAR))[TITLE_BAR] ?: error("$version: no title bar")
            val taken = classDef.methods.filter { ChatTitleBarRightBindFingerprint.takes(it, classDef) }
            assertEquals("$version: title bar binds matched", 1, taken.size)

            val bind = MutableMethod(taken.single())
            val before = bind.implementation!!.instructions.toList()
            val stores = bind.callButtonStores()
            assertEquals("$version: call button stores", EXPECTED_CALL_BUTTONS, stores.size)
            val sources = stores.map { (before[it] as OneRegisterInstruction).registerA }

            bind.hideCallButtonsAtBind()
            val after = bind.implementation!!.instructions.toList()
            assertEquals(before.size + 2, after.size)
            // Each store is now preceded by the hand over of the register it stores.
            val newStores = bind.callButtonStores()
            assertEquals(stores.size, newStores.size)
            newStores.forEachIndexed { n, index ->
                assertEquals(Opcode.IPUT_OBJECT, after[index].opcode)
                val call = after[index - 1]
                assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
                val range = call as RegisterRangeInstruction
                assertEquals(1, range.registerCount)
                assertEquals("$version: hand over register", sources[n], range.startRegister)
                val target = call.getReference<MethodReference>()!!
                assertEquals(CHAT_TITLE_BAR, target.definingClass)
                assertEquals("hideCallButton", target.name)
                assertEquals(listOf("Landroid/view/View;"), target.parameterTypes.map(CharSequence::toString))
                assertEquals("V", target.returnType)
            }
            // Nothing else moved: dropping the two calls gives back TikTok's own bind.
            val kept = after.filterIndexed { i, _ -> newStores.none { it - 1 == i } }
            assertEquals(before.size, kept.size)
            before.indices.forEach { assertEquals(before[it].opcode, kept[it].opcode) }
        }
    }

    @Test
    fun `a title bar that does not store two icon views stops the patch`() {
        for (count in listOf(0, 1, 3)) {
            val bind = bind(List(count) { stored(it) })
            val failure = assertThrows(PatchException::class.java) { bind.hideCallButtonsAtBind() }
            assertTrue(failure.message!!.contains("stores $count icon views"))
        }
    }

    @Test
    fun `only icon views stored in the title bar's own fields count`() {
        val otherType = ImmutableInstruction22c(
            Opcode.IPUT_OBJECT, 2, 3, ImmutableFieldReference(TITLE_BAR, "x", "Landroid/view/View;"),
        )
        val otherClass = ImmutableInstruction22c(
            Opcode.IPUT_OBJECT, 2, 3, ImmutableFieldReference("Lcom/example/Other;", "y", TUX),
        )
        val bind = bind(listOf(stored(0), otherType, stored(1), otherClass))
        // The cast sits at 0, so the stores are at 1 and 3.
        assertEquals(listOf(1, 3), bind.callButtonStores())
        bind.hideCallButtonsAtBind()
        assertEquals(8, bind.implementation!!.instructions.count())
    }

    @Test
    fun `the hand over is a range call over the stored register`() {
        val first = ImmutableInstruction22c(Opcode.IPUT_OBJECT, 14, 15, ImmutableFieldReference(TITLE_BAR, "a", TUX))
        val second = ImmutableInstruction22c(Opcode.IPUT_OBJECT, 2, 15, ImmutableFieldReference(TITLE_BAR, "b", TUX))
        val bind = bind(listOf(first, second), registers = 16)
        bind.hideCallButtonsAtBind()
        val code = bind.implementation!!.instructions.toList()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, code[1].opcode)
        assertEquals(14, (code[1] as RegisterRangeInstruction).startRegister)
        assertEquals(Opcode.IPUT_OBJECT, code[2].opcode)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, code[3].opcode)
        assertEquals(2, (code[3] as RegisterRangeInstruction).startRegister)
    }

    private fun answersTrue(method: Method): Boolean {
        val code = method.implementation?.instructions?.toList() ?: return false
        if (code.size != 2) return false
        val literal = code[0] as? NarrowLiteralInstruction ?: return false
        val register = (code[0] as OneRegisterInstruction).registerA
        return literal.narrowLiteral == 1 && code[1].opcode == Opcode.RETURN &&
            (code[1] as OneRegisterInstruction).registerA == register
    }

    private fun classesOf(apk: java.io.File, names: Set<String>): Map<String, ClassDef> {
        val found = HashMap<String, ClassDef>()
        val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
        for (entry in container.dexEntryNames) {
            for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                if (classDef.type in names) found.putIfAbsent(classDef.type, classDef)
            }
            if (found.size == names.size) break
        }
        return found
    }

    private fun stored(n: Int) = ImmutableInstruction22c(
        Opcode.IPUT_OBJECT, 2, 3, ImmutableFieldReference(TITLE_BAR, "f$n", TUX),
    )

    private fun bind(stores: List<Instruction>, registers: Int = 12) = MutableMethod(
        ImmutableMethod(
            TITLE_BAR, "onViewCreated",
            listOf(ImmutableMethodParameter("Landroid/view/View;", null, null)),
            "V", AccessFlags.PUBLIC.value, null, null,
            ImmutableMethodImplementation(
                registers,
                listOf<Instruction>(ImmutableInstruction21c(Opcode.CHECK_CAST, 2, ImmutableTypeReference(TUX))) +
                    stores + ImmutableInstruction10x(Opcode.RETURN_VOID),
                null, null,
            ),
        ),
    )
}

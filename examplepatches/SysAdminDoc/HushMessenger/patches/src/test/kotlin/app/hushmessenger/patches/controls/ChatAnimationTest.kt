package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue
import org.w3c.dom.Element

private const val CHAT = "LX/1hl;"
private const val INBOX = "LX/1fs;"
private const val LEGACY = "LX/1hd;"
private const val SHARED_BASE = "LX/4gM;"

/** androidx's base answer in every tested build. */
internal const val FRAGMENT_ANIMATION_BODY = "const/4 v0, 0x0\nreturn-object v0"

/** The older chat's override in every tested build: the transaction's animation, or none. */
internal val LEGACY_CHAT_ANIMATION_BODY = """
    if-eqz p3, :none
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;
    move-result-object v0
    invoke-static {v0, p3}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)$ANIMATION
    move-result-object v0
    return-object v0
    :none
    const/4 v0, 0x0
    return-object v0
""".trimIndent()

class ChatAnimationTest {
    private fun base(body: String = FRAGMENT_ANIMATION_BODY, registers: Int = 5, flags: Int = AccessFlags.PUBLIC.value) =
        fixtureMethod(FRAGMENT_ANIMATION, body, registers, flags)

    private fun legacy(body: String = LEGACY_CHAT_ANIMATION_BODY, registers: Int = 5) =
        fixtureMethod("$LEGACY->onCreateAnimation(IZI)$ANIMATION", body, registers)

    private fun Instruction.ref() = (this as ReferenceInstruction).reference.toString()
    private fun Instruction.register() = (this as OneRegisterInstruction).registerA
    private fun Instruction.literal() = (this as WideLiteralInstruction).wideLiteral
    private fun Instruction.args() = (this as FiveRegisterInstruction).let {
        listOf(it.registerC, it.registerD, it.registerE, it.registerF, it.registerG).take(it.registerCount)
    }

    /** The chat, the inbox host and the older chat, over the base class they share, over androidx. */
    private fun hierarchy(baseMethods: List<String> = emptyList()): Map<String, ClassDef> = listOf(
        fixtureClass(ANDROIDX_FRAGMENT, listOf(base())),
        fixtureClass(SHARED_BASE, baseMethods.map { fixtureMethod(it, "return-void") }, superclass = ANDROIDX_FRAGMENT),
        fixtureClass(CHAT, listOf(fixtureMethod("$CHAT-><init>()V", "return-void")), "MsysThreadViewFragment", superclass = SHARED_BASE),
        fixtureClass(INBOX, listOf(fixtureMethod("$INBOX-><init>()V", "return-void")), "M4TabNavigationFragment", superclass = SHARED_BASE),
        fixtureClass(LEGACY, listOf(legacy()), "ThreadViewFragment", superclass = SHARED_BASE),
    ).associateBy { it.type }

    @Test fun theBaseAnswerAsksForTheChatAndTheInboxAndKeepsNoneForEveryOtherFragment() {
        val method = base()
        method.injectFragmentAnimation(CHAT, INBOX)
        val code = method.implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.INSTANCE_OF, Opcode.IF_NEZ, Opcode.INSTANCE_OF, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.GOTO,
            Opcode.CONST_4, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT,
            Opcode.CONST_4, Opcode.RETURN_OBJECT), code.map { it.opcode })
        assertEquals(listOf(CHAT, INBOX), listOf(code[0].ref(), code[2].ref()))
        // The inbox asks with role 2, the chat with role 1, and both pass the fragment, enter and nextAnim.
        assertEquals(listOf(2L, 1L), listOf(code[4].literal(), code[6].literal()))
        assertEquals(CHAT_ANIMATION_CREATE, code[7].ref())
        assertEquals(listOf(1, 0, 3, 4), code[7].args())
        // Anything else falls through to androidx's own answer, untouched.
        assertEquals(0L, code[10].literal())
        assertEquals(listOf(0, 0), listOf(code[10].register(), code[11].register()))
    }

    @Test fun theOlderChatAsksFirstAndLoadsItsOwnAnimationOtherwise() {
        val method = legacy()
        method.injectLegacyChatAnimation()
        val code = method.implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.CONST_4, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.RETURN_OBJECT),
            code.take(5).map { it.opcode })
        assertEquals(1L, code[0].literal())
        assertEquals(listOf(1, 0, 3, 4), code[1].args())
        // The stock loader follows unchanged, still reading nextAnim from v4.
        assertEquals(legacy().implementation!!.instructions.map { it.opcode }, code.drop(5).map { it.opcode })
        assertEquals(4, code[5].register())
    }

    @Test fun changedAnimationMethodsFailBeforeAnyEdit() {
        for (changed in listOf(
            base("const/4 v0, 0x1\nreturn-object v0"),
            base("const/4 v1, 0x0\nreturn-object v1"),
            base(registers = 6),
            base(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
        )) {
            val before = changed.implementation!!.instructions.toList()
            assertFailsWith<PatchException> { changed.injectFragmentAnimation(CHAT, INBOX) }
            assertEquals(before, changed.implementation!!.instructions.toList())
        }
        for (changed in listOf(
            legacy(LEGACY_CHAT_ANIMATION_BODY.replace("if-eqz p3", "if-eqz p1")),
            legacy(LEGACY_CHAT_ANIMATION_BODY.replace("AnimationUtils;->loadAnimation", "AnimationUtils;->loadLayoutAnimation")),
            legacy(registers = 6),
        )) assertFailsWith<PatchException> { changed.injectLegacyChatAnimation() }
    }

    @Test fun theChatAndTheInboxMustTakeAndroidxsAnswer() {
        val classes = hierarchy()
        for (type in listOf(CHAT, INBOX)) validateInheritsFragmentAnimation(type) { classes[it] }
        // A class between them and androidx that answers for itself would hide them from the edit.
        val overridden = hierarchy(listOf("$SHARED_BASE->onCreateAnimation(IZI)$ANIMATION"))
        assertFailsWith<PatchException> { validateInheritsFragmentAnimation(CHAT) { overridden[it] } }
        // So would a chat that's no longer an androidx fragment at all.
        assertFailsWith<PatchException> { validateInheritsFragmentAnimation(CHAT) { (classes - ANDROIDX_FRAGMENT)[it] } }
    }

    @Test fun discoveryNeedsTheOriginalNamesAndTheNoArgumentConstructors() {
        val classes = hierarchy().values.toList()
        val found = findControls(classes)
        assertEquals(listOf(FRAGMENT_ANIMATION), found.getValue("chat_animation").map { it.hookId() })
        assertEquals(listOf("$CHAT-><init>()V"), found.getValue("chat_fragment").map { it.hookId() })
        assertEquals(listOf("$INBOX-><init>()V"), found.getValue("chat_inbox").map { it.hookId() })
        assertEquals(listOf("$LEGACY->onCreateAnimation(IZI)$ANIMATION"), found.getValue("chat_legacy").map { it.hookId() })
        // Renamed classes, or a chat whose only constructor takes arguments, aren't the chat any more.
        val renamed = classes.map { cls ->
            if (cls.type in setOf(CHAT, LEGACY)) fixtureClass(cls.type, cls.methods.toList(), "SomethingElse", superclass = SHARED_BASE) else cls
        }
        val withoutNames = findControls(renamed)
        assertTrue(withoutNames.getValue("chat_fragment").isEmpty())
        assertTrue(withoutNames.getValue("chat_legacy").isEmpty())
        val withArguments = classes.map { cls ->
            if (cls.type != CHAT) cls else fixtureClass(CHAT, listOf(fixtureMethod("$CHAT-><init>(I)V", "return-void")),
                "MsysThreadViewFragment", superclass = SHARED_BASE)
        }
        assertTrue(findControls(withArguments).getValue("chat_fragment").isEmpty())
    }

    @Test fun theChatActivitySlideMatchesTheFragmentSlide() {
        // The extension looks these names up when a chat opens in its own activity.
        assertEquals(listOf("ease", "in", "in_rtl", "out", "out_rtl", "hold").map { "res/anim/hush_chat_$it.xml" }.toSet(),
            CHAT_ANIMATION_FILES.keys)
        val parser = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }.newDocumentBuilder()
        fun root(name: String): Element = parser.parse(ByteArrayInputStream(
            CHAT_ANIMATION_FILES.getValue("res/anim/hush_chat_$name.xml").toByteArray())).documentElement
        fun Element.android(name: String) = getAttributeNS("http://schemas.android.com/apk/res/android", name)

        val ease = root("ease")
        assertEquals("pathInterpolator", ease.tagName)
        assertEquals(listOf("0.2", "0", "0", "1"), listOf("controlX1", "controlY1", "controlX2", "controlY2").map { ease.android(it) })
        // Same lengths as ChatAnimation.SLIDE_IN and SLIDE_OUT, mirrored for right-to-left languages.
        for ((name, from, to, duration) in listOf(
            listOf("in", "100%", "0", "300"), listOf("in_rtl", "-100%", "0", "300"),
            listOf("out", "0", "100%", "250"), listOf("out_rtl", "0", "-100%", "250"),
        )) {
            val slide = root(name)
            assertEquals("translate", slide.tagName)
            assertEquals(listOf(from, to, duration, "@anim/hush_chat_ease"),
                listOf("fromXDelta", "toXDelta", "duration", "interpolator").map { slide.android(it) }, name)
        }
        val hold = root("hold")
        assertEquals("alpha", hold.tagName)
        assertEquals(listOf("1", "1", "300"), listOf("fromAlpha", "toAlpha", "duration").map { hold.android(it) })
    }
}

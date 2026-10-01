package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class AnonymousStoriesTest {
    // The fixtures are raw strings in a file Git may check out with CRLF; the edits below split lines on LF.
    private fun String.lf() = replace("\r\n", "\n")

    private fun handler(body: String = STORY_MARK_READ_BODY.lf()) = fixtureMethod(STORY_MARK_READ_HOOK, body)

    private fun reference(instruction: Any) = (instruction as ReferenceInstruction).reference.toString()

    @Test fun switchOnSkipsTheSendAndRunsTheLocalUpdate() {
        val method = handler()
        val original = method.implementation!!.instructions.toList()
        method.injectStorySeen()
        val code = method.implementation!!.instructions.toList()
        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        assertEquals("$SETTINGS->viewStoriesAnonymously()Z", reference(code[1]))
        assertEquals(Opcode.IF_EQZ, code[3].opcode)
        // Off: the untouched send. On: v0 back to the 0 the local update expects, then straight to it.
        assertEquals(addresses[6], addresses[3] + (code[3] as OffsetInstruction).codeOffset)
        assertEquals(original.drop(1), code.drop(6))
        assertEquals(Opcode.CONST_4, code[4].opcode)
        assertEquals(0, (code[4] as OneRegisterInstruction).registerA)
        val localSeen = code.indexOfFirst { it.opcode == Opcode.INVOKE_STATIC && reference(it).contains("ImmutableList;->of(") }
        assertEquals(addresses[localSeen], addresses[5] + (code[5] as OffsetInstruction).codeOffset)
        assertTrue(code.none { it is ReferenceInstruction && reference(it).contains("markStorySeen") })
    }

    @Test fun readSetIsTheClassTheLocalUpdateHandsTheCardTo() {
        val add = handler().storyReadSetAdd()
        assertEquals(STORY_READ_SET_ADD, add.toString())
        val readSet = storyReadSetClass().validateStoryReadSet(add)
        assertEquals("$STORY_READ_SET->A01:Ljava/util/Set;", readSet.set)
        assertEquals("$STORY_READ_SET->A02:$FB_USER_SESSION", readSet.session)
        assertEquals("$MONTAGE_CARD->A0K:Ljava/lang/String;", readSet.cardId)
        assertEquals(STORY_READ_SET_ADD, readSet.add)
    }

    @Test fun readSetKeepsEachCardAndANewSessionGetsItsCardsBack() {
        val cls = storyReadSetClass()
        val readSet = cls.validateStoryReadSet(handler().storyReadSetAdd())
        val adder = cls.methods.single { it.hookId() == STORY_READ_SET_ADD }
        val added = adder.implementation!!.instructions.toList()
        adder.injectStoryReadSetAdd(readSet)
        val add = adder.implementation!!.instructions.toList()
        // Locals hold nothing at entry, so v0 and v1 are free; p0 is v5 and p1, the card, is v6.
        assertEquals(readSet.session, reference(add[0]))
        assertEquals(listOf(0, 5), (add[0] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals(readSet.cardId, reference(add[1]))
        assertEquals(listOf(1, 6), (add[1] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals("$SETTINGS->markStorySeen(Ljava/lang/Object;Ljava/lang/String;)V", reference(add[2]))
        assertEquals(listOf(0, 1), (add[2] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
        assertEquals(added, add.drop(3))

        val constructor = cls.methods.single { it.name == "<init>" }
        val built = constructor.implementation!!.instructions.toList()
        constructor.injectStoryReadSetSeed(readSet)
        val seeded = constructor.implementation!!.instructions.toList()
        assertEquals(built.dropLast(1), seeded.take(built.size - 1))
        assertEquals(readSet.set, reference(seeded[built.size - 1]))
        assertEquals(readSet.session, reference(seeded[built.size]))
        assertEquals("$SETTINGS->seedSeenStories(Ljava/util/Set;Ljava/lang/Object;)V", reference(seeded[built.size + 1]))
        assertEquals(Opcode.RETURN_VOID, seeded.last().opcode)
        assertEquals(built.size + 3, seeded.size)
    }

    @Test fun aHandlerThatNoLongerHandsOverTheCardIsRejected() {
        val readSetCall = "invoke-virtual {v2, p1, v1, v0}, $STORY_READ_SET_ADD\n"
        assertFailsWith<PatchException> { handler(STORY_MARK_READ_BODY.lf().replace(readSetCall, "")).storyReadSetAdd() }
        assertFailsWith<PatchException> { handler(STORY_MARK_READ_BODY.lf().replace(readSetCall, readSetCall + readSetCall)).storyReadSetAdd() }
        assertFailsWith<PatchException> {
            handler(STORY_MARK_READ_BODY.lf().replace(readSetCall, "invoke-virtual {v2, v1, v1, v0}, $STORY_READ_SET_ADD\n")).storyReadSetAdd()
        }
        // A card-taking call before the local update is the send's business, not the read set.
        assertFailsWith<PatchException> {
            handler(STORY_MARK_READ_BODY.lf().replace(readSetCall, "").replace(":send\n", ":send\n$readSetCall")).storyReadSetAdd()
        }
    }

    @Test fun aReadSetThatChangedShapeIsRejected() {
        val add = handler().storyReadSetAdd()
        fun rejects(cls: app.morphe.patcher.util.proxy.mutableTypes.MutableClass) {
            assertFailsWith<PatchException> { cls.validateStoryReadSet(add) }
        }
        rejects(storyReadSetClass(fieldTypes = listOf("Ljava/util/Set;", FB_USER_SESSION, "Ljava/util/Set;")))
        rejects(storyReadSetClass(fieldTypes = listOf("Ljava/util/Set;", "Ljava/lang/Object;")))
        rejects(storyReadSetClass(init = STORY_READ_SET_INIT_BODY.lf().replace("return-void", "if-eqz p1, :done\nnop\n:done\nreturn-void")))
        rejects(storyReadSetClass(init = STORY_READ_SET_INIT_BODY.lf().replace("iput-object p1, p0, LX/2W3;->A02:$FB_USER_SESSION\n", "")))
        rejects(storyReadSetClass(extraMethods = listOf(fixtureMethod("$STORY_READ_SET-><init>()V", "return-void", registers = 3))))
        rejects(storyReadSetClass(add = STORY_READ_SET_ADD_BODY.lf().replace("iget-object v0, p1, $MONTAGE_CARD->A0K:Ljava/lang/String;",
            "const-string v0, \"not the card\"")))
        rejects(storyReadSetClass(add = STORY_READ_SET_ADD_BODY.lf().replace("invoke-interface {v1, v0}", "invoke-interface {v1, v4}")))
        rejects(storyReadSetClass(add = STORY_READ_SET_ADD_BODY.lf() + "\ninvoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z"))
    }
}

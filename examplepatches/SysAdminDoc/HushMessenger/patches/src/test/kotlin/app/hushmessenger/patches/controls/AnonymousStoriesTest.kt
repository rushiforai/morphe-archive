package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class AnonymousStoriesTest {
    @AfterTest fun reset() {
        activeProfile = BASE_PROFILE
    }

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

    private val readCardId = "$MONTAGE_CARD->A0K:Ljava/lang/String;"

    @Test fun theChatListRingIsTheFlagAndCountThePreviewsOwnRingStateReads() {
        val ring = storyPreviewClass().validateStoryRing()
        assertEquals(STORY_PREVIEW_INIT, ring.constructor)
        assertEquals("$MONTAGE_BUCKET_PREVIEW->A05:$MONTAGE_CARD", ring.card)
        assertEquals("$MONTAGE_BUCKET_PREVIEW->A0D:Z", ring.unread)
        assertEquals("$MONTAGE_BUCKET_PREVIEW->A02:I", ring.unreadCount)
    }

    @Test fun everyNewPreviewAsksAboutItsCardAndASeenCardLosesItsRing() {
        val cls = storyPreviewClass()
        val ring = cls.validateStoryRing()
        val constructor = cls.methods.single { it.hookId() == STORY_PREVIEW_INIT }
        val built = constructor.implementation!!.instructions.toList()
        cls.injectStoryRing(ring, readCardId)

        // The helper call takes the only return's place and a new return follows, so nothing before it moves.
        val init = constructor.implementation!!.instructions.toList()
        assertEquals(built.size + 1, init.size)
        assertEquals(built.dropLast(1), init.dropLast(2))
        val call = init[init.size - 2]
        assertEquals("$MONTAGE_BUCKET_PREVIEW->$STORY_RING_HELPER($MONTAGE_BUCKET_PREVIEW)V", reference(call))
        assertEquals(Opcode.INVOKE_STATIC, call.opcode)
        assertEquals(listOf(1, 6), (call as FiveRegisterInstruction).let { listOf(it.registerCount, it.registerC) })
        assertEquals(Opcode.RETURN_VOID, init.last().opcode)

        val helper = cls.methods.single { it.name == STORY_RING_HELPER }
        assertTrue(AccessFlags.STATIC.isSet(helper.accessFlags) && AccessFlags.PUBLIC.isSet(helper.accessFlags))
        assertTrue(cls.directMethods.any { it.name == STORY_RING_HELPER })
        val code = helper.implementation!!.instructions.toList()
        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        assertEquals(listOf(ring.card, readCardId), listOf(reference(code[0]), reference(code[2])))
        assertEquals("$SETTINGS->storyRingSeen(Ljava/lang/Object;Ljava/lang/String;)Z", reference(code[3]))
        // No card or a card the extension doesn't know: straight to the return with the ring untouched.
        for (branch in listOf(1, 5)) {
            assertEquals(Opcode.IF_EQZ, code[branch].opcode)
            assertEquals(addresses[code.lastIndex], addresses[branch] + (code[branch] as OffsetInstruction).codeOffset)
        }
        assertEquals(listOf(Opcode.IPUT_BOOLEAN, Opcode.IPUT), listOf(code[7].opcode, code[8].opcode))
        assertEquals(listOf(ring.unread, ring.unreadCount), listOf(reference(code[7]), reference(code[8])))
        assertEquals(Opcode.RETURN_VOID, code.last().opcode)

        // Both ring values are written after construction now, so they drop final. The card and the rest keep it.
        val final = cls.fields.associate { it.name to AccessFlags.FINAL.isSet(it.accessFlags) }
        assertFalse(final.getValue("A0D") || final.getValue("A02"))
        assertTrue(final.getValue("A05") && final.getValue("A0C") && final.getValue("A0E"))
    }

    @Test fun aPreviewThatChangedShapeIsRejectedBeforeAnyEdit() {
        fun rejects(cls: MutableClass) {
            val before = cls.methods.associate { it.hookId() to it.implementation!!.instructions.toList() }
            assertFailsWith<PatchException> { cls.validateStoryRing() }
            assertEquals(before, cls.methods.associate { it.hookId() to it.implementation!!.instructions.toList() })
        }
        val init = STORY_PREVIEW_INIT_BODY.lf()
        val ringState = STORY_PREVIEW_RING_BODY.lf()
        rejects(storyPreviewClass(cards = 2))
        rejects(storyPreviewClass(cards = 0))
        rejects(storyPreviewClass(ring = ringState.replace("iget v0, p0, $MONTAGE_BUCKET_PREVIEW->A02:I\nif-lez v0, :seen\n", "")))
        rejects(storyPreviewClass(ring = ringState.replace("if-nez v0, :ring", "if-eqz v0, :ring")))
        rejects(storyPreviewClass(ring = ringState.replace("iget v0, p0, $MONTAGE_BUCKET_PREVIEW->A02:I", "iget v0, p1, LX/2Uu;->A00:I")))
        rejects(storyPreviewClass(init = init.replace("return-void", "if-eqz p1, :early\nreturn-void\n:early\nreturn-void")))
        rejects(storyPreviewClass(init = init.replace("iput-boolean v2, p0, $MONTAGE_BUCKET_PREVIEW->A0D:Z\n", "")))
        rejects(storyPreviewClass(init = init.replace("iput v0, p0, $MONTAGE_BUCKET_PREVIEW->A02:I\n",
            "iput v0, p0, $MONTAGE_BUCKET_PREVIEW->A02:I\niput v0, p0, $MONTAGE_BUCKET_PREVIEW->A02:I\n")))
        rejects(storyPreviewClass(init = init.replace("iput-object p3, p0, $MONTAGE_BUCKET_PREVIEW->A05:$MONTAGE_CARD\n", "")))
        rejects(storyPreviewClass(extraMethods = listOf(fixtureMethod("$MONTAGE_BUCKET_PREVIEW-><init>()V", "return-void", 1))))
        rejects(storyPreviewClass(extraMethods = listOf(fixtureMethod("$MONTAGE_BUCKET_PREVIEW->$STORY_RING_HELPER($MONTAGE_BUCKET_PREVIEW)V",
            "return-void", 1, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value))))
    }

    @Test fun everyStockBuildBuildsItsPreviewsThroughTheOneHookedConstructor() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        val ringFields = mutableSetOf<String>()
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val byType: Map<String, ClassDef> = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.associateBy { it.type }
            val hooks = activeProfile.hooks.getValue("anonymous_stories")
            assertTrue(STORY_PREVIEW_INIT in hooks, code)
            val handlerType = hooks.single { it != STORY_PREVIEW_INIT }.substringBefore("->")
            val preview = byType.getValue(MONTAGE_BUCKET_PREVIEW)
            val discovered = findControls(listOf(byType.getValue(handlerType), preview))
            validateControls(discovered, setOf("anonymous_stories"))

            val handler = MutableMethod(discovered.getValue("anonymous_stories").single { it.definingClass == handlerType })
            val readSet = byType.getValue(handler.storyReadSetAdd().definingClass).validateStoryReadSet(handler.storyReadSetAdd())
            assertEquals(readCardId, readSet.cardId, code)
            val ring = preview.validateStoryRing()
            assertEquals(STORY_PREVIEW_INIT, ring.constructor, code)
            ringFields += "${ring.card} ${ring.unread} ${ring.unreadCount}"

            val mutable = MutableClass(preview)
            val constructor = mutable.methods.single { it.hookId() == STORY_PREVIEW_INIT }
            val built = constructor.implementation!!.instructions.toList()
            mutable.injectStoryRing(mutable.validateStoryRing(), readSet.cardId)
            val init = constructor.implementation!!.instructions.toList()
            assertEquals(built.dropLast(1), init.dropLast(2), code)
            assertEquals("$MONTAGE_BUCKET_PREVIEW->$STORY_RING_HELPER($MONTAGE_BUCKET_PREVIEW)V", reference(init[init.size - 2]), code)
            assertEquals(Opcode.RETURN_VOID, init.last().opcode, code)
        }
        // 580 keeps the card in A05 and the flag in A0D; 581 moved them to A06 and A0G.
        assertEquals(setOf(
            "$MONTAGE_BUCKET_PREVIEW->A05:$MONTAGE_CARD $MONTAGE_BUCKET_PREVIEW->A0D:Z $MONTAGE_BUCKET_PREVIEW->A02:I",
            "$MONTAGE_BUCKET_PREVIEW->A06:$MONTAGE_CARD $MONTAGE_BUCKET_PREVIEW->A0G:Z $MONTAGE_BUCKET_PREVIEW->A02:I",
        ), ringFields)
    }
}

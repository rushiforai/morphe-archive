package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val ROW = "LX/Sr1;"
private const val SECTIONS = "LX/Sr2;"
internal const val SYNTHETIC_HOISTED_STORY = "$HOISTED_SHARE_LOADER->A01()V"
internal const val SYNTHETIC_UNHOISTED_STORY = "$SECTIONS->A8C()V"
private const val KEEP = "$SETTINGS->keepShareStory(Z)Z"
private const val SKIP = "$SETTINGS->shareStorySection(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"

private const val ROW_ID_BODY = "const-string v0, \"$STORY_ROW_ID\"\nreturn-object v0"

/** The hoisted loader's A01 as 585 writes it, cut down: the story answer, then the row into the builder. */
private const val HOISTED_BODY = """iget-object v1, p0, $HOISTED_SHARE_LOADER->A05:Ljava/util/concurrent/Future;
invoke-interface {v1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
move-result-object v1
invoke-static {v1}, LX/001;->A1V(Ljava/lang/Object;)Z
move-result v0
if-eqz v0, :facebook
new-instance v0, $ROW
invoke-direct {v0}, $ROW-><init>()V
iget-object v1, p0, $HOISTED_SHARE_LOADER->A04:Ljava/util/List;
invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
:facebook
return-void"""

/** The unhoisted section: the run state against the skip marker, the trace, a one-row list, and the skip path. */
private const val SECTION_BODY = """sget-object v1, LX/1dj;->A03:Ljava/lang/Object;
iget-object v4, p0, $SECTIONS->A0N:Ljava/lang/Object;
if-eq v4, v1, :skip
const-string v0, "$UNHOISTED_SHARE_TRACE"
invoke-static {v0}, LX/0Bv;->A01(Ljava/lang/String;)V
new-instance v4, $ROW
invoke-direct {v4}, $ROW-><init>()V
invoke-static {v4}, $IMMUTABLE_LIST->of(Ljava/lang/Object;)$IMMUTABLE_LIST
move-result-object v4
invoke-static {}, LX/0Bv;->A00()V
:skip
invoke-direct {p0}, $SECTIONS->A00()Z
move-result v4
return-void"""

private fun rowClass(id: String = ROW_ID_BODY, type: String = ROW) = fixtureClass(type, listOf(
    fixtureMethod("$type-><init>()V", "invoke-direct {p0}, Ljava/lang/Object;-><init>()V\nreturn-void", 1),
    fixtureMethod("$type->getId()Ljava/lang/String;", id, 2),
))

private fun hoisted(body: String = HOISTED_BODY) = fixtureMethod(SYNTHETIC_HOISTED_STORY, body, 3)
private fun section(body: String = SECTION_BODY) = fixtureMethod(SYNTHETIC_UNHOISTED_STORY, body, 6)

/** The story row and the two loaders that make it. */
internal fun shareStoryFixture(
    loader: MutableMethod = hoisted(),
    sections: MutableMethod = section(),
    row: MutableClass = rowClass(),
): List<MutableClass> = listOf(row, fixtureClass(HOISTED_SHARE_LOADER, listOf(loader)), fixtureClass(SECTIONS, listOf(sections)))

private const val CHAT_LIST = "LX/Sr8;"
internal const val SYNTHETIC_STORY_TARGET = "$CHAT_LIST->onActivityCreated(Landroid/os/Bundle;)V"
private const val TOGGLE = "$CHAT_LIST->A0S(Landroid/content/Context;Ljava/lang/String;Z)V"
private const val TARGET = "$SETTINGS->storyShareTarget(I)Z"
private const val CHATS_ACTIVITY = "com.facebook.messenger.intents.ShareIntentHandler"

/** The chat list's onActivityCreated as 586 writes it, cut down: Messenger's answer, then the toggle on Your story, then on Chats. */
private const val CHAT_LIST_BODY = """invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;
move-result-object v2
iget-boolean v0, p0, $CHAT_LIST->A1m:Z
const/4 v1, 0x1
if-nez v0, :story
const/4 v1, 0x0
:story
const-string v0, "$STORY_SHARE_ACTIVITY"
invoke-static {v2, v0, v1}, $TOGGLE
const-string v0, "$CHATS_ACTIVITY"
invoke-static {v2, v0, v1}, $TOGGLE
return-void"""

/** The toggle as 586 writes it, cut down: the component named in this package, set on. */
private const val TOGGLE_BODY = """invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
move-result-object v0
new-instance v1, Landroid/content/ComponentName;
invoke-direct {v1, p0, p1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V
const/4 v2, 0x1
invoke-virtual {v0, v1, v2, v2}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V
return-void"""

private fun chatList(body: String = CHAT_LIST_BODY) = fixtureMethod(SYNTHETIC_STORY_TARGET, body, 5)
private fun toggle(body: String = TOGGLE_BODY) =
    fixtureMethod(TOGGLE, body, 6, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value)

/** The chat list fragment that turns the Your story share target on or off, with its toggle. */
internal fun shareTargetFixture(list: MutableMethod = chatList(), toggle: MutableMethod = toggle()): List<MutableClass> =
    listOf(fixtureClass(CHAT_LIST, listOf(list, toggle)))

private fun Method.code() = implementation!!.instructions.toList()

class ShareStoryTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(SHARE_STORY).map { it.hookId() }.toSet()

    @Test fun bothLoadersOfTheStoryRowAreFound() {
        assertEquals(setOf(SYNTHETIC_HOISTED_STORY, SYNTHETIC_UNHOISTED_STORY), found(shareStoryFixture()))
        assertEquals(ROW, shareStoryRow)
        validateControls(mirroredControls(shareStoryFixture()), setOf(SHARE_STORY))
    }

    @Test fun eachFamilyMapsItsOwnSection() {
        val hoisted = "$HOISTED_SHARE_LOADER->A01()V"
        assertEquals(setOf("LX/P4A;->A8j()V", hoisted), BASE_PROFILE.hooks.getValue(SHARE_STORY))
    }

    // The switch promises that only Your story leaves the list. A row we can't tie to the story, or a gate that could
    // also drop something else, gets no hook at all.
    @Test fun anyOtherShapeLeavesTheControlUnapplied() {
        fun loader(from: String, to: String) = shareStoryFixture(loader = hoisted(HOISTED_BODY.replace(from, to).also { check(it != HOISTED_BODY) }))
        fun sections(from: String, to: String) = shareStoryFixture(sections = section(SECTION_BODY.replace(from, to).also { check(it != SECTION_BODY) }))
        val thirdCreator = fixtureClass("LX/Sr3;", listOf(fixtureMethod("LX/Sr3;->A00()V", "new-instance v0, $ROW\nreturn-void", 1)))
        val cases = mapOf(
            "a second story row" to shareStoryFixture() + rowClass(type = "LX/Sr4;"),
            "a row whose id isn't the story" to shareStoryFixture(row = rowClass("const-string v0, \"SHARE_TO_FB_ID\"\nreturn-object v0")),
            "a row id worked out at run time" to shareStoryFixture(row = rowClass("const-string v0, \"$STORY_ROW_ID\"\ninvoke-static {v0}, LX/0Bv;->A02(Ljava/lang/String;)V\nreturn-object v0")),
            "a third place making the row" to shareStoryFixture() + thirdCreator,
            "only one loader" to listOf(rowClass(), fixtureClass(HOISTED_SHARE_LOADER, listOf(hoisted()))),
            "the hoisted loader making it twice" to loader("Ljava/util/List;->add(Ljava/lang/Object;)Z", "Ljava/util/List;->add(Ljava/lang/Object;)Z\nnew-instance v0, $ROW"),
            "the hoisted gate flipped" to loader("if-eqz v0, :facebook", "if-nez v0, :facebook"),
            "a hoisted answer that isn't a static check" to loader("invoke-static {v1}, LX/001;->A1V(Ljava/lang/Object;)Z", "invoke-interface {v1}, LX/2Ab;->A00(Ljava/lang/Object;)Z"),
            "a branch straight to the hoisted gate" to shareStoryFixture(loader = hoisted(HOISTED_BODY
                .replace("move-result-object v1\n", "move-result-object v1\nif-eqz v1, :gate\n").replace("if-eqz v0, :facebook", ":gate\nif-eqz v0, :facebook"))),
            "the hoisted loader in another class" to listOf(rowClass(), fixtureClass("LX/Sr5;", listOf(fixtureMethod("LX/Sr5;->A01()V", HOISTED_BODY, 3))),
                fixtureClass(SECTIONS, listOf(section()))),
            "no unhoisted trace" to sections("const-string v0, \"$UNHOISTED_SHARE_TRACE\"", "const-string v0, \"other\""),
            "a section holding more than the row" to sections("invoke-static {v4}, $IMMUTABLE_LIST->of(Ljava/lang/Object;)$IMMUTABLE_LIST",
                "invoke-static {v4, v1}, $IMMUTABLE_LIST->of(Ljava/lang/Object;Ljava/lang/Object;)$IMMUTABLE_LIST"),
            "a run state from another class" to sections("iget-object v4, p0, $SECTIONS->A0N", "iget-object v4, p0, LX/Sr6;->A0N"),
            "a skip path that reads the run state" to sections("invoke-direct {p0}, $SECTIONS->A00()Z", "invoke-direct {p0, v4}, $SECTIONS->A01(Ljava/lang/Object;)Z"),
            "a skip path that keeps the run state" to sections("move-result v4\nreturn-void", "move-result v3\nreturn-void"),
            "a branch straight to the section gate" to shareStoryFixture(sections = section(SECTION_BODY
                .replace("sget-object v1", "if-nez v3, :gate\nsget-object v1").replace("if-eq v4, v1, :skip", ":gate\nif-eq v4, v1, :skip"))),
            "two unhoisted sections" to shareStoryFixture() + fixtureClass("LX/Sr7;", listOf(fixtureMethod("LX/Sr7;->A8C()V", SECTION_BODY.replace(SECTIONS, "LX/Sr7;"), 6))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(SHARE_STORY)) }
        }
    }

    @Test fun theHoistedLoaderReadsTheStoryAnswerThroughTheSwitch() {
        found(shareStoryFixture())
        val method = hoisted()
        val before = method.code()
        val gate = before.indexOfFirst { it.opcode == Opcode.IF_EQZ }
        injectControl(SHARE_STORY, mapOf(SHARE_STORY to listOf(method)))
        val code = method.code()
        assertEquals(before.take(gate), code.take(gate))
        assertEquals(KEEP, (code[gate] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(0), (code[gate] as FiveRegisterInstruction).let { listOf(it.registerC) })
        assertEquals(Opcode.MOVE_RESULT, code[gate + 1].opcode)
        assertEquals(0, (code[gate + 1] as OneRegisterInstruction).registerA)
        // The same if-eqz still decides, so false goes straight on to the share-to-Facebook row.
        assertEquals(before.drop(gate).map { it.opcode }, code.drop(gate + 2).map { it.opcode })
        assertEquals(code.size - 1, code.branchTarget(gate + 2))
    }

    @Test fun theSectionTakesItsOwnSkipPathWhileTheSwitchIsOn() {
        found(shareStoryFixture())
        val method = section()
        val before = method.code()
        val gate = before.indexOfFirst { it.opcode == Opcode.IF_EQ }
        injectControl(SHARE_STORY, mapOf(SHARE_STORY to listOf(method)))
        val code = method.code()
        assertEquals(before.take(gate), code.take(gate))
        assertEquals(SKIP, (code[gate] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(4, 1), (code[gate] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[gate + 1].opcode)
        assertEquals(4, (code[gate + 1] as OneRegisterInstruction).registerA)
        assertEquals(listOf(4, 1), (code[gate + 2] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
        assertEquals(before.drop(gate).map { it.opcode }, code.drop(gate + 2).map { it.opcode })
    }

    @Test fun anUnprovedMethodRefusesTheSwitchBeforeAnyEdit() {
        found(shareStoryFixture())
        val cases = mapOf(
            "a method that doesn't make the row" to fixtureMethod("$SECTIONS->A00()Z", "const/4 v0, 0x1\nreturn v0", 1),
            "a flipped hoisted gate" to hoisted(HOISTED_BODY.replace("if-eqz", "if-nez")),
            "a section with no skip path write" to section(SECTION_BODY.replace("move-result v4\nreturn-void", "return-void")),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(SHARE_STORY, mapOf(SHARE_STORY to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    private fun target(classes: List<MutableClass>) = mirroredControls(classes).getValue(SHARE_STORY_TARGET).map { it.hookId() }.toSet()

    @Test fun theChatListsYourStoryShareTargetToggleIsFound() {
        assertEquals(setOf(SYNTHETIC_STORY_TARGET), target(shareTargetFixture()))
        validateControls(mirroredControls(shareTargetFixture()), setOf(SHARE_STORY_TARGET))
        assertEquals(setOf("LX/4Dk;->onActivityCreated(Landroid/os/Bundle;)V"), PROFILE_347415354.hooks.getValue(SHARE_STORY_TARGET))
        assertEquals(setOf("LX/4ED;->onActivityCreated(Landroid/os/Bundle;)V"), PROFILE_347415262.hooks.getValue(SHARE_STORY_TARGET))
        assertEquals(setOf("LX/4D6;->onActivityCreated(Landroid/os/Bundle;)V"), PROFILE_347415280.hooks.getValue(SHARE_STORY_TARGET))
    }

    // Only Messenger's own answer for Your story may change. A call we can't tie to that activity and to a toggle that
    // sets a component's state gets no hook, and the switch stays unapplied.
    @Test fun anyOtherShareTargetShapeLeavesTheSwitchUnapplied() {
        fun list(from: String, to: String) = shareTargetFixture(list = chatList(CHAT_LIST_BODY.replace(from, to).also { check(it != CHAT_LIST_BODY) }))
        val story = "const-string v0, \"$STORY_SHARE_ACTIVITY\""
        val cases = mapOf(
            "only the Chats target" to list(story, "const-string v0, \"$CHATS_ACTIVITY\""),
            "the story target named twice" to list("return-void", "$story\nreturn-void"),
            "a toggle of another class" to list("invoke-static {v2, v0, v1}, $TOGGLE\nconst-string v0, \"$CHATS_ACTIVITY\"",
                "invoke-static {v2, v0, v1}, LX/Sr9;->A0S(Landroid/content/Context;Ljava/lang/String;Z)V\nconst-string v0, \"$CHATS_ACTIVITY\""),
            "the name handed on as something else" to list("$story\ninvoke-static {v2, v0, v1}", "$story\ninvoke-static {v0, v2, v1}"),
            "the answer in the context's place" to list("$story\ninvoke-static {v2, v0, v1}", "$story\ninvoke-static {v1, v0, v1}"),
            "something else between the name and the toggle" to list("$story\n", "$story\nconst/4 v1, 0x1\n"),
            "a branch straight onto the toggle" to list("if-nez v0, :story\nconst/4 v1, 0x0\n:story\n$story\n",
                "if-nez v0, :toggle\nconst/4 v1, 0x0\n$story\n:toggle\n"),
            "another lifecycle method" to listOf(fixtureClass(CHAT_LIST, listOf(
                fixtureMethod("$CHAT_LIST->onCreate(Landroid/os/Bundle;)V", CHAT_LIST_BODY, 5), toggle()))),
            "a toggle that doesn't set a component" to shareTargetFixture(toggle = toggle(TOGGLE_BODY.replace(
                "Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V",
                "Landroid/content/pm/PackageManager;->setApplicationEnabledSetting(Ljava/lang/String;II)V").replace("{v0, v1, v2, v2}", "{v0, p1, v2, v2}"))),
            "a toggle that isn't static" to shareTargetFixture(toggle = fixtureMethod(TOGGLE, TOGGLE_BODY, 7)),
            "two chat lists" to shareTargetFixture() + fixtureClass("LX/Sr9;", listOf(
                fixtureMethod("LX/Sr9;->onActivityCreated(Landroid/os/Bundle;)V", CHAT_LIST_BODY.replace(CHAT_LIST, "LX/Sr9;"), 5),
                fixtureMethod("LX/Sr9;->A0S(Landroid/content/Context;Ljava/lang/String;Z)V", TOGGLE_BODY, 6,
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value))),
        )
        for ((case, classes) in cases) {
            assertTrue(target(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(SHARE_STORY_TARGET)) }
        }
    }

    @Test fun theChatListHandsItsYourStoryAnswerThroughTheSwitch() {
        val method = chatList()
        val before = method.code()
        val call = before.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == STORY_SHARE_ACTIVITY } + 1
        val choice = before.indexOfFirst { it.opcode == Opcode.IF_NEZ }
        injectControl(SHARE_STORY_TARGET, mapOf(SHARE_STORY_TARGET to listOf(method)))
        val code = method.code()
        assertEquals(before.take(call), code.take(call))
        assertEquals(TARGET, (code[call] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(1), (code[call] as FiveRegisterInstruction).let { listOf(it.registerC) })
        assertEquals(Opcode.MOVE_RESULT, code[call + 1].opcode)
        assertEquals(1, (code[call + 1] as OneRegisterInstruction).registerA)
        assertEquals(TOGGLE, (code[call + 2] as ReferenceInstruction).reference.toString())
        // Both of Messenger's answers reach the guard: the branch still lands on the name, right before it.
        assertEquals(call - 1, code.branchTarget(choice))
        assertEquals(before.drop(call).map { it.opcode }, code.drop(call + 2).map { it.opcode })
        // The Chats target keeps Messenger's own answer.
        assertEquals(1, code.count { (it as? ReferenceInstruction)?.reference?.toString() == TARGET })
    }

    @Test fun aMethodThatIsntTheChatListRefusesTheShareTargetHookBeforeAnyEdit() {
        val cases = mapOf(
            "the toggle itself" to toggle(),
            "a chat list naming only Chats" to chatList(CHAT_LIST_BODY.replace("\"$STORY_SHARE_ACTIVITY\"", "\"$CHATS_ACTIVITY\"")),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(SHARE_STORY_TARGET, mapOf(SHARE_STORY_TARGET to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildGatesTheSameTwoLoadersAndTheShareTarget() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val hooks = findShareStory(classes)
            assertEquals(activeProfile.hooks.getValue(SHARE_STORY), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(SHARE_STORY to hooks), setOf(SHARE_STORY))
            for (hook in hooks) {
                val method = MutableMethod(hook)
                val before = method.code()
                val gate = method.validateShareStory()
                method.injectShareStory()
                val after = method.code()
                val helper = if (gate.hoisted) KEEP else SKIP
                assertEquals(helper, (after[gate.index] as ReferenceInstruction).reference.toString(), "$code ${hook.hookId()}")
                assertEquals(before.map { it.opcode }.filter { it != Opcode.NOP },
                    (after.take(gate.index) + after.drop(gate.index + 2)).map { it.opcode }.filter { it != Opcode.NOP }, code)
            }
            // The chat list's Your story share target goes through the switch too, in its own fragment on each build.
            val targets = findShareStoryTarget(classes)
            assertEquals(activeProfile.hooks.getValue(SHARE_STORY_TARGET), targets.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(SHARE_STORY_TARGET to targets), setOf(SHARE_STORY_TARGET))
            val method = MutableMethod(targets.single())
            val before = method.code()
            val call = method.validateShareStoryTarget()
            method.injectShareStoryTarget()
            val after = method.code()
            assertEquals(TARGET, (after[call.index] as ReferenceInstruction).reference.toString(), code)
            assertEquals(call.flag, (after[call.index] as FiveRegisterInstruction).registerC, code)
            assertEquals(call.flag, (after[call.index + 1] as OneRegisterInstruction).registerA, code)
            assertEquals(before.map { it.opcode }.filter { it != Opcode.NOP },
                (after.take(call.index) + after.drop(call.index + 2)).map { it.opcode }.filter { it != Opcode.NOP }, code)
        }
    }
}

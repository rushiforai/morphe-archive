package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

/** 585's check of a server flag: a public static (Object, long) boolean on a public class. */
private const val CHECK = "LX/17P;->A1Y(Ljava/lang/Object;J)Z"
internal const val SEARCH_ICON_BUTTON = "LX/Sb1;->A0A(Landroid/view/ViewGroup;)V"
internal const val SEARCH_ICON_LIST = "LX/Sb2;->A02(Landroid/content/Context;)LX/Sb4;"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

/** The top bar builds the search icon, naming its class, after it reads the flag. */
private fun searchButton(id: String = SEARCH_ICON_BUTTON, flag: Long = SEARCH_ICON_FLAG) = fixtureMethod(id, """
    invoke-static {}, LX/1Aa;->A0A()LX/5V6;
    move-result-object v4
    const-wide v2, ${flag}L
    invoke-static {v4, v2, v3}, $CHECK
    move-result v2
    const-string v1, "$SEARCH_ICON_ANCHOR"
    return-void
""".trimIndent())

/** The chat list reads the flag twice, once for the bar above the list and once for the list's padding. */
private fun searchList(id: String = SEARCH_ICON_LIST, check: String = CHECK) = fixtureMethod(id, """
    invoke-static {}, LX/1Aa;->A0A()LX/5V6;
    move-result-object v4
    const-wide v0, ${SEARCH_ICON_FLAG}L
    invoke-static {v4, v0, v1}, $check
    move-result v0
    if-eqz v0, :padding
    const/4 v5, 0x1
    :padding
    const-wide v6, ${SEARCH_ICON_FLAG}L
    invoke-static {v4, v6, v7}, $check
    move-result v6
    const/4 v0, 0x0
    return-object v0
""".trimIndent())

/** The top bar's search icon builder and the chat list that read the flag. */
internal fun searchIconFixture(): List<MutableClass> = listOf(
    fixtureClass("LX/Sb1;", listOf(searchButton())),
    fixtureClass("LX/Sb2;", listOf(searchList())),
)

private fun checkClass(flags: Int = STATIC, classFlags: Int = AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value) =
    fixtureClass("LX/17P;", listOf(fixtureMethod(CHECK, "const/4 v0, 0x0\nreturn v0", 4, flags)), flags = classFlags)

/** The extension's stand-in as d8 builds it from Settings.searchIconFlag. */
internal fun searchIconStub(flags: Int = AccessFlags.STATIC.value, body: String = "const/4 v0, 0x0\nreturn v0", id: String = SEARCH_ICON_STUB) =
    fixtureMethod(id, body, 4, flags)

private fun Method.code() = implementation!!.instructions.toList()

/** A call's register count, then its first three registers. */
private fun Instruction.registers() = (this as FiveRegisterInstruction).let { listOf(it.registerCount, it.registerC, it.registerD, it.registerE) }

/** Checks a native reader: every check call goes to the extension with the same registers, and nothing else changes. */
internal fun assertSearchBarInjected(native: Method, label: String): Int {
    val method = MutableMethod(native)
    val before = method.code()
    val sites = method.searchIconSites()
    method.injectSearchBar()
    val after = method.code()
    assertEquals(before.size, after.size, label)
    assertEquals(before.sumOf { it.codeUnits }, after.sumOf { it.codeUnits }, label)
    for (site in sites) {
        val call = after[site.call]
        assertEquals(Opcode.INVOKE_STATIC, call.opcode, label)
        assertEquals(SEARCH_ICON_HELPER, (call as ReferenceInstruction).reference.toString(), label)
        assertEquals(before[site.call].registers(), call.registers(), label)
    }
    val swapped = sites.map { it.call }.toSet()
    assertEquals(before.filterIndexed { i, _ -> i !in swapped }, after.filterIndexed { i, _ -> i !in swapped }, label)
    return sites.size
}

class SearchBarTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(INBOX_SEARCH_BAR).map { it.hookId() }.toSet()

    private fun lookup(vararg classes: ClassDef): (String) -> ClassDef? = { type -> classes.firstOrNull { it.type == type } }

    @Test fun theBarIsFoundWhereTheTopBarsSearchIconReadsTheFlag() {
        assertEquals(setOf(SEARCH_ICON_BUTTON, SEARCH_ICON_LIST), found(searchIconFixture()))
        validateControls(mirroredControls(searchIconFixture()), setOf(INBOX_SEARCH_BAR))
    }

    @Test fun theFlagCountsOnlyWhenTheOneSearchIconBuilderReadsIt() {
        val list = listOf(fixtureClass("LX/Sb2;", listOf(searchList())))
        val cases = mapOf(
            "no search icon" to list,
            "two search icons" to list + fixtureClass("LX/Sb1;", listOf(searchButton())) +
                fixtureClass("LX/Sb5;", listOf(searchButton("LX/Sb5;->A0A(Landroid/view/ViewGroup;)V"))),
            "a search icon that doesn't read the flag" to list + fixtureClass("LX/Sb1;", listOf(searchButton(flag = 0x1L))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(INBOX_SEARCH_BAR)) }
        }
    }

    @Test fun everyReadSwapsOnlyItsCheckForTheExtension() {
        assertEquals(1, assertSearchBarInjected(searchButton(), "button"))
        assertEquals(2, assertSearchBarInjected(searchList(), "list"))
        // The answer still lands in the register Messenger reads next, and the branch over the bar still lands on the
        // padding read.
        val injected = MutableMethod(searchList()).apply { injectSearchBar() }.code()
        assertEquals(listOf(3, 4, 0, 1), injected[3].registers())
        assertEquals(Opcode.MOVE_RESULT, injected[4].opcode)
        assertEquals(7, injected.branchTarget(5))
        assertEquals(SEARCH_ICON_HELPER, (injected[8] as ReferenceInstruction).reference.toString())
    }

    @Test fun anyOtherUseOfTheFlagRefusesTheSwitchBeforeAnyEdit() {
        val flag = "const-wide v0, ${SEARCH_ICON_FLAG}L"
        val shapes = mapOf(
            "flag halves swapped" to "$flag\ninvoke-static {v4, v1, v0}, $CHECK\nmove-result v0\nreturn v0",
            "check on an object" to "$flag\ninvoke-virtual {v4, v0, v1}, LX/17P;->A1Y(J)Z\nmove-result v0\nreturn v0",
            "answer not a boolean" to "$flag\ninvoke-static {v4, v0, v1}, LX/17P;->A1Y(Ljava/lang/Object;J)I\nmove-result v0\nreturn v0",
            "answer never taken" to "$flag\ninvoke-static {v4, v0, v1}, $CHECK\nconst/4 v0, 0x0\nreturn v0",
            "flag logged" to "$flag\ninvoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;\nconst/4 v0, 0x0\nreturn v0",
            "an extra argument" to "$flag\ninvoke-static {v4, v0, v1, v5}, LX/17P;->A1Y(Ljava/lang/Object;JI)Z\nmove-result v0\nreturn v0",
            "a range call" to "const-wide v1, ${SEARCH_ICON_FLAG}L\ninvoke-static/range {v0 .. v2}, $CHECK\nmove-result v0\nreturn v0",
            "no flag at all" to "const-wide v0, 0x1L\ninvoke-static {v4, v0, v1}, $CHECK\nmove-result v0\nreturn v0",
        )
        for ((case, body) in shapes) {
            val good = searchList()
            val bad = fixtureMethod("LX/Sb3;->A00()Z", body)
            val before = good.code()
            val failure = assertFailsWith<PatchException>(case) {
                injectControl(INBOX_SEARCH_BAR, mapOf(INBOX_SEARCH_BAR to listOf(good, bad)))
            }
            assertContains(failure.message.orEmpty(), "search icon flag read", message = case)
            assertEquals(before, good.code(), case)
        }
    }

    @Test fun onlyItsOwnSwitchKeepsTheBar() {
        val method = searchList()
        injectControl(INBOX_SEARCH_BAR, mapOf(INBOX_SEARCH_BAR to listOf(method)))
        val calls = method.code().mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertEquals(2, calls.count { it == SEARCH_ICON_HELPER })
        assertTrue(calls.none { it == CHECK || it.startsWith("$SETTINGS->enabled") })
    }

    @Test fun theStubBecomesThisBuildsOwnCheckAskedTheWayMessengerAsksIt() {
        val check = searchIconCheck(listOf(searchButton(), searchList()), lookup(checkClass()))
        assertEquals(CHECK, check.toString())
        val built = searchIconReader(searchIconStub(), check)
        assertEquals(SEARCH_ICON_STUB, built.hookId())
        assertEquals(AccessFlags.STATIC.value, built.accessFlags)
        assertEquals(4, built.implementation!!.registerCount)
        val code = built.code()
        assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.RETURN), code.map { it.opcode })
        assertEquals(CHECK, (code[0] as ReferenceInstruction).reference.toString())
        // p0 to p2 are v1 to v3 in a four-register method: the config, then both halves of the flag.
        assertEquals(listOf(3, 1, 2, 3), code[0].registers())
    }

    @Test fun aChangedStubStopsThePatch() {
        val check = searchIconCheck(listOf(searchList()), lookup(checkClass()))
        val stubs = mapOf(
            "answers yes" to searchIconStub(body = "const/4 v0, 0x1\nreturn v0"),
            "does more" to searchIconStub(body = "nop\nconst/4 v0, 0x0\nreturn v0"),
            "isn't static" to searchIconStub(flags = AccessFlags.PUBLIC.value),
            "is private" to searchIconStub(flags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value),
            "takes other arguments" to searchIconStub(id = "$SETTINGS->searchIconFlag(Ljava/lang/Object;)Z"),
        )
        for ((case, stub) in stubs) {
            val failure = assertFailsWith<PatchException>(case) { searchIconReader(stub, check) }
            assertContains(failure.message.orEmpty(), "extension stub", message = case)
        }
    }

    @Test fun aCheckThatDiffersOrCantBeCalledStopsThePatch() {
        val other = searchList(check = "LX/17Q;->A1Y(Ljava/lang/Object;J)Z")
        val cases = listOf(
            "isn't the same in every read" to { searchIconCheck(listOf(searchButton(), other), lookup(checkClass())) },
            "is missing" to { searchIconCheck(listOf(searchList()), lookup()) },
            "is missing" to { searchIconCheck(listOf(searchList()), lookup(fixtureClass("LX/17P;"))) },
            "isn't public" to { searchIconCheck(listOf(searchList()), lookup(checkClass(classFlags = AccessFlags.ABSTRACT.value))) },
            "isn't public" to { searchIconCheck(listOf(searchList()), lookup(checkClass(flags = AccessFlags.PUBLIC.value))) },
            "isn't public" to { searchIconCheck(listOf(searchList()), lookup(checkClass(flags = AccessFlags.STATIC.value))) },
        )
        for ((n, case) in cases.withIndex()) {
            val failure = assertFailsWith<PatchException>("${case.first} $n") { case.second() }
            assertContains(failure.message.orEmpty(), case.first, message = "$n")
        }
    }

    @Test fun everySupportedBuildSwapsItsReadsAndKeepsTheCommunityInboxRead() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val readers = findControls(classes).getValue(INBOX_SEARCH_BAR)
            assertEquals(activeProfile.hooks.getValue(INBOX_SEARCH_BAR), readers.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(INBOX_SEARCH_BAR to readers), setOf(INBOX_SEARCH_BAR))
            val check = searchIconCheck(readers) { type -> classes.firstOrNull { it.type == type } }
            searchIconReader(searchIconStub(), check)
            val sites = readers.associate { it.hookId() to assertSearchBarInjected(it, "$code ${it.hookId()}") }
            // The chat list's builder is also where Hide joined community chats edits, by instruction index.
            val contract = assertNotNull(findCommunityInbox(classes), code)
            val render = contract.render.hookId()
            assertTrue(render in sites, code)
            val searchFirst = MutableMethod(contract.render).apply { injectSearchBar() }
            assertEquals(63, searchFirst.communityReadSite(contract.capturedScope), code)
            injectCommunityInbox(contract, searchFirst, communityStub(JOINED_COMMUNITY_ROW), communityStub(MAIN_INBOX_SCOPE))
            val communityFirst = MutableMethod(contract.render)
            injectCommunityInbox(contract, communityFirst, communityStub(JOINED_COMMUNITY_ROW), communityStub(MAIN_INBOX_SCOPE))
            assertEquals(sites.getValue(render), communityFirst.searchIconSites().size, code)
            communityFirst.injectSearchBar()
            assertEquals(searchFirst.code().map { it.opcode }, communityFirst.code().map { it.opcode }, code)
        }
    }
}

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
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
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

/** The config interface a read casts to, and its (long) check of a server flag. */
private const val CONFIG = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;"
private const val CHECK = "$CONFIG->B1R(J)Z"
internal const val SEARCH_ICON_BUTTON = "LX/Sb1;->A0A(Landroid/view/ViewGroup;)V"
internal const val SEARCH_ICON_GETTER = "LX/Sg1;->A00(Lcom/facebook/auth/usersession/FbUserSession;)Z"
private const val SEARCH_ICON_LIST = "LX/Sb2;->A02(Landroid/content/Context;)LX/Sb4;"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
private val CONFIG_FLAGS = AccessFlags.PUBLIC.value or AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value

/** The shared static getter, the one method that reads the flag, through the config's interface. */
private fun searchGetter(flag: Long = SEARCH_ICON_FLAG, body: String? = null) = fixtureMethod(SEARCH_ICON_GETTER, body ?: """
    const/4 v0, 0x0
    invoke-static {}, LX/1Aa;->A08()LX/5dt;
    move-result-object v2
    const-wide v0, ${flag}L
    check-cast v2, $CONFIG
    invoke-interface {v2, v0, v1}, $CHECK
    move-result v0
    return v0
""".trimIndent(), 3, STATIC)

/** The top bar builds the search icon, naming its class, after it asks the getter. */
private fun searchButton(id: String = SEARCH_ICON_BUTTON, getter: String = SEARCH_ICON_GETTER) = fixtureMethod(id, """
    invoke-static {v6}, $getter
    move-result v0
    const-string v1, "$SEARCH_ICON_ANCHOR"
    return-void
""".trimIndent())

/** A reader that asks the flag twice, once for a bar and once for its padding, with a branch over the bar. */
private fun searchList(check: String = CHECK) = fixtureMethod(SEARCH_ICON_LIST, """
    invoke-static {}, LX/1Aa;->A08()LX/5dt;
    move-result-object v4
    const-wide v0, ${SEARCH_ICON_FLAG}L
    check-cast v4, $CONFIG
    invoke-interface {v4, v0, v1}, $check
    move-result v0
    if-eqz v0, :padding
    const/4 v5, 0x1
    :padding
    const-wide v6, ${SEARCH_ICON_FLAG}L
    check-cast v4, $CONFIG
    invoke-interface {v4, v6, v7}, $check
    move-result v6
    const/4 v0, 0x0
    return-object v0
""".trimIndent())

/** The top bar's search icon builder and the shared getter it asks. */
internal fun searchIconFixture(getter: MutableMethod = searchGetter()): List<MutableClass> = listOf(
    fixtureClass("LX/Sb1;", listOf(searchButton())),
    fixtureClass("LX/Sg1;", listOf(getter)),
)

/** The config interface that declares the check. */
private fun searchConfig(flags: Int = CONFIG_FLAGS, check: String = CHECK) =
    fixtureClass(CONFIG, listOf(fixtureMethod(check, "const/4 v0, 0x0\nreturn v0", 4, AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value)), flags = flags)

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

    @Test fun theSharedGetterTheBuilderAsksIsFoundAndItsInterfaceCheckSwapped() {
        assertEquals(setOf(SEARCH_ICON_GETTER), found(searchIconFixture()))
        validateControls(mirroredControls(searchIconFixture()), setOf(INBOX_SEARCH_BAR))
        val getter = searchGetter()
        getter.validateSearchBar()
        val site = getter.searchIconSites().single()
        assertEquals(1, assertSearchBarInjected(getter, "getter"))
        // The cast to the interface stays in front of the swapped call.
        val injected = MutableMethod(searchGetter()).apply { injectSearchBar() }.code()
        assertEquals(Opcode.CHECK_CAST, injected[site.call - 1].opcode)
        assertEquals(SEARCH_ICON_HELPER, (injected[site.call] as ReferenceInstruction).reference.toString())
    }

    @Test fun aGetterThatDoesMoreThanReadTheFlagIsNotTrusted() {
        val padded = searchGetter(body = """
            invoke-static {}, LX/1Aa;->A08()LX/5dt;
            move-result-object v2
            const-wide v0, ${SEARCH_ICON_FLAG}L
            check-cast v2, $CONFIG
            invoke-interface {v2, v0, v1}, $CHECK
            move-result v0
            if-eqz v0, :no
            const/4 v0, 0x1
            :no
            return v0
        """.trimIndent())
        assertTrue(found(searchIconFixture(padded)).isEmpty())
    }

    @Test fun aGetterWhoseReadThePatchRefusesIsntResolvedByCompatReportEither() {
        val flag = "const-wide v0, ${SEARCH_ICON_FLAG}L"
        val cast = "check-cast v2, $CONFIG"
        val shapes = mapOf(
            "a cast to another type" to "$flag\ncheck-cast v2, LX/5dt;\ninvoke-interface {v2, v0, v1}, $CHECK",
            "the check asked on another register" to "$flag\n$cast\ninvoke-interface {v3, v0, v1}, $CHECK",
            "an answer that isn't a boolean" to "$flag\n$cast\ninvoke-interface {v2, v0, v1}, $CONFIG->B1R(J)I",
            "a check of a double" to "$flag\n$cast\ninvoke-interface {v2, v0, v1}, $CONFIG->B1R(D)Z",
        )
        fun getter(read: String) = fixtureMethod(SEARCH_ICON_GETTER, "$read\nmove-result v0\nreturn v0", 5, STATIC)
        assertEquals(setOf(SEARCH_ICON_GETTER), found(searchIconFixture(getter("$flag\n$cast\ninvoke-interface {v2, v0, v1}, $CHECK"))))
        for ((case, read) in shapes) {
            val getter = getter(read)
            // mirroredControls fails the case when CompatReport resolves the getter the patch's finder skips.
            assertTrue(found(searchIconFixture(getter)).isEmpty(), case)
        }
    }

    @Test fun theFlagCountsOnlyWhenTheOneSearchIconBuilderAsksTheGetter() {
        val getter = listOf(fixtureClass("LX/Sg1;", listOf(searchGetter())))
        // A builder that reads the flag itself, with no getter between, isn't the shape the switch was tested on.
        val inline = fixtureMethod(SEARCH_ICON_BUTTON, """
            invoke-static {}, LX/1Aa;->A08()LX/5dt;
            move-result-object v4
            const-wide v2, ${SEARCH_ICON_FLAG}L
            check-cast v4, $CONFIG
            invoke-interface {v4, v2, v3}, $CHECK
            move-result v2
            const-string v1, "$SEARCH_ICON_ANCHOR"
            return-void
        """.trimIndent())
        val cases = mapOf(
            "no search icon" to getter,
            "two search icons" to getter + fixtureClass("LX/Sb1;", listOf(searchButton())) +
                fixtureClass("LX/Sb5;", listOf(searchButton("LX/Sb5;->A0A(Landroid/view/ViewGroup;)V"))),
            "a search icon that doesn't ask the getter" to getter +
                fixtureClass("LX/Sb1;", listOf(searchButton(getter = "LX/Sg2;->A00(Lcom/facebook/auth/usersession/FbUserSession;)Z"))),
            "a getter of another flag" to searchIconFixture(searchGetter(flag = 0x1L)),
            "a builder that reads the flag itself" to listOf(fixtureClass("LX/Sb1;", listOf(inline))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(INBOX_SEARCH_BAR)) }
        }
    }

    @Test fun everyReadSwapsOnlyItsCheckForTheExtension() {
        assertEquals(1, assertSearchBarInjected(searchGetter(), "getter"))
        assertEquals(2, assertSearchBarInjected(searchList(), "list"))
        // The answer still lands in the register Messenger reads next, and the branch over the bar still lands on the
        // padding read.
        val injected = MutableMethod(searchList()).apply { injectSearchBar() }.code()
        assertEquals(listOf(3, 4, 0, 1), injected[4].registers())
        assertEquals(Opcode.MOVE_RESULT, injected[5].opcode)
        assertEquals(8, injected.branchTarget(6))
        assertEquals(SEARCH_ICON_HELPER, (injected[10] as ReferenceInstruction).reference.toString())
    }

    @Test fun anyOtherUseOfTheFlagRefusesTheSwitchBeforeAnyEdit() {
        val flag = "const-wide v0, ${SEARCH_ICON_FLAG}L"
        val cast = "check-cast v4, $CONFIG"
        val shapes = mapOf(
            "flag halves swapped" to "$flag\n$cast\ninvoke-interface {v4, v1, v0}, $CHECK\nmove-result v0\nreturn v0",
            "check on an object" to "$flag\n$cast\ninvoke-virtual {v4, v0, v1}, $CHECK\nmove-result v0\nreturn v0",
            "answer not a boolean" to "$flag\n$cast\ninvoke-interface {v4, v0, v1}, $CONFIG->B1R(J)I\nmove-result v0\nreturn v0",
            "answer never taken" to "$flag\n$cast\ninvoke-interface {v4, v0, v1}, $CHECK\nconst/4 v0, 0x0\nreturn v0",
            "flag logged" to "$flag\ninvoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;\nconst/4 v0, 0x0\nreturn v0",
            "an extra argument" to "$flag\n$cast\ninvoke-interface {v4, v0, v1, v5}, $CONFIG->B1R(JI)Z\nmove-result v0\nreturn v0",
            "a range call" to "const-wide v1, ${SEARCH_ICON_FLAG}L\ncheck-cast v0, $CONFIG\ninvoke-interface/range {v0 .. v2}, $CHECK\nmove-result v0\nreturn v0",
            "no cast" to "$flag\ninvoke-interface {v4, v0, v1}, $CHECK\nmove-result v0\nreturn v0",
            "a cast to another type" to "$flag\ncheck-cast v4, LX/5dt;\ninvoke-interface {v4, v0, v1}, $CHECK\nmove-result v0\nreturn v0",
            "the check asked on another register" to "$flag\n$cast\ninvoke-interface {v5, v0, v1}, $CHECK\nmove-result v0\nreturn v0",
            "a static check" to "$flag\ninvoke-static {v4, v0, v1}, LX/17P;->A1Y(Ljava/lang/Object;J)Z\nmove-result v0\nreturn v0",
            "no flag at all" to "const-wide v0, 0x1L\n$cast\ninvoke-interface {v4, v0, v1}, $CHECK\nmove-result v0\nreturn v0",
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
        val check = searchIconCheck(listOf(searchGetter(), searchList()), lookup(searchConfig()))
        assertEquals(CHECK, check.toString())
        val built = searchIconReader(searchIconStub(), check)
        assertEquals(SEARCH_ICON_STUB, built.hookId())
        assertEquals(AccessFlags.STATIC.value, built.accessFlags)
        assertEquals(4, built.implementation!!.registerCount)
        val code = built.code()
        // The config arrives as Object, so the stub casts it to the interface first, the way the getter does.
        assertEquals(listOf(Opcode.CHECK_CAST, Opcode.INVOKE_INTERFACE, Opcode.MOVE_RESULT, Opcode.RETURN), code.map { it.opcode })
        assertEquals(CONFIG, (code[0] as ReferenceInstruction).reference.toString())
        assertEquals(CHECK, (code[1] as ReferenceInstruction).reference.toString())
        // p0 to p2 are v1 to v3 in a four-register method: the config, then both halves of the flag.
        assertEquals(1, (code[0] as OneRegisterInstruction).registerA)
        assertEquals(listOf(3, 1, 2, 3), code[1].registers())
    }

    @Test fun aChangedStubStopsThePatch() {
        val check = searchIconCheck(listOf(searchList()), lookup(searchConfig()))
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
        val other = searchList(check = "$CONFIG->B1S(J)Z")
        val cases = listOf(
            "isn't the same in every read" to { searchIconCheck(listOf(searchGetter(), other), lookup(searchConfig())) },
            "is missing" to { searchIconCheck(listOf(searchList()), lookup()) },
            "isn't a public interface check" to { searchIconCheck(listOf(searchList()), lookup(fixtureClass(CONFIG, flags = CONFIG_FLAGS))) },
            "isn't a public interface check" to { searchIconCheck(listOf(searchList()), lookup(searchConfig(check = "$CONFIG->B1R(J)I"))) },
            "isn't a public interface check" to { searchIconCheck(listOf(searchList()), lookup(searchConfig(flags = AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value))) },
            "isn't a public interface check" to { searchIconCheck(listOf(searchList()), lookup(searchConfig(flags = AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value))) },
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
            // The chat list's builder is also where Hide joined community chats edits, by instruction index. It asks the
            // shared getter, so it carries no flag read of its own and the two edits never meet.
            val contract = assertNotNull(findCommunityInbox(classes), code)
            assertTrue(contract.render.hookId() !in sites, code)
            // 348 and 341 read the list at 60. Family B inlines the section builder's helpers, which puts the read at 76.
            assertEquals(if (contract.render.implementation!!.registerCount == 22) 76 else 60,
                MutableMethod(contract.render).communityReadSite(contract.capturedScope), code)
        }
    }
}

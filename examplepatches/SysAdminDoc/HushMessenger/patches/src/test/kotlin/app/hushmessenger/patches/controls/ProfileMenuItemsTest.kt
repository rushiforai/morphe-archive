package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.BeforeTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

/** The menu's row type, its message, popup, menu and listener, as Redex names them in 587 (354 family). */
private const val PM_ROWS = "LX/D6H;"
private const val PM_MESSAGE = "LX/5pv;"
private const val PM_POPUP = "LX/QJ5;"
private const val PM_MENU = "LX/SD5;"
private const val PM_LISTENER = "LX/CWv;"
private const val PM_CONTEXT = "Landroid/content/Context;"
private const val PM_VIEW = "Landroid/view/View;"
private const val PM_PLACE = "LX/4oJ;->A00(${PM_CONTEXT}LX/6h1;JZ)V"
private const val PM_TITLE = "$PM_ROWS->Bwt($PM_CONTEXT$PM_MESSAGE)Ljava/lang/String;"
private const val PM_TAP = "$PM_ROWS->Dtc($PM_CONTEXT$PM_VIEW$PM_MESSAGE)Z"
private const val PM_ADD = "$PM_MENU->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;"
private const val PM_STORE = "iput-object v1, v4, $PM_POPUP->A01:$PM_LISTENER"
private const val PM_AUDIO_FLAG = "const/4 v0, 0x0"
private const val PM_VIDEO_FLAG = "invoke-static {p3, p1}, LX/9pS;->A1Z(Ljava/lang/Object;Ljava/lang/Object;)Z\nmove-result v0"
private const val PM_HOOK_SIZE = 10

internal const val SYNTHETIC_PROFILE_MENU_ITEMS = "LX/ASd;->A04($PM_VIEW$MIG_SCHEME$PM_MESSAGE$IMMUTABLE_LIST)V"
internal const val SYNTHETIC_PROFILE_AUDIO_ROW = "LX/ASV;->Dtc($PM_CONTEXT$PM_VIEW$PM_MESSAGE)Z"
internal const val SYNTHETIC_PROFILE_VIDEO_ROW = "LX/ASW;->Dtc($PM_CONTEXT$PM_VIEW$PM_MESSAGE)Z"

/** The builder as 587 has it, cut down: one row asked for its title, added, the listener made and stored, the popup shown. */
private val PM_BUILDER_BODY = """
    invoke-interface {v3, v2, v5, p2}, $PM_TAP
    new-instance v4, $PM_POPUP
    invoke-direct {v4}, $PM_POPUP-><init>()V
    iget-object v1, v4, $PM_POPUP->A04:$PM_MENU
    invoke-interface {v3, v2, p2}, $PM_TITLE
    move-result-object v0
    invoke-virtual {v1, v5, v5, v5, v0}, $PM_ADD
    new-instance v1, $PM_LISTENER
    invoke-direct {v1}, $PM_LISTENER-><init>()V
    iput-object p3, v1, $PM_LISTENER->A00:$IMMUTABLE_LIST
    $PM_STORE
    invoke-virtual {v4}, $PM_POPUP->A01()V
    return-void
""".trimIndent()

/** A row's tap as 587 has it, cut down: the call's kind in a register, moved into the last argument of the call that starts it. */
private fun pmCallBody(flag: String, tile: String = "sender_tile") = """
    $flag
    move v6, v0
    const-string v1, "$tile"
    invoke-static/range {v2 .. v6}, $PM_PLACE
    const/4 v0, 0x1
    return v0
""".trimIndent()

private fun pmBuilder(body: String = PM_BUILDER_BODY, id: String = SYNTHETIC_PROFILE_MENU_ITEMS) =
    fixtureMethod(id, body, 12, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)

private fun pmRow(id: String, body: String, registers: Int = 12) = fixtureMethod(id, body, registers)
private fun pmAudio(body: String = pmCallBody(PM_AUDIO_FLAG), registers: Int = 12) = pmRow(SYNTHETIC_PROFILE_AUDIO_ROW, body, registers)
private fun pmVideo(body: String = pmCallBody(PM_VIDEO_FLAG)) = pmRow(SYNTHETIC_PROFILE_VIDEO_ROW, body)

private fun pmClasses(
    builder: MutableMethod? = pmBuilder(),
    audio: MutableMethod? = pmAudio(),
    video: MutableMethod? = pmVideo(),
    rows: String = PM_ROWS,
    extra: List<MutableClass> = emptyList(),
): List<MutableClass> = listOfNotNull(builder).map { fixtureClass(it.definingClass, listOf(it)) } +
    listOfNotNull(audio, video).map { fixtureClass(it.definingClass, listOf(it), interfaces = listOf(rows)) } +
    // The menu's View profile row: same interface, same tap, no call.
    fixtureClass("LX/5Le;", listOf(pmRow("LX/5Le;->Dtc($PM_CONTEXT$PM_VIEW$PM_MESSAGE)Z", "const/4 v0, 0x1\nreturn v0")), interfaces = listOf(rows)) + extra

/** The builder and every row, for the complete discovery fixture. */
internal fun profileMenuItemsFixture(): List<MutableClass> = pmClasses()

private fun Method.pmCode() = implementation!!.instructions.toList()
private fun Instruction.pmReference() = (this as? ReferenceInstruction)?.reference?.toString()

class ProfileMenuItemsTest {
    private val keys = setOf(PROFILE_MENU_ITEMS, PROFILE_MENU_CALL)

    @BeforeTest @AfterTest fun synthetic() { activeProfile = SYNTHETIC_PROFILE }

    @Test fun theFinderAndItsMirrorTakeTheBuilderAndBothCallRows() {
        val found = mirroredControls(profileMenuItemsFixture())
        assertEquals(listOf(SYNTHETIC_PROFILE_MENU_ITEMS), found.getValue(PROFILE_MENU_ITEMS).map { it.hookId() })
        assertEquals(listOf(SYNTHETIC_PROFILE_AUDIO_ROW, SYNTHETIC_PROFILE_VIDEO_ROW), found.getValue(PROFILE_MENU_CALL).map { it.hookId() })
        validateControls(found, keys)
        assertEquals(false, pmAudio().profileCallVideo())
        assertEquals(true, pmVideo().profileCallVideo())
    }

    /** 280 looks strings up in a table instead of loading them as literals. */
    @Test fun aTileNameFromAStringTableCounts() {
        val table = "LX/189;->A00(I)Ljava/lang/String;"
        val tabled = pmCallBody(PM_AUDIO_FLAG).replace("const-string v1, \"sender_tile\"", "const/16 v1, 0xf7\ninvoke-static {v1}, $table\nmove-result-object v1")
        val classes = pmClasses(audio = pmAudio(tabled))
        val builders = findProfileMenuItems(classes)
        assertEquals(listOf(SYNTHETIC_PROFILE_AUDIO_ROW, SYNTHETIC_PROFILE_VIDEO_ROW),
            findProfileMenuCalls(classes, builders, mapOf(table to mapOf(0xf7 to "sender_tile"))).map { it.hookId() })
        assertTrue(findProfileMenuCalls(classes, builders, emptyMap()).isEmpty(), "no table, no tile name")
    }

    @Test fun lookalikesAreNotFound() {
        val otherId = SYNTHETIC_PROFILE_MENU_ITEMS.replace("LX/ASd;", "LX/ASe;")
        val cases = mapOf(
            "no builder" to pmClasses(builder = null),
            "two builders" to pmClasses(extra = listOf(fixtureClass("LX/ASe;", listOf(pmBuilder(id = otherId))))),
            "no title asked for" to pmClasses(pmBuilder(PM_BUILDER_BODY.replace(PM_TITLE, "$PM_ROWS->Bwt($PM_MESSAGE$PM_CONTEXT)Ljava/lang/String;"))),
            "no row tapped" to pmClasses(pmBuilder(PM_BUILDER_BODY.replace("invoke-interface {v3, v2, v5, p2}, $PM_TAP\n", ""))),
            "no row added" to pmClasses(pmBuilder(PM_BUILDER_BODY.replace(PM_ADD, "$PM_MENU->addAll(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;"))),
            "no listener stored" to pmClasses(pmBuilder(PM_BUILDER_BODY.replace("$PM_STORE\n", ""))),
            "a branch onto the store" to pmClasses(pmBuilder("if-eqz p0, :store\n" + PM_BUILDER_BODY.replace(PM_STORE, ":store\n$PM_STORE"))),
            "no list" to pmClasses(pmBuilder(id = SYNTHETIC_PROFILE_MENU_ITEMS.replace(IMMUTABLE_LIST, "Ljava/util/List;"))),
            "no Mig scheme" to pmClasses(pmBuilder(id = SYNTHETIC_PROFILE_MENU_ITEMS.replace(MIG_SCHEME, "Ljava/lang/Object;"))),
            "no audio row" to pmClasses(audio = null),
            "no video row" to pmClasses(video = null),
            "two audio rows" to pmClasses(extra = listOf(fixtureClass("LX/ASX;",
                listOf(pmRow(SYNTHETIC_PROFILE_AUDIO_ROW.replace("LX/ASV;", "LX/ASX;"), pmCallBody(PM_AUDIO_FLAG))), interfaces = listOf(PM_ROWS)))),
            "rows of another menu" to pmClasses(rows = "LX/D6I;"),
            "a call from somewhere else" to pmClasses(audio = pmAudio(pmCallBody(PM_AUDIO_FLAG, "thread_header"))),
            "a kind read from a field" to pmClasses(video = pmVideo(pmCallBody("iget-boolean v0, p0, LX/ASW;->A00:Z"))),
            "too few registers to borrow" to pmClasses(audio = pmAudio(registers = 8)),
        )
        for ((case, classes) in cases) {
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), keys) }
        }
    }

    @Test fun aChangedBuilderOrRowIsRefusedAndLeftAsItWas() {
        val builder = pmBuilder(PM_BUILDER_BODY.replace("$PM_STORE\n", ""))
        val row = pmAudio(pmCallBody("iget-boolean v0, p0, LX/ASV;->A00:Z"))
        val builderBefore = builder.pmCode()
        val rowBefore = row.pmCode()
        assertFailsWith<PatchException> { builder.validateProfileMenuItems() }
        assertFailsWith<PatchException> { builder.injectProfileMenuItems() }
        assertFailsWith<PatchException> { row.validateProfileMenuCall() }
        assertFailsWith<PatchException> { row.injectProfileMenuCall() }
        assertEquals(builderBefore, builder.pmCode())
        assertEquals(rowBefore, row.pmCode())
    }

    @Test fun thePopupGoesToTheExtensionRightBeforeTheListenerIsStored() {
        val method = pmBuilder()
        val before = method.pmCode()
        val site = assertNotNull(method.profileMenuSite())
        assertEquals(4, site.popup)
        method.injectProfileMenuItems()
        assertItemsHook(before, method.pmCode(), site, "fixture")
    }

    @Test fun aRowsTapAsksFirstAndFallsThroughToItsOwnCode() {
        for ((method, video) in listOf(pmAudio() to 0, pmVideo() to 1)) {
            val before = method.pmCode()
            method.injectProfileMenuCall()
            assertCallHook(method, before, video, method.definingClass)
        }
    }

    /** Every build at once, so one run names every build whose menu moved. */
    @Test fun everySupportedBuildHooksTheBuilderAndBothCallRows() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        val wrong = mutableListOf<String>()
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            activeProfile = controlProfileFor(code)
            val builders = findProfileMenuItems(classes)
            val calls = findProfileMenuCalls(classes, builders, redexStringTables(classes))
            if (builders.map { it.hookId() }.toSet() != activeProfile.hooks.getValue(PROFILE_MENU_ITEMS) ||
                calls.map { it.hookId() }.toSet() != activeProfile.hooks.getValue(PROFILE_MENU_CALL)) {
                wrong += "$code: ${builders.map { it.hookId() }} ${calls.map { it.hookId() }}"
                continue
            }
            validateControls(mapOf(PROFILE_MENU_ITEMS to builders, PROFILE_MENU_CALL to calls), keys)
            val builder = MutableMethod(builders.single())
            val before = builder.pmCode()
            val site = builder.profileMenuSite()!!
            builder.injectProfileMenuItems()
            assertItemsHook(before, builder.pmCode(), site, "$code builder")
            calls.forEachIndexed { video, hook ->
                val row = MutableMethod(hook)
                val stock = row.pmCode()
                row.injectProfileMenuCall()
                assertCallHook(row, stock, video, "$code ${hook.hookId()}")
            }
        }
        assertTrue(wrong.isEmpty(), wrong.joinToString("\n"))
    }

    /** One range call hands the popup over where the listener is stored, and nothing stock changes. */
    private fun assertItemsHook(before: List<Instruction>, after: List<Instruction>, site: ProfileMenuSite, label: String) {
        assertEquals(before.size + 1, after.size, label)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, after[site.at].opcode, label)
        assertEquals(PROFILE_MENU_SHOWING, after[site.at].pmReference(), label)
        val call = after[site.at] as RegisterRangeInstruction
        assertEquals(listOf(site.popup, 1), listOf(call.startRegister, call.registerCount), label)
        assertEquals(Opcode.IPUT_OBJECT, after[site.at + 1].opcode, label)
        assertStockKept(before, after.take(site.at) + after.drop(site.at + 1), label)
    }

    /** The question comes first with the row's kind, a yes returns handled, and a no lands on the row's untouched first instruction. */
    private fun assertCallHook(method: MutableMethod, before: List<Instruction>, video: Int, label: String) {
        val after = method.pmCode()
        assertEquals(before.size + PM_HOOK_SIZE, after.size, label)
        assertEquals(video, (after[4] as NarrowLiteralInstruction).narrowLiteral, label)
        assertEquals(PROFILE_MENU_ASK, after[5].pmReference(), label)
        assertEquals(Opcode.IF_EQZ, after[7].opcode, label)
        assertEquals(Opcode.RETURN, after[9].opcode, label)
        assertTrue(PM_HOOK_SIZE in method.jumpTargets(), "$label: a no goes on to the row's own code")
        assertStockKept(before, after.drop(PM_HOOK_SIZE), label)
    }
}

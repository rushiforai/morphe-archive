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
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.BeforeTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue

private const val PUBLIC = 0x1
private const val STATIC = 0x8
private const val CHAT = "LX/1oH;"
private const val SESSION_HOLDER = "LX/NSb;"
private const val LOCATOR = "LX/1DJ;->A01($SESSION_HOLDER" + "I)LX/19I;"
private const val UNWRAP = "LX/19I;->A0F(LX/19I;)Ljava/lang/Object;"
private const val LOADER = "LX/Gjm;"
private const val LOAD = "$LOADER->A01(${PINNED_LOAD_OPTIONS}Ljava/lang/String;IJZZ)$MAILBOX_FUTURE"
private const val OPTIONS_MAKER = "LX/Fv9;->A0Y()$PINNED_LOAD_OPTIONS"
private const val RESULT = "LX/GvZ;"
private const val ROWS_TYPE = "LX/5Ml;"
private const val ROWS = "$RESULT->A00:$ROWS_TYPE"
private const val ROW = "LX/78w;"
private const val FUTURE_BASE = "LX/390;"
private const val LISTEN = "$FUTURE_BASE->FnP($MAILBOX_CALLBACK)V"
private const val MANAGER = "LX/0YG;"
private const val CHILD_MANAGER = "$ANDROIDX_FRAGMENT->getChildFragmentManager()$MANAGER"
private const val SET_RESULT = "$MANAGER->A1T(Ljava/lang/String;Landroid/os/Bundle;)V"
private const val LISTENER = "LX/5e8;"
private const val ENCRYPTED = "$THREAD_KEY_TYPE->A1G()Z"
private const val KEY_ID = "$THREAD_KEY_TYPE->A01:J"
private const val KEY_LONG = "$THREAD_KEY_TYPE->A03:J"
private const val LOCATOR_ID = 0x18826
private const val OPTIONS = "new-instance v6, $PINNED_LOAD_OPTIONS\n    invoke-direct {v6}, $PINNED_LOAD_OPTIONS-><init>()V"

private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()
private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.text() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

/** The extension's stub as it ships: static, answering nothing, minus one or null. */
internal fun pinnedBarStub(id: String, flags: Int = STATIC, body: String? = null): MutableMethod {
    val returns = id.substringAfter(')')
    val words = Regex("\\[*(?:L[^;]+;|[ZBSCIFJD])").findAll(id.substringAfter('(').substringBefore(')')).count()
    val shipped = body ?: when (returns) {
        "V" -> "return-void"
        "I" -> "const/4 v0, -0x1\nreturn v0"
        else -> "const/4 v0, 0x0\nreturn-object v0"
    }
    return fixtureMethod(id, shipped, words + 1 + if (flags and STATIC == 0) 1 else 0, flags)
}

private fun abstractMethod(id: String): Method {
    val owner = id.substringBefore("->")
    val parameters = Regex("\\[*(?:L[^;]+;|[ZBSCIJFD])").findAll(id.substringAfter('(').substringBefore(')'))
        .map { ImmutableMethodParameter(it.value, null, null) }.toList()
    return ImmutableMethod(owner, id.substringAfter("->").substringBefore('('), parameters, id.substringAfter(')'),
        AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value, null, null, null)
}

private fun field(owner: String, name: String, type: String, flags: Int = PUBLIC) = ImmutableField(owner, name, type, flags, null, null, null)

private const val INTERFACE = PUBLIC or 0x200 or 0x400

/** The chat's view setup: the jump listener goes on its child fragment manager under event_publisher_key. */
private fun handover(key: String = PINNED_RESULT_KEY) = fixtureMethod("$CHAT->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V", """
    invoke-virtual {p0}, $CHILD_MANAGER
    move-result-object v0
    new-instance v1, $LISTENER
    invoke-direct {v1}, $LISTENER-><init>()V
    const-string v2, "$key"
    invoke-virtual {v0, v1, p0, v2}, $MANAGER->A1P(LX/0MS;Landroidx/lifecycle/LifecycleOwner;Ljava/lang/String;)V
    return-void
""".trimIndent(), 6)

private fun sheetView(second: String = KEY_LONG) = fixtureMethod(PINNED_SHEET_VIEW, """
    iget-object v0, p0, $PINNED_SHEET->A00:$THREAD_KEY_TYPE
    invoke-virtual {v0}, $ENCRYPTED
    move-result v1
    if-eqz v1, :done
    iget-wide v2, v0, $KEY_ID
    iget-wide v4, v0, $second
    :done
    return-void
""".trimIndent(), 9)

/** The count helper. 503's calls the options maker, 497's fills its own options in place ([OPTIONS]). */
private fun countHelper(rows: String = ROWS, options: String = "invoke-static {}, $OPTIONS_MAKER\n    move-result-object v6") =
    fixtureMethod("$PINNED_COUNT_HELPER->A00($SESSION_HOLDER$RESULT)V", """
    const v0, $LOCATOR_ID
    invoke-static {p0, v0}, $LOCATOR
    move-result-object v0
    $options
    invoke-static {v0}, $UNWRAP
    move-result-object v5
    check-cast v5, $LOADER
    const-string v7, "1"
    const/4 v8, 0x0
    const-wide/16 v9, 0x0
    const/4 v11, 0x0
    const/4 v12, 0x0
    invoke-virtual/range {v5 .. v12}, $LOAD
    move-result-object v0
    iget-object v1, p1, $rows
    return-void
""".trimIndent(), 15, PUBLIC or STATIC)

/** Every piece the recipe reads, as 588 has it. A class passed in takes the place of the one of its type. */
private fun pinnedFixture(vararg changed: MutableClass): List<MutableClass> {
    val stock = listOf(
        fixtureClass(CHAT, listOf(handover()), superclass = "LX/38y;", flags = PUBLIC or 0x10, extraFields = listOf(
            field(CHAT, "fbUserSession", FB_USER_SESSION), field(CHAT, "threadKey", THREAD_KEY_TYPE))),
        fixtureClass("LX/38y;", superclass = ANDROIDX_FRAGMENT),
        fixtureClass(ANDROIDX_FRAGMENT, listOf(fixtureMethod(CHILD_MANAGER, "const/4 v0, 0x0\nreturn-object v0", 2, PUBLIC or 0x10))),
        fixtureClass(MANAGER, listOf(fixtureMethod(SET_RESULT, """
            iget-object v0, p0, $MANAGER->A0X:Ljava/util/Map;
            invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            sget-object v1, Landroidx/lifecycle/Lifecycle${'$'}State;->STARTED:Landroidx/lifecycle/Lifecycle${'$'}State;
            return-void
        """.trimIndent(), 5, PUBLIC or 0x10))),
        fixtureClass(LISTENER, listOf(fixtureMethod("$LISTENER->Eg0(Ljava/lang/String;Landroid/os/Bundle;)V", """
            const-string v0, "event_name"
            const-string v0, "JUMP_TO_MESSAGE_KEY"
            const-string v0, "MESSAGE_ID"
            return-void
        """.trimIndent(), 4))),
        fixtureClass(PINNED_SHEET, listOf(sheetView())),
        fixtureClass(PINNED_COUNT_HELPER, listOf(countHelper())),
        fixtureClass(THREAD_KEY_TYPE, extraFields = listOf(field(THREAD_KEY_TYPE, "A01", "J", PUBLIC or 0x10),
            field(THREAD_KEY_TYPE, "A03", "J", PUBLIC or 0x10)), methods = listOf(fixtureMethod(ENCRYPTED, "const/4 v0, 0x1\nreturn v0", 2))),
        fixtureClass(SESSION_HOLDER, flags = INTERFACE),
        fixtureClass("LX/1DJ;", listOf(fixtureMethod(LOCATOR, "const/4 v0, 0x0\nreturn-object v0", 3, PUBLIC or STATIC))),
        fixtureClass("LX/19I;", listOf(fixtureMethod(UNWRAP, "const/4 v0, 0x0\nreturn-object v0", 2, PUBLIC or STATIC))),
        fixtureClass(LOADER, listOf(fixtureMethod(LOAD, "const/4 v0, 0x0\nreturn-object v0", 9))),
        fixtureClass("LX/Fv9;", listOf(fixtureMethod(OPTIONS_MAKER, """
            new-instance v0, $PINNED_LOAD_OPTIONS
            invoke-direct {v0}, $PINNED_LOAD_OPTIONS-><init>()V
            return-object v0
        """.trimIndent(), 1, PUBLIC or STATIC))),
        fixtureClass(PINNED_LOAD_OPTIONS),
        fixtureClass(MAILBOX_FUTURE, superclass = FUTURE_BASE),
        fixtureClass(FUTURE_BASE, listOf(fixtureMethod(LISTEN, "return-void", 2)), flags = PUBLIC or 0x400),
        fixtureClass(MAILBOX_CALLBACK, listOf(abstractMethod("$MAILBOX_CALLBACK->onCompletion(Ljava/lang/Object;)V")), flags = INTERFACE),
        fixtureClass(RESULT, extraFields = listOf(field(RESULT, "A00", ROWS_TYPE))),
        fixtureClass(ROWS_TYPE, interfaces = listOf(ROW)),
        fixtureClass(ROW, listOf("getCount()I", "DFQ(I)Ljava/lang/String;", "BxA(I)Ljava/lang/String;", "Cr2(I)J")
            .map { abstractMethod("$ROW->$it") }, flags = INTERFACE),
    )
    val swapped = changed.associateBy { it.type }
    return stock.map { swapped[it.type] ?: it } + changed.filter { extra -> stock.none { it.type == extra.type } }
}

private fun resolve(classes: List<ClassDef>): PinnedBarRecipe? =
    resolvePinnedBar(classes, classes.single { it.type == CHAT }.methods.single { it.name == "onViewCreated" })

/** #213: the pinned message bar is Hush's own, fed from the list See all opens, and it rides the jump menu's handover. */
class PinnedBarTest {
    private val savedGetters = listOf(messageRowInterface, messageIdGetterName, messageTextGetterName, messageTimestampGetterName)

    @BeforeTest fun getters() {
        messageRowInterface = ROW
        messageIdGetterName = "DFQ"
        messageTextGetterName = "BxA"
        messageTimestampGetterName = "Cr2"
    }

    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
        pinnedBarRecipe = null
        messageRowInterface = savedGetters[0]
        messageIdGetterName = savedGetters[1]
        messageTextGetterName = savedGetters[2]
        messageTimestampGetterName = savedGetters[3]
    }

    @Test fun everyBuildHandsTheBarTheSameMethodAsTheJumpMenu() {
        for ((code, profile) in controlProfiles) {
            assertEquals(profile.hooks.getValue(CHAT_JUMP), profile.hooks.getValue(PINNED_BAR), message = code.toString())
        }
        assertEquals(SYNTHETIC_PROFILE.hooks.getValue(CHAT_JUMP), SYNTHETIC_PROFILE.hooks.getValue(PINNED_BAR))
    }

    @Test fun theExtensionGetsTheFragmentAndItsViewFirst() {
        val method = fixtureMethod(SYNTHETIC_CHAT_JUMP, "return-void", registers = 5)
        method.injectPinnedBar()
        val code = method.code()
        assertEquals(2, code.size)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, code[0].opcode)
        assertEquals(PINNED_BAR_CALL, code[0].ref())
        assertEquals(listOf(2, 2), (code[0] as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
    }

    @Test fun aMethodThatIsntTheChatsViewHandoverRefusesTheSwitchBeforeAnyEdit() {
        val bad = fixtureMethod("LX/1hl;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V", "return-void",
            registers = 5, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        val before = bad.code()
        assertFailsWith<PatchException> { bad.injectPinnedBar() }
        assertEquals(before, bad.code())
    }

    @Test fun theRecipeComesFromSeeAllsLoadAndTheChatsJumpListener() {
        val recipe = assertNotNull(resolve(pinnedFixture()))
        assertEquals(CHAT, recipe.chat)
        assertEquals("$CHAT->fbUserSession:$FB_USER_SESSION", recipe.session)
        assertEquals("$CHAT->threadKey:$THREAD_KEY_TYPE", recipe.threadKey)
        assertEquals(listOf(ENCRYPTED, KEY_ID, KEY_LONG), listOf(recipe.encrypted, recipe.keyId, recipe.keyLong))
        assertEquals(listOf(LOCATOR, UNWRAP, OPTIONS_MAKER, LOAD), listOf(recipe.locator, recipe.unwrap, recipe.options, recipe.load))
        assertEquals(LOCATOR_ID, recipe.locatorId)
        assertEquals(SESSION_HOLDER, recipe.sessionType)
        assertEquals(LOADER, recipe.loader)
        assertEquals(LISTEN, recipe.listen)
        assertEquals(listOf(RESULT, ROWS, ROW), listOf(recipe.result, recipe.rows, recipe.row))
        assertEquals(listOf(CHILD_MANAGER, SET_RESULT), listOf(recipe.childManager, recipe.setResult))
    }

    @Test fun aHelperThatFillsItsOwnOptionsTakesTheBuildsOneMaker() {
        val recipe = assertNotNull(resolve(pinnedFixture(fixtureClass(PINNED_COUNT_HELPER, listOf(countHelper(options = OPTIONS))))))
        assertEquals(OPTIONS_MAKER, recipe.options)
    }

    @Test fun aChangedPieceLeavesNoRecipe() {
        val secondMaker = fixtureClass("LX/Fw0;", listOf(fixtureMethod("LX/Fw0;->A00()$PINNED_LOAD_OPTIONS",
            "new-instance v0, $PINNED_LOAD_OPTIONS\ninvoke-direct {v0}, $PINNED_LOAD_OPTIONS-><init>()V\nreturn-object v0", 1, PUBLIC or STATIC)))
        val cases = mapOf(
            "the listener doesn't jump" to pinnedFixture(fixtureClass(LISTENER, listOf(fixtureMethod("$LISTENER->Eg0(Ljava/lang/String;Landroid/os/Bundle;)V",
                "const-string v0, \"event_name\"\nconst-string v0, \"MESSAGE_ID\"\nreturn-void", 4)))),
            "another result key" to pinnedFixture(fixtureClass(CHAT, listOf(handover("other_key")), superclass = "LX/38y;", extraFields = listOf(
                field(CHAT, "fbUserSession", FB_USER_SESSION), field(CHAT, "threadKey", THREAD_KEY_TYPE)))),
            "the sheet reads one id twice" to pinnedFixture(fixtureClass(PINNED_SHEET, listOf(sheetView(second = KEY_ID)))),
            "the counted field isn't the message rows" to pinnedFixture(fixtureClass(PINNED_COUNT_HELPER, listOf(countHelper("$RESULT->A01:LX/Other;"))),
                fixtureClass("LX/Other;")),
            "two callbacks on the future" to pinnedFixture(fixtureClass(FUTURE_BASE, listOf(fixtureMethod(LISTEN, "return-void", 2),
                fixtureMethod("$FUTURE_BASE->Fnq($MAILBOX_CALLBACK)V", "return-void", 2)), flags = PUBLIC or 0x400)),
            "the callback lost onCompletion" to pinnedFixture(fixtureClass(MAILBOX_CALLBACK, flags = INTERFACE)),
            "a private session field" to pinnedFixture(fixtureClass(CHAT, listOf(handover()), superclass = "LX/38y;", extraFields = listOf(
                field(CHAT, "fbUserSession", FB_USER_SESSION, 0x2), field(CHAT, "threadKey", THREAD_KEY_TYPE)))),
            "a package-private loader" to pinnedFixture(fixtureClass(LOADER, listOf(fixtureMethod(LOAD, "const/4 v0, 0x0\nreturn-object v0", 9)), flags = 0)),
            "the chat isn't a fragment" to pinnedFixture(fixtureClass("LX/38y;")),
            "the rows lost the time getter" to pinnedFixture(fixtureClass(ROW, listOf("getCount()I", "DFQ(I)Ljava/lang/String;", "BxA(I)Ljava/lang/String;")
                .map { abstractMethod("$ROW->$it") }, flags = INTERFACE)),
            "the helper fills its own options and two makers could stand in" to pinnedFixture(
                fixtureClass(PINNED_COUNT_HELPER, listOf(countHelper(options = OPTIONS))), secondMaker),
            "the helper's maker makes nothing" to pinnedFixture(fixtureClass("LX/Fv9;", listOf(fixtureMethod(OPTIONS_MAKER,
                "const/4 v0, 0x0\nreturn-object v0", 1, PUBLIC or STATIC)))),
        )
        for ((case, classes) in cases) assertNull(resolve(classes), case)
        assertNotNull(resolve(pinnedFixture(secondMaker)), "a second maker the helper doesn't call changes nothing")
        assertNull(resolvePinnedBar(pinnedFixture(), null), "no handover")
    }

    @Test fun findControlsLeavesTheRecipeForTheBuild() {
        pinnedBarRecipe = assertNotNull(resolve(pinnedFixture()))
        findControls(pinnedFixture())
        // The synthetic profile's handover isn't in this fixture, so the last build's recipe goes and none takes its place.
        assertNull(pinnedBarRecipe)
    }

    @Test fun theLoadAsksForSeeAllsRowsOfAnEncryptedChatAndAddsTheCallback() {
        val recipe = assertNotNull(resolve(pinnedFixture()))
        val (_, built) = pinnedBarBuilders(recipe) { pinnedBarStub(it) }[0]
        val code = built.code()
        assertEquals(13, built.implementation!!.registerCount)
        assertEquals(CHAT, code[0].ref())
        assertEquals(listOf(recipe.session, recipe.threadKey, ENCRYPTED), code.filter { it.ref() in setOf(recipe.session, recipe.threadKey, ENCRYPTED) }.map { it.ref() })
        val load = code.single { it.ref() == LOAD }
        assertEquals(Opcode.INVOKE_VIRTUAL_RANGE, load.opcode)
        assertEquals(listOf(3, 8), (load as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
        val consts = code.filterIsInstance<NarrowLiteralInstruction>().associate { (it as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA to it.narrowLiteral }
        // 1000 rows, then true and false, as See all asks for them.
        assertEquals(PINNED_LIST_ROWS, consts[6])
        assertEquals(1, consts[9])
        assertEquals(0, consts[10])
        assertTrue(code.any { it.ref() == "Ljava/lang/String;->valueOf(J)Ljava/lang/String;" })
        assertEquals(listOf(KEY_ID, KEY_LONG), code.mapNotNull { it.ref()?.takeIf { r -> r == KEY_ID || r == KEY_LONG } })
        val listen = code.single { it.ref() == LISTEN }
        assertEquals(listOf(0, 12), (listen as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
    }

    @Test fun theJumpSendsWhatMessengersOwnPinnedBarSends() {
        val recipe = assertNotNull(resolve(pinnedFixture()))
        val (_, built) = pinnedBarBuilders(recipe) { pinnedBarStub(it) }[3]
        val code = built.code()
        assertEquals(listOf("event_name", PINNED_JUMP_EVENT, "MESSAGE_ID", PINNED_RESULT_KEY), code.mapNotNull { it.text() })
        assertEquals(CHILD_MANAGER, code[1].ref())
        assertEquals(SET_RESULT, code.dropLast(1).last().ref())
    }

    @Test fun theRowsAreReadWithTheMessageGetters() {
        val recipe = assertNotNull(resolve(pinnedFixture()))
        val built = pinnedBarBuilders(recipe) { pinnedBarStub(it) }
        assertEquals(listOf("$ROW->getCount()I"), built[1].second.code().mapNotNull { it.ref()?.takeIf { r -> r.startsWith("$ROW->") } })
        assertEquals(listOf("$ROW->DFQ(I)Ljava/lang/String;", "$ROW->BxA(I)Ljava/lang/String;", "$ROW->Cr2(I)J"),
            built[2].second.code().mapNotNull { it.ref()?.takeIf { r -> r.startsWith("$ROW->") } })
    }

    @Test fun aChangedStubStopsThePatchBeforeAnyEdit() {
        val recipe = assertNotNull(resolve(pinnedFixture()))
        val cases = mapOf(
            "missing" to { _: String -> null },
            "not static" to { id: String -> pinnedBarStub(id, PUBLIC) },
            "private" to { id: String -> pinnedBarStub(id, STATIC or 0x2) },
            "a body" to { id: String -> if (id == PINNED_BAR_COUNT) pinnedBarStub(id, body = "const/4 v0, 0x1\nreturn v0") else pinnedBarStub(id) },
        )
        for ((case, stubs) in cases) assertFailsWith<PatchException>(case) { pinnedBarBuilders(recipe, stubs) }
    }

    @Test fun everySupportedBuildFeedsTheBarFromSeeAllsList() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        reset()
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val found = findControls(classes)
            assertEquals(activeProfile.hooks.getValue(PINNED_BAR), found.getValue(PINNED_BAR).map { it.hookId() }.toSet(), code)
            validateControls(found, setOf(PINNED_BAR))
            val recipe = assertNotNull(pinnedBarRecipe, code)
            // From the sheet's view setup and the count helper of each family (laneA dumps of 503 and 497).
            assertEquals(listOf("$THREAD_KEY_TYPE->${if (activeProfile === PROFILE_347617497) "A1F" else "A1G"}()Z", KEY_ID, KEY_LONG),
                listOf(recipe.encrypted, recipe.keyId, recipe.keyLong), code)
            if (activeProfile === PROFILE_347617497) {
                assertEquals("LX/1og;", recipe.chat, code)
                assertEquals("LX/Gl1;", recipe.loader, code)
                // 497's helper fills its own options, so the build's one maker, FtN.A0a, stands in.
                assertEquals(listOf("LX/1Di;->A01(LX/N3G;I)LX/19h;", "LX/19h;->A0F(LX/19h;)Ljava/lang/Object;", "LX/FtN;->A0a()$PINNED_LOAD_OPTIONS",
                    "LX/Gwr;->A00:LX/5Q2;"), listOf(recipe.locator, recipe.unwrap, recipe.options, recipe.rows), code)
                assertEquals(0x1c3d1, recipe.locatorId, code)
            } else {
                assertEquals(CHAT, recipe.chat, code)
                assertEquals(listOf(LOCATOR, UNWRAP, OPTIONS_MAKER, LOAD, LISTEN, ROWS, ROW), listOf(recipe.locator, recipe.unwrap, recipe.options,
                    recipe.load, recipe.listen, recipe.rows, recipe.row), code)
                assertEquals(LOCATOR_ID, recipe.locatorId, code)
                assertEquals(listOf(CHILD_MANAGER, SET_RESULT), listOf(recipe.childManager, recipe.setResult), code)
            }
            assertEquals(FB_USER_SESSION, recipe.session.substringAfter(':'), code)
            pinnedBarBuilders(recipe) { pinnedBarStub(it) }
            val method = MutableMethod(found.getValue(PINNED_BAR).single())
            val before = method.code()
            method.injectPinnedBar()
            val after = method.code()
            assertEquals(PINNED_BAR_CALL, after[0].ref(), code)
            assertEquals(before.map { it.opcode }, after.drop(1).map { it.opcode }, code)
        }
    }
}

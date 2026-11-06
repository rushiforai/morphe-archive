package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val ROWS = "LX/PwX;"

/** The synthetic label for the blocked list's row builder, named after the first build it was found in. */
internal const val SYNTHETIC_BLOCKED_ROWS = "$ROWS->call()Ljava/lang/Object;"

private const val ROW = "LX/91d;"
private const val PICTURE = "LX/KNi;"

/** The row's picture type in each stock build, the same one-method interface under each build's own name. */
private val NATIVE_PICTURES = mapOf(PROFILE_347215341 to "LX/KUL;", PROFILE_347215348 to PICTURE)
private const val TILE = "LX/91c;"
private const val LOOKUP = "LX/NNP;->A0j(LX/1xr;Ljava/lang/String;)$USER_MODEL"
private const val TILE_PARAMS = "LX/1xl;->A0f($USER_MODEL)LX/VuA;"
private const val PICTURE_FROM_PERSON = "invoke-virtual {v0, v8}, $TILE_PARAMS"

/**
 * The builder's row for one blocked person, cut down from 586: the person is looked up by id, an unknown person's row
 * stores no picture, and a known person's picture is built from their tile and carried back to the same store.
 */
private val ROWS_BODY = """
    const-string v1, "$BLOCK_PEOPLE_PRESENTER"
    const-string v1, "$BLOCKED_ID_UNREADABLE"
    new-instance v6, $ROW
    iget-object v3, p0, $ROWS->A00:Ljava/lang/String;
    iget-object v0, p0, $ROWS->A01:LX/1xr;
    invoke-static {v0, v3}, $LOOKUP
    move-result-object v8
    if-nez v8, :known
    const/4 v0, 0x0
    :store
    iput-object v0, v6, $ROW->A03:$PICTURE
    return-object v6
    :known
    new-instance v3, $TILE
    iget-object v0, p0, $ROWS->A02:LX/1xl;
    $PICTURE_FROM_PERSON
    move-result-object v0
    invoke-virtual {v3, v0}, $TILE->A03(LX/VuA;)V
    invoke-virtual {v3}, $TILE->A00()LX/8xZ;
    move-result-object v0
    goto :store
""".trimIndent()

private fun rows(body: String = ROWS_BODY, id: String = SYNTHETIC_BLOCKED_ROWS) = fixtureMethod(id, body, registers = 10, flags = 0x11)

internal fun blockedListPicturesFixture(builder: MutableMethod = rows(), others: List<MutableMethod> = emptyList()): List<MutableClass> =
    listOf(fixtureClass(ROWS, listOf(builder) + others))

private fun Method.code() = implementation!!.instructions.toList()

class BlockedListPicturesTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(BLOCKED_LIST_PICTURES).map { it.hookId() }

    @Test fun findsTheRowBuilder() {
        assertEquals(listOf(SYNTHETIC_BLOCKED_ROWS), found(blockedListPicturesFixture()))
        validateControls(mirroredControls(blockedListPicturesFixture()), setOf(BLOCKED_LIST_PICTURES))
        assertEquals(setOf("$ROWS->call()Ljava/lang/Object;"), BASE_PROFILE.hooks.getValue(BLOCKED_LIST_PICTURES))
    }

    // On a list shaped any other way, a null could land on someone it shouldn't or skip the row's own empty case, so
    // the switch gets no hook at all.
    @Test fun aBuilderOfAnotherShapeIsNotTaken() {
        fun changed(vararg edits: Pair<String, String>) = blockedListPicturesFixture(rows(
            edits.fold(ROWS_BODY) { body, (from, to) -> body.replace(from, to).also { check(it != body) { from } } }))
        val cases = mapOf(
            "only the presenter's tag" to changed(BLOCKED_ID_UNREADABLE to "can't parse"),
            "two builders logging both" to blockedListPicturesFixture(others = listOf(rows(id = "$ROWS->A00()Ljava/lang/Object;"))),
            "an unknown person's row keeps a picture" to changed("const/4 v0, 0x0" to "const/4 v0, 0x1"),
            "a known person's row stores its own picture" to changed("goto :store" to "iput-object v0, v6, $ROW->A03:$PICTURE\nreturn-object v6"),
            // Above the lookup, so the store still reads as the unknown person's and only the second way in refuses it.
            "a second way into the store" to changed("iget-object v0, p0, $ROWS->A01:LX/1xr;\n" to
                "if-eqz v3, :store\niget-object v0, p0, $ROWS->A01:LX/1xr;\n"),
            "something jumps to the goto" to changed("new-instance v6, $ROW\n" to "new-instance v6, $ROW\nif-eqz v3, :back\n",
                "goto :store" to ":back\ngoto :store"),
            "the known path branches" to changed("new-instance v3, $TILE\n" to "new-instance v3, $TILE\nif-eqz v3, :tile\n:tile\n"),
            "the person is replaced before the picture call" to changed(PICTURE_FROM_PERSON to "const/4 v8, 0x0\n$PICTURE_FROM_PERSON"),
            "the person is the call's receiver" to changed(PICTURE_FROM_PERSON to "invoke-virtual {v8, v0}, $TILE_PARAMS"),
            "the picture comes from another register" to changed("move-result-object v0\ngoto" to "move-result-object v2\ngoto"),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(BLOCKED_LIST_PICTURES)) }
        }
    }

    @Test fun theSwitchSwapsAKnownPersonsPictureBeforeItGoesBack() {
        val method = rows()
        val before = method.code()
        val back = before.indexOfFirst { it.opcode == Opcode.GOTO }
        val store = before.indexOfFirst { it.opcode == Opcode.IPUT_OBJECT }
        injectControl(BLOCKED_LIST_PICTURES, mapOf(BLOCKED_LIST_PICTURES to listOf(method)))
        val code = method.code()
        // Everything up to the known person's picture runs as Messenger wrote it, the unknown person's null store included.
        assertEquals(before.take(back), code.take(back))
        val call = code[back] as RegisterRangeInstruction
        assertEquals("$SETTINGS->blockedListPicture(Ljava/lang/Object;)Ljava/lang/Object;", (call as ReferenceInstruction).reference.toString())
        assertEquals(0 to 1, call.startRegister to call.registerCount)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[back + 1].opcode)
        assertEquals(0, (code[back + 1] as OneRegisterInstruction).registerA)
        // The store's field type, so the verifier still sees a picture going into the row.
        assertEquals(Opcode.CHECK_CAST, code[back + 2].opcode)
        assertEquals(PICTURE, (code[back + 2] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.GOTO, code[back + 3].opcode)
        assertEquals(store, code.branchTarget(back + 3))
        assertEquals(before.drop(back).map { it.opcode }, code.drop(back + 3).map { it.opcode })
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val bad = rows(ROWS_BODY.replace("goto :store", "iput-object v0, v6, $ROW->A03:$PICTURE\nreturn-object v6"))
        val badBefore = bad.code()
        assertFailsWith<PatchException> { injectControl(BLOCKED_LIST_PICTURES, mapOf(BLOCKED_LIST_PICTURES to listOf(bad))) }
        assertEquals(badBefore, bad.code())
    }

    @Test fun everySupportedBuildSwapsTheSamePicture() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val hooks = findBlockedListPictures(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(BLOCKED_LIST_PICTURES), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(BLOCKED_LIST_PICTURES to hooks), setOf(BLOCKED_LIST_PICTURES))
            val method = MutableMethod(hooks.single())
            val before = method.code()
            val site = method.blockedPicture()!!
            assertEquals(NATIVE_PICTURES.getValue(activeProfile), site.type, code)
            method.injectBlockedListPictures()
            val after = method.code()
            assertEquals("$SETTINGS->blockedListPicture(Ljava/lang/Object;)Ljava/lang/Object;",
                (after[site.index] as ReferenceInstruction).reference.toString(), code)
            assertEquals(Opcode.CHECK_CAST, after[site.index + 2].opcode, code)
            assertEquals(before.map { it.opcode }.filter { it != Opcode.NOP },
                (after.take(site.index) + after.drop(site.index + 3)).map { it.opcode }.filter { it != Opcode.NOP }, code)
        }
    }
}

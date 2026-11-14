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
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.BeforeTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/** The video player, the view it plays in and the config built for it, as Redex names them in the synthetic builds. */
private const val PLAYER = "LX/0CV;"
private const val VIDEO_VIEW = "LX/0CX;"
private const val CONFIG = "LX/0CW;"
internal const val SYNTHETIC_CHAT_HEAD_VIDEO = "$PLAYER-><init>(Landroid/content/Context;$VIDEO_VIEW$CONFIG)V"
private const val FLAG = "$CONFIG->A03:Z"
private const val COPY = "move-object v3, p3"
private const val READ = "iget-boolean v1, v3, $FLAG"
private const val TEST = "if-eqz v1, :surface"
private const val SETTINGS_READ = "sget-object v0, $PLAYER_SETTINGS->A01:$PLAYER_SETTINGS"

/** The constructor as 587 has it, cut down: eight registers, so p1 to p3 are v5 to v7, and the config copied to v3. */
private val PLAYER_BODY = """
    $COPY
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    $SETTINGS_READ
    iput-object p1, p0, $PLAYER->A00:Landroid/content/Context;
    iget-object v2, v3, $CONFIG->A01:Ljava/lang/Float;
    $READ
    $TEST
    const/4 v0, 0x1
    goto :done
    :surface
    const/4 v0, 0x0
    :done
    return-void
""".trimIndent()

private fun player(body: String = PLAYER_BODY, id: String = SYNTHETIC_CHAT_HEAD_VIDEO, registers: Int = 8) =
    fixtureMethod(id, body, registers)

private fun configField(name: String = "A03", flags: Int = AccessFlags.PUBLIC.value) =
    ImmutableField(CONFIG, name, "Z", flags, null, null, null)

private fun classes(
    method: MutableMethod = player(),
    fieldFlags: Int? = AccessFlags.PUBLIC.value,
    extra: List<MutableClass> = emptyList(),
): List<MutableClass> = listOf(fixtureClass(PLAYER, listOf(method))) + extra +
    listOfNotNull(fieldFlags?.let { fixtureClass(CONFIG, extraFields = listOf(configField(flags = it), configField("A04"))) })

/** The player and its config, for the complete discovery fixture. */
internal fun chatHeadVideoFixture(): List<MutableClass> = classes()

private fun Method.code() = implementation!!.instructions.toList()
private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()

class ChatHeadVideoTest {
    @BeforeTest @AfterTest fun synthetic() { activeProfile = SYNTHETIC_PROFILE }

    @Test fun findsThePlayersConstructor() {
        assertEquals(listOf(SYNTHETIC_CHAT_HEAD_VIDEO), findChatHeadVideo(chatHeadVideoFixture()).map { it.hookId() })
        assertEquals(listOf(SYNTHETIC_CHAT_HEAD_VIDEO), mirroredControls(chatHeadVideoFixture()).getValue(CHAT_HEAD_VIDEO).map { it.hookId() })
        validateControls(mirroredControls(chatHeadVideoFixture()), setOf(CHAT_HEAD_VIDEO))
        assertEquals(setOf(SYNTHETIC_CHAT_HEAD_VIDEO), SYNTHETIC_PROFILE.hooks.getValue(CHAT_HEAD_VIDEO))
        assertEquals(FLAG, player().chatHeadVideoFlag().toString())
        assertEquals(FLAG, player(PLAYER_BODY.replace("$COPY\n", "").replace(READ, "iget-boolean v1, p3, $FLAG"))
            .chatHeadVideoFlag().toString(), "the config read straight from the parameter")
    }

    @Test fun lookalikesAreNotFound() {
        val otherPlayer = "LX/0CY;"
        val cases = mapOf(
            "no player settings" to classes(player(PLAYER_BODY.replace("$SETTINGS_READ\n", ""))),
            "settings of another type" to classes(player(PLAYER_BODY.replace(SETTINGS_READ, "sget-object v0, $PLAYER_SETTINGS->A02:Ljava/lang/Object;"))),
            "the settings' name as text" to classes(player(PLAYER_BODY.replace(SETTINGS_READ, "const-string v0, \"$PLAYER_SETTINGS\""))),
            "two players" to classes(extra = listOf(fixtureClass(otherPlayer, listOf(
                player(PLAYER_BODY.replace("$PLAYER->", "$otherPlayer->"), SYNTHETIC_CHAT_HEAD_VIDEO.replace(PLAYER, otherPlayer)))))),
            "a second boolean from the config" to classes(player(PLAYER_BODY.replace(READ, "iget-boolean v2, v3, $CONFIG->A04:Z\n$READ"))),
            "no boolean from the config" to classes(player(PLAYER_BODY.replace("$READ\n$TEST\n", ""))),
            "a read nothing tests" to classes(player(PLAYER_BODY.replace(TEST, "if-nez v1, :surface"))),
            "a test of another register" to classes(player(PLAYER_BODY.replace(TEST, "if-eqz v0, :surface"))),
            "the config parameter written over" to classes(player(PLAYER_BODY.replace(COPY, "move-object p3, p2\n$COPY"))),
            "the copy written twice" to classes(player(PLAYER_BODY.replace(READ, "move-object v3, p2\n$READ"))),
            "a copy of something else" to classes(player(PLAYER_BODY.replace(COPY, "move-object v3, p2"))),
            "no room for the hook" to classes(player(registers = 6, body = """
                move-object v1, p3
                invoke-direct {p0}, Ljava/lang/Object;-><init>()V
                $SETTINGS_READ
                iget-boolean v0, v1, $FLAG
                if-eqz v0, :done
                :done
                return-void
            """.trimIndent())),
            "a constructor without a context" to classes(player(id = SYNTHETIC_CHAT_HEAD_VIDEO.replace("Landroid/content/Context;", "Ljava/lang/Object;"))),
            "a method that isn't the constructor" to classes(player(id = SYNTHETIC_CHAT_HEAD_VIDEO.replace("<init>", "A00"))),
            "no config class" to classes(fieldFlags = null),
            "a final flag" to classes(fieldFlags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value),
            "a static flag" to classes(fieldFlags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
            "a private flag" to classes(fieldFlags = AccessFlags.PRIVATE.value),
        )
        for ((case, classes) in cases) {
            assertTrue(findChatHeadVideo(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(CHAT_HEAD_VIDEO)) }
        }
    }

    @Test fun aChangedConstructorIsRefusedAndLeftAsItWas() {
        val method = player(PLAYER_BODY.replace(TEST, "if-nez v1, :surface"))
        val before = method.code()
        assertFailsWith<PatchException> { method.validateChatHeadVideo() }
        assertFailsWith<PatchException> { method.injectChatHeadVideo() }
        assertEquals(before, method.code())
    }

    @Test fun theConfigsFlagGoesThroughTheExtensionBeforeAnythingReadsIt() {
        val method = player()
        val before = method.code()
        method.injectChatHeadVideo()
        assertHook(before, method.code(), context = 5, config = 7, label = "synthetic")
    }

    @Test fun everySupportedBuildHooksThePlayersConstructor() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val hooks = findChatHeadVideo(classes)
            activeProfile = controlProfileFor(code)
            assertEquals(activeProfile.hooks.getValue(CHAT_HEAD_VIDEO), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(CHAT_HEAD_VIDEO to hooks), setOf(CHAT_HEAD_VIDEO))
            val method = MutableMethod(hooks.single())
            val before = method.code()
            val registers = method.implementation!!.registerCount
            method.injectChatHeadVideo()
            assertHook(before, method.code(), context = registers - 3, config = registers - 1, label = code)
        }
    }

    /** Six instructions at the entry hand p1 and the config's flag to the extension and store its answer, then stock code. */
    private fun assertHook(before: List<Instruction>, after: List<Instruction>, context: Int, config: Int, label: String) {
        assertEquals(
            listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_BOOLEAN, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IPUT_BOOLEAN),
            after.take(6).map { it.opcode }, label)
        assertEquals(context, (after[0] as TwoRegisterInstruction).registerB, label)
        assertEquals(config, (after[1] as TwoRegisterInstruction).registerB, label)
        val flag = after[2].reference()
        assertTrue(flag!!.endsWith(":Z"), label)
        assertEquals(flag, after[5].reference(), label)
        assertEquals(1, (after[2] as TwoRegisterInstruction).registerB, label)
        assertEquals(CHAT_HEAD_VIDEO_CALL, after[3].reference(), label)
        val call = after[3] as FiveRegisterInstruction
        assertEquals(listOf(2, 0, 2), listOf(call.registerCount, call.registerC, call.registerD), label)
        assertEquals(2, (after[4] as OneRegisterInstruction).registerA, label)
        assertEquals(listOf(2, 1), (after[5] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) }, label)
        assertStockKept(before, after.drop(6), label)
    }
}

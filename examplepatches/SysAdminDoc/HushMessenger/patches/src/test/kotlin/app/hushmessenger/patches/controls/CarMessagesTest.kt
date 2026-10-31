package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
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

private const val CAR_EXTENDER = "LX/0Qq;"
private const val BUILDER = "LX/0M6;"
internal const val SYNTHETIC_CAR_EXTEND = "$CAR_EXTENDER->AhZ($BUILDER)V"

/**
 * The extender's extend as 585 ships it, cut to the car bundle: the chat goes in under car_conversation when there is
 * one, then the bundle goes into the builder's extras under android.car.EXTENSIONS. Five registers, p0 is v3.
 */
private val EXTEND_BODY = """
    new-instance v2, Landroid/os/Bundle;
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V
    iget-object v0, p0, $CAR_EXTENDER->A02:LX/0Qr;
    if-eqz v0, :no_chat
    invoke-static {v0}, $CAR_EXTENDER->A00(LX/0Qr;)Landroid/os/Bundle;
    move-result-object v1
    const-string v0, "$CAR_CONVERSATION"
    invoke-virtual {v2, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V
    :no_chat
    iget-object v1, p1, $BUILDER->A0E:Landroid/os/Bundle;
    if-nez v1, :has_extras
    new-instance v1, Landroid/os/Bundle;
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V
    iput-object v1, p1, $BUILDER->A0E:Landroid/os/Bundle;
    :has_extras
    const-string v0, "$CAR_EXTENSIONS"
    invoke-virtual {v1, v0, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V
    return-void
""".trimIndent()

private fun extend(body: String = EXTEND_BODY, flags: Int = AccessFlags.PUBLIC.value, id: String = SYNTHETIC_CAR_EXTEND): MutableMethod =
    fixtureMethod(id, body, registers = 5, flags = flags)

/** The bundle maker beside it writes the chat's read and reply intents, and never stores the car bundle itself. */
private fun conversationBundle() = fixtureMethod("$CAR_EXTENDER->A00(LX/0Qr;)Landroid/os/Bundle;", """
    new-instance v0, Landroid/os/Bundle;
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V
    const-string v1, "on_read"
    return-object v0
""".trimIndent(), registers = 3, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)

internal fun carMessagesFixture(extendMethod: MutableMethod = extend()): List<MutableClass> =
    listOf(fixtureClass(CAR_EXTENDER, listOf(extendMethod, conversationBundle())))

private fun Method.code() = implementation!!.instructions.toList()

class CarMessagesTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(CAR_MESSAGES).map { it.hookId() }

    @Test fun theExtendIsTheOneMethodThatWritesTheChatAndStoresTheCarBundle() {
        assertEquals(listOf(SYNTHETIC_CAR_EXTEND), found(carMessagesFixture()))
        validateControls(mirroredControls(carMessagesFixture()), setOf(CAR_MESSAGES))
        assertEquals(setOf(SYNTHETIC_CAR_EXTEND), SYNTHETIC_PROFILE.hooks.getValue(CAR_MESSAGES))
        assertEquals(setOf("LX/0Qq;->AhZ(LX/0M6;)V"), BASE_PROFILE.hooks.getValue(CAR_MESSAGES))
    }

    @Test fun lookalikesAreNotTheExtender() {
        val cases = mapOf(
            "static" to carMessagesFixture(extend(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)),
            "no chat key" to carMessagesFixture(extend(EXTEND_BODY.replace("\"$CAR_CONVERSATION\"", "\"car_other\""))),
            "the bundle stored under another key" to carMessagesFixture(extend(EXTEND_BODY.replace("\"$CAR_EXTENSIONS\"", "\"android.wearable.EXTENSIONS\""))),
            "the key loaded into another register" to carMessagesFixture(extend(EXTEND_BODY.replace(
                "const-string v0, \"$CAR_EXTENSIONS\"", "const-string v0, \"$CAR_EXTENSIONS\"\nmove-object v0, v1"))),
            "work after the store" to carMessagesFixture(extend(EXTEND_BODY.replace("return-void", "const/4 v2, 0x0\nreturn-void"))),
            "a jump to the return" to carMessagesFixture(extend(EXTEND_BODY.replace("if-nez v1, :has_extras", "if-nez v1, :has_extras\nif-eqz v2, :done")
                .replace("return-void", ":done\nreturn-void"))),
            "two writers" to carMessagesFixture() + listOf(fixtureClass("LX/Other;", listOf(extend(id = "LX/Other;->AhZ($BUILDER)V")))),
            "no extender" to listOf(fixtureClass("LX/Unrelated;")),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(CAR_MESSAGES)) }
        }
    }

    @Test fun theCarBundleGoesToTheExtensionRightBeforeTheReturn() {
        val method = extend()
        val before = method.code()
        injectControl(CAR_MESSAGES, mapOf(CAR_MESSAGES to listOf(method)))
        val code = method.code()
        assertEquals(before.size + 1, code.size)
        assertEquals(before.dropLast(1), code.dropLast(2))
        val call = code[code.size - 2]
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals(CAR_MESSAGES_CALL, (call as ReferenceInstruction).reference.toString())
        assertEquals(2, (call as RegisterRangeInstruction).startRegister)
        assertEquals(1, call.registerCount)
        assertEquals(Opcode.RETURN_VOID, code.last().opcode)
    }

    @Test fun anUnusableExtendRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "work after the store" to extend(EXTEND_BODY.replace("return-void", "const/4 v2, 0x0\nreturn-void")),
            "no chat key" to extend(EXTEND_BODY.replace("\"$CAR_CONVERSATION\"", "\"car_other\"")),
            "the bundle maker" to conversationBundle(),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(CAR_MESSAGES, mapOf(CAR_MESSAGES to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildHandsItsCarBundleOverFromOneExtend() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val extenders = findCarMessages(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(CAR_MESSAGES), extenders.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(CAR_MESSAGES to extenders), setOf(CAR_MESSAGES))
            val method = MutableMethod(extenders.single())
            val before = method.code()
            method.injectCarMessages()
            val after = method.code()
            assertEquals(before.dropLast(1).map { it.opcode }, after.dropLast(2).map { it.opcode }, code)
            assertEquals(CAR_MESSAGES_CALL, (after[after.size - 2] as ReferenceInstruction).reference.toString(), code)
            assertEquals(Opcode.RETURN_VOID, after.last().opcode, code)
        }
    }
}

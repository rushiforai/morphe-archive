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

/** The message handler's opener: the screen, the link, the link it was rewritten from, then the chat it came from. */
internal const val SYNTHETIC_CHAT_LINK =
    "LX/8Wg;->A0F(Landroid/content/Context;Landroid/net/Uri;Landroid/net/Uri;$FB_USER_SESSION$MESSAGE${THREAD_KEY_TYPE}LX/59J;)V"
/** The browser launcher's own entry, for the screens that ask it directly. */
internal const val SYNTHETIC_BROWSER_LAUNCH =
    "$MESSENGER_BROWSER_LAUNCHER->A0I(Landroid/content/Context;Landroid/net/Uri;${FB_USER_SESSION}LX/59J;LX/4sl;)V"
/** The launcher's static second entry, the one that takes a launcher of its own along with the screen and the link. */
internal const val SYNTHETIC_BROWSER_SELF =
    "$MESSENGER_BROWSER_LAUNCHER->A0B(Landroid/content/Context;Landroid/net/Uri;$FB_USER_SESSION$MESSENGER_BROWSER_LAUNCHER" +
        "LX/4sl;)V"

/** An opener's body cut to what the gate cares about: it reads its own arguments and returns nothing. */
private val OPEN_BODY = """
    invoke-virtual {p0, p1, p2}, LX/8Wg;->A00(Landroid/content/Context;Landroid/net/Uri;)V
    return-void
""".trimIndent()

private val STATIC_OPENER = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

private fun opener(id: String, body: String = OPEN_BODY, registers: Int = 10,
    flags: Int = AccessFlags.PUBLIC.value) = fixtureMethod(id, body, registers, flags)

/** The static entry's body, which reads the same two arguments one register down. */
private val SELF_BODY = """
    invoke-virtual {p3, p0, p1}, LX/8Wg;->A00(Landroid/content/Context;Landroid/net/Uri;)V
    return-void
""".trimIndent()

/** The launcher's own second entry is static on every tested build, so its screen and link start a register lower. */
private fun selfOpener(id: String = SYNTHETIC_BROWSER_SELF, body: String = SELF_BODY, registers: Int = 10) =
    fixtureMethod(id, body, registers, STATIC_OPENER)

/**
 * The three openers beside a method of the same class that shares part of their shape and never gets a hook. [elsewhere]
 * goes into the message handler's class, which is where a launcher-shaped method has to be refused for its class alone.
 */
internal fun linkPlayerFixture(
    chat: MutableMethod = opener(SYNTHETIC_CHAT_LINK),
    launch: MutableMethod = opener(SYNTHETIC_BROWSER_LAUNCH),
    self: MutableMethod = selfOpener(),
    elsewhere: List<MutableMethod> = emptyList(),
    // The external-browser check lives on the launcher too, and the discovery union brings its own copy of it.
    browserCheck: Boolean = true,
): List<MutableClass> = listOf(
    fixtureClass("LX/8Wg;", listOf(chat,
        fixtureMethod("LX/8Wg;->A0E(Landroid/content/Context;Landroid/net/Uri;Landroid/net/Uri;$FB_USER_SESSION$MESSAGE$THREAD_KEY_TYPE)V",
            OPEN_BODY, 10)) + elsewhere),
    fixtureClass(MESSENGER_BROWSER_LAUNCHER, listOf(launch, self) + if (!browserCheck) emptyList() else listOf(
        fixtureMethod("$MESSENGER_BROWSER_LAUNCHER->A0K(Landroid/net/Uri;$FB_USER_SESSION)Z",
            "const/4 v0, 0x0\nreturn v0", 4))),
)

private fun Method.code() = implementation!!.instructions.toList()
private fun Instruction.ref() = (this as ReferenceInstruction).reference.toString()

class LinkPlayerTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(LINK_PLAYER).map { it.hookId() }.toSet()

    @Test fun bothOpenersAreFoundByTheirShape() {
        assertEquals(setOf(SYNTHETIC_CHAT_LINK, SYNTHETIC_BROWSER_LAUNCH, SYNTHETIC_BROWSER_SELF), found(linkPlayerFixture()))
        validateControls(mirroredControls(linkPlayerFixture()), setOf(LINK_PLAYER))
    }

    @Test fun everyProfileHooksAllThree() {
        assertEquals(3, BASE_PROFILE.hooks.getValue(LINK_PLAYER).size)
        assertEquals(setOf(SYNTHETIC_CHAT_LINK, SYNTHETIC_BROWSER_LAUNCH, SYNTHETIC_BROWSER_SELF),
            SYNTHETIC_PROFILE.hooks.getValue(LINK_PLAYER))
        for ((code, profile) in controlProfiles) {
            assertEquals(3, profile.hooks.getValue(LINK_PLAYER).size, code.toString())
        }
    }

    @Test fun lookalikesAreNotAnOpener() {
        val cases = mapOf(
            "the chat opener answering yes or no" to linkPlayerFixture(chat = opener(
                SYNTHETIC_CHAT_LINK.dropLast(1) + "Z", body = "const/4 v0, 0x0\nreturn v0")),
            "the chat opener without the chat it came from" to linkPlayerFixture(chat = opener(
                "LX/8Wg;->A0F(Landroid/content/Context;Landroid/net/Uri;Landroid/net/Uri;$FB_USER_SESSION$MESSAGE${THREAD_KEY_TYPE}I)V")),
            "the launcher's entry taking a number" to linkPlayerFixture(launch = opener(
                "$MESSENGER_BROWSER_LAUNCHER->A0I(Landroid/content/Context;Landroid/net/Uri;${FB_USER_SESSION}LX/59J;I)V")),
            "the launcher's static entry without a session" to linkPlayerFixture(self = selfOpener(
                "$MESSENGER_BROWSER_LAUNCHER->A0B(Landroid/content/Context;Landroid/net/Uri;$MESSENGER_BROWSER_LAUNCHER" +
                    "LX/59J;LX/4sl;)V")),
        )
        for ((case, classes) in cases) {
            val hooks = found(classes)
            assertEquals(2, hooks.size, "$case: $hooks")
        }
        // Both launcher entries' shapes on the message handler's class, where neither belongs.
        val strays = linkPlayerFixture(elsewhere = listOf(
            opener("LX/8Wg;->A0I(Landroid/content/Context;Landroid/net/Uri;${FB_USER_SESSION}LX/59J;LX/4sl;)V"),
            selfOpener("LX/8Wg;->A0B(Landroid/content/Context;Landroid/net/Uri;$FB_USER_SESSION${MESSENGER_BROWSER_LAUNCHER}LX/4sl;)V")))
        assertEquals(setOf(SYNTHETIC_CHAT_LINK, SYNTHETIC_BROWSER_LAUNCH, SYNTHETIC_BROWSER_SELF), found(strays))
    }

    @Test fun theLinkPassesTheExtensionAndNothingElseMoves() {
        // The screen and the link sit one register lower in the static opener, and the gate has to read them there.
        val cases = mapOf(SYNTHETIC_CHAT_LINK to opener(SYNTHETIC_CHAT_LINK),
            SYNTHETIC_BROWSER_LAUNCH to opener(SYNTHETIC_BROWSER_LAUNCH), SYNTHETIC_BROWSER_SELF to selfOpener())
        for ((id, method) in cases) {
            val words = method.parameterTypes.size + if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
            val screen = method.implementation!!.registerCount - words + if (id == SYNTHETIC_BROWSER_SELF) 0 else 1
            val before = method.code()
            injectControl(LINK_PLAYER, mapOf(LINK_PLAYER to listOf(method)))
            val code = method.code()
            assertEquals(LINK_PLAYER_HELPER, code[0].ref(), id)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, code[0].opcode, id)
            assertEquals(screen, (code[0] as RegisterRangeInstruction).startRegister, id)
            assertEquals(2, (code[0] as RegisterRangeInstruction).registerCount, id)
            assertEquals(Opcode.MOVE_RESULT, code[1].opcode, id)
            assertEquals(0, (code[1] as OneRegisterInstruction).registerA, id)
            assertEquals(Opcode.IF_EQZ, code[2].opcode, id)
            assertEquals(Opcode.RETURN_VOID, code[3].opcode, id)
            // Messenger's own opener is still there, whole, and runs when the extension says no.
            assertEquals(before, code.drop(4), id)
        }
    }

    @Test fun anOpenerWithNoRoomForTheAnswerRefusesBeforeAnyEdit() {
        // Ten words of arguments in ten registers leaves nothing local to write the extension's answer into.
        val method = opener(SYNTHETIC_CHAT_LINK, registers = 8)
        val before = method.code()
        val refused = assertFailsWith<PatchException> {
            injectControl(LINK_PLAYER, mapOf(LINK_PLAYER to listOf(method)))
        }
        assertTrue(refused.message!!.contains("no local register"), refused.message!!)
        assertEquals(before, method.code())
    }

    @Test fun anOpenerThatJumpsBackToItsFirstInstructionRefuses() {
        val method = opener(SYNTHETIC_BROWSER_LAUNCH, body = """
            :top
            invoke-virtual {p0, p1, p2}, LX/8Wg;->A00(Landroid/content/Context;Landroid/net/Uri;)V
            goto :top
        """.trimIndent())
        val before = method.code()
        val refused = assertFailsWith<PatchException> {
            injectControl(LINK_PLAYER, mapOf(LINK_PLAYER to listOf(method)))
        }
        assertTrue(refused.message!!.contains("starts on a jump target"), refused.message!!)
        assertEquals(before, method.code())
    }

    @Test fun everySupportedBuildSendsItsLinksPastTheExtension() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val openers = findLinkPlayer(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(LINK_PLAYER), openers.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(LINK_PLAYER to openers), setOf(LINK_PLAYER))
            for (opener in openers) {
                val method = MutableMethod(opener)
                val before = method.code()
                injectControl(LINK_PLAYER, mapOf(LINK_PLAYER to listOf(method)))
                val after = method.code()
                assertEquals(LINK_PLAYER_HELPER, after[0].ref(), "$code ${opener.hookId()}")
                assertEquals(Opcode.IF_EQZ, after[2].opcode, "$code ${opener.hookId()}")
                assertEquals(before.map { it.opcode }, after.drop(4).map { it.opcode }, "$code ${opener.hookId()}")
            }
        }
    }
}

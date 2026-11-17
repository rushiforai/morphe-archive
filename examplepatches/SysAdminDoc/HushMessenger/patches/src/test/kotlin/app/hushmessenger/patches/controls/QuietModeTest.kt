package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
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
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val NOTIFY_HOST = "LX/75x;"
private const val COMPAT_MANAGER = "LX/05m;"
internal const val SYNTHETIC_NOTIFY_POSTER = "$NOTIFY_HOST->A01(Landroid/app/Notification;Lcom/facebook/auth/usersession/FbUserSession;" +
    "Lcom/facebook/messaging/notify/type/MessagingNotification;Ljava/lang/String;I)Z"
/** The wrapper above the poster: the same arguments, and it only hands them on. */
private const val SYNTHETIC_NOTIFY_WRAPPER = "$NOTIFY_HOST->A07(Landroid/app/Notification;Lcom/facebook/auth/usersession/FbUserSession;" +
    "Lcom/facebook/messaging/notify/type/MessagingNotification;Ljava/lang/String;I)Z"
/** NotificationManagerCompat's notify, the call that hands Android the notification the poster was given. */
private const val COMPAT_NOTIFY_CALL = "$COMPAT_MANAGER->A01(Ljava/lang/String;ILandroid/app/Notification;)V"

/**
 * The poster as 587 writes it, cut down to the group it rebuilds the notification into and the compat notify it ends
 * at. Its own rebuild proves a channel set ahead of it survives to the post.
 */
private val POSTER_BODY = """
    const/4 v0, 0x1
    invoke-static {p1, p2}, $NOTIFY_HOST->A00(Landroid/app/Notification;Lcom/facebook/auth/usersession/FbUserSession;)Landroid/app/Notification${'$'}Builder;
    move-result-object v1
    invoke-virtual {v1}, Landroid/app/Notification${'$'}Builder;->build()Landroid/app/Notification;
    move-result-object p1
    invoke-virtual {p0, p4, p5, p1}, $COMPAT_NOTIFY_CALL
    return v0
""".trimIndent()

private fun poster(body: String = POSTER_BODY, id: String = SYNTHETIC_NOTIFY_POSTER, registers: Int = 8,
    flags: Int = AccessFlags.PUBLIC.value) = fixtureMethod(id, body, registers, flags)

/** A01's wrapper: the arguments straight through, and nothing of its own, so the compat notify is never in it. */
private fun wrapper(id: String = SYNTHETIC_NOTIFY_WRAPPER) = fixtureMethod(id, """
    invoke-virtual/range {p0 .. p5}, $SYNTHETIC_NOTIFY_POSTER
    move-result v0
    return v0
""".trimIndent(), registers = 7)

/** A poster that branches back to its own start would hand the extension's own notification back to the extension. */
private fun loopingPoster() = poster(":top\n$POSTER_BODY".replace("return v0", "if-eqz p5, :top\nreturn v0"))

/** The notification host as a supported build has it: the poster, its wrapper, and the builder helper beside them. */
internal fun quietModeFixture(posters: List<MutableMethod> = listOf(poster())): List<MutableClass> =
    listOf(fixtureClass(NOTIFY_HOST, posters + wrapper() + fixtureMethod(
        "$NOTIFY_HOST->A00(Landroid/app/Notification;Lcom/facebook/auth/usersession/FbUserSession;)Landroid/app/Notification\$Builder;",
        "const/4 v0, 0x0\nreturn-object v0", registers = 4, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)))

private fun Method.code() = implementation!!.instructions.toList()

class QuietModeTest {
    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(QUIET_MODE).map { it.hookId() }

    @Test fun thePosterIsFoundByItsArgumentsAndTheCompatNotifyItReaches() {
        assertEquals(listOf(SYNTHETIC_NOTIFY_POSTER), found(quietModeFixture()))
        validateControls(mirroredControls(quietModeFixture()), setOf(QUIET_MODE))
        // A static poster is the same method with no account of its own to load.
        val static = quietModeFixture(listOf(poster(POSTER_BODY.replace("invoke-virtual {p0, p4, p5, p1}", "invoke-virtual {v2, p3, p4, p0}")
            .replace("{p1, p2}", "{p0, p1}").replace("move-result-object p1", "move-result-object p0"),
            flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)))
        assertEquals(listOf(SYNTHETIC_NOTIFY_POSTER), found(static))
        validateControls(mirroredControls(static), setOf(QUIET_MODE))
    }

    @Test fun eachProfileHooksItsOwnPoster() {
        fun poster(host: String) = setOf("$host->A01(Landroid/app/Notification;Lcom/facebook/auth/usersession/FbUserSession;" +
            "Lcom/facebook/messaging/notify/type/MessagingNotification;Ljava/lang/String;I)Z")
        assertEquals(setOf(SYNTHETIC_NOTIFY_POSTER), SYNTHETIC_PROFILE.hooks.getValue(QUIET_MODE))
        // The three families name the notification host differently, so each profile records its own.
        assertEquals(poster("LX/75x;"), BASE_PROFILE.hooks.getValue(QUIET_MODE))
        assertEquals(poster("LX/76j;"), controlProfileFor("347415280").hooks.getValue(QUIET_MODE))
        assertEquals(poster("LX/77J;"), controlProfileFor("347415348").hooks.getValue(QUIET_MODE))
        assertEquals(poster("LX/75x;"), controlProfileFor("347415302").hooks.getValue(QUIET_MODE))
    }

    // A break has to quiet Messenger's messages and nothing else, so anything but the one messaging notification poster
    // gets no hook at all: the wrapper above it, a poster that posts some other way, and every changed argument list.
    @Test fun anyOtherMethodLeavesTheControlUnapplied() {
        val notify = "invoke-virtual {p0, p4, p5, p1}, $COMPAT_NOTIFY_CALL"
        fun changed(from: String, to: String) =
            quietModeFixture(listOf(poster(POSTER_BODY.replace(from, to).also { check(it != POSTER_BODY) })))
        val cases = mapOf(
            "no compat notify" to changed("$notify\n", ""),
            "a notify that answers" to changed(notify, "invoke-virtual {p0, p4, p5, p1}, $COMPAT_MANAGER->A01(Ljava/lang/String;ILandroid/app/Notification;)Z"),
            "a notify without the id" to changed(notify, "invoke-virtual {p0, p4, p1}, $COMPAT_MANAGER->A01(Ljava/lang/String;Landroid/app/Notification;)V"),
            "a notify that takes the notification first" to changed(notify,
                "invoke-virtual {p0, p1, p4, p5}, $COMPAT_MANAGER->A01(Landroid/app/Notification;Ljava/lang/String;I)V"),
            "the wrapper alone" to listOf(fixtureClass(NOTIFY_HOST, listOf(wrapper()))),
            "no answer" to quietModeFixture(listOf(poster(POSTER_BODY.replace("const/4 v0, 0x1\n", "").replace("return v0", "return-void"),
                id = SYNTHETIC_NOTIFY_POSTER.replace(")Z", ")V")))),
            "no account" to quietModeFixture(listOf(poster(POSTER_BODY.replace("{p1, p2}", "{p1, p1}"),
                id = SYNTHETIC_NOTIFY_POSTER.replace("Lcom/facebook/auth/usersession/FbUserSession;", "")))),
            "no tag" to quietModeFixture(listOf(poster(POSTER_BODY.replace("p4, p5, p1", "p3, p4, p1"),
                id = SYNTHETIC_NOTIFY_POSTER.replace("Ljava/lang/String;I)Z", "I)Z")))),
            "the account first" to quietModeFixture(listOf(poster(POSTER_BODY.replace("{p1, p2}", "{p2, p1}"),
                id = SYNTHETIC_NOTIFY_POSTER.replace("Landroid/app/Notification;Lcom/facebook/auth/usersession/FbUserSession;",
                    "Lcom/facebook/auth/usersession/FbUserSession;Landroid/app/Notification;")))),
            "two posters" to quietModeFixture(listOf(poster(), poster(id = SYNTHETIC_NOTIFY_POSTER.replace("->A01(", "->A02(")))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(QUIET_MODE)) }
        }
    }

    @Test fun thePosterHandsItsNotificationToTheExtensionFirst() {
        val method = poster()
        val before = method.code()
        injectControl(QUIET_MODE, mapOf(QUIET_MODE to listOf(method)))
        val code = method.code()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, code[0].opcode)
        assertEquals(QUIET_MODE_CALL, (code[0] as ReferenceInstruction).reference.toString())
        // p1, the notification itself, and no local register needed.
        assertEquals(listOf(3, 1), (code[0] as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[1].opcode)
        assertEquals(3, (code[1] as OneRegisterInstruction).registerA)
        // What the poster does with the notification runs as Messenger wrote it, on what came back.
        assertEquals(before, code.drop(2))
    }

    @Test fun aStaticPosterTakesTheNotificationFromItsFirstRegister() {
        val method = poster(POSTER_BODY.replace("invoke-virtual {p0, p4, p5, p1}, $COMPAT_NOTIFY_CALL",
            "invoke-virtual {v2, p3, p4, p0}, $COMPAT_NOTIFY_CALL").replace("{p1, p2}", "{p0, p1}")
            .replace("move-result-object p1", "move-result-object p0"), flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        injectControl(QUIET_MODE, mapOf(QUIET_MODE to listOf(method)))
        val code = method.code()
        assertEquals(QUIET_MODE_CALL, (code[0] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(3, 1), (code[0] as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
        assertEquals(3, (code[1] as OneRegisterInstruction).registerA)
    }

    @Test fun aPosterThatBranchesBackToItsStartRefusesTheSwitchBeforeAnyEdit() {
        val looping = loopingPoster()
        val before = looping.code()
        assertFailsWith<PatchException> { injectControl(QUIET_MODE, mapOf(QUIET_MODE to listOf(looping))) }
        assertEquals(before, looping.code())
        // It still looks like the poster, so discovery and the hook list take it and only the proof refuses it.
        val classes = quietModeFixture(listOf(loopingPoster()))
        assertEquals(listOf(SYNTHETIC_NOTIFY_POSTER), findQuietModeNotify(classes).map { it.hookId() })
        assertFailsWith<PatchException> { loopingPoster().validateHook(QUIET_MODE) }
    }

    @Test fun aPosterThatIsAlreadyHookedIsLeftAsItIs() {
        val method = poster()
        injectControl(QUIET_MODE, mapOf(QUIET_MODE to listOf(method)))
        val once = method.code()
        injectControl(QUIET_MODE, mapOf(QUIET_MODE to listOf(method)))
        assertEquals(once, method.code())
    }

    @Test fun everySupportedBuildQuietsTheSamePoster() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val posters = findQuietModeNotify(classes)
            assertEquals(activeProfile.hooks.getValue(QUIET_MODE), posters.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(QUIET_MODE to posters), setOf(QUIET_MODE))

            val poster = MutableMethod(posters.single())
            val before = poster.code()
            poster.injectQuietModeNotify()
            val after = poster.code()
            assertEquals(QUIET_MODE_CALL, (after[0] as ReferenceInstruction).reference.toString(), code)
            assertEquals(Opcode.MOVE_RESULT_OBJECT, after[1].opcode, code)
            assertEquals(before.map { it.opcode }.filter { it != Opcode.NOP },
                after.drop(2).map { it.opcode }.filter { it != Opcode.NOP }, code)
        }
    }
}

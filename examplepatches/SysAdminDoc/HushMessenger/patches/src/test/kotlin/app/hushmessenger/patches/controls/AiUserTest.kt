package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNull

/** Messenger 587's AI bot check (347415354's User.A0A): the user's own flag, then its type name against "AiBot". */
private const val CHECK = "$MESSENGER_USER->A0A()Z"
private val CHECK_BODY = """
    iget-boolean v0, p0, $MESSENGER_USER->A08:Z
    if-nez v0, :yes
    const-string v1, "AiBot"
    iget-object v0, p0, $MESSENGER_USER->A1a:Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :yes
    const/4 v0, 0x0
    return v0
    :yes
    const/4 v0, 0x1
    return v0
""".trimIndent()

private fun check(body: String = CHECK_BODY, id: String = CHECK, flags: Int = AccessFlags.PUBLIC.value) = fixtureMethod(id, body, 3, flags)

/** User's other yes-or-no checks, which sit next to the AI one: a character bot, and an Instagram account. */
private fun characterBot() = fixtureMethod("$MESSENGER_USER->A0B()Z", """
    invoke-virtual {p0}, $CHECK
    move-result v0
    if-eqz v0, :no
    iget-boolean v0, p0, $MESSENGER_USER->A09:Z
    if-eqz v0, :no
    const/4 v0, 0x1
    return v0
    :no
    const/4 v0, 0x0
    return v0
""".trimIndent(), 2)

private fun instagramUser() = fixtureMethod("$MESSENGER_USER->A0C()Z", """
    const-string v1, "InstagramMessagingUser"
    iget-object v0, p0, $MESSENGER_USER->A1a:Ljava/lang/String;
    invoke-static {v1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    return v0
""".trimIndent(), 3)

private fun user(vararg methods: com.android.tools.smali.dexlib2.iface.Method) = fixtureClass(MESSENGER_USER, methods.toList())

class AiUserTest {
    private fun string(stub: com.android.tools.smali.dexlib2.iface.Method) =
        ((stub.implementation!!.instructions.first() as ReferenceInstruction).reference as StringReference).string

    @Test fun messengersOwnCheckIsTheRoute() {
        assertEquals(CHECK, findAiUserRoute(listOf(user(characterBot(), check(), instagramUser()))))
        // The same code in any other class is somebody else's check.
        val elsewhere = fixtureMethod("LX/2bM;->A0A()Z", CHECK_BODY, 3)
        assertEquals(CHECK, findAiUserRoute(listOf(fixtureClass("LX/2bM;", listOf(elsewhere)), user(check()))))
        assertNull(findAiUserRoute(listOf(fixtureClass("LX/2bM;", listOf(elsewhere)))))
    }

    @Test fun aCheckThatChangedIsNoRoute() {
        for ((case, method) in listOf(
            "static" to check(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
            "takes something" to check(id = CHECK.replace("()Z", "(I)Z")),
            "answers something else" to check(CHECK_BODY.replace("return v0", "return-object v0"), CHECK.replace("()Z", "()Ljava/lang/Object;")),
            "another type name" to check(CHECK_BODY.replace("\"AiBot\"", "\"InstagramMessagingUser\"")),
            "a second string" to check("const-string v1, \"Page\"\n$CHECK_BODY"),
            "no flag" to check(CHECK_BODY.replace("iget-boolean v0, p0, $MESSENGER_USER->A08:Z\nif-nez v0, :yes\n", "")),
            "two flags" to check(CHECK_BODY.replace("const-string v1", "iget-boolean v0, p0, $MESSENGER_USER->A09:Z\nif-nez v0, :yes\nconst-string v1")),
            "someone else's field" to check(CHECK_BODY.replace("$MESSENGER_USER->A08:Z", "LX/18T;->A22:Z")),
            "another user's field" to check(CHECK_BODY.replace("iget-object v0, p0,", "iget-object v0, v1,")),
            "calls Messenger" to check(CHECK_BODY.replace("invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z",
                "invoke-static {v1, v0}, LX/18A;->A1Z(Ljava/lang/Object;Ljava/lang/Object;)Z")),
            "a second call" to check(CHECK_BODY.replace("const/4 v0, 0x0", "invoke-virtual {p0}, $MESSENGER_USER->A0C()Z\nconst/4 v0, 0x0")),
        )) {
            assertNull(findAiUserRoute(listOf(user(method))), case)
        }
        // Two checks can't say which one is Messenger's.
        assertNull(findAiUserRoute(listOf(user(check(), check(id = CHECK.replace("A0A", "A0Z"))))))
        // Guava's null-safe comparison is the same check, as User's Instagram one is written.
        val guava = check(CHECK_BODY.replace("invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z",
            "invoke-static {v1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z"))
        assertEquals(CHECK, findAiUserRoute(listOf(user(guava))))
    }

    @Test fun theRouteIsWrittenOnlyIntoTheExtensionsEmptyStub() {
        val stub = aiUserRouteMethod()
        stub.writeAiUserRoute(CHECK)
        assertEquals(listOf(Opcode.CONST_STRING, Opcode.RETURN_OBJECT), stub.implementation!!.instructions.map { it.opcode })
        assertEquals(CHECK, string(stub))
        // A second write would mean two runs share one stub.
        assertFailsWith<PatchException> { stub.writeAiUserRoute(CHECK) }
        for (changed in listOf(
            aiUserRouteMethod("const/4 v0, 0x0\nreturn-object v0"),
            aiUserRouteMethod("const-string v0, \"\"\nconst-string v0, \"\"\nreturn-object v0"),
            aiUserRouteMethod(flags = AccessFlags.PUBLIC.value),
            fixtureMethod(AI_USER_ROUTE.replace("aiUserRoute", "other"), "const-string v0, \"\"\nreturn-object v0", 1, AccessFlags.STATIC.value),
        )) {
            assertFailsWith<PatchException> { changed.writeAiUserRoute(CHECK) }
        }
    }

    @Test fun noCheckLeavesTheStubEmptyAndAMissingStubStops() {
        val stub = aiUserRouteMethod()
        resolveAiUserRoute(listOf(user(characterBot(), instagramUser())), stub)
        assertEquals("", string(stub))
        resolveAiUserRoute(listOf(user(check())), stub)
        assertEquals(CHECK, string(stub))
        assertFailsWith<PatchException> { resolveAiUserRoute(listOf(user(check())), null) }
    }

    @Test fun everySupportedBuildHasMessengersOwnCheck() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val route = findAiUserRoute(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            // Whatever Redex named it, it's User's own check that takes nothing and answers yes or no.
            assertEquals(true, route != null && route.startsWith("$MESSENGER_USER->") && route.endsWith("()Z"), code)
            val stub = aiUserRouteMethod()
            stub.writeAiUserRoute(route!!)
            assertEquals(route, string(stub), code)
        }
    }
}

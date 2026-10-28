package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNull

/** Messenger 584.1's account switcher Log out (346816973's KEQ.A00), the shape every supported build has. */
private const val LAUNCHER = "LX/KEQ;->A00(Landroid/content/Context;)V"
private val LAUNCHER_BODY = """
    sget-object v1, LX/KbH;->A01:LX/KbH;
    sget-object v0, LX/0OS;->A0N:Ljava/lang/Integer;
    invoke-virtual {v1, v0}, LX/KbH;->A00(Ljava/lang/Integer;)V
    const-string v1, "entry_point_logout"
    const-string v0, "ACCOUNT_SWITCHER"
    invoke-static {p0, v1, v0}, $ACCOUNT_LOGIN_ACTIVITY->A1F(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    move-result-object v0
    invoke-static {p0, v0}, LX/0cO;->A09(Landroid/content/Context;Landroid/content/Intent;)Z
    return-void
""".trimIndent()

private fun launcher(body: String = LAUNCHER_BODY, id: String = LAUNCHER,
    flags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value) = fixtureMethod(id, body, 3, flags)

class LogoutTest {
    private fun string(stub: com.android.tools.smali.dexlib2.iface.Method) =
        ((stub.implementation!!.instructions.first() as ReferenceInstruction).reference as StringReference).string

    @Test fun messengersOwnLogOutIsTheRoute() {
        assertEquals(LAUNCHER, findLogoutRoute(listOf(fixtureClass("LX/KEQ;", listOf(launcher())))))
        // The session-expired path and the launch screen read the same string but aren't the account switcher's call.
        val expired = fixtureMethod("LX/JlY;->A02(LX/JlY;)V", """
            const-string v0, "entry_point_logout"
            const-string v1, "entry_point_logout_session_expired"
            return-void
        """.trimIndent(), 2, AccessFlags.STATIC.value)
        assertEquals(LAUNCHER, findLogoutRoute(listOf(fixtureClass("LX/JlY;", listOf(expired)), fixtureClass("LX/KEQ;", listOf(launcher())))))
    }

    @Test fun aLauncherThatMovedIsNoRoute() {
        val swapped = LAUNCHER_BODY.replace("invoke-static {p0, v1, v0}, $ACCOUNT_LOGIN_ACTIVITY", "invoke-static {p0, v0, v1}, $ACCOUNT_LOGIN_ACTIVITY")
        for ((case, method) in listOf(
            "instance method" to launcher(flags = AccessFlags.PUBLIC.value),
            "another parameter" to launcher(id = LAUNCHER.replace("Context;", "Context;I")),
            "returns a value" to launcher(LAUNCHER_BODY.replace("return-void", "const/4 v0, 0x0\nreturn v0"), LAUNCHER.replace(")V", ")Z")),
            "other entry point" to launcher(LAUNCHER_BODY.replace("\"ACCOUNT_SWITCHER\"", "\"SETTINGS\"")),
            "arguments swapped" to launcher(swapped),
            "another activity" to launcher(LAUNCHER_BODY.replace("$ACCOUNT_LOGIN_ACTIVITY->A1F", "LX/Other;->A1F")),
            "intent never started" to launcher(LAUNCHER_BODY.replace("invoke-static {p0, v0}, LX/0cO;->A09(Landroid/content/Context;Landroid/content/Intent;)Z\n", "")),
            "started from elsewhere" to launcher(LAUNCHER_BODY.replace("invoke-static {p0, v0}, LX/0cO", "invoke-static {v1, v0}, LX/0cO")),
            "branches" to launcher(LAUNCHER_BODY.replace("const-string v1, \"entry_point_logout\"", "if-eqz p0, :done\nconst-string v1, \"entry_point_logout\"")
                .replace("return-void", ":done\nreturn-void")),
        )) {
            assertNull(findLogoutRoute(listOf(fixtureClass("LX/KEQ;", listOf(method)))), case)
        }
        // Two launchers can't say which one is Messenger's.
        assertNull(findLogoutRoute(listOf(fixtureClass("LX/KEQ;", listOf(launcher())),
            fixtureClass("LX/KER;", listOf(launcher(id = LAUNCHER.replace("KEQ", "KER")))))))
    }

    @Test fun theRouteIsWrittenOnlyIntoTheExtensionsEmptyStub() {
        val stub = logoutRouteMethod()
        stub.writeLogoutRoute(LAUNCHER)
        assertEquals(listOf(Opcode.CONST_STRING, Opcode.RETURN_OBJECT), stub.implementation!!.instructions.map { it.opcode })
        assertEquals(LAUNCHER, string(stub))
        // A second write would mean two runs share one stub.
        assertFailsWith<PatchException> { stub.writeLogoutRoute(LAUNCHER) }
        for (changed in listOf(
            logoutRouteMethod("const/4 v0, 0x0\nreturn-object v0"),
            logoutRouteMethod("const-string v0, \"\"\nconst-string v0, \"\"\nreturn-object v0"),
            logoutRouteMethod(flags = AccessFlags.PUBLIC.value),
            fixtureMethod(LOGOUT_ROUTE.replace("logoutRoute", "other"), "const-string v0, \"\"\nreturn-object v0", 1, AccessFlags.STATIC.value),
        )) {
            assertFailsWith<PatchException> { changed.writeLogoutRoute(LAUNCHER) }
        }
    }

    @Test fun noLauncherLeavesTheStubEmptyAndAMissingStubStops() {
        val stub = logoutRouteMethod()
        resolveLogoutRoute(listOf(fixtureClass("LX/KEQ;", listOf(launcher(flags = AccessFlags.PUBLIC.value)))), stub)
        assertEquals("", string(stub))
        resolveLogoutRoute(listOf(fixtureClass("LX/KEQ;", listOf(launcher()))), stub)
        assertEquals(LAUNCHER, string(stub))
        assertFailsWith<PatchException> { resolveLogoutRoute(listOf(fixtureClass("LX/KEQ;", listOf(launcher()))), null) }
    }

    @Test fun everySupportedBuildHasMessengersOwnLogOut() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val route = findLogoutRoute(classes)
            val launcher = classes.flatMap { it.methods }.single { it.hookId() == route }
            val built = launcher.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                .single { it.definingClass == ACCOUNT_LOGIN_ACTIVITY }
            assertEquals("A1F", built.name, code)
            val stub = logoutRouteMethod()
            stub.writeLogoutRoute(route!!)
            assertEquals(route, string(stub), code)
        }
    }
}

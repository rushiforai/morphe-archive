package app.hushmessenger.patches.coexist

import app.hushmessenger.patches.controls.fixtureClass
import app.hushmessenger.patches.controls.fixtureMethod
import app.hushmessenger.patches.controls.hookId
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.hushmessenger.patches.MessengerTarget
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

private const val KATANA_CLONE = "com.facebook.katana.morphe"
private const val PM = "Landroid/content/pm/PackageManager;"

/** Messenger's hand-offs to Facebook cut down: a profile link, an install test, a launch and a component, each loading the name. */
private fun handOffs() = fixtureMethod("LX/Aaa;->A00(Landroid/content/Context;Landroid/content/Intent;)V", """
    const-string v0, "com.facebook.katana"
    invoke-virtual {p2, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()$PM
    move-result-object v1
    const-string v0, "com.facebook.katana"
    invoke-static {v1, v0}, LX/0GC;->A06(${PM}Ljava/lang/String;)Z
    move-result v2
    const-string v0, "com.facebook.katana"
    invoke-virtual {v1, v0}, $PM->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;
    const-string v0, "com.facebook.katana"
    const-string v3, "com.facebook.katana.profile.ProfileActivity"
    new-instance v4, Landroid/content/ComponentName;
    invoke-direct {v4, v0, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    return-void
""".trimIndent(), 8)

/** Sites that must keep talking to the regular Facebook app: sign-in, a comparison, a stored name, the Play attribution extra. */
private fun others() = fixtureMethod("LX/Bbb;->A00(Landroid/content/Intent;Ljava/lang/String;)V", """
    const-string v0, "com.facebook.katana"
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    const-string v0, "com.facebook.katana"
    new-instance v1, Lcom/facebook/fblibraries/fblogin/SsoSource;
    const/4 v2, 0x1
    invoke-direct {v1, v0, v2}, Lcom/facebook/fblibraries/fblogin/SsoSource;-><init>(Ljava/lang/String;I)V
    const-string v0, "com.facebook.katana"
    const-string v1, "callerId"
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    const-string v0, "com.facebook.katana"
    sput-object v0, LX/Bbb;->A00:Ljava/lang/String;
    const-string v0, "com.facebook.katana"
    const-string v1, "com.facebook.lite"
    filled-new-array {v0, v1}, [Ljava/lang/String;
    return-void
""".trimIndent(), 8)

private fun MutableMethod.stringLoads() = implementation!!.instructions.mapNotNull {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
}.filter { it.startsWith("com.facebook.katana") && '.' !in it.removePrefix("com.facebook.katana") || it == KATANA_CLONE }

class FacebookHandOffTest {
    @Test fun handOffsLoadTheChosenPackageAndSignInSitesKeepTheRegularApp() {
        val hands = handOffs()
        val rest = others()
        val classes = listOf(fixtureClass("LX/Aaa;", listOf(hands)), fixtureClass("LX/Bbb;", listOf(rest)))
        val found = findFacebookHandOffs(classes)
        assertEquals(4, found.size, found.toString())
        assertTrue(found.all { it.startsWith(hands.hookId()) }, found.toString())

        applyFacebookHandOffs(found.map { hands to it.substringAfter('@').toInt() }, KATANA_CLONE)

        assertEquals(List(4) { KATANA_CLONE }, hands.stringLoads())
        // Only the component's class name still carries the old prefix, and it names a class inside the clone.
        assertTrue(hands.implementation!!.instructions.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "com.facebook.katana.profile.ProfileActivity"
        })
        assertEquals(List(5) { "com.facebook.katana" }, rest.stringLoads())
        assertTrue(findFacebookHandOffs(listOf(fixtureClass("LX/Aaa;", listOf(hands)))).isEmpty())
    }

    @Test fun onlyTheFacebookAppAndItsClonesPass() {
        for (name in listOf("com.facebook.katana", KATANA_CLONE, "com.facebook.katana.hush2")) assertTrue(isFacebookPackage(name), name)
        for (name in listOf(null, "", "com.facebook.orca", "com.facebook.katanax", "com.facebook.katana.", "com.facebook.katana..a",
            "com.facebook.katana.1a", "com.facebook.katana.a-b", "COM.facebook.katana")) assertFalse(isFacebookPackage(name), name.toString())
    }

    @Test fun theCloneOptionDefaultsToTheRegularApp() {
        val option = assertNotNull(cloneInstallPatch.options["cloneFacebookPackage"])
        assertEquals(FACEBOOK_PACKAGE, option.default)
        try {
            cloneInstallPatch.options.set("cloneFacebookPackage", KATANA_CLONE)
            assertEquals(KATANA_CLONE, option.value)
            org.junit.jupiter.api.assertThrows<Exception> { cloneInstallPatch.options.set("cloneFacebookPackage", "com.facebook.orca") }
        } finally {
            option.reset()
        }
    }

    @Test fun everyStockBuildHasHandOffsAndTheyAllMove() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(MessengerTarget.VERSION_CODES.size, apks.size)
        for (apk in apks) {
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes: List<ClassDef> = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val sites = findFacebookHandOffs(classes)
            assertTrue(sites.size >= 8, "${apk.fileName} found ${sites.size}")
            val methods = sites.map { it.substringBefore('@') }.distinct().associateWith { id ->
                MutableMethod(classes.single { it.type == id.substringBefore("->") }.methods.single { it.hookId() == id })
            }
            applyFacebookHandOffs(sites.map { methods.getValue(it.substringBefore('@')) to it.substringAfter('@').toInt() }, KATANA_CLONE)
            assertTrue(findFacebookHandOffs(methods.values.map { fixtureClass(it.definingClass, listOf(it)) }).isEmpty(), apk.fileName.toString())
            assertEquals(sites.size, methods.values.sumOf { it.stringLoads().count { s -> s == KATANA_CLONE } }, apk.fileName.toString())
            println("${apk.fileName}: ${sites.size} hand-offs")
        }
    }
}

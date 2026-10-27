package app.hushmessenger.patches.misc

import app.hushmessenger.patches.MessengerTarget
import app.hushmessenger.patches.controls.controlProfileFor
import app.hushmessenger.patches.controls.fixtureMethod
import app.hushmessenger.patches.controls.hookId
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import java.nio.file.Files
import java.nio.file.Path
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val VERSION_CHECK_LOG = "Android PackageManager returned version code"

class SpoofSelfReadsTest {
    private val static = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
    private val lookup = "Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;"
    private val manager = "Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;"

    /** AppComponentManager's shape: its own name, getPackageInfo, then the field. */
    private fun ownField(id: String = "LX/0xr;->A00(Landroid/content/Context;)I") = fixtureMethod(id, """
        invoke-virtual {p0}, $manager
        move-result-object v2
        invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
        move-result-object v0
        const/4 v1, 0x0
        invoke-virtual {v2, v0, v1}, $lookup
        move-result-object v0
        iget v0, v0, $VERSION_FIELD
        return v0
    """.trimIndent(), 4, static)

    /** ACRA's crash-time shape: the name from getApplicationInfo, then the getter. */
    private fun ownGetter() = fixtureMethod("Lcom/facebook/acra/CrashTimeDataCollector;->code(Landroid/content/Context;)J", """
        invoke-virtual {p0}, $manager
        move-result-object v2
        invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;
        move-result-object v0
        iget-object v1, v0, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;
        const/4 v0, 0x0
        invoke-virtual {v2, v1, v0}, $lookup
        move-result-object v0
        invoke-virtual {v0}, $VERSION_GETTER
        move-result-wide v0
        return-wide v0
    """.trimIndent(), 4, static)

    private fun lookupOf(name: String, id: String) = fixtureMethod(id, """
        invoke-virtual {p0}, $manager
        move-result-object v2
        const-string v0, "$name"
        const/4 v1, 0x0
        invoke-virtual {v2, v0, v1}, $lookup
        move-result-object v0
        iget v0, v0, $VERSION_FIELD
        return v0
    """.trimIndent(), 4, static)

    /** 346611351's Mapbox shape: a wrapper hands back the app's own PackageInfo. */
    private val wrapperId = "LX/TAt;->A0D(Landroid/content/Context;)Landroid/content/pm/PackageInfo;"
    private fun wrapper() = fixtureMethod(wrapperId, """
        invoke-virtual {p0}, $manager
        move-result-object v1
        invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
        move-result-object v0
        const/4 v2, 0x0
        invoke-virtual {v1, v0, v2}, $lookup
        move-result-object v0
        return-object v0
    """.trimIndent(), 4, static)
    private fun throughWrapper() = fixtureMethod("Lcom/mapbox/mapboxsdk/http/HttpIdentifier;->getIdentifier(Landroid/content/Context;)I", """
        invoke-static {p0}, $wrapperId
        move-result-object v0
        iget v0, v0, $VERSION_FIELD
        return v0
    """.trimIndent(), 2, static)

    private fun ids(methods: List<Method>) = findSelfVersionReads(methods).mapKeys { it.key.hookId() }

    @Test fun onlyReadsOfTheAppsOwnPackageInfoAreFound() {
        val own = ownField()
        val getter = ownGetter()
        val viaWrapper = throughWrapper()
        val gms = lookupOf("com.google.android.gms", "LX/1v0;->A00(Landroid/content/Context;)I")
        val stockName = lookupOf("com.facebook.orca", "LX/MQw;->A01(Landroid/content/Context;)I")
        val param = fixtureMethod("LX/0E7;->A00(Landroid/content/pm/PackageInfo;)J",
            "invoke-virtual {p0}, $VERSION_GETTER\nmove-result-wide v0\nreturn-wide v0", 3, static)
        // Its own name in one lookup and Google Play services' in another: either could reach the read.
        val mixed = fixtureMethod("LX/mixed;->A00(Landroid/content/Context;)I", """
            invoke-virtual {p0}, $manager
            move-result-object v2
            invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
            move-result-object v0
            const/4 v1, 0x0
            invoke-virtual {v2, v0, v1}, $lookup
            move-result-object v3
            const-string v0, "com.google.android.gms"
            invoke-virtual {v2, v0, v1}, $lookup
            move-result-object v3
            iget v0, v3, $VERSION_FIELD
            return v0
        """.trimIndent(), 5, static)
        val field = fixtureMethod("LX/0CN;->A00()I", """
            iget-object v0, p0, LX/0CN;->A01:Landroid/content/pm/PackageInfo;
            iget v0, v0, $VERSION_FIELD
            return v0
        """.trimIndent(), 2)
        // Copy setup reads the installed code on purpose.
        val ours = ownField("Lapp/hushmessenger/extension/SettingsActivity;->code(Landroid/content/Context;)I")

        val found = ids(listOf(own, getter, wrapper(), viaWrapper, gms, stockName, param, mixed, field, ours))
        assertEquals(mapOf(own.hookId() to 1, getter.hookId() to 1, viaWrapper.hookId() to 1), found)
    }

    @Test fun theFieldReadBecomesACallIntoTheSameRegister() {
        val method = ownField()
        val before = method.implementation!!.instructions.toList()
        method.answerOwnVersionReads()
        val code = method.implementation!!.instructions.toList()
        assertEquals(before.size + 1, code.size)
        assertEquals(before.take(7), code.take(7))
        val call = code[7] as RegisterRangeInstruction
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals("$OWN_VERSION->versionCode(Landroid/content/pm/PackageInfo;)I", (call as ReferenceInstruction).reference.toString())
        assertEquals(0, call.startRegister)
        assertEquals(1, call.registerCount)
        assertEquals(Opcode.MOVE_RESULT, code[8].opcode)
        assertEquals(0, (code[8] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.RETURN, code[9].opcode)
    }

    @Test fun theGetterBecomesACallWithTheSameResult() {
        val method = ownGetter()
        val before = method.implementation!!.instructions.toList()
        method.answerOwnVersionReads()
        val code = method.implementation!!.instructions.toList()
        assertEquals(before.size, code.size)
        val call = code[8] as RegisterRangeInstruction
        assertEquals("$OWN_VERSION->longVersionCode(Landroid/content/pm/PackageInfo;)J", (call as ReferenceInstruction).reference.toString())
        assertEquals(0, call.startRegister)
        assertEquals(before.drop(9), code.drop(9))

        // A PackageInfo above v15 reaches the getter through the range form, and keeps its register.
        val high = fixtureMethod("LX/high;->A00(Landroid/content/pm/PackageInfo;)J",
            "move-object/from16 v17, p0\ninvoke-virtual/range {v17 .. v17}, $VERSION_GETTER\nmove-result-wide v0\nreturn-wide v0", 19, static)
        high.answerOwnVersionReads()
        val range = high.implementation!!.instructions.toList()[1] as RegisterRangeInstruction
        assertEquals(17, range.startRegister)
        assertEquals("$OWN_VERSION->longVersionCode(Landroid/content/pm/PackageInfo;)J", (range as ReferenceInstruction).reference.toString())
    }

    @Test fun aWrongCountOrShapeChangesNothing() {
        val methods = listOf(ownField(), ownGetter(), wrapper(), throughWrapper())
        assertEquals(setOf(methods[0].hookId(), methods[1].hookId(), methods[3].hookId()), planSelfVersionReads(methods, expected = 3))
        val before = methods.map { it.implementation!!.instructions.toList() }
        val failure = assertFailsWith<PatchException> { planSelfVersionReads(methods) }
        assertContains(failure.message.orEmpty(), "found 3 reads of Messenger's own version code, expected $SELF_VERSION_READS")
        assertEquals(before, methods.map { it.implementation!!.instructions.toList() })

        val odd = fixtureMethod("LX/odd;->A00(Landroid/content/Context;)J", """
            invoke-virtual {p0}, $manager
            move-result-object v2
            invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
            move-result-object v0
            const/4 v1, 0x0
            invoke-virtual {v2, v0, v1}, $lookup
            move-result-object v0
            invoke-super {v0}, $VERSION_GETTER
            move-result-wide v0
            return-wide v0
        """.trimIndent(), 4, static)
        val shape = assertFailsWith<PatchException> { planSelfVersionReads(listOf(odd), expected = 1) }
        assertContains(shape.message.orEmpty(), "LX/odd;->A00(Landroid/content/Context;)J reads its version with")
    }

    @Test fun spoofBringsTheSelfReadsWithIt() {
        assertTrue(spoofSelfReadsPatch in spoofPackageVersionPatch.dependencies)
    }

    /** The armv7 builds expect ACRA's extra pre-Android 9 read, and every arm64 build the usual 15. */
    @Test fun theArmv7BuildsExpectOneMoreRead() {
        for (code in MessengerTarget.VERSION_CODES) {
            val armv7 = code in setOf(346816949, 346816966, 346817019)
            assertEquals(if (armv7) 16 else 15, selfVersionReadsFor(controlProfileFor(code.toString())), "$code")
        }
    }

    /** Every supported stock build has its family's own reads, AppComponentManager's mismatch check among them. */
    @Test fun everyStockBuildHasItsFamilysOwnVersionReads() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(MessengerTarget.VERSION_CODES.size, apks.size)
        // Every build's miscount is listed at once, with its readers, so one run shows what moved.
        val miscounts = mutableListOf<String>()
        for (apk in apks) {
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val methods = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes.flatMap { it.methods } }
            val expected = selfVersionReadsFor(controlProfileFor(apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')))
            val reads = findSelfVersionReads(methods)
            if (reads.values.sum() != expected) {
                miscounts += "${apk.fileName} ${reads.values.sum()} not $expected: ${reads.entries.map { "${it.key.hookId()} x${it.value}" }.sorted()}"
                continue
            }
            val found = planSelfVersionReads(methods, expected)
            // The obfuscated owners move between 584.1's families, so those two go by the version check's log line and the trace hook's name.
            val versionCheck = methods.filter { m ->
                m.implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string?.startsWith(VERSION_CHECK_LOG) == true } == true
            }.map { it.hookId() }.distinct()
            assertEquals(1, versionCheck.size, "$apk $versionCheck")
            assertContains(found, versionCheck.single(), "$apk")
            assertEquals(1, found.count { it.startsWith("LX/") && it.contains(";->logOnTraceEnd(") }, "$apk $found")
            for (anchor in listOf("Lcom/facebook/appcomponentmanager/AppComponentManagerService;->A06(",
                "Lcom/facebook/acra/CrashTimeDataCollector;->getPackageManagerVersionCode(",
                "Lcom/mapbox/mapboxsdk/http/HttpIdentifier;->getIdentifier(",
                "Lcom/meta/hatch/ui/settings/bugreport/data/HatchBugReportSender\$send\$1;->invokeSuspend(")) {
                assertTrue(found.any { it.startsWith(anchor) }, "$apk $anchor")
            }
            // Android's ART, Google Play services and WebView keep what Android reports.
            assertTrue(found.none { "DexStoreUtils" in it || "BlockStoreSetupManager" in it || "playservices" in it }, "$apk $found")
        }
        assertEquals(emptyList(), miscounts)
    }
}

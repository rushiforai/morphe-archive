package app.tomtom.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.tomtom.patches.mypois.myPoisPatch
import app.tomtom.patches.premium.unlockSubscriptionPatch
import app.tomtom.patches.premium.unlockTruckProfilePatch
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import java.io.File
import kotlin.test.Test
import kotlin.test.assertTrue

/**
 * Applies all patches to the real 3.6.326 APK and then re-reads the patched
 * dex to prove every injected instruction and merged extension class is
 * actually present.
 *
 * Run with:
 *   ./gradlew :patches:test -PtomtomApk=/path/to/TomTom.apk
 */
class ApplyPatchTest {
    @Test
    fun `patches apply to the pinned apk`() = runBlocking {
        val apkPath = System.getProperty("tomtom.apk")
            ?: "/home/george/builds/songsterrpatch/TomTom+GO+Expert_+Truck+GPS_3.6.326_APKPure.apk"
        val apk = File(apkPath)
        assertTrue(apk.isFile, "APK not found at $apkPath")

        val workspace = File("/tmp/tomtom/patch-harness").apply {
            deleteRecursively()
            mkdirs()
        }
        // The SDK dex verifier rejects pre-existing missing-Type references
        // that R8 left in the original Sentry integration, so the harness
        // verifies the patched dex itself below instead.
        val config = PatcherConfig(
            apkFile = apk,
            temporaryFilesPath = workspace,
        )

        val result = Patcher(config).use { patcher ->
            patcher += setOf(unlockSubscriptionPatch, unlockTruckProfilePatch, myPoisPatch)
            val results = patcher().toList()
            results.forEach { r ->
                println("RESULT ${r.patch.name} -> ${if (r.exception == null) "OK" else "FAILED: ${r.exception?.message}"}")
            }
            val failures = results.filter { it.exception != null }
            assertTrue(failures.isEmpty(), failures.joinToString("\n") { "${it.patch.name}: ${it.exception}" })
            patcher.get()
        }

        val dexDir = File("/tmp/tomtom/patched-dex").apply {
            deleteRecursively()
            mkdirs()
        }
        val dexFiles = result.dexFiles.map { patched ->
            val out = File(dexDir, patched.name)
            patched.stream.use { input -> out.outputStream().use { input.copyTo(it) } }
            DexFileFactory.loadDexFile(out, Opcodes.getDefault())
        }
        println("PATCHED DEX FILES: " + result.dexFiles.map { it.name })

        fun classDef(type: String): ClassDef =
            dexFiles.asSequence().flatMap { it.classes }.firstOrNull { it.type == type }
                ?: error("class $type missing from patched dex")

        fun method(classType: String, name: String, returnType: String, params: List<String> = emptyList()): Method {
            val cls = classDef(classType)
            return cls.methods.firstOrNull { m ->
                m.name == name && m.returnType == returnType && m.parameterTypes.map { it.toString() } == params
            } ?: error("method $classType->$name($params)$returnType missing")
        }

        fun impl(m: Method): MethodImplementation =
            m.implementation ?: error("method ${m.definingClass}->${m.name} has no code")

        fun ref(ins: com.android.tools.smali.dexlib2.iface.instruction.Instruction): String = when (val r =
            (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference
        ) {
            is com.android.tools.smali.dexlib2.iface.reference.StringReference -> r.string
            null -> ""
            else -> r.toString()
        }

        fun ops(m: Method): List<com.android.tools.smali.dexlib2.iface.instruction.Instruction> =
            impl(m).instructions.toList()

        fun dump(lines: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>) =
            lines.joinToString("\n") { "${it.opcode.name} ${ref(it)}" }

        fun assertRef(label: String, lines: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>, needle: String) {
            assertTrue(lines.any { ref(it).contains(needle) }, "$label: expected reference '$needle' in\n" + dump(lines))
        }

        fun assertOpcode(label: String, lines: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>, needle: Opcode) {
            assertTrue(lines.any { it.opcode == needle }, "$label: expected opcode $needle in\n" + dump(lines))
        }

        // 1. qb/a$b.invoke -> Boolean.TRUE
        val hasActive = ops(method("Lqb/a\$b;", "invoke", "Ljava/lang/Object;", listOf("Ljava/lang/Object;")))
        assertRef("hasActiveSubscriptions", hasActive.take(4), "Ljava/lang/Boolean;->TRUE")
        assertOpcode("hasActiveSubscriptions", hasActive.take(4), Opcode.RETURN_OBJECT)

        // 2. N9/c.invoke -> STORE_SUBSCRIPTION
        val state = ops(method("LN9/c;", "invoke", "Ljava/lang/Object;", listOf("Ljava/lang/Object;")))
        assertRef("subscription state", state.take(4), "LN9/a;->d")

        // 3. tb/d.f -> false
        val isTrial = ops(method("Ltb/d;", "f", "Z", listOf("Ltb/a;")))
        assertOpcode("isTrial", isTrial.take(4), Opcode.CONST_4)
        assertOpcode("isTrial", isTrial.take(4), Opcode.RETURN)

        // 4. H9/G0.e -> skip onboarding paywall
        val onboarding = ops(method("LH9/G0;", "e", "V"))
        assertRef("onboarding", onboarding.take(8), "Lv9/n;->c()V")
        assertRef("onboarding", onboarding.take(8), "LH9/b\$a;->f(LQ8/c;)V")
        assertOpcode("onboarding", onboarding.take(8), Opcode.RETURN_VOID)

        // 5. e9/v2.J1 -> null
        val trialCard = ops(method("Le9/v2;", "J1", "Ltb/a;"))
        assertOpcode("trial card", trialCard.take(4), Opcode.CONST_4)
        assertOpcode("trial card", trialCard.take(4), Opcode.RETURN_OBJECT)

        // 6. x9/x0.a -> force truck settings
        val truckFlags = ops(method("Lx9/x0;", "a", "V", listOf("Ljava/util/List;")))
        assertRef("truck flags", truckFlags.take(16), "com.tomtom.navui.setting.show_full_vehicle_profile")
        assertRef("truck flags", truckFlags.take(16), "com.tomtom.mobile.TRUCK_SUBSCRIPTION_PURCHASED")
        assertRef("truck flags", truckFlags.take(16), "SystemSettings;->putBoolean")

        // 7. x9/r0.a -> never revert
        val revert = ops(method("Lx9/r0;", "a", "V"))
        assertOpcode("profile revert", revert.take(2), Opcode.RETURN_VOID)

        // 8. e9/K2.<init> -> force y2 = true
        val ctor = ops(method("Le9/K2;", "<init>", "V", listOf("Le9/s;")))
        assertTrue(
            ctor.zipWithNext().any { (a, b) ->
                a.opcode == Opcode.CONST_4 &&
                    b.opcode == Opcode.IPUT_BOOLEAN &&
                    ref(b).contains("Le9/K2;->y2")
            },
            "vehicle profile: const/4 + iput y2 pair missing in\n" + dump(ctor),
        )

        // 9. My POIs: main menu action hook
        val launchExternal = ops(method("Lhc/G;", "u", "Z"))
        assertRef(
            "mypois menu",
            launchExternal.take(4),
            "Lapp/mypois/extension/MyPoisHooks;->interceptLaunchExternal",
        )

        // 10. My POIs: read-only copy of My Places
        val myPlaces = ops(
            method("Lgc/B1\$c;", "onLocationsRetrieved", "V", listOf("Ljava/util/List;")),
        )
        assertRef("mypois places", myPlaces.take(2), "Lapp/mypois/extension/MyPoisHooks;->onMyPlaces")

        // 11. My POIs: "Add to My POIs" buttons on the home and preview screens
        for ((label, type) in listOf("home screen" to "Lgc/P0;", "preview screen" to "Lgc/b1;")) {
            val directives = ops(method(type, "f1", "V", listOf("Lx6/b;")))
            assertRef("mypois $label", directives.take(2), "MyPoisHooks;->beginDirectives")
            assertRef("mypois $label", directives.takeLast(2), "MyPoisHooks;->addDirective")
        }

        // 12. The extension dex is merged into the patched APK.
        classDef("Lapp/mypois/extension/MyPoisActivity;")
        classDef("Lapp/mypois/extension/MyPoisHooks;")
        classDef("Lapp/mypois/extension/PoiStore;")

        // 13. The resource patch added the menu entry, label and activity.
        val resources = File(workspace, "apk/resources/package_1")
        for (menuFile in listOf("res/xml/main_menu.xml", "res/xml/default_main_menu.xml")) {
            val text = File(resources, menuFile).readText()
            assertTrue(text.contains("mypois"), "$menuFile: My POIs item missing")
            assertTrue(
                text.contains("action://LaunchExternal/mypois"),
                "$menuFile: My POIs action missing",
            )
        }
        val strings = File(resources, "res/values/strings.xml").readText()
        assertTrue(strings.contains("mypois_menu_label"), "strings.xml: My POIs label missing")
        val manifest = File(workspace, "apk/AndroidManifest.xml").readText()
        assertTrue(
            manifest.contains("app.mypois.extension.MyPoisActivity"),
            "AndroidManifest.xml: MyPoisActivity not registered",
        )

        println("VERIFIED: all injected instructions and extension resources present")
    }
}

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import org.junit.jupiter.api.Assertions.assertNull
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File
import java.nio.ByteBuffer

private const val PKG = "com.sofascore.results"
private const val USER_ACCOUNT = "Lcom/sofascore/local_persistance/UserAccount;"
private const val PROFILE_DATA = "Lcom/sofascore/model/profile/ProfileData;"
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private const val GMS_MEASUREMENT = "Lcom/google/android/gms/measurement/api/AppMeasurementSdk;"
private const val FACEBOOK_PROVIDER = "Lcom/facebook/internal/FacebookInitProvider;"
private const val AUDIENCE_PROVIDER = "Lcom/facebook/ads/AudienceNetworkContentProvider;"
private const val PROMOTION_MODAL = "Lcom/sofascore/results/event/details/view/promotion/PromotionModal;"
private const val TENNIS_PROMO_SHEET = "Lcom/sofascore/results/event/aiInsights/SofascoreAnalystTennisPromoBottomSheet;"
private const val CRASHLYTICS_KEY = "firebase_crashlytics_collection_enabled"

private val SOFASCORE_PATCHES = setOf(
    "Block marketing notifications",
    "Disable Facebook SDK",
    "Disable ads",
    "Disable telemetry",
    "Enable Premium",
)

class SofascoreSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun repoRoot(): File {
        var dir = File(System.getProperty("user.dir")).absoluteFile
        while (dir != null && !File(dir, "settings.gradle.kts").exists()) dir = dir.parentFile
        return dir ?: File(System.getProperty("user.dir")).absoluteFile
    }

    private fun Method.insns(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun ClassDef.methodsNamed(name: String): List<Method> = methods.filter { it.name == name }

    private fun ClassDef.referencesString(value: String): Boolean = methods.any { method ->
        method.insns().any { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference
            ref is StringReference && ref.string == value
        }
    }

    private fun assertForcedBoolean(method: Method, expected: Boolean, label: String, diagnostics: String) {
        val insns = method.insns()
        val first = insns.getOrNull(0)
        val second = insns.getOrNull(1)
        assertTrue(
            first is NarrowLiteralInstruction &&
                first.opcode == Opcode.CONST_4 &&
                first.narrowLiteral.toInt() == if (expected) 1 else 0,
            "$label was not forced to $expected; first instruction is ${first?.opcode}\n$diagnostics"
        )
        assertTrue(
            second != null && second.opcode == Opcode.RETURN,
            "$label does not return immediately; second instruction is ${second?.opcode}\n$diagnostics"
        )
        assertTrue(
            (second as OneRegisterInstruction).registerA ==
                (first as OneRegisterInstruction).registerA,
            "$label returns a different register than the one set\n$diagnostics"
        )
    }

    private fun assertForcedBoxedTrue(method: Method, label: String, diagnostics: String) {
        val insns = method.insns()
        val first = insns.getOrNull(0) as? ReferenceInstruction
        val ref = first?.reference as? FieldReference
        assertTrue(
            first != null &&
                first.opcode == Opcode.SGET_OBJECT &&
                ref != null &&
                ref.definingClass == "Ljava/lang/Boolean;" &&
                ref.name == "TRUE",
            "$label was not forced to Boolean.TRUE; first instruction is ${insns.getOrNull(0)?.opcode}\n$diagnostics"
        )
        assertTrue(
            insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT,
            "$label does not return immediately; second instruction is ${insns.getOrNull(1)?.opcode}\n$diagnostics"
        )
    }

    private fun assertReturnsEarly(method: Method, label: String, diagnostics: String) {
        assertTrue(
            method.insns().firstOrNull()?.opcode == Opcode.RETURN_VOID,
            "$label does not return immediately; first instruction is ${method.insns().firstOrNull()?.opcode}\n$diagnostics"
        )
    }

    private fun assertDismissesEarly(method: Method, label: String, diagnostics: String) {
        val insns = method.insns()
        val first = insns.getOrNull(0) as? ReferenceInstruction
        val ref = first?.reference as? MethodReference
        assertTrue(
            ref != null &&
                ref.definingClass == "Landroidx/fragment/app/DialogFragment;" &&
                ref.name == "dismiss",
            "$label does not dismiss the dialog first; first instruction is ${first?.opcode} ${ref}\n$diagnostics"
        )
        assertTrue(
            insns.getOrNull(1)?.opcode == Opcode.RETURN_VOID,
            "$label does not return after dismissing; second instruction is ${insns.getOrNull(1)?.opcode}\n$diagnostics"
        )
    }

    @Test
    fun `all Sofascore patches apply and mutate the expected bytecode`() {
        val root = repoRoot()
        val apk = File(root, "apks/sofascore/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val bundle = File(root, "patches/build/libs").walkTopDown()
            .filter {
                it.isFile && it.extension == "mpp" &&
                    !it.name.contains("sources") && !it.name.contains("javadoc")
            }
            .maxByOrNull { it.lastModified() } ?: error("no patch bundle (.mpp) found in patches/build/libs")

        val all: Set<Patch<*>> = loadPatchesFromJar(setOf(bundle))
        val target = all.filter { patch ->
            patch.name in SOFASCORE_PATCHES &&
                patch.compatibility.orEmpty().any { it.packageName == PKG }
        }.toList()

        assertTrue(
            target.map { it.name }.toSet() == SOFASCORE_PATCHES,
            "expected all 6 Sofascore patches in the bundle, found ${target.map { it.name }}"
        )

        val config = PatcherConfig(
            apk,
            workDir.resolve("out"),
            PKG,
            "26.09.07",
        )

        // Patcher.invoke() only executes the patches. Patcher.get() finalizes the bytecode
        // context and emits the patched dex files - without it you just re-read the unpatched
        // input dex that the patcher extracted into the output directory.
        val result = Patcher(config).use { patcher ->
            patcher += target.toSet()
            val results = runBlocking { patcher.invoke().toList() }

            val ours = results.filter { it.patch.name in SOFASCORE_PATCHES }
            assertTrue(
                ours.size == SOFASCORE_PATCHES.size,
                "every patch must execute exactly once; got ${results.map { it.patch.name }}"
            )
            for (r in ours) {
                assertNull(r.exception, "patch '${r.patch.name}' failed: ${r.exception}")
            }

            patcher.get()
        }

        val dexFiles = result.dexFiles
        assertTrue(dexFiles.isNotEmpty(), "patcher produced no patched dex files")

        // Drain every stream up front. The streams are backed by files inside @TempDir, so
        // skipping one leaves it open and JUnit then fails to delete the temp directory on
        // Windows. Load from memory; path-backed dex files stay locked on Windows.
        val classes: List<ClassDef> = dexFiles.flatMap { dexFile ->
            val bytes = dexFile.stream.use { it.readBytes() }
            DexBackedDexFile(Opcodes.forApi(36), ByteBuffer.wrap(bytes)).classes.toList()
        }
        val byType = classes.associateBy { it.type }
        val diagnostics = StringBuilder()
        diagnostics.appendLine("emitted classes=${classes.size}")

        fun require(type: String): ClassDef =
            byType[type] ?: error("$type not found in emitted dexes\n$diagnostics")

        // Disable ads: the three UserAccount flags the ad logic consults.
        assertForcedBoolean(
            require(USER_ACCOUNT).methodsNamed("getForceAds").single(),
            expected = false, label = "UserAccount.getForceAds()", diagnostics.toString()
        )
        assertForcedBoolean(
            require(USER_ACCOUNT).methodsNamed("getForceHideAds").single(),
            expected = true, label = "UserAccount.getForceHideAds()", diagnostics.toString()
        )
        assertForcedBoolean(
            require(USER_ACCOUNT).methodsNamed("getHasServerAds").single(),
            expected = false, label = "UserAccount.getHasServerAds()", diagnostics.toString()
        )

        // Enable Premium: both boxed-Boolean premium flags.
        assertForcedBoxedTrue(
            require(USER_ACCOUNT).methodsNamed("getHasPremium").single(),
            label = "UserAccount.getHasPremium()", diagnostics.toString()
        )
        assertForcedBoxedTrue(
            require(PROFILE_DATA).methodsNamed("getHasPremium").single(),
            label = "ProfileData.getHasPremium()", diagnostics.toString()
        )

        // Disable telemetry: AppsFlyer implementation + GMS measurement.
        val appsFlyer = classes.firstOrNull { it.superclass == APPSFLYER_LIB }
            ?: error("AppsFlyerLib subclass not found in emitted dexes\n$diagnostics")
        val appsFlyerLogEvent = appsFlyer.methodsNamed("logEvent")
            .single { it.parameterTypes.size == 4 }
        assertReturnsEarly(
            appsFlyerLogEvent,
            label = "${appsFlyer.type}.logEvent(Context, String, Map, listener)",
            diagnostics.toString()
        )
        assertReturnsEarly(
            require(GMS_MEASUREMENT).methodsNamed("logEvent").single(),
            label = "AppMeasurementSdk.logEvent()", diagnostics.toString()
        )

        // Crashlytics is R8-renamed; locate its classes the same way the patch does.
        val crashlyticsClasses = classes.filter { it.referencesString(CRASHLYTICS_KEY) }
        assertTrue(
            crashlyticsClasses.isNotEmpty(),
            "no class referencing '$CRASHLYTICS_KEY' in emitted dexes\n$diagnostics"
        )
        val crashlyticsSettings = crashlyticsClasses.firstNotNullOfOrNull { cls ->
            cls.methods.firstOrNull { it.returnType == "Z" && it.parameterTypes.isEmpty() }
        } ?: error("Crashlytics settings getter not found\n$diagnostics")
        assertForcedBoolean(
            crashlyticsSettings, expected = false,
            label = "Crashlytics collection-enabled getter", diagnostics.toString()
        )
        val crashlyticsRecordException = crashlyticsClasses.firstNotNullOfOrNull { cls ->
            cls.methods.firstOrNull {
                it.returnType == "V" &&
                    it.parameterTypes.size == 1 &&
                    it.parameterTypes.first().toString() == "Ljava/lang/Throwable;"
            }
        } ?: error("Crashlytics recordException not found\n$diagnostics")
        assertReturnsEarly(
            crashlyticsRecordException,
            label = "Crashlytics recordException(Throwable)", diagnostics.toString()
        )

        // Disable Facebook SDK: both ContentProvider auto-init entry points.
        assertForcedBoolean(
            require(FACEBOOK_PROVIDER).methodsNamed("onCreate").single(),
            expected = false, label = "FacebookInitProvider.onCreate()", diagnostics.toString()
        )
        assertForcedBoolean(
            require(AUDIENCE_PROVIDER).methodsNamed("onCreate").single(),
            expected = false, label = "AudienceNetworkContentProvider.onCreate()", diagnostics.toString()
        )

        // Disable Play Integrity is intentionally absent: the Play Integrity classes are not
        // bundled in this build (the AppsFlyer SDK only references them, behind a catch), so
        // there is nothing to patch. The patch was removed as part of the 26.09.07 update.

        // Block marketing notifications: both promo sheets dismiss before rendering.
        assertDismissesEarly(
            require(PROMOTION_MODAL).methodsNamed("onViewCreated").single(),
            label = "PromotionModal.onViewCreated()", diagnostics.toString()
        )
        assertDismissesEarly(
            require(TENNIS_PROMO_SHEET).methodsNamed("onViewCreated").single(),
            label = "SofascoreAnalystTennisPromoBottomSheet.onViewCreated()", diagnostics.toString()
        )
    }
}

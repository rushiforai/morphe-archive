import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "com.piriform.ccleaner"
private const val VERSION = "26.16.1"
private const val VERSION_CODE = 800011534

private val PATCHES = setOf(
    "Enable Premium",
    "Disable ads",
    "Disable telemetry",
)

private val PREMIUM_SERVICE =
    "Lcom/avast/android/cleaner/subscription/premiumService/PremiumService;"
private val PREMIUM_IMPL =
    "Lcom/avast/android/cleaner/subscription/premiumService/PremiumServiceImpl;"
private val BASE_AD_SERVICE = "Lcom/avast/android/cleaner/advertisement/BaseAdService;"
private val FIREBASE_TRACKER = "Lcom/avast/android/tracking2/firebase/FirebaseTracker;"
private val FIREBASE_TRACKER_PROXY = "Lcom/avast/android/cleaner/tracking/FirebaseTrackerProxy;"
private val FIREBASE_MANAGER = "Lcom/avast/android/cleaner/tracking/firebase/FirebaseManager;"
private val CRASHLYTICS = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"

private val TELEMETRY_META = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_sessions_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
)

class CCleanerSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun ClassDef.voidMethods(): List<Method> = methods.filter {
        it.returnType == "V" && it.implementation != null &&
            it.name != "<init>" && it.name != "<clinit>"
    }

    @Test
    fun `all CCleaner patches apply and block the gates`() {
        val root = repoRoot()
        val apk = File(root, "apks/ccleaner/base.apk")
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = VERSION,
            patchNames = PATCHES,
            allPatches = loadAllPatches(newestPatchBundle(root)),
            versionCode = VERSION_CODE,
        )
        val byType = classes.associateBy { it.type }
        val diagnostics = "emitted classes=${classes.size}"

        fun klass(type: String): ClassDef = byType[type] ?: error("$type not found\n$diagnostics")

        // Enable Premium: the license-backed no-arg boolean returns true.
        val premiumGate = klass(PREMIUM_IMPL).methods.single { m ->
            m.returnType == "Z" && m.parameterTypes.isEmpty() && m.implementation != null &&
                m.implementation!!.instructions.any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? FieldReference)
                        ?.definingClass == "Lcom/avast/cleaner/billing/api/AclLicenseInfo;"
                }
        }
        assertForcedBoolean(premiumGate, expected = true, label = "CCleaner premium gate", diagnostics = diagnostics)

        // Disable ads: the app's areAdsAllowed() answers false.
        val adsAllowed = klass(BASE_AD_SERVICE).methods.single { m ->
            m.returnType == "Z" && m.parameterTypes.isEmpty() && m.implementation != null &&
                m.implementation!!.instructions.any { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == PREMIUM_SERVICE &&
                        ref.returnType == "Z" && ref.parameterTypes.isEmpty()
                } &&
                m.implementation!!.instructions.any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                        ".areAdsAllowed() - result: false"
                }
        }
        assertForcedBoolean(adsAllowed, expected = false, label = "CCleaner areAdsAllowed", diagnostics = diagnostics)

        // Disable ads: MobileAds.initialize and the other statics return at once.
        val mobileAds = klass("Lcom/google/android/gms/ads/MobileAds;")
        val initializes = mobileAds.methods.filter {
            it.name == "initialize" && it.returnType == "V" && it.implementation != null
        }
        assertTrue(initializes.isNotEmpty(), "no MobileAds.initialize\n$diagnostics")
        initializes.forEach { assertReturnsEarlyVoid(it, "MobileAds.initialize") }

        assertReturnsEarlyVoid(
            klass("Lcom/google/android/gms/ads/BaseAdView;").method(
                "loadAd",
                listOf("Lcom/google/android/gms/ads/AdRequest;"),
            ),
            "GMA banner load",
        )

        // Disable telemetry: both Firebase trackers and the manager do nothing, Crashlytics too.
        for (type in listOf(FIREBASE_TRACKER, FIREBASE_TRACKER_PROXY)) {
            val targets = klass(type).voidMethods()
            assertTrue(targets.isNotEmpty(), "no void methods on $type\n$diagnostics")
            targets.forEach { assertReturnsEarlyVoid(it, "$type->${it.name}") }
        }
        val manager = klass(FIREBASE_MANAGER).voidMethods()
        assertTrue(manager.size >= 4, "expected 4 FirebaseManager voids, found ${manager.size}\n$diagnostics")
        manager.forEach { assertReturnsEarlyVoid(it, "FirebaseManager.${it.name}") }

        val crashlytics = klass(CRASHLYTICS)
        crashlytics.voidMethods().forEach { assertReturnsEarlyVoid(it, "Crashlytics ${it.name}") }
        assertReturnsEarlyVoid(
            crashlytics.method("recordException", listOf("Ljava/lang/Throwable;")),
            "Crashlytics recordException",
        )

        // Telemetry: the manifest switches are set exactly once on <application>.
        val manifestFile = workDir.walkTopDown()
            .filter { it.name == "AndroidManifest.xml" && it.readText().contains("firebase_sessions_enabled") }
            .firstOrNull() ?: error("no decoded AndroidManifest.xml with the telemetry meta-data under $workDir")
        val manifest = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifestFile).documentElement
        fun Element.children(tag: String) =
            getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }
        val application = manifest.children("application").single()
        val metaData = application.children("meta-data")
            .filter { it.parentNode == application }
            .groupBy({ it.getAttribute("android:name") }, { it.getAttribute("android:value") })
        for ((name, value) in TELEMETRY_META) {
            check(metaData[name] == listOf(value)) { "meta-data $name is ${metaData[name]}, expected [$value]" }
        }
    }
}

import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.appgenix.bizcal"
private const val ADS_UTIL = "Lcom/appgenix/bizcal/util/AdsUtil;"
private const val STORE_UTIL = "Lcom/appgenix/bizcal/util/StoreUtil;"
private const val AUDIENCE_NETWORK_PROVIDER = "Lcom/facebook/ads/AudienceNetworkContentProvider;"
private const val FYBER_CRASH_PROVIDER = "Lcom/fyber/fairbid/internal/UncaughtExceptionHandlerContentProvider;"
private const val PUSH_UTIL = "Lcom/appgenix/bizcal/util/PushNotificationsUtil;"
private const val FIREBASE_ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"
private const val MEASUREMENT_SDK = "Lcom/google/android/gms/measurement/api/AppMeasurementSdk;"
private const val FIREBASE_CRASHLYTICS = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"
private const val CRASHLYTICS_COLLECTION_KEY = "firebase_crashlytics_collection_enabled"
private const val ANALYTICS_DEACTIVATED_KEY = "firebase_analytics_collection_deactivated"
private const val PRO_STATUS = "Lcom/appgenix/bizcal/data/settings/SettingsHelper\$ProStatus;"
private const val CONTEXT = "Landroid/content/Context;"
private const val ACTIVITY = "Landroid/app/Activity;"
private const val STRING = "Ljava/lang/String;"

class BusinessCalendarSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Business Calendar patches disable ads and telemetry and unlock Pro`() {
        val root = repoRoot()
        val apk = File(root, "apks/bizcal/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "2.55.8",
            patchNames = setOf("Disable ads", "Disable telemetry", "Unlock Pro"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        fun classOf(type: String): ClassDef = byType[type] ?: error("$type not found in emitted dexes")

        // --- Disable ads ---

        // 1. The user-level ad gate.
        val adsUtil = classOf(ADS_UTIL)
        assertForcedBoolean(
            adsUtil.method("showAdsForUser", listOf(CONTEXT)),
            expected = false, label = "AdsUtil.showAdsForUser(Context)",
        )

        // 2. The Remote Config ad flag behind the "ads or Pro" dialog.
        assertForcedBoolean(
            adsUtil.method("showAdsAccordingToFirebase", listOf(CONTEXT)),
            expected = false, label = "AdsUtil.showAdsAccordingToFirebase(Context)",
        )

        // 3. FairBid backstop.
        val storeUtil = classOf(STORE_UTIL)
        assertReturnsEarlyVoid(
            storeUtil.method("initializeMobileAds", listOf(ACTIVITY)),
            label = "StoreUtil.initializeMobileAds(Activity)",
        )
        assertReturnsEarlyVoid(
            storeUtil.method("preloadInterstitialAd", listOf(ACTIVITY)),
            label = "StoreUtil.preloadInterstitialAd(Activity)",
        )
        assertForcedBoolean(
            storeUtil.method("showInterstitialAd", listOf(ACTIVITY, STRING)),
            expected = false, label = "StoreUtil.showInterstitialAd(Activity, String)",
        )

        // 4. Facebook Audience Network auto-init provider.
        assertForcedBoolean(
            classOf(AUDIENCE_NETWORK_PROVIDER).method("onCreate", emptyList()),
            expected = false, label = "AudienceNetworkContentProvider.onCreate()",
        )

        // --- Disable telemetry ---

        // 1. Fyber crash-handler provider.
        assertForcedBoolean(
            classOf(FYBER_CRASH_PROVIDER).method("onCreate", emptyList()),
            expected = false, label = "UncaughtExceptionHandlerContentProvider.onCreate()",
        )

        // 2. Promo push notifications.
        val pushUtil = classOf(PUSH_UTIL)
        for (name in listOf("schedulePushNotification", "showPushNotification")) {
            assertReturnsEarlyVoid(pushUtil.method(name, listOf(CONTEXT)), label = "PushNotificationsUtil.$name(Context)")
        }

        // 3. Firebase Analytics and the measurement connector.
        val analytics = classOf(FIREBASE_ANALYTICS)
        assertReturnsEarlyVoid(
            analytics.method("logEvent", listOf(STRING, "Landroid/os/Bundle;")),
            label = "FirebaseAnalytics.logEvent(String, Bundle)",
        )
        assertReturnsEarlyVoid(analytics.method("setUserId", listOf(STRING)), label = "FirebaseAnalytics.setUserId(String)")
        assertReturnsEarlyVoid(
            analytics.method("setUserProperty", listOf(STRING, STRING)),
            label = "FirebaseAnalytics.setUserProperty(String, String)",
        )
        assertReturnsEarlyVoid(
            classOf(MEASUREMENT_SDK).method("logEvent", listOf(STRING, STRING, "Landroid/os/Bundle;")),
            label = "AppMeasurementSdk.logEvent(String, String, Bundle)",
        )

        // 4. Crashlytics: every concrete reporting method (both setCustomKey overloads) ...
        val crashlytics = classOf(FIREBASE_CRASHLYTICS)
        val reporting = crashlytics.methods.filter {
            it.name in setOf("recordException", "log", "setUserId", "setCustomKey") &&
                it.returnType == "V" && it.implementation != null
        }
        check(reporting.any { it.name == "recordException" }) { "no concrete recordException on $FIREBASE_CRASHLYTICS" }
        check(reporting.count { it.name == "setCustomKey" } >= 2) { "expected both setCustomKey overloads" }
        reporting.forEach {
            assertReturnsEarlyVoid(it, label = "FirebaseCrashlytics.${it.name}(${it.parameterTypes.joinToString()})")
        }

        // ... and the collection arbiter, found the way the patch finds it: by its pref key.
        val arbiters = classes.filter { classDef ->
            classDef.methods.any { method ->
                method.instructions().any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == CRASHLYTICS_COLLECTION_KEY
                }
            }
        }
        check(arbiters.size == 1) { "expected one class with \"$CRASHLYTICS_COLLECTION_KEY\", got ${arbiters.map { it.type }}" }
        val collectionGetters = arbiters.single().methods.filter {
            it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
        }
        check(collectionGetters.isNotEmpty()) { "${arbiters.single().type} has no concrete ()Z getter" }
        collectionGetters.forEach {
            assertForcedBoolean(it, expected = false, label = "${arbiters.single().type}.${it.name}()")
        }

        // 5. Firebase Analytics' manifest switch under <application>, set exactly once.
        val manifest = workDir.walkTopDown()
            .filter { it.name == "AndroidManifest.xml" }
            .map { it.readText() }
            .firstOrNull { it.contains("package=\"$PKG\"") && it.contains("<application") }
            ?: error("no decoded $PKG AndroidManifest.xml under $workDir")
        val application = manifest.substringAfter("<application").substringBefore("</application>")
        val analyticsSwitch = Regex("""<meta-data\s+[^>]*android:name="$ANALYTICS_DEACTIVATED_KEY"[^>]*/?>""")
            .findAll(application).map { it.value }.toList()
        check(analyticsSwitch.size == 1) { "expected one $ANALYTICS_DEACTIVATED_KEY meta-data, got $analyticsSwitch" }
        check(analyticsSwitch.single().contains("android:value=\"true\"")) {
            "$ANALYTICS_DEACTIVATED_KEY is not true: ${analyticsSwitch.single()}"
        }

        // --- Unlock Pro ---

        val proStatus = classOf(PRO_STATUS)
        for (name in listOf("getCompleteProStatus", "getForceProStatus")) {
            assertForcedBoolean(proStatus.method(name, listOf(CONTEXT)), expected = true, label = "ProStatus.$name(Context)")
        }
    }
}

import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "club.boxbox.android"

class BoxBoxSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `premium, ads and telemetry patches apply to every entry point`() {
        val root = repoRoot()
        val apk = File(root, "apks/boxbox/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "5.4.9",
            patchNames = setOf("Enable Premium", "Disable ads", "Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun klass(type: String) = classes.firstOrNull { it.type == type }
            ?: error("$type not found in emitted dexes")

        // Premium: the RevenueCat entitlement predicate.
        assertForcedBoolean(
            klass("Lcom/revenuecat/purchases/EntitlementInfo;").method("isActive"),
            expected = true,
            label = "EntitlementInfo.isActive()",
        )

        // Ads: both the load and every showAd overload, including the terminal
        // showAd(String, String, Activity) that actually displays the interstitial.
        val interstitial = klass("Lcom/applovin/mediation/ads/MaxInterstitialAd;")
        assertReturnsEarlyVoid(interstitial.method("loadAd"), label = "MaxInterstitialAd.loadAd()")
        assertReturnsEarlyVoid(
            interstitial.method(
                "showAd",
                listOf("Ljava/lang/String;", "Ljava/lang/String;", "Landroid/app/Activity;"),
            ),
            label = "MaxInterstitialAd.showAd(String, String, Activity)",
        )

        // Telemetry: the AppsFlyer implementation class is R8-renamed every release, so the
        // patch scans by package prefix; every concrete logEvent must be neutered.
        val appsFlyerLogEvent = classes
            .filter { it.type.startsWith("Lcom/appsflyer/") }
            .flatMap { cls -> cls.methods.filter { m -> m.name == "logEvent" && m.implementation != null } }
        assertTrue(appsFlyerLogEvent.isNotEmpty(), "no concrete AppsFlyer logEvent methods found")
        appsFlyerLogEvent.forEach { assertReturnsEarlyVoid(it, label = "${it.definingClass}.logEvent") }

        assertReturnsEarlyVoid(
            klass("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;")
                .method("recordException", listOf("Ljava/lang/Throwable;")),
            label = "FirebaseCrashlytics.recordException(Throwable)",
        )
    }
}

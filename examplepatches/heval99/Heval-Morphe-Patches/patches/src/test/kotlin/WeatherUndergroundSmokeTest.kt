import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.wunderground.android.weather"

class WeatherUndergroundSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Remove ads patch forces the ad-free entitlement getters`() {
        val root = repoRoot()
        val apk = File(root, "apks/wunderground/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "6.20.1",
            patchNames = setOf("Remove ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun klass(type: String) = classes.firstOrNull { it.type == type }
            ?: error("$type not found in emitted dexes")

        assertForcedBoolean(
            klass("Lcom/wunderground/android/weather/utils/AirlockValueUtil;").method("isAdFreePurchased"),
            expected = true, label = "AirlockValueUtil.isAdFreePurchased()",
        )
        assertForcedBoolean(
            klass("Lcom/wunderground/android/weather/app/inapp/PremiumHelper;").method("isAdsFreePurchased"),
            expected = true, label = "PremiumHelper.isAdsFreePurchased()",
        )
        assertForcedBoolean(
            klass("Lcom/wunderground/android/weather/app/WUApplication;").method("isAdsFreeV2User"),
            expected = true, label = "WUApplication.isAdsFreeV2User()",
        )
    }
}
